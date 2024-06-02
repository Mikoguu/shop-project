<!DOCTYPE html>
<html lang="ru">
  <head>
    <title>main - ГеймсМаркет</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="/css/libs.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/media.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <div class="main-wrapper">
      @include('layouts.header')
      <div class="middle">
        <div class="sidebar">
          @include('layouts.sidebar.categories')
          @include('layouts.sidebar.news')
        </div>
        <div class="main-content">
          <div class="content-top">
            <div class="content-top__text">Купить игры неборого без регистрации смс с торента, получить компкт диск, скачать Steam игры после оплаты</div>
            <div class="slider"><img src="/img/slider.png" alt="Image" class="image-main"></div>
          </div>
          @yield('content')
          <div class="content-bottom"></div>
        </div>
      </div>
        </div>
        @include('layouts.footer')
    <script src="js/main.js"></script>
  </body>
</html>