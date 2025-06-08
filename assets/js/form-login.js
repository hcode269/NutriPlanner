document.addEventListener("DOMContentLoaded", function () {
  // Hiển thị popup đăng ký thành công
  const params = new URLSearchParams(window.location.search);

  if (params.get("success") === "1") {
    const registerpopup = document.createElement("div");
    registerpopup.className = "register-popup";
    registerpopup.innerHTML = `<div class="register-popup-box">
          <p class="register-popup__text">You have successfully registered!</p></div>`;
    document.body.appendChild(registerpopup);
    registerpopup.style.display = "flex";

    // Tự động tắt sau 3 giây
    setTimeout(() => registerpopup.remove(), 3000);
  }

  // Ẩn hiện con mắt khi click vào icon
  const passwordInput = document.querySelector(".box-password__input");
  const showPassword = document.querySelector(".show-password");
  const hidePassword = document.querySelector(".hide-password");
  showPassword.addEventListener("click", function () {
    passwordInput.type = "text";
    showPassword.style.display = "none";
    hidePassword.style.display = "block";

    hidePassword.addEventListener("click", function () {
      passwordInput.type = "password";
      showPassword.style.display = "block";
      hidePassword.style.display = "none";
    });
  });
  //  ------------------------------------
  // Validate login form
  const form1 = document.querySelector(".signInForm");
  const email = document.querySelector(".box-email__input");
  const password = document.querySelector(".box-password__input");
  const buttonBox = document.querySelector(".box-button");
  const SubmitBtn = document.querySelector(".box-button__submit");

  const emailError = createErrorBox(email);
  function createErrorBox(input) {
    const error = document.createElement("div");
    error.className = "notice-error";
    input.parentNode.insertAdjacentElement("afterend", error);
    return error;
  }

  function removeAllPhpErrors() {
    document
      .querySelectorAll(".notice-error[id^='php-']")
      .forEach((el) => el.remove());
  }
  function validateEmail() {
    const value = email.value.trim();
    if (value === "") {
      emailError.innerHTML = "";
      emailError.classList.remove("show");
      return false;
    }
    const regex = /^[\w.-]+@[\w.-]+\.(com|net|org|edu|gov|vn)$/;
    if (!regex.test(value)) {
      emailError.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
          <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24v112c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zm-32 232a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/>
        </svg>
        <span class="error-text">Please enter your email address using the format name@example.com</span>
      `;
      emailError.classList.add("show");
      return false;
    }
    emailError.innerHTML = "";
    emailError.classList.remove("show");
    return true;
  }

  function validatePassword() {
    const val = password.value.trim();
    return val.length >= 8;
  }

  function ValidateLoginForm() {
    const valid = validateEmail() && validatePassword();
    SubmitBtn.disabled = !valid;
    buttonBox.classList.toggle("brown-disabled", !valid);
    return valid;
  }

  [email, password].forEach((input) => {
    input.addEventListener("input", () => {
      removeAllPhpErrors(); // Xoá lỗi PHP
      ValidateLoginForm(); // Kiểm tra lại form
    });
  });
  // Khi submit
  form1.addEventListener("submit", function (e) {
    if (!ValidateLoginForm()) {
      e.preventDefault();
    }
  });
});
