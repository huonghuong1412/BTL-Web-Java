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
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Thời trang Enda</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="slides">
		<div class="slideshow-container">
			<div class="mySlides fade">
				<img src="views/frontend/img/slideshow_1.jpg" style="width: 100%">
			</div>

			<div class="mySlides fade">
				<img src="views/frontend/img/slideshow_2.jpg" style="width: 100%">
			</div>

			<div class="mySlides fade">
				<img src="views/frontend/img/slideshow_3.jpg" style="width: 100%">
			</div>

			<div class="mySlides fade">
				<img src="views/frontend/img/slideshow_4.jpg" style="width: 100%">
			</div>

			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>

		</div>
		<br>

		<div style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span> <span class="dot"
				onclick="currentSlide(4)"></span>
		</div>
	</div>

	<div class="products__main">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="products__main--title">
						<h3 class="products__main--title-small">Sản phẩm</h3>
						<h2 class="products__main--title-big">Sản phẩm</h2>
						<p class="products__main--title-icon">
							<img src="views/frontend/img/icon_featured.jpg" alt="">
						</p>
					</div>
				</div>
			</div>
			<div class="row products__list">
				<c:forEach var="product" items="${list1}">
					<div class="col-lg-3 col-md-3 col-sm-6 col-no-padding">
						<div class="products__item">
							<div class="products__item--img">
								<a
									href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
									<img src="Contents/Image/Product/${product.image}">
								</a>
								<div class="products__item--actions">
									<div class="products__item--actions-cart">
										<a
											href="<%=request.getContextPath()%>/CartServlet?command=addCart&ProductID=${product.productID }"
											class="products__item--actions-link" id="button-bag"> <i
											class="fa fa-shopping-bag"></i>
										</a>
									</div>
									<div class="products__item--actions-detail">
										<a class="products__item--actions-link"
											href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
											<i class="far fa-clone"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="products__item--info">
								<h3 class="products__item--info-name">
									<a class="products__item--info-link"
										href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
										${product.productName} </a>
								</h3>
								<p class="products__item--info-price">
									<span> <fmt:setLocale value="vi-VN" /> <fmt:formatNumber
											value="${product.price}" type="currency" />
									</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 text-center">
				<a class="btn btn-readmore" href="<%=request.getContextPath()%>/ListProductServlet?category=all"> Xem thêm </a>
			</div>

			<div class="row banner">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="banner__content">
						<div class="banner__content--text">
							<span class="banner__content--text-title">MIỄN PHÍ SHIP
								TOÀN QUỐC và <strong>GIẢM 5% nếu nhập mã UD5 khi đặt
									hàng</strong>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="products__main--title">
						<h3 class="products__main--title-small">Giày</h3>
						<h2 class="products__main--title-big">Giày</h2>
						<p class="products__main--title-icon">
							<img src="views/frontend/img/icon_featured.jpg" alt="">
						</p>
					</div>
				</div>
			</div>

			<div class="row products__list">
				<c:forEach var="product" items="${list2}">
					<div class="col-lg-3 col-md-3 col-sm-6 col-no-padding">
						<div class="products__item">
							<div class="products__item--img">
								<a
									href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
									<img src="Contents/Image/Product/${product.image}">
								</a>
								<div class="products__item--actions">
									<div class="products__item--actions-cart">
										<a
											href="<%=request.getContextPath()%>/CartServlet?command=addCart&ProductID=${product.productID }"
											class="products__item--actions-link" id="button-bag"> <i
											class="fa fa-shopping-bag"></i>
										</a>
									</div>
									<div class="products__item--actions-detail">
										<a class="products__item--actions-link"
											href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
											<i class="far fa-clone"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="products__item--info">
								<h3 class="products__item--info-name">
									<a class="products__item--info-link"
										href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
										${product.productName} </a>
								</h3>
								<p class="products__item--info-price">
									<span> <fmt:setLocale value="vi-VN" /> <fmt:formatNumber
											value="${product.price}" type="currency" />
									</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="col-lg-12 col-md-12 col-sm-12 text-center">
					<a class="btn btn-readmore" href="<%=request.getContextPath()%>/ListProductServlet?category=Giày"> Xem thêm </a>
				</div>
			</div>

		</div>
	</div>




	<%@include file="Footer.jsp"%>
	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/main.js"></script>
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" activeSlide",
						"");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " activeSlide";
		}
	</script>
</body>
</html>