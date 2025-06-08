document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form");
  const email = document.querySelector(".box-email__input");
  const displayName = document.querySelector(".box-dpname__input");
  const password = document.querySelector(
    '.box-password__input[name="password"]'
  );

  const passwordStrengthBox = document.getElementById("password-strength");
  const level1 = document.getElementById("level-1");
  const level2 = document.getElementById("level-2");
  const level3 = document.getElementById("level-3");
  const strengthText = document.getElementById("strength-text");
  const strengthMessage = document.getElementById("strength-message");

  password.addEventListener("input", function () {
    const val = password.value.trim();
    const length = val.length;

    // Show or hide password strength
    if (length === 0) {
      passwordStrengthBox.style.display = "none";
      return;
    } else {
      passwordStrengthBox.style.display = "block";
    }

    // Reset colors
    [level1, level2, level3].forEach(
      (el) => (el.style.backgroundColor = "#eee")
    );

    // Strength Logic
    if (length <= 8) {
      level1.style.backgroundColor = "red";
      strengthText.textContent = "Weak";
      strengthText.style.color = "red";
      strengthMessage.innerHTML = `<p>This password is easy to guess. Please <strong style="font-weight: bold;">use at least 8 characters.</strong></p>`;
    } else if (length <= 12) {
      level1.style.backgroundColor = "orange";
      level2.style.backgroundColor = "orange";
      strengthText.textContent = "Fair";
      strengthText.style.color = "orange";
      strengthMessage.innerHTML = `Ready to use but still guessable. Please <strong style="font-weight: bold;">use over 12 characters.</strong>`;
    } else {
      level1.style.backgroundColor = "green";
      level2.style.backgroundColor = "green";
      level3.style.backgroundColor = "green";
      strengthText.textContent = "Strong";
      strengthText.style.color = "green";
      strengthMessage.textContent =
        "Your password is excellent. You are good to go!";
    }
  });

  const confirmPassword = document.querySelector(
    '.box-password__input[name="confirm_password"]'
  );
  const submitBtn = document.querySelector(".box-button__submit");
  const buttonBox = document.querySelector(".box-button");

  const emailError = createErrorBox(email);
  const nameError = createErrorBox(displayName);
  const passError = createErrorBox(password);
  const confirmError = createErrorBox(confirmPassword);

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
         <span class="error-message">Please enter your email address using the format name@example.com</span>
      `;
      emailError.classList.add("show");
      return false;
    }
    emailError.innerHTML = "";
    emailError.classList.remove("show");
    return true;
  }

  function validateDisplayName() {
    const value = displayName.value.trim();
    if (value === "") {
      nameError.innerHTML = "";
      nameError.classList.remove("show");
      return false;
    }

    const regex = /^[a-zA-Z0-9 _\-]+$/;
    if (!regex.test(value)) {
      nameError.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
          <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24l0 112c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-112c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z" />
        </svg>
        <span class="error-text">Display name must not contain special characters.</span>
      `;
      nameError.classList.add("show");
      return false;
    }

    nameError.innerHTML = "";
    nameError.classList.remove("show");
    return true;
  }

  function validatePassword() {
    const value = password.value.trim();
    return value.length >= 8;
  }

  function validateConfirmPassword() {
    const value = confirmPassword.value.trim();
    if (value === "") {
      confirmError.innerHTML = "";
      confirmError.classList.remove("show");
      return false;
    }

    if (value !== password.value.trim()) {
      confirmError.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
          <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24l0 112c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-112c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z" />
        </svg><span class="error-text">Passwords do not match.</span>`;
      confirmError.classList.add("show");
      return false;
    }

    confirmError.innerHTML = "";
    confirmError.classList.remove("show");
    return true;
  }

  function validateForm() {
    const valid =
      validateEmail() &&
      validateDisplayName() &&
      validatePassword() &&
      validateConfirmPassword();
    submitBtn.disabled = !valid;
    buttonBox.classList.toggle("brown-disabled", !valid);
    return valid;
  }

  // Sự kiện cho các trường input
  [email, displayName, password, confirmPassword].forEach((input) => {
    input.addEventListener("input", () => {
      removeAllPhpErrors(); // Xoá lỗi PHP
      validateForm(); // Kiểm tra lại form
    });

    input.addEventListener("blur", validateForm);
    input.addEventListener("keydown", function (e) {
      if (e.key === "Enter") {
        validateForm();
      }
    });
  });

  // Khi submit
  form.addEventListener("submit", function (e) {
    if (!validateForm()) {
      e.preventDefault();
    }
  });
});
