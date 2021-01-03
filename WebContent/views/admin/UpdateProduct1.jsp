<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/admin/img/favicon.png" type="image/png" />
<link rel="stylesheet" href="views/admin/css/reset.css">
<link rel="stylesheet" href="views/admin/css/all.min.css">
<link rel="stylesheet" href="views/admin/css/grid.css">
<link rel="stylesheet" href="views/admin/css/common.css">
<link rel="stylesheet" href="views/admin/css/add.css">
<title>Quản lý cửa hàng</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Sửa sản phẩm</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="products__page">
		<div class="container">
			<div class="row">
				<form action="<%=request.getContextPath()%>/UpdateProductServlet?id=${product.productID}"
					method="post" enctype="multipart/form-data" style="width: 100%">

					<div class="manage__page">
						<div class="container">
							<div class="add-product-form">
								<div class="form-group">
									<label for="add-productFormAuthor" class=""> Tên sản
										phẩm</label> <input required="" type="text"
										class="form-control input-lg" name="ProductName" value="${product.productName }"
										placeholder="Tên sản phẩm" autocapitalize="words">
								</div>
								<div class="form-group">
									<label for="add-productFormName" class="">Giá sản phẩm</label>
									<input required="" type="text" class="form-control input-lg" value="${product.price }"
										name="Price" placeholder="Giá sản phẩm">
								</div>
								<div class="form-group">
									<label for="add-productFormName" class="">Số lượng</label> <input
										required="" type="number" class="form-control input-lg" value="${product.quantity }"
										name="Quantity" placeholder="Số lượng nhập">
								</div>

								<div class="form-group">
									<label for="add-productFormName" class="">Hình ảnh</label> <input
										required="" type="file" value="${product.image }" name="Image">
								</div>

								<div class="form-group">
									<label for="add-productFormName" class="">Mô tả</label> <input
										required="" type="text" class="form-control input-lg" value="${product.description }"
										name="Description" placeholder="Mô tả sản phẩm">
								</div>
								<div class="form-group">
									<label for="add-productFormName" class="">Chất liệu</label> <input
										required="" type="text" id="add-productFormName" value="${product.material }"
										class="form-control input-lg" name="Material"
										placeholder="Chất liệu">
								</div>
								<div class="form-group">
									<label for="add-productForm1" class=""> Category </label> <select
										id="inputState" class="form-control" name="CategoryID" >
										<option value="1" selected="selected">Áo</option>
										<option value="2">Áo khoác</option>
										<option value="3">Váy đầm</option>
										<option value="4">Quần</option>
										<option value="5">Bộ mặc nhà</option>
										<option value="6">Giày</option>
									</select>
								</div>
								<div class="form-group">
									<button class="btn-view" type="submit">Sửa sản phẩm</button>
									<a class="btn-delete" href="<%=request.getContextPath()%>/AdminProductServlet">Huỷ</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>