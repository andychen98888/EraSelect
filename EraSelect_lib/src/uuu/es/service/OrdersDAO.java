package uuu.es.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import uuu.es.entity.Customer;
import uuu.es.entity.Order;
import uuu.es.entity.OrderItem;
import uuu.es.entity.OrderStatusLog;
import uuu.es.entity.PaymentType;
import uuu.es.entity.Product;
import uuu.es.entity.ShippingType;
import uuu.es.exception.ESException;
import uuu.es.exception.StockShortageException;

class OrdersDAO {
	private static final String UPDATE_PRODUCTS_STOCK=
			"UPDATE products SET stock= stock-? "
			+ "WHERE stock>=? AND id=?";
	private static final String UPDATE_PRODUCT_COLORS_STOCK=
			" UPDATE product_colors SET stock=stock-? "
			+ "WHERE stock>=? AND product_id =? AND color_name=?";
	private static final String UPDATE_PRODUCT_SPECS_STOCK=
			" UPDATE product_color_specs SET stock=stock-? "
			+ "WHERE stock>=? AND product_id =? AND color_name=? AND spec_name=?";
	
	private static final String INSERT_ORDERS = 
			"INSERT INTO orders "
			+ "	(id, customer_id, created_date, created_time,"
			+ "	shipping_type, shipping_fee, payment_type, payment_fee,"
			+ "	recipient_name, recipient_email, recipient_phone, shipping_address)"
			+ "	VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
	
	private static final String INSERT_ORDER_ITEMS = 
			"INSERT INTO order_items"
			+ "	(order_id, product_id, color_name, spec_name, price, quantity)"
			+ "	VALUES(?,?,?,?,?,?)";
	
	void insert(Order order) throws ESException {
		
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				
				PreparedStatement pstmt01 = connection.prepareStatement(UPDATE_PRODUCTS_STOCK); //3.準備指令01
				PreparedStatement pstmt02 = connection.prepareStatement(UPDATE_PRODUCT_COLORS_STOCK);//3.準備指令02
				PreparedStatement pstmt03 = connection.prepareStatement(UPDATE_PRODUCT_SPECS_STOCK);//3.準備指令03
				
				PreparedStatement pstmt1 = connection.prepareStatement(INSERT_ORDERS, Statement.RETURN_GENERATED_KEYS);//3.準備指令pstmt1 //傳回自動給號
				PreparedStatement pstmt2 = connection.prepareStatement(INSERT_ORDER_ITEMS);//3.準備指令pstmt2
			){
			
			connection.setAutoCommit(false); //交易前要 關閉[交易控制自動確認]類似connection.beginTransaction 不要自動控制(交易)
			try {
			//修改庫存
				for(OrderItem item:order.getOrderItemsSet()) {
					PreparedStatement pstmt; 
					if(item.getSpecName()!=null && item.getSpecName().length()>0) { //根據明細準備指令
						pstmt = pstmt03;
						pstmt.setString(4, item.getColorName());
						pstmt.setString(5, item.getSpecName());
					}else if(item.getColorName()!=null && item.getColorName().length()>0) {
						pstmt = pstmt02;
						pstmt.setString(4, item.getColorName());
					}else {
						pstmt = pstmt01;
					}
					
					//3.1 傳入前3個?的值
					pstmt.setInt(1, item.getQuantity()); //用購買數量來修改庫存
					pstmt.setInt(2, item.getQuantity()); //用購買數量來檢查庫存是否足夠
					pstmt.setInt(3, item.getProductId());
					
					//4.執行指令
					int rows = pstmt.executeUpdate();
					if(rows==0) {
						throw new StockShortageException(item);
					}
				}
				
			//新增訂單
				//3.1 傳入pstmt1 ?的值
				pstmt1.setInt(1, order.getId());
				pstmt1.setString(2, order.getMember().getId());
				pstmt1.setString(3, order.getCreatedDate().toString());
				pstmt1.setString(4, order.getCreatedTime().toString());
				
				pstmt1.setString(5, order.getShippingType().name());
				pstmt1.setDouble(6, order.getShippingFee());
				
				pstmt1.setString(7, order.getPaymentType().name());
				pstmt1.setDouble(8, order.getPaymentFee());
				
				pstmt1.setString(9, order.getRecipientName());
				pstmt1.setString(10, order.getRecipientEmail());
				pstmt1.setString(11, order.getRecipientPhone());
				pstmt1.setString(12, order.getShippingAddress());
				
				//4.執行指令pstmt1
				pstmt1.executeUpdate();
			
				//5.處理rs(取得自動給號(AI)的Key)
				try(
					ResultSet rs = pstmt1.getGeneratedKeys();
				){
					while(rs.next()) {
						order.setId(rs.getInt(1));
					}
				}
				
			//新增訂單明細
				for(OrderItem item:order.getOrderItemsSet()) {
					
					item.setOrderId(order.getId());
					//3.1 傳入pstmt2 ?的值
					pstmt2.setInt(1, item.getOrderId()); //pstmt2.setInt(1, order.getId());
					pstmt2.setInt(2, item.getProductId());
					pstmt2.setString(3, item.getColorName());
					pstmt2.setString(4, item.getSpecName());
					
					pstmt2.setDouble(5, item.getPrice());
					pstmt2.setDouble(6, item.getQuantity());
	
					//4.執行指令pstmt2
					pstmt2.executeUpdate();
				}
				
				connection.commit(); //成功 //catch之前要commit
			
			}catch(Exception e) { 
				connection.rollback(); //失敗(預設值) //catch之後rollback
				throw e; //重要** 將e拋回原來的錯誤處理機制 這裡要把錯誤跟隨rollback拋出
			}finally{
				connection.setAutoCommit(true); //若有connection pool機制 需還原為預設值
			}
			
		} catch (SQLException e) {
			throw new ESException("建立訂單失敗",e);
		} 
		
		
	}
	
	private static final String SELECT_ORDERS_HISTORY = 
			"SELECT id, customer_id, created_date, created_time, status,  "
			+ "	shipping_fee, shipping_type, payment_type, payment_fee, "
