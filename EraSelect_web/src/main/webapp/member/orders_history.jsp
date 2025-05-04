<%@page import="uuu.es.entity.Customer"%>
<%@page import="uuu.es.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="uuu.es.service.OrderService"%>
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
		<title>EraSelect 歷史訂單</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
		<script type="text/javascript">
		
		</script>
		<style type="text/css">
			form{text-align:center;}					
			h3{text-align: center;}
			
			.orderHistoryUl{
				width:90%;
				margin: auto; 
 				box-shadow: gray 2px 2px 5px; 
				padding: 1ex;
			}
			.orderHistoryLiDiv{
				display: flex;
				width:90%;
				align-items: center;
				justify-content: center;
				flex-direction: column;
			}
			.orderHistoryLi div:nth-child(odd){display: inline-block;width:10em;}
			.orderHistoryLi div:nth-child(even){display: inline-block;width:15em;}
			.orderHistoryLi div:first-child{display: inline-block;width:2em;}
		</style>
	
	</head>
<body>
	<jsp:include page="/subviews/header.jsp"><jsp:param value="" name="subheader"/></jsp:include> 
<%-- 	<%@include file="/subviews/header.jsp" %> --%>
	<article>
		<form>
			查詢範圍: 
				<input type="radio" value="1" name="range" required checked><label>1個月</label>
				<input type="radio" value="2" name="range" required><label>2個月</label>
				<input type="radio" value="3" name="range" required><label>3個月</label>
				<input type="radio" value="6" name="range" required><label>半年</label>
				<input type="radio" value="24" name="range" required><label>2年</label> 內
				<input type='submit' value="查詢訂單">
		</form>		
		<%
			String range = request.getParameter("range");
			if(range==null) range="1";
			int rangeNum=1;				
			switch(range){
				case "1":
				case "2":
				case "3":
				case "6":
				case "24":
					rangeNum = Integer.parseInt(range);
			}
			
			Customer member = (Customer)session.getAttribute("member");//這裡必須宣告 因為member在nav裡面宣告的
			List<Order> list = null;
			OrderService oService = new OrderService();
			list = oService.getOrdersHistory(member, rangeNum);
		%>
<%-- 		<%= list %>  //FOR TEST--%>

		<% if(list==null || list.isEmpty()){ %>
			<p>查無指定()範圍內的歷史訂單</p>
		<% }else{ %>
		<ul type=none class="orderHistoryUl">
			<h3>歷史訂單</h3>
			<div class="orderHistoryLiDiv">
				<% for(Order order:list){ %> <%-- for(int i=0;i<list.size();i++){ --%>
				<li class="orderHistoryLi">
					<div><%= order.getId() %></div><div><%= order.getCreatedDate() %>, <%= order.getCreatedTime() %></div>
					<div><%= order.getStatusDescription() %></div><div><%= order.getShippingType().getDescription() %> <%= order.getPaymentType().getDescription() %></div>
					<div><%= order.getTotalAmount() %>元</div><div> 總金額(含手續費)<%= order.getTotalAmountWithFee() %>元</div>
					<a href="order.jsp?orderId=<%= order.getId() %>">檢視明細</a>
				</li>
				<% } %>
			</div>
		</ul>
		<% } %>
		
	</article>
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>