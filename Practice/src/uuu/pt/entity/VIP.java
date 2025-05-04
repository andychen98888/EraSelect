package uuu.pt.entity;

import uuu.pt.exception.ESException;

public class VIP extends Customer{
	
	private int  discount = 10; //2%~15%off
	
	public VIP() {
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

	public static final int MIN_DISCOUNT = 2;
	public static final int MAX_DISCOUNT = 15;
	public void setDiscount(int discount) throws ESException {
		if(discount >= MIN_DISCOUNT && discount <= MAX_DISCOUNT) {
			this.discount = discount;
		}else {
			System.err.printf("VIP折扣必須在%s%%~%s%%之間\n",MIN_DISCOUNT,MAX_DISCOUNT);
//			throw new ESException("VIP折扣必須在2%~15%之間\n",);
		}
	}
	
	
	public String getDiscountString() {
		int discount = 100-this.discount;
		if(discount % 10 == 0) {
			discount = discount /10;
		}
		return discount + "折";
	}

	@Override
	public String toString() {
		return super.toString()
				+"[discount=" + discount +"%%off"
				+ getDiscountString() + "]";
	}
	

	
	

}
