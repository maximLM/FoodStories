<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>
    <link href="css/post.css"  type="text/css" rel="stylesheet" />
    <link href="css/navigation.css"  type="text/css" rel="stylesheet" />
    <link href="css/feed.css" type="text/css" rel="stylesheet" />




    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
</head>
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

<div class="container-fluid">

    <div class="row justify-content-end">

        <div class="col-lg-2 col" style="position:absolute">
            <div class="list-group">
                <div class="thumbnail">
                    <a href="#">
                        <img src="static/photos/ny.jpg">
                            <div class="caption">
                                <p>Post text</p>
                            </div>
                    </a>
                </div>
                <div class="thumbnail">
                    <a href="#">
                        <img src="static/photos/ny.jpg">
                        <div class="caption">
                            <p>Post text</p>
                        </div>
                    </a>
                </div>
                <div class="thumbnail">
                    <a href="#">
                        <img src="static/photos/ny.jpg">
                        <div class="caption">
                            <p>Post text</p>
                        </div>
                    </a>
                </div>
            </div>
            </div>
        </div>
        <div class="col-lg-8 col">

            <div class="container">
            <div class="box image">
                <div class="box-header">
                    <h3><a href=""><img src="https://goo.gl/oOD0V2" alt="" />Roswell Parian</a>
                        <span>March 21,18:45pm <i class="fa fa-globe"></i></span>
                    </h3>
                    <span><i class="glyphicon glyphicon-edit"></i></span>
                    <div class="window"><span></span></div>
                </div>
                <div class="box-content">
                    <div class="container">
                        <div id="myCarousel1" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel1" data-slide-to="1"></li>
                                <li data-target="#myCarousel1" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">

                                <div class="item active">
                                    <img src="static/photos/meat.jpg" alt="Los Angeles" style="width:100%;">
                                    <div class="carousel-caption">
                                        <h3>Los Angeles</h3>
                                        <p>LA is always so much fun!</p>
                                    </div>
                                </div>

                                <div class="item">
                                    <img src="static/photos/meat.jpg" alt="Chicago" style="width:100%;">
                                    <div class="carousel-caption">
                                        <h3>Chicago</h3>
                                        <p>Thank you, Chicago!</p>
                                    </div>
                                </div>

                                <div class="item">
                                    <img src="static/photos/ny.jpg" alt="New York" style="width:100%;">
                                    <div class="carousel-caption">
                                        <h3>New York</h3>
                                        <p>We love the Big Apple!</p>
                                    </div>
                                </div>

                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel1" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="bottom">
                        <p>The life is much more interesant, when you remmenber the last time</p>
                    </div>
                    <div class = "container" style="width:100%;height:50px;float:left;overflow-x:scroll;white-space:nowrap; text-align: center">
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>
                        <div class = "tag">
                            <a href="#">like</a>
                        </div>


                    </div>
                </div>


                <div class="box-buttons">
                    <div class="row">
                        <button><span class="glyphicon glyphicon-heart"> </span> 99</button>
                        <button>145 <span class="glyphicon glyphicon-comment"></span></button>
                    </div>
                </div>


            </div>
                <div class="box image">
                    <div class="box-header">
                        <h3><a href=""><img src="https://goo.gl/oOD0V2" alt="" />Roswell Parian</a>
                            <span>March 21,18:45pm <i class="fa fa-globe"></i></span>
                        </h3>
                        <span><i class="glyphicon glyphicon-edit"></i></span>
                        <div class="window"><span></span></div>
                    </div>
                    <div class="box-content">
                        <div class="container">
                            <div id="myCarousel2" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel2" data-slide-to="1"></li>
                                    <li data-target="#myCarousel2" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">

                                    <div class="item active">
                                        <img src="static/photos/meat.jpg" alt="Los Angeles" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Los Angeles</h3>
                                            <p>LA is always so much fun!</p>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="static/photos/chicago.jpg" alt="Chicago" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Chicago</h3>
                                            <p>Thank you, Chicago!</p>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="static/photos/ny.jpg" alt="New York" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>New York</h3>
                                            <p>We love the Big Apple!</p>
                                        </div>
                                    </div>

                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel2" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel2" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="bottom">
                            <p>The life is much more interesant, when you remmenber the last time</p>
                        </div>
                        <div class = "container" style="width:100%;height:50px;float:left;overflow-x:scroll;white-space:nowrap; text-align: center">
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>


                        </div>
                    </div>


                    <div class="box-buttons">
                        <div class="row">
                            <button><span class="glyphicon glyphicon-heart"> </span> 99</button>
                            <button>145 <span class="glyphicon glyphicon-comment"></span></button>
                        </div>
                    </div>


                </div>
                <div class="box image">
                    <div class="box-header">
                        <h3><a href=""><img src="https://goo.gl/oOD0V2" alt="" />Roswell Parian</a>
                            <span>March 21,18:45pm <i class="fa fa-globe"></i></span>
                        </h3>
                        <span><i class="glyphicon glyphicon-edit"></i></span>
                        <div class="window"><span></span></div>
                    </div>
                    <div class="box-content">
                        <div class="container">
                            <div id="myCarousel3" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel3" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel3" data-slide-to="1"></li>
                                    <li data-target="#myCarousel3" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">

                                    <div class="item active">
                                        <img src="static/photos/la.jpg" alt="Los Angeles" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Los Angeles</h3>
                                            <p>LA is always so much fun!</p>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="static/photos/chicago.jpg" alt="Chicago" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Chicago</h3>
                                            <p>Thank you, Chicago!</p>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="static/photos/ny.jpg" alt="New York" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>New York</h3>
                                            <p>We love the Big Apple!</p>
                                        </div>
                                    </div>

                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel3" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel3" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="bottom">
                            <p>The life is much more interesant, when you remmenber the last time</p>
                        </div>
                        <div class = "container" style="width:100%;height:50px;float:left;overflow-x:scroll;white-space:nowrap; text-align: center">
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>


                        </div>
                    </div>


                    <div class="box-buttons">
                        <div class="row">
                            <button><span class="glyphicon glyphicon-heart"> </span> 99</button>
                            <button>145 <span class="glyphicon glyphicon-comment"></span></button>
                        </div>
                    </div>


                </div>
                <div class="box image">
                    <div class="box-header">
                        <h3><a href=""><img src="https://goo.gl/oOD0V2" alt="" />Roswell Parian</a>
                            <span>March 21,18:45pm <i class="fa fa-globe"></i></span>
                        </h3>
                        <span><i class="glyphicon glyphicon-edit"></i></span>
                        <div class="window"><span></span></div>
                    </div>
                    <div class="box-content">
                        <div class="container">
                            <div id="myCarousel4" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel4" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel4" data-slide-to="1"></li>
                                    <li data-target="#myCarousel4" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">

                                    <div class="item active">
                                        <img src="static/photos/la.jpg" alt="Los Angeles" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Los Angeles</h3>
                                            <p>LA is always so much fun!</p>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="static/photos/chicago.jpg" alt="Chicago" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Chicago</h3>
                                            <p>Thank you, Chicago!</p>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="static/photos/ny.jpg" alt="New York" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>New York</h3>
                                            <p>We love the Big Apple!</p>
                                        </div>
                                    </div>

                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel4" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel4" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="bottom">
                            <p>The life is much more interesant, when you remmenber the last time</p>
                        </div>
                        <div class = "container" style="width:100%;height:50px;float:left;overflow-x:scroll;white-space:nowrap; text-align: center">
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>
                            <div class = "tag">
                                <a href="#">like</a>
                            </div>


                        </div>
                    </div>


                    <div class="box-buttons">
                        <div class="row">
                            <button><span class="glyphicon glyphicon-heart"> </span> 99</button>
                            <button>145 <span class="glyphicon glyphicon-comment"></span></button>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <div class="col-lg-2 col" >
            <div class="list-group">
                <a href="#" class="list-group-item active">#tag1</a>
                <a href="#" class="list-group-item">#tag2</a>
                <a href="#" class="list-group-item">#tag3</a>
            </div>
        </div>
    </div>
</div>

</body>

</body>
</html>