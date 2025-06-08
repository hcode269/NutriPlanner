document.addEventListener("DOMContentLoaded", () => {
  const calorieMin = document.getElementById("filter-calories-min");
  const calorieMax = document.getElementById("filter-calories-max");
  const dietSelect = document.getElementById("filter-diet");
  const mealTypeSelect = document.getElementById("filter-mealtype");
  const allergenSelect = document.getElementById("filter-allergen");
  const paginationContainer = document.querySelector(".main-pagelist");
  const allItems = Array.from(document.querySelectorAll(".main-dishmenu-item"));
  const itemsPerPage = 8;
  let filteredItems = [...allItems];

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

      const ingredientText =
        item.querySelector(".dish__ingredients")?.textContent.toLowerCase() ||
        "";
      const allergenText =
        item.querySelector(".dish__allergen")?.textContent.toLowerCase() || "";

      const matchCalories = calories >= min && calories <= max;
      const matchDiet =
        diet === "all" || tag1.includes(diet) || tag2.includes(diet);
      const matchMeal =
        mealType === "all" ||
        tag1.includes(mealType) ||
        tag2.includes(mealType);
      const matchAllergen =
        allergen === "all" || !allergenText.includes(allergen);

      return matchCalories && matchDiet && matchMeal && matchAllergen;
    });

    showPage(1);
  }

  // Gán sự kiện cho bộ lọc
  calorieMin.addEventListener("input", applyFilters);
  calorieMax.addEventListener("input", applyFilters);
  dietSelect.addEventListener("change", applyFilters);
  mealTypeSelect.addEventListener("change", applyFilters);
  allergenSelect.addEventListener("change", applyFilters);

  showPage(1); // lần đầu
});
