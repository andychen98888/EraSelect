package uuu.es.test;

import uuu.es.entity.SpecialOffer;

public class TestSpecialOffer {

	public static void main(String[] args) {
		SpecialOffer sp = new SpecialOffer(2,"LV x Timberland 短靴",78500,21);
		
//		sp.setDiscount(21);
		
//		sp.setId(2);
//		sp.setName("LV x Timberland 短靴");
//		sp.setUnitPrice(78500);
//		sp.setStock(1);
		sp.setPhotoUrl("https://tw.louisvuitton.com/zht-tw/products/lv-x-timberland-ankle-boot-nvprod5620002v/1AD74X");
		sp.setCategory("鞋子");
		sp.setReleaseDate("2024-07-15");//sp.setReleaseDate(LocalDate.parse("2024-07-15"));
		sp.setDescription("這款LV x Timberland短靴將Timberland的工裝風格及路易威登奢華的手製工藝融為一體。");
		
//		System.out.printf("sp.discount:%s %% off\n", sp.getDiscount());
//		System.out.printf("sp.中文discount:%s\n", sp.getDiscountString());
		
//		System.out.printf("sp.Id:%s\n", sp.getId());
//		System.out.printf("sp.name:%s\n", sp.getName());
//		System.out.printf("sp.定價:%s\n", sp.getListPrice());
//		System.out.printf("sp.Stock:%s\n", sp.getStock());
//		System.out.printf("sp.PhotoUrl:%s\n", sp.getPhotoUrl());
//		System.out.printf("sp.Category:%s\n", sp.getCategory());
//		System.out.printf("sp.ReleaseDate:%s\n", sp.getReleaseDate());
//		System.out.printf("sp.Description:%s\n", sp.getDescription());
//		System.out.printf("sp.售價:%s\n", sp.getUnitPrice());
		
		System.out.println(sp);//for admin,tester,developer
	}

}
