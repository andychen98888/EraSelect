package uuu.pt.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import uuu.pt.entity.Customer;

public class TestCustomerLogin {
	
	private static final String Driver = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/es";
	private static final String USER_ID = "root";
	private static final String DB_PWD = "1234";
	
	static {
		//TODO 建立指派
	}
	
	private static final String SELECT_CUSTOMER="SELECT id, email, phone, password, name, birthday, gender, \r\n"
			+ "	   address, subscribed FROM customers\r\n"
			+ "       WHERE id = '%s' AND password = '%s'";
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("請輸入帳號:");
		String id = scanner.next();
		
		System.out.println("請輸入密碼:");
		String password = scanner.next();
		
		System.out.printf("%s,%s\n", id,password);
		scanner.close();
		
		String sql = String.format(SELECT_CUSTOMER, id,password);
		System.out.println(sql);
		
		try {
			Class.forName(Driver);
			try {
				Connection connection = DriverManager.getConnection(URL,USER_ID,DB_PWD);
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					Customer c = new Customer();
					String theId = rs.getString("id");
					c.setId(theId);
					c.setEmail(rs.getString("email"));
					
					
					
					System.out.println(c);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
