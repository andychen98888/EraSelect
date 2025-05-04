package uuu.es.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Product;
import uuu.es.exception.ESException;
import uuu.es.service.ProductService;

public class TestProductService_getAll {

	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
//			List<Product> list = pService.getAllProducts();
			List<Product> list = pService.getProductsByKeyword("camo");
			System.out.println(list);
		} catch (ESException e) {
			Logger.getLogger("").log(Level.SEVERE,e.getMessage(),e);
		}
		
	}

}
