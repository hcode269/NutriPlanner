
document.addEventListener("click", function (e) {
  if (e.target.classList.contains("delete-icon")) {
    const row = e.target.closest(".calculator__row");
    if (row) {
      row.remove();
      if (typeof window.updateSTTandIngredientSelects === "function") {
        window.updateSTTandIngredientSelects();
      }
      if (typeof window.recalculateTotalCalories === "function") {
        window.recalculateTotalCalories();
      }
    }
  }
});
