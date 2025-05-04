package uuu.es.entity;

public class Spec {
	private int productId; 		//PKEY
	private String colorName;	//PKEY
	private String specName;	//PKEY
	private int stock;			//requried
	private double unitPrice;	//requried 定價
	private double price;		//requried 折扣後售價
	private int ordinal;		//非必要
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getOrdinal() {
		return ordinal;
	}
	public void setOrdinal(int ordinal) {
		this.ordinal = ordinal;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((colorName == null) ? 0 : colorName.hashCode());
		result = prime * result + productId;
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
		Spec other = (Spec) obj;
		if (colorName == null) {
			if (other.colorName != null) {
				return false;
			}
		} else if (!colorName.equals(other.colorName)) {
			return false;
		}
		if (productId != other.productId) {
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
		return "Spec [" + productId + "-" + colorName + "-" + specName + ", 庫存="
				+ stock + ", 定價=" + unitPrice + ", 售價=" + price + ", ordinal序號=" + ordinal + "]";
	}
	
	
}
