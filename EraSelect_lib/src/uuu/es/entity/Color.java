package uuu.es.entity;

import java.time.LocalDate;

import uuu.es.exception.ESDataInvalidException;

public class Color {
	private String colorName; //required PKey
	private int stock;	  //required
	private LocalDate releaseDate;
	private String photoUrl;
	private String iconUrl;
	
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		if(colorName != null && (colorName=colorName.trim()).length()>0) {
			this.colorName = colorName;
		}else {
			throw new ESDataInvalidException("產品顏色名稱必須有值");
		}
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public LocalDate getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public String getIconUrl() {
		return iconUrl;
	}
	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((colorName == null) ? 0 : colorName.hashCode());
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
		Color other = (Color) obj;
		if (colorName == null) {
			if (other.colorName != null) {
				return false;
			}
		} else if (!colorName.equals(other.colorName)) {
			return false;
		}
		return true;
	}
	@Override
	public String toString() {
		return "Color [Color_Name=" + colorName + ", Color_stock=" + stock + ", Color_releaseDate=" + releaseDate 
				+ ", \nColor_photoUrl="+ photoUrl 
				+ ", \nColor_iconUrl=" + iconUrl + "]";
	}
	
	
	
}
