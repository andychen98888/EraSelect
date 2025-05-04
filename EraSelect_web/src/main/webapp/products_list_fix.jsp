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
		<title>Products List</title>
		<link href="jquery-ui-1.14.0.custom/jquery-ui.css" rel="stylesheet">	
		<link rel="stylesheet" type="text/css" href="style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="jquery-ui-1.14.0.custom/jquery-ui.js"></script>
		
		<style>
			.productListALL{
				display: flex;
				justify-content: center; 
				height: 100%;
			}
			#productsListDiv{
				display: flex;
/* 				align-items: center; */
/* 				justify-content: center; */
				flex-wrap: wrap;
				width: 1480px;
			}
			#searchFailImg{
				display: block;
				text-align: center;
			}
			.productItem{
				display:inline-block; 
				width:360px; 
				height: 500px; 
				vertical-align:top; 
				margin: 5px; 
				cursor: pointer;
				font-size: 12px;	
				position: relative;			
			} /*border:lime 1px solid;*/
			.productItem img{
				width: 360px;
 				height: 400px; 
				display:block;				
 				margin-left: auto; 
   				margin-right: auto; 
   				width: 100%; 
   				
   				object-fit: cover; /* 讓圖片不要變形 */
			}
			.productItem:hover{
/* 				background-color: lightgray; */
/* 				box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); 	 */
			}
			.listPrice{
				text-decoration: line-through;
				color: #75757575;
			}
			
			.unitPrice{
 				color: rgb(174, 0, 0); 
			}
			.listPrice,.unitPrice,.unitPrice2{
				font-size: 15px;
			}
			.addToCartImg img{
				width: 50px;
				height: 50px;
				position: absolute;
				left: 295px;	
   				top: 440px;
			}
/* --------------- 商品圖片 下滑畫面--------------- */
			.container {
			  position: relative;
			  width: 100%;
			}
			.overlay {
			  position: absolute;
			  bottom: 100%;
			  left: 0;
			  right: 0;
			  background-color: #757575;
			  overflow: hidden;
			  width: 100%;
			  height: 0;
			  transition: .5s ease;
			  opacity: 0.8;
			}
			.container:hover .overlay {
			  bottom: 0;
			  height: 100%;
			}
			.text {
			  white-space: nowrap; 
			  color: white;
			  font-size: 20px;
			  position: absolute;
			  overflow: hidden;
			  top: 50%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  -ms-transform: translate(-50%, -50%);
			}
/* --------------- 商品圖片 下滑畫面--------------- */
/* ==================== 手風琴選單 ====================*/
		#myAccordion {
			width: 320px;
		}

		#myAccordion>* {
/* 			border: 1px solid gray; */
 			margin: 0px; 
		}
		
		.accordionTitle {
			cursor: pointer;
			font-size: 1.4em;
			text-align: center;
			color: white;
/* 			border: 1px solid gray; */
		}

		.accordionContent {
/* 			background-color: #eee; */
			overflow: hidden;
			height: 0px;
			transition: height 0.4s ease-out;
		}

		.contentHeight {
			height: 300px;
			/*height: auto;*/
		}

		.accordionContent p {
			font-size: 1.2em;
/* 			display: inline-block; */
			width: calc(100% - 200px);
		}
		.showHide{
			height:0px;
		}
		
		#accordionDiv{
			display: inline-block;
			width: 125px;
			height: 20px;
			margin: 5px;
			padding: 5px 10px;
			border: 1px gray solid;
 			text-align: center; 
 			line-height: 20px;
			cursor: pointer;
			font-size: 15px;
			color: #757575;
		}
		#accordionDiv:hover{
			color: black;
			background-color: lightgray;
		}
		.accordionDataDiv h1{
			margin: 5px; 
		}
		.accordionDataDiv {
		    margin: 0 20px; /* 为了让两个部分有间隔，可以根据需要调整 */
		}
		.pricebutton{
			width: 148px;
			margin: 5px;
		}
		#accordionPriceInput input{
			width: 143px;
			width: 290px;
			height: 35px;
			margin: 5px;
		}

