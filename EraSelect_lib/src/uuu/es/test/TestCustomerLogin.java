package uuu.es.test;

import java.util.ResourceBundle;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Customer;

import java.sql.*; //用打的 要import好幾個sql的功能所以直接用星號，就不用一個一個import

public class TestCustomerLogin {
	
	private static final String DRIVER ;//= "com.mysql.cj.jdbc.Driver";//上網抄 //從外部讀進來
	private static final String URL;//="jdbc:mysql://localhost:3306/es";//上網抄
	private static final String USER_ID;// = "root";
	private static final String DB_PWD;// = "1234";

	static {
		//TODO 建立指派
		ResourceBundle bundle = ResourceBundle.getBundle("uuu.es.service.mysql");
		DRIVER = bundle.getString("jdbc.driver");
		URL = bundle.getString("jdbc.url");
		USER_ID = bundle.getString("jdbc.userid");
		DB_PWD = bundle.getString("jdbc.pwd");
	}
	
	private static final String SELECT_CUSTOMER=
			"SELECT id, email, phone, password, name, birthday, gender, \n"
			+ "address, subscribed FROM customers\n"
			+ "	 WHERE id = '%s' ";//AND password = '%s'"; //WHERE關鍵字 前面不能把空白移掉 移掉編譯後會成變字串:customersWHERE  
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入帳號:"); //A123123123
		String id = scanner.next();
		
		System.out.println("請輸入密碼:");//1234;Lkj
		String password = scanner.next();
		
		System.out.printf("帳號:%s,密碼:%s\n",id); //, password);
		scanner.close();
		
		String sql = String.format(SELECT_CUSTOMER, id,password);//格式化字串
		System.out.println(sql);
		
		//JDBC
		
		try {
			Class.forName(DRIVER); //1.載入類別(Driver) 載入類別定義
			try ( //complier會自動關閉
				Connection connection = DriverManager.getConnection(URL, USER_ID, DB_PWD); //2.建立連線
				Statement stmt = connection.createStatement(); //3.建立指令，會發生SQL Injection的資安漏洞 'or''='
				ResultSet rs = stmt.executeQuery(sql); //4.執行指令
					){
				
//				Connection connection = DriverManager.getConnection(URL, USER_ID, DB_PWD); //2.建立連線
//				Statement stmt = connection.createStatement(); //3.建立指令，會發生SQL Injection的資安漏洞 'or''='
//				ResultSet rs = stmt.executeQuery(sql); //4.執行指令
				
				Customer c =null;
				while(rs.next()) { //5.讀取rs
					c = new Customer();
					
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
					
					System.out.println(c);
				}
				
				if(c!=null && password!=null && password.equals(c.getPassword())) {
					System.out.printf("登入成功，%s您好\n", c.getName());
					return;
				}
//				TODO
//				else if(c!=null && password!=null && !password.equals(c.getPassword()));//檢查密碼大小寫
				
				System.err.println("登入失敗,帳號或密碼不正確");
				
			} catch (SQLException e) {
//				System.err.println("建立連線 | 執行指令 失敗:"+e);
//				e.printStackTrace();
				Logger.getLogger("").log(Level.SEVERE, "建立連線 | 執行指令 失敗", e);//Logger:java標準日誌類別 .log
			}
			
		} catch (ClassNotFoundException e) {
//			System.err.println("載入Driver失敗:"+DRIVER);
//			e.printStackTrace();
			Logger.getLogger("").log(Level.SEVERE, "載入Driver失敗", e);//Logger:java標準日誌類別 .log
		}
		
	}

}
