package uuu.es.test;

import uuu.es.entity.Product;

public class TestProduct {

	public static void main(String[] args) {
		
		
		Product p = new Product(1,"ZIP-UP HOODIE - REALTREE® CAMO",5643,10);
	
//		Product p1 = new Product(); //無參數建構式
//		p.setId(1);
//		p.setName("camo hoddie");
//		p.setUnitPrice(650);
//		p.setStock(10);
		p.setCategory("上衣");
		p.setPhotoUrl("https://akimboclub.com/cdn/shop/files/BCCE5622-982B-4455-825C-DE33616899C9.jpg?v=1709051774&width=1200");
		p.setDescription("A CUSTOM VINTAGE INSPIRED COLOR WAY OF THE REALTREE ® EDGE CAMO DEVELOPED BY AKIMBO IN COLLABORATION WITH REALTREE ®\n"
				+ "MADE IN LOS ANGELES\r\n"
				+ "FITS TRUE TO SIZE\r\n"
				+ "14 OZ\r\n"
				+ "100% BRUSHED COTTON\r\n"
				+ "UNISEX\r\n"
				+ "COLD MACHINE WASH - HANG TO DRY ");
		p.setReleaseDate("2024-07-30");
		
//		System.out.printf("p.id:%s\n", p.getId());
//		System.out.printf("p.name:%s\n", p.getName());
//		System.out.printf("p.UnitPrice:%s\n", p.getUnitPrice());
//		System.out.printf("p.stock:%s\n",p.getStock());
//		System.out.printf("Category:%s\n", p.getCategory());
//		System.out.printf("url長度:%s\n", p.getPhotoUrl().length());
//		System.out.printf("Description:%s\n", p.getDescription());
//		System.out.printf("ReleaseDate:%s\n", p.getReleaseDate());
		
		System.out.println(p);
	}

}
