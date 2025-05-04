<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>99乘法表 Table</title>
	<link rel="stylesheet" type="text/css" href="../style/es.css">
	<script>
	
	</script>
	<style>
		#_99table {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		#_99table td, #_99table th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		#_99table tr:nth-child(even){background-color: #f2f2f2;}
		
		#_99table tr:hover {background-color: #ddd;}
		
		#_99table caption {
		  padding-top: 12px;
		  padding-bottom: 12px;
/* 		  text-align: left; */
		  background-color: #04AA6D;
		  color: white;
		}
	</style>
</head>
<body>
	<table id="_99table">
		<caption>99乘法表</caption>
<!-- 		<tr>直行<td>橫列 -->
		<% for(int i=1;i<10;i++){ %>
			<tr>
				<%for(int j=1;j<10;j++){ %>
					<td><%= i %> * <%= j %>=<%= i*j %></td>
				<% } %>
			</tr>
		<% } %>
<!-- 			<td>1*2=2</td> -->
<!-- 			<td>1*3=3</td> -->
<!-- 		<tr> -->
<!-- 			<td>2*1=2</td> -->
<!-- 			<td>2*2=4</td> -->
<!-- 			<td>2*3=6</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>3*1=3</td> -->
<!-- 			<td>3*2=6</td> -->
<!-- 			<td>3*3=9</td> -->
<!-- 		</tr> -->
	</table>

</body>
</html>