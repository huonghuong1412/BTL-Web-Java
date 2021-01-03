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
					<h3 class="bg-banner-title">Quản lý đơn đặt hàng</h3>
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
								<th style="width: 100px;">Mã sản phẩm</th>
								<th style="width: 100px;">Số lượng</th>
								<th style="width: 150px;">Tổng tiền</th>
								<th style="width: 150px;">Trạng thái</th>
								<th style="width: 200px;">Ngày mua</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<%
								int index = 0;
							%>
							<c:forEach var="order" items="${orders }">

								<tr>
									<td><%=index = index + 1%></td>
									
									<td>${order.customerID}</td>
									
									<td>
										${order.productID }
									</td>
									<td>
										${order.quantity }
									</td>
									<td>
									<fmt:setLocale value="vi-VN" /> <fmt:formatNumber
											value="${order.quantity * order.unitPrice }" type="currency" />
										
									</td>
									<td>
										<c:choose>
											<c:when test="${order.status == 0}">Chưa xác nhận</c:when>
											<c:when test="${order.status == 1}">Đã xác nhận</c:when>
											<c:when test="${order.status == 2}">Đã huỷ đơn</c:when>
										</c:choose>
									</td>
									<td>
										${order.dateBuy }
									</td>
									<td style="display: flex; align-items: center; justify-content: space-between">
									<a class="btn-edit" href="<%=request.getContextPath()%>/AdminDetailOrderServlet?OrderID=${order.orderID}">Xem</a> 
									<a class="btn-delete" href="<%=request.getContextPath()%>/ConfirmOrderServlet?OrderID=${order.orderID}">Xác nhận</a>
									<a class="btn-delete" href="<%=request.getContextPath()%>/CancelOrderServlet?OrderID=${order.orderID}">Huỷ đơn</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav aria-label="Page navigation example">
					<ul class="pagination-numbers">
						<c:choose>
							<c:when test="${count%6==0}">
								<c:forEach var="i" begin="1" end="${count/6}">
									<li class="pagination-btn"><a page="${i}"
										class="page-link" href="listorder?page=${i}">${i }</a></li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" begin="1" end="${count/6 + 1 }">
									<li class="pagination-btn"><a page="${i}"
										class="page-link" href="listorder?page=${i}">${i }</a></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

</body>
</html>