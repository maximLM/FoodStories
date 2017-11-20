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
    <meta charset="UTF-8">

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4">
                <h3><p class="bg-primary" align="center">This text is important.</p>
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-lg-offset-2">
                <div class="list-group">
                    <a href="#" class="list-group-item active">#tag1</a>
                    <a href="#" class="list-group-item">#tag2</a>
                    <a href="#" class="list-group-item">#tag3</a>
                </div>
            </div>
            <div class="col-lg-4 col">
                <div class="list-group">
                    <a href="#" class="list-group-item active">#tag1</a>
                    <a href="#" class="list-group-item">#tag2</a>
                    <a href="#" class="list-group-item">#tag3</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>