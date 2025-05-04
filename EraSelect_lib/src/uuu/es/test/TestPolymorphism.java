package uuu.es.test;

import uuu.es.entity.Customer;
import uuu.es.entity.Product;
import uuu.es.entity.SpecialOffer;
import uuu.es.entity.VIP;

public class TestPolymorphism {

	public static void main(String[] args) {
		// Polymorphism 多型的區域變數
		Object o1 = new Object(); //一般參考型別區域變數的宣告
		System.out.printf("o1:%s\n", o1); //o1.toString //Object的toString是print位置
		
		String s1 = "Hello";//一般參考型別區域變數的宣告
		System.out.printf("s1:%s,length:%s\n", s1 ,s1.length());
		
		Product p1 = new Product(1,"zip up hoodie",5980);//一般參考型別區域變數的宣告
		System.out.printf("%s,%s\n", p1,p1.getName());
		
		
		
		//多型的區域變數:只能call父類別有定義的方法,如果要用新功能要轉型
		Object o2 = "Hello"; //多型的參考型別區域變數的宣告 Object只能用:equals toString() getClass()...  
		System.out.printf("o2:%s\n", o2); //o2.toString()使用String.toString()
		System.out.printf("o2:%s\n",((String)o2).length());//原本是Object無法使用(新功能不能使用),使用轉型轉成String型態
		
		
		Object o3 = new Product(1,"zip up hoodie",5980);//多型的參考型別區域變數的宣告
		o3 = new Object();
		System.out.printf("o3:%s\n",o3);//o3.toString()使用Product.toString()
		if(o3 instanceof Product) { //instanceof左邊是變數,右邊是類別;檢查左邊是不是右邊的子類別。如要轉型要加檢查instanceof
			System.out.printf("價格:%s\n", ((Product)o3).getUnitPrice()); 
		}else {
			System.out.println("o3不是Product或其SubClasses建立的物件");
		}
		
		
		Product p2; 
		p2 = new SpecialOffer(2,"LV x Timberland 短靴",78500,21);
		p2 = new Product(1,"AKIMBO STRAIGHT-LEG SWEATPANTS-HEATHER GREY",5314);
		
		System.out.printf("p2:%s,定價:%s , %s p2售價:%s元\n", 
				p2,//p2.toString()使用SpecialOffer.toString()
				p2 instanceof SpecialOffer?((SpecialOffer)p2).getListPrice():p2.getUnitPrice(),
				p2 instanceof SpecialOffer?((SpecialOffer)p2).getDiscountString():"沒有折扣",
				p2.getUnitPrice());//p2.getUnitPrice()使用SpecialOffer.getUnitPrice()
		
		
		Customer c2 = new VIP("A123123123","1234;Lkj","紀念品");
		System.out.printf("c2:%s 享有折扣:%s\n", 
				c2.getName(),c2 instanceof VIP?((VIP)c2).getDiscountString():"無");
		
		
		
		
	}

}
