<!-- <%@page pageEncoding="UTF-8" %> -->
<%@page import="uuu.es.entity.SpecialOffer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.es.service.ProductService"%>
<%@page import="uuu.es.entity.Product"%>
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
		<meta charset="UTF-8">
		<title>產品清單</title>
		<link rel="stylesheet" type="text/css" href="style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
			
		<style>
			#productsListDiv{}
			.productItem{
				display:inline-block; 
				width:280px; 
				height: 380px; 
				vertical-align:top; 
				text-align: center; 
				box-shadow: gray 2px 2px 5px; 
				margin:5px; 
				padding:2px 1em
				} /*border:lime 1px solid;*/
			
			#productImg{
				background-size: cover;
         		background-position: center;
         		
/*  		 	background-image: url(); */
			}
			
			.productItem img{
				width: 180px;
				display:block;
				margin:auto;
				}
			.productItem div{} /* class要用. */
			#searchForm{text-align:right;} /* id要用# */
		</style>
		
			<script>
		
		</script>
	</head>
	<body>
		
		<article>
			<section >
				<div class="menu">
					<% request.setCharacterEncoding("UTF-8"); %>
					<jsp:include page="./subviews/header.jsp" />
<%-- 					<jsp:include page="./subviews/header.jsp">	 --%>
<%-- 						<jsp:param value="產品清單" name="subheader"/>  --%>
<%-- 					</jsp:include> --%>
<%-- 					<%@include file="./subviews/nav.jsp" %> --%>
				</div>
			</section>
			<%
				//1.取得request中的form data ;沒有寫servlet所以直接送給自己 //QuerString
				String latest = request.getParameter("latest");
				String category = request.getParameter("category");
				String keyword = request.getParameter("keyword");
				String discount = request.getParameter("discount");
				
				//2.呼叫商業邏輯
				ProductService pService = new ProductService();
				List<Product> list = null;
				if(keyword!=null && (keyword=keyword.trim()).length()>0){
					list = pService.getProductsByKeyword(keyword);
				}else if(latest!=null && (latest=latest.trim()).length()==0){
					list = pService.getLatestProducts();
				}else if(category!=null && (category=category.trim()).length()>0){
					list = pService.getProductsByCategory(category);
				}else if(discount!=null && (discount=discount.trim()).length()==0){
					list = pService.getProductsByDiscount();
				}else{
					list = pService.getAllProducts();
				}
				
				//若查無資料
				if(list==null || list.size()==0){
			%>
				<span id="searchFailImg"><img src="images/search_fail.png"><h1>查無資料</h1></span>
			<% }else{ %>
	<%-- 			<%= list %> --%>
				<div id="productsListDiv">
					<% 
					for(int i=0;i < list.size();i++){ 
						Product p = list.get(i);
					%>
						<div class="productItem">
						
							<a href="product_detail.jsp?productId=<%= p.getId() %>"><img src="<%= p.getPhotoUrl() %>"></a>
							<a href="product_detail.jsp?productId=<%= p.getId() %>"><h4><%= p.getName() %></h4></a>
							
							<div>
								<span class="listPrice"><%= p instanceof SpecialOffer?((SpecialOffer)p).getDiscountString():"" %></span>
								<span class="discountPrice"> NT$<%= p.getUnitPrice() %></span>
							</div>
						</div>
					<% } %>
					<!-- <div class="productItem">
						<img src="https://www.stussy.com/cdn/shop/files/1905039_CAMO_1.jpg?v=1724178017&width=800">
						<h4>SMOOTH INTERNATIONAL TEE</h4>
						<div>$1,861</div> -->
				</div>
			<% } %>
		</article>
<!-- 	include載入檔案 ./上一層 -->
		<%@include file="./subviews/footer.jsp" %>
		
	</body>
</html>