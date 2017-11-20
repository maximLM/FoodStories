<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>
    <link href="css/post.css"  type="text/css" rel="stylesheet" />
    <link href="css/navigation.css"  type="text/css" rel="stylesheet" />
    <link href="css/feed.css" type="text/css" rel="stylesheet" />

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
                <li class="active"><a href="/main">Главная</a></li>
                <li><a href="/my_stories?id=${user.id}">Мои истории</a></li>
                <li><a href="/about">Описание</a></li>
                <li><a href="/useful">Полезное</a></li>
                <li><a href="/create_post">Новый пост</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/profile">
                        <span class=" glyphicon glyphicon-user" >
                        </span>
                    </a>

                </li>
                <li><a href="/logout"><span class="glyphicon glyphicon-log-out" ></span>Выйти</a></li>
            </ul>

        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <h1><p class="bg-primary" align="center">О сайте</p>
                        </h1>
                    </div>
                </div>
            <div style="padding-top: 100px; margin-bottom: 100px">
                <h3 align="center">
                Все мы иногда едим пищу, которую не должны есть. Но она такая вкусная. Тут у вас есть возможность писать обо всей еде, которую вы съели и пожалели об этом, так как теперь наберёте вес. Но она была такая вкусная. Можно оформить некоторые фразы, как фальшивые некрологи. Например, сожаления о том, что этот замечательный пирог погиб из-за вас <br>
                    <br>
                    <br>
                Тип сайта: персональный блог. <br>
                    <br>
                Каждый раз, когда вы едите пищу, из-за которой чувствуете себя виноватым, размещайте её фотографию и свои мысли по этому поводу. Фотография может содержать тарелку с крошками или само блюдо. <br>

                Теги поста для удобного поиска. <br>
                    <br>
                Форма, чтобы другие пользователи могли также поведать свои истории. <br><br>
                Список полезных ресурсов, таких как диетические форумы или фитнес-приложения <br><br>
                </h3>
        </div>
    </div>
</div>
</body>
</html>