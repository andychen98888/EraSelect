package uuu.es.test;

import java.time.LocalDate;
import java.time.Month;
import java.util.Scanner;

import uuu.es.entity.Customer;

public class TestCustomerEncapsulation {

	public static void main(String[] args) {
//		long begin = System.currentTimeMillis();
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入6~20個字元的密碼:");
		String pwd = scanner.next();
		
		Customer c = new Customer(); //alt/import Customer //c is a local variable
		c.setId("A123123123");
		c.setEmail("test@gmail.com");
		c.setPhone("0987-092028");
		
//		if(pwd.length()>=6 && pwd.length()<20) {
//			c.password = pwd;
//		}
		c.setPassword(pwd);
//		c.name = "魏昇棉";
		c.setName("魏昇棉"); //紀念品.膨大海.林道語
		
//		c.birthday = LocalDate.of(1997, 9, 24);
		c.setBirthday(2000,10,4); //呼叫setBirthday(year,month,day)來設定生日
		
//		c.birthday = LocalDate.parse("2004-12-04"); //將符合iso-8601的日期字串轉換成LocalDate物件
		c.setBirthday("2000-12-04"); //呼叫setBirthday(iso-8601)來設定生日
		
//		c.setGender((char)70);
		c.setGender('M');
		
//		c.address = "";
		c.setAddress("台北市");
		
		c.setSubscribed(true);
		
		//system are for developers,testers,admins,not for users
		System.out.printf("id:%s\n", c.getId());
		System.out.printf("email:%s\n", c.getEmail());
		System.out.printf("phone:%s\n", c.getPhone());
		System.out.printf("password:%s\n", c.getPassword());
		System.out.printf("name:%s\n", c.getName());//c.name
		System.out.printf("birthday:%s\n", c.getBirthday());
		System.out.printf("gender:%s\n", c.getGender());
		System.out.printf("address:%s\n", c.getAddress());
		System.out.printf("subscribed:%s\n", c.isSubscribed());
//		System.out.printf("共花%sMS\n",System.currentTimeMillis()-begin);
		
		//計算年齡
//		Month thisMonth = LocalDate.now().getMonth();
//		System.out.println(thisMonth);
		
//		int thisYear = LocalDate.now().getYear();
//		int birthYear = c.birthday.getYear();
//		int age = thisYear - birthYear; //此方法只能用在這個位置
		int age = c.getAge(); //呼叫getAge()方法
		System.out.printf("%s歲\n", age);
	}

}
