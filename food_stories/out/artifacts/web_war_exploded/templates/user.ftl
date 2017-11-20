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
    <link href="css/feed.css"  type="text/css" rel="stylesheet" />





    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="js/input_file.js"></script>


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
        <div class="col-lg-2 col">
            <div class="container" >
            <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive">
            </div>
            </div>
        </div>
        <div class="col-lg-8 col">
            <div class="container" align="center">
                <h3><span class="label label-info">Имя </span>Владислав Каширин</h3>
                <h3><span class="label label-info">Город  </span>Иркутск</h3>
                <h3><span class="label label-info">Любимая еда  </span>Любимая еда</h3>
                </div>
            </div>
        </div>

        <div class="row justify-content-end">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="container">
                <div class="box image">
                    <div class="box-header">
                        <h3><a href=""><img src="https://goo.gl/oOD0V2" alt="" />Roswell Parian</a>
                            <span>March 21,18:45pm <i class="fa fa-globe"></i></span>
                        </h3>
                        <span><i class="glyphicon glyphicon-edit" id="edit-button"></i></span>
                        <div class="window"><span></span></div>
                    </div>
                    <!-- <div class="container edit hidden">
                            <input id="description-edit" type="text" class="description-edit" name="Описание" >
                            -->
                    <div class="box-content edit hidden" id="edit_container">

                        <div class="form-group" >
                            <div class="input-group input-file" name="Fichier1" >
                            <span class="input-group-btn" style="box-sizing: border-box">
                                <button class="btn btn-default btn-choose" type="button" >Choose</button>
                            </span>
                                <input type="text" class="form-control" placeholder='Choose a file...' style="box-sizing: border-box"/>
                                <span class="input-group-btn">
                                <button type="submit" class="btn btn-primary btn-submit" >Submit</button>
                            </span>
                            </div>
                        </div>

                        <form>
                            <div class="form-group">
                                <ul class="list-inline" id = "photo_links">
                                    <li class="list-group-item list-group-item-info justify-content-between">
                                        <div class="checkbox">
                                            <label><input type="checkbox"> photo1</label>
                                        </div>
                                    </li>
                                    <li class="list-group-item list-group-item-info justify-content-between">
                                        <div class="checkbox">
                                            <label><input type="checkbox"> photo1</label>
                                        </div>
                                    </li>
                                    <li class="list-group-item list-group-item-info justify-content-between">
                                        <div class="checkbox">
                                            <label><input type="checkbox"> photo1</label>
                                        </div>
                                    </li>
                                    <li class="list-group-item list-group-item-info justify-content-between">
                                        <div class="checkbox">
                                            <label><input type="checkbox"> photo1</label>
                                        </div>
                                    </li>


                                </ul>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" rows="3" id="text" placeholder="Расскажи что-нибудь" ></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" rows="1" id="tags" placeholder="#tag1 #tag2"></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary btn-submit" >Изменить пост</button>

                        </form>
                    </div>

                    <div class="box-content">
                        <div class="container">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">

                                    <div class="item active">
                                        <img src="static/photos/meat.jpg" alt="Los Angeles" style="width:100%;">
                                        <div class="carousel-caption">
                                            <h3>Meat</h3>
                                            <p>Pork is always so much fun!</p>
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
                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="bottom">
                            <p class="description">The life is much more interesting, when you eat meat</p>




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
    </div>
</div>
</body>
            <script>
                $(document).ready(function() {
                    $("#edit-button").on("click", function () {
                        <!-- $(".box-content").replaceWith($(".edit")); !-->
                        if( $(".edit").hasClass("hidden")){
                            $(".box-content").slideUp(function () {
                                $(".edit").removeClass("hidden").slideDown();
                                $(".box-buttons").addClass("hidden");
                                $(".box-new-comment").addClass("hidden");
                                $(".box-comments").addClass("hidden");

                            })
                        }
                        else{
                            $(".edit").slideUp(function () {
                                $(".edit").addClass("hidden");
                                $(".box-content").slideDown();

                                $(".box-buttons").removeClass("hidden");
                                $(".box-new-comment").removeClass("hidden");
                                $(".box-comments").removeClass("hidden");
                            })
                        }

                        return false;

                    })
                })
            </script>



</html>