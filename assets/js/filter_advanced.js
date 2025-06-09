document.addEventListener("DOMContentLoaded", () => {
  const calorieMin = document.getElementById("filter-calories-min");
  const calorieMax = document.getElementById("filter-calories-max");
  const dietSelect = document.getElementById("filter-diet");
  const saveCheckbox = document.getElementById("filter-save");
  const favoriteCheckbox = document.getElementById("filter-favorite");
  const mealTypeSelect = document.getElementById("filter-mealtype");
  const allergenSelect = document.getElementById("filter-allergen");
  const paginationContainer = document.querySelector(".main-pagelist");
  const allItems = Array.from(document.querySelectorAll(".main-dishmenu-item"));
  const itemsPerPage = 8;
  let filteredItems = [...allItems];

  function getSavedDishIds() {
    return JSON.parse(sessionStorage.getItem("savedDishes") || "[]");
  }

  function toggleSaveDish(dishId) {
    let saved = getSavedDishIds();
    if (saved.includes(dishId)) {
      saved = saved.filter((id) => id !== dishId);
    } else {
      saved.push(dishId);
    }
    sessionStorage.setItem("savedDishes", JSON.stringify(saved));
  }

  function updateIconState() {
    const saved = getSavedDishIds();
    document.querySelectorAll(".bookmark-icon").forEach((icon) => {
      const dishId = icon.closest(".main-dishmenu-item")?.dataset.dishId;
      if (saved.includes(dishId)) {
        icon.classList.add("active");
      } else {
        icon.classList.remove("active");
      }
    });
  }

  // Handle Save icon click
  document.querySelectorAll(".bookmark-icon").forEach((icon) => {
    const dishId = icon.closest(".main-dishmenu-item").dataset.dishId;
    icon.addEventListener("click", () => {
      toggleSaveDish(dishId);
      updateIconState();
      if (saveCheckbox.checked) applyFilters();
    });
  });

  // Handle Favorite icon click
  document.querySelectorAll(".heart-icon").forEach((icon) => {
    const dishId = icon.closest(".main-dishmenu-item").dataset.dishId;
    icon.addEventListener("click", () => {
      fetch("like-toggle.php", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: `dishId=${dishId}`,
      })
        .then((res) => res.json())
        .then((data) => {
          console.log("Like response:", data);
          if (data.success) {
            if (data.liked == 1) {
              icon.classList.add("active");
            } else {
              icon.classList.remove("active");
            }

            if (favoriteCheckbox.checked) applyFilters();
          }
        });
    });
  });

  function renderPagination(filteredLength, currentPage) {
    const totalPages = Math.ceil(filteredLength / itemsPerPage);
    paginationContainer.innerHTML = "";

    for (let i = 1; i <= totalPages; i++) {
      const li = document.createElement("li");
      const a = document.createElement("a");
      a.className = "main-pageitem" + (i === currentPage ? " active" : "");
      a.href = "#!";
      a.dataset.page = i;
      a.textContent = i;

      a.addEventListener("click", function (e) {
        e.preventDefault();
        showPage(parseInt(this.dataset.page));
      });

      li.appendChild(a);
      paginationContainer.appendChild(li);
    }
  }

  function showPage(page) {
    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    allItems.forEach((item) => (item.style.display = "none"));
    filteredItems.forEach((item, index) => {
      if (index >= start && index < end) {
        item.style.display = "flex";
      }
    });
    renderPagination(filteredItems.length, page);
  }

  function applyFilters() {
    const min = parseInt(calorieMin.value) || 0;
    const max = parseInt(calorieMax.value) || Infinity;
    const diet = dietSelect.value.toLowerCase();
    const mealType = mealTypeSelect.value.toLowerCase();
    const allergen = allergenSelect.value.toLowerCase();
    const filterBySave = saveCheckbox.checked;
    const filterByFavorite = favoriteCheckbox.checked;
    const savedDishIds = getSavedDishIds();

    filteredItems = allItems.filter((item) => {
      const calorieText =
        item.querySelector(".dish__card-info--desc")?.textContent || "";
      const calories = parseInt(calorieText.replace(/[^0-9]/g, "")) || 0;
      const tag1 =
        item
          .querySelector(".dish__card-tag--tag1")
          ?.textContent.toLowerCase() || "";
      const tag2 =
        item
          .querySelector(".dish__card-tag--tag2")
          ?.textContent.toLowerCase() || "";
      const allergenText =
        item.querySelector(".dish__allergen")?.textContent.toLowerCase() || "";
      const dishId = item.dataset.dishId;
      const isLiked = item
        .querySelector(".heart-icon")
        ?.classList.contains("active");

      const matchSave = !filterBySave || savedDishIds.includes(dishId);
      const matchFavorite = !filterByFavorite || isLiked;
      const matchCalories = calories >= min && calories <= max;
      const matchDiet =
        diet === "all" || tag1.includes(diet) || tag2.includes(diet);
      const matchMeal =
        mealType === "all" ||
        tag1.includes(mealType) ||
        tag2.includes(mealType);
      const matchAllergen =
        allergen === "all" || !allergenText.includes(allergen);

      return (
        matchCalories &&
        matchDiet &&
        matchMeal &&
        matchAllergen &&
        matchSave &&
        matchFavorite
      );
    });

    showPage(1);
  }

  calorieMin.addEventListener("input", applyFilters);
  calorieMax.addEventListener("input", applyFilters);
  dietSelect.addEventListener("change", applyFilters);
  mealTypeSelect.addEventListener("change", applyFilters);
  allergenSelect.addEventListener("change", applyFilters);
  saveCheckbox.addEventListener("change", applyFilters);
  favoriteCheckbox.addEventListener("change", applyFilters);
  fetch("get-liked.php")
    .then((res) => res.json())
    .then((data) => {
      if (data.success) {
        const likedSet = new Set(data.likedDishes.map(String)); // để so sánh đúng với dataset.dishId
        document.querySelectorAll(".main-dishmenu-item").forEach((item) => {
          const dishId = item.dataset.dishId;
          const heartIcon = item.querySelector(".heart-icon");
          if (likedSet.has(dishId)) {
            heartIcon.classList.add("active");
          } else {
            heartIcon.classList.remove("active");
          }
        });
      }
    });
  updateIconState();
  showPage(1);
});