/* ==================== 手風琴選單 ====================*/
		</style>
		<script>
		//手風琴標題元件正常背景顏色
		var accordionBgNormal = "#999";
		//手風琴標題元件選取背景顏色
		var accordionBgSelected = "#333";
		//手風琴標題元件滑鼠滑過背景顏色
		var accordionBgHover = "#666";
		//儲存目前選取的索引號碼
		var accordionIndex = 0;
		$(document).ready(init);
		function init(){
			$(".menu3").tooltip({ //提示視窗
				//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
				show: {effect: "slideDown", duration: 400},
				hide: {effect: "slideUp", duration: 400},
				tooltipClass: "myStyle", //抓取指定class裡面的css並套用
			});
			//手風琴選單
			$(".accordionContent").css("height", "255px"); //一開始全部打開
			$(".accordionTitle").click(accordionTitleClickHandler);
			$(".accordionTitle").mouseenter(accordionTitleMouseenterHandler);
			$(".accordionTitle").mouseleave(accordionTitleMouseleaveHandler);
			$(".accordionTitle").css("backgroundColor", accordionBgNormal);
			$(".accordionTitle").each(function (index){
				$(this).attr("accordionIndex", index);
			})
			$(".accordionTitle:eq("+accordionIndex+")").css("backgroundColor", accordionBgSelected);
			$(".accordionContent:eq("+accordionIndex+")").css("height","255px");
		}
		//手風琴選單
		function accordionTitleClickHandler(){
			accordionIndex = $(this).attr("accordionIndex");
			$(".accordionTitle").css("backgroundColor", accordionBgNormal);
			$(this).css("backgroundColor", accordionBgSelected);
			//$(".accordionContent").css("height","0px"); //一開始收合
			//$(this).next().css("height","300px");
			
			if($(this).next().css("height") > "150px"){ //if($(this).next().css("height") == "300px")因為二進位問題 沒辦法滿足等於300約299..... 縮放畫面會時會出錯
				$(this).next().css("height","0px");
			}else{
				$(this).next().css("height","250px");
			}
			
		}
		function accordionTitleMouseenterHandler(){
			if($(this).attr("accordionIndex") != accordionIndex){
				$(this).css("backgroundColor", accordionBgHover);
			}
		}
		function accordionTitleMouseleaveHandler(){
			if($(this).attr("accordionIndex") != accordionIndex){
				$(this).css("backgroundColor", accordionBgNormal);
			}
		}
		//ajax lightbox cart
		function ajaxGetProductDetail(pid){
// 			alert("product_ajax.jsp?productId=" + pid); //for test
			$.ajax({
				url: "product_ajax.jsp?productId=" + pid,
				method:"GET"
			}).done(ajaxGetProductDetailDoneHandler);				
		}
		
		function ajaxGetProductDetailDoneHandler(result, status, xhr){
// 			alert(result); //for test
			showHandler(result);
		}
		</script>
	</head>
	<body>
		<article>
			<section >
					<% request.setCharacterEncoding("UTF-8"); %>
					<jsp:include page="./subviews/header.jsp" />
			</section>
		<div class="productListALL">
			<div class="accordionDataDiv">
				<h1>FILTER</h1>
				<div id="myAccordion">
					<!--標題元件　class="accordionTitle"-->
					<h3 class="accordionTitle">BRAND</h3>
					<!--內容元件　class="accordionContent"-->
					<div class="accordionContent">
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=AKIMBO"><span id="accordionDiv">AKIMBO</span></a>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=ACNE STUDIOS"><span id="accordionDiv">ACNE STUDIOS</span></a>
						<span id="accordionDiv">BIRKEN STOCK</span>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=CARHARTT"><span id="accordionDiv">CARHARTT</span></a>
						<span id="accordionDiv">Danner Mountain</span>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=en route"><span id="accordionDiv">en route</span></a>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=IDA"><span id="accordionDiv">IDA</span></a>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=LV"><span id="accordionDiv">LV</span></a>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=Rick Owens"><span id="accordionDiv">Rick Owens</span></a>
						<span id="accordionDiv">Salomon</span>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=STUSSY"><span id="accordionDiv">STUSSY</span></a>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=TWOJEYS"><span id="accordionDiv">TWOJEYS</span></a>	
					</div>
					
					<h3 class="accordionTitle">PRICE</h3>
					<div class="accordionContent">
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?ASC="><button class="buttonStyled pricebutton">price&#x25B2;</button></a>
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?DESC="><button class="buttonStyled pricebutton">price&#x25BC;</button></a>
						<form class="priceSearchForm" action="<%= request.getContextPath() %>/products_list_fix.jsp" method="GET">
							<span id="accordionPriceInput"><input type="search" name="minPrice" required value="${param.minPrice}" id="accordionDiv"></span>~
							<span id="accordionPriceInput"><input type="search" name="maxPrice" required value="${param.maxPrice}" id="accordionDiv"></span>
							<button type="submit" class="priceSerchButton">search</button>
						</form>
					</div>
					
					<h3 class="accordionTitle">DEPARTMENT</h3>
					<div class="accordionContent">
						<span id="accordionDiv">BAGS</span>
						<span id="accordionDiv">BARCELET</span>
						<span id="accordionDiv">CAPS</span>
						<span id="accordionDiv">DENIM</span>
						<span id="accordionDiv">HOOIES</span>
						<span id="accordionDiv">JACKETS</span>
						<span id="accordionDiv">JORTS</span>
						<span id="accordionDiv">KNITS</span>
						<span id="accordionDiv">NACKLACE</span>
						<span id="accordionDiv">RINGS</span>
						<span id="accordionDiv">SHORTS</span>
						<span id="accordionDiv">T-SHIRTS</span>
					</div>
			
					<h3 class="accordionTitle">COLOR</h3>
					<div class="accordionContent">
						<span id="accordionDiv">BLACK</span>
						<span id="accordionDiv">BLUE</span>
						<span id="accordionDiv">BROWN</span>
						<span id="accordionDiv">GREEN</span>
						<span id="accordionDiv">GOLD</span>
						<span id="accordionDiv">GRAY</span>
						<span id="accordionDiv">ORANGE</span>
						<span id="accordionDiv">PINK</span>
						<span id="accordionDiv">PURPLE</span>
						<span id="accordionDiv">RED</span>
						<span id="accordionDiv">SILVER</span>
						<span id="accordionDiv">WHITE</span>
					</div>
			
					<h3 class="accordionTitle">CLOTHING SIZE</h3>
					<div class="accordionContent">
						<span id="accordionDiv">XXS</span>
						<span id="accordionDiv">XS</span>
						<span id="accordionDiv">S</span>
						<span id="accordionDiv">M</span>
						<span id="accordionDiv">L</span>
						<span id="accordionDiv">XXL</span>
						<span id="accordionDiv">28</span>
						<span id="accordionDiv">30</span>
						<span id="accordionDiv">32</span>
						<span id="accordionDiv">34</span>
						<span id="accordionDiv">36</span>
						<span id="accordionDiv">38</span>
					</div>
					
					<h3 class="accordionTitle">FOOTWEAR SIZE</h3>
					<div class="accordionContent">
						<span id="accordionDiv">40</span>
						<span id="accordionDiv">41</span>
						<span id="accordionDiv">42</span>
						<span id="accordionDiv">43</span>
						<span id="accordionDiv">44</span>
						<span id="accordionDiv">45</span>
						<span id="accordionDiv">US8</span>
						<span id="accordionDiv">US8.5</span>
						<span id="accordionDiv">US9</span>
						<span id="accordionDiv">US9.5</span>
						<span id="accordionDiv">US10</span>
						<span id="accordionDiv">US10.5</span>
					</div>
									
				</div>
			</div>


			<%
				//1.取得request中的form data ;沒有寫servlet所以直接送給自己 //QuerString
				String latest = request.getParameter("latest");
				String category = request.getParameter("category");
				String keyword = request.getParameter("keyword");
				String discount = request.getParameter("discount");
				String ASC = request.getParameter("ASC");
				String DESC = request.getParameter("DESC");
				String minPrice = request.getParameter("minPrice");
				String maxPrice = request.getParameter("maxPrice");
				
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
				}else if(ASC!=null && (ASC=ASC.trim()).length()==0){
					list = pService.getProductsByASC();
				}else if(DESC!=null && (DESC=DESC.trim()).length()==0){
					list = pService.getProductsByDESC();
				}else if(minPrice != null && !minPrice.isEmpty() && maxPrice != null && !maxPrice.isEmpty()){
					list = pService.getProductsByPrice(minPrice, maxPrice);
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
							<div class="container"> <!-- 商品圖片 下滑畫面 -->
								<a href="product_detail.jsp?productId=<%= p.getId() %>"><img src="<%= p.getPhotoUrl() %>">
									<div class="overlay">
									    <div class="text">CHECK OUT</div>
									</div>
								</a>
							</div>
							
							<div class="productName">
								<a href="product_detail.jsp?productId=<%= p.getId() %>"><h3><%= p.getName() %></h3></a>
							</div>
							<div>
								<% if(p instanceof SpecialOffer){ %>
								<span class="listPrice"> NT$<%= ((SpecialOffer)p).getListPrice() %></span>
								<span class="unitPrice"> NT$<%= p.getUnitPrice() %></span>
								<div><span class="discountString"><%= p instanceof SpecialOffer?((SpecialOffer)p).getDiscountString():"" %></span></div>
								<% }else{ %>
								<span class="discountString"><%= p instanceof SpecialOffer?((SpecialOffer)p).getDiscountString():"" %></span>
								<span class="unitPrice2"> NT$<%= p.getUnitPrice() %></span>
								<% } %>
								<a href="javascript:ajaxGetProductDetail(<%= p.getId() %>)"> <!-- ajax+lightbox -->
									<span class="addToCartImg"><img src="./images/buy_cart_icon.png"></span>
								</a>
							</div>
						</div>
					<% } %>
				</div>
			<% } %>
			</div>
		</article>
<!-- 	include載入檔案 ./上一層 -->
		<%@include file="./subviews/footer.jsp" %>
		<%@include file="./subviews/light_box.jsp" %>	
	</body>
</html>