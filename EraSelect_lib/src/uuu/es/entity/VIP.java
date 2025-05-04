package uuu.es.entity;

//繼承 子類別(sub class):VIP;在superclass中添加父類別(super class parent class):Customer
public class VIP extends Customer {
	private int discount=5;// 2%~15% off

	public VIP() { //for DAO, Controller
		super();
	}

	public VIP(String id, String password, String name, char gender) {
		super(id, password, name, gender);
	}

	public VIP(String id, String password, String name) {
		super(id, password, name);
	}

	public int getDiscount() {
		return discount;
	}
	
	public static final int MIN_DISCOUNT_LENGTH = 2;
	public static final int MAX_DISCOUNT_LENGTH =15;
	public void setDiscount(int discount) {
		if (discount >= MIN_DISCOUNT_LENGTH && discount <= MAX_DISCOUNT_LENGTH) {
			this.discount = discount;
		} else {
			System.err.printf("VIP折扣必須在%s%%~%s%%之間\n",MIN_DISCOUNT_LENGTH,MAX_DISCOUNT_LENGTH); // for developer,tester,admin
			// TODO 拋出 XxxException
		}
	}
	
	
	//中文幾折
	public String getDiscountString() {
		int discount = 100-this.discount;
		if(discount % 10 ==0) {
			discount = discount / 10;
		}
		return discount + "折";
	}

	@Override
	public String toString() { //source->toString
		return  super.toString() + "\n[VIP discount=" 
		+discount + "%off :" + getDiscountString() + "]";
	}
	
	
	
}
