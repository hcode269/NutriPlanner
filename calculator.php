<?php
session_start();
require_once 'config.php';
//copy từ bên index.php

if (!isset($_SESSION['user_id'])) {
  header("Location: login.php");
  exit;
}

// Ngăn cache luôn
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Pragma: no-cache");
header("Expires: 0");
try {
  $sql = "SELECT 
    d.*,
    GROUP_CONCAT(DISTINCT c.categoryName SEPARATOR ',') AS categories,
    GROUP_CONCAT(DISTINCT t.tagName SEPARATOR ',') AS tags,
    GROUP_CONCAT(DISTINCT i.ingredientName SEPARATOR ',') AS ingredients,
    GROUP_CONCAT(DISTINCT a.allergenName SEPARATOR ',') AS allergen
  FROM dishes d
  LEFT JOIN categorydish cd ON d.dishId = cd.dishId
  LEFT JOIN categories c ON cd.categoryId = c.categoryId
  LEFT JOIN dishtag dt ON d.dishId = dt.dishId
  LEFT JOIN tag t ON dt.tagId = t.tagId
  LEFT JOIN dishingredient di ON d.dishId = di.dishId
  LEFT JOIN ingredients i ON di.ingredientId = i.ingredientId
  LEFT JOIN dishallergen da ON d.dishId = da.dishId
  LEFT JOIN allergen a ON da.allergenId = a.allergenId
  GROUP BY d.dishId";

  $stmt = $pdo->prepare($sql);
  $stmt->execute();
  $dishes = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
  die("Lỗi truy vấn dishes: " . $e->getMessage());
}
// Lấy danh sách categories từ DB
$stmt = $pdo->query("SELECT categoryName FROM categories");
$mealtypes = $stmt->fetchAll(PDO::FETCH_COLUMN);
// Chọn các chế độ ăn kiêng
$stmt = $pdo->query("SELECT tagName FROM tag");
$tags = $stmt->fetchAll(PDO::FETCH_COLUMN);
// -----------------------------------

?>
<!DOCTYPE html>
<html lang="vi">

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
  <!-- Nhúng thư viện Font Awesome -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
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
  <title>NutriPlaner</title>
</head>

