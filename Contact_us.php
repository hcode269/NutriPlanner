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
                <a class="header-navbarbottom__item" href="./index.php">HOMEPAGE</a>
              </li>
              <li>
                <a class="header-navbarbottom__item" href="./dishes.php">DISHES</a>
              </li>
              <li>
                <a class="header-navbarbottom__item" href="./calculator.php">CALCULATOR</a>
              </li>
              <li>
                <a
                  class="header-navbarbottom__item active"
                  href="./contact_us.php">CONTACT US</a>
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
    <div class="main-banner contact-img">
      <h1 class="main-banner__name">CONTACT US</h1>
      <div class="main-banner__content container">
        <h2 class="main-banner__content--title">
          We’re always here to hear from you!
        </h2>
        <p class="main-banner__content--desc">
          Whether you need support, advice, or just want to say hello — don’t
          hesitate to reach out!
        </p>
      </div>
    </div>
    <!-- ================================================ -->
    <div class="line-paginate margin__value"></div>
    <!-- ============================================= -->
    <section class="contact-content container">
      <p class="contact-content__title">
        WE’RE ALWAYS READY TO SUPPORT YOU ON YOUR HEALTH JOURNEY.
      </p>
      <p class="contact-content__desc">
        Whether you need personal coaching, nutritional advice, or want to
        visit us in person feel free to get in touch!
      </p>
      <div class="contact-infolist">
        <div class="contact__item item-1">
          <p class="contact__item--title">Call Center</p>
          <p class="contact__item--desc">0912.097.622</p>
        </div>
        <div class="contact__item item-2">
          <p class="contact__item--title">Our Location</p>
          <p class="contact__item--desc">
            19 Le Thanh Nghi Street, Hai Ba Trung District, Hanoi, Vietnam
          </p>
        </div>
        <div class="contact__item item-3">
          <p class="contact__item--title">Email</p>
          <p class="contact__item--desc">nutritionpt@gmail.com</p>
        </div>
        <div class="contact__item item-4">
          <p class="contact__item--title">Social Network</p>
          <div class="contact__item--icon">
            <i class="fa-brands fa-facebook fa-2x"></i>
            <i class="fa-brands fa-youtube fa-2x"></i>
            <i class="fa-brands fa-tiktok fa-2x"></i>
          </div>
        </div>
      </div>
    </section>
    <section class="contact-map container">
      <h3 class="contact-map__title">Our Central Location:</h3>
      <iframe
        src="https://www.google.com/maps?q=21.003140890913752, 105.85038621748575&z=15&output=embed"
        width="1140"
        height="450"
        style="border: 0"
        allowfullscreen=""
        loading="lazy">
      </iframe>
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
</body>

</html>