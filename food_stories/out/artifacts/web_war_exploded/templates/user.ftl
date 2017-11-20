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
                <li class="active"><a href="/main">Главная</a></li>
                <li><a href="/my_stories?id=${c_user.id}">Мои истории</a></li>
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
    <div class="row justify-content-end">
        <div class="col-lg-2 col">
            <div class="container" >
            <div  align="center"> <img alt="User Pic" src="/load/${user.photo}" id="profile-image1" class="img-circle img-responsive">
            </div>
            </div>
        </div>
        <div class="col-lg-8 col">
            <div class="container" align="center">
                <h3><span class="label label-info">Имя </span>${user.name}</h3>
                <h3><span class="label label-info">Город  </span>${user.city}</h3>
                </div>
            </div>
        </div>

        <div class="row justify-content-end">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="container">
            <#list posts as post>
            <div class="box image">
                <div class="box-header">
                    <h3><a href=""><img src="/load/${user.photo}" alt="" />${user.login}</a>
                        <span>March 21,18:45pm <i class="fa fa-globe"></i></span>
                    </h3>
                    <span><i class="glyphicon glyphicon-edit" onclick="location.href = '/post?id=${post.id}';"></i></span>
                    <div class="window"><span></span></div>
                </div>
                <div class="box-content">
                    <#if post.photos?size = 0>

                    <#else>
                    <div class="container">

                        <div id="myCarousel${post.id}" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel${post.id}" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel${post.id}" data-slide-to="1"></li>
                                <li data-target="#myCarousel${post.id}" data-slide-to="2"></li>
                            </ol>

                            <#assign flag = 0>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <#list post.photos as photo>
                                    <#if flag = 0>
                                    <div class="item active">
                                    <#else>
                                    <div class="item">
                                    </#if>
                                    <#assign flag = 1>
                                    <img src="/load/${photo}" alt="Los Angeles" style="width:100%;">
                                    <div class="carousel-caption">
                                        <h3>Los Angeles</h3>
                                        <p>LA is always so much fun!</p>
                                    </div>
                                </div>
                                </#list>

                            </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel${post.id}" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel${post.id}" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </#if>
                    <div class="bottom">
                        <p>${post.text}</p>
                    </div>

                </div>


                    <div class="box-buttons">
                        <div class="row">
                            <button><span class="glyphicon glyphicon-heart"> </span> ${post.likes}</button>
                            <button>145 <span class="glyphicon glyphicon-comment"></span></button>
                        </div>
                    </div>


                </div>

            </#list>
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