package uuu.es.test;

//import java.time.LocalDate;

import uuu.es.entity.Customer;

public class TestCustomer {

	public static void main(String[] args) {
		long begin = System.currentTimeMillis();
		
		String id ="A123123123";//A123456798
		if(Customer.checkId(id)) {//假設從遠端傳資料進來，先檢查在建立物件
			Customer c = new Customer(); //alt/import Customer //c is a local variable
			c.setId(id); //"A123123123"
			c.setEmail("test@gmail.com");
			c.setPhone("0987092028");
			c.setPassword("1234;Lkj");
			c.setName("林道宇");
			c.setBirthday(2001, 12, 04);//(LocalDate.of(1997, 9, 24))
			c.setGender(Customer.MALE);//使用static可直接用class呼叫;原('M')
			c.setAddress("Taipe i"); //adderss.trim(); //trim()去字串中的空白
			c.setSubscribed(true);
		
//		System.out.printf("id:%s\n", c.getId());
//		System.out.printf("email:%s\n", c.getEmail());
//		System.out.printf("phone:%s\n", c.getPhone());
//		System.out.printf("password:%s\n", c.getPassword());
//		System.out.printf("name:%s\n", c.getName());
//		System.out.printf("birthday:%s\n", c.getBirthday());
//		System.out.printf("gender:%s\n", c.getGender());
//		System.out.printf("address:%s\n", c.getAddress());
//		System.out.printf("subscribed:%s\n", c.isSubscribed());
		
		//c=null; 
		//System.out.println(c.toString()); //繼承父類別object，缺點:句點左邊是null時會當掉
		//System.out.println(c==null?"":c.toString) //如果uncomment要用此行
			System.out.println(c); //用此方法比較好，間接呼叫toString
			System.out.printf("共花%sMS\n",System.currentTimeMillis()-begin);
		}
		
		
	}

}
