<%@page import="uuu.es.entity.PaymentType"%>
<%@page import="uuu.es.entity.ShippingType"%>
<%@page import="uuu.es.entity.SpecialOffer"%>
<%@page import="uuu.es.entity.Customer"%>
<%@page import="uuu.es.entity.CartItem"%>
<%@page import="java.util.Set"%>
<%@page import="uuu.es.entity.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="apple-touch-icon" sizes="180x180" href="../favicon/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="../favicon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="../favicon/favicon-16x16.png">
		<link rel="manifest" href="../favicon/site.webmanifest">
		<link rel="mask-icon" href="../favicon/safari-pinned-tab.svg" color="#5bbad5">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#ffffff">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>EraSelect 結帳</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		
		<script type="text/javascript">
			$(init);
			
			function init(){
				$("#storeButton").hide();
				<%if("POST".equals(request.getMethod())) { %>
				repopulateFormData();				
			}
			function repopulateFormData(){
				$("select[name=shippingType]").val("${param.shippingType}");
				$("select[name=paymentType]").val("${param.paymentType}");
				$("input[name=name]").val("${param.name}");
				$("input[name=email]").val("${param.email}");
				$("input[name=phone]").val("${param.phone}");
				$("select[name=shippingType]").trigger("change");
				$("select[name=paymentType]").trigger("change");				
				$("input[name=shippingAddress]").val("${param.shippingAddress}");
				<% } %>
			}
			
			
			function copyMemberData(){
				if(theCheckbox.checked){
					$("input[name=name]").val("${sessionScope.member.getName()}");
					$("input[name=phone]").val("${sessionScope.member.getPhone()}");
					$("input[name=email]").val("${sessionScope.member.getEmail()}");
					if($("select[name=shippingType]").val()=="${ShippingType.HOME.name()}"){
						$("input[name=shippingAddress]").val("${sessionScope.member.getAddress()}");
					}
				}else{
					$("input[name=name]").val("");
					$("input[name=phone]").val("");
					$("input[name=email]").val("");
					$("input[name=shippingAddress]").val("");
				}
			}
			
			function changePaymentOption(){				
				$("select[name=paymentType] option").prop("disabled", true);
				$("select[name=paymentType] option[value='']").removeAttr("disabled");
				
				if($("select[name=shippingType] option:selected").val()!=''){
					var array = $("select[name=shippingType] option:selected").attr("data-array").split(',');
					for(i=0;i<array.length;i++){
						$("select[name=paymentType] option[value='"+array[i]+"']").removeAttr("disabled");
					}
				}
				
				if($("select[name=paymentType] option:selected").prop("disabled")){
					$("select[name=paymentType]").val("");
				}
				
				changeShippingAddress($("select[name=shippingType]").val());
				calculateFee();
			}
			
			function changeShippingAddress(shippingType){
				$("input[name=shippingAddress]").removeAttr("list");
				$("input[name=shippingAddress]").attr("required", true);
				$("input[name=shippingAddress]").removeAttr("readonly");
				$("input[name=shippingAddress]").val('');
				$("#storeButton").hide();
				switch(shippingType){
				case 'SHOP':
					$("input[name=shippingAddress]").attr("list", "shoplist");
					$("input[name=shippingAddress]").attr("autocomplete", "off");
					break;
				case 'HOME':
					$("input[name=shippingAddress]").attr("autocomplete", "on")
					break;
				case 'STORE':
					$("input[name=shippingAddress]").prop("readonly", true);					
					$("#storeButton").show();
					break;
				case 'NO':
// 					alert('無須貨運');
				}
			}
			
			function calculateFee(){
// 				alert("calculateFee");
				var amount = Number($("#totalAmount").text());
				var shippingFee=0;
				var paymentFee=0;
				if($("select[name=shippingType] option:selected").val()!=''){
					shippingFee = Number($("select[name=shippingType] option:selected").attr("data-fee"));
				}
				if($("select[name=paymentType] option:selected").val()!=''){
					paymentFee = Number($("select[name=paymentType] option:selected").attr("data-fee"));
				}
// 				alert(amount + shippingFee);
				$("#totalAmountWithFee").text("NT$" + Number(amount + shippingFee + paymentFee));
				
			}
		</script>
		<style type="text/css">
		.titleH2{ 
			text-align: center; 
		} 
		.bodyH2,#productsListLink{
			text-align: center; 
			margin:auto;
		}
		article{
			font-size: 13px;
/* 			text-align: center; */
		}
/* ----------購物明細---------- */
		#cartDetails {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 85%;
		  margin:auto;
		}
		#cartDetails td, #cartDetails th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		#cartDetails tr:nth-child(even){background-color: #f2f2f2;}
		#cartDetails tr:hover {background-color: #ddd;}
		#cartDetails tbody input[type=number]{width:5ex}
		#cartDetails caption {
		  padding-top: 12px;
		  padding-bottom: 12px;
