<?php
session_start();
require_once 'config.php';
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
  <title>DISHES</title>
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
                <a class="header-navbarbottom__item" href="./index.php">HOMEPAGE</a>
              </li>
              <li>
                <a
                  class="header-navbarbottom__item active"
                  href="./dishes.php">DISHES</a>
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
    <div class="main-banner dishes-img">
      <h1 class="main-banner__name">DISHES</h1>
      <div class="main-banner__content container">
        <h2 class="main-banner__content--title">
          Discover The Perfect Meal For Your Goals.
        </h2>
        <p class="main-banner__content--desc">
          Explore detailed nutrition facts, ingredients, and personalized tips
          to make every bite count.
        </p>
      </div>
    </div>
    <!-- Line đầu trang -->
    <div class="line-paginate margin__value"></div>
    <!-- Main Info -->
    <section class="dish-info container">
      <!-- Info header -->
      <div class="info-header">
        <h1 class="info-header__title">PHỞ LÝ QUỐC SƯ</h1>
      </div>
      <!-- Info content -->
      <div class="info-content">
        <div class="box-content1">
          <div class="info-content__img">
            <img
              src="./assets/img/dish_image/PhoLyQuocSu.png"
              alt="Dish1"
              class="info-content__img--thumb" />
          </div>
        </div>
        <div class="box-content2">
          <div class="info-content__recipe">
            <div class="content__recipe--header">
              Ingredients and Processing Steps
            </div>
            <div class="content__recipe--line"></div>
            <pre class="content__recipe--info">
  Bước 1: Chuẩn bị nguyên liệu
  Rửa sạch xương bò, thịt bò.
  Rang hành tím, gừng trên lửa cho dậy mùi thơm.
  Bước 2: Ninh nước dùng
  Cho xương bò vào nồi nước lớn, ninh khoảng 1–2 giờ để lấy nước ngọt.
  Hớt bọt liên tục để nước trong.
  Bước 3: Thêm gia vị
  Cho hành, gừng đã rang, cùng các loại gia vị (thảo quả, quế, hồi, đinh hương) vào nồi nước dùng.
  Nêm muối, đường phèn, nước mắm cho vừa miệng.
  Bước 4: Chuẩn bị bánh phở và thịt bò
  Trụng bánh phở cho mềm.
  Thái thịt bò mỏng, ướp nhẹ gia vị.
  Bước 5: Trình bày tô phở
  Cho bánh phở vào bát, xếp thịt bò lên.
  Chan nước dùng đang sôi vào.
  Thêm hành lá, rau thơm theo sở thích.
  Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quam quos harum iusto eius voluptatum atque vel necessitatibus, rerum adipisci iste deserunt earum quibusdam quis nostrum consequuntur dolor maiores nesciunt? Voluptas.
  Ea assumenda quia, tempora sapiente illum et corrupti nostrum saepe sunt porro numquam iste laudantium doloremque dolor atque consectetur distinctio impedit velit quod aspernatur corporis vel? Est quos nulla ea?
  Enim praesentium nostrum, aut culpa facere voluptates at, quae pariatur iusto dolorum ab dolores nam debitis quasi modi eos similique veritatis, qui tenetur laboriosam laudantium voluptate! Magni dolorem blanditiis officia.
  Blanditiis, atque, accusamus iure ad sunt est molestiae at cupiditate distinctio tempore, odio beatae adipisci aliquid reprehenderit consectetur. Aspernatur accusantium beatae, saepe assumenda vero debitis voluptate fuga unde delectus perspiciatis.
  Modi quas, eius, cum dignissimos et in ipsum aspernatur perferendis beatae rerum placeat veniam blanditiis distinctio iusto expedita eveniet qui. Id soluta, velit sed illum alias nam unde explicabo? Temporibus!
  Provident, magnam placeat atque, quisquam harum voluptates exercitationem excepturi, earum similique asperiores iusto consequatur odit modi. Deleniti culpa provident perspiciatis, accusantium delectus quis, sunt modi minus nam soluta fugiat veniam.
  Odio modi voluptatibus inventore repellendus, ipsum necessitatibus corporis, accusantium eum laboriosam numquam vel rerum! Rem deserunt aut autem enim nemo quis, quia illo labore ut alias quas delectus, facilis praesentium.
  Suscipit odit, quis magnam laudantium repudiandae blanditiis ipsum ipsam explicabo possimus ducimus rem, tempora dolores, minima nulla! Quidem est, tenetur quaerat qui nihil officia, laudantium necessitatibus, exercitationem doloribus dolores magni.
  Adipisci officia accusamus cupiditate facilis aut eum, amet fuga dolores illo expedita minima, cumque qui ullam nam nemo fugit dignissimos eius atque non, odio consectetur. Quo magnam eos in obcaecati?
  Asperiores, voluptatem quos! Asperiores incidunt corporis earum ipsum adipisci inventore sed? Totam quae, quaerat neque, dolores repellat dolore assumenda nobis ullam eos atque praesentium debitis consequuntur aspernatur ab, facere sed?
              </pre>
          </div>
        </div>
        <div class="box-content3">
          <div class="info-content__nutrition">
            <div class="nutrition-header">
              <h3 class="nutrition-header__title">Nutrition Facts</h3>
            </div>
            <div class="content__nutrition--info">
              <div class="nutrition-lineinfo">
                <p class="nutrition-lineinfo__name">Calories:</p>
                <p class="nutrition-lineinfo__value">350 kcal</p>
              </div>
              <div class="nutrition-lineinfo">
                <p class="nutrition-lineinfo__name">Protein:</p>
                <p class="nutrition-lineinfo__value">25 g</p>
              </div>
              <div class="nutrition-lineinfo">
                <p class="nutrition-lineinfo__name">Fat:</p>
                <p class="nutrition-lineinfo__value">12 g</p>
              </div>
              <div class="nutrition-lineinfo">
                <p class="nutrition-lineinfo__name">Carbohydrates:</p>
                <p class="nutrition-lineinfo__value">12 g</p>
              </div>
            </div>
          </div>
          <div class="content-tag">
            <div class="content-tag__title">TAG:</div>
            <span class="content-tag__card">vegan</span>
            <span class="content-tag__card">breakfast</span>
          </div>
        </div>
      </div>
    </section>
    <!-- Pagination Controls -->
    <div class="main-pagination-dish">
      <ul class="main-pagelist-dish">
        <li>
          <a class="main-pageitem main-page-prev" href="#!" data-nav="prev">
            <i class="fa-solid fa-angle-left fa-2x"></i>
          </a>
        </li>
        <li>
          <a class="main-pageitem main-page-next" href="#!" data-nav="next">
            <i class="fa-solid fa-angle-right fa-2x"></i>
          </a>
        </li>
      </ul>
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
</body>

</html>