<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/order.css">
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

	<div class="checkout__page">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-12 col-sm-12">
					<h1 class="checkout__info--title">Vận chuyển</h1>
					<div class="content-box">
						<div class="content-box__row">
							<div class="radio-wrapper">
								<div class="radio__input">
									<input type="radio" id="input-radio" class="input-radio"
										checked=""> <label for="input-radio"
										class="radio__label"> <span
										class="radio__label__primary">Giao hàng tận nơi</span> <span
										class="radio__label__accessory"> <span
											class="content-box__emphasis">Freeship</span>
									</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<h1 class="checkout__info--title" style="margin-top: 20px;">Thanh
						toán</h1>
					<div class="content-box">
						<div class="content-box__row">
							<div class="radio-wrapper">
								<div class="radio__input">
									<input type="radio" id="input-radio-1" class="input-radio"
										checked=""> <label for="input-radio-1"
										class="radio__label"> <span
										class="radio__label__primary">Thanh toán khi nhận
											hàng</span>
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-12 col-sm-12">
					<h1 class="checkout__info--title">Đơn hàng</h1>
					<div class="checkout__sidebar">
						<div class="checkout__summary">
							<div class="checkout__item">
								<table class="product-table">
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

										<tr class="product">
											<td class="product__image">
												<div class="product-thumbnail">
													<div class="product-thumbnail__wrapper">
														<img
															src="Contents/Image/Product/<%=productDAO.getProductById(c.getProduct().getProductID()).getImage()%>"
															alt="" class="product-thumbnail__image">
													</div>
													<span class="product-thumbnail__quantity"><%=c.getQuantity()%></span>
												</div>
											</td>
											<th class="product__description"><span
												class="product__description__name"> <%=productDAO.getProductByIdCart(c.getProduct().getProductID()).getProductName()%>
											</span> <span class="product__description__property"><%=productDAO.getProductByIdCart(c.getProduct().getProductID()).getMaterial()%></span></th>
											<td class="product__quantity"><%=c.getQuantity()%></td>
											<td class="product__price"><fmt:setLocale value="vi-VN" />
												<fmt:formatNumber
													value="<%=productDAO.getProductByIdCart(c.getProduct().getProductID()).getPrice() * c.getQuantity()%>"
													type="currency" /></td>
										</tr>

										<%
											}
											}
										%>
									</tbody>
								</table>
							</div>
							<div class="checkout__amount">
								<h3 class="checkout__amount-item">
									<span class="checkout__amount--title">Tạm tính</span> <span
										class="checkout__amount--price"> <fmt:setLocale
											value="vi-VN" /> <fmt:formatNumber value="<%=total%>"
											type="currency" />
									</span>
								</h3>
								<h3 class="checkout__amount-item">
									<span class="checkout__amount--title">Phí vận chuyển</span>
									<span class="checkout__amount--price">0₫</span>
								</h3>
								<h3 class="checkout__amount-item total-price">
									<span class="checkout__amount--title">Tổng cộng</span> <span
										class="checkout__amount--price"><fmt:formatNumber
											value="<%=total%>" type="currency" /></span>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-12 col-sm-12">
					<h1 class="checkout__info--title">Thông tin mua và nhận
						hàng</h1>
					<form class="contact-form-group" action="<%=request.getContextPath()%>/OrderServlet?username=<%=username%>&total=<%=total%>" method="post">
						<input 
							type="text" 
							placeholder="Họ và tên" 
							name="fullname"
							class="contact-form-group-input" 
							required=""
							value="<%=session.getAttribute("fullname")%>"> 
							
							<input
								type="text" 
								placeholder="Số điện thoại" 
								name="phone"
								class="contact-form-group-input" 
								required=""
								value="<%=session.getAttribute("phone")%>"> 
							
							<input
								type="text" 
								placeholder="Địa chỉ" 
								name="address"
								class="contact-form-group-input" 
								required=""
								value="<%=session.getAttribute("address")%>">
							
							<textarea 
								placeholder="Ghi chú" 
								rows="3" 
								cols="5" 
								name="note">
							</textarea>
							
							<div class="checkout__btn">
								<button type="submit"
									class="checkout__voucher--btn">ĐẶT HÀNG</button>
							</div>
					</form>
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