<%@page import="uuu.es.entity.Color"%>
<%@page import="uuu.es.entity.SpecialOffer"%>
<%@page import="uuu.es.service.ProductService"%>
<%@page import="uuu.es.entity.Product"%>
<%@ page pageEncoding="UTF-8"%>
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
// 		$(".iconImg:first").trigger("click");			  //自動選到第一個顏色		
		
		//數量+-button
		$("#quantityUpButton").click(quantityUpnHandler);
    	$("#quantityDownButton").click(quantityDownHandler);
    	
    	$(".menu3").tooltip({ //提示視窗
			//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
			show: {effect: "slideDown", duration: 400},
			hide: {effect: "slideUp", duration: 400},
			tooltipClass: "myStyle", //抓取指定class裡面的css並套用
		});
		
		}
	
		//加入購物車動畫
		function addHandler(e){
		    if ($("select[name=spec]").val() === "") {
		        return; // 不继续执行后面的代码
		    }
			$("#animate").animate({"width":"400px"},900)
						.delay(1000)
						.animate({"width":"0px"},900);
		}
		
		function changeColorDate(){
			var photoUrl = $(this).attr("data-photo-src");
			var stock = $(this).attr("data-stock");
			var colorName = $(this).attr("data-color-name");
			
			//修改畫面中指定位置的資料
			$("#thePhoto").attr("src",photoUrl);	
			$("#theColorStock").text("，剩 [" + stock + "]");
			$("#colorName").text(colorName);
				$("input[name=quantity]").attr("max",$(this).attr("data-stock")); //input只能輸入資料庫quantity數量
				
				// 更新color庫存狀態消息
				if (stock > 10) {
			        $(".changeColorStockSpan").text("庫存充足").removeClass("stockShortage").addClass("stockSpan");
			    } else {
			        $(".changeColorStockSpan").text("庫存緊張!").removeClass("stockSpan").addClass("stockShortage");
			    }

			ajaxGetSpecsOption(colorName);
// 			return false;
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
			$("select[name=spec]").html(result); //尺寸option
			
			$("select[name=spec]>option").click(cancelClick); //for firefox bug
		}
		
		function cancelClick(e){
			e.preventDefault();
			return false;
		}
		
		function changeSpecData(){
			var stock = $("select[name=spec] option:selected").attr("data-stock"); //select用this抓不到  //尺寸option
			var listPrice = $("select[name=spec] option:selected").attr("data-list-price");				//尺寸option
			var price = $("select[name=spec] option:selected").attr("data-price");						//尺寸option
			//修改畫面中指定位置的資料
			$("input[name=quantity]").attr("max",stock);
			$("#theListPrice").text(listPrice);
			$("#thePrice").text(price);
			$("#theSpecStock").text(" [" + stock + "]");
			
			// 更新spec庫存狀態消息
//				if (stock > 10) {
//			        $(".changeSpecStockSpan").text("庫存充足").removeClass("stockShortage").addClass("stockSpan");
//			    } else {
//			        $(".changeSpecStockSpan").text("庫存緊張!").removeClass("stockSpan").addClass("stockShortage");
//			    }
		}
		
		//數量+-
		function quantityUpnHandler(){
			var quantityInput = $("input[name='quantity']");
			var quantity = Number(quantityInput.val());
			var max = Number(quantityInput.attr("max"));
			if(quantity < max){
				quantityInput.val(quantity+1);
			}
		}
		function quantityDownHandler(){
			var quantityInput = $("input[name='quantity']");
			var quantity = Number(quantityInput.val());
			var min = Number(quantityInput.attr("min"));
			if(quantity > min){
				quantityInput.val(quantity-1);
			}
		}
		
		var notAjax = false;
		function sendAjaxAddToCart(){
			//自行送出ajax非同步請求
			if(!notAjax){
				$.ajax({
					url: $("#cartForm").attr("action"),
					method: $("#cartForm").attr("method"),
					data: $("#cartForm").serialize()
				}).done(sendAjaxAddToCartDoneHandler);
			}
			addHandler();
			//取消同步請求
			return notAjax;
		}
		function sendAjaxAddToCartDoneHandler(result, status, xhr){
			$(".totalQtySpan").text(result.totalQty);//帶入購買總數量
		}
	</script>
	<style>
			.productData{
				vertical-align: middle;
			}
			.productDataDiv{
 				width:70%; 
 				max-width: 700px; 
 				display: flex; 
 				margin: auto; 
			}
			.photoDiv>img{ /*div的第一個img*/
/* 				width: 500px; */
				margin: 1ex 2ex;
				max-width: 300px;
				
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
			.stockSpan{
				margin-left: 10px;
				font-weight: bold;
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
			}
/* --------------- 加入購物車動畫 --------------- */
		</style>	
</head>
<body>
		<jsp:include page="./subviews/header.jsp">	
			<jsp:param value="Product Detail" name="subheader"/> 
		</jsp:include>
		<div id="animate">加入購物車成功!</div>
		<% //1.取得request中的queryString
			String productId = request.getParameter("productId");//request.getParameter("productId");//
			Product p =null;
			ProductService pService = new ProductService();
			if(productId!=null && (productId=productId.trim()).length()>0){
				p = pService.getProductById(productId);
			}
			
			Color c = null;
		    if (p != null && p.getColorsList() != null && !p.getColorsList().isEmpty()) {
		        c = p.getColorsList().get(0);
		    }
		%>
		<% if( p==null){ %>
			<h3>查無此代號的產品(<%= productId%>)</h3>
		<%}else{ %>
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
								<% if(p.getSpecCount()<1){ %>
									<% if(p.getColorsList().size()<1){ %>
										<% if(p.getStock()>10){ %>
										<span class="stockSpan">庫存充足</span>
										<% }else{ %>
										<span class="stockShortage">庫存緊張!</span>
										<% } %>
									<% }else{ %>
										<% if(c.getStock()>10){ %>
										<span class="changeColorStockSpan">庫存充足</span>
										<% }else{ %>
										<span class="changeColorStockSpan">庫存緊張!</span>
										<% } %>
									<% } %>
								<% } %>
							</div>
							<hr>
 							<form id="cartForm" action="add_to_cart.do" method="POST" onsubmit="return sendAjaxAddToCart()"><!-- onsubmit要加上return 就能return false取消同步請求 -->
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
<%-- 									<% if(p.get){ %> --%>
									<span class=""></span>
<%-- 									<% } %> --%>
								</div>
								<hr>	
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
									<input type="submit" value="ADD TO CART" class="buttonStyled" id="addToCartButton" onclick="notAjax=false;"><!-- 這裡要加 onclick="notAjax=false;" 不然直接購買返回上一頁時，上面的變數還是true，需強迫onclick轉成false-->
									<button type="submit" name="submit" value="notAjax" class="buttonStyled" onclick="notAjax=true;">直接購買</button>
								</p>
							</form>
						
					</div>
					
				</div>
				
			</div>
			
			<script>
				<% if(p.getColorsList().size()==0 && p.getSpecCount()>0){%>
						//alert("應帶入規格資料");
						ajaxGetSpecsOption("");
				<%}%>
			</script>
		<% } %>
</body>
