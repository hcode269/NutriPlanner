// =========================SEARCH================================
// SEARCH keyword
// Tìm kiếm theo tên món
//Tìm kiếm theo thành phần nguyên liệu
// Tìm kiếm theo chế độ ăn

document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("searchInput");
  const allItems = Array.from(document.querySelectorAll(".main-dishmenu-item"));
  const paginationContainer = document.querySelector(".main-pagelist");
  const itemsPerPage = 8;

  let filteredItems = [...allItems];

  function showPage(page, data = filteredItems) {
    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;

    allItems.forEach((item) => (item.style.display = "none"));

    data.forEach((item, index) => {
      if (index >= start && index < end) {
        item.style.display = "flex";
      }
    });

    updatePagination(data.length, page);
  }

  function updatePagination(totalItems, currentPage) {
    if (paginationContainer !== null && paginationContainer !== undefined) {
      const totalPages = Math.ceil(totalItems / itemsPerPage);
      paginationContainer.innerHTML = ""; // clear old pages

      for (let i = 1; i <= totalPages; i++) {
        const li = document.createElement("li");
        const a = document.createElement("a");
        a.className = "main-pageitem" + (i === currentPage ? " active" : "");
        a.href = "#!";
        a.dataset.page = i;
        a.textContent = i;

        a.addEventListener("click", function (e) {
          e.preventDefault();
          showPage(parseInt(this.dataset.page), filteredItems);
        });

        li.appendChild(a);
        paginationContainer.appendChild(li);
      }
    }
  }

  searchInput.addEventListener("input", function () {
    const keyword = this.value.toLowerCase();

    filteredItems = allItems.filter((item) => {
      const name =
        item
          .querySelector(".dish__card-info--name")
          ?.textContent.toLowerCase() || "";
      const ingredients =
        item.querySelector(".dish__ingredients")?.textContent.toLowerCase() ||
        "";
      const tag1 =
        item
          .querySelector(".dish__card-tag--tag1")
          ?.textContent.toLowerCase() || "";
      const tag2 =
        item
          .querySelector(".dish__card-tag--tag2")
          ?.textContent.toLowerCase() || "";

      return (
        name.includes(keyword) ||
        ingredients.includes(keyword) ||
        tag1.includes(keyword) ||
        tag2.includes(keyword)
      );
    });

    showPage(1);
  });

  showPage(1); // Initial load
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
    window.location.href = "./login.html";
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
