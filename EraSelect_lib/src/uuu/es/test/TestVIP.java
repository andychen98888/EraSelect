package uuu.es.test;

//繼承 
import uuu.es.entity.VIP;

public class TestVIP {

	public static void main(String[] args) {
		VIP vip = new VIP();
		
		//父類別 Customer
		vip.setId("A123123123");
		vip.setName("紀念品");
		vip.setEmail("powei749@aaa.com.tw");
		vip.setPhone("09871766999");
		vip.setPassword("afjkl;lkjh");
		vip.setBirthday("2003-12-05");
		vip.setGender('F');
		vip.setAddress("新北市中和區");
		vip.setSubscribed(false);
		//VIP
		vip.setDiscount(1);
		
//		System.out.printf("vip.id:%s\n", vip.getId());
//		System.out.printf("vip.name:%s\n", vip.getName());
//		System.out.printf("vip.discount:%s %% off\n", vip.getDiscount());
//		System.out.printf("vip.discountString:%s\n", vip.getDiscountString());
//		System.out.printf("vip.email:%s\n", vip.getEmail());
//		System.out.printf("vip.phone%s\n", vip.getPhone());
//		System.out.printf("vip.password:%s\n", vip.getPassword());
//		System.out.printf("vip.brithday:%s\n", vip.getBirthday());
//		System.out.printf("vip.gender:%s\n", vip.getGender());
//		System.out.printf("vip.address:%s\n", vip.getAddress());
//		System.out.printf("vip.subscribed:%s\n", vip.isSubscribed());//boolean --> is
		
		System.out.println(vip);//Override toString
		
	}

}
