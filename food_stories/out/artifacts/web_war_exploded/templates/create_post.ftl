<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>

    <link href="css/facebook.css" type="text/css" rel="stylesheet">
    <link href="css/post.css" type="text/css" rel="stylesheet">

    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
</head>
<body>
<section>
    <div class="container">


        <div class="box image">
            <div class="box-header">
                <h3><a href=""><img src="/load/${post.author.photo}" alt="" />${post.author.login}</a>
                    <span>March 21,18:45pm <i class="fa fa-globe"></i></span>
                </h3>
                <span><i class="glyphicon glyphicon-edit" id="edit-button"></i></span>
                <div class="window"><span></span></div>
            </div>
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
                <form method="POST" enctype="multipart/form-data">
                    <#--<div class="form-group">-->
                        <#--<ul class="list-inline" id = "photo_links">-->
                            <#--<li class="list-group-item list-group-item-info justify-content-between">-->
                                <#--<div class="checkbox">-->
                                    <#--<label><input type="checkbox"> photo1</label>-->
                                <#--</div>-->
                            <#--</li>-->
                            <#--<li class="list-group-item list-group-item-info justify-content-between">-->
                                <#--<div class="checkbox">-->
                                    <#--<label><input type="checkbox"> photo1</label>-->
                                <#--</div>-->
                            <#--</li>-->
                            <#--<li class="list-group-item list-group-item-info justify-content-between">-->
                                <#--<div class="checkbox">-->
                                    <#--<label><input type="checkbox"> photo1</label>-->
                                <#--</div>-->
                            <#--</li>-->
                            <#--<li class="list-group-item list-group-item-info justify-content-between">-->
                                <#--<div class="checkbox">-->
                                    <#--<label><input type="checkbox"> photo1</label>-->
                                <#--</div>-->
                            <#--</li>-->


                        <#--</ul>-->
                    <#--</div>-->
                    <input id="image" type="file" class="form-control" name="photo" multiple/>

                    <#--</form>-->
                <#--<form method="POST">-->
                    <#--<div class="form-group">-->
                        <input type="text" id="kek1" class="form-control" rows="3" name="text" placeholder="TE">
                    <#--</div>-->
                    <#--<div class="form-group">-->
                        <input type="text" id="k2k" class="form-control" rows="1" name="tags" placeholder="#tag1 #tag2">
                    <#--</div>-->

                    <input type="submit" class="btn btn-primary btn-submit" >

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
                    <p>${post.text}</p>
                </div>
                <div class = "container" style="width:100%;height:50px;float:left;overflow-x:scroll;white-space:nowrap; text-align: center">
                <#list post.tags as tag>
                    <div class = "tag">
                        <a href="#">${tag.tag}</a>
                    </div>
                </#list>
                </div>
            </div>


            <div class="box-buttons">
                <div class="row">
                    <button onclick="inc_likes(this.id)" id="likes_button"><span class="glyphicon glyphicon-heart"> </span> ${post.likes}</button>
                    <button>${post.comments?size} <span class="glyphicon glyphicon-comment"></span></button>
                </div>
            </div>
            <div class="box-new-comment">
                <img src="/load/${user.photo}" alt="" />
                <div class="content">
                    <div class="row">
                        <textarea placeholder="комментарий" id="snd_comm" onkeydown="send_comment()"></textarea>
                    </div>
                    <div class="row">
                        <span class="fa fa-smile-o"></span>
                    </div>
                </div>
            </div>


            <div class="box-comments" id="comment_container">
            <#list post.comments as comment>

                <div class="comment"><img src="/load/${comment.author.photo}" alt="" />
                    <div class="content">
                        <h3><a href="">${comment.author.login}</a><span><time></time></a></span></h3>
                        <p>${comment.text}</p>
                    </div>
                </div>
            </#list>
            </div>

        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    function inc_likes(button_idk){
        console.log(1);
        $.ajax({
            url: "/incrementlikes",
            data: {"likes": "${post.likes}", "id": "${post.id}"},
            dataType: "json",
            success: function (result) {

                var el = document.getElementById(button_idk);
                el.firstChild.data = "kek";
            },
            error: function (jqXHR, exception) {
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
<script type="text/javascript">
    function send_comment() {
        if (event.keyCode === 13) {
            console.log(1);
            $.ajax({
                url: "/add/comment",
                data: {"text": $("#snd_comm").val(), "post_id": "${post.id}"},
                dataType: "json",
                success: function (result) {
                    $("#snd_comm").val("" +
                            "");
                    var str = "<div class=\"comment\"><img src=\"/load/" + result.photo + "\" alt=\"\" />\n" +
                            "                    <div class=\"content\">\n" +
                            "                        <h3><a href=\"\">" + result.login + "</a><span><time></time></a></span></h3>\n" +
                            "                        <p>" + result.text + "</p>\n" +
                            "                    </div>\n" +
                            "                </div>";

                    $("#comment_container").prepend(str);
                },
                error: function (jqXHR, exception) {
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
    }
</script>

<script>
    window.onload = function () {
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

    }
</script>
</html>