/* 		  text-align: left; */
		  background-color: silver;
		  color: white;
		}
		
		.cartImg{
			width:40px;
/* 			float:left; */
			margin:1px;
			vertical-align: middle;
			
		}
		#deleteImg{
			width:15px;
		}
		.listPrice{
			text-decoration: line-through;
			color: #75757575;
		}
		.discountPrice{
			color: rgb(174, 0, 0);
		}
		.discountString{
			font-size: smaller;
		}
		.lastTr{
			text-align: right;
		}
		.productName{font-weight: bold}
/* ----------購物明細---------- */		
		
		
		#checkOutForm,summary{
			width: 85%;
			margin:22px auto;
		}
		
		summary:hover{
			cursor: cell;
		}
		#quantityInput{
			cursor: not-allowed;
		}
		
		#productsListLink{
			font-size: 20px;
		}
		#totalAmountWithFee{
			font-size: larger;
			color: dimgray;
		}
		#checkOutForm fieldset label{
			display:inline-block;
			min-width:3.5em;
			vertical-align: text-top;
		}
		#checkOutForm fieldset{
			margin: 2em auto 0 auto;
		}
		#shippingTypeSpan,#paymentTypeSpan{
			float:left;
			width:30%;
		}
		#submitTypeSpan1{ opacity: 0; }
		#submitTypeSpan{
			float:right;  
			margin: 1em 0;
		}
		</style>
	</head>
<body>
	<jsp:include page="/subviews/header.jsp"><jsp:param value="購物車" name="subheader"/></jsp:include>
	<h3 class="titleH2">CHECK OUT</h3>
	<article>
	
