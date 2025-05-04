package uuu.es.entity;

//列舉型別 enum[enumerated type] 列舉值不要超過10個
public enum ShippingType {
	SHOP("門市取貨", new PaymentType[] {PaymentType.SHOP}),
	HOME("宅配",120, PaymentType.ATM, PaymentType.HOME, PaymentType.CARD),
	STORE("超商取貨",65,new PaymentType[] {PaymentType.ATM, PaymentType.STORE, PaymentType.CARD}),
	NO("無須貨運",PaymentType.ATM, PaymentType.CARD); //第一行必須先宣告列舉值(最好用英文)
	
	private final String description;
	private final double fee;
	private final PaymentType[] paymentTypeArray;
	
	
//	public PaymentType[] getPaymentTypeArray() { //集合不能回傳正本 只能回傳副本 .clone()複製
//		return paymentTypeArray!=null?paymentTypeArray.clone():null;
//	}
	
	
	public String getPaymentTypeArrayStr() {//為了將對應PaymentType資料傳給前端
		StringBuilder data = new StringBuilder();
		if(paymentTypeArray!=null && paymentTypeArray.length>0) {
			for(PaymentType pType:paymentTypeArray) {
				if(data.length()>0) data.append(',');
				data.append(pType.name());
			}
		}		
		
		return data.toString();
	}
	
	private ShippingType(String description, PaymentType... paymentTypeArray) { //overloading SHOP,NO會傳入此建構式 []換成...可變動參數0~多個，要寫在參數列的最後一個
		this(description,0 ,paymentTypeArray); //值為0
	}
	private ShippingType(String description, double fee, PaymentType... paymentTypeArray) { //建構式 description fee 兩個屬性在建構是給值
		this.description = description;
		this.fee = fee;
		this.paymentTypeArray = paymentTypeArray;
	}
	
	public String getDescription() {
		return description;
	}
	public double getFee() {
		return fee;
	}
	
	@Override
	public String toString() {
		return this.description + (this.fee>0?"," + this.fee + "元":"");
	} 
	
	
}
