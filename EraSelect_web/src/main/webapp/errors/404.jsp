<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>404</title>
		<link rel="stylesheet" type="text/css" href="/es/style/es.css">
		<script>
		
		</script>
		<style>
			img{width:256px;display: block;margin:auto;}
		</style>
	</head>
	<body>
		<% request.setCharacterEncoding("UTF-8"); %>
		<jsp:include page="/subviews/header.jsp">	
			<jsp:param value="404" name="subheader"/> 
		</jsp:include>
<%-- 		<%@include file="/subviews/nav.jsp" %> --%>
		<article>
			<p>找不到檔案: <%= request.getAttribute("javax.servlet.error.request_uri") %></p>
			<img src="/es/images/error_icon.png">
			<img src="/es/images/404_icon.png">
		</article>
		<%@include file="/subviews/footer.jsp" %>
	</body>
	
</html>