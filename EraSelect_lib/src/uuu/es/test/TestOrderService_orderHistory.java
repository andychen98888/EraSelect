package uuu.es.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Customer;
import uuu.es.entity.Order;
import uuu.es.exception.ESException;
import uuu.es.service.CustomerService;
import uuu.es.service.OrderService;

public class TestOrderService_orderHistory {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		OrderService oService = new OrderService();
		
		try {
			Customer member = cService.login("A123123123", "1234;Lkj");
			int range = 1;
			List<Order> list = oService.getOrdersHistory(member, range);
			
			System.out.println(list);
			
			
		} catch (ESException e) {
			Logger.getLogger("").log(Level.SEVERE, e.getMessage(),e);
		}

	}

}
