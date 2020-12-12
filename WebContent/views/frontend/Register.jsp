<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Register</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Đăng ký tài khoản</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="user__page">
		<div class="container">
			<div class="user__page--inner">
				<form action="<%=request.getContextPath()%>/RegisterServlet" method="post" class="form-user" name="myForm"
					onsubmit="return(checkRegister());">
					<div class="form-control">
						<label class="textLabel">Họ và tên</label> <input type="text"
							id="fullname" class="input" required="" name="fullname"
							placeholder="Họ và tên">
					</div>
					<div class="form-control">
						<label class="textLabel">Username</label> <input type="text"
							id="username" class="input" required="" name="username"
							placeholder="Username">
					</div>
					<div class="form-control">
						<label class="textLabel">Mật khẩu</label> <input type="password"
							id="password" required="" name="password" placeholder="Password">
					</div>
					<div class="form-control">
						<label class="textLabel">Nhập lại</label> <input type="password"
							id="passwordConfirm" required="" name="passwordConfirm"
							placeholder="Password Confirm">
					</div>
					<div class="form-control">
						<label class="textLabel">Số điện thoại</label> <input type="text"
							id="phone" required="" name="phone" placeholder="Phone">
					</div>
					<div class="form-control">
						<label class="textLabel">Địa chỉ</label> <input type="text"
							id="address" required="" name="address" placeholder="Address">
					</div>
					<div class="form-control">
						<input type="submit" class="signup-btn" onclick="checkRegister()" value="Đăng ký">
							
			
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="app">
		<h1 style="text-align: center">Register Form</h1>
		<div class="form">
			<form action="<%=request.getContextPath()%>/RegisterServlet"
				method="post">
				<div class="form-input">
					<label>User name: </label> <input type="text" name="username">
				</div>
				<div class="form-input">
					<label>Password: </label> <input type="password" name="password">
				</div>
				<div class="form-input">
					<label>Name: </label> <input type="text" name="fullname">
				</div>
				<div class="form-input">
					<label>Address: </label> <input type="text" name="address">
				</div>
				<div class="form-input">
					<label>Phone: </label> <input type="text" name="phone">
				</div>
				<div>
					<input class="btn" type="submit" value="Sign up">
				</div>
			</form>
		</div>
	</div>

	<%@include file="Footer.jsp"%>


	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script>
	function checkRegister() {
	    event.preventDefault();
	    var username = document.getElementById('username').value
	    var password = document.getElementById('password').value;
	    var passwordConfirm = document.getElementById('passwordConfirm').value;
	    var email = document.getElementById('email').value;
	    var phone = document.getElementById('phone').value;
	    var regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
	    // var regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])()[0-9a-zA-Z]{8,}$/;
	    var regexPass = /^(?=.*[A-Za-z])(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	    var regexEmail = /\S+@\S+\.\S+/;

	    if (username === "") {
	        alert("Nháº­p há» tĂªn");
	        return false;
	    }
	    else if (password === "") {
	        alert("Nháº­p máº­t kháº©u");
	        return false;
	    }
	    else if (passwordConfirm === "") {
	        alert("Nháº­p máº­t kháº©u xĂ¡c nháº­n");
	        return false;
	    }
	    else if (email === "") {
	        alert("Nháº­p email");
	        return false;
	    }
	    else if (phone === "") {
	        alert("Nháº­p  sá»‘ Ä‘iá»‡n thoáº¡i");
	        return false;
	    }
	    else if (password !== passwordConfirm) {
	        alert("KhĂ´ng khá»›p máº­t kháº©u")
	        return false;
	    } else if (regexPass.test(password) === false) {
	        alert("Nháº­p máº­t kháº©u Ä‘Ăºng Ä‘á»‹nh dáº¡ng")
	        return false;
	    }
	    else if (regex.test(phone) === false) {
	        alert("Sai Ä‘á»‹nh dáº¡ng sá»‘ Ä‘iá»‡n thoáº¡i")
	        return false;
	    } else if (regexEmail.test(email) === false) {
	        alert("Sai Ä‘á»‹nh dáº¡ng email")
	        return false;
	    } else {
	        alert("ÄÄƒng kĂ½ thĂ nh cĂ´ng")
	    }
	}
	</script>
	<script src="views/frontend/js/main.js"></script>
</body>
</html>