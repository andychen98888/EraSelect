package uuu.es.entity;

public class OrderItem {
	private int orderId; 		//Pkey
	private Product product;	//Pkey
	private String colorName="";//Pkey
	private String specName="";	//Pkey
	
//	private double listPrice; 		//必要, 交易時定價
//	private String discountString;  //必要, 交易時折扣	
//	public double getListPrice() {
//		return listPrice;
//	}
//	public void setListPrice(double listPrice) {
//		this.listPrice = listPrice;
//	}
//	public String getDiscountString() {
//		return discountString;
//	}
//	public void setDiscountString(String discountString) {
//		this.discountString = discountString;
//	}
	
	private double price;		//required 交易價
	private int quantity;		//required
	

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	//依據畫面加getter
	public int getProductId() {
		return product.getId();
	}
	public String getProductName() {
		return product.getName();
	}
	public String getPhotoUrl() {
		return product.getPhotoUrl();
	}
	public double getAmount() {
		return price * quantity;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((colorName == null) ? 0 : colorName.hashCode());
		result = prime * result + orderId;
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result + ((specName == null) ? 0 : specName.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		OrderItem other = (OrderItem) obj;
		if (colorName == null) {
			if (other.colorName != null) {
				return false;
			}
		} else if (!colorName.equals(other.colorName)) {
			return false;
		}
		if (orderId != other.orderId) {
			return false;
		}
		if (product == null) {
			if (other.product != null) {
				return false;
			}
		} else if (!product.equals(other.product)) {
			return false;
		}
		if (specName == null) {
			if (other.specName != null) {
				return false;
			}
		} else if (!specName.equals(other.specName)) {
			return false;
		}
		return true;
	}
	@Override
	public String toString() {
		return "訂單明細 [訂單編號=" + orderId 
				+ String.format(", 購買產品=%s-%s-%s-%s" , getProductId(), getProductName(), colorName, specName)
				+ ",\n 售價=" + price + ", 數量=" + quantity 
				+ ", 小計=" + getAmount()
				+ ",\n 圖片=" + getPhotoUrl() + "]";
	}
	
	
	
}
