<?php
session_start();
session_unset();
session_destroy();

// Ngăn cache quay lại
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Pragma: no-cache");
header("Expires: 0");

// Chuyển về login
header("Location: login.php");
exit;
