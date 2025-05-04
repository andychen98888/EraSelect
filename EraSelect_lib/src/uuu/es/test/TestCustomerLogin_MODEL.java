package uuu.es.test;

import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Customer;
import uuu.es.exception.ESException;
import uuu.es.exception.LoginFailedException;
import uuu.es.service.CustomerService;

public class TestCustomerLogin_MODEL {
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入帳號/email/手機號碼:"); //A123123123
		String email = scanner.next();
		
		System.out.println("請輸入密碼:");//1234;Lkj
		String password = scanner.next();
		
		System.out.printf("帳號:%s,密碼:%s\n",email, password);
		scanner.close();
	

		CustomerService service = new CustomerService();
		
		
			Customer c;
			try {
				c = service.login(email, password);
				System.out.println("登入成功"+ c.getName());
			} catch (LoginFailedException e) { //子類別一定先處理要在上面，不然父類別會先處理掉
					System.out.println(e.getMessage()); //for users	
					
			} catch (ESException e) {
				System.err.println("登入失敗,"+ e.getMessage() + ",重大錯誤請聯絡Admin"); //for users
				Logger.getLogger("").log(Level.SEVERE, e.getMessage(), e); //for admin
			}
			
	
			
		
		
		
	}

}
