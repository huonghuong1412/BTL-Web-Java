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
					<h3 class="bg-banner-title">Quản lý danh mục</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="products__page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 products__list">
					<a class="btn-search" href="<%=request.getContextPath()%>/AddCategoryServlet">Thêm danh mục</a>
				</div>
				<div class="col-lg-12 col-md-12">
					<table class="table table-striped table-bordered table-hover" style="width: 500px">
						<thead>
							<tr>
								<th style="width: 100px">STT</th>
								<th style="width: 100px">Tên danh mục</th>
								<th style="width: 100px">Hành động</th>
							</tr>
						</thead>
						<tbody>
							<% int index = 0; %>
							<c:forEach var="category" items="${categories }">

								<tr>
									<td style="width: 100px"><%=index = index + 1%></td>
									
									<td style="width: 100px">${category.categoryName}</td>
									<td style="width: 100px">
									<a class="btn-delete" 
										href="<%=request.getContextPath()%>/DeleteCategoryServlet?CategoryID=${category.categoryID}">
										Xoá danh mục
									</a></td>
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