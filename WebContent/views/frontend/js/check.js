let form = document.getElementById('form-1');

function loading() {
    let btnRegister = document.querySelector('.signup-btn');
    btnRegister.innerText = "Loading...";
    btnRegister.style.backgroundColor = "#f76c6c";
    setTimeout(function () {
        checkRegister();
        btnRegister.style.backgroundColor = "red";
        btnRegister.innerText = "Đăng ký";
    }, 1000)
}

function checkRegister() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    var passwordConfirm = document.getElementById('passwordConfirm').value;
    var fullname = document.getElementById('fullname').value;
    var address = document.getElementById('address').value;
    var phone = document.getElementById('phone').value;
    var message = document.querySelectorAll('.form-message');
    var messageError = document.querySelector('.form-message-error');

    var regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    var regexPass = /^(?=.*[A-Za-z])(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

    // if (username === "" && password === "" && passwordConfirm === "" && fullname === "" && phone === "") {
    //     for (let i = 0; i < message.length; i++) {
    //         message[i].innerText = "Vui lòng nhập đầy đủ thông tin";

    //     }
    //     return false;
    // } else {
    //     for (let i = 0; i < message.length; i++) {
    //         message[i].innerText = "";
    //     }
    // }

    if (username === "") {
        message[0].innerText = "Vui lòng nhập tên tài khoản";
        return false;
    } else {
        message[0].innerText = "";
    }
    if (password === "") {
        message[1].innerText = "Vui lòng nhập mật khẩu";
        return false;
    } else {
        message[1].innerText = "";
    }
    if (passwordConfirm === "") {
        message[2].innerText = "Vui lòng nhập mât khẩu xác nhận";
        return false;
    } else {
        message[2].innerText = "";
    }
    if (fullname === "") {
        message[3].innerText = "Vui lòng nhập họ tên";
        return false;
    } else {
        message[3].innerText = "";
    } 
    if (phone === "") {
        message[5].innerText = "Vui lòng nhập số điện thoại";
        return false;
    } else {
        message[5].innerText = "";
    } 
    if (address === "") {
        message[4].innerText = "Vui lòng nhập số điện thoại";
        return false;
    } else {
        message[4].innerText = "";
    } 
    if (password !== passwordConfirm) {
        messageError.innerText = "Mật khẩu xác nhận không khớp."
        return false;
    } else {
        messageError.innerText = ""
    } 
    if (regexPass.test(password) === false) {
        message[1].innerText = "Mật khẩu phải đúng định dạng";
        return false;
    } else {
        message[1].innerText = "";
    }
    if (regex.test(phone) === false) {
        message[5].innerText = "Sai định dạng số điện thoại.";
        return false;
    } else {
        message[5].innerText = "";
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
    }
}

form.addEventListener('submit', function (e) {
//    e.preventDefault();
    loading();
})