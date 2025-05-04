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
		<meta charset="UTF-8">
		<title>EraSelect</title>
		<link href="jquery-ui-1.14.0.custom/jquery-ui.css" rel="stylesheet">	
		<link rel="stylesheet" type="text/css" href="style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="jquery-ui-1.14.0.custom/jquery-ui.js"></script>
		
	<script>
	var endTime = Math.round(new Date(2024,9,26).getTime()/1000);	
	
	var index = 1;
	var photoNum = 6;
	
	$(document).ready(init);
	function init(){
		$(".menu3").tooltip({ //提示視窗
			//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
			show: {effect: "slideDown", duration: 400},
			hide: {effect: "slideUp", duration: 400},
			tooltipClass: "myStyle", //抓取指定class裡面的css並套用
		});
		//圖片輪播
		$("#next").click(nextHandler);
		$("#prev").click(prevHandler);
		$(".photos").append("<img src='https://launches-media.endclothing.com/FZ4811-001_launches_hero_landscape_"+photoNum+".jpg'>");
		for (var i=1; i<=photoNum; i++){
			$(".photos").append("<img src='https://launches-media.endclothing.com/FZ4811-001_launches_hero_landscape_"+i+".jpg'>");
		}
		$(".photos").append("<img src='https://launches-media.endclothing.com/FZ4811-001_launches_hero_landscape_1.jpg'>");
		//倒數計時
		var myInterval = setInterval(timeoutHandler, 1000); 
		//彈出視窗
		$(".closeBtn").click(closeHandler);
		$("#showBtn").click(showHandler);
	}
	
	function closeHandler(){
		$("#modalWindow").css("display", "none");
	}
	function showHandler(){
		$("#modalWindow").css("display", "flex");
	}
	
	function timeoutHandler(){
		var now = new Date();
		var nowTime = Math.round(now.getTime()/1000);
		var timeDifferent = endTime-nowTime;
		var days = parseInt(timeDifferent/86400);
		var hours = parseInt(timeDifferent/3600)%24;
		var minutes = parseInt(timeDifferent/60)%60;
		var seconds = timeDifferent % 60;
		
		document.getElementById("endTime").innerHTML =
			days+ "d : " + 
			(hours<10?("0"+hours):hours)+"h : "+
			(minutes<10?("0"+minutes):minutes)+"m : "+
			(seconds<10?("0"+seconds):seconds)+"s";
	}
	
	function nextHandler(){
		index++;			
		if(index <= photoNum){
			$(".photos").animate({"left" : -(index*1000)+"px"}, 500);
		}else{
			$(".photos").animate({"left" : -(index*1000)+"px"}, 500, photoStart);
			index = 1;
		}
	}
	function photoStart(){
		$(".photos").css("left","-1000px");
	}
	function prevHandler(){
		index--;			
		if(index > 0){
			$(".photos").animate({"left" : -(index*1000)+"px"}, 500);
		}else{
			$(".photos").animate({"left" : -(index*1000)+"px"}, 500, photoEnd);
			index=photoNum;
		}
	}
	function photoEnd(){
		$(".photos").css("left",-(photoNum*1000)+"px");
	}
	</script>
	<style>
		article{
			text-align: center
		}
/* -----------------彈出視窗--------------------- */
		#modalWindow {
			position: fixed;
			left: 0px;
			top: 0px;
			width: 100vw;
			height: 100vh;
			background: rgba(0, 0, 0, 0.6);
/* 			display: flex;*/
			display: none; 
			align-items:center;
			justify-content:center;
		}

		.messageWindow {
			position: relative;
			padding: 20px;
/* 			width: 780px; */
			background: silver;
			border: 5px solid gray;
			margin-top: 60px;
		}

		.closeBtn {
			position: absolute;
			top: 10px;
			right: 10px;
			width: 16px;
			height: 16px;
			text-align: center;
			line-height: 16px;
			padding: 5px;
			background-color: rgba(240, 240, 240, 1);
			border-radius: 50%;
			cursor: pointer;
		}

		.messageWindow img {
/* 			width: 150px; */
/* 			margin: 10px; */
/* 			float: left; */
		}
		.messageWindow p {
			text-align: justify;
		}

		#showBtn {

		}
/* -----------------彈出視窗--------------------- */
/* 	            	圖片輪播                   */
		.photos {
			position: relative;
			width: 8000px;
			left:-1000px;
		}

		#photosOuter {
			width: 1000px;
			height: 563px;
 			overflow: hidden; 
 			z-index: -1;
		}

		button {
			width: 50px;
			height: 50px;
			position: absolute;
			border-radius: 100px; 
			opacity: 0.2;
			cursor: pointer;
		}
		.photos img{
			width: 1000px;
		}
		.photosDiv{
			display: flex;
			position: relative;
			align-items: center;
			justify-content: center;
		}
		#next{
			top: 250px;
			left: 1400px;
		}
		#prev{
			top: 250px;
			right: 1400px;
		}
/* 	            	圖片輪播                   */
		.productBrand,.productPrice,.productColor,.sizeGuide,.availableString{
			font-size: 1.5em;
		}
		.productName,#endTime{
			font-size: 2em;
		}
		.productColor,.sizeGuide,.availableString{
			color: #757575;
		}
		.launchButton{
			display: flex;
			align-items: center;
			justify-content: center;
			border: 1px solid black;
			width: 500px;
			height: 40px;
			background-color: black;
			color: white;
			margin: auto;
			padding: 10px;
			cursor: pointer;
		}
		.launchButton:hover,.sizeGuide:hover{
			color: silver;
		}
		.sizeGuide{
			cursor: pointer;
		}
	</style>
</head>
<body>
	<jsp:include page="./subviews/header.jsp" />
	
	<article>
	
		<div id="productsListDiv">
		
				<div class="productItem">
				
					<div class="photosDiv">
						<button id="prev"><</button>
						<div id="photosOuter">
							<div class="photos"></div>
						</div>
						<button id="next">></button>
					</div>					
					
					<div class="productString">
						<div class="productBrand">AIR JORDAN</div>
						<div><a class="productName">Air Jordan x A Ma Maniere 3 Retro OG SP Sneaker</a></div>
						<div class="productPrice">NT$7369</div>
						<div class="productColor">Black Pewter & Ore</div>
						<p class="sizeGuide" id="showBtn">Size guide</p>
						<div class="availableString">Available in:</div>
						<p id="endTime"></p>
						<a href="login.jsp"><div class="launchButton">ENTER DRAW</div></a>
					</div>
					
				</div>
				
		</div>

	
		<!--遮蔽元件外圍元件 id="modalWindow"-->
		<div id="modalWindow">
			<!--訊息對話框元件 class="messageWindow"-->
			<div class="messageWindow">
				<!--關閉按鈕元件 class="closeBtn"-->
				<div class="closeBtn">X</div>
				<!--以下為呈現元件-->
				<img src="images/sizing.png" />
				<p>
				</p>
	
			</div>
		</div>
	
	
	</article>
	<%@include file="./subviews/footer.jsp" %>
</body>
</html>