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
		<link href="jquery-ui-1.14.0.custom/jquery-ui.css" rel="stylesheet">	
		<link rel="stylesheet" type="text/css" href="style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="jquery-ui-1.14.0.custom/jquery-ui.js"></script>
		
		<script>
			//設定正常標題的背景顏色
			var tabBgNormal = "#eee";
			//設定選擇標題的背景顏色
			var tabBgSelected = "silver";
			//設定滑過標題的背景顏色
			var tabBgHover = "#656565";
			//儲存目前選則的標題索引號碼
			var tabZIndex = 0;

			$(document).ready(init);
			function init(){
				$(".colorDiv img").on("click",changeColorDate);
				$("select[name=spec]").on("change",changeSpecData); //尺寸option
// 				$(".specDiv").on("click",changeSpecData);  	//尺寸radio OK
				
// 				$("input[name=color]:first").prop("checked",true) //自動選到第一個顏色
				$(".iconImg:first").trigger("click");			  //自動選到第一個顏色		
				
				//數量+-button
				$("#quantityUpButton").click(quantityUpnHandler);
		    	$("#quantityDownButton").click(quantityDownHandler);
		    	
		    	$(".menu3").tooltip({ //提示視窗
					//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
					show: {effect: "slideDown", duration: 400},
					hide: {effect: "slideUp", duration: 400},
					tooltipClass: "myStyle", //抓取指定class裡面的css並套用
				});
				//=========tabs===========
				$(".tab").click(tabClickHandler);
		    	$(".tab").mouseenter(tabMouseenterHandler);
				$(".tab").mouseleave(tabMouseleaveHandler);
				$(".tab").css("backgroundColor", tabBgNormal);
				$(".tab").each(function (index){ //each迴圈
					$(this).attr("tabZIndex", index); //用迴圈帶入tab z-index的值
				})
				$(".tab:eq("+tabZIndex+")").css("backgroundColor", tabBgSelected);
				
				//加入購物車動畫
				$("#addToCartButton").click(addHandler);
			}
			
			//加入購物車動畫
			function addHandler(e){
				e.preventDefault(); // 防止立即提交表单
				// 檢查 select 是否有选中项
			    if ($("select[name=spec]").val() === "") {
			        alert("請先選擇尺寸"); 
			        return; // 不继续执行后面的代码
			    }
				$("#animate").animate({"width":"400px"},900)
							.delay(1000)
							.animate({"width":"0px"},900, function() {
					            // 動畫完成后，再用一個function提交表单
					            $(e.target).closest("form").submit(); //提交表单
					        });
			}
			//tab背景顏色
			function tabClickHandler(){
				tabZIndex = $(this).attr("tabZIndex");
				$(".tab").css("backgroundColor", tabBgNormal);
				$(this).css("backgroundColor", tabBgSelected);
			}
			function tabMouseenterHandler(){
				if($(this).attr("tabZIndex") != tabZIndex){
					$(this).css("backgroundColor", tabBgHover);
				}
			}
			function tabMouseleaveHandler(){
				if($(this).attr("tabZIndex") != tabZIndex){
					$(this).css("backgroundColor", tabBgNormal);
				}
			}
			
			function changeColorDate(){
// 				alert($(this).attr("title"));
// 				var releaseDate = $(this).attr("data-release-date");
				var photoUrl = $(this).attr("data-photo-src");
				var stock = $(this).attr("data-stock");
				var colorName = $(this).attr("data-color-name");
				
				//修改畫面中指定位置的資料
// 				$("#theReleaseDate").text(releaseDate);
// 				$("#thePrice").text($(this).attr("data-price"));
				$("#thePhoto").attr("src",photoUrl);	
				$("#theColorStock").text("，剩 [" + stock + "]");
				$("#theSpecStock").text("");
				$("#colorName").text(colorName);
 				$("input[name=quantity]").attr("max",$(this).attr("data-stock")); //input只能輸入資料庫quantity數量
 				
//  				$("".specSelect").hide();
//  				$("#spec"+$(this).attr("title")).show();
				ajaxGetSpecsOption(colorName);
			}
			
			function ajaxGetSpecsOption(colorName){
				//Ajax請求 get_color_specs.jsp
				var productId = $("input[name=productId]").val(); //重要
				
				$.ajax({
					url:"get_color_specs.jsp?colorName="+ colorName + "&productId=" + productId, //相對路徑
					method:"GET"
				}).done(ajaxGetSpecsOptionDone);
			}
			function ajaxGetSpecsOptionDone(result, status, xhr){ //回呼涵式
// 				alert(result);
				$("select[name=spec]").html(result); //尺寸option
// 				$(".specDiv").html(result);	 //尺寸radio
// 				alert(result);
			}
			
			function changeSpecData(){
// 				alert("changeSpecData: "+ $("select[name=spec] option:selected").attr("data-stock"));
// 				alert(1);
				var stock = $("select[name=spec] option:selected").attr("data-stock"); //select用this抓不到  //尺寸option
				var listPrice = $("select[name=spec] option:selected").attr("data-list-price");				//尺寸option
				var price = $("select[name=spec] option:selected").attr("data-price");						//尺寸option
// 				var stock = $("input[name=spec]:checked").attr("data-stock"); 						//尺寸radio
// 				var listPrice = $("input[name=spec]:checked").attr("data-list-price");				//尺寸radio
// 				var price = $("input[name=spec]:checked").attr("data-price");						//尺寸radio
				//修改畫面中指定位置的資料
				$("input[name=quantity]").attr("max",stock);
				$("#theListPrice").text(listPrice);
				$("#thePrice").text(price);
				$("#theSpecStock").text(" [" + stock + "]");
			}
			
			//數量+-
			function quantityUpnHandler(){
// 				alert(1);
				var quantityInput = $("input[name='quantity']");
				var quantity = Number(quantityInput.val());
				var max = Number(quantityInput.attr("max"));
				if(quantity < max){
					quantityInput.val(quantity+1);
				}
			}
			function quantityDownHandler(){
// 				alert(2);
				var quantityInput = $("input[name='quantity']");
				var quantity = Number(quantityInput.val());
				var min = Number(quantityInput.attr("min"));
				if(quantity > min){
					quantityInput.val(quantity-1);
				}
			}
			
		</script>
		<style>
			.productData{
				vertical-align: middle;
			}
			.productDataDiv{
 				width:70%; 
/* 				max-width: 400px; */
 				display: flex; 
 				margin: auto; 
			}
			.photoDiv>img{ /*div的第一個img*/
/* 				width: 500px; */
				margin: 1ex 2ex;
				max-width: 450px;
				
			}
			.productDes{
				min-width: 40ex;
				margin: auto;
			}		
			.productDataDiv2{
				width:85%;
				padding: 0px 2ex 0px 0px;
			}
			.iconImg{
				object-fit: cover;
			}
