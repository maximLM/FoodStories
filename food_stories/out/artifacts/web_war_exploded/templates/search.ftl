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
                <li> <a href="#">Главная</a></li>
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
<div class="row justify-content-center">

<div class="search-container">

    <div class="input-group" >

    <input type="text" id="pattern" class="form-control" placeholder="Поиск по историям">
    <div class="input-group-btn">
        <button class="btn btn-default" onclick="do_search()">
            <i class="glyphicon glyphicon-search"></i>
        </button>
    </div>
</div>

    <div class="input-group">
    <input type="text" class="form-control" id="tags" placeholder="#tag1 #tag2 #tag3">
    <div class="input-group-btn">
        <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
        </button>
    </div>
    </div>
</div>
</div>

<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="container" id="post_container">




            </div>
        </div>
    </div>
</div>

</body>

</body>
<script type="text/javascript">
    function do_search() {
            console.log(1);
            $.ajax({
                url: "/search_ajax",
                data: {"pattern": $("#pattern").val(), "tags": $("#tags").val()},
                dataType: "json",
                success: function (result) {
                    $("#post_container").val(result.posts);
                },
                error: function (jqXHR, exception) {
                    alert("kekkke");
                    if (jqXHR.status === 0) {
                        alert('Not connect.\n Verify Network.');
                    } else if (jqXHR.status == 404) {
                        alert('Requested page not found. [404]');
                    } else if (jqXHR.status == 500) {
                        alert('Internal Server Error [500].');
                    } else if (exception === 'parsererror') {
                        alert('Requested JSON parse failed.');
                    } else if (exception === 'timeout') {
                        alert('Time out error.');
                    } else if (exception === 'abort') {
                        alert('Ajax request aborted.');
                    } else {
                        alert('Uncaught Error.\n' + jqXHR.responseText);
                    }
                }
            });
        }

</script>
</html>