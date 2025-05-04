package uuu.es.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import uuu.es.exception.ESException;

class MySQLConnection { //default 只有同個package看的到
	//blank final 變數 
	private static final String DRIVER; // = "com.mysql.cj.jdbc.Driver";//上網抄 //從外部讀進來
	private static final String URL; //="jdbc:mysql://localhost:3306/es";//上網抄
	private static final String USER_ID; // = "root";
	private static final String DB_PWD; // = "1234";
	
	
	static { //靜態初始化
		ResourceBundle bundle = ResourceBundle.getBundle("uuu.es.service.mysql"); 
		//呼叫外部設定檔
		
		DRIVER = bundle.getString("jdbc.driver"); //建立指派
		URL = bundle.getString("jdbc.url");
		USER_ID = bundle.getString("jdbc.userid");
		DB_PWD = bundle.getString("jdbc.pwd");
		
//		System.out.println(JDBC);
//		System.out.println(URL);
//		System.out.println(USER_ID);
//		System.out.println(DB_PWD);
		
	}
	
//static final(常數)程式要先指派初執 但不能使用建構式指派 不是static才是用建構式指派
//	public MySQLConnection() {  
//		JDBC = "com.mysql.cj.jdbc.Driver";
//	}
	
	 static Connection getConnection() throws ESException{ //Error, RuntimeException:為default沒寫會自動寫出，跟Object一樣
		 //Connection回傳型別 連線 建立getConnection()方法
		try {
			Class.forName(DRIVER);//1.載入Driver類別
			try {
				Connection connection = DriverManager.getConnection(URL, USER_ID, DB_PWD);//2.建立連線
				return connection;
			} catch (SQLException e) {
//				Logger.getLogger("XxxxXxx").log(Level.SEVERE, "建立連線失敗", e);
				throw new ESException("建立連線失敗", e); //通知前端
			}
			
		} catch (ClassNotFoundException e) {
//			Logger.getLogger("").log(Level.SEVERE, "載入Driver失敗", e);
			throw new ESException("載入Driver失敗", e); //通知前端
		}
		
		
	}
	
	
}
