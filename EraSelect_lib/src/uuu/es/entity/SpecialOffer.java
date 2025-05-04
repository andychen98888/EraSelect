package uuu.es.entity;

public class SpecialOffer extends Product{
	private int discount;
	
	public SpecialOffer() {
		super();
	} // *最重要*符合Java Beans Spec //for DAO, Controller
	
	//for test
	public SpecialOffer(int id, String name, double unitPrice, int stock ,int discount) {
		super(id, name, unitPrice, stock);
		this.setDiscount(discount);
	}
	//for test
	public SpecialOffer(int id, String name, double price, int discount) {
		super(id, name, price);
		this.setDiscount(discount);
	}

	public int getDiscount() {
		return discount;
	}
	
	public static final int MIN_DISCOUNT_LENGTH = 1;
	public static final int MAX_DISOCUNT_LENGTH =90;
	public void setDiscount(int discount) {
		if (discount >= MIN_DISCOUNT_LENGTH && discount <= MAX_DISOCUNT_LENGTH) {
			this.discount = discount;
		} else {
			System.err.printf("VIP折扣必須在%s%%~%s%%之間\n",MIN_DISCOUNT_LENGTH,MAX_DISOCUNT_LENGTH); // for developer,tester,admin
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
	
	
	/**
	 * 查詢售價
	 * @return
	 */
	@Override //程式會幫忙檢查是否有override
	public double getUnitPrice() { //getDiscountedPrice
//		return this.getUnitPrice()*(100-this.getDiscount())/100;
//		return unitPrice *(100-discount)/100;
		return super.getUnitPrice() *(100-discount)/100;
	}
	
	/**
	 * 查詢定價
	 * @return
	 */
	public double getListPrice() { 
//		return unitPrice;
		return super.getUnitPrice();//用super呼叫父類別的getter
	}

	@Override
	public String toString() {
		return "[" + super.toString() 
				+ "\n產品折扣: " + discount +"% off :" + getDiscountString()
				+ "\n售價:" + getUnitPrice() + "元"
				+ "]";
	}
	
}