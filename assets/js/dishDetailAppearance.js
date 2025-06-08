document.addEventListener("DOMContentLoaded", () => {
  const ingredientBtn = document.querySelector('[data-tab="ingredient"]');
  const stepBtn = document.querySelector('[data-tab="step"]');
  const recipeInfo = document.querySelector(".content__recipe--info");

  // Lấy nội dung từ PHP gán sẵn vào biến JS
  const ingredientContent = window.ingredientList || "";
  const stepContent = window.processingSteps || "";

  // Mặc định hiển thị Ingredient
  recipeInfo.textContent = ingredientContent;
  ingredientBtn.classList.add("active");

  // Gán sự kiện click
  ingredientBtn.addEventListener("click", () => {
    recipeInfo.textContent = ingredientContent;
    ingredientBtn.classList.add("active");
    stepBtn.classList.remove("active");
  });

  stepBtn.addEventListener("click", () => {
    recipeInfo.textContent = stepContent;
    stepBtn.classList.add("active");
    ingredientBtn.classList.remove("active");
  });
});
