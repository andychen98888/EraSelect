package uuu.es.test;

import uuu.es.entity.Customer;
import uuu.es.entity.Product;
import uuu.es.entity.SpecialOffer;
import uuu.es.entity.VIP;

public class TestObject_equals_hashCode {

	public static void main(String[] args) {
		//數字基本型別(byte,short,char,int,long,float,double)
		int i =1;
		double j = 1.0;
		System.out.println(i == j);//true
		
		double x = 0.3;
		double y = 0.1 + 0.1-0.1+x-0.1;
		System.out.printf("%s == %s: %s\n", x,y,x==y);//小數型態才會有
		
		//參考型別 String
		String s1 = "Hello";
		String s2 = "Hello"; //String pool 第一次有建立new 第二次找第一次一樣的字串
		String s3 = new String("Hello");
		String s4 = "heLlo";
		System.out.printf("%s == %s: %s\n",s1,s2,s1==s2);//true
		System.out.printf("%s == %s: %s\n",s1,s3,s1==s3);//false
		
		System.out.printf("\"%s\".equals(\"%s\"):%s\n", s1,s3,s1.equals(s3));//equals比較內容是否相同,參考物件不同,但內容一樣
		System.out.printf("\"%s\".equals(\"%s\"):%s\n", s1,s4,s1.equalsIgnoreCase(s4));//不分大小寫比較內容
		
		
		//參考型別 Customer
		Customer c1 = new Customer("A123123123","1234;Lkj","魏生棉");
		Customer c2 = new Customer("A123123123","1235;owj","魏生棉");
		VIP vip = new VIP("A123123123","1235;owj","魏生棉");
		
		System.out.println(c1==c2);//false
		System.out.println(c1.equals(c2));//true(原false) object裡面寫的也是用==比較所以為false
		//需在Customer類別override equals方法，並以id為主鍵才會為true
		System.out.println(c2==vip);//false
		System.out.println(c2.equals(vip));//true(原false)
		
		c2= c1;
		System.out.println(c1==c2);//true
		System.out.println(c1.equals(c2));//true
 		
		Product p1 = new Product(3,"new balance v6",6500);
		Product p2 = new Product(3,"new balance v6",6500);
		SpecialOffer sp3 = new SpecialOffer(3,"new balance v6",6500,21);
		
		System.out.println(p1 == p2);//false
		System.out.println(p1.equals(p2));
		//true;要在Product裡override [public boolean equals(Object)]
		System.out.println(p1.equals(sp3));//true;注意在equals要改用getClass()來判斷
		
		System.out.println(p1.getUnitPrice());
		System.out.println(p2.getUnitPrice());
		System.out.println(sp3.getUnitPrice());
		
	}

}
