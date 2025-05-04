<%@page import="uuu.es.service.MailService"%>
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
		<title>email check</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
		<script type="text/javascript">
		
		</script>
		<style type="text/css">

		</style>
	
	</head>
		<%
			String email  = request.getParameter("email");
			
			if(email!=null && email.length()>0){
				MailService.sendCheckOutSuccess(email,3);//sendHelloMailWithLogo(email);				
			}
		%>
<body>
	<jsp:include page="/subviews/header.jsp"><jsp:param value="[INSERT TITLE HERE]" name="subheader"/></jsp:include>
	<article>
		<form>
			<input type="email" name="email" placeholder="輸入你的email"  required>
			<input type='submit' value="send mail">
		</form>
	</article>
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>