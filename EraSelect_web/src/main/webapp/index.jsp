<!-- <%@page pageEncoding="UTF-8" %> -->
<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="uuu.es.entity.SpecialOffer"%>
<%@page import="uuu.es.entity.Product"%>
<%@page import="uuu.es.service.ProductService"%>
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
		<title>EraSelect</title>
		<link href="jquery-ui-1.14.0.custom/jquery-ui.css" rel="stylesheet">	
		<link rel="stylesheet" type="text/css" href="style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="jquery-ui-1.14.0.custom/jquery-ui.js"></script>
		
		<style>
/* ===============圖片輪播 CSS=============== */
		#outer {
			position: relative;
			width: 900px;
			width: 1465px;
			/*image width=753 height=357*/
 			overflow: hidden; 
 			background-color: #666; 
			margin: auto;
		}

		#photos {
			position: relative;
			width: 3600px;
			width: 5860px;
			/*image width=753x5=3765px*/
			display: flex;
		}

		#prev,#next {
			position: absolute;
			width: 30px;
			height: 40px;
			color: white;
			cursor: pointer;
			font-size: 3em;
			top: 220px;
			opacity: 0.5;
		}

		#prev {
			left: 0px;
		}

		#next {
			right: 0px;
		}

		#prev:hover,#next:hover {
			opacity: 0.9;
		}

		#dots {
			width: 104px;
			/*(16+5x2)x5=130px*/
			margin: auto;
			display: flex;
		}

		.dot {
			width: 16px;
			height: 16px;
			background-color: gray;
			border-radius: 50%;
			margin: 5px;
		}

		.dot:first-child {
			background-color: white;
		}
		#photos img{
			width:900px;
			width: 1465px;
			height: 570px;
			object-fit: cover;
		}
/* ===============圖片輪播 CSS=============== */
/* ===============跑馬燈 CSS=============== */
    	#myDiv{
			font-size: 1em;
			width: 800px;
			width: 2760px;
		}
		#marqueeOuter{
			border: 1px solid gray;
			width: 300px;
			width: 100%;
			overflow: hidden; 
			background: black;
			margin-top: -10px;
		}
		.inner{
			display:inline-block;
			float: left;
			width: 230px;
			text-align: center;
		}

/* ===============跑馬燈 CSS=============== */	
/* ===============首頁視窗 CSS=============== */
		.ui-dialog-content img{
			width: 500px;
		}
		.ui-dialog-title{
			display: none;
		}
		.dialogInput,.dialogButton{
			width: 490px;
		}
		.dialogButton{
			padding: 0px 4px;
			border-radius:0px;
		}
		#myDialog{
			text-align: center;
			display: none;
		}	
