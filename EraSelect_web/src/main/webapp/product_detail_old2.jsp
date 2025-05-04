<%@page import="uuu.es.entity.Color"%>
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
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script>
			$(document).ready(init);
			function init(){
				$(".colorDiv img").on("click",changeColorDate);
			}
			function changeColorDate(){
// 				alert($(this).attr("title"));
				//修改畫面中指定位置的資料
				$("#thePhoto").attr("src",$(this).attr("data-photo-src"));
				$("#theReleaseDate").text($(this).attr("data-release-date"));
				$("#theColorStock").text("，剩" + $(this).attr("data-stock"));
				$("#thePrice").text($(this).attr("data-price"));
				$("#colorName").text($(this).attr("data-color-name"));
 				$("input[name=quantity]").attr("max",$(this).attr("data-stock")); //input只能輸入資料庫quantity數量
			}
		</script>
		<style>
			.productData>img{ /*div的第一個img*/
				float:left;
				width: 45%;
				margin: 1ex;
				max-width: 320px;
				
			}
			.productDataDiv{
				float:left;
				width:50%;
				max-width: 400px;
				
			}
			.productDes{
				clear: both;
				width: 85%;
				min-width: 40ex;
				margin: auto;
			}
			
			/* HIDE RADIO */
			.colorDiv input[type=radio] { /*複製過來前面要加class 不然其他的也會被改掉*/
			  position: absolute;
			  opacity: 0;
			  width: 1px;
			  height: 1px;
			}
			.sizeDiv input[type=radio] { /*複製過來前面要加class 不然其他的也會被改掉*/
			  position: absolute;
			  opacity: 0;
			  width: 1px;
			  height: 1px;
			}
			.colorDiv img{
				width: 45px;
				height:45px;
				vertical-align: middle;
			}
			
			/* IMAGE STYLES */
			.colorDiv input[type=radio] + img {
			  cursor: pointer;
			}
			
			/* CHECKED STYLES */
			.colorDiv input[type=radio]:checked + img {
			  outline: 2px solid silver;
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
				String productId = request.getParameter("productId");//request.getParameter("productId");
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
				<img id="thePhoto" src="<%= p.getPhotoUrl() %>">
				<div class="productDataDiv">
					<h3><span id="productName"><%= p.getName() %></span></h3>
					<div>上架日期:<span id="theReleaseDate"><%= p.getReleaseDate() %></span></div>
					<% if(p instanceof SpecialOffer){ %>
					<div>定價:<%= ((SpecialOffer)p).getListPrice() %></div>
					<% } %>
					<div>優惠價:<span id="thePrice"><%= p instanceof SpecialOffer ? ((SpecialOffer)p).getDiscountString():"" %> <%= p.getUnitPrice() %></span></div>
					<div>庫存: 共<%= p.getStock() %><span id="theColorStock"></span></div><hr>
						<form>
							<input type="hidden" name="productId" value="<%= p.getId() %>">
							
							
							<% if(p.getColorsList()!=null && p.getColorsList().size()>0){ %>
							<div class="colorDiv">
								<span id="colorName"></span><hr>
								<% for(int i=0;i<p.getColorsList().size();i++){ 
									Color color = p.getColorsList().get(i);
								%>
								<label>
									<input type="radio" name="color" value="<%= color.getColorName() %>" required>
									<img title="<%= color.getColorName() %>" 
										src="<%= color.getIconUrl() %>"
										data-photo-src="<%= color.getPhotoUrl() %>" 
<%-- 										data-price="<%= p.getUnitPrice() %>"  --%>
										data-release-date="<%= color.getReleaseDate() %>" 
										data-stock="<%= color.getStock() %>" 
										data-color-name="<%= color.getColorName() %>"> <!-- data-使用自訂義屬性 -->
								</label>
								<% } %>
							</div>
							<% } %>
							
							
							<div>
								<lable>數量:</lable>
								<input type="number" name="quantity" required min="1" max="<%= p.getStock() %>">
							</div>
							<div>
								<input type="submit" value="ADD TO CART">
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