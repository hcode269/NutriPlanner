<?php
session_start();
require_once 'config.php';
header('Content-Type: application/json');

$userId = $_SESSION['user_id'] ?? null;
$dishId = intval($_POST['dishId'] ?? 0);

if (!$userId || !$dishId) {
    echo json_encode(['success' => false, 'message' => 'Invalid request']);
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM userfavorite WHERE userId = ? AND dishId = ?");
$stmt->execute([$userId, $dishId]);
$row = $stmt->fetch(PDO::FETCH_ASSOC);

if ($row) {
    $newStatus = $row['isLiked'] ? 0 : 1;
    $update = $pdo->prepare("UPDATE userfavorite SET isLiked = ?, likedAt = NOW() WHERE userId = ? AND dishId = ?");
    $update->execute([$newStatus, $userId, $dishId]);
    echo json_encode(['success' => true, 'liked' => $newStatus]);
} else {
    $insert = $pdo->prepare("INSERT INTO userfavorite (userId, dishId, isLiked, likedAt) VALUES (?, ?, 1, NOW())");
    $insert->execute([$userId, $dishId]);
    echo json_encode(['success' => true, 'liked' => 1]);
}
