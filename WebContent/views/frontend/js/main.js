window.addEventListener("DOMContentLoaded", function () {
    var e = document.querySelector(".navbar");
    var n = document.querySelector(".navbar__collapse--icon");
    var o = document.querySelector(".close");
    n.onclick = function () {
        e.classList.toggle("navbar-resposive")
    };
    o.onclick = function () {
        e.classList.remove("navbar-resposive")
    };
})

function loading() {
    let btnRegister = document.querySelector('.signup-btn');
    btnRegister.innerText = "Loading...";
    btnRegister.style.backgroundColor = "#f76c6c";
    setTimeout(function () {
        checkLogin();
        btnRegister.style.backgroundColor = "red";
        btnRegister.innerText = "Đăng nhập";
    }, 1000)
}


function checkLogin() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    var message = document.querySelectorAll('.form-message');
    var messageError = document.querySelector('.form-message-error');
    if (username === "") {
    	message[0].innerText = "Vui lòng nhập tên tài khoản";
        return false;
    } else {
    	message[0].innerText = "";
    }
    if (password === "") {
    	message[0].innerText = "Vui lòng nhập mật khẩu";
        return false;
    } else {
    	message[0].innerText = "";
    }
}