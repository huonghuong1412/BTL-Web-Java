<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="app">
		<h1 style="text-align: center">Update Profile</h1>
		<div class="form">
			<form action="ProfileServlet" method="post">
				<input type="hidden" name="id" value="<%= session.getAttribute("id") %>">
				<div class="form-input">
					<label>User name: </label> <input type="text" name="username" value="<%= session.getAttribute("username") %>" readonly="readonly">
				</div>
				<div class="form-input">
					<label>Password: </label> <input type="password" name="password" value="<%= session.getAttribute("password") %>">
				</div>
				<div class="form-input">
					<label>Name: </label> <input type="text" name="fullname" value="<%= session.getAttribute("fullname") %>">
				</div>
				<div class="form-input">
					<label>Address: </label> <input type="text" name="address" value="<%= session.getAttribute("address") %>">
				</div>
				<div class="form-input">
					<label>Phone: </label> <input type="text" name="phone" value="<%= session.getAttribute("phone") %>">
				</div>
				<div>
					<input class="btn" type="submit" value="Update">
				</div>
			</form>
		</div>
	</div>
</body>
</html>