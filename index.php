<?php
session_start();
require_once 'config.php';

// $displayName = $_SESSION['displayName'];
// var_dump($_SESSION);

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

$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'submit_feedback') {
  header('Content-Type: application/json');

  $userId = $_SESSION['user_id'] ?? null;
  $email = $_SESSION['email'] ?? '';
  $message = trim($_POST['message'] ?? '');
  $rating = (int) ($_POST['rating'] ?? 0);

  if ($userId && $email && !empty($message) && $rating > 0) {
    try {
      $stmt = $pdo->prepare("INSERT INTO feedback (userId, email, message, rating) VALUES (?, ?, ?, ?)");
      $stmt->execute([$userId, $email, $message, $rating]);

      echo json_encode(['success' => true, 'message' => 'Feedback submitted successfully!']);
    } catch (PDOException $e) {
      echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
    }
  } else {
    echo json_encode(['success' => false, 'message' => 'Please provide a message and a valid rating.']);
  }
  exit;
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
            <img
              src="./assets/img/search_icon.svg"
              alt="searchicon"
              class="header-navbartop__search--searchicon" />
            <input
              type="text"
              placeholder="SEARCH"
              id="searchInput"
              class="header-navbartop__search--searchinput" />
          </div>
          <nav class="header-navbarbottom">
            <ul class="header-navbarbottom__list">
              <li>
                <a
                  class="header-navbarbottom__item active"
                  href="./index.php">HOMEPAGE</a>
              </li>
              <li>
                <a class="header-navbarbottom__item" href="./dishes.php">DISHES</a>
              </li>
              <li>
                <a class="header-navbarbottom__item" href="./calculator.php">CALCULATOR</a>
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
    <div class="main-banner homepage-img">
      <h1 class="main-banner__name">HOME PAGE</h1>
      <div class="main-banner__content container">
        <h2 class="main-banner__content--title">
          Welcome to Nutrition Planner!
        </h2>
        <p class="main-banner__content--desc">
          Nutrition Planner helps you create a healthy diet, optimize
          nutrition, and achieve your health goals. Whether you're looking to
          lose weight, build muscle, or maintain your health, we provide
          personalized meal plans and tailored nutrition advice.
        </p>
      </div>
    </div>
    <!-- ==========================CONTENT2=================== -->
    <section class="main-choosetype container">
      <h2 class="main-choosetype-title">
        CHOOSE THE DISH YOU ARE INTERESTED IN
      </h2>
      <!-- FILTER -->
      <div class="filter-box">
        <div>
          <label for="filter-calories-min">Calories Min</label>
          <input
            type="number"
            id="filter-calories-min"
            placeholder="Example: 50" />
        </div>
        <div>
          <label for="filter-calories-max">Calories Max</label>
          <input
            type="number"
            id="filter-calories-max"
            placeholder="Example: 500" />
        </div>
        <div>
          <label for="filter-diet">Diet Type</label>
          <select id="filter-diet">
            <option value="all">All</option>
            <option value="vegan">Vegan</option>
            <option value="keto">Keto</option>
            <option value="paleo">Paleo</option>
            <option value="vegetarian">Vegetarian</option>
            <option value="gluten-free">Gluten-Free</option>
          </select>
        </div>
        <div>
          <label for="filter-mealtype">Meal Type</label>
          <select id="filter-mealtype">
            <option value="all">All</option>
            <option value="breakfast">Breakfast</option>
            <option value="lunch">Lunch</option>
            <option value="dinner">Dinner</option>
            <option value="smothies">Smothies</option>
            <option value="snack">Snack</option>
          </select>
        </div>
        <div>
          <label for="filter-allergen">Allergen</label>
          <select id="filter-allergen">
            <option value="all">none</option>
            <option value="Dairy">Không chứa Dairy</option>
            <option value="Gluten">Không chứa Gluten</option>
            <option value="Nuts">Không chứa Nuts</option>
            <option value="Soy">Không chứa Soy</option>
          </select>
        </div>
        <div>
          <label for="filter-Save">Save</label>
        </div>
      </div>
      <!-- Menu các món ăn -->
      <div class="main-dishmenu">
        <div class="main-dishmenu-list container" id="dish-list">
          <?php foreach ($dishes as $dish): ?>
            <div class="main-dishmenu-item">
              <div class="dish__card">
                <img src="<?php echo htmlspecialchars($dish['Dishimage']) ?>" alt="dish_img" class="dish__card--thumb" />
                <div class="dish__card-function">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="bookmark-icon active">
                    <path d="M0 48V487.7C0 501.1 10.9 512 24.3 512c5 0 9.9-1.5 14-4.4L192 400 345.7 507.6c4.1 2.9 9 4.4 14 4.4c13.4 0 24.3-10.9 24.3-24.3V48c0-26.5-21.5-48-48-48H48C21.5 0 0 21.5 0 48z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="heart-icon">
                    <path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
                  </svg>
                </div>
                <div class="dish__card-info">
                  <a href="#!" class="dish__card-info--name"><?php echo htmlspecialchars($dish['dishName']) ?></a>
                  <div class="dish__card-info--desc">Calories: <?php echo $dish['totalCalorie'] ?> Kcal</div>
                  <div class="dish__card-tag">
                    <?php
                    $categories = explode(',', $dish['categories']);
                    $tags = explode(',', $dish['tags']);

                    // Hiển thị category đầu tiên
                    if (isset($categories[0])) {
                      echo '<span class="dish__card-tag--tag1">' . htmlspecialchars($categories[0]) . '</span>';
                    }

                    // Hiển thị tag đầu tiên
                    if (isset($tags[0])) {
                      echo '<span class="dish__card-tag--tag2">' . htmlspecialchars($tags[0]) . '</span>';
                    }

                    // Tính số tag còn lại
                    $extra = (count($categories) - 1) + (count($tags) - 1);
                    if ($extra > 0) {
                      echo '<span class="tag tag-more">+' . $extra . '</span>';
                    }
                    ?>
                  </div>
                  <button class="dish__card--btn">VIEW MORE</button>
                </div>
                <div class="dish__ingredients" style="display: none"><?php echo $dish['ingredients'] ?></div>
                <div class="dish__allergen" style="display: none"><?php echo $dish['allergen'] ?></div>
              </div>
            </div>
          <?php endforeach; ?>
        </div>
      </div>

      <!-- Page pagination -->
      <div class="main-pagination">
        <ul class="main-pagelist">
          <!-- Nút trang sẽ được thêm tự động bằng JS -->
        </ul>
      </div>
    </section>
    <!-- ===========================FEEDBACK===================================== -->
    <section class="feedbackform">
      <h2 class="feedbackform__header">FEEDBACK FORM</h2>
      <div class="feedbackform__body">
        <div class="container feedbackform__content">
          <!-- KHối ảnh bên trái -->
          <div class="feedbackform__img">
            <img
              src="./assets/img/feedback_image.png"
              alt="feedback"
              class="feedbackform__img--thumb" />
          </div>
          <!-- KHối form bên phải -->
          <div class="feedbackform__form">
            <form id="feedback-form" action="#!">
              <!-- NAME -->
              <div class="feedbackform__formname">
                <label class="feedbackform-label">Name *</label>
                <input
                  style="opacity: 0.8;"
                  class="feedbackform--area"
                  type="text"
                  name="name"
                  placeholder="Enter your name"
                  value="<?php echo htmlspecialchars($_SESSION['displayName']); ?>"
                  readonly disabled required />

              </div>
              <!-- EMAIL -->
              <div class="feedbackform__formemail">
                <label for="feedback-email" class="feedbackform-label">Email Address *</label>
                <input
                  style="opacity: 0.8;"
                  class="feedbackform--area"
                  id="feedback-email"
                  type="text"
                  name="email"
                  placeholder="Enter your email address"
                  value="<?php echo htmlspecialchars($_SESSION['email']); ?>"
                  readonly disabled required />
              </div>
              <!-- Phonenumber -->
              <div class="feedbackform__formphone">
                <label for="feedback-phone" class="feedbackform-label">Phone Number *</label>
                <input
                  class="feedbackform--area"
                  type="tel"
                  id="feedback-phone"
                  placeholder="Enter your phone number"
                  name="tel"
                  required />
              </div>
              <div id="phone-error" class="error-message"></div>
              <!-- MESSAGE -->
              <div class="feedbackform__formmessage">
                <label class="feedbackform-label">Message*</label>
                <textarea
                  name="message"
                  id="feedback-message"
                  rows="5"
                  cols="50"
                  class="feedbackform--message"
                  required></textarea>
              </div>
              <div class="feedbackform__formrate">
                <label class="feedbackform-label">Rating</label>
                <div class="star-rating" id="rating">
                  <span class="star" data-value="1">&#9733;</span>
                  <span class="star" data-value="2">&#9733;</span>
                  <span class="star" data-value="3">&#9733;</span>
                  <span class="star" data-value="4">&#9733;</span>
                  <span class="star" data-value="5">&#9733;</span>
                </div>
                <input type="hidden" name="rating" id="rating-value" value="0" />
              </div>
              <div id="rating-error" class="error-message"></div>
              <button type="submit" class="feedbackform__btnsubmit">
                SEND MESSAGE
              </button>
              <!-- <div id="feedback-response" style="display: none;"></div> -->
            </form>
          </div>
        </div>
      </div>
    </section>
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
  <script src="./assets/js/filter_advanced.js"></script>
  <script src="./assets/js/feedbackform_logic.js"></script>
</body>

</html>