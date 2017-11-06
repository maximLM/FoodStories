<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/styles.css" media="screen" type="text/css" />
    <link href="css/facebook.css" type="text/css" rel="stylesheet">

    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>


            </button>
            <a class="navbar-brand" href="#">FoodStories</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Главная</a></li>
                <li><a href="#">Мои истории</a></li>
                <li><a href="#">Описание</a></li>
                <li><a href="#">Полезное</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Поиск">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">
                        <span class=" glyphicon glyphicon-user" >
                        </span>
                    </a>

                </li>
                <li><a href="#"><span class="glyphicon glyphicon-log-out" ></span>Выйти</a></li>
            </ul>

        </div>
    </div>
</nav>

<div class="container" >
    <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive">

        <input id="profile-image-upload" class="hidden" type="file">
        <div style="color:#999;" >Изменить аватар</div>
        <!--Upload Image Js And Css-->







    </div>
<form method="POST">
    <div class="input-group">
        <span class="input-group-addon">Имя</span>
        <input id="name" type="text" class="form-control" name="name" value="${user.name}">
    </div>
    <div class="input-group">
        <span class="input-group-addon">Логин</span>
        <input id="login" type="text" class="form-control" name="login" value="${user.login}">
    </div>
    <div class="input-group">
        <span class="input-group-addon">Email</span>
        <input id="email" type="email" class="form-control" name="email" value="${user.email}">
    </div>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
        <input id="password" type="password" class="form-control" name="password">
    </div>
    <div class="input-group">
        <span class="input-group-addon">Город</span>
        <input id="city" type="text" class="form-control" name="city" value="${user.city}">
    </div>
    <div class="input-group">
        <span class="input-group-addon">Любимая еда</span>
        <input id="food" type="text" class="form-control" name="food" value="TODO">
    </div>
    <div align="center">
        <input type="submit"  value="Подтвердить">
    </div>
</form>

</div>
</body>

<script>
    $(function() {
        $('#profile-image1').on('click', function() {
            $('#profile-image-upload').click();
        });
    });

</script>

</html>