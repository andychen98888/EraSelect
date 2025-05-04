package uuu.pt.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import uuu.pt.exception.ESException;

class MySQLConnection {
	
	private static final String DRIVER ;
	private static final String URL;
	private static final String USER_ID;
	private static final String DB_PWD;
	
	static {
		ResourceBundle bundle = ResourceBundle.getBundle("uuu.pt.service.mysql");
		DRIVER = bundle.getString("jdbc.driver");
		URL = bundle.getString("jdbc.url");
		USER_ID = bundle.getString("jdbc.userid");
		DB_PWD = bundle.getString("jdbc.pwd");
	}
	
	static Connection getConnection() throws ESException {
		try {
			Class.forName(DRIVER);
			try {
				Connection connection = DriverManager.getConnection(URL,USER_ID,DB_PWD);
				return connection;
			} catch (SQLException e) {
				throw new ESException("建立連線失敗", e);
			}
		} catch (ClassNotFoundException e) {
			throw new ESException("載入Driver失敗", e);
		}
	}
	
	
	
	
}
