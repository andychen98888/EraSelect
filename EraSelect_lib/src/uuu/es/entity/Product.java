package uuu.es.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Product extends Object{
	private int id; // PKey(equals + hashCode), AUTO-INCREMENT自動給號
	private String name; // required ,1~60個字元
	//protected讓不同的子類別讀取到
	private double unitPrice; // required 0.0D,>0,定價/售價
	private int stock; // required,負數
	private String photoUrl; // optional
	private String category; // category分類 書籍/文具, required
	private String description = "";// optional 產品文案
	private LocalDate releaseDate;// required 上假日期//ctrl+shift+o import LocalDate
	private int specCount;

	//顏色清單
	private List<Color> colorsList = new ArrayList<>();
	private List<Spec> specsList = new ArrayList<>();
	
	public List<Spec> getSpecsList() {
		return new ArrayList<>(specsList);
	}
	public List<Color> getColorsList() {
		//return colorsList; //不應直接回傳正本
		return new ArrayList<>(colorsList); //return複本
		//return Collections.unmodifiableList(colorsList); //return不可修改的正本
	}
	
	//取代集合屬性的setter: add, (update, remove用不到)
	public void add(Color color) {
		colorsList.add(color);
	}
//	*集合屬性不可使用setter*
//	public void setColorsList(List<Color> colorsList) { 
//		this.colorsList = colorsList;
//	}	
	
	//
	public Color findColor(String colorName) {
		Color theColor = null;
		if(colorsList.size()>0 && colorName!=null) {
			for(int i=0;i<colorsList.size();i++) {
				Color color = colorsList.get(i);
				if(color!=null && color.getColorName().equals(colorName)) {
					theColor = color;
					break;
				}
			}
		}
		return theColor;
	}
	
	public int getSpecCount() {
		return specCount;
	}
	public void setSpecCount(int specCount) {
		this.specCount = specCount;
	}
	

	// 建構式:需與'類別名稱'需一樣，不可建立回傳型別，多用於測試，
	public Product() {
	} // *最重要*自訂建構式需要自己建立一個無參數建構式;符合Java Beans Spec
	//for DAO, Controller
	
	// 直接指派 //for test
	public Product(int id, String name, double price) {
		this.id = id;
		this.name = name;
		this.unitPrice = price;
	}

	// 呼叫方法 有參數建構式//for test
	public Product(int id, String name, double unitPrice, int stock) {
//		super(); //用不到 需在建構式第一行
		this(id, name, unitPrice); // this寫在建構式的第一行,可呼叫另一支同類別的建構式,參數多call參數少的
//		this.setId(id); //建構式可以呼叫方法也可以直接指派屬性
//		this.setName(name);
//		this.setUnitPrice(unitPrice);
		this.setStock(stock);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		if (id >= 0) {
			this.id = id;
		} else {
			System.err.println("產品編號不得為負數/n");
		}
	}

	public String getName() {
		return name;
	}
	
	public static final int NAME_LENGTH = 2;
	public void setName(String name) {
		if (name != null && name.length() >= NAME_LENGTH) {
			this.name = name;
		}else {
			System.out.printf("產品名稱需大於%s個字\n", NAME_LENGTH);
		}
	}

	/**
	 * 查詢定價(即為售價)
	 * @return double型別的定價(即為售價)
	 */
	public double getUnitPrice() {
		return unitPrice;
	}
	/**
	 * 指派定價
	 * @param unitPrice double型別 代表定價
	 */
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	//
	public int getStock() {
		if(colorsList!=null && colorsList.size()>0) {
			int sum=0;
			for(int i=0;i<colorsList.size();i++) {
				Color color = colorsList.get(i);
				sum += color.getStock();
			}
			return sum;
		}
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public LocalDate getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	/**
	 * 將符合iso-8601的日期字串轉成LocalDate物件
	 * 再呼叫setReleaseDate(LocalDate物件)間接指派給產品的releaseDate物件
	 * @param dateStr
	 */
	public void setReleaseDate(String dateStr) {
		if(dateStr != null) {
			LocalDate date = LocalDate.parse(dateStr);
			this.setReleaseDate(date); //呼叫setter做檢查
//			this.releaseDate = date; //不要直接做指派
		}
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return this.getClass().getSimpleName() 
				+ "[id=" + id + ", 名稱=" + name 
				+ ",\n 定價=" + unitPrice + "元, 庫存=" + stock + ", 分類=" + category
				+ ",\n 上架日期=" + releaseDate 
				+ ",\n 圖片="+ photoUrl
				+ ",\n 說明=" + description
				+ ",\n 顏色清單=" + colorsList
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Product other = (Product) obj;
		if (id != other.id) {
			return false;
		}
		return true;
	}

//	@Override
//	   public boolean equals(Object obj) { //obj是多型的參數
//			if(this == obj) return true;
//		
//			if(obj != null && obj.getClass() == this.getClass()) {
//				return this.id == ((Product)obj).id;
//			}
//			return false;
//	    }
	
}