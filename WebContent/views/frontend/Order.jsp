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
	<div class="checkout__page">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-12 col-sm-12">
					<h1 class="checkout__info--title">Thông tin mua và nhận
						hàng</h1>
					<div class="contact-form-group">
						<input type="text" placeholder="Họ và tên" name="name"
							class="contact-form-group-input" required="" value=""> <input
							type="email" placeholder="Email" name="email"
							class="contact-form-group-input" required="" value=""> <input
							type="text" placeholder="Số điện thoại" name="phone"
							class="contact-form-group-input" required="" value=""> <input
							type="text" placeholder="Địa chỉ" name="address"
							class="contact-form-group-input" required="" value="">
						<textarea placeholder="Ghi chú" rows="3" cols="5" name="note"></textarea>
					</div>
				</div>
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
					<h1 class="checkout__info--title">Đơn hàng (4 sản phẩm)</h1>
					<div class="checkout__sidebar">
						<div class="checkout__summary">
							<div class="checkout__item">
								<table class="product-table">
									<tbody>
										<tr class="product">
											<td class="product__image">
												<div class="product-thumbnail">
													<div class="product-thumbnail__wrapper">
														<img src="./img/giay-1.jpg" alt=""
															class="product-thumbnail__image">
													</div>
													<span class="product-thumbnail__quantity">2</span>
												</div>
											</td>
											<th class="product__description"><span
												class="product__description__name">A1527-Áo Len
													Cotton Cổ V Sọc Ngang Túi Lệch</span> <span
												class="product__description__property">A1527</span></th>
											<td class="product__quantity">2</td>
											<td class="product__price">936,000₫</td>
										</tr>
										<tr class="product">
											<td class="product__image">
												<div class="product-thumbnail">
													<div class="product-thumbnail__wrapper">
														<img src="./img/giay-2.jpg" alt=""
															class="product-thumbnail__image">
													</div>
													<span class="product-thumbnail__quantity">1</span>
												</div>
											</td>
											<th class="product__description"><span
												class="product__description__name">Q1004-Quần Jean
													Harem Ống Bo Co Dãn Điểm Túi</span> <span
												class="product__description__property">Q1004-1</span></th>
											<td class="product__quantity">1</td>
											<td class="product__price">568,000₫</td>
										</tr>
										<tr class="product">
											<td class="product__image">
												<div class="product-thumbnail">
													<div class="product-thumbnail__wrapper">
														<img src="./img/giay-3.jpg" alt=""
															class="product-thumbnail__image">
													</div>
													<span class="product-thumbnail__quantity">1</span>
												</div>
											</td>
											<th class="product__description"><span
												class="product__description__name">AK0214-Áo Khoác
													Len Dệt Kim Kẻ Sọc Túi Once</span> <span
												class="product__description__property">AK0214-1</span></th>
											<td class="product__quantity">1</td>
											<td class="product__price">598,000₫</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="checkout__amount">
								<h3 class="checkout__amount-item">
									<span class="checkout__amount--title">Tạm tính</span> <span
										class="checkout__amount--price">2,102,000₫</span>
								</h3>
								<h3 class="checkout__amount-item">
									<span class="checkout__amount--title">Phí vận chuyển</span>
									<span class="checkout__amount--price">0₫</span>
								</h3>
								<h3 class="checkout__amount-item total-price">
									<span class="checkout__amount--title">Tổng cộng</span> <span
										class="checkout__amount--price">2,102,000₫</span>
								</h3>
							</div>
							<div class="checkout__btn">
								<a class="previous-link" href="./cart.html"> <i
									class="previous-link__arrow">❮</i>Quay về giỏ hàng
								</a>
								<button href="./detail.html" class="checkout__voucher--btn"
									onclick="alert('Đặt hàng thành công')">ĐẶT HÀNG</button>
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