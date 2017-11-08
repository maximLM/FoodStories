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
    <link href="css/post.css" type="text/css" rel="stylesheet">

    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
</head>
<body>
<section>
    <div class="container">


        <div class="box image">
            <div class="box-header">
                <h3><a href=""><img src="${post.author.photo}" alt="" />${post.author.login}</a>
                    <span>TODO<i class="fa fa-globe"></i></span>
                </h3>
                <span><i class="fa fa-angle-down"></i></span>
                <div class="window"><span></span></div>
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
                    <span><span class="fa fa-search-plus"></span></span>
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
                    <button><span class="glyphicon glyphicon-heart"> </span> ${post.likes}</button>
                    <button>${post.comments?size} <span class="glyphicon glyphicon-comment"></span></button>
                </div>
            </div>
            <div class="box-new-comment">
                <img src="${user.photo}" alt="" />
                <div class="content">
                    <div class="row">
                        <textarea placeholder="комментарий" onkeydown="send_comment()" id="snd_comm"></textarea>
                    </div>
                    <div class="row">
                        <span class="fa fa-smile-o"></span>
                    </div>
                </div>
            </div>


            <div class="box-comments" id="comment_container">
                <#list post.comments as comment>

                <div class="comment"><img src="${comment.author.photo}" alt="" />
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
                 var str = "<div class=\"comment\"><img src=\"" + result.photo + "\" alt=\"\" />\n" +
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
</html>