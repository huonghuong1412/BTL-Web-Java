<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Thời trang Enda</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Lịch sử đặt hàng</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="user__page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 col-md-12">
					<div class="table-responsive">
						<table class="table order-table"
							style="border: 1px solid rgb(225, 225, 225);">
							<thead>
								<tr>
									<th style="border: 1px solid rgb(0, 0, 0);">Tên Sản phẩm</th>
									<th style="border: 1px solid rgb(0, 0, 0);">Loại Sản phẩm</th>
									<th style="border: 1px solid rgb(0, 0, 0);">Số lượng</th>
									<th style="border: 1px solid rgb(0, 0, 0);">Đơn giá</th>
									<th style="border: 1px solid rgb(0, 0, 0);">Thành tiền</th>
									<th style="border: 1px solid rgb(0, 0, 0);">Ngày mua</th>
									<th style="border: 1px solid rgb(0, 0, 0);">Trạng thái</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="history" items="${histories}">
								<tr>
									<th style="border: 1px solid rgb(0, 0, 0);">
										${history.productName}
									</th>
									<th style="border: 1px solid rgb(0, 0, 0);">
										${history.categoryName}
									</th>
									<th style="border: 1px solid rgb(0, 0, 0);">
										${history.quantity}
									</th>
									<th style="border: 1px solid rgb(0, 0, 0);">
										${history.unitPrice}
									</th>
									<th style="border: 1px solid rgb(0, 0, 0);">
										${history.thanhTien}
									</th>
									<th style="border: 1px solid rgb(0, 0, 0);">
										${history.dateBuy}
									</th>
									<th style="border: 1px solid rgb(0, 0, 0);">
										
										<c:choose>
											<c:when test="${history.status == 0}">Chưa giao hàng</c:when>
											<c:when test="${history.status == 1}">Đã nhận hàng</c:when>
											<c:when test="${history.status == 2}">Đã huỷ đơn</c:when>
										</c:choose>
									</th>
								</tr>
							</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="jumbotron text-center">
						<a class="back-btn" href="<%=request.getContextPath()%>/home">Trở lại
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