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
function isVietnamesePhoneNumber(number) {
    return /(03|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
}

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
        alert("Nhập họ tên");
        return false;
    }
    else if (password === "") {
        alert("Nhập mật khẩu");
        return false;
    }
    else if (passwordConfirm === "") {
        alert("Nhập mật khẩu xác nhận");
        return false;
    }
    else if (email === "") {
        alert("Nhập email");
        return false;
    }
    else if (phone === "") {
        alert("Nhập  số điện thoại");
        return false;
    }
    else if (password !== passwordConfirm) {
        alert("Không khớp mật khẩu")
        return false;
    } else if (regexPass.test(password) === false) {
        alert("Nhập mật khẩu đúng định dạng")
        return false;
    }
    else if (regex.test(phone) === false) {
        alert("Sai định dạng số điện thoại")
        return false;
    } else if (regexEmail.test(email) === false) {
        alert("Sai định dạng email")
        return false;
    } else {
        alert("Đăng ký thành công")
    }
}

function checkLogin() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    if (username === "") {
        alert("Nhập username");
        return false;
    } else if (password === "") {
        alert("Nhập mật khẩu");
        return false;
    } else {
        alert("Đăng nhập thành công")
    }
}