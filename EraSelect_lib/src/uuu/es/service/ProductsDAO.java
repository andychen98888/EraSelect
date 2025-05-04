package uuu.es.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import uuu.es.entity.Color;
import uuu.es.entity.Product;
import uuu.es.entity.Spec;
import uuu.es.entity.SpecialOffer;
import uuu.es.exception.ESDataInvalidException;
import uuu.es.exception.ESException;

class ProductsDAO {
	
	private static final String SELECT_ALL_PRODUCTS=
			"SELECT id, name, unit_price, stock, photo_url, "
			+ "category, description, release_date, discount FROM products";
	List<Product> selectAllProducts() throws ESException{//建立方法
		List<Product> list = new ArrayList<>();
		
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_PRODUCTS+" ORDER BY rand()");//3.準備指令
				ResultSet rs = pstmt.executeQuery();//4.執行指令
				){
			while(rs.next()) {//5.處理rs
				Product p ; //可能是Product物件或SpecialOffer物件
				int discount = rs.getInt("discount");
				if(discount>0) {
					p = new SpecialOffer();
					((SpecialOffer)p).setDiscount(discount);
				}else {
					p = new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getDouble("unit_price"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photo_url"));
				p.setCategory(rs.getString("category"));
				p.setDescription(rs.getString("description"));
				p.setReleaseDate(rs.getString("release_date"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			throw new ESException("查詢全部產品失敗",e);
		}
		return list;
	}
	
	
	//用關鍵字查詢
	private static final String SELSECT_PRODUCTS_BY_KEYWORD= SELECT_ALL_PRODUCTS + " WHERE name LIKE ?";//關鍵字WHERE前要加空白
	List<Product> selectProductsByKeyword(String keyword)throws ESException{//建立方法
		List<Product> list = new ArrayList<>();
		
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELSECT_PRODUCTS_BY_KEYWORD);//3.準備指令
				){
			//3.1傳入?的值
			pstmt.setString(1, '%'+keyword+'%');//LIKE前後要加'%'
			
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令
			){
				while(rs.next()) {//5.處理rs
					Product p ; //可能是Product物件或SpecialOffer物件
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new SpecialOffer();
						((SpecialOffer)p).setDiscount(discount);
					}else {
						p = new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setCategory(rs.getString("category"));
					p.setDescription(rs.getString("description"));
					p.setReleaseDate(rs.getString("release_date"));
					
					list.add(p);
				}
			}
		} catch (SQLException e) {
			throw new ESException("[關鍵字]查詢產品失敗",e);
		}
		
		return list;
	}
	
	
	//用分類查詢
	private static final String SELSECT_PRODUCTS_BY_CATEGORY= SELECT_ALL_PRODUCTS +" WHERE category= ?";
	List<Product> selectProductsByCategory(String category)throws ESException{
		List<Product> list = new ArrayList<>();
		
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELSECT_PRODUCTS_BY_CATEGORY);//3.準備指令
				){
			//3.1傳入?的值
			pstmt.setString(1, category);
			
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令
			){
				while(rs.next()) {//5.處理rs
					Product p ; //可能是Product物件或SpecialOffer物件
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new SpecialOffer();
						((SpecialOffer)p).setDiscount(discount);
					}else {
						p = new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setCategory(rs.getString("category"));
					p.setDescription(rs.getString("description"));
					p.setReleaseDate(rs.getString("release_date"));
					
					list.add(p);
				}
			}
		} catch (SQLException e) {
			throw new ESException("[分類查詢產品]失敗",e);
		}
		
		return list;
	}
	
	
	//用discount查詢產品
	private static final String SELECT_PRODUCTS_BY_DISCOUNT= SELECT_ALL_PRODUCTS + " WHERE discount > 0";
	List<Product> selectProductsByDiscount()throws ESException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_DISCOUNT);//3.準備指令
				ResultSet rs = pstmt.executeQuery();//4.執行指令
				){
			while(rs.next()) {//5.處理rs
				Product p ; //可能是Product物件或SpecialOffer物件
				int discount = rs.getInt("discount");
				if(discount>0) {
					p = new SpecialOffer();
					((SpecialOffer)p).setDiscount(discount);
				}else {
					p = new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getDouble("unit_price"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photo_url"));
				p.setCategory(rs.getString("category"));
				p.setDescription(rs.getString("description"));
				p.setReleaseDate(rs.getString("release_date"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			throw new ESException("[查詢折扣產品]失敗",e);
		}
		return list;
	}
	
	
	//最新上架查詢
	private static final int LIMIT_NUM = 10; //使用常數比較好維護
	private static final String SELECT_LATEST_PRODUCTS = SELECT_ALL_PRODUCTS + " ORDER BY release_date DESC"+ " LIMIT " + LIMIT_NUM;
	List<Product> selectLatestProducts() throws ESException{
		List<Product> list = new ArrayList<>();
		
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_LATEST_PRODUCTS);//3.準備指令
				ResultSet rs = pstmt.executeQuery();//4.執行指令
				){
			while(rs.next()) {//5.處理rs
				Product p ; //可能是Product物件或SpecialOffer物件
				int discount = rs.getInt("discount");
				if(discount>0) {
					p = new SpecialOffer();
					((SpecialOffer)p).setDiscount(discount);
				}else {
					p = new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getDouble("unit_price"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photo_url"));
				p.setCategory(rs.getString("category"));
				p.setDescription(rs.getString("description"));
				p.setReleaseDate(rs.getString("release_date"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			throw new ESException("[查詢最新上架產品]失敗",e);
		}
		return list;
	}
	
	//首頁最新上架查詢
		private static final int LIMIT_NUM2 = 5; //使用常數比較好維護
		private static final String SELECT_LATEST_PRODUCTS2 = SELECT_ALL_PRODUCTS + " ORDER BY release_date DESC"+ " LIMIT " + LIMIT_NUM2;
		List<Product> selectLatestProducts2() throws ESException{
			List<Product> list = new ArrayList<>();
			
			try (
					Connection connection = MySQLConnection.getConnection();//1,2取得連線
					PreparedStatement pstmt = connection.prepareStatement(SELECT_LATEST_PRODUCTS2);//3.準備指令
					ResultSet rs = pstmt.executeQuery();//4.執行指令
					){
				while(rs.next()) {//5.處理rs
					Product p ; //可能是Product物件或SpecialOffer物件
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new SpecialOffer();
						((SpecialOffer)p).setDiscount(discount);
					}else {
						p = new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setCategory(rs.getString("category"));
					p.setDescription(rs.getString("description"));
					p.setReleaseDate(rs.getString("release_date"));
					
					list.add(p);
				}
				
			} catch (SQLException e) {
				throw new ESException("[查詢最新上架產品]失敗",e);
			}
			return list;
		}
	
	//查詢價格由小到大
	private static final String SELECT_PRODUCTS_BY_ASC= SELECT_ALL_PRODUCTS + " ORDER BY unit_price ASC";
	public List<Product> selectProductsByASC() throws ESException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_ASC);//3.準備指令
				ResultSet rs = pstmt.executeQuery();//4.執行指令
				){
			while(rs.next()) {//5.處理rs
				Product p ; //可能是Product物件或SpecialOffer物件
				int discount = rs.getInt("discount");
				if(discount>0) {
					p = new SpecialOffer();
					((SpecialOffer)p).setDiscount(discount);
				}else {
					p = new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getDouble("unit_price"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photo_url"));
				p.setCategory(rs.getString("category"));
				p.setDescription(rs.getString("description"));
				p.setReleaseDate(rs.getString("release_date"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			throw new ESException("[查詢產品價格由小到大]失敗",e);
		}
		return list;
	}
	//查詢價格由大到小
	private static final String SELECT_PRODUCTS_BY_DESC= SELECT_ALL_PRODUCTS + " ORDER BY unit_price DESC";
	public List<Product> selectProductsByDESC() throws ESException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_DESC);//3.準備指令
				ResultSet rs = pstmt.executeQuery();//4.執行指令
				){
			while(rs.next()) {//5.處理rs
				Product p ; //可能是Product物件或SpecialOffer物件
				int discount = rs.getInt("discount");
				if(discount>0) {
					p = new SpecialOffer();
					((SpecialOffer)p).setDiscount(discount);
				}else {
					p = new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getDouble("unit_price"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photo_url"));
				p.setCategory(rs.getString("category"));
				p.setDescription(rs.getString("description"));
				p.setReleaseDate(rs.getString("release_date"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			throw new ESException("[查詢產品價格由大到小]失敗",e);
		}
		return list;
	}

	
	//查詢區間價格
	private static final String SELECT_PRODUCTS_BY_PRICE= SELECT_ALL_PRODUCTS + " WHERE unit_price between ? and ?";
	public List<Product> selectProductsByPrice(String minPrice, String maxPrice) throws ESException{
		List<Product> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_PRICE);//3.準備指令
				){
			//3.1傳入?的值
			pstmt.setString(1, minPrice);
			pstmt.setString(2, maxPrice);
			
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令
			){
				while(rs.next()) {//5.處理rs
					Product p ; //可能是Product物件或SpecialOffer物件
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new SpecialOffer();
						((SpecialOffer)p).setDiscount(discount);
					}else {
						p = new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setCategory(rs.getString("category"));
					p.setDescription(rs.getString("description"));
					p.setReleaseDate(rs.getString("release_date"));
					
					list.add(p);
				}
			}
		} catch (SQLException e) {
			throw new ESException("[價格區間查詢產品]失敗",e);
		}
		
		return list;
	}
		
	
	//用id查詢產品
	private static final String SELECT_PRODUCT_BY_ID = 
			"SELECT id, name, products.unit_price, IFNULL(SUM(product_color_specs.stock),products.stock) AS stock, "
			+ " products.photo_url, category, description, products.release_date, discount, "
			+ " product_colors.product_id, "
			+ " product_colors.color_name, icon_url, "
			+ " IFNULL(product_colors.release_date,products.release_date) AS color_release_date, "
			+ " product_colors.photo_url AS color_photo, "
			+ " IFNULL(SUM(product_color_specs.stock),product_colors.stock) AS color_stock, "
			+ " product_colors.ordinal, "
			+ " COUNT(spec_name) AS spec_count "
			+ " FROM products "
			+ " LEFT JOIN product_colors ON products.id =product_colors.product_id "
			+ " LEFT JOIN product_color_specs ON products.id =product_color_specs.product_id "
			+ "							AND (product_colors.color_name=product_color_specs.color_name "
			+ "							OR	 product_colors.color_name IS NULL) "
			+ " WHERE products.id = ?"
			+ " GROUP BY products.id, product_colors.color_name";
	
//			"SELECT id, name, unit_price, products.stock,  products.photo_url, products.release_date, description, discount ,"
//			+ "	product_id, color_name, category,"
//			+ " IFNULL(product_colors.release_date,products.release_date) AS color_release_date,"
//			+ " product_colors.photo_url AS color_photo,"
//			+ " product_colors.stock AS color_stock,"
//			+ " icon_url"
//			+ " FROM products"
//			+ "	LEFT JOIN product_colors ON products.id=product_colors.product_id"
//			+ " WHERE id = ? ORDER BY product_colors.ordinal";
	
//			"SELECT id, name, unit_price, stock, photo_url,category, description, release_date, discount"
//			+ " FROM products"
//			+ " WHERE id = ?";
	Product selectProductById(String id) throws ESException{
		Product p = null;

			try (
					Connection connection = MySQLConnection.getConnection();//1,2取得連線
					PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_ID);//3.準備指令
					){	
				//3.1傳入?的值
				pstmt.setString(1, id);
				try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令
				){
					//5.處理rs
					while(rs.next()) {
						if(p==null) { //讀取color會重複p資料會蓋掉前一筆資料
							//讀取產品資料
							int discount = rs.getInt("discount");
							if(discount>0) {
								p = new SpecialOffer();
								((SpecialOffer)p).setDiscount(discount);
							}else {
								p = new Product();
							}
							p.setId(rs.getInt("id"));
							p.setName(rs.getString("name"));
							p.setUnitPrice(rs.getDouble("unit_price"));
							p.setStock(rs.getInt("stock"));
							p.setPhotoUrl(rs.getString("photo_url"));
							p.setCategory(rs.getString("category"));
							p.setDescription(rs.getString("description"));
							p.setReleaseDate(rs.getString("release_date"));
							p.setSpecCount(rs.getInt("spec_count"));
						}
						//讀取color資料
						String colorName = rs.getString("color_name"); //color_name為PKEY
						if(colorName!=null) {
							Color color = new Color();
							color.setColorName(colorName);
							color.setStock(rs.getInt("color_stock"));
							color.setPhotoUrl(rs.getString("color_photo"));
							color.setIconUrl(rs.getString("icon_url"));
							color.setReleaseDate(LocalDate.parse(rs.getString("color_release_date")));
							
							p.add(color);
						}
//						System.out.println(p);//for test
					}
					
				}
			} catch (SQLException e) {
				throw new ESException("[用id查詢產品]失敗",e);
			}
		
		return p ;
	}

	
	//查詢產品顏色與規格的庫存
	private static final String SELECT_PRODUCT_SPECS_BY_ID_AND_COLORNAME = 
			"SELECT product_id, color_name, spec_name,"
			+ "	product_color_specs.stock, "
			+ " product_color_specs.unit_price,"
			+ "	product_color_specs.unit_price * (100-products.discount) /100 AS price,"
			+ " ordinal"
			+ "	FROM product_color_specs"
			+ " JOIN products ON product_color_specs.product_id = products.id"
			+ " WHERE product_id= ? AND color_name = ? "
			+ "	ORDER BY ordinal;";
	List<Spec> selectProductSpecsByIdAndColorName(String productId, String colorName) throws ESException{
		List<Spec> list = new ArrayList<>();
		
		
		try (
			Connection connection = MySQLConnection.getConnection();//1,2取得連線
			PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_SPECS_BY_ID_AND_COLORNAME);//3.準備指令
				){
				//3.1傳入?的值
				pstmt.setString(1, productId);
				pstmt.setString(2, colorName);
				
				try(
						ResultSet rs = pstmt.executeQuery();//4.執行指令
						){
					//5.處理rs
					while(rs.next()) {
						Spec spec = new Spec();
						spec.setProductId(rs.getInt("product_id"));
						spec.setColorName(rs.getString("color_name"));
						spec.setSpecName(rs.getString("spec_name"));
						spec.setStock(rs.getInt("stock"));
						spec.setUnitPrice(rs.getDouble("unit_price"));
						spec.setPrice(rs.getDouble("price"));
						spec.setOrdinal(rs.getInt("ordinal"));
			
						list.add(spec);
					}
					
				}
		} catch (SQLException e) {
			throw new ESException("查詢[指定產品-顏色]的specList失敗",e);
		}		
		return list;
	}
	
	//用JDBC完成即時庫存查詢的資料庫查詢
		private static final String SELECT_STOCK_BY_PRODUCTID_COLORNAME_SPECNAME="SELECT id,name, "
	           + " IFNULL(product_color_specs.color_name, IFNULL(product_colors.color_name,'')) as color_name, "
	           + " IFNULL(product_color_specs.spec_name,'') as spec_name, "
	           + " IFNULL(product_color_specs.stock, IFNULL(product_colors.stock, products.stock)) as stock "
	           + " FROM products  "
	           + "    LEFT JOIN product_colors ON products.id=product_colors.product_id          "
	           + "        LEFT JOIN product_color_specs ON products.id=product_color_specs.product_id  "
	           + "        AND(product_colors.color_name = product_color_specs.color_name OR product_colors.color_name IS NULL) "
	           + "        WHERE products.id = ?"
	           + "        HAVING color_name=? AND spec_name=?";   

		   int selectStockByProductIdColorNameSpecName(int productId, String colorName, String specName) throws ESException{
		       Integer stock=null;
		       try (           
		              Connection connection = MySQLConnection.getConnection(); //1,2. 取得連線
		              PreparedStatement pstmt = connection.prepareStatement(SELECT_STOCK_BY_PRODUCTID_COLORNAME_SPECNAME); //3.準備指令
		           ){
		           //3.1 傳入?的值
		           pstmt.setInt(1, productId);
		           pstmt.setString(2, colorName==null?"":colorName);
		           pstmt.setString(3, specName==null?"":specName);

		           try(ResultSet rs = pstmt.executeQuery()){
		              while (rs.next()) {
		                  stock = rs.getInt("stock");
		              }
		           }
		           if(stock==null) {
		        	   String errMsg = String.format("查無指定產品[%s-%s-%s]的即時庫存!", productId, colorName, specName);
		        	   throw new ESDataInvalidException(errMsg);
		           }
		       } catch (SQLException e) {
		    	   String errMsg = String.format("查詢指定產品[%s-%s-%s]即時庫存失敗!", productId, colorName, specName);
		           throw new ESException(errMsg, e);
		       }
		       return stock;
		    }
	
	
}
