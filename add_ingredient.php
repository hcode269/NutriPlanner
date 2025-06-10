<?php
require_once 'config.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = $_POST['name'];
    $calo = $_POST['calories'];
    $protein = $_POST['protein'];
    $fat = $_POST['fat'];
    $carb = $_POST['carb'];

    $stmt = $pdo->prepare("INSERT INTO ingredients (ingredientName, caloriesPer100g, proteinPer100g, fatPer100g, carbPer100g)
                           VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$name, $calo, $protein, $fat, $carb]);

    // Gọi để xuất lại file JSON sau khi INSERT
    include 'export_ingredients_json.php';

    echo "Thêm nguyên liệu thành công và JSON đã được cập nhật!";
}
