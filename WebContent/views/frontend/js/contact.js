let form = document.getElementById('form-1');

function loading() {
    let btnRegister = document.querySelector('.signup-btn');
    btnRegister.innerText = "Loading...";
    btnRegister.style.backgroundColor = "#f76c6c";
    setTimeout(function () {
    	checkForm();
        btnRegister.style.backgroundColor = "red";
        btnRegister.innerText = "Đăng ký";
    }, 1000)
}

function checkForm() {
    var mail = document.getElementById('mail').value;
    var phone = document.getElementById('phone').value;
    var content = document.getElementById('feedback').value;
    var message = document.querySelectorAll('.form-message');

    var regexPhone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    var regexMail = /\S+@\S+\.\S+/;;
    
    if (mail === "") {
        message[0].innerText = "Vui lòng nhập email";
        return false;
    } else {
        message[0].innerText = "";
    }
    if (phone === "") {
        message[1].innerText = "Vui lòng nhập số điện thoại";
        return false;
    } else {
        message[1].innerText = "";
    }
    if (content === "") {
        message[2].innerText = "Vui lòng nhập nội dung liên hệ";
        return false;
    } else {
        message[2].innerText = "";
    }
    if (regexPhone.test(phone) === false) {
        message[1].innerText = "Sai định dạng số điện thoại.";
        return false;
    } else {
        message[1].innerText = "";
    }
    if (regexMail.test(mail) === false) {
        message[0].innerText = "Sai định dạng email.";
        return false;
    } else {
        message[0].innerText = "";
    }
}

form.addEventListener('submit', function (e) {
//    e.preventDefault();
    loading();
})