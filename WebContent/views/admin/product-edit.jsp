<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<link rel="icon"
	href="<%=request.getContextPath()%>/asset/img/favicon.png">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/css/grid.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/css/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/admin.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/add.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/cart.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/detail.csss">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/contact.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/home.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/order.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/product.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/products.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/user.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/asset/responsive.css">



</head>
<body>

	<header class="header">
		<div class="header-inner">
			<div class="logo">
				<a aria-current="page" class="active" href="/"> <img
					src="https://theme.hstatic.net/1000239816/1000467243/14/logo.png?v=186"
					alt="">
				</a>
			</div>
			<ul class="menu">
				<li class="menu-item"><a class="menu-link"
					href="./products.html">Products</a></li>
				<li class="menu-item"><a class="menu-link" href="./orders.html">Orders</a>
				</li>
				<li class="menu-item"><a class="menu-link" href="./blogs.html">Blog</a>
				</li>
			</ul>
		</div>
	</header>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Sửa sản phẩm</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="manage__page">
		<div class="container">
			<div class="add-product-form">
				<form action="product-update" method="POST">
					<label style="display: block; width: 100px;">ProductID</label> <input
						type="text" value="<c:out value='${productInfo.idProduct}' />"
						class="form-control" name="idP"> <br /> <label
						style="display: block; width: 100px;">Product Name</label> <input
						type="text" value="<c:out value='${productInfo.nameProduct}' />"
						class="form-control" name="name" required="required"> <br />

					<label style="display: block; width: 100px;">Price</label> <input
						type="text" value="<c:out value='${productInfo.price}' />"
						class="form-control" name="price" required="required"> <br />
					<label style="display: block; width: 100px;">Quantity</label> <input
						type="text" value="<c:out value='${productInfo.quantity}' />"
						class="form-control" name="quantity" required="required">
					<br /> <label style="display: block; width: 100px;">Image :</label>
					<p>
						<c:out value='${productInfo.image}' />
					</p>
					<label style="display: block; width: 100px;" for="myfile">Select
						a file:</label> <input type="file" id="myfile" name="image"><br>
					<br> <label style="display: block; width: 100px;">Description</label>
					<input type="text"
						value="<c:out value='${productInfo.description}' />"
						class="form-control" name="description"> <br /> <label
						style="display: block; width: 100px;">Material</label> <input
						type="text" value="<c:out value='${productInfo.material}' />"
						class="form-control" name="material"> <br> <input
						type="submit" value="Submit" />
				</form>

			</div>
		</div>
	</div>



	<script
		src="<%=request.getContextPath()%>/asset/js/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/asset/js/all.min.js"></script>
	<script src="<%=request.getContextPath()%>/asset/js//main.js"></script>
</body>
</html>