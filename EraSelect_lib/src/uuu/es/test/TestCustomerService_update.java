package uuu.es.test;

import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Customer;
import uuu.es.exception.ESDataInvalidException;
import uuu.es.exception.ESException;
import uuu.es.service.CustomerService;

public class TestCustomerService_update {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入ROC ID:");
		String id = scanner.next();
		
		System.out.println("請輸入密碼:");
		String password = scanner.next();
		
		try {
			CustomerService service = new CustomerService();
			Customer c = service.login(id, password);
			System.out.println(c);
			
			c.setName("張三風");
			service.update(c);
			System.out.println("修改成功:");
			System.out.println(c);
			
		}catch(ESDataInvalidException e){
			System.err.println(e.getMessage()); //for user
		} catch (ESException e) {
			System.err.println(e.getMessage()+"請聯絡admin"); //for user
			Logger.getLogger("").log(Level.SEVERE,e.getMessage(),e);
		}
	}

}
