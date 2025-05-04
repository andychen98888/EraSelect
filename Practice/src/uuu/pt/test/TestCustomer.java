package uuu.pt.test;

import uuu.pt.entity.Customer;

public class TestCustomer {

	public static void main(String[] args) {
		long begin =System.currentTimeMillis();
		
	    Customer c = new Customer("A123123123","1234;Lkj","林道宇",Customer.MALE);    
	    c.setSubscribed(true);
	    c.setAddress("New Taiper City Shanchong");
	    c.setBirthday(2009,4,8);
	    c.setPassword("asdfLj;jasohdblnp");
	    c.setPhone("0912345987");
	    
	    
//	    System.out.printf("是否訂閱:%s\n", c.isSubscribed());
//		System.out.printf("地址:%s\n",c.getAddress());
//		System.out.printf("性別:%s\n", c.getGender());
		
	        
	    System.out.println(c);    
	    System.out.println(System.currentTimeMillis()-begin);
	        
	        
	        
	        
	        
	        
	        
	        

	}

}