<body>
  <!-- ==========================HEADER=================== -->
  <header class="header fixed">
    <div class="container">
      <div class="header__body">
        <!-- Logo -->
        <a href="./index.php"><img
            src="./assets/img/logo.svg"
            alt="NutriPlanerLogo"
            class="header__body--logo" /></a>
        <!-- Action -->
        <div class="header-navbartop">
          <div class="header-navbartop__search">
            <div class="navbartop--searchbox">
              <div class="navbartop--searchiconbox">
                <img
                  src="./assets/img/search_icon.svg"
                  alt="searchicon"
                  class="header-navbartop__search--searchicon" />
              </div>
              <div class="navbartop--searchinputbox">
                <input
                  type="text"
                  placeholder="SEARCH"
                  id="searchInput"
                  class="header-navbartop__search--searchinput" />
              </div>
              <div class="search-result-dropdown">
                <div class="searchResult-list">
                  <?php foreach ($dishes as $dish): ?>
                    <div class="search-dish-item" data-dish-id="<?php echo $dish['dishId']; ?>">
                      <img class="dish-item-image" src="<?php echo htmlspecialchars($dish['Dishimage']) ?>" alt="dish_img">
                      <div class="search-dish-info">
                        <a href="#!" class="search-dish-name"><?php echo htmlspecialchars($dish['dishName']) ?></a>
                        <div class="search-dish-calories">Calories: <?php echo $dish['totalCalorie'] ?> Kcal</div>
                        <div class="search-dish-tags">
                          <?php
                          $tags = explode(',', $dish['tags']);
                          foreach ($tags as $tag) {
                            echo '<span class="search-dish-tag">' . htmlspecialchars($tag) . '</span>';
                          }
                          ?>
                        </div>
                        <div class="dish__tags" style="display: none;">
                          <?= htmlspecialchars($dish['categories'] . ',' . $dish['tags']) ?>
                        </div>
                        <div class="dish__ingredients" style="display: none">
                          <?= htmlspecialchars($dish['ingredients']) ?>
                        </div>
                        <div class="dish__allergen" style="display: none">
                          <?= htmlspecialchars($dish['allergen']) ?>
                        </div>
                      </div>
                    </div>
                  <?php endforeach; ?>

                </div>
              </div>
              <div class="clearsearch-btnbox"><button id="clearSearchBtn" class="clear-search-btn">✕</button></div>
            </div>
          </div>
          <nav class="header-navbarbottom">
            <ul class="header-navbarbottom__list">
              <li>
                <a class="header-navbarbottom__item" href="./index.php">HOMEPAGE</a>
              </li>
              <li>
                <a class="header-navbarbottom__item" href="./dishes.php">DISHES</a>
              </li>
              <li>
                <a
                  class="header-navbarbottom__item active"
                  href="./calculator.php">CALCULATOR</a>
              </li>
              <li>
                <a class="header-navbarbottom__item" href="./contact_us.php">CONTACT US</a>
              </li>
            </ul>
          </nav>
        </div>
        <!-- Account -->
        <div class="header__account">
          <img
            src="<?php echo htmlspecialchars($_SESSION['userAvatar']); ?>"
            alt="account"
            id="accountAvatar"
            class="header__acount--ava" />
          <div class="header__acount--name"><?php echo htmlspecialchars($_SESSION['displayName']); ?></div>
          <div class="account-dropdown" id="accountDropdown">
            <div class="account-dropdown__box">
              <button class="account-dropdown__logout">
                <span class="logout-text">Logout</span>
                <span class="logout-icon-initial"><i class="fa-solid fa-arrow-right"></i></span>
                <span class="logout-icon-final"><i class="fa-solid fa-arrow-right"></i></span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- ==========================MAIN=================== -->
  <main>
    <div class="main-banner calculator-img">
      <h1 class="main-banner__name">CALCULATOR</h1>
      <div class="main-banner__content container">
        <h2 class="main-banner__content--title">
          Welcome to Nutrition Planner!
        </h2>
        <p class="main-banner__content--desc">
          Discover the power of personalized nutrition with our nutrition
          calculator. <br />
          Track your intake, analyze your diet, and optimize your nutrition to
          reach your health and fitness goals.
        </p>
      </div>
    </div>

    <!-- =========================TABLE========================== -->
    <div class="line-paginate mt"></div>
    <div class="container">
      <div class="calculator__table">
        <ul class="calculator__toprow">
          <li class="col-1">STT</li>
          <li class="col-2">INGREDIENT</li>
          <li class="col-3">QUANTITY (g)</li>
        </ul>

        <div class="caculator-infowrap">
          <ul class="calculator__row">
            <li class="col-1">1</li>
            <li class="col-2">
              <select class="ingredient-select">
              </select>
            </li>
            <li class="col-3">
              <div class="custom-number-wrapper">
                <input
                  type="number"
                  class="col-3__value"
                  value=""
                  min="0"
                  step="10"
                  placeholder="E.g: 500" />

                <div class="custom-spinner">
                  <button class="btn-increase">
                    <i class="fa-solid fa-caret-up"></i>
                  </button>
                  <button class="btn-decrease">
                    <i class="fa-solid fa-caret-down"></i>
                  </button>
                </div>
              </div>
              <i class="fa-solid fa-circle-minus delete-icon fa-2x"></i>
            </li>
          </ul>

          <!-- Add item button -->
          <button class="calculator__add-btn">
            <div class="border-fa-plus">
              <i class="fa-solid fa-plus"></i>
            </div>
            <span class="add-btn__text">Add Item</span>
          </button>
        </div>
      </div>
    </div>
    <!-- ================================RESULT=========================== -->
    <div class="container">
      <div class="calculator__result">
        <div class="result-box">
          <h3 class="result-box--title">Total Nutrition Facts</h3>
          <div class="box-title__line-under"></div>
          <ul class="result-box-content">
            <li class="result-box-content__row">
              <span class="result-box--nutri">Calories:</span>
              <span class="result-box--value" id="total-calo">0 kcal</span>
            </li>
            <li class="result-box-content__row">
              <span class="result-box--nutri">Protein:</span>
              <span class="result-box--value" id="total-protein">0 g</span>
            </li>
            <li class="result-box-content__row">
              <span class="result-box--nutri">Fats:</span>
              <span class="result-box--value" id="total-fat">0 g</span>
            </li>
            <li class="result-box-content__row">
              <span class="result-box--nutri">Carb:</span>
              <span class="result-box--value" id="total-carb">0 g</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </main>

  <!-- FOOTER -->
  <footer class="container footer">
    <div class="footer__logo">
      <a href="#!"><img
          src="./assets/img/logo.svg"
          alt="logo"
          class="footer__logo--thumb" /></a>
    </div>
    <p class="footer__title">&#169; 2025 NUTRITION PLANNER</p>
    <div class="footer__content">
      <p class="footer__content--desc">TERM</p>
      <p class="footer__content--desc">PRIVACY</p>
      <p class="footer__content--desc">COOKIES</p>
    </div>
  </footer>
  <script src="./assets/js/form-index.js"></script>
  <script src="./assets/js/additem.js"></script>
  <script src="./assets/js/delitem.js"></script>
</body>

</html>