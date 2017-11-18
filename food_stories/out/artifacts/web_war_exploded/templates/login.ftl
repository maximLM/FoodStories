<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/styles.css" media="screen" type="text/css" />
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/"></script>
    <script src="js/bootstrap.js"></script>

    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
</head>
<body class="body-wrap">
<div class="container log">
<section class="login-form-wrap">

    <h1>FoodStories</h1>
    <form class="login-form" action="#" method = "POST">
        <label>
            <input type="text" name="login" required placeholder="Логин">
        </label>
        <label>
            <input type="password" name="password" required placeholder="Пароль">
        </label>
        <label class="checkbox">
            <input type="checkbox" id ="remember_me" name="rememberMe" value="remember_me"> Запомнить меня
        </label>
        <input type="submit" value="Войти">
        <h5>Нет аккаунта? <a href="#" id="reg-button">Зарегистрироваться</a></h5>

    </form>
</section>
</div>
    <div class="container reg hidden">
        <section class="login-form-wrap">
    <form class="login-form" action="#">
        <label>
            <input type="text" name="login" required placeholder="Логин">
        </label>
        <label>
            <input type="text" name="name" required placeholder="Имя">
        </label>
        <label>
            <input type="email" name="email" required placeholder="Email">
        </label>

        <label>
            <input type="password" name="password" required placeholder="Пароль">
        </label>
        <input type="submit" value="Регистрация">
        <h5>Уже зарегистрированы? <a href="#" id="log-button">Войти</a></h5>


    </form>

</section>
    </div>
</body>
<script>
    $(document).ready(function(){
        $("#reg-button").on("click", function() {
            $(".log").slideUp(function() {
                $(".reg").hide().removeClass("hidden").slideDown()
            })
            return false;
        })
        $("#log-button").on("click", function() {
            $(".reg").slideUp(function() {
                $(".log").hide().slideDown()
            })
            return false;
        })
    })
</script>
</html>