<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Register</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="app">
		<div class="bg-banner">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h3 class="bg-banner-title">Đăng ký tài khoản</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="user__page">
			<div class="container">
				<div class="user__page--inner">
					<div class="form">
						<form action="<%=request.getContextPath()%>/RegisterServlet"
							method="post" onsubmit="return(checkRegister());">
							<div class="form-control">
								<label>User name: </label> <input type="text" id="username"
									required="" name="username" placeholder="Tên tài khoản">
							</div>
							<div class="form-control">
								<label>Password: </label> <input type="password" id="password"
									required="" name="password" placeholder="Mật khẩu">
							</div>
							<div class="form-control">
								<label>Confirm: </label> <input type="password"
									id="passwordConfirm" required="" name="passwordConfirm"
									placeholder="Mật khẩu">
							</div>
							<div class="form-control">
								<label>Name: </label> <input type="text" name="fullname"
									id="fullname" required="" placeholder="Họ và tên">
							</div>
							<div class="form-control">
								<label>Address: </label> <input type="text" name="address"
									id="address" required="" placeholder="Địa chỉ">
							</div>
							<div class="form-control">
								<label>Phone: </label> <input type="text" name="phone"
									id="phone" required="" placeholder="Số điện thoại">
							</div>
							<div class="form-control">
								<button type="submit" class="signup-btn"
									onclick="checkRegister()">Đăng ký</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="Footer.jsp"%>

	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/main.js"></script>
</body>
</html>