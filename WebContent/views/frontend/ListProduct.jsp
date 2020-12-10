<%@page import="models.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/products.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Thời trang Enda</title>
</head>
<body>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Tất cả sản phẩm</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="main__content">
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
								<li><a class="sidebar__inner--link" href="/">Tất cả sản
										phẩm</a></li>
								<li><a class="sidebar__inner--link" href="/">Áo khoác</a></li>
								<li><a class="sidebar__inner--link" href="/">Áo</a></li>
								<li><a class="sidebar__inner--link" href="/">Quần</a></li>
								<li><a class="sidebar__inner--link" href="/">Váy đầm</a></li>
								<li><a class="sidebar__inner--link" href="/">Bộ mặc nhà</a>
								</li>
								<li><a class="sidebar__inner--link" href="/">Giày</a></li>
								<li><a class="sidebar__inner--link" href="/">Túi xách</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12">
					<div class="row main__content--inner">
						<div class="main__content-products">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="main__content--heading">
									<h3 class="main__content--heading-title">Tất cả sản phẩm</h3>
									<div class="main__content--heading-sort">
										<span>Sắp xếp theo: </span> <select name="" id="">
											<option value="">Tên A-Z</option>
											<option value="">Tên Z-A</option>
											<option value="">Giá cao đến thấp</option>
											<option value="">Giá thấp đến cao</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="row products__list">
								AAA
									<c:forEach items="${products}" var="product">
										BBB
										<%
											Product product = (Product) pageContext.getAttribute("product");
												double price = (double) product.getPrice();
												DecimalFormat formatter = new DecimalFormat("###,###,###");
										%>
										<div class="col-lg-3 col-md-3 col-sm-6 col-no-padding">
											<div class="products__item">
												<div class="products__item--img">
													<a href="./product.html"> <img
														src="Contents/Image/Product/${product.image }">
													</a>
													<div class="products__item--actions">
														<div class="products__item--actions-cart">
															<button type="button"
																class="products__item--actions-link">
																<i class="fa fa-shopping-bag"></i>
															</button>
														</div>
														<div class="products__item--actions-detail">
															<a class="products__item--actions-link"
																href="./product.html"> <i class="far fa-clone"></i>
															</a>
														</div>
														<div class="products__item--actions-quick">
															<button class="products__item--actions-link">
																<i class="fa fa-eye"></i>
															</button>
														</div>
													</div>
												</div>
												<div class="products__item--info">
													<h3 class="products__item--info-name">
														<a class="products__item--info-link" href="./product.html">
															${product.ProductName} </a>
													</h3>
													<p class="products__item--info-price"><%=formatter.format(price)%>đ
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/main.js"></script>
</body>
</html>