//			+ "  order_id, "
			+ "  SUM(price*quantity) AS total_amount "
			+ "	FROM orders  "
			+ "  INNER JOIN order_items ON orders.id = order_items.order_id "
			+ "	WHERE customer_id= ? "
			+ "  AND created_date BETWEEN date_add(curdate(),INTERVAL ? MONTH) AND curdate()"
			+ "  GROUP BY orders.id "
			+ "  ORDER BY created_date DESC, created_time DESC";
	List<Order> selectOrdersHistory(String customerId, int range) throws ESException{
		List<Order> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection(); //1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERS_HISTORY); //3.準備指令
				){
				//3.1準備?的值
				pstmt.setString(1, customerId);
				pstmt.setInt(2, -range);
				
				try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令	
						){
					//5.處理rs
					while(rs.next()) {
						Order order = new Order();
						order.setId(rs.getInt("id"));
						
						Customer member = new Customer();
						member.setId(rs.getString("customer_id"));
						order.setMember(member);
					
						order.setCreatedDate(LocalDate.parse(rs.getString("created_date")));
						order.setCreatedTime(LocalTime.parse(rs.getString("created_time")));
						order.setStatus(rs.getInt("status"));
						order.setShippingType(ShippingType.valueOf(rs.getString("shipping_type")));
						order.setShippingFee(rs.getDouble("shipping_fee"));
						order.setPaymentType(PaymentType.valueOf(rs.getString("payment_type")));
						order.setPaymentFee(rs.getDouble("payment_fee"));
						order.setTotalAmount(rs.getDouble("total_amount"));
						
						list.add(order);
					}
					
				}

		} catch (SQLException e) {
			throw new ESException("查詢歷史訂單失敗",e);
		}
		
		return list;
	}
	
	
	private static final String SELECT_ORDER_BY_ID=
			"SELECT orders.id, customer_id, created_date, created_time, status,  "
			+ "	shipping_type, shipping_fee, shipping_note, payment_type, payment_fee, payment_note,  "
			+ "    recipient_name, recipient_email, recipient_phone, shipping_address, "
			+ "    order_id, order_items.product_id, order_items.color_name, spec_name, price, quantity, "
			+ "    products.name,IFNULL(product_colors.photo_url,products.photo_url) AS photo_url "
			+ "	FROM orders "
			+ "	INNER JOIN order_items ON orders.id = order_items.order_id "
			+ "    INNER JOIN products ON order_items.product_id = products.id "
			+ "    LEFT JOIN product_colors ON order_items.product_id = product_colors.product_id "
			+ "    AND order_items.color_name = product_colors.color_name "
			+ "	WHERE customer_id =? AND orders.id=?";
	Order selectOrderById(String customerId, String orderId) throws ESException{
		Order order = null;
		
		try (
				Connection connection = MySQLConnection.getConnection(); //1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_BY_ID);//3.準備指令
				){
				//3.1準備?的值
				pstmt.setString(1, customerId);
				pstmt.setString(2, orderId);
				try(
						ResultSet rs = pstmt.executeQuery();//4.執行指令	
							){
					//5.處理rs
					while(rs.next()) {
						if(order==null) {
							order = new Order();
							order.setId(rs.getInt("id"));
							
							Customer member = new Customer();
							member.setId(rs.getString("customer_id"));
							order.setMember(member);
							
							order.setCreatedDate(LocalDate.parse(rs.getString("created_date")));
							order.setCreatedTime(LocalTime.parse(rs.getString("created_time")));
							order.setStatus(rs.getInt("status"));
							
							order.setShippingType(ShippingType.valueOf(rs.getString("shipping_type")));
							order.setShippingFee(rs.getDouble("shipping_fee"));
							order.setShippingNote(rs.getString("shipping_note"));
							
							order.setPaymentType(PaymentType.valueOf(rs.getString("payment_type")));
							order.setPaymentFee(rs.getDouble("payment_fee"));
							order.setPaymentNote(rs.getString("payment_note"));
							
							order.setRecipientName(rs.getString("recipient_name"));
							order.setRecipientEmail(rs.getString("recipient_email"));
							order.setRecipientPhone(rs.getString("recipient_phone"));
							order.setShippingAddress(rs.getString("shipping_address"));
						
						}
						//讀取明細
						OrderItem item = new OrderItem();
						item.setOrderId(order.getId());

						Product p = new Product();
						p.setId(rs.getInt("product_id"));
						p.setName(rs.getString("name"));
						p.setPhotoUrl(rs.getString("photo_url"));
						item.setProduct(p);

						item.setColorName(rs.getString("color_name"));
						item.setSpecName(rs.getString("spec_name"));
						item.setPrice(rs.getDouble("price"));
						item.setQuantity(rs.getInt("quantity"));
						
						order.add(item);
					}
					
				}
		} catch (SQLException e) {
			throw new ESException("查詢指定訂單失敗",e);
		} 	
		return order;
	}
	
	
	private static final String UPDATE_STATUS_TO_TRANSFERED = "UPDATE orders SET status=1" // 狀態設定為已轉帳
			+ ", payment_note=? WHERE status=0 AND payment_type='" + PaymentType.ATM.name()
			+ "' AND customer_id=? AND id=? ";

	void updateStatusToTransfered(String customerId, int orderId, String paymentNote) throws ESException {
		try (Connection connection = MySQLConnection.getConnection(); // 2. 建立連線
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_STATUS_TO_TRANSFERED) // 3. 準備指令

		) {

			// 3.1 傳入?的值
			pstmt.setString(1, paymentNote);
			pstmt.setString(2, customerId);
			pstmt.setInt(3, orderId);

			// 4. 執行指令
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			throw new ESException("[通知轉帳]失敗!", ex);
		}
	}

	
	private static final String SELECT_ORDER_STATUS_LOG = "SELECT order_id, update_time, old_status, new_status "
			+ " FROM es.order_logs WHERE order_id=?";
	List<OrderStatusLog> selectOrderStatusLog(String orderId) throws ESException {
		List<OrderStatusLog> list = new ArrayList<>();
		try (Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_STATUS_LOG);
		) {
			// 3.1 傳入?的值
			pstmt.setString(1, orderId);

			// 4. 執行指令
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					OrderStatusLog log = new OrderStatusLog(); // 記得要import OrderStatusLog
					log.setId(rs.getInt("order_id"));
					log.setOldStatus(rs.getInt("old_status"));
					log.setStatus(rs.getInt("new_status"));
					log.setLogTime(rs.getString("update_time"));
					list.add(log);
				}
			}

			return list;
		} catch (SQLException ex) {
			throw new ESException("查詢訂單狀態Log失敗", ex);
		}
	}
	
	
	private static final String UPDATE_STATUS_TO_PAID = "UPDATE orders"
	          + " SET status=2"   //狀態設定為已付款
	            + ", payment_note=? WHERE customer_id=? AND id=?"
	            + " AND status=0" + " AND payment_type='" + PaymentType.CARD.name() + "'";
	   /**
	    * 紀錄信用卡付款相關資料
	    * @param customerId: 訂購人
	    * @param orderId: 訂單編號
	    * @param paymentNote: 紀錄信用卡付款相關資料(信用卡號，有效年月、授權碼等)
	    * @throws VGBException
	    */
	    void updateOrderStatusToPAID(String customerId, int orderId, String paymentNote) throws ESException {
	        try (Connection connection = MySQLConnection.getConnection(); //2. 建立連線
	             PreparedStatement pstmt = connection.prepareStatement(UPDATE_STATUS_TO_PAID) //3. 準備指令
	        ) { 

	            //3.1 傳入?的值
	            pstmt.setString(1, paymentNote);
	            pstmt.setString(2, customerId);
	            pstmt.setInt(3, orderId);

	            //4. 執行指令
	            pstmt.executeUpdate();
	        } catch (SQLException ex) {
	            System.out.println("修改信用卡付款入帳狀態失敗-" + ex);
	            throw new ESException("修改信用卡付款入帳狀態失敗!", ex);
	        }
	    }

}
