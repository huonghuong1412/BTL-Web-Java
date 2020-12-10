<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div class="app">
		<h1 style="text-align: center">Login Form</h1>
		<div class="form">
			<form action="<%= request.getContextPath() %>/LoginServlet" method="post">
				<div class="form-input">
					<label>User name: </label> <input type="text" name="username">
				</div>
				<div class="form-input">
					<label>Password: </label> <input type="password" name="password">
				</div>
				<div>
					<input class="btn" type="submit" value="Login">
				</div>
			</form>
		</div>
	</div>
</body>
</html>