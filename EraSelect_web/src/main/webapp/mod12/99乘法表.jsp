<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>99乘法表</title>
	<link rel="stylesheet" type="text/css" href="../style/es.css">
	<script>
	
	</script>
	<style>
	
	</style>
</head>
<body>
	<h2>99乘法表</h2>
	<% for(int i=1;i<10;i++){ %>
		<%for(int j=1;j<10;j++){ %>
		<p><% out.print(i);%>*<% out.print(j);%>=<% out.print(i*j);%></p>
<%-- 		<p><% out.print(i);%>*2=<% out.print(i*2);%></p>  --%>
<%-- 		<p><% out.print(i);%>*3=<% out.print(i*3);%></p>  --%>
		<% } %>
	<% } %>
<!-- 	<p>2*1=2</p> -->
<!-- 	<p>2*2=4</p> -->
<!-- 	<p>2*3=6</p> -->

<!-- 	<p>3*1=3</p> -->
<!-- 	<p>3*2=6</p> -->
<!-- 	<p>3*3=9</p> -->

</body>
</html>