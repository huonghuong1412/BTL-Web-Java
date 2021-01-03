let form = document.getElementById('form-1');

function loading() {
    let btnRegister = document.querySelector('.signup-btn');
    btnRegister.innerText = "Loading...";
    btnRegister.style.backgroundColor = "#f76c6c";
    setTimeout(function () {
        checkUpdate();
        btnRegister.style.backgroundColor = "red";
        btnRegister.innerText = "Đăng ký";
    }, 1000)
}

function checkUpdate() {
    var newPassword = document.getElementById('newPass').value;
    var passwordConfirm = document.getElementById('newPassConfirm').value;
    var message = document.querySelectorAll('.form-message');
    var messageError = document.querySelector('.form-message-error');
    var regexPass = /^(?=.*[A-Za-z])(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

    if (newPassword === "") {
        message[0].innerText = "Vui lòng nhập mật khẩu mới";
        return false;
    } else {
        message[0].innerText = "";
    }
    if (passwordConfirm === "") {
        message[1].innerText = "Vui lòng nhập mật khẩu xác nhận";
        return false;
    } else {
        message[1].innerText = "";
    }
    if (newPassword !== passwordConfirm) {
        messageError.innerText = "Mật khẩu xác nhận không khớp."
        return false;
    } else {
        messageError.innerText = ""
    } 
    if (regexPass.test(newPassword) === false) {
        message[1].innerText = "Mật khẩu phải đúng định dạng";
        return false;
    } else {
        message[1].innerText = "";
    }
}

form.addEventListener('submit', function (e) {
//    e.preventDefault();
    loading();
})