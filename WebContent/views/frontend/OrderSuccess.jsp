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
<link rel="stylesheet" href="views/frontend/css/order.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Login</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="checkout__page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="jumbotron text-center">
						<h1 class="order-title">ĐẶT HÀNG THÀNH CÔNG
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="jumbotron text-center">

						<h1 class="display-3">Thank You!</h1>
						<p class="lead">
							<strong>Cảm ơn bạn</strong> vì đã sử dụng dịch vụ của chúng tôi !
						</p>
					</div>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="jumbotron text-center">
						<a class="back-btn" href="<%=request.getContextPath()%>/IndexServlet">Trở lại
							trang chủ</a>
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