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
	<title>EraSelect 註冊成功</title>
	<link rel="stylesheet" type="text/css" href="style/es.css">
	<meta http-equiv="refresh" content="7;url=./">
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
		<h1><sub>註冊成功</sub></h1>
<!-- 		<hr> -->
<!-- 			<a href="login.jsp">登入</a> | -->
<!-- 			<a href="/es/register.jsp">註冊</a> | -->
<!-- 		<hr> -->
		<p>
			<% 
				Customer member = (Customer)request.getAttribute("member");//alt/ 要轉型成Customer
	// 			out.println(member!=null?member.getName():"XXX");
			%>
			<%= member!=null?member.getName():"XXX" %>，您好! 10秒後自動轉址至 <a href="./" id="indexLink">首頁</a> <!--可替換成EL寫法  ${ requestScope.member.getName() } -->
		</p>
		<!-- <script>
			document.write(new Date());
		</script> -->
	</article>
	<%@include file="./subviews/footer.jsp" %>
</body>

</html>