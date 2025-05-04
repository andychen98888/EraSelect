package uuu.pt.service;

import java.sql.*;

import uuu.pt.entity.Customer;
import uuu.pt.entity.VIP;
import uuu.pt.exception.ESDataInvalidException;
import uuu.pt.exception.ESException;

class CustomerDAO{
	
	private static final String SELECT_CUSTOMER = 
			"SELECT id, email, phone, password, name, birthday, gender, \n"
			+ "address, subscribed ,discount FROM customers\n" 
			+ "	 WHERE email = ? OR id = ? OR phone = ?";
	
	Customer selectByEmail(String email) throws ESException {
		Customer c = null;
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMER);
				) {
			
			pstmt.setString(1, email);
			pstmt.setString(2, email);
			pstmt.setString(3, email);
			
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				
				while(rs.next()) {
					int discount = rs.getInt("discount");
					if(discount>0) {
						c = new VIP();
						((VIP)c).setDiscount(discount);
						
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
					
					System.out.println(c); //for test 
				}
				
			}
			
		} catch (SQLException e) {
			throw new ESException("用email查詢客戶失敗", e);
		}
		return c;	
	}
	
	private static final String INSERT_CUSTOMER = "INSERT INTO customers "
			+ "(id, email, password, phone, name, birthday, gender, "
			+ "address, subscribed) "
			+ "VALUES(?,?,?,?,?,?,?  ,?,?)";
	public void insert(Customer c) throws ESException {
		
		try (
			Connection connection = MySQLConnection.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER);
				){
			
			pstmt.setString(1, c.getId());
			pstmt.setString(2, c.getEmail());
			pstmt.setString(3, c.getPassword());
			pstmt.setString(4, c.getPhone());
			pstmt.setString(5, c.getName());
			pstmt.setString(6, String.valueOf(c.getBirthday()));
			pstmt.setString(7, String.valueOf(c.getGender()));
			pstmt.setString(8, c.getAddress());
			pstmt.setBoolean(9, c.isSubscribed());
			
			pstmt.executeUpdate();
			
			
		} catch(SQLIntegrityConstraintViolationException e){ 
			String column = "";
			if(e.getMessage().indexOf("id_UNIQUE")>=0) {
				column = "身分證號";	
			}else if(e.getMessage().indexOf("phone_UNIQUE")>=0) {
				column = "手機號碼";
			}else if(e.getMessage().indexOf("PRIMARY")>=0) {
				column = "email";
			}else {
				throw new ESException("註冊會員失敗"+e.getErrorCode());
			}
			
			String msg = String.format("註冊會員失敗%s已經重複註冊", column);
			throw new ESDataInvalidException(msg,e);
			
		
		} catch (SQLException e) {
			throw new ESException("註冊會員失敗:"+e.getErrorCode(),e);
		}
		
	}
	
}