<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="header">
	<div class="header-inner">
		<div class="logo">
			<a aria-current="page" class="active" href="/"> <img
				src="https://theme.hstatic.net/1000239816/1000467243/14/logo.png?v=186"
				alt="">
			</a>
		</div>

		<c:choose>
			<c:when test="${sessionScope.user != null}">
				<ul class="menu">
					<li class="menu-item"><a class="menu-link"
						href="<%=request.getContextPath()%>/AdminProductServlet">Sản phẩm</a></li>
					<li class="menu-item"><a class="menu-link"
						href="<%=request.getContextPath()%>/AdminCategoryServlet"">Danh mục</a></li>
					<li class="menu-item"><a class="menu-link"
						href="<%=request.getContextPath()%>/AdminOrderServlet">Đơn đặt hàng</a></li>
					<li class="menu-item"><a class="menu-link" href="<%=request.getContextPath()%>/AdminLogoutServlet">Đăng xuất</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="header__aside--info-top">
					<li><a class="header__aside--info-link"
						href="<%=request.getContextPath()%>/AdminLoginServlet">Đăng nhập</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</header>