document.addEventListener("DOMContentLoaded", () => {
  const feedbackForm = document.querySelector(".feedbackform form");
  const submitBtn = document.querySelector(".feedbackform__btnsubmit");

  const popup = document.createElement("div");
  popup.className = "feedback-popup";
  popup.innerHTML = `
    <div class="feedback-popup__box">
      <p class="feedback-popup__text">Are you sure you want to send this feedback?</p>
      <div class="feedback-popup__actions">
        <button class="popup-confirm">Yes</button>
        <button class="popup-cancel">No</button>
      </div>
    </div>
  `;
  document.body.appendChild(popup);
  popup.style.display = "none";
  // =========================PHONE NUMBER VALIDATION===========================
  const phoneInput = document.querySelector('input[name="tel"]');
  const phoneError = document.getElementById("phone-error");

  // Regex cho số Việt Nam bắt đầu bằng 0, gồm đúng 10 chữ số
  const phoneRegex = /^0(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-5]|9[0-9])[0-9]{7}$/;

  phoneInput.addEventListener("input", () => {
    const value = phoneInput.value.trim();
    if (value.length === 0) {
      phoneInput.classList.remove("invalid");
      phoneError.textContent = "";
      phoneError.style.display = "none";
      return;
    }

    if (value.length !== 10) {
      phoneInput.classList.add("invalid");
      phoneError.innerHTML = `
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
          <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24v112c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zm-32 232a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/>
      </svg>
      <span class="error-text">Phone number must be exactly 10 digits.</span>`;

      phoneError.style.display = "flex";
      return;
    }

    // Đúng 10 ký tự, bắt đầu kiểm tra regex
    if (!phoneRegex.test(value)) {
      phoneInput.classList.add("invalid");
      phoneError.innerHTML = `
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
          <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24v112c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zm-32 232a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/>
      </svg>
      <span class="error-text">Invalid Vietnamese phone number format.</span>`;
      phoneError.style.display = "flex";
    } else {
      phoneInput.classList.remove("invalid");
      phoneError.textContent = "";
      phoneError.style.display = "none";
    }
  });
  // =========================RATING================================
  const stars = document.querySelectorAll(".star");
  const ratingInput = document.getElementById("rating-value"); // input hidden để gửi lên PHP
  let currentRating = 0;

  stars.forEach((star) => {
    star.addEventListener("mouseover", () => {
      const val = star.getAttribute("data-value");
      highlightStars(val);
    });

    star.addEventListener("mouseout", () => {
      highlightStars(currentRating); // về lại trạng thái đã chọn
    });

    star.addEventListener("click", () => {
      currentRating = star.getAttribute("data-value");
      ratingInput.value = currentRating; // cập nhật input hidden
      highlightStars(currentRating);

      const ratingError = document.getElementById("rating-error");
      ratingError.textContent = "";
      ratingError.style.display = "none";
      stars.forEach((star) => star.classList.remove("invalid"));
    });
  });

  function highlightStars(rating) {
    stars.forEach((star) => {
      const starVal = star.getAttribute("data-value");
      if (parseInt(starVal) <= parseInt(rating)) {
        star.classList.add("hover");
      } else {
        star.classList.remove("hover");
      }
    });
  }

  // =========================FEEDBACK FORM SUBMIT===========================
  feedbackForm.addEventListener("submit", (e) => {
    e.preventDefault();

    let isValid = true;

    const phoneValue = phoneInput.value.trim();
    const messageInput = feedbackForm.querySelector('textarea[name="message"]');
    const messageValue = messageInput?.value.trim();

    // 1. Kiểm tra phone number
    if (phoneValue.length !== 10 || !phoneRegex.test(phoneValue)) {
      phoneInput.classList.add("invalid");
      phoneError.style.display = "flex";
      isValid = false;
    }

    // 2. Kiểm tra message
    if (!messageValue) {
      alert("Please enter your message before submitting.");
      isValid = false;
    }

    // 3. Kiểm tra rating
    const ratingError = document.getElementById("rating-error");
    if (parseInt(currentRating) === 0) {
      ratingError.innerHTML = `
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
          <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24v112c0 13.3-10.7 24-24 24s-24-10.7-24-24V152c0-13.3 10.7-24 24-24zm-32 232a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/>
      </svg>
      <span class="error-text">Please select a rating before submitting.</span>`;
      ratingError.style.display = "flex";

      stars.forEach((star) => star.classList.add("invalid"));

      isValid = false;
    } else {
      ratingError.textContent = "";
      ratingError.style.display = "none";
      stars.forEach((star) => star.classList.remove("invalid"));
    }

    // 4. Nếu không hợp lệ
    if (!isValid) return;

    // 5. Nếu hợp lệ thì hiện popup xác nhận
    popup.style.display = "flex";
  });

  popup.querySelector(".popup-cancel").addEventListener("click", () => {
    popup.style.display = "none";
  });

  popup.querySelector(".popup-confirm").addEventListener("click", () => {
    popup.style.display = "none";

    const formData = new FormData(feedbackForm);
    formData.append("action", "submit_feedback"); // giúp PHP nhận biết

    fetch("index.php", {
      method: "POST",
      body: formData,
    })
      .then((res) => res.json())
      .then((data) => {
        // Hiển thị kết quả

        if (data.success) {
          feedbackForm.reset();
          ratingInput.value = "0";
          currentRating = 0;
          highlightStars(0);

          const overlay = document.createElement("div");
          overlay.className = "feedback-overlay";
          overlay.innerHTML = `
          <div class="feedback-overlay__message">
              Feedback submitted successfully!
          </div>
           `;
          document.body.appendChild(overlay);
          setTimeout(() => {
            overlay.remove();
          }, 3000);
        }
      })
      .catch(() => {
        const errorMsg = document.createElement("div");
        errorMsg.id = "feedback-response";
        errorMsg.textContent = "Network error. Please try again.";
        errorMsg.className = "feedback-error";
        document.body.appendChild(errorMsg);
        errorMsg.style.display = "block";
      });
  });
});
