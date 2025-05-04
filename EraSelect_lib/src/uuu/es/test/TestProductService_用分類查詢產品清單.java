package uuu.es.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.es.entity.Product;
import uuu.es.entity.Spec;
import uuu.es.exception.ESException;
import uuu.es.service.ProductService;

public class TestProductService_用分類查詢產品清單 {

	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
//			List<Product> list = pService.getLatestProducts();//getProductsByCategory("上衣")
			List<Spec> list = pService.getProductSpecsByIdAndColorName("1","Rinsed Indigo");
			System.out.println(list);
		} catch (ESException e) {
			Logger.getLogger("").log(Level.SEVERE,e.getMessage(),e);
		}
		
	}

}
