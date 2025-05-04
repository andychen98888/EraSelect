<%@page import="uuu.es.entity.Customer"%>
<%@ page pageEncoding="UTF-8" %>
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
	<!--  <meta charset="UTF-8">-->
	<title>EraSelect 登入成功</title>
	<link rel="stylesheet" type="text/css" href="style/es.css">
	<meta http-equiv="refresh" content="7;url=${requestScope.previous_uri==null?"./":previous_uri}">
	
	<style>
		body{
			text-align: center;
			padding: 15px;
			
		}
		#indexLink{
			font-size: 20px;
		}
	</style>
</head>

<body>
	<jsp:include page="./subviews/header.jsp"><jsp:param value="Login" name="subheader"/></jsp:include>
		<article>
		
		<h1><sub>登入成功</sub></h1>

		<p>
			<% 
				Customer member = (Customer)session.getAttribute("member");//alt/ 要轉型成Customer
	// 			out.println(member!=null?member.getName():"XXX");
			%>
			<span id="memberId"><%= member!=null?member.getName():"XXX" %></span>，您好! 10秒後自動轉址至 
			<a href="${previous_uri==null?"./":previous_uri}" id="indexLink">指定網頁/首頁</a>
		</p>
		<!-- <script>
			document.write(new Date());
		</script> -->
	</article>
<%--  	${ sessionScope.removeAttribute("previous_uri") } 清掉session  --%>
	<%@include file="./subviews/footer.jsp" %>
</body>

</html>