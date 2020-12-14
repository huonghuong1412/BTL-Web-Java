<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Product</title>
	<link rel="icon" href="<%=request.getContextPath()%>/asset/img/favicon.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/all.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/grid.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/asset/admin.css">
</head>
<body>
	<header class="header">
        <div class="header-inner">
            <div class="logo">
                <a aria-current="page" class="active" href="/">
                    <img src="https://theme.hstatic.net/1000239816/1000467243/14/logo.png?v=186" alt="">
                </a>
            </div>
            <ul class="menu">
                <li class="menu-item">
                    <a class="menu-link" href="./products.html">Products</a>
                </li>
                <li class="menu-item">
                    <a class="menu-link" href="./orders.html">Orders</a>
                </li>
                <li class="menu-item">
                    <a class="menu-link" href="./blogs.html">Blog</a>
                </li>
            </ul>
        </div>
    </header>

	<div class="bg-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="bg-banner-title">
                        Quản lý sản phẩm
                    </h3>
                </div>
            </div>
        </div>
    </div>

	<div class="products__page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 products__list">
                    <a class="btn-search" href="./add.html">Add Product</a>
                    <div class="search__form">
                        <input type="text" placeholder="Search" class="form-control" name="textSearch" value=""
                            style="width: 300px;">
                        <button class="btn-search">Search</button>
                    </div>
                    <div class="main__content--heading-sort">
                        <span>Sắp xếp theo: </span>
                        <select name="" id="">
                            <option value="">Giá giảm dần</option>
                            <option value="">Giá tăng dần</option>
                            <option value="">Tên A - Z</option>
                            <option value="">Tên Z - A</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>ProductID</th>
                                <th>Name</th>
                                <!-- <th style="width: 100px;">SKU</th> -->
                                <th style="width: 100px;">Price</th>
                                <th style="width: 100px;">Quantity</th>
                                <th style="width: 100px;">Description</th>
                                <th style="width: 15%;">Material</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
	                        <c:forEach var="product" items="${productList}">
								<tr>
									<td></td>
									<td><c:out value="${product.idProduct}" /></td>
									<td><c:out value="${product.nameProduct}" /></td>
									<td><c:out value="${product.price}" /></td>
									<td><c:out value="${product.quantity}" /></td>
									<td></td>
									<td></td>
									<td>
										<a class="btn-view" href="detail-product?id=<c:out value='${product.idProduct}'/>">Detail</a>
										&nbsp;&nbsp;&nbsp;
										<a class="btn-edit" href="edit-product?id=<c:out value='${product.idProduct}'/>">Edit</a>
										&nbsp;&nbsp;&nbsp;
										<a class="btn-delete" href="delete-product?id=<c:out value='${product.idProduct}'/>">Delete</a>
									</td>
								</tr>
							</c:forEach>
                            
                        </tbody>
                    </table>
                    <div>
                        <ul class="pagination-numbers">
                            <li class="pagination-btn active">1</li>
                            <li class="pagination-btn ">2</li>
                            <li class="pagination-btn ">3</li>
                            <li class="pagination-btn ">4</li>
                            <li class="pagination-btn ">5</li>
                            <li class="pagination-btn ">6</li>
                            <li class="pagination-btn ">7</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<%-- <table style="border: 1px solid black;" class="">
		<thead>
			<tr>
				<th>ProductID</th>
				<th>ProductName</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<!-- for (Todo todo: todos) { -->
			<c:forEach var="product" items="${productList}">
				<tr>
					<td>
						<c:out value="${product.idProduct}" />
					</td>
					<td><c:out value="${product.nameProduct}" /></td>
					<td><c:out value="${product.price}" /></td>
					<td><c:out value="${product.quantity}" /></td>
					<td><a href="edit-product?id=<c:out value='${product.idProduct}'/>">Edit</a>
						&nbsp;&nbsp;&nbsp;
						<a href="delete-product?id=<c:out value='${product.idProduct}'/>">Delete</a>
					</td>
				</tr>
			</c:forEach>
			<!-- } -->
		</tbody>
	</table> --%>
<%-- 	<a href="<%=request.getContextPath()%>/product-new">New Product</a> --%>
	
	<script src="<%=request.getContextPath()%>/asset/js/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/asset/js/all.min.js"></script>
    <script src="<%=request.getContextPath()%>/asset/js//main.js"></script>
</body>
</html>