/*====================價格css==================== */
			#theListPrice{
				text-decoration: line-through;
				color: #75757575;
			}
			#theDiscountString{
				font-size: smaller;
			}
			.theUnitPrice{
				color: rgb(174, 0, 0);
			}
			#theSpecStock{
				color: #75757575;
			}
/*====================價格css==================== */			
/*==============color spec CSS=====================*/
			/* HIDE RADIO */
			.colorDiv input[type=radio] { /*複製過來前面要加class 不然其他的也會被改掉*/
			 	position: absolute;
			 	opacity: 0;
				width: 1px;
				height: 1px;
			}
			.specDiv input[type=radio] { /*複製過來前面要加class 不然其他的也會被改掉*/
				 position: absolute;
				 opacity: 0;
				 width: 1px;
				 height: 1px;
			}
			.colorDiv img{
				width: 55px;
				height:55px;
				vertical-align: middle;
			}
			
			/* IMAGE STYLES */
			.colorDiv input[type=radio] + img {
			  	cursor: pointer;
			}
			.specDiv input[type=radio] + span{
			  	cursor: pointer;
			}
			
			/* CHECKED STYLES */
			.colorDiv input[type=radio]:checked + img{
			  	outline: 2px solid silver;
			}
			.specDiv input[type=radio]:checked + span {
			 	outline: 2px solid silver;
			}
/*==============color spec CSS=====================*/		
/* ===============產品明細分頁=============== */
			#tabs{
				padding:0;
				margin:0;
			}
			#tabs li{
				list-style:none;
				float:left;
				padding: 0px;
				margin:0px -40px -5px 5px;
			}
			a.tab{
/* 				border: 1px solid silver; */
				padding:5px;
	 			border-radius: 8px; 
				background: #eee;
				display: inline-block;
				width: 130px;
				box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
			#container{
				clear:both;
				position:relative;
			}
			.tab_content,.tab_content img{
				width: 540px; 
				height: 210px;
				padding: 10px;
				position: absolute;
				left: 0px;
				top: 0px;
/**/ 			background: #eee; 
				border-radius: 8px; 
			}
 			.tab_content:target,#tab1{ 
 				z-index:1; 
 			} 
			#tabsOuter{
				height:260px;
			}
/* ===============產品明細分頁=============== */
/* --------------- 加入購物車動畫 --------------- */
			#animate{
			width: 0px; /* 400px */
			height: 40px;
			background: orange;
			background: #757575;
			color: white;
			border-radius: 25px;
 			text-align: center; 
			font-size: 25px;
			line-height: 40px;
			margin: auto;
			overflow: hidden;
			white-space: pre;
/* 			display: flex; */
/* 			justify-content: center; */
/* 			align-items: center; */
			}
/* --------------- 加入購物車動畫 --------------- */
		</style>
	</head>
	<body>
		<jsp:include page="./subviews/header.jsp">	
			<jsp:param value="Product Detail" name="subheader"/> 
		</jsp:include>
