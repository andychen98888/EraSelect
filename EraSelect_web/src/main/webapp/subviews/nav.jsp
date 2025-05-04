<%@page import="uuu.es.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!-- nav.jsp start -->
<!-- <nav> -->
	<div class="menu2">
		<ul>
			<li><a href="<%= request.getContextPath() %>/products_list_fix.jsp?latest=">NEW ARRIVALS</a></li>
			<li class="dropdown">
				<a href="#">BRANDS</a>
				<span class="dropdown-content">
						<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=AKIMBO">AKIMBO</a>
						<a href="<%= request.getContextPath() %>//products_list_fix.jsp?keyword=STUSSY">STUSSY</a>
						<a href="<%= request.getContextPath() %>//products_list_fix.jsp?keyword=IDA">IDA</a>
						<a href="<%= request.getContextPath() %>//products_list_fix.jsp?keyword=TWOJEYS">TWOJEYS</a>
						<a href="<%= request.getContextPath() %>//products_list_fix.jsp?keyword=en route">en route</a>
						<a href="<%= request.getContextPath() %>//products_list_fix.jsp?keyword=ACNE STUDIOS">ACNE STUDIOS</a>
						<a href="<%= request.getContextPath() %>//products_list_fix.jsp?keyword=CARHARTT">CARHARTT</a>
						<a href="<%= request.getContextPath() %>//products_list_fix.jsp?keyword=LV">LV</a>
				</span>
			</li>
			<li class="dropdown">
				<a href="<%= request.getContextPath() %>/products_list_fix.jsp?category=上衣">TOP</a>
				<span class="dropdown-content">
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=TEE">TEES</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=HOODIE">HOODIES</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=JACKET">JACKETS</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=KNIT">KNITS</a>
				</span>
			</li>
			<li class="dropdown">
				<a href="<%= request.getContextPath() %>/products_list_fix.jsp?category=褲裝">PANTS</a>
				<span class="dropdown-content">
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=DENIM">DENIM</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=JORTS">JORTS</a>
				</span>
			</li>
			<li class="dropdown">
				<a href="<%= request.getContextPath() %>/products_list_fix.jsp?category=鞋子">FOOTWEAR</a>
			</li>
			<li class="dropdown">
				<a href="<%= request.getContextPath() %>/products_list_fix.jsp?category=配件">ACCESSORIES</a>
				<span class="dropdown-content">
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=RING">RINGS</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=NECKLACE">NECKLACE</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=BRACELET">BRACELET</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=CAP">CAPS</a>
					<a href="<%= request.getContextPath() %>/products_list_fix.jsp?keyword=BAG">BAGS</a>
				</span>
			</li>
			
			<li><a href="<%= request.getContextPath() %>/launches.jsp">LAUNCHES</a></li>
			<li><a href="<%= request.getContextPath() %>/products_list_fix.jsp?discount=" id="saleLi">SALE</a></li>
<!-- 			<li><a href="?">MATCHES</a></li> -->
			<li><a href="<%= request.getContextPath() %>/products_list_fix.jsp">ALL</a></li>
		</ul>
	</div>
	<div class="menu3">
		<ul>
			<li>
				<form id="searchForm" action="<%= request.getContextPath() %>/products_list_fix.jsp" method="GET">
					<input type="search" name="keyword" placeholder="Search" required value="<%= request.getParameter("keyword")==null?"":request.getParameter("keyword") %>"><!--EL: ${param.keyword}-->
					<!--  <input type="submit" value="查尋"><img src="./images/search_icon.png"> -->
					<input type="image" src="<%= request.getContextPath() %>/images/search_icon.png" onClick="document.formname.submit();" id="searchImg" title="Search">
				</form>
			</li>  
			<% 
				Customer member = (Customer)session.getAttribute("member");//alt/ session要轉型成Customer
// 				ShoppingCart cart = (ShoppingCart)session.getAttribute("cart"); //jsp
			%>
		 
			<%if(member==null){ %>
				<li><a href="<%= request.getContextPath() %>/login.jsp"><img src="<%= request.getContextPath() %>/images/member_icon.png" title="Login"></a></li> 	<!-- 絕對路徑 LOGIN-->
<!-- 				<li><a href="register.jsp">REGISTER</a></li> 相對路徑 搬進登入畫面 -->
			<% }else{ %>
				<li class="dropdown">
					<a class="dropbtn"><img src="<%= request.getContextPath() %>/images/member_icon.png"></a>
					<span class="dropdown-content">
						<a href="<%= request.getContextPath() %>/logout.do">LOGOUT</a>
						<a href="<%= request.getContextPath() %>/member/update.jsp">修改會員</a>
						<a href="<%= request.getContextPath() %>/member/orders_history.jsp">歷史訂單</a>
					</span>
				</li> 
			<% } %>
			<li><a href="<%= request.getContextPath() %>/member/wishlist.jsp"><img src="<%= request.getContextPath() %>/images/wishlist_icon.png" title="WishList"></a></li>	<!-- TODO我的最愛 需先登入-->
 			<li><a href="<%= request.getContextPath() %>/member/cart.jsp">
 				<div class="cartItemAll">
	 				<img src="<%= request.getContextPath() %>/images/cart_icon.png" title="Cart">
	 				(<span class="totalQtySpan">${sessionScope.cart.getTotalQuantity()+0}</span>)
 				</div>
<%--  				${cart==null || cart.isEmpty()?"":"(".concat(cart.getTotalQuantity()).concat(")")} --%>
<%--  			(${sessionScope.cart.getTotalQuantity()+0}) --%><%-- <%= cart!=null?cart.getTotalQuantity:0 %>jsp --%>
 				</a>
 			</li>
			<li><span class="welcomeSpan"><%= member!=null?member.getName()+"，您好":"" %></span></li>
		</ul>			
	</div>
<!-- </nav> -->
<!-- nav.jsp end -->

<style>
	.dropbtn {
	  display: inline-block;
	}
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f9f9f9;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  display: block;
	  text-align: left;
	}
	.dropdown-content a:hover {
		background-color: #f1f1f1;
	}
	.dropdown:hover .dropdown-content {
	  display: block;
	}
	.cartItemAll{
		display: flex;
		align-items: center;	
	}
	
</style>