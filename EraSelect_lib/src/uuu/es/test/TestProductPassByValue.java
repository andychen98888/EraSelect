package uuu.es.test;

import uuu.es.entity.Product;

public class TestProductPassByValue {

	public static void main(String[] args) {
		int i = 1;
		int j = i;
		i++;
		System.out.printf("i:%s\n", i); // 2
		System.out.printf("j:%s\n", j); // 1
	System.out.println("---------------原本參數----------------");
		Product p = new Product(1, "camo hoddie", 650, 10);
		p.setCategory("書籍");
		
		System.out.printf("p.id:%s\n", p.getId());//1
		System.out.printf("p.name:%s\n", p.getName());
		System.out.printf("p.UnitPrice:%s\n", p.getUnitPrice());
		System.out.printf("p.stock:%s\n", p.getStock());
		System.out.printf("p.category:%s\n", p.getCategory());
	System.out.println("----------------p---------------");
		Product p2 = p;
		p2.setId(2);
		p2.setName(p.getName() + "第二版");
		p2.setUnitPrice(p.getUnitPrice()+50);

		//print p 
		System.out.printf("p.id:%s\n", p.getId());//
		System.out.printf("p.name:%s\n", p.getName());
		System.out.printf("p.UnitPrice:%s\n", p.getUnitPrice());
		System.out.printf("p.stock:%s\n", p.getStock());
		System.out.printf("p.category:%s\n", p.getCategory());
	System.out.println("---------------p2----------------");
		System.out.printf("p2.id:%s\n", p2.getId());
		System.out.printf("p2.name:%s\n", p2.getName());
		System.out.printf("p2.UnitPrice:%s\n", p2.getUnitPrice());
		System.out.printf("p2.stock:%s\n", p2.getStock());
		System.out.printf("p2.category:%s\n", p2.getCategory());
		
	}

}
