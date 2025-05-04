package uuu.es.test;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Customer;
import uuu.es.entity.Order;
import uuu.es.entity.PaymentType;
import uuu.es.entity.Product;
import uuu.es.entity.ShippingType;
import uuu.es.entity.ShoppingCart;
import uuu.es.entity.Spec;
import uuu.es.exception.ESDataInvalidException;
import uuu.es.exception.ESException;
import uuu.es.service.CustomerService;
import uuu.es.service.ProductService;

public class TestOrder {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		ProductService pService = new ProductService();
		
		try {
			Customer member = cService.login("A123123123","1234;Lkj");
			ShoppingCart cart = new ShoppingCart();
			cart.setMember(member);
			
			//第一個測試
			{
				String productId="1"; //必要
				String colorName="Rinsed Indigo";
				String specName="32";
				int quantity=1;		  //必要
				
				Product p = pService.getProductById(productId);
				Spec spec = null;
				if(p.getSpecCount()>0) {
					spec = pService.getTheSpec(productId, colorName, specName);
				}
				
				cart.addToCart(p, colorName, spec, quantity);
//				System.out.println(cart);
			}
			//第二個測試
			{
				String productId="1";  //必要
				String colorName="Black";
				String specName="30"; 
				int quantity=1;  		//必要
				
				Product p = pService.getProductById(productId);
				Spec spec = null;
				if(p.getSpecCount()>0) {
					spec = pService.getTheSpec(productId, colorName, specName);
				}
				
				cart.addToCart(p, colorName, spec, quantity);
//				System.out.println(cart);
			}
			//第三個測試
			{
				String productId="1";  //必要
				String colorName="Rinsed Indigo";
				String specName="32";
				int quantity=1;			//必要
				
				Product p = pService.getProductById(productId);
				Spec spec = null;
				if(p.getSpecCount()>0) {
					spec = pService.getTheSpec(productId, colorName, specName);
				}
				
				cart.addToCart(p, colorName, spec, quantity);
//				System.out.println(cart);
			}
			//第4個測試
			{
				String productId="3";  //必要
				String colorName="Black / Dark Amber";
				String specName=null;
				int quantity=1;			//必要
				
				Product p = pService.getProductById(productId);
				Spec spec = null;
				if(p.getSpecCount()>0) {
					spec = pService.getTheSpec(productId, colorName, specName);
				}
				
				cart.addToCart(p, colorName, spec, quantity);
//				System.out.println(cart);
			}
			//第5個測試
			{
				String productId="4";  //必要
				String colorName=null;
				String specName="L";
				int quantity=1;			//必要
				
				Product p = pService.getProductById(productId);
				Spec spec = null;
				if(p.getSpecCount()>0) {
					spec = pService.getTheSpec(productId, colorName, specName);
				}
				
				cart.addToCart(p, colorName, spec, quantity);
//				System.out.println(cart);
			}
			//第6個測試
			{
				String productId="7";  //必要
				String colorName=null;
				String specName=null;
				int quantity=1;			//必要
				
				Product p = pService.getProductById(productId);
				Spec spec = null;
				if(p.getSpecCount()>0) {
					spec = pService.getTheSpec(productId, colorName, specName);
				}
				
				cart.addToCart(p, colorName, spec, quantity);
//				System.out.println("-----------------------------");
				System.out.println(cart);
			}
			
			
			String shippingType = "HOME"; 
			String paymentType = "ATM";
			
			String name = member.getName(); 
			String email = member.getEmail();
			String phone = member.getPhone(); 
			String shippingAddress = member.getAddress();
			
			ShippingType shType = ShippingType.valueOf(shippingType);
			PaymentType pType = PaymentType.valueOf(paymentType);
			
			//建立訂單
			Order order = new Order();
			order.setMember(cart.getMember());
			order.setCreatedDate(LocalDate.now());
			order.setCreatedTime(LocalTime.now());
			
			order.setShippingType(shType);
			order.setShippingFee(shType.getFee());
			
			order.setPaymentType(pType);
			order.setPaymentFee(pType.getFee());
			
			order.setRecipientName(name);
			order.setRecipientEmail(email);
			order.setRecipientPhone(phone);
			order.setShippingAddress(shippingAddress);
			order.add(cart);
			
			//oService.checkOut(order);
			
			System.out.println(order);
			
		} catch(ESDataInvalidException e){
			Logger.getLogger("").log(Level.SEVERE, e.getMessage(),e);
		} catch (ESException e) {
			Logger.getLogger("").log(Level.SEVERE, e.getMessage(),e);
		} catch (Exception e) {
			Logger.getLogger("").log(Level.SEVERE, "系統發生錯誤:" + e.getMessage(),e);
		}

	}

}
