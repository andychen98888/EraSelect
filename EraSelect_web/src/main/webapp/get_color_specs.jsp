<%@page import="uuu.es.service.ProductService"%>
<%@page import="uuu.es.entity.Spec"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>

	<%
	String colorName = request.getParameter("colorName");
	String productId = request.getParameter("productId");
	List<Spec> list = null;
	ProductService pService = new ProductService();
	if(productId!=null && colorName!=null){
		list = pService.getProductSpecsByIdAndColorName(productId, colorName);
	}
// 	System.out.print(list);	
// 	if("Rinsed Indigo".equals(colorName)){
	if(list!=null && list.size()>0){
	%>
  	<option value="">請選擇規格...</option> <!--要加value空字串 不然這串會無法定義 -->
<!-- ajax get_color_spec.jsp start -->
	<% 
		
	for(int i =0;i<list.size();i++){
		Spec spec = list.get(i);	
	%>	
			<option 
<%-- 			data-list-price="<%= spec.getUnitPrice() %>"  --%>
<%-- 			data-price="<%= spec.getPrice() %>"  --%>
		
			data-stock="<%= spec.getStock() %>" 
			value="<%= spec.getSpecName() %>">
			<%= spec.getSpecName() %></option>
<!-- 		<label> -->
<%-- 			<input type="radio" name="spec" value="<%= spec.getSpecName() %>" required> --%>
<%-- 			<span data-stock="<%= spec.getStock() %>"> --%>
<%-- 				<%= spec.getSpecName() %> --%>
<!-- 			</span>  -->
<!-- 		</label> -->
	<% } %>
<%-- 	<% }else if("Medium Blue".equals(colorName)){ %> --%>
	<% }else{ %>
	<option value="">查無規格</option>
	<% } %>
	
<!--  	<label> -->
<!-- 		<input type="radio" name="size" value="" required> -->
<!-- 		<span  -->
<%-- 			data-stock="<%= spec.getStock() %>"  --%>
<%-- 			data-list-price="<%= spec.getUnitPrice() %>"  --%>
<%-- 			data-price="<%= spec.getPrice() %>"  --%>
<%-- 			value="<%= spec.getSpecName() %>"> --%>
<%-- 			<%= spec.getSpecName() %></span>  --%>
<!-- 	</label> -->

<!-- 	<option  -->
<%-- 			data-stock="<%= spec.getStock() %>"  --%>
<%-- 			data-list-price="<%= spec.getUnitPrice() %>"  --%>
<%-- 			data-price="<%= spec.getPrice() %>"  --%>
<%-- 			value="<%= spec.getSpecName() %>"> --%>
<%-- 			<%= spec.getSpecName() %>, 庫存<%= spec.getStock() %></option>  --%>
	
<!-- ajax get_color_spec.jsp end -->	


