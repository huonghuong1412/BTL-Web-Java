<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="shortcut icon" href="views/frontend/img/favicon.png"
	type="image/png" />
	<link rel="stylesheet" href="views/frontend/css/reset.css">
	<link rel="stylesheet" href="views/frontend/css/all.min.css">
	<link rel="stylesheet" href="views/frontend/css/grid.css">
	<link rel="stylesheet" href="views/frontend/css/common.css">
	<link rel="stylesheet" href="views/frontend/css/home.css">
	<link rel="stylesheet" href="views/frontend/css/user.css">
	<link rel="stylesheet" href="views/frontend/css/responsive.css">
	<title>Contact Us</title>
</head>
<body>
<%@include file="Header.jsp"%>

<div class="app">
		<div class="bg-banner">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h3 class="bg-banner-title">Thông tin phản hồi</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="user__page">
			<div class="container">
				<div class="user__page--inner">
				
					<div class="form">
						<form action="<%=request.getContextPath()%>/ContactController"
							method="post"  id="form-1">
							<h1>Nếu bạn có thắc mắc gì, có thể gửi yêu cầu cho Enda, Enda sẽ liên lạc lại với bạn sớm nhất có thể.</h1>
							<div class="form-control">
								<label>User name: </label> <input type="text" id="username"
									required="" name="username" value='<c:out value="${username }" ></c:out>' readonly="readonly">
							</div>
							
							<div class="form-control">
								<label>User ID: </label> <input type="text" 
									required="" name="userid" value='<c:out value="${id }" ></c:out>' readonly="readonly"> 
							</div>
							
							<div class="form-control">
								<label>Mail </label> <input type="email" name="mail"
									id="mail" required="" placeholder="Mail">
									<p class="form-message"></p>
							</div>
							
							<div class="form-control">
								<label>Phone: </label> <input type="text" name="phone"
									id="phone" required="" value='<c:out value="${phone}"></c:out>'>
									<p class="form-message"></p>
							</div>
							
							<div class="form-control">
								<label>Phản hồi: </label> 
								<textarea id="feedback" name="feedback" rows="6" cols="33" placeholder="Describe your opinient here..." required></textarea>
								<p class="form-message"></p>
							</div>
							<%
								String msg = request.getParameter("msg");
							if ("valid".equals(msg)) {
							%>
							<h3 style="text-align: center">Gửi phản hồi thành công</h3>
							<%
								}
							%>
							<%
								if ("invalid".equals(msg)) {
							%>
							<h3 style="text-align: center">Vui lòng kiểm tra lại!</h3>
							<%} %>
							<div class="form-control">
								<button type="submit" class="signup-btn">GỬi PHẢN HỒI</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="Footer.jsp"%>
<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/contact.js"></script>

</body>
</html>