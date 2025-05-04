<%@ page pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>隱含變數(request,session)</title>
		<link rel="stylesheet" type="text/css" href="../style/es.css">
		<script>
		
		</script>
		<style>
			p lable{color:blue}
		</style>
	</head>
	<body>
		<h2>Implicit Variables(request,session)</h2>
		<hr>
		<h3>request</h3>
		<p><lable>request.getMethod():</lable> <%= request.getMethod() %></p>
		<p><lable>request.getRequestURL():</lable> <%= request.getRequestURL() %></p>
		<p><lable>request.getRequestURI():</lable> <%= request.getRequestURI() %></p>
		<p><lable>request.getProtocol():</lable> <%= request.getProtocol() %></p>
		<p><lable>request.getLocalName():伺服器名稱</lable> <%= request.getLocalName() %></p>
		<p><lable>request.getLocalPort():伺服器port</lable> <%= request.getLocalPort() %></p>
		<p><lable>request.getLocalAddr():伺服器網址</lable> <%= request.getLocalAddr() %></p>
		<p><lable>request.getRemoteHost():Client名稱</lable> <%= request.getRemoteHost() %></p>
		<p><lable>request.getRemotePort():Client port</lable> <%= request.getRemotePort() %></p>
		<p><lable>request.getRemoteAddr():Client 網址</lable> <%= request.getRemoteAddr() %></p>
		<p><lable>request.getContextPath():</lable> <%= request.getContextPath() %></p>
		<p><lable>request.getQueryString():</lable> <%= request.getQueryString() %></p>
		<hr>
			request headers
			<p><lable>request.getHeader("accept-language"):</lable><%=request.getHeader("accept-language")%></p>
			<p><lable>request.getHeader("user-agent"):</lable><%=request.getHeader("user-agent")%></p>
		<hr>
			request form data:
			<form action="" method="POST">
				<input name="id">
				<input type="submit">
			</form>
			<p>id: <%= request.getParameter("id") %></p>
			<p>name: <%= request.getParameter("name") %></p>
			<p>phone: <%= request.getParameter("phone") %></p>

			<hr>
			<h3>session(邏輯的連線)</h3>
			<p>session id: <%= session.getId() %></p>
			<p>session timeout: <%= session.getMaxInactiveInterval() %> sec.</p>
			<p>session getCreationTime: <%= new java.util.Date(session.getCreationTime()) %></p>
			<p>session getLastAccessedTime: <%= new java.util.Date(session.getLastAccessedTime()) %></p>
	</body>
</html>