<%-- 	<p>購物車內容: ${sessionScope.cart}</p> --%>
		<% 
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
			if(cart==null || cart.isEmpty()){
		%>
			<h2 class=bodyH2>購物車是空的</h2>
			<p>
				<h3 id="productsListLink">請至<a href="../products_list_fix.jsp"> 賣場 </a>選購</h3>
			</p>
		<% }else{ %>
		<form id="checkOutForm" action="check_out.do" method="POST">
			<div>
				<span id="shippingTypeSpan">
					<label>貨運方式:</label>
					<select name="shippingType" required onchange="changePaymentOption()">
						<option value=''>請選擇...</option>
						<% for(int i=0 ;i<ShippingType.values().length;i++){ 
							ShippingType shType = ShippingType.values()[i];
						%>
						<option value='<%= shType.name() %>' data-fee="<%= shType.getFee() %>" data-array="<%= shType.getPaymentTypeArrayStr() %>">
							<%= shType %>
						</option>
						<% } %>
					</select>
				</span>
				<span id="paymentTypeSpan">
					<label>付款方式:</label>
					<select name="paymentType" required onchange="calculateFee()">
						<option value=''>請選擇...</option>
						<% for(PaymentType pType:PaymentType.values()){ %>
						<option value='<%= pType.name() %>' data-fee="<%= pType.getFee() %>">
							<%= pType %>
						</option>
						<% } %>
					</select>
				</span>
				<!--------------------------隱藏---------------------->
				<span id="submitTypeSpan1">
					<input type="submit" value="送出訂單" >
				</span>
				<!--------------------------隱藏---------------------->
				<fieldset>
					<legend>收件人
						<input id="theCheckbox" type="checkbox" value="同訂購人" onchange="copyMemberData()">
						<label>同訂購人</label>
					</legend>
					<p>
						<div>
							<label>姓名:</label>
							<input name="name" placeholder="請輸入真實姓名" required>
						</div>
					</p>
					<p>
						<div>
							<label>手機:</label>
							<input type="tel" name="phone" placeholder="請輸入正確手機號碼" required>
						</div>
					</p>
					<p>
						<div>
							<label>Email:</label>
							<input type="email" name="email" placeholder="請輸入正確Emial" required>
						</div>
					</p>
					<p>
						<div>
							<label>地址:</label>
							<input name="shippingAddress" placeholder="請輸入送件地址"  required>
							<datalist id="shoplist">
								<option>101旗艦店 台北市信義區信義路五段7號</option>
								<option>復北門市 台北市復興北路99號1F</option>	
							</datalist>
							<input id="storeButton" type="button" value="選擇超商" style="dispaly:none" onclick="goEZShip()">	
						</div>
					</p>
				</fieldset>
				
				<p id="submitTypeSpan">
					<input type="submit" value="送出訂單" class="buttonStyled">
				</p>
			</div>
		</form>
		
			<!-- ezship程式 start -->
				<script>
           function goEZShip() {//前往EZShip選擇門市
//                if (confirm("Go EZShip前，你的網址已經改用ip Address了嗎?")) {
                   alert("出發至EZShip[選擇超商]");
//                 } else {
//                    alert("快改網址!並重新登入與購買");
//                    return;
//                 }

               //去除文字欄位資料前後的多餘空白
	           $("input[name=name]").val($("input[name=name]").val().trim());
	           $("input[name=email]").val($("input[name=email]").val().trim());
	           $("input[name=phone]").val($("input[name=phone]").val().trim());
	           $("input[name=shippingAddress]").val($("input[name=shippingAddress]").val().trim());

               var protocol = "https"; //之後務必要改成https
               var ipAddress = "<%= java.net.InetAddress.getLocalHost().getHostAddress()%>";
               var url = protocol + "://" + ipAddress + ":" + location.port + "<%=request.getContextPath()%>/member/ezship_callback.jsp";
               $("#rtURL").val(url);

           		//$("#webPara").val($("form[action='check_out.do']").serialize());
               $("#webPara").val($("#checkOutForm").serialize());
//                alert('現在網址不得為[locolhost]: '+url); //測試用，測試完畢後請將此行comment
//                alert($("#webPara").val()) //測試用，測試完畢後請將此行comment

               $("#ezForm").submit(); 
           }
           
           </script>
           <form id="ezForm" method="post" name="simulation_from" action="https://map.ezship.com.tw/ezship_map_web.jsp" > 
               <input type="hidden" name="suID"  value="test@vgb.com"> <!-- 業主在 ezShip 使用的帳號, 隨便寫 -->       
               <input type="hidden" name="processID" value="VGB202107050000005"> <!-- 購物網站自行產生之訂單編號, 隨便寫 -->
               <input type="hidden" name="stCate"  value=""> <!-- 取件門市通路代號 -->        
               <input type="hidden" name="stCode"  value=""> <!-- 取件門市代號 -->        
               <input type="hidden" name="rtURL" id="rtURL" value=""> <!-- 回傳路徑及程式名稱 -->
               <input type="hidden" id="webPara" name="webPara" value=""> <!-- 結帳網頁中checkOutForm中的輸入欄位資料。ezShip將原值回傳，才能帶回結帳網頁 -->
           </form>
		   <!-- ezship程式 end -->	
		   
		<details>
			<summary>
				總金額: 
				<span id="totalAmountWithFee">NT$<%= cart.getTotalAmount() %></span>，共<%= cart.getTotalQuantity() %>件 [點選查看購物明細]
			</summary>
			<table id="cartDetails">
				<caption>購物明細</caption>
				<thead>
					<tr>
						<td>編號</td>
						<td>產品名稱</td>
						<td>顏色/規格</td>
						<td> 定價 / 折扣 / 售價 </td>
						<td>數量</td>
						<td>小計</td>
					</tr>
				</thead>
				<tbody>
				<% 
					Set<CartItem> itemSet = cart.getCartItemsSet();
						for(CartItem item:itemSet){
				%>
					<tr>
						<td><%= item.getProductId() %></td>
						<td>
							<a href="../product_detail.jsp?productId=<%= item.getProductId() %>">
								<img class="cartImg" src="<%= item.getPhotoUrl() %>">
								<span class="productName"><%= item.getProductName() %></span>
							</a>
						</td>
						<td>
							<%= item.getColorName() %> <%= item.getSpecName() %>
						</td>
						<td>
						
							<% if(item.getTheProduct() instanceof SpecialOffer){ %>
							<span class="listPrice">NT$<%= item.getListPrice() %></span>
							<span class="discountPrice">NT$<%= item.getPrice() %></span>
							<span class="discountString"> <%= item.getDiscountString() %> </span>
							<% }else{ %>
							<span class="discountPrice2">NT$<%= item.getPrice() %></span>
							<% } %>
						</td>
						<td>
							<input id="quantityInput" type="number" name="quantity<%= item.hashCode() %>" min=1 max="<%= item.getStock() %>" value="<%= cart.getQuantity(item) %>" required readonly>
						</td>
						<td>
							<%= cart.getAmount(item) %>
						</td>
						
					</tr>
				<% } %>	
				</tbody>
				
				<tfoot>
					<tr class="lastTr">
						<td colspan="4">共<%= cart.size() %>項</td>
						<td colspan="1"><%= cart.getTotalQuantity() %>件</td>
						<td colspan="1">總金額: <span id="totalAmount"><%= cart.getTotalAmount() %></span></td>
					</tr>
				</tfoot>
			</table>
		</details>
	<% } 
// 	}
	%>
	</article>
	<%@include file="/subviews/footer.jsp" %>
</body>
</html>