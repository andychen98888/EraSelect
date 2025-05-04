package uuu.es.test;

import uuu.es.entity.Customer;
import uuu.es.entity.VIP;

public class Test_getClass { 
//	getClass() 檢查 類別的物件.getclass() 參考型別(變數) 是否參考到 右邊類別名稱.class 												
	public static void main(String[] args) {
		Object o =new Object();
		Customer c = new Customer();
		VIP v = new VIP();
		String s = "";//new String()

		
		System.out.println(o.getClass() == Object.class); 	//true
		System.out.println(o.getClass() == Customer.class);	//false
		System.out.println(o.getClass() == VIP.class);		//false
		System.out.println(o.getClass() == String.class);	//false
		
//		System.out.println(c.getClass() == Object.class);	//無法編譯
		System.out.println(c.getClass() == Customer.class);	//true
		System.out.println(c.getClass() == VIP.class);		//false
//		System.out.println(c instanceof String); 無法編譯 String Customer不是父子類別
		
//		System.out.println(v.getClass() == Object.class);	//無法編譯
//		System.out.println(v.getClass() == Customer.class);	//無法編譯
		System.out.println(v.getClass() == VIP.class);		//true
//		System.out.println(v instanceof String); 無法編譯 String VIP不是父子類別
				
//		System.out.println(s.getClass() == Object.class);	//無法編譯
//		System.out.println(s instanceof Customer); 無法編譯 String Customer不是父子類別
//		System.out.println(s instanceof VIP); 無法編譯
		System.out.println(s.getClass() == String.class);	//true
	}

}
