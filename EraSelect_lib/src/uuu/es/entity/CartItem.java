package uuu.es.entity;

import java.time.LocalTime;

public class CartItem {
	private Product theProduct; //PKey
	private Color theColor; 	//PKey
	private Spec theSpec;		//PKey
//	private LocalTime createdTime = LocalTime.now(); //建立加入購物車順序
	
	
//	private boolean checked = true; //打勾是否要加入結帳
//	public boolean isChecked() {
//		return checked;
//	}
//	public void setChecked(boolean checked) {
//		this.checked = checked;
//	}
	
	public Product getTheProduct() {
		return theProduct;
	}
	public void setTheProduct(Product theProduct) {
		this.theProduct = theProduct;
	}
	public Color getTheColor() {
		return theColor;
	}
	public void setTheColor(Color theColor) {
		this.theColor = theColor;
	}
	public Spec getTheSpec() {
		return theSpec;
	}
	public void setTheSpec(Spec theSpec) {
		this.theSpec = theSpec;
	}
	
	
	//根據購物車畫面設計getter 建立方法抓到產品資訊 比較直覺
	public int getProductId() {
		return theProduct.getId();
	}
	public String getProductName() {
		return theProduct.getName();
	}
	public String getColorName() {
		if(theColor!=null) {
			return theColor.getColorName();
		}else {
			return "";
		}
	}
	public String getSpecName() {
		if(theSpec!=null) {
			return theSpec.getSpecName();
		}else {
			return "";
		}
	}
	public int getStock() {
		if(theSpec!=null){
			return theSpec.getStock();
		}else if(theColor!=null){
			return theColor.getStock();
		}else {
			return theProduct.getStock();
		}
	}
	
	//紀錄即時庫存查詢的stock值
    /**
     * 為紀錄即時庫存加入的方法
     * @param stock
     */
    public void setStock(int stock) {
       if(theSpec!=null ) {
    	   theSpec.setStock(stock); return;
       }    

       if(theColor!=null ) {
    	   theColor.setStock(stock); return;
       }     

       theProduct.setStock(stock);
    }
	
    
	public String getPhotoUrl() {
		if(theColor!=null && theColor.getPhotoUrl()!=null) {
			return theColor.getPhotoUrl();
		}else {
			return theProduct.getPhotoUrl();
		}
	}
	//定價
	public double getListPrice() {
		if(theSpec!=null){
			return theSpec.getUnitPrice();
		}else {
			if(theProduct instanceof SpecialOffer) {
				return ((SpecialOffer)theProduct).getListPrice();
			}else {
				return theProduct.getUnitPrice();
			}
		}
	}
	//售價
	public double getPrice() {
		if(theSpec!=null){
			return theSpec.getPrice();
		}else {
			return theProduct.getUnitPrice();
		}
	}
	
	public String getDiscountString() {
		if(theProduct instanceof SpecialOffer) {
			return ((SpecialOffer)theProduct).getDiscountString();
		}else {
			return "";
		}
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((theColor == null) ? 0 : theColor.hashCode());
		result = prime * result + ((theProduct == null) ? 0 : theProduct.hashCode());
		result = prime * result + ((theSpec == null) ? 0 : theSpec.hashCode());
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
		CartItem other = (CartItem) obj;
		if (theColor == null) {
			if (other.theColor != null) {
				return false;
			}
		} else if (!theColor.equals(other.theColor)) {
			return false;
		}
		if (theProduct == null) {
			if (other.theProduct != null) {
				return false;
			}
		} else if (!theProduct.equals(other.theProduct)) {
			return false;
		}
		if (theSpec == null) {
			if (other.theSpec != null) {
				return false;
			}
		} else if (!theSpec.equals(other.theSpec)) {
			return false;
		}
		return true;
	}
	@Override
	public String toString() {
		return "購物明細 [編號=" + getProductId() 
				+ String.format(", Product-Color-Spec=%s-%s-%s",getProductName(),getColorName(),getSpecName())  
				+", 庫存=" + getStock() 
				+ "\n, 圖片網址=" + getPhotoUrl() 
				+ "\n, 定價=" + getListPrice() + ", 折扣=" + getDiscountString() + ", 售價=" + getPrice() + "]";
	}
	
	
	
}
