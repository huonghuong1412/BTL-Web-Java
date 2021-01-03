<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/frontend/img/favicon.png"
	type="image/png" />
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/product.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Thời trang Enda</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">${product.productName}</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="products__item-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-sm-12 col-md-9">
					<div class="sidebar__sticky sticky-top">
						<div class="sidebar__inner">
							<h3 class="sidebar__inner--title">
								Danh mục <span class="sidebar__inner--responsive"> <i
									class="fa fa-caret-down"></i>
								</span>
							</h3>
							<ul class="sidebar__inner--menu">
								<li><a class="sidebar__inner--link"
									href="<%=request.getContextPath()%>/ListProductServlet?category=all">Tất
										cả sản phẩm</a></li>
								<c:forEach var="category" items="${categories }">

									<li><a class="sidebar__inner--link"
									href="<%=request.getContextPath()%>/ListProductServlet?category=${category.categoryName}">${category.categoryName}</a></li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="product__item--image">
								<img src="Contents/Image/Product/${product.image}" class=""
									alt="">
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="product__item--title">
								<h1>${product.productName}</h1>
								<span>${product.description}</span>
							</div>
							<div class="product__item--price">
								<span> <fmt:setLocale value="vi-VN" /> <fmt:formatNumber
										value="${product.price}" type="currency" />
								</span>
							</div>
							<div class="variants clearfix">
								<form action="<%=request.getContextPath()%>/CartServlet?command=addCart&ProductID=${product.productID }" method="post">
									<div class="selector-wrapper">
										<label>Số lượng</label> <input id="quantity"
											class="selector-wrapper-input" type="number" name="quantity"
											min="1" max="${product.quantity/2}" value="1">
									</div>
									<div class="add-item-btn">
										<button id="add-to-cart" class="btn-detail btn-color-add" type="submit">Thêm vào giỏ</button>
									</div>
								</form>
								<c:if test="${like== 0}">
									<div class="add-item-btn" title="Yêu thích">
										<a
											href="<%=request.getContextPath()%>/FavouriteServlet?action=add&ProductID=${product.productID}">
											<img
											src="https://cdn2.iconfinder.com/data/icons/4web-3/139/favourite-512.png"
											alt="like" width="50" />
										</a>

									</div>
								</c:if>
								<c:if test="${like!=0}">
									<div class="add-item-btn" title="Bỏ thích">
										<a
											href="<%=request.getContextPath()%>/FavouriteServlet?action=remove&ProductID=${product.productID}">
											<img
											src="https://banner2.cleanpng.com/20180318/plw/kisspng-love-heart-love-heart-romance-clip-art-picture-of-red-heart-5aaeb7181ca327.7123730415213995761173.jpg"
											alt="like" width="60" />
										</a>
									</div>
								</c:if>
								<%-- <span>${like}</span> --%>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="product__item--detail">
								<h3 class="product__item--detail-desc">MÔ TẢ SẢN PHẨM</h3>
								<div class="product__item--detail-wrapper">
									<p class="product__item--detail-name">
										${product.productName}</p>
									<p class="product__item--detail-name">Chất liệu:
										${product.material}</p>
									<p class="product__item--detail-name">Hình ảnh sản phẩm</p>
									<div class="list-img">
										<img src="Contents/Image/Product/${product.image}" alt="">
									</div>
								</div>
							</div>
						</div>
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