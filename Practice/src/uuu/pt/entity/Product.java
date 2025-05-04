package uuu.pt.entity;

import java.time.LocalDate;

public class Product {
	private int id; // PKey(equals + hashCode), AUTO-INCREMENT自動給號
	private String name; // required ,1~60個字元
	private double unitPrice; // required 0.0D,>0,定價/售價
	private int stock; // required,負數
	private String photoUrl; // optional
	private String category; // category分類 書籍/文具, required
	private LocalDate releaseDate; // required 上假日期
	private String description = "";// optional 產品文案

	public Product() {
		super();
	}

	public Product(int id, String name, double price) {
		this.id = id;
		this.name = name;
		this.unitPrice = price;
	}

	public Product(int id, String name, double unitPrice, int stock) {
		this(id, name, unitPrice);
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
		if(name!=null && name.length()>= NAME_LENGTH) {
			this.name = name;
		}else {
			System.out.printf("產品名稱需大於%s個字\n", NAME_LENGTH);
		}
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getStock() {
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
	
	public void setReleaseDate(String dateString) {
		if(dateString != null) {
			LocalDate date = LocalDate.parse(dateString);
			this.setReleaseDate(date);
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
				+ "[id=" + id + ", name=" + name 
				+ ",\n unitPrice=" + unitPrice + ", stock=" + stock 
				+ ",\n photoUrl="+ photoUrl + ", category=" + category 
				+ ",\n releaseDate=" + releaseDate 
				+ ",\n description=" + description
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

}
