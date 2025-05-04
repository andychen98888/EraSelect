<%@ page pageEncoding="UTF-8"%>
<!-- header.jsp start -->
<header>
	<div class="headerOuter">
<!-- 		<div class="display-flex"> -->
			<div class="menu1">
				<h2>
					<a href="<%= request.getContextPath() %>">EraSelect
					</a>
		<%-- 		<sub><%= request.getParameter("subheader")==null?"Welcome":request.getParameter("subheader")%></sub> --%>
				</h2>
			</div>
			<%@include file="/subviews/nav.jsp" %>
<!-- 		</div> -->
	</div>
</header>
<!-- header.jsp end -->

