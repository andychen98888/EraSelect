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
	$(document).ready(init);
	function init(){
		$(".menu3").tooltip({ //提示視窗
			//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
			show: {effect: "slideDown", duration: 400},
			hide: {effect: "slideUp", duration: 400},
			tooltipClass: "myStyle", //抓取指定class裡面的css並套用
		});
		
		$(".image1").on("mouseenter", changeImg1);
		$(".image1").on("mouseleave", revertImg1);
		$(".image2").on("mouseenter", changeImg2);
		$(".image2").on("mouseleave", revertImg2);
		$(".image3").on("mouseenter", changeImg3);
		$(".image3").on("mouseleave", revertImg3);
	}
	function changeImg1(){$(".image1").attr("src", "https://launches-media.endclothing.com/DZ7293-001_launches_hero_portrait_3.jpg");}
	function revertImg1(){$(".image1").attr("src", "https://launches-media.endclothing.com/DZ7293-001_launches_thumbnailv2.jpg");}
	function changeImg2(){$(".image2").attr("src", "https://launches-media.endclothing.com/FZ4811-001_launches_hero_portrait_3.jpg");}
	function revertImg2(){$(".image2").attr("src", "https://launches-media.endclothing.com/FZ4811-001_launches_thumbnailv2.jpg");}
	function changeImg3(){$(".image3").attr("src", "https://launches-media.endclothing.com/SH1WS0006-P6634-H8419_launches_hero_portrait_3.jpg");}
	function revertImg3(){$(".image3").attr("src", "https://launches-media.endclothing.com/SH1WS0006-P6634-H8419_launches_thumbnailv2.jpg");}
	</script>
	<style>
		article{
			text-align: center
		}

		.productItem{
				display:inline-block; 
				width:350px; 
				height: 400px; 
				margin: 10px; 
				cursor: pointer;
				font-size: 12px;	
				background-color: #f6f6f6;
			}
			.productItem:hover{
				box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
			.product_img img{
				width: 350px;
			}
			.product_name{
				font-size: 15px;
			}
			.product_bottom{
				text-align: left;
			}
	</style>
</head>
<body>
	<jsp:include page="./subviews/header.jsp" />
	
	<article>
	<h2>Upcoming Launches</h2>
		<div id="productsListDiv">
		
				<div class="productItem">
					<div class="product_img">
						<img src="https://launches-media.endclothing.com/DZ7293-001_launches_thumbnailv2.jpg" class="image1">
					</div>
					<div class="product_bottom">
						<div class="product_brand">NIKE</div>
						<div><a class="product_name">Nike Nocta Hot Step II Sneaker</a></div>
						<div class="endTime"></div>
					</div>
				</div>
				<a href="launches_detail.jsp">
					<div class="productItem">
						<div class="product_img">
							<img src="https://launches-media.endclothing.com/FZ4811-001_launches_thumbnailv2.jpg" class="image2">
						</div>
						<div class="product_bottom">
							<div class="product_brand">AIR JORDAN</div>
							<div><a class="product_name">Air Jordan x A Ma Maniere 3 Retro OG SP Sneaker</a></div>
							<div class="endTime"></div>
						</div>
					</div>
				</a>
				<div class="productItem">
					<div class="product_img">
						<img src="https://launches-media.endclothing.com/SH1WS0006-P6634-H8419_launches_thumbnailv2.jpg" class="image3">
					</div>
					<div class="product_bottom">
						<div class="product_brand">MM6 Maison Margiela</div>
						<div><a class="product_name">MM6 Maison Margiela MM6 x Salomon XT-4 Mule</a></div>
						<div class="endTime"></div>
					</div>
				</div>
				
		</div>

	
	
	
	
	
	</article>
	<%@include file="./subviews/footer.jsp" %>
</body>
</html>