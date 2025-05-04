<%@page import="uuu.es.entity.SpecialOffer"%>
<%@page import="uuu.es.service.ProductService"%>
<%@page import="uuu.es.entity.Product"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
		<link rel="manifest" href="favicon/site.webmanifest">
		<link rel="mask-icon" href="favicon/safari-pinned-tab.svg" color="#5bbad5">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#ffffff">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>產品明細</title>
		<link rel="stylesheet" type="text/css" href="./style/es.css">
		<script>
		
		</script>
		<style>
			.productData img{
				float:left;
				width: 45%;
				margin: 1ex;
				max-width: 320px;
				
			}
			.productDataDiv{
				float:left;
				width:45%;
				max-width: 350px;
			}
			.productDes{
				clear: both;
				width: 85%;
				min-width: 40ex;
				margin: auto;
			}
		</style>
	</head>
	<body>
		<jsp:include page="./subviews/header.jsp">	
			<jsp:param value="Product Detail" name="subheader"/> 
		</jsp:include>
<%-- 		<%@include file="./subviews/nav.jsp" %> --%>
		<article>
			<%
				String productId = request.getParameter("productId");
				Product p =null;
				
				ProductService pService = new ProductService();
				if(productId!=null && (productId=productId.trim()).length()>0){
					p = pService.getProductById(productId);
				}
			%>
			<% if(p==null){ %>
			<h3>查無此代號產品(<%= productId %>)</h3>
			<% }else{ %>
			<div class="productData">
				<img src="<%= p.getPhotoUrl() %>">
				<div class="productDataDiv">
					<h3><%= p.getName() %></h3>
					<div>上架日期:<%= p.getReleaseDate() %></div>
					<% if(p instanceof SpecialOffer){ %>
					<div>定價:<%= ((SpecialOffer)p).getListPrice() %></div>
					<% } %>
					<div>優惠價:<%= p instanceof SpecialOffer ? ((SpecialOffer)p).getDiscountString():"" %> <%= p.getUnitPrice() %></div>
					<div>庫存:<%= p.getStock() %></div>
						<form>
							<input type="hidden" name="productId" value="<%= p.getId() %>">
							<div>
								<lable>數量:</lable>
								<input type="number" name="quantity" required min="1" max="<%= p.getStock() %>">
							</div>
							<div>
								<input type="submit" value="加入購物車">
							</div>
						</form>
				</div>
				<div class="productDes">
					<hr>
					<p><%= p.getDescription() %></p>
				</div>
			</div>
		<% } %>
		</article>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>