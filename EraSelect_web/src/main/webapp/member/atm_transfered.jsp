<%@page import="uuu.es.entity.Customer"%>
<%@page import="java.time.LocalDate"%>
<%@page import="uuu.es.service.OrderService"%>
<%@page import="uuu.es.entity.Order"%>
<%@page import="uuu.es.entity.PaymentType"%>
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
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
	
    <title>通知已轉帳</title>
    <style>    	
        form p label:first-child {display: inline-block;min-width: 5em}
        #theErrorsDiv{color: darkred}
    </style>  
   </head>
<body>

   <jsp:include page='/subviews/header.jsp'>
    <jsp:param value="通知已轉帳" name="subheader" />
   </jsp:include>
   <%          
   		Customer member = (Customer)session.getAttribute("member");//這裡必須宣告 因為member在nav裡面宣告的
        String orderId = request.getParameter("orderId");
        Order order = null;
        OrderService oService = new OrderService();
        if(member!=null && orderId!=null){
            order = oService.getOrderById(member, orderId);
        }
    %>

   <article>
    <% if(order==null || !(PaymentType.ATM==order.getPaymentType() && order.getStatus()==0)){%>
        <p>查無需通知轉帳的訂單資料，回<a href='orders_history.jsp'>歷史訂單</a></p>
    <% }else{%>
    <form action='atm_transfered.do' method='POST' style='width: 20em;margin: auto;'>
    	<div id="theErrorsDiv">	${errors}</div>
        <p>
            <label>訂單編號:</label>
            <input type='hidden' name='orderId' value='<%= orderId%>' readonly>
            <input value='<%= order.getId()%>' readonly>
        </p>
        <p>
            <label>轉帳銀行:</label>
            <input name='bank' required placeholder='請輸入轉帳銀行名稱' list="banklist">
            <datalist id="banklist">
	            <option>001 動感銀行</option>
	            <option>002 會瘋銀行</option>
	            <option>003 過去銀行</option>
	            <option>004 台舊銀行</option>
            </datalist>
        </p>
        <p>
            <label>帳號後5碼:</label>
            <input name='last5Code' required placeholder='請輸入轉帳帳號後5碼'>
        </p>
        <p>
            <label>轉帳金額:</label>
            <input name='amount' name='amount' required value='<%= order.getTotalAmountWithFee() %>' >
        </p>
        <p>
            <label>轉帳時間:</label>
            <input type='date' name='transDate' required min='<%= order.getCreatedDate()%>' max='<%= LocalDate.now()%>'>
            <input type='time' name='transTime' required>
        </p>

        <p style='text-align:right'>
            <input type="reset" value='Reset'>
            <input type="submit" value='確定'>
        </p>
    </form>
    <% } %>
   </article>
   <%@include file='/subviews/footer.jsp' %>
</body>
</html>