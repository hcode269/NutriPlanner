<?php
session_start();
require_once 'config.php';
header('Content-Type: application/json');

$userId = $_SESSION['user_id'] ?? null;
if (!$userId) {
    echo json_encode(['success' => false, 'likedDishes' => []]);
    exit;
}

$stmt = $pdo->prepare("SELECT dishId FROM userfavorite WHERE userId = ? AND isLiked = 1");
$stmt->execute([$userId]);
$liked = $stmt->fetchAll(PDO::FETCH_COLUMN);

echo json_encode(['success' => true, 'likedDishes' => $liked]);
