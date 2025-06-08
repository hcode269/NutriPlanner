<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Nhúng thư viện Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
    <!-- reset css -->
    <link rel="stylesheet" href="./assets/css/reset.css" />
    <!-- embed font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
    <!-- style css -->
    <link rel="stylesheet" href="./assets/css/style.css" />
    <title>Meal Infomation</title>
  </head>
  <body>
    <!-- ==========================HEADER=================== -->
    <header class="header fixed">
      <div class="container">
        <div class="header__body">
          <!-- Logo -->
          <a href="./index.html"
            ><img
              src="./assets/img/logo.svg"
              alt="NutriPlanerLogo"
              class="header__body--logo"
          /></a>
          <!-- Action -->
          <div class="header-navbartop">
            <div class="header-navbartop__search">
              <img
                src="./assets/img/search_icon.svg"
                alt="searchicon"
                class="header-navbartop__search--searchicon"
              />
              <input
                type="text"
                placeholder="SEARCH"
                id="searchInput"
                class="header-navbartop__search--searchinput"
              />
            </div>
            <nav class="header-navbarbottom">
              <ul class="header-navbarbottom__list">
                <li>
                  <a class="header-navbarbottom__item" href="./index.html"
                    >HOMEPAGE</a
                  >
                </li>
                <li>
                  <a class="header-navbarbottom__item" href="./dishes.html"
                    >DISHES</a
                  >
                </li>
                <li>
                  <a class="header-navbarbottom__item" href="./calculator.html"
                    >CALCULATOR</a
                  >
                </li>
                <li>
                  <a class="header-navbarbottom__item" href="./contact_us.html"
                    >CONTACT US</a
                  >
                </li>
              </ul>
            </nav>
          </div>
          <!-- Account -->
          <div class="header__account">
            <img
              src="./assets/img/ava_user.jpg"
              alt="account"
              id="accountAvatar"
              class="header__acount--ava"
            />
            <div class="header__acount--name">HUY PHÙNG</div>
            <div class="account-dropdown" id="accountDropdown">
              <div class="account-dropdown__box">
                <button class="account-dropdown__logout">
                  <span class="logout-text">Logout</span>
                  <span class="logout-icon-initial"
                    ><i class="fa-solid fa-arrow-right"></i
                  ></span>
                  <span class="logout-icon-final"
                    ><i class="fa-solid fa-arrow-right"></i
                  ></span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- ===============================MAIN =================================== -->
    <main>
      <div class="main-banner">
        <h1 class="main-banner__name">MEAL INFORMATION</h1>
        <div class="main-banner__content container">
          <h2 class="main-banner__content--title">
            Welcome to the Meal Information Page!
          </h2>
          <p class="main-banner__content--desc">
            The Meal Information Page provides detailed descriptions,
            nutritional facts, and ingredients for each dish.
          </p>
        </div>
      </div>
      <!-- Line đầu trang -->
      <div class="line-paginate margin__value"></div>
      <!-- Main Info -->
    </main>
    <script src="./assets/js/main.js"></script>
  </body>
</html>
