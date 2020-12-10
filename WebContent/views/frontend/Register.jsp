<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="app">
		<h1 style="text-align: center">Register Form</h1>
		<div class="form">
			<form action="<%= request.getContextPath()%>/RegisterServlet" method="post">
				<div class="form-input">
					<label>User name: </label> <input type="text" name="username">
				</div>
				<div class="form-input">
					<label>Password: </label> <input type="password" name="password">
				</div>
				<div class="form-input">
					<label>Name: </label> <input type="text" name="fullname">
				</div>
				<div class="form-input">
					<label>Address: </label> <input type="text" name="address">
				</div>
				<div class="form-input">
					<label>Phone: </label> <input type="text" name="phone">
				</div>
				<div>
					<input class="btn" type="submit" value="Sign up">
				</div>
			</form>
		</div>
	</div>
</body>
</html>