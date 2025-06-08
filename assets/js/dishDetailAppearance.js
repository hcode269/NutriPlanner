document.addEventListener("DOMContentLoaded", () => {
  const ingredientBtn = document.querySelector('[data-tab="ingredient"]');
  const stepBtn = document.querySelector('[data-tab="step"]');
  const recipeInfo = document.querySelector(".content__recipe--info");

  // Lấy nội dung từ PHP gán sẵn vào biến JS (bạn cần đảm bảo 2 biến dưới được echo vào script)
  const ingredientContent = window.ingredientList || "";
  const stepContent = window.processingSteps || "";

  // Mặc định hiển thị Ingredient
  recipeInfo.innerHTML = ingredientContent;
  ingredientBtn.classList.add("active");

  // Gán sự kiện click
  ingredientBtn.addEventListener("click", () => {
    recipeInfo.innerHTML = ingredientContent;
    ingredientBtn.classList.add("active");
    stepBtn.classList.remove("active");
  });

  stepBtn.addEventListener("click", () => {
    recipeInfo.innerHTML = stepContent;
    stepBtn.classList.add("active");
    ingredientBtn.classList.remove("active");
  });

  // ===== Dish Pagination =====
  const prevBtn = document.querySelector(".main-page-prev");
  const nextBtn = document.querySelector(".main-page-next");

  const currentDishId = parseInt(
    new URLSearchParams(window.location.search).get("dishId")
  );
  const maxDishId = window.maxDishId || 32; // giá trị này nên được in từ PHP

  // Gán trạng thái disable nếu ở đầu/cuối
  if (currentDishId <= 1) {
    prevBtn.classList.add("disabled");
  }
  if (currentDishId >= maxDishId) {
    nextBtn.classList.add("disabled");
  }

  prevBtn.addEventListener("click", () => {
    if (currentDishId > 1) {
      window.location.href = `dishes.php?dishId=${currentDishId - 1}`;
    }
  });

  nextBtn.addEventListener("click", () => {
    if (currentDishId < maxDishId) {
      window.location.href = `dishes.php?dishId=${currentDishId + 1}`;
    }
  });
});
