<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/grid.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/responsive.css">
<title>Thời trang Enda</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="slides">
		<div class="slideshow-container">
			<div class="mySlides fade">
				<img src="img/slideshow_1.jpg" style="width: 100%">
			</div>

			<div class="mySlides fade">
				<img src="img/slideshow_2.jpg" style="width: 100%">
			</div>

			<div class="mySlides fade">
				<img src="img/slideshow_3.jpg" style="width: 100%">
			</div>

			<div class="mySlides fade">
				<img src="img/slideshow_4.jpg" style="width: 100%">
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

	<%@include file="Footer.jsp"%>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/all.min.js"></script>
	<script src="js/main.js"></script>
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