<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/frontend/img/favicon.png" type="image/png" />
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Login</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Đăng nhập</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="user__page">
		<div class="container">
			<div class="user__page--inner">
				<form action="<%=request.getContextPath()%>/login" class="form-user"
					name="myForm" method="post" onsubmit="return(checkLogin());" id="form-1">
					<div class="form-control">
						<label class="textLabel">Username</label> <input type="text"
							id="username" required="" name="username" placeholder="Username">
						<p class="form-message"></p>
					</div>
					<div class="form-control">
						<label class="textLabel">Mật khẩu</label> <input type="password"
							id="password" required="" name="password" placeholder="Password">
						<p class="form-message"></p>
					</div>
					<c:if test="${message != null}">
						<div class="form-control">
							<p class="form-message-error">Đăng nhập thất bại.</p>
						</div>
					</c:if>
					<div class="form-control">
						<button type="submit" class="signup-btn" onclick="checkLogin()">
							Đăng nhập</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="Footer.jsp"%>


	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/main.js"></script>
</body>
</html>