<%-- 		<%@include file="./subviews/nav.jsp" %> --%>
		<div id="animate">加入購物車成功!</div>
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
			
				<div class="productDataDiv">
					<div class="photoDiv">
						<img id="thePhoto" src="<%= p.getPhotoUrl() %>">
					</div>
					<div class="productDataDiv2">
					
						<h3><span id="productName"><%= p.getName() %></span></h3>
	<%-- 					<div>上架日期:<span id="theReleaseDate"><%= p.getReleaseDate() %></span></div> --%>
						<% if(p instanceof SpecialOffer){ %>
							<h4>
								<span id="theListPrice"> NT$<%= ((SpecialOffer)p).getListPrice() %></span>
								<span id="thePrice">
									<span class="theUnitPrice"> NT$<%= p.getUnitPrice() %> </span>
									<span id="theDiscountString"> <%= p instanceof SpecialOffer ? ((SpecialOffer)p).getDiscountString():"" %></span>
								</span>
							</h4>
						<% }else{ %>
							<span id="thePrice">
								<h4>
									<span class="theUnitPrice2"> NT$<%= p.getUnitPrice() %></span>
								</h4>
							</span>
						<% } %>
							<div>庫存: 共 <%= p.getStock() %>
								<span id="theColorStock"></span>
							</div>
							<hr>
							<form action="add_to_cart.do" method="POST">
								<input type="hidden" name="productId" value="<%= p.getId() %>">
								<% if(p.getColorsList()!=null && p.getColorsList().size()>0){ %>
								<div class="colorDiv">
									<label id="colorName"></label><br>
									<% for(int i=0;i<p.getColorsList().size();i++){ 
										Color color = p.getColorsList().get(i);
									%>
									<label>
										<input type="radio" name="color" value="<%= color.getColorName() %>" required>
										<img class="iconImg" 
											title="<%= color.getColorName() %>" 
											src="<%= color.getIconUrl() %>"
											data-photo-src="<%= color.getPhotoUrl() %>" 
	<%-- 										data-price="<%= p.getUnitPrice() %>"  --%>
	<%-- 										data-release-date="<%= color.getReleaseDate() %>"  --%>
											data-stock="<%= color.getStock() %>" 
											data-color-name="<%= color.getColorName() %>"> <!-- data-使用自訂義屬性 -->
									</label>
									<% } %>
								</div><hr>
								<% } %>
								<!-- 判斷有無規格資料 -->
								<% if(p.getSpecCount()>0){ %>
								<div class="specDiv">
									<div id="sizeName">尺寸</div>
									<select name="spec" required class="specSelect" required>
										<option></option>
									</select>
									<span id="theSpecStock"></span>
								</div>
								<hr>	
<!-- 								<div id="sizeName">尺寸</div> -->
<!-- 								<div class="specDiv"> -->
<!-- 									<label> -->
<!-- 										<input type="radio" name="spec" required> -->
<!-- 										<span></span> -->
<!-- 									</label> -->
<!-- 								</div> -->
<!-- 								<hr> -->
								<% } %>
								
								<div>
									<lable>數量</lable>
									<div>
										<input type="button" id="quantityDownButton" value="-">
										<input type="number" name="quantity" required min="1" value="1" max="<%= p.getStock() %>">
										<input type="button" id="quantityUpButton" value="+">
									</div>
								</div>
								<p>
									<input type="submit" value="ADD TO CART" class="buttonStyled" id="addToCartButton">
								</p>
							</form>
						<div id="tabsOuter">
							<ul id="tabs">
						        <li><a href="#tab1" class="tab" id="tab1id">商品特色</a></li>
						        <li><a href="#tab2" class="tab" id="tab2id">尺寸建議</a></li>
						        <li><a href="#tab3" class="tab" id="tab3id">注意事項</a></li>
						    </ul>
							<div id="container">
								<div id="tab1" class="tab_content productDes">
									<p><%= p.getDescription() %></p>
								</div>
								<div id="tab2" class="tab_content">
									<img src="https://www.gu-global.com/tw/public/gutw/feature/sizechart/img/01_t1.jpg">
								</div>
								<div id="tab3" class="tab_content">
									<p>網路商城為獨立系統與門市會員限量商品購買方式不同標示為限量商品款式，該品項不分顏色、尺寸，同一個會員帳號僅可購買一件(ㄧ雙)
									，超過一件(ㄧ雙)以上或重複購買者，該筆訂單將會直接取消，本公司保留接單與否權利。
									注意：即使尺寸相同，某些鞋款可能會因不同品牌、鞋型、材質而造成穿著感受上的些微差異
									，如需了解實著腳感，建議至實體店鋪試穿
									放入購物車不代表有購買完成，須將訂單送出，收到訂單確定通知Mail為準。
									目前無提供離島或海外配送服務</p>
								</div>
							</div>
						</div>
						
						
					</div>
					
				</div>
				
			</div>
			
			<script>
				<% if(p.getColorsList().size()==0 && p.getSpecCount()>0){%>
// 				alert("帶入規格");
				ajaxGetSpecsOption("");
				<% } %>
			</script>
		<% } %>
		</article>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>