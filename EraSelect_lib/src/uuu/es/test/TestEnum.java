package uuu.es.test;

import uuu.es.entity.ShippingType;

public class TestEnum {

	public static void main(String[] args) {
		String shippingType = "HOME";
		ShippingType shType =  ShippingType.valueOf(shippingType);
		System.out.println(shType.getFee());

	}

}
