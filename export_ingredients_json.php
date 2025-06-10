<?php
require_once 'config.php';

$stmt = $pdo->query("SELECT ingredientName AS name, caloriesPer100g AS calories, proteinPer100g AS protein, fatPer100g AS fat, carbPer100g AS carb FROM ingredients");
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Tạo thư mục nếu chưa có
if (!file_exists('json')) mkdir('json');

file_put_contents('json/ingredients_nutrition.json', json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
