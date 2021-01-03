<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="models.Favorite"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="views/frontend/img/favicon.png"
	type="image/png" />
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/cart.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Yêu thích</title>
</head>
<body>
<%@include file="Header.jsp"%>
<div class="bg-banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<h3 class="bg-banner-title">Sản phẩm yêu thích</h3>
			</div>
		</div>
	</div>
</div>

<div class="cart__page">
		<div class="container">
			<div class="row">
				<div class="cart__action" style="float: right;">
				<a class="cart__action--btn" style="width: 70px"
					href="<%=request.getContextPath()%>/ListProductServlet?category=all">
					Back
				</a>

			</div><br/>
			
			</div>
			<div class="row">
				<div class="col-12"><br/>
					<h2 class="cart--title">Sản phẩm đã lưu</h2>
					
				</div>
				
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="table-responsive">
						<table class="table product-table"
							style="border-bottom: 1px solid rgb(225, 225, 225);">
							<thead>
								<tr>
									<th>STT</th>
									<th>Hình ảnh</th>
									<th>Tên Sản phẩm</th>
									<!-- <th>Mô tả</th> -->
									<th>Xem chi tiết</th>
									<th>Bỏ thích</th>
								</tr>
							</thead>
														
							<%
								int stt = 0;
							%>					
							
							<tbody>
							<c:forEach var="p" items="${products}">
								
							<%
								stt +=1;
								
							%>
								<tr>
								
									<td>
										<%=stt %>
									</td>
									<td>
										<%-- <c:out value="${p.image}"/> --%>
										<img
											src="Contents/Image/Product/<c:out value="${p.image}"/>"
											alt="img"
										/>
									</td>
									<td>
										<c:out value="${p.productName}"/>
									</td>
									<%-- <td>
										<c:out value="${p.description}"/>
									</td> --%>
									<td>
										<a class="cart__action--btn"
											href="<%=request.getContextPath()%>/DetailProductServlet?id=<c:out value="${p.productID}"/> ">
											Chi Tiết
										</a>
									</td>
									<td>
										<a class="close-btn"
											href="<%=request.getContextPath()%>/FavouriteServlet?action=remove&ProductID=<c:out value="${p.productID}"/> ">
												<i class="fa fa-times"></i>
										</a>
									</td>
								</tr>
								
							</c:forEach>
							</tbody>
						</table>
						
					</div>
					
				</div>
			</div>
			<div class="cart__action" style="float: right;">
				<a class="cart__action--btn" style="margin: 0"
					href="<%=request.getContextPath()%>/ListProductServlet?category=all">
					<i class="fas fa-caret-left"></i>Tiếp tục mua hàng
				</a>

			</div><br/>
		</div>
	</div>


<%@include file="Footer.jsp"%>

	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/main.js"></script>
</body>
</html>