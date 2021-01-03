<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/admin/img/favicon.png"
	type="image/png" />
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/admin/css/add.css">
<link rel="stylesheet" href="views/admin/css/admin.css">
<link rel="stylesheet" href="views/admin/css/detail.css">
<link rel="stylesheet" href="views/admin/css/order.css">
<title>Quản lý cửa hàng</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Thống kê sản phẩm</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="products__page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">STT</th>
								<th style="width: 150px;">Mã sản phẩm</th>
								<th style="width: 300px;">Tên sản phẩm</th>
								<th style="width: 150px;">Đơn giá</th>
								<th style="width: 150px;">Loại sản phẩm</th>
								<th style="width: 200px;">Số lần được mua</th>
							</tr>
						</thead>
						<tbody>
							<%
								int index = 0;
							%>
							<c:forEach var="product" items="${products }">

								<tr>
									<td><%=index = index + 1%></td>

									<td>${product.productID}</td>

									<td>${product.productName }</td>
									<td><fmt:setLocale value="vi-VN" /> <fmt:formatNumber
											value="${product.price}" type="currency" /></td>
									<td>${product.categoryName }</td>
									<td>${product.times }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<p class="total-report"
						style="font-size: 1.8rem; margin: 20px 0; font-weight: bold">
						Số sản phẩm đã bán: <span style="color: red"> ${count} </span>
					</p>
					<p class="total-report"
						style="font-size: 1.8rem; font-weight: bold">
						Doanh thu:
						<span style="color: red">
							<fmt:setLocale value="vi-VN" />
						<fmt:formatNumber value="${total}" type="currency" />
						</span>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>