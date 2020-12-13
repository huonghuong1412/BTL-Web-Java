<%@page import="models.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/grid.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" href="css/responsive.css">

<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/cart.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Thời trang Enda</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<%
		String username = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					username = cookie.getValue();
				}
			}
		}
	%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Giỏ hàng</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="cart__page">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2 class="cart--title">Giỏ hàng</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="table-responsive">
						<table class="table product-table"
							style="border-bottom: 1px solid rgb(225, 225, 225);">
							<thead>
								<tr>
									<th></th>
									<th>Tên Sản phẩm</th>
									<th>Giá tiền</th>
									<th>Số lượng</th>
									<th>Tổng cộng</th>
									<th></th>
								</tr>
							</thead>

							<%
								ProductDAO productDAO = new ProductDAO();
								double total = 0;
								ArrayList<Cart> cart = null;
								if (session.getAttribute("cart") != null) {
									cart = (ArrayList<Cart>) session.getAttribute("cart");
								}
							%>

							<tbody>
								<%
									if (cart != null) {
										for (Cart c : cart) {
											total = total + (c.getQuantity()
													* productDAO.getProductByIdCart(c.getProduct().getProductID()).getPrice());
								%>

								<tr>
									<th><img
										src="Contents/Image/Product/<%=productDAO.getProductById(c.getProduct().getProductID()).getImage()%>"
										alt=""></th>
									<th><%=productDAO.getProductByIdCart(c.getProduct().getProductID()).getProductName()%></th>
									<th><fmt:setLocale value="vi-VN" /> <fmt:formatNumber
											value="<%=productDAO.getProductByIdCart(c.getProduct().getProductID()).getPrice()%>"
											type="currency" /></th>
									</th>
									<th>
										<div class="detail-product-quantity">
											<div class="detail-product-action">
												<a class="detail-product-quantity-btn"
													href="<%=request.getContextPath()%>/CartServlet?command=deleteCart&ProductID=<%=c.getProduct().getProductID()%>">-</a>
												<span class="qty"><%=c.getQuantity()%></span> <a
													href="<%=request.getContextPath()%>/CartServlet?command=addCart&ProductID=<%=c.getProduct().getProductID()%>"
													class="detail-product-quantity-btn">+</a>
											</div>
										</div>
									</th>
									<th><fmt:setLocale value="vi-VN" /> <fmt:formatNumber
											value="<%=productDAO.getProductByIdCart(c.getProduct().getProductID()).getPrice() * c.getQuantity()%>"
											type="currency" /></th>
									<th><a class="close-btn"
										href="<%=request.getContextPath()%>/CartServlet?command=removeCart&ProductID=<%=c.getProduct().getProductID()%>">
											<i class="fa fa-times"></i>
									</a></th>
								</tr>

								<%
									}
									}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row cart__list--btn">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="cart__total">
						<h3 class="cart__total--text">
							Tổng cộng: <span class="cart__total--price"> <fmt:setLocale
									value="vi-VN" /> <fmt:formatNumber value="<%=total%>"
									type="currency" />

							</span>
						</h3>
					</div>
					<div class="cart__action" style="float: right;">
						<a class="cart__action--btn"
							href="<%=request.getContextPath()%>/ListProductServlet?category=all">
							<i class="fas fa-caret-left"></i>Tiếp tục mua hàng
						</a> <a class="cart__action--btn"
							href="<%=request.getContextPath()%>/OrderServlet?username=<%=username%>">Đặt hàng<i
							class="fas fa-caret-right"></i>
						</a>
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