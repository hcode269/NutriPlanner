// =========================SEARCH================================
// SEARCH keyword for .search-result-dropdown only

document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("searchInput");
  const dropdown = document.querySelector(".search-result-dropdown");
  const resultList = document.querySelector(".searchResult-list");
  const dishItems = Array.from(
    resultList.querySelectorAll(".search-dish-item")
  );

  dropdown.style.display = "none";

  searchInput.addEventListener("input", () => {
    const keyword = searchInput.value.toLowerCase().trim();

    if (keyword === "") {
      dropdown.style.display = "none";
      dishItems.forEach((item) => (item.style.display = "none"));
      return;
    }

    let hasMatch = false;

    dishItems.forEach((item) => {
      const name =
        item.querySelector(".search-dish-name")?.textContent.toLowerCase() ||
        "";
      const tags =
        item.querySelector(".dish__tags")?.textContent.toLowerCase() || "";
      const ingredients =
        item.querySelector(".dish__ingredients")?.textContent.toLowerCase() ||
        "";
      const combined = name + " " + tags + " " + ingredients;

      if (combined.includes(keyword)) {
        item.style.display = "flex";
        hasMatch = true;
      } else {
        item.style.display = "none";
      }
    });

    dropdown.style.display = hasMatch ? "flex" : "none";

    // Gán sự kiện chuyển trang cho mỗi item kết quả
    dishItems.forEach((item) => {
      item.onclick = () => {
        const dishId = item.dataset.dishId;
        if (dishId) {
          window.location.href = `./dishes.php?dishId=${dishId}`;
        }
      };
    });
  });

  searchInput.addEventListener("blur", () => {
    setTimeout(() => {
      dropdown.style.display = "none";
    }, 200);
  });

  searchInput.addEventListener("focus", () => {
    if (searchInput.value.trim() !== "") {
      dropdown.style.display = "flex";
    }
  });
});

// =========================Account Logout==============================
document.addEventListener("DOMContentLoaded", () => {
  const avatar = document.getElementById("accountAvatar");
  const dropdown = document.getElementById("accountDropdown");

  avatar.addEventListener("click", () => {
    dropdown.style.display =
      dropdown.style.display === "block" ? "none" : "block";
  });

  // Ẩn dropdown nếu click ngoài vùng
  document.addEventListener("click", (e) => {
    const isInsideAvatar = avatar.contains(e.target);
    const isInsideDropdown = dropdown.contains(e.target);

    // Nếu KHÔNG click vào avatar và KHÔNG click vào dropdown => ẩn dropdown
    if (!isInsideAvatar && !isInsideDropdown) {
      dropdown.style.display = "none";
    }
  });

  // =========================LOGOUT POPUP==============================
  const logoutBtn = document.querySelector(".account-dropdown__logout");

  // Tạo popup xác nhận logout
  const popup = document.createElement("div");
  popup.className = "logout-popup";
  popup.innerHTML = `
      <div class="logout-popup__box">
        <p class="logout-popup__text">Do you want to log out of your account?</p>
        <div class="logout-popup__actions">
          <button class="popup-confirm">Yes</button>
          <button class="popup-cancel">No</button>
        </div>
      </div>
    `;
  popup.style.display = "none";
  document.body.appendChild(popup);

  logoutBtn.addEventListener("click", () => {
    popup.style.display = "flex";
  });

  popup.querySelector(".popup-cancel").addEventListener("click", () => {
    popup.style.display = "none";
  });

  popup.querySelector(".popup-confirm").addEventListener("click", () => {
    popup.style.display = "none";
    window.location.href = "./logout.php";
  });
});

// =========================FAVORITE FUNCTION_ SAVE FUNCTION =====================
document.addEventListener("DOMContentLoaded", () => {
  const saveIcons = document.querySelectorAll(".bookmark-icon");
  const favoriteIcons = document.querySelectorAll(".heart-icon");

  saveIcons.forEach((icon) => {
    icon.addEventListener("click", function () {
      this.classList.toggle("active");
    });
  });

  favoriteIcons.forEach((icon) => {
    icon.addEventListener("click", function () {
      this.classList.toggle("active");
    });
  });
});

// ==================TOGGLE SEARCH ICON AND CLEAR BUTTON==================
document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.querySelector(
    ".header-navbartop__search--searchinput"
  ); // input tìm kiếm
  const iconBox = document.querySelector(".navbartop--searchiconbox"); // box chứa icon tìm kiếm
  const clearBtnBox = document.querySelector(".clearsearch-btnbox"); // box chứa nút xóa tìm kiếm
  const inputBox = document.querySelector(".navbartop--searchinputbox"); // box chứa input tìm kiếm
  const searchBox = document.querySelector(".navbartop--searchbox"); // box chứa toàn bộ thanh tìm kiếm

  searchInput.addEventListener("focus", () => {
    iconBox.style.display = "none";
    clearBtnBox.style.display = "flex";
    inputBox.style.left = "20px";
    inputBox.style.width = "calc(100% - 50px)";
  });

  searchInput.addEventListener("blur", () => {
    setTimeout(() => {
      if (searchInput.value.trim() === "") {
        iconBox.style.display = "flex";
        clearBtnBox.style.display = "none";
        inputBox.style.left = "45px";
        inputBox.style.width = "calc(100% - 85px)";
      }
    }, 100);
  });

  const clearBtn = clearBtnBox.querySelector(".clear-search-btn");
  clearBtn.addEventListener("click", () => {
    searchInput.value = "";
    searchInput.focus();
    clearBtnBox.style.display = "none";
    iconBox.style.display = "flex";
    inputBox.style.left = "45px";
    inputBox.style.width = "calc(100% - 85px)";
  });
});
