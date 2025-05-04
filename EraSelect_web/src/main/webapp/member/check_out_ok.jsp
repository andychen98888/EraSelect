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
		<title>EraSelect 結帳成功</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
		<script type="text/javascript">
		
		</script>
		<style type="text/css">
			article,.buttonStyled{
				width:85%;
				margin: auto;
				text-align: center;
			}
			article img,.buttonStyled{
				width: 150px;
			}
		</style>
	
	</head>
<body>
	<jsp:include page="/subviews/header.jsp"><jsp:param value="結帳成功" name="subheader"/></jsp:include>
	
	<article>
		<img src="../images/check_icon.png">
		<h2>已收到您的訂單<a href="order.jsp">X0244863367</a></h2>
		<a href="<%= request.getContextPath() %>/member/orders_history.jsp"><button class="buttonStyled">查看訂單</button></a>
		<button class="buttonStyled">繼續下單</button>
	</article>
	
	
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>