<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/admin/img/favicon.png" type="image/png" />
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
					<h3 class="bg-banner-title">Quản lý khách hàng</h3>
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
								<th style="width: 150px;">Mã khách hàng</th>
								<th style="width: 250px;">Họ tên</th>
								<th style="width: 250px;">Địa chỉ</th>
								<th style="width: 200px;">Số điện thoại</th>
								<th style="width: 180px;">Số lần mua hàng</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<%
								int index = 0;
							%>
							<c:forEach var="customer" items="${customers }">

								<tr>
									<td><%=index = index + 1%></td>
									
									<td>${customer.customerID}</td>
									
									<td>
										${customer.fullName }
									</td>
									<td>
										${customer.address }
									</td>
									<td>
										${customer.phone }
									</td>
									<td>
										${customer.times }
									</td>
									<td style="display: flex; align-items: center; justify-content: space-between">
									<a class="btn-edit" href="<%=request.getContextPath()%>/detailcustomer?CustomerID=${customer.customerID}">Xem chi tiết</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>