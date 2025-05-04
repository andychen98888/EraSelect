<%@page import="java.util.Random"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Hello JSP</title>
	<link rel="stylesheet" type="text/css" href="../style/es.css">
	<script>
	
	</script>
	<style>
	
	</style>
</head>
<body>
	<h1>Hello哈囉噘欸死批</h1>
	<hr>
	<%
		Random random = new Random();
		int i = random.nextInt(20)+1;
		if(i>10){
			out.println("<p>i 是大於10的整數</p>");
		}else{
			out.println("<p>i 是小於等於10的整數</p>");
		}
	%>
	
<!-- 	<p>i 是大於10的整數</p> -->
<%-- 	<% --%>
<!--  		}else{ -->
<!-- 	%> -->
	
<!-- 	<p>i 是小於等於10的整數</p> -->
<%-- 	<% --%>
<!--  		} -->
<!-- 	%> -->
</body>
</html>