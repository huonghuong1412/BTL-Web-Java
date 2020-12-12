<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Thời trang Enda</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="account__page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="account__page--title">Tài khoản của bạn</h3>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12">
					<div class="account__sidebar">
						<h4 class="account__sidebar--title">Tài khoản</h4>
						<div class="account__sidebar--content">
							<ul class="account__sidebar--list">
								<li><a class="account__sidebar--link" href="<%=request.getContextPath()%>/ProfileServlet">Thông
										tin tài khoản</a></li>
										<li><a class="account__sidebar--link" href="<%=request.getContextPath()%>/UpdateProfileServlet">Thay đổi thông tin</a></li>
										<li><a class="account__sidebar--link" href="<%=request.getContextPath()%>/HistoryOrderServlet">Lịch sử đặt hàng</a></li>
								<li>
								<a href="<%=request.getContextPath()%>/LogoutServlet" class="account__sidebar--link">Đăng
										xuất
										</a>
										</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12">
					<div class="account__info">
						<h3 class="account__info--title">Thông tin tài khoản</h3>
						<h2 class="account__info--name">Họ tên: <%=session.getAttribute("fullname") %></h2>
						<h2 class="account__info--email">Tài khoản: <%=session.getAttribute("username") %></h2>
						<h2 class="account__info--email">Địa chỉ: <%=session.getAttribute("address") %></h2>
						<h2 class="account__info--email">Số điện thoại: <%=session.getAttribute("phone") %></h2>
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