package uuu.es.test;

import uuu.es.entity.Customer;
import uuu.es.entity.VIP;

public class Test_instanceof { 
//	instanceof 為運算子
//	instanceof 檢查 左邊 參考型別(變數) 是否參考到 右邊物件 或 為該物件的子孫類別
//												如右邊為null 左邊參考到null都是false
	public static void main(String[] args) {
		Object o =new Object();
		Customer c = new Customer();
		VIP v = new VIP();
		String s = "";//new String()
		int i =1;//基本型別無法做檢查只能(參考型別)
		
//		System.out.println(i instanceof Object); 	//無法編譯
//		System.out.println(i instanceof Customer);	//無法編譯
//		System.out.println(i instanceof VIP);		//無法編譯
//		System.out.println(i instanceof String);	//無法編譯
		
		System.out.println(o instanceof Object); 	//true
		System.out.println(o instanceof Customer);	//false
		System.out.println(o instanceof VIP);		//false
		System.out.println(o instanceof String);	//false
		
		System.out.println(c instanceof Object);	//true
		System.out.println(c instanceof Customer);	//true
		System.out.println(c instanceof VIP);		//false
//		System.out.println(c instanceof String); 無法編譯 String Customer不是父子類別
		
		System.out.println(v instanceof Object);	//true
		System.out.println(v instanceof Customer);	//true
		System.out.println(v instanceof VIP);		//true
//		System.out.println(v instanceof String); 無法編譯 String VIP不是父子類別
				
		System.out.println(s instanceof Object);	//true
//		System.out.println(s instanceof Customer); 無法編譯 String Customer不是父子類別
//		System.out.println(s instanceof VIP); 無法編譯
		System.out.println(s instanceof String);	//true
	}

}
