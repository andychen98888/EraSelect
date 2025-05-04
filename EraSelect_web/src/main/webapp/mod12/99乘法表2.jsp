<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>99乘法表2</title>
	<link rel="stylesheet" type="text/css" href="../style/es.css">
	<script>
	
	</script>
	<style>
	
	</style>
</head>
<body>
	<h2>99乘法表2</h2>
	<% for(int i=1;i<10;i++){ %>
		<%for(int j=1;j<10;j++){ %>
		<p><%= i %> * <%= j %>=<%= i*j %></p>
		<% } %>
	<% } %>

</body>
</html>