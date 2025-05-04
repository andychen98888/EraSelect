package uuu.es.entity;


import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import uuu.es.exception.ESDataInvalidException;

public class ShoppingCart {
	 private Customer member;
	 private Map<CartItem,Integer> cart = new HashMap<>();//Map對應關係 左邊東西不會重複 集合不能用getter.setter
	
	public Customer getMember() {
		return member;
	}
	public void setMember(Customer member) {
		this.member = member;
	}
	 
	//取代 cart屬性的setter方法:add, update, remove
	//add
	public void addToCart(Product p, String colorName, Spec spec, int quantity) {
		if(p==null) { throw new IllegalArgumentException("加入購物車產品p不得為null");}	
		
		Color theColor = null;	
		if(p.getColorsList().size()>0 && colorName!=null) {
			theColor = p.findColor(colorName); //先把顏色找到
		}
		
		if(p.getColorsList().size()>0 && theColor==null) { //有顏色商品找不到顏色才會錯
			throw new ESDataInvalidException("加入購物車顏色不正確");
		}
		
		CartItem item = new CartItem();
		item.setTheProduct(p);
		item.setTheColor(theColor);
		item.setTheSpec(spec);
		
		Integer prevQty = cart.get(item);//檢查同一個item是否已經有之前的購買數量
		if(prevQty!=null){ quantity += prevQty;}
		
		cart.put(item, quantity); //將購買明細與數量加入購物車
	}
	//update
	public void update(CartItem item, int quantity) {
		Integer prevQty = cart.get(item);//檢查同一個item是否已經有之前的購買數量
		if(prevQty!=null) cart.put(item, quantity);
	}
	//remove
	public Integer remove(CartItem item) {
		return cart.remove(item);
	}
	
	//取代 cart屬性的getter方法:
	//用[size]->[delegate methods] 代理人程式 Collection裡原有的程式
	public int size() { //共N項
		return cart.size();
	}
	public boolean isEmpty() {
		return cart.isEmpty();
	}
	public Integer getQuantity(CartItem key) {
		return cart.get(key);
	}
	public Set<CartItem> getCartItemsSet() {
		//集合不得回傳正本，刪除集合元素時，可能發生 java.util.ConcurrentModificationException(最後一筆不會發生)
		return new HashSet<>(cart.keySet()); //改成回傳副本
	}
	
	//自訂方法 getter(依據商業邏輯)
	//小計
	public double getAmount(CartItem key) {
		Integer qty = this.getQuantity(key);
		
		double amount = 0;
		if(qty!=null) {
			amount = key.getPrice() * qty;
		}
		return amount;
	}
	//共N件
	public int getTotalQuantity() {
		int sum = 0;
		Collection<Integer> values = cart.values();
		for(Integer qty : values) {
			if(qty!=null) sum = sum +qty;
		}
		return sum;
	}
	/**
	 * @return 購物車的總金額
	 */
	public double getTotalAmount() {
		double sum = 0;
		Set <CartItem> keySet = cart.keySet();
		for(CartItem item:keySet) {
			sum = sum + getAmount(item);
		}
		return Math.round(sum); //回傳前加上四捨五入，floor ceil
	}
	
	@Override
	public String toString() {
		return "ShoppingCart [訂購人=" + member 
				+ "\n, 購物明細= \n" + cart 
				+ String.format("\n共%s項, %s件, 總金額:%s元", size(), getTotalQuantity(),getTotalAmount())
				+ "]";
	}
		
}
