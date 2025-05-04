package uuu.es.test;

import java.sql.*;

import uuu.es.entity.Customer;

public class TestCheckedException {

	private static final String sql = "SELECT id, name ,email FROM customers";
	
	public static void main(String[] args)throws Exception { //錯誤處理關掉 不會提示
		
			Class.forName("com.mysql.cj.jdbc.Driver"); //1.載入Driver
			
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/es","root","1234");//2.建立指令
			
			Statement stmt = connection.createStatement();//3.建立指令
			ResultSet rs = stmt.executeQuery(sql);//4.執行指令
			
			while(rs.next()) { //5.
				Customer c = new Customer();
				c.setId(rs.getString("id"));
				c.setName(rs.getString("name"));
//				c.setPassword(rs.getString("password")); line9:sql裡面沒有password 會當掉
				c.setEmail(rs.getString("email"));
				System.out.println(c);
			}
		
			rs.close();
			stmt.close();
			connection.close();
	}

}
