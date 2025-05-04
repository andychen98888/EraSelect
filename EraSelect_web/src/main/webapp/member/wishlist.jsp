<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<title>EraSelect WishList</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
		<script type="text/javascript">
		
		</script>
		<style type="text/css">
			h3{ 
			text-align: center; 
			} 
		</style>
	
	</head>
<body>
	<jsp:include page="/subviews/header.jsp"><jsp:param value="[INSERT TITLE HERE]" name="subheader"/></jsp:include>
	<article>
		<h3>YOUR WISHLIST</h3>
	</article>
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>