package uuu.es.test;

import java.util.ResourceBundle;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Customer;

import java.sql.*; //用打的 要import好幾個sql的功能所以直接用星號，就不用一個一個import

public class TestCustomerLogin_防範SQL_Injection {
	
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
			+ "	 WHERE id = ? ";//AND BINARY password = ?";//AND password = '%s'"; //WHERE關鍵字 前面不能把空白移掉 移掉編譯後會成變字串:customersWHERE  
						// 改成問號 //'?'會變成資料?去比對資料庫
						//BINARY 檢查大小寫 MySQL專屬寫法 所以不建議在資料庫加上檢察
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入帳號:"); //A123123123
		String id = scanner.next();
		
		System.out.println("請輸入密碼:");//1234;Lkj
		String password = scanner.next();
		
		System.out.printf("帳號:%s,密碼:%s\n",id, password);
		scanner.close();

//		刪除
//		String sql = String.format(SELECT_CUSTOMER, id,password);//格式化字串
//		System.out.println(sql);
		
		//JDBC
		Customer c =null;
		
		try {
			Class.forName(DRIVER); //1.載入類別(Driver) 載入類別定義
			try ( //complier會自動關閉
				Connection connection = DriverManager.getConnection(URL, USER_ID, DB_PWD); //2.建立連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMER); //3.準備指令
				//讓傳入的資料只有資料(?)沒有指令 指令跟資料分開處理 在prepare時就建立物件
					){

				pstmt.setString(1, id);//3.1傳入?的值 (第一個問號,傳入id)
//				pstmt.setString(2, password);
				
				try(
						ResultSet rs = pstmt.executeQuery(); //4.執行指令
				){
//				Customer c =null;//如果再try裡面會變區塊變數 所以要搬到最前面
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
				}//有小括號系統會自動加 finally{}關閉()裡的程式，沒有()必須加catch | finally
				
				if(c!=null && password!=null && password.equals(c.getPassword())) {
					System.out.printf("登入成功，%s您好\n", c.getName());
					return;
				}
//				TODO password錯誤寄送email
//				else if(c!=null && password!=null && !password.equals(c.getPassword()));//檢查密碼大小寫
				
				System.err.println("登入失敗,帳號或密碼不正確");
				
			} catch (SQLException e) {
//				System.err.println("建立連線 | 執行指令 失敗:"+e);
//				e.printStackTrace();
				Logger.getLogger("XxxxxXXXxx").log(Level.SEVERE, "建立連線 | 執行指令 失敗", e);//Logger:java標準日誌類別 .log
			}		//getLogger("XxxxxXXXxx")存入檔案才會用到所以可寫空字串
			
		} catch (ClassNotFoundException e) {
//			System.err.println("載入Driver失敗:"+DRIVER);
//			e.printStackTrace();
			Logger.getLogger("").log(Level.SEVERE, "載入Driver失敗", e);//Logger:java標準日誌類別 .log
		}
		
	}

}
