<?php
require_once 'config.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

  $errors = [];

  $email = htmlspecialchars(trim($_POST['email'] ?? ''), ENT_QUOTES, 'UTF-8');
  $displayName = htmlspecialchars(trim($_POST['displayName'] ?? ''), ENT_QUOTES, 'UTF-8');
  $password = $_POST['password'] ?? '';
  $confirmPassword = $_POST['confirm_password'] ?? '';



  if (!isset($errors['email'])) {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->execute([$email]);
    if ($stmt->rowCount() > 0) {
      $errors['email'] = "Email already exists.";
    }
  }

  if (!isset($errors['displayName'])) {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE displayName = ?");
    $stmt->execute([$displayName]);
    if ($stmt->rowCount() > 0) {
      $errors['displayName'] = "Display name already exists.";
    }
  }

  if (empty($errors)) {
    $passwordHash = password_hash($password, PASSWORD_BCRYPT);
    $avatarPath = './assets/img/avatars/default.jpg';
    $stmt = $pdo->prepare("INSERT INTO users (email, displayName, passwordHash, userAvatar, isAdmin)
                       VALUES (?, ?, ?, ?, 0)");
    $stmt->execute([$email, $displayName, $passwordHash, $avatarPath]);
    header("Location: login.php?success=1"); 
    exit;
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- Favicon -->
  <link rel="apple-touch-icon" sizes="57x57" href="./assets/img/favicon/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="./assets/img/favicon/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="./assets/img/favicon/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/favicon/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="./assets/img/favicon/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="./assets/img/favicon/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="./assets/img/favicon/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="./assets/img/favicon/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/img/favicon/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192" href="./assets/img/favicon/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="./assets/img/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="./assets/img/favicon/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="./assets/img/favicon/favicon-16x16.png">
  <link rel="manifest" href="./assets/img/favicon/manifest.json">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="./assets/img/favicon/ms-icon-144x144.png">
  <meta name="theme-color" content="#ffffff">
  <!-- reset css -->
  <link rel="stylesheet" href="./assets/css/reset.css" />
  <!-- embed font -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
    rel="stylesheet" />
  <!-- style css -->
  <link rel="stylesheet" href="./assets/css/style.css" />
  <title>Create Account</title>
</head>

<body>
  <div class="bg-login">
    <div class="box-login">
      <div class="box-content">
        <div class="box-content__logo">
          <img
            class="box-content__logo-thumb"
            src="./assets/img/logo.svg"
            alt="logo" />
        </div>
        <p class="box-content__header">Create Account</p>
        <form class="signUpForm" action="create_account.php" method="POST" enctype="multipart/form-data">
          <div class="box-email">
            <input
              class="box-email__input"
              name="email"
              type="text"
              placeholder="Email Address" />
          </div>
           <?php if (!empty($errors['email'])): ?>
            <div class="notice-error show" id="php-email-error">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
                <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24l0 112c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-112c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z" />
              </svg><span class="error-text"><?= $errors['email'] ?></span>
            </div>
          <?php endif; ?>

          <div class="box-dpname">
            <input class="box-dpname__input" name="displayName" type="text" placeholder="Display Name" />
          </div>
         <?php if (!empty($errors['displayName'])): ?>
            <div class="notice-error show" id="php-displayname-error">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="fa-circle-exclamation">
                <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-384c13.3 0 24 10.7 24 24l0 112c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-112c0-13.3 10.7-24 24-24zM224 352a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z" />
              </svg><span class="error-text"><?= $errors['displayName'] ?></span>
            </div>
          <?php endif; ?>

          <div class="box-password">
            <input
              class="box-password__input"
              name="password"
              type="password"
              placeholder="Password" />
          </div>
          <!-- Hiển thị strength-bar -->
          <div class="password-strength" id="password-strength">
            <div class="strength-bar">
              <div class="strength-level" id="level-1"></div>
              <div class="strength-level" id="level-2"></div>
              <div class="strength-level" id="level-3"></div>
            </div>
            <p class="strength-text" id="strength-text"></p>
            <p class="strength-message" id="strength-message"></p>
          </div>
          <!-- ------------------------ -->

          <div class="box-password">
            <input
              class="box-password__input"
              name="confirm_password"
              type="password"
              placeholder="Confirm Password" />
          </div>

          <div class="box-button">
            <button class="box-button__submit">Sign Up</button>
          </div>
        </form>
        <div class="redirect redirect--account">
          <p class="redirect__question">Have An Account?</p>
          <span><a class="redirect__link" href="./login.php">Sign In</a></span>
        </div>
      </div>
    </div>
  </div>

  <script src="./assets/js/form-validation.js"></script>
</body>

</html>