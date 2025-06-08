document.addEventListener("DOMContentLoaded", () => {
  const addButton = document.querySelector(".calculator__add-btn");
  const table = document.querySelector(".caculator-infowrap");

  const ingredientOptions = [
    "Rau Muống",
    "Đu Đủ",
    "Hạt Sen",
    "Cà Rốt",
    "Bông Cải",
    "Khoai Tây",
    "Thịt Bò",
  ];
  //Thêm popup ở sau cùng đoạn code
  const ingredientLimitPopup = document.createElement("div");
  ingredientLimitPopup.className = "ingredient-popup";
  ingredientLimitPopup.innerHTML = `
    <div class="ingredient-popup__box">
      <p class="ingredient-popup__text">Tôi đã cung cấp đầy đủ nguyên liệu tôi có!</p>
      <div class="ingredient-popup__actions">
        <button class="popup-ok">OK</button>
      </div>
    </div>`;
  document.body.appendChild(ingredientLimitPopup);
  ingredientLimitPopup.style.display = "none";

  ingredientLimitPopup
    .querySelector(".popup-ok")
    .addEventListener("click", () => {
      ingredientLimitPopup.style.display = "none";
    });
  // -------------------------------------------------------------
  // ----------------Các món ăn đã được chọn----------------------
  function getSelectedIngredients() {
    const selected = [];
    document.querySelectorAll(".ingredient-select").forEach((select) => {
      selected.push(select.value);
    });
    return selected;
  }
  // ----------Lọc các món ăn đã được chọn-------------------------
  function createIngredientSelect(currentValue = "") {
    const select = document.createElement("select");
    select.className = "ingredient-select";
    const selectedValues = getSelectedIngredients();

    ingredientOptions.forEach((opt) => {
      if (!selectedValues.includes(opt) || opt === currentValue) {
        const option = document.createElement("option");
        option.value = opt;
        option.textContent = opt;
        if (opt === currentValue) option.selected = true;
        select.appendChild(option);
      }
    });

    return select;
  }
  // ------------------------------------------------------------------
  // -------------Cập nhật số thứ tự và option trong select------------
  function updateSTTandOptions() {
    const rows = document.querySelectorAll(".calculator__row");
    const selectedValues = getSelectedIngredients();
    rows.forEach((row, index) => {
      const sttCell = row.querySelector(".col-1");
      if (sttCell) sttCell.textContent = index + 1;

      const select = row.querySelector(".ingredient-select");
      if (select) {
        const currentValue = select.value;
        select.innerHTML = "";
        ingredientOptions.forEach((opt) => {
          if (!selectedValues.includes(opt) || opt === currentValue) {
            const option = document.createElement("option");
            option.value = opt;
            option.textContent = opt;
            select.appendChild(option);
          }
        });
        select.value = currentValue;
      }
    });
  }
  // ---------------------------------------------------------------------
  // -----------Thêm dòng khi ấn Add item --------------------------------
  addButton.addEventListener("click", () => {
    // Thông báo nếu Additem đã vượt quá option cơ sở dữ liệu
    const selectedValues = getSelectedIngredients();
    if (selectedValues.length >= ingredientOptions.length) {
      ingredientLimitPopup.style.display = "flex";
      return;
    }

    const newRow = document.createElement("ul");
    newRow.className = "calculator__row";

    const li1 = document.createElement("li");
    li1.className = "col-1";
    li1.textContent = "-";

    const li2 = document.createElement("li");
    li2.className = "col-2";
    li2.appendChild(createIngredientSelect());

    const li3 = document.createElement("li");
    li3.className = "col-3";
    li3.innerHTML = `
      <div class="custom-number-wrapper">
        <input type="number" class="col-3__value" value="" min="0" step="10" placeholder="E.g: 500"/>
        <div class="custom-spinner">
          <button class="btn-increase"><i class="fa-solid fa-caret-up"></i></button>
          <button class="btn-decrease"><i class="fa-solid fa-caret-down"></i></button>
        </div>
      </div>
      <i class="fa-solid fa-circle-minus delete-icon fa-2x"></i>`;

    newRow.appendChild(li1);
    newRow.appendChild(li2);
    newRow.appendChild(li3);
    table.insertBefore(newRow, addButton);
    // Cập nhật STT khi ấn add Item
    updateSTTandOptions();

    newRow
      .querySelector(".ingredient-select")
      .addEventListener("change", recalculateTotalCalories);
    newRow
      .querySelector(".col-3__value")
      .addEventListener("input", recalculateTotalCalories);
  });
  // Tự động cập nhật tính toán tổng calories nếu có sự thay đổi Ingridient
  document.querySelectorAll(".ingredient-select").forEach((select) => {
    select.addEventListener("change", recalculateTotalCalories);
  });
  // Tự động cập nhật tính toán tổng calories nếu có input nhập vào giá trị
  document.querySelectorAll(".col-3__value").forEach((input) => {
    input.addEventListener("input", recalculateTotalCalories);
  });

  document.addEventListener("change", function (e) {
    if (e.target.classList.contains("ingredient-select")) {
      updateSTTandOptions();
    }
  });
  // Biến function updateSTTand Options thành biến toàn cục
  window.updateSTTandIngredientSelects = updateSTTandOptions;
});

// Thiết lập js cho nút button increase và button decrease
document.addEventListener("click", (e) => {
  if (e.target.closest(".btn-increase") || e.target.closest(".btn-decrease")) {
    const container = e.target.closest(".custom-number-wrapper");
    const input = container.querySelector("input");
    const step = parseInt(input.step) || 10;
    const min = parseInt(input.min) || 0;
    let current = parseInt(input.value) || 0;

    if (e.target.closest(".btn-increase")) {
      input.value = current + step;
    } else {
      input.value = Math.max(current - step, min);
    }

    recalculateTotalCalories();
  }
});

// Tải dữ liệu từ file Json và chuyển thành JS
let nutritionMap = {};

async function loadNutritionData() {
  const res = await fetch("./json/ingredients_nutrition.json");
  const data = await res.json();
  data.forEach((item) => {
    nutritionMap[item.name] = item;
  });
}

loadNutritionData();
// ---------------------------------------------------------
// Hàm tính giá toán lại lượng Nutri cho phù hợp
function recalculateTotalCalories() {
  console.log("Hàm recalculateTotalCalories được gọi");
  let totalCalories = 0,
    totalProtein = 0,
    totalFat = 0,
    totalCarb = 0;

  const rows = document.querySelectorAll(".calculator__row");
  rows.forEach((row) => {
    const select = row.querySelector(".ingredient-select");
    const input = row.querySelector(".col-3__value");
    const name = select?.value;
    const quantity = parseFloat(input?.value);

    if (name && quantity && nutritionMap[name]) {
      const factor = quantity / 100;
      const nutri = nutritionMap[name];
      totalCalories += nutri.calories * factor;
      totalProtein += nutri.protein * factor;
      totalFat += nutri.fat * factor;
      totalCarb += nutri.carb * factor;
    }
  });

  document.getElementById("total-calo").textContent = Math.round(totalCalories);
  document.getElementById("total-protein").textContent =
    totalProtein.toFixed(1);
  document.getElementById("total-fat").textContent = totalFat.toFixed(1);
  document.getElementById("total-carb").textContent = totalCarb.toFixed(1);
}
// đưa hàm recalculateTotalCalories thành một thuộc tính của đối tượng window.
window.recalculateTotalCalories = recalculateTotalCalories;
