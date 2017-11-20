<#list posts as post>
                <div class="box image">
                    <div class="box-header">
                        <h3><a href=""><img src="/load/${post.author.photo}" alt="" />${post.author.login}</a>
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