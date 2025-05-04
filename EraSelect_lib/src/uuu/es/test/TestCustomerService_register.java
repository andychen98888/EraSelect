package uuu.es.test;

import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Customer;
import uuu.es.exception.ESDataInvalidException;
import uuu.es.exception.ESException;
import uuu.es.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入ROC ID:");
		String id = scanner.next();
		
		System.out.println("請輸入email:");
		String email = scanner.next();
		
		System.out.println("請輸入電話:");
		String phone = scanner.next();
		
		System.out.println("請輸入姓名:");
		String name = scanner.next();
		
		System.out.println("請輸入密碼:");
		String password = scanner.next();
		
		Customer c = new Customer();
		try {
			c.setId(id);
			c.setEmail(email);
			c.setPhone(phone);
			c.setName(name);
			c.setPassword(password);
			c.setBirthday(2000,01,04);
			c.setGender(Customer.OTHER);
			c.setAddress("Shanchong");
			c.setSubscribed(true);
			
			System.out.println(c);
			
			CustomerService service = new CustomerService();
			service.register(c);
			System.out.println("註冊成功");
			
		}catch(ESDataInvalidException e){
			System.err.println(e.getMessage()); //for user
		} catch (ESException e) {
			System.err.println(e.getMessage()+"請聯絡admin"); //for user
			Logger.getLogger("").log(Level.SEVERE,e.getMessage(),e);
		}
	}

}
