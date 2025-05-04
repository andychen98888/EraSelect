<%@page import="uuu.es.entity.CartItem"%>
<%@page import="java.util.Set"%>
<%@page import="uuu.es.entity.ShoppingCart"%>
<%@ page contentType="application/json" pageEncoding="UTF-8"%>

{
	<%
	ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
	
	%>
	"totalQty": ${sessionScope.cart.getTotalQuantity()+0}
	,"cart":[
	<% 
		if(cart!=null && cart.size()>0){
			Set<CartItem> cartItemSet = cart.getCartItemsSet();
	%>
		{"id":1, "name":"8ball rug", "imgSrc":"", "color":"", "spec":"" , "qty":1},
		{"id":1, "name":"", "imgSrc":"", "spec":"" , "qty":1}
	<% } %>
		] 
}			