<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header" id="header">
	<div class="container header__inner">
		<div class="navbar__collapse--icon">
			<i class="fa fa-bars"></i>
		</div>
		<div class="header__logo">
			<a href="<%=request.getContextPath()%>/IndexServlet"> <img
				class="header__logo-img" src="img/logo.jpg" alt="">
				<img
				class="header__logo-img" src="views/frontend/img/logo.jpg" alt="">
			</a>
		</div>
		<div class="header__main--search">
			<input type="text" class="header__main--search-input"
				placeholder="Tìm kiếm" name="textSearch"> <a
				href="/search/keyword/" class="header__main--search-btn"> <i
				class="fas fa-search"></i>
			</a>
		</div>
		<div class="header__aside">
			<div class="header__aside--info">


				<c:choose>
					<c:when test="${sessionScope.user != null}">
						<ul class="header__aside--info-top">
							<li><a class="header__aside--info-link"
								href="<%=request.getContextPath()%>/ProfileServlet">Thông
									tin tài khoản</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="header__aside--info-top">
							<li><a class="header__aside--info-link"
								href="<%=request.getContextPath()%>/RegisterServlet">Đăng ký</a></li>
							<li><a class="header__aside--info-link"
								href="<%=request.getContextPath()%>/LoginServlet">Đăng nhập</a></li>
						</ul>
					</c:otherwise>
				</c:choose>

				<div class="header__aside--info-bottom">
					<p>Miễn phí vận chuyển toàn quốc</p>
				</div>
			</div>
			<div class="header__aside--cart">
				<a class="header__aside--cart-icon" href="./cart.html"> <img
					src="./img//cart.jpg" alt=""> <span
					class="header__aside--cart-quantity">0</span>
				</a>
				<div class="header__aside--cart-content">
					<ul class="header__aside--cart-list">
						<li class="header__aside--cart-item"><a
							class="header__aside--cart-img" href=""><img src="" alt=""></a>
							<div class="header__aside--cart-info">
								<a class="header__aside--cart-title" href="">A1527-Áo Len
									Cotton Cổ V Sọc Ngang Túi Lệch</a>
								<p class="header__aside--cart-size"></p>
								<p class="header__aside--cart-view">
									<span class="header__aside--cart-number">1</span><span
										class="header__aside--cart-price">468,000₫</span>
								</p>
							</div>
							<div class="header__aside--cart-action">
								<span><i class="fa fa-times"></i></span>
							</div></li>
					</ul>
					<span class="line"></span>
					<div class="header__aside--cart-total">
						<div class="header__aside--cart-total-text">
							<p class="header__aside--cart-total-left">Tổng tiền:</p>
							<p class="header__aside--cart-total-right">0₫</p>
						</div>
						<div class="header__aside--cart-total-bottom">
							<a class="header__aside--cart-total-link addtocart"
								href="./cart.html">Xem giỏ hàng</a> <a
								class="header__aside--cart-total-link checkout"
								href="./order.html">Thanh toán</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

<nav class="navbar">
	<span class="close"> <i class="fa fa-times"></i>
	</span>
	<div class="guest">
		<div class="guest__image">
			<img src="https://kt.city/static/default-avatar.png"
				class="guest__image--white" alt="">
		</div>
		<div class="guest__info">
			Hello, <strong><%= session.getAttribute("fullname") %></strong>
		</div>
	</div>
	<div class="container">
		<div class="navbar__main">
			<ul class="navbar__main--menu">
				<li><a class="navbar__main--link active"
					href="<%=request.getContextPath()%>/IndexServlet"> <span>Trang
							chủ</span>
				</a></li>
				<li class="hasDropdown"><a class="navbar__main--link"
					href="<%=request.getContextPath()%>/ListProductServlet?category=all">
						<span>Sản phẩm</span> <span> <i
							class="fas fa-caret-down navbar__main--link-icon"></i>
					</span>
				</a>
					<ul class="dropdown-list">
						<li class="dropdown-title"><span class="dropdown-title-icon">
								<i class="fas fa-chevron-left"></i>
						</span> <span class="dropdown-title-text">Sản phẩm</span></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=ao-khoac">Áo
								khoác</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=ao">Áo</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=quan">Quần</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=vay-dam">Váy
								đầm</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=bo-mac-nha">Bộ
								mặc nhà</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=giay">Giày</a></li>
					</ul> <span class="navbar__main--link-right"> <i
						class="fas fa-angle-right"></i>
				</span></li>
				<li><a class="navbar__main--link"
					href="<%=request.getContextPath()%>/ContactServlet"> <span>Liên
							hệ</span>
				</a></li>
			</ul>
			<div class="navbar__main--phone">
				<span class="navbar__main--phone-icon"> <i
					class="fas fa-phone-alt"></i>
				</span> <span class="navbar__main--phone-number">08.88.37.29.29</span>
			</div>
		</div>
	</div>
</nav>