package uuu.es.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import uuu.es.entity.Customer;
import uuu.es.entity.VIP;
import uuu.es.exception.ESDataInvalidException;
import uuu.es.exception.ESException;

class CustomerDAO { //default 只有同個package看的到

	private static final String SELECT_CUSTOMER = //SQL指令
			"SELECT id, email, phone, password, name, birthday, gender, \n"
			+ "address, subscribed ,discount FROM customers\n" 
			+ "	 WHERE email = ? OR id = ? OR phone = ?"; //用OR三種皆可登入

	// 不加public為default
	Customer selectById(String id) throws ESException { // selectById(String id) selectByEmail(String email)
		Customer c = null;
		try (
				Connection connection = MySQLConnection.getConnection(); // 1.2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMER);// 3.準備指令
		) {
//		System.out.println(connection != null ? connection.getCatalog() : "連線失敗");// getCatalog()取得資料庫名稱
			pstmt.setString(1, id); // 3.1傳入?的值
			pstmt.setString(2, id);
			pstmt.setString(3, id);
			
			try (
					ResultSet rs = pstmt.executeQuery();// 4.執行指令
			) {
				// 5.處理rs
				while (rs.next()) {
//					VIP is Customer
					int discount = rs.getInt("discount");//要先讀出來才可判斷是vip還是customer
					if(discount>0) {
						VIP vip = new VIP();
						vip.setDiscount(discount);
						c = vip; //多形 上層型別宣告的變數可參考到下層型別建立的物件
						
//						c = new VIP();//方法2
//						((VIP)c).setDiscount(discount);//轉型 
					}else {
						c = new Customer();
					}
					
					String theId = rs.getString("id");
					c.setId(theId); 
					c.setEmail(rs.getString("email"));
					c.setPhone(rs.getString("phone"));
					c.setPassword(rs.getString("password"));
					c.setName(rs.getString("name"));
					c.setBirthday(rs.getString("birthday"));
					c.setGender(rs.getString("gender").charAt(0));
					c.setAddress(rs.getString("address"));
					c.setSubscribed(rs.getBoolean("subscribed"));
					
//					System.out.println(c); //for test 
				}
			} //finally

		} catch (SQLException e) {
//			Logger.getLogger("CustomersDAO").log(Level.SEVERE, "用id查詢客戶失敗", e); //for admin
			throw new ESException("用id查詢客戶失敗", e);
		}
		return c;
	}

	
//	新增欄位 
	private static final String INSERT_CUSTOMER = "INSERT INTO customers "
			+ "(id, email, password, phone, name, birthday, gender, "
			+ "address, subscribed) "
			+ "VALUES(?,?,?,?,?,?,?  ,?,?)";
	public void insert(Customer c) throws ESException{
		
		try (
				Connection connection = MySQLConnection.getConnection(); //1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER); //3.準備指令
				){
			//3.1 傳入?的值
			pstmt.setString(1, c.getId());
			pstmt.setString(2, c.getEmail());
			pstmt.setString(3, c.getPassword());
			pstmt.setString(4, c.getPhone());
			pstmt.setString(5, c.getName());
			pstmt.setString(6, String.valueOf(c.getBirthday()));
			pstmt.setString(7, String.valueOf(c.getGender()));
			pstmt.setString(8, c.getAddress());
			pstmt.setBoolean(9, c.isSubscribed());
			
			pstmt.executeUpdate();//4.執行指令
			
		
		}catch(SQLIntegrityConstraintViolationException e) { //SQLException的子類別 主鍵值重複
			String column = "";
			if(e.getMessage().indexOf("email_UNIQUE")>=0) {
				column = "email";
			}else if(e.getMessage().indexOf("phone_UNIQUE")>=0) {
				column = "手機號碼";
			}else if(e.getMessage().indexOf("PRIMARY")>=0) { //Pkey會先檢查
				column ="身分證號";
			}else {
				throw new ESException("註冊會員失敗:" + e.getErrorCode(),e);
			}
			
			String msg = String.format("註冊會員失敗%s已經重複註冊",column);
			throw new ESDataInvalidException(msg,e);
			
		}catch (SQLException e) {
			throw new ESException("註冊會員失敗:" + e.getErrorCode(),e);
		}
	}
	
	
	
//	修改會員 
	private static final String UPDATE_CUSTOMER = "UPDATE customers "
			+ " SET email=?, password=?, phone=?, name=?, birthday=?, gender=?, "
			+ " address=?, subscribed=? "
			+ " WHERE id= ?";
	void update(Customer c) throws ESException{
		
		try (
				Connection connection = MySQLConnection.getConnection(); //1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_CUSTOMER); //3.準備指令
				){
			//3.1 傳入?的值
			pstmt.setString(9, c.getId());
			pstmt.setString(1, c.getEmail());
			pstmt.setString(2, c.getPassword());
			pstmt.setString(3, c.getPhone());
			pstmt.setString(4, c.getName());
			pstmt.setString(5, String.valueOf(c.getBirthday()));
			pstmt.setString(6, String.valueOf(c.getGender()));
			pstmt.setString(7, c.getAddress());
			pstmt.setBoolean(8, c.isSubscribed());
			
			pstmt.executeUpdate();//4.執行指令
			
		
		}catch(SQLIntegrityConstraintViolationException e) { //SQLException的子類別 主鍵值重複
			String column = "";
			if(e.getMessage().indexOf("email_UNIQUE")>=0) {
				column = "email";
			}else if(e.getMessage().indexOf("phone_UNIQUE")>=0) {
				column = "手機號碼";
			}else if(e.getMessage().indexOf("PRIMARY")>=0) { //Pkey會先檢查
				column ="身分證號";
			}else {
				throw new ESException("註冊會員失敗:" + e.getErrorCode(),e);
			}
			
			String msg = String.format("註冊會員失敗%s已經重複註冊",column);
			throw new ESDataInvalidException(msg,e);
			
		}catch (SQLException e) {
			throw new ESException("註冊會員失敗:" + e.getErrorCode(),e);
		}
	}
	
	
//	void delete(String id) throws ESException{
//
//	}
	
	
}



