
                <div class="box image">
                    <div class="box-header">
                        <h3><a href=""><img src="${post.author.photo}" alt="" />${post.author.login}</a>
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
                            <p>${post.text}</p>
                        </div>

                    </div>


                    <div class="box-buttons">
                        <div class="row">
                            <button><span class="glyphicon glyphicon-heart"> </span> 99</button>
                            <button>145 <span class="glyphicon glyphicon-comment"></span></button>
                        </div>
                    </div>


                </div>