/* ===============首頁視窗 CSS=============== */
		.myStyle{
		background:blue;
		color:cyan;
		border:dotted;
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
				width:285px; 
/* 				height: 500px;  */
				vertical-align:top; 
				margin: 5px; 
				cursor: pointer;
				font-size: 12px;	
				position: relative;			
			} /*border:lime 1px solid;*/
			.productItem img{
				width: 285px;
 				height: 400px; 
				display:block;				
 				margin-left: auto; 
   				margin-right: auto; 
   				width: 100%; 
   				
   				object-fit: cover; /* 讓圖片不要變形 */
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
			.latestListContainer {
			    display: flex;
			    justify-content: center; 
			    align-items: center; 
			    width: 100%; 
			}
			.viewAll{
			 float: right;
			 padding-bottom: 2px;
			 border-bottom: 1px solid black;
			}
			.latestListSpan{
				font-size: 20px;
				font-weight: bold;
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
		</style>
		<script type="text/javascript">
		var myInterval, index = 0;
		
		var marqueeOuterIndex = 0;
		var marqueeOuterInterval = 0;
		var myDiv = 0;
		
		$(document).ready(function init() {
			$(".dot,#next,#prev").click(moveHandler);//run the same function
			myInterval = setTimeout(moveHandler, 5000);//initial timer
            
			marqueeOuterInterval = setInterval(timeoutHandler, 50); //跑馬燈
			myDiv = document.getElementById("myDiv"); 
			myDiv.addEventListener("mouseenter",enterHandler);
			myDiv.addEventListener("mouseleave",leaveHandler);
			
			 // 檢查 sessionStorage 中是否已存在特定的鍵
		    if (!sessionStorage.getItem("dialogShown")) {
		        // 如果沒有，顯示對話框
				$("#myDialog").dialog({ //首頁視窗
					modal: true, //true 只能在視窗動作 false 可在視窗外做任何動作
					autoOpen: true, //自動開啟視窗畫面
					show: true, //淡入
					hide: true, //淡出
					draggable: false, //可拖拉視窗
					resizable: false, //可縮放視窗
					width: 535,
				});
				// 設置 sessionStorage 鍵，防止再次顯示
		        sessionStorage.setItem("dialogShown", "true");
		    }

			
			$(".menu3").tooltip({ //提示視窗
				//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
				show: {effect: "slideDown", duration: 400},
				hide: {effect: "slideUp", duration: 400},
				tooltipClass: "myStyle", //抓取指定class裡面的css並套用
			});
		});
		
		function signupHandler(){ //關閉視窗
			$("#myDialog").dialog("close");
		}
		
		function moveHandler(e) { //圖片輪播
			clearInterval(myInterval);//reset timer
			myInterval = setTimeout(moveHandler, 5000);//set timeer
			$(".dot:eq(" + index + ")").css("backgroundColor", "gray");//reset dot color
			if (this == window) {
				index++;//setInterval
			} else if ($(this).attr("myIndex")) {
				index = Number($(this).attr("myIndex"));//.dot
			} else {
				index += Number($(this).attr("direction"));// $#prev / #next
			}
			if (index > 3) index = 0;//last image
			if (index < 0) index = 3;//first image
			$(".dot:eq(" + index + ")").css("backgroundColor", "white");//set dot color
			$("#photos").stop().animate({ "marginLeft": -index * 1465 + "px" }, 1000);//image width=735px
		}
		
		
		function timeoutHandler(){
			marqueeOuterIndex--;
			myDiv.style.marginLeft = marqueeOuterIndex*2 +"px"
			if(marqueeOuterIndex == -460) marqueeOuterIndex = 0;
		}
		function enterHandler(){
			clearInterval(marqueeOuterInterval);
		}
		function leaveHandler(){
			marqueeOuterInterval = setInterval(timeoutHandler, 50);
		}
		
		</script>
	</head>
	<body>
		<jsp:include page="./subviews/header.jsp" />
		
		<div id="myDialog" title="Title">
			<img src="https://d3k81ch9hvuctc.cloudfront.net/company/RxtDGi/images/3be81e0e-64f7-4e9f-8102-9af2a563a93b.jpeg">
			<h1>GET EARLY ACCESS</h1>
			<p>SIGN UP TO BE THE FIRST TO SHOP OUR FUTURE RELEASES</p>
			<p><input type="text" class="dialogInput" required></p>
			<div class="dialogButton buttonStyled" onclick="signupHandler()">SIGN UP</div>
		</div>
		
		<div id="marqueeOuter">
			<div id="myDiv">
				<div class="inner"><a href="aaa">BUY ONE AND GET ONE FREE</a></div>
				<div class="inner"><a href="bbb">FROM NOW ON</a></div>
				<div class="inner"><a href="<%= request.getContextPath() %>/products_list_fix.jsp?discount=" id="saleLi">ON SALE</a></div>
				<div class="inner"><a href="ddd">ONLY IN ERASELECT</a></div>
				<div class="inner"><a href="aaa">BUY ONE AND GET ONE FREE</a></div>
				<div class="inner"><a href="bbb">FROM NOW ON</a></div>
				<div class="inner" ><a href="<%= request.getContextPath() %>/products_list_fix.jsp?discount=" id="saleLi">ON SALE</a></div>
				<div class="inner"><a href="ddd">ONLY IN ERASELECT</a></div>
				<div class="inner"><a href="aaa">BUY ONE AND GET ONE FREE</a></div>
				<div class="inner"><a href="bbb">FROM NOW ON</a></div>
				<div class="inner"><a href="<%= request.getContextPath() %>/products_list_fix.jsp?discount=" id="saleLi">ON SALE</a></div>
				<div class="inner"><a href="ddd">ONLY IN ERASELECT</a></div>
			</div>
		</div>
		
		<article>
			<div id="outer">
				<div id="photos">
					<a href="#"><img src="https://cdn.shopify.com/s/files/1/0087/6193/3920/files/Lebon_Stussy_05_02_RGB.jpg?v=1725991466&width=1920"></a>
					<a href="#"><img src="./images/image3.png"></a>
					<a href="#"><img src="./images/image1.png"></a>
					<a href="#"><img src="./images/image2.png"></a>
				</div>
				<div id="prev" direction="-1"><</div>
				<div id="next" direction="1">></div>
				<div id="dots">
					<div class="dot" myIndex="0"></div>
					<div class="dot" myIndex="1"></div>
					<div class="dot" myIndex="2"></div>
					<div class="dot" myIndex="3"></div>
				</div>
			</div>
			
			
			<%
				//呼叫商業邏輯
				ProductService pService = new ProductService();
				List<Product> list = null;
				list = pService.getLatestProducts2();
				//若查無資料
				if(list==null || list.size()==0){
			%>
				<span id="searchFailImg"><img src="images/search_fail.png"><h1>查無資料</h1></span>
			<% }else{ %>
		<div class="latestListContainer">
			<div class="latestList">
				<div class="latestListSpan">
					<span>NEW IN</span>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?latest="><span class="viewAll">View All</span></a>
				</div>
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
							</div>
						</div>
					<% } %>
				</div>
			<% } %>
			</div>
		</div>
		</article>
		<%@include file="./subviews/footer.jsp" %>
	</body>
	
</html>