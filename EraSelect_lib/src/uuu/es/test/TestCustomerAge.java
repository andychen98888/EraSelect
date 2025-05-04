package uuu.es.test;

import java.time.LocalDate;
import java.time.Month;

import uuu.es.entity.Customer;

public class TestCustomerAge {

	public static void main(String[] args) {
//		long begin = System.currentTimeMillis();
		
		Customer c = new Customer(); //alt/import Customer //c is a local variable
		c.setId("A123123123");
		c.setEmail("test@gmail.com");
		c.setPhone("0987092028");
		c.setPassword("1234;lkj");
		c.setName("魏昇棉");
		
//		c.birthday = LocalDate.of(1997, 9, 24);
//		c.setBirthday(LocalDate.of(2012,12,4)); //呼叫setBirthday(year,month,day)來設定生日
//		c.birthday = LocalDate.parse("2004-12-04"); //將符合iso-8601的日期字串轉換成LocalDate物件
		c.setBirthday("2000-12-04"); //呼叫setBirthday(iso-8601)來設定生日
//		c.setBirthday(2012,12,4);
		
		c.setGender('M');
		c.setAddress("NewTaipei");
		c.setSubscribed(true);
		
		
		System.out.printf("id:%s\n", c.getId());
		System.out.printf("email:%s\n", c.getEmail());
		System.out.printf("phone:%s\n", c.getPhone());
		System.out.printf("password:%s\n", c.getPassword());
		System.out.printf("name:%s\n", c.getName());
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
