package uuu.es.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Product;
import uuu.es.exception.ESException;
import uuu.es.service.ProductService;

public class TestProductService_getProductById {

	public static void main(String[] args) {
		ProductService pService = new ProductService();
		
		try {
			Product p = pService.getProductById("10");
			System.out.println(p);
		} catch (ESException e) {
			Logger.getLogger("").log(Level.SEVERE, e.getMessage());
		}
	
	}

}
