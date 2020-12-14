<%@page import="models.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
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
				class="header__logo-img" src="img/logo.jpg" alt=""> <img
				class="header__logo-img" src="views/frontend/img/logo.jpg" alt="">
			</a>
		</div>
		<form class="header__main--search"
			action="<%=request.getContextPath()%>/SearchServlet" method="post">
			<input type="text" class="header__main--search-input"
				placeholder="Tìm kiếm" name="search">
			<button type="submit" class="header__main--search-btn">
				<i class="fas fa-search"></i>
			</button>
		</form>
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
				<a class="header__aside--cart-icon"
					href="<%=request.getContextPath()%>/CartServlet?command=viewCart"> <img
					src="views/frontend/img/cart.jpg" alt="">
				</a>
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
			Hello, <strong><%=session.getAttribute("fullname")%></strong>
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
							href="<%=request.getContextPath()%>/ListProductServlet?category=Áo">Áo</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=Áo khoác">Áo
								khoác</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=Quần">Quần</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=Váy đầm">Váy
								đầm</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=Bộ mặc nhà">Bộ
								mặc nhà</a></li>
						<li class="dropdown-item"><a class="navbar__main--link"
							href="<%=request.getContextPath()%>/ListProductServlet?category=Giày">Giày</a></li>
					</ul> <span class="navbar__main--link-right"> <i
						class="fas fa-angle-right"></i>
				</span></li>
			</ul>
			<div class="navbar__main--phone">
				<span class="navbar__main--phone-icon"> <i
					class="fas fa-phone-alt"></i>
				</span> <span class="navbar__main--phone-number">08.88.37.29.29</span>
			</div>
		</div>
	</div>
</nav>