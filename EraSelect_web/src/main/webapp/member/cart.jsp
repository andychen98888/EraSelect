<%@page import="uuu.es.service.ProductService"%>
<%@page import="uuu.es.entity.SpecialOffer"%>
<%@page import="uuu.es.entity.Customer"%>
<%@page import="uuu.es.entity.CartItem"%>
<%@page import="java.util.Set"%>
<%@page import="uuu.es.entity.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="apple-touch-icon" sizes="180x180" href="../favicon/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="../favicon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="../favicon/favicon-16x16.png">
		<link rel="manifest" href="../favicon/site.webmanifest">
		<link rel="mask-icon" href="../favicon/safari-pinned-tab.svg" color="#5bbad5">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#ffffff">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>EraSelect Cart</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
<!-- 		<link href="jquery-ui-1.14.0.custom/jquery-ui.css" rel="stylesheet">	 -->
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
<!-- 		<script type="text/javascript" src="jquery-ui-1.14.0.custom/jquery-ui.js"></script> -->
	
		<script type="text/javascript">
			function deleteButton(){
				var answer = confirm("您確定要移除此產品嗎?");
				if(answer==false){
					$(".deleteImgButton").attr("name",null)
				}
			}	
		
		</script>
		<style type="text/css">
		.titleH2{ 
			text-align: center; 
		} 
		.bodyH2,.productsListLinkDiv{
			text-align: center; 
			margin:auto;
		}
		article{
			font-size: 13px;
		}
		.emptyCart{
			display: flex;
			flex-direction: column;
		}
		#productsListLink{
			position: absolute;
			top:110px;
			left: 165px;
			font-size: 2em;
		}
		.productsListLinkDiv{
			background-image: url("../images/celebrate_icon.png");
			width: 500px;
			height: 500px;
			background-repeat: no-repeat;
   			background-size: cover;
   			display: flex;
   			flex-direction: column;
   			justify-content: center;
   			position: relative;
		}
			
/* ----------購物明細---------- */		
		#cartDetails {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 85%;
		  margin:auto;
		}
		#cartDetails td, #cartDetails th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		#cartDetails tr:nth-child(even){background-color: #f2f2f2;}
		#cartDetails tr:hover {background-color: #ddd;}
		#cartDetails tbody input[type=number]{width:5ex}
		#cartDetails caption {
		  padding-top: 12px;
		  padding-bottom: 12px;
/* 		  text-align: left; */
		  background-color: silver;
		  color: white;
		}
		
		.cartImg{
			width:40px;
/* 			float:left; */
			margin:1px;
			vertical-align: middle;
			
		}
		#deleteImg{
			width:20px;
			cursor: pointer;
		}
		.listPrice{
			text-decoration: line-through;
			color: #75757575;
		}
		.discountPrice{
			color: rgb(174, 0, 0);
		}
		.discountString{
			font-size: smaller;
		}
		.lastTr{
			text-align: right;
		}
		.productName{font-weight: bold}
		.buttonStyled{width: 115px;}
/* ----------購物明細---------- */
		</style>
	</head>
<body>
<%-- 	<jsp:include page="/subviews/header.jsp"><jsp:param value="購物車" name="subheader"/></jsp:include> --%>
	<%@include file="/subviews/header.jsp" %>
	<h3 class="titleH2">YOUR CART</h3>
	<article>
	
<%-- 	<p>購物車內容: ${sessionScope.cart}</p> --%>
<%-- 		${sessionScope.cart.setMember(sessionScope.member)} --%>
		<% 
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
			if(cart==null || cart.isEmpty()){
		%>
		<div class="emptyCart">
			<h2 class=bodyH2>購物車是空的</h2>
			<div class="productsListLinkDiv">
				<h1 id="productsListLink">請至<a href="../products_list_fix.jsp"> 賣場 </a>選購</h1>
			</div>
		</div>
		<% }else{ %>
		
<!-- 		加入購物車時帶入會員 -->
<%-- 		<% cart.setMember((Customer)session.getAttribute("member")); %> --%>
		${sessionScope.cart.setMember(sessionScope.member)}
<%-- 		<%= cart.getMember() %> --%>
<%-- 		<% if(cart.getMember()==null)cart.setMember(member); %> --%>
		
		<form action="update_cart.do" method="POST">
			<table id="cartDetails">
				<caption>購物明細</caption>
				<thead>
					<tr>
						<td>編號</td>
						<td>產品名稱</td>
						<td>顏色/規格</td>
						<td> 定價 / 折扣 / 售價 </td>
						<td>數量</td>
						<td>小計</td>
						<td>移除商品</td>
					</tr>
				</thead>
				<tbody>
				<% 
					ProductService pService = new ProductService();
					Set<CartItem> itemSet = cart.getCartItemsSet();
						for(CartItem item:itemSet){
							int stock = pService.getStockByProductIdColorNameSpecName(item.getProductId(), item.getColorName(), item.getSpecName());
							item.setStock(stock);
				%>
					<tr>
						<td><%= item.getProductId() %></td>
						<td>
							<a href="../product_detail.jsp?productId=<%= item.getProductId() %>">
							<img class="cartImg" src="<%= item.getPhotoUrl() %>">
							<span class="productName"><%= item.getProductName() %></span>
						</td>
						<td>
							<%= item.getColorName() %> <%= item.getSpecName() %>
							<% if(item.getStock()<=10){ %>
							<span class="stockShortage">庫存緊張!</span>
							<% }else{ %>
							<span class="stockSpan">庫存充足</span>
							<% } %>
							<% if(cart.getQuantity(item)>item.getStock()){ %>
							<span class="stockShortage">慢了一步!庫存還剩<%= item.getStock() %>件</span>
							<% } %>
							
<%-- 							<span class=<%= cart.getQuantity(item)>item.getStock() ?"stockShortage":"" %>>庫存<%= item.getStock() %>件</span> --%>
						</td>
						<td>
						
							<% if(item.getTheProduct() instanceof SpecialOffer){ %>
							<span class="listPrice">NT$<%= item.getListPrice() %></span>
							<span class="discountPrice">NT$<%= item.getPrice() %></span>
							<span class="discountString"> <%= item.getDiscountString() %> </span>
							<% }else{ %>
							<span class="discountPrice2">NT$<%= item.getPrice() %></span>
							<% } %>
						</td>
						<td>
							<input type="number" name="quantity<%= item.hashCode() %>" class=<%= cart.getQuantity(item)>item.getStock() ?"stockShortage":"" %> min="<%=item.getStock()==0?0:1 %>" max="<%=item.getStock()==0?0:item.getStock() %>" value="<%= cart.getQuantity(item) %>" required>
						</td>
						<td>
							<%= cart.getAmount(item) %>
						</td>
						<td>
<%-- 							<input type="checkbox" name="delete<%= item.hashCode() %>"> --%>
							<button type="submit" name="delete<%= item.hashCode() %>" onclick="deleteButton()" class="deleteImgButton"><img id="deleteImg" src="../images/delete_icon.png"></button>
						</td>
					</tr>
				<% } %>	
				</tbody>
				
				<tfoot>
					<tr class="lastTr">
						<td colspan="5">共<%= cart.size() %>項</td>
						<td colspan="1"><%= cart.getTotalQuantity() %>件</td>
						<td colspan="2">總金額: <%= cart.getTotalAmount() %></td>
					</tr>
					<tr class="lastTr">
						<td colspan="6">
							<input type="submit" value="更新購物車" class="buttonStyled">
						</td>
						<td colspan="1">
							<button type="submit" value="checkOut" name="submit" class="buttonStyled">立即結帳</button>
						</td> <!-- onclick="location.href='check_out.jsp';" -->

					</tr>
				</tfoot>
			</table>
		</form>
	<% } %>
	</article>
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>