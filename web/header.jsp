
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="nav-btn btn-dark btn-lg accordion-toggle pull-left" title="Follow Us" role="tab" id="social-collapse" data-toggle="collapse" data-parent="#accordion" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
            <a id="menu-toggle" href="#" class="nav-btn btn-dark btn-lg toggle">
                <i class="fa fa-bars" style="color:#fff;"></i>
            </a>
            <a id="to-top" class="btn btn-lg btn-inverse" href="#top">
                <span class="sr-only">Toggle to Top Navigation</span>
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse js-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <a class="navbar-brand" href="#">
                    <img height="20" width="20" src="./images/icon/MusicIcon.jpg" class="img-responsive pull-left" alt="Responsive image">
                     Music Stream</a>
                <li class="dropdown mega-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Albums <span class="caret"></span></a>				
                    <ul class="dropdown-menu mega-dropdown-menu">
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Album Shop</li>                            
                                <div id="menCollection" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <h4><%=albums.get(3).getAlbumName()%></h4> 
                                            <a href="#"><img src="<%=albums.get(3).getAlbumImage()%>" style ="width: 254px; height: 150px" class="img-responsive" alt="product 1"></a>
                                            <form action="FrontController" method="post">
                                                <input type="hidden"  name="albumName" id="albumName" value ="<%=albums.get(3).getAlbumID()%>"/>
                                                <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Buy" />
                                                <input type="hidden" name ="action" value="albumDetail" />      

                                            </form>

                                            <button class="btn btn-primary" type="button"><%=albums.get(3).getAlbumPrice()%></button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Cart</button>       
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <h4><%=albums.get(5).getAlbumName()%></h4> 
                                            <a href="#"><img src="<%=albums.get(5).getAlbumImage()%>"  style ="width: 254px; height: 150px" class="img-responsive" alt="product 2"></a>
                                            <form action="FrontController" method="post">
                                                <input type="hidden"  name="albumName" id="albumName" value ="<%=albums.get(3).getAlbumID()%>"/>
                                                <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Buy" />
                                                <input type="hidden" name ="action" value="albumDetail" />      

                                            </form>                                      
                                            <button class="btn btn-primary" type="button"><%=albums.get(5).getAlbumPrice()%></button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Cart</button>        
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <h4><%=albums.get(6).getAlbumName()%></h4> 
                                            <a href="#"><img src="<%=albums.get(6).getAlbumImage()%>"  style ="width: 254px; height: 150px" class="img-responsive" alt="product 3"></a>
                                            <form action="FrontController" method="post">
                                                <input type="hidden"  name="albumName" id="albumName" value ="<%=albums.get(3).getAlbumID()%>"/>
                                                <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Buy" />
                                                <input type="hidden" name ="action" value="albumDetail" />      

                                            </form>                                      
                                            <button class="btn btn-primary" type="button"><%=albums.get(5).getAlbumPrice()%></button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Cart</button>      
                                        </div><!-- End Item -->                                
                                    </div><!-- End Carousel Inner -->
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#menCollection" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#menCollection" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div><!-- /.carousel -->
                                <li class="divider"></li>
                                <li><a href="browseItems.jsp">Browse Albums <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                            </ul>
                        </li>
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Albums</li>
                                <li><a href="browseItems.jsp">Browse Albums</a></li>
                                <li><a href="#">Find Album</a></li>

                                <li class="divider"></li>
                                <li class="dropdown-header">Sponsored Links</li>
                                <li><a href="http://www.music-news.com/">Music News, all you need to know</a></li>
                                <li><a href="http://www.mtv.com/artists/gossip">Artist Gossip</a></li>

                            </ul>
                        </li>
                        <li class="col-sm-6">
                            <ul>
                                <li class="dropdown-header">Labels</li>
                                <li><a href="https://en.wikipedia.org/wiki/Top_Dawg_Entertainment">Top Dawg Entertainment</a></li>
                                <li><a href="https://en.wikipedia.org/wiki/Roc-A-Fella_Records">Roc-A-Fella Records</a></li>
                                <li><a href="https://en.wikipedia.org/wiki/Boy_Better_Know">Boy Better Know</a></li>                            
                                <li><a href="https://en.wikipedia.org/wiki/Geffen_Records">Geffen Records</a></li>							
                            </ul>
                        </li>

                    </ul>				
                </li>
                <li class="dropdown mega-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Artists, and More <span class="caret"></span></a>				
                    <ul class="dropdown-menu mega-dropdown-menu">
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Artists</li>
                                <li><a href="browseItems.jsp">Browse Artists</a></li>
                                <li><a href="#">Find Artist</a></li>
                                <li class="divider"></li>
                                <li class="dropdown-header">Artist Official Site's</li>
                                <li><a href="http://www.kendricklamar.com/">Kendrick Lamar</a></li>
                                <li><a href="https://helloskepta.com/">Skepta</a></li>
                                <li><a href="http://www.gunsnroses.com/">Guns N' Roses</a></li>
                            </ul>
                        </li>
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Upcoming Music Events</li>
                                <li><a href="https://events.wm.edu/event/view/music/79722">March 17, William & Mary Choir - Spring Tour<br><cite>Virginia Beach, VA </cite>  </a></li>
                                <br>
                                <li><a href="https://events.wm.edu/event/view/music/84002">March 18, Robert Quittmeyer's Senior Recital <br><cite>Ewell Hall, Recital Hall (Rm 107) </cite>  </a></li>
                                <br>
                                <li><a href="https://events.wm.edu/event/view/music/84918">Lemon Project Annual Symposium Open Mic Performance Night <br><cite>Sadler Center, Lodge 1 </cite>  </a></li>

                            </ul>
                        </li>
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Festivals</li>
                                <li><a href="https://www.coachella.com/">Coachella</a><cite>Coachella, CA </cite></li>
                                <br>
                                <li><a href="http://www.creamfields.com/">CreamFields</a><cite>London, UK </cite></li>
                                <br>
                                <li><a href="https://www.tomorrowland.com/global/">Tomorrow Land</a><cite>Brussels, BEL </cite></li>
                                <br>

                            </ul>
                        </li>
                        <li class="col-sm-3">
                            <ul>
                                <li class="dropdown-header">Our Top Artists</li>                            
                                <div id="womenCollection" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <a href="#"><img src="<%=artists.get(0).getArtistPicture()%>" style ="width: 254px; height: 150px" class="img-responsive" alt="product 1"></a>


                                            <button class="btn btn-primary" type="button"><%=artists.get(0).getArtistName()%></button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Cart</button>       
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <a href="#"><img src="<%=artists.get(1).getArtistPicture()%>" style ="width: 254px; height: 150px" class="img-responsive" alt="product 2"></a>

                                            <button class="btn btn-primary" type="button"><%=artists.get(1).getArtistName()%></button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Cart</button>        
                                        </div><!-- End Item -->
                                        <div class="item">
                                            <a href="#"><img src="<%=artists.get(2).getArtistPicture()%>" style ="width: 254px; height: 150px" class="img-responsive" alt="product 3"></a>

                                            <button class="btn btn-primary" type="button"><%=artists.get(2).getArtistName()%></button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Cart</button>      
                                        </div><!-- End Item -->                                
                                    </div><!-- End Carousel Inner -->
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#womenCollection" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#womenCollection" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div><!-- /.carousel -->
                                <li class="divider"></li>
                                <li><a href="browseArtist.jsp">Browse Artists <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                            </ul>
                        </li>
                    </ul>				
                </li>
                <a class="navbar-brand" href="https://www.google.com/maps/place/Kingscourt,+Co.+Cavan,+Ireland/@53.906877,-6.8074116,17z/data=!3m1!4b1!4m5!3m4!1s0x4860acd6fb236a9d:0xa00c7a9973176a0!8m2!3d53.9068739!4d-6.8052229">
                    <img height="20" width="20" src="./images/icon/Map.png" class="img-responsive pull-left" alt="Responsive image">
                     Our Location</a>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="login.html">Login</a></li>


                        <li class="divider"></li>
                        <li><a href="Register.jsp">Register</a></li>
                    </ul>
                </li>
                <li>
                    <a data-toggle="modal" data-href="#loginModal2" data-target="#loginModal2" style="cursor:pointer;"> Cart!</a>
                </li>
            </ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <a id="menu-close" href="#" class="btn btn-danger pull-right hidden-md hidden-lg toggle"><i class="fa fa-times"></i></a>
        <li class="sidebar-brand">
            <a href="#top">Soldier-up <strong>Designs</strong></a>
        </li>
        <li>
            <a href="Index.jsp" title="Go to Top">Home</a>
        </li>
        <li>
            <a href="browseItems.jsp" title="Go to About Us section">Browse Items</a>
        </li>




        <li>
            <a data-toggle="modal" data-href="#loginModal" data-target="#loginModal" style="cursor:pointer;"> Log In !</a>
        </li>

        <li>
            <a data-toggle="modal" data-href="#loginModal1" data-target="#loginModal1" style="cursor:pointer;"> Forgot Password</a>
        </li>

    </ul>
</nav>
LOGIN
<div class="container">
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
        <div class="modal-dialog modal-default">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Login to Your MusicStream Account - Profile</h3>
                </div>
                <div class="modal-body">
                    <article class="container-form center-block">
                        <!-- Form Content HERE! -->
                        <form action="FrontController" method="post">
                            <div class="form-group">
                                <label for="username" class="cols-sm-2 control-label">Username</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username" required  pattern="[a-z]{1,15}" title="Username should only contain lowercase letters. e.g. john"/>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="password" class="cols-sm-2 control-label">Your Password</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>

                                        <input name="password" class="form-control"   id="password" placeholder="Password" size=15 type="text" required />
                                    </div>
                                </div>
                            </div>


                            <div class="form-group ">
                                <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Login" />
                                <input type="hidden" name ="action" value="login" />
                            </div>

                        </form>
                    </article>
                </div>
                <div class="modal-footer">
                    Login Problems?
                    <button type="submit" class="btn btn-dark" data-dismiss="modal" data-href="#collapseTwo" data-toggle="collapse" data-target="#collapseTwo" style="cursor:pointer;">Contact Me</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="modal fade" id="loginModal1" tabindex="-1" role="dialog" aria-labelledby="loginModal1" aria-hidden="true">
        <div class="modal-dialog modal-default">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Forgot Password? We Will Send You A New One</h3>
                </div>
                <div class="modal-body">
                    <article class="container-form center-block">
                        <!-- Form Content HERE! -->
                        <form action="FrontController" method="post">
                            <div class="form-group">
                                <label for="username" class="cols-sm-2 control-label">Username</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username" required  pattern="[a-z]{1,15}" title="Username should only contain lowercase letters. e.g. john"/>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="email" class="cols-sm-2 control-label">Your Email</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>

                                        <input name="email" class="form-control"   id="email" placeholder="Email@gmail.com" size=15 type="text" required />
                                    </div>
                                </div>
                            </div>


                            <div class="form-group ">
                                <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Change Password" />
                                <input type="hidden" name ="action" value="forgotPassword" />
                            </div>

                        </form>
                    </article>
                </div>
                <div class="modal-footer">
                    Login Problems?
                    <button type="submit" class="btn btn-dark" data-dismiss="modal" data-href="#collapseTwo" data-toggle="collapse" data-target="#collapseTwo" style="cursor:pointer;">Contact Me</button>
                </div>
            </div>
        </div>
    </div>
</div>   




<div class="container">
    <div class="modal fade" id="loginModal2" tabindex="-1" role="dialog" aria-labelledby="loginModal2" aria-hidden="true">
        <div class="modal-dialog modal-default">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Your Shopping Cart</h3>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-10 col-md-offset-1">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">Total</th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="col-sm-8 col-md-6">
                                            <div class="media">
                                                <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
                                                <div class="media-body">
                                                    <h4 class="media-heading"><a href="#">Product name</a></h4>
                                                    <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                                                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                                                </div>
                                            </div></td>
                                        <td class="col-sm-1 col-md-1" style="text-align: center">
                                            <input type="email" class="form-control" id="exampleInputEmail1" value="3">
                                        </td>
                                        <td class="col-sm-1 col-md-1 text-center"><strong>$4.87</strong></td>
                                        <td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
                                        <td class="col-sm-1 col-md-1">
                                            <button type="button" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span> Remove
                                            </button></td>
                                    </tr>
                                  
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td><h5>Subtotal</h5></td>
                                        <td class="text-right"><h5><strong>$24.59</strong></h5></td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td><h5>Estimated shipping</h5></td>
                                        <td class="text-right"><h5><strong>$6.94</strong></h5></td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td><h3>Total</h3></td>
                                        <td class="text-right"><h3><strong>$31.53</strong></h3></td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>
                                            <button type="button" class="btn btn-default">
                                                <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                                            </button></td>
                                        <td>
                                            <button type="button" class="btn btn-success">
                                                Checkout <span class="glyphicon glyphicon-play"></span>
                                            </button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    Keep Browsing
                    <button type="submit" class="btn btn-dark" data-dismiss="modal" data-href="#collapseTwo" data-toggle="collapse" data-target="#collapseTwo" style="cursor:pointer;">Contact Me</button>
                </div>
            </div>
        </div>
    </div>
</div>                                     




<aside id="accordion" class="social text-vertical-center">
    <div class="accordion-social">
        <ul class="panel-collapse collapse in nav nav-stacked" role="tabpanel" aria-labelledby="social-collapse" id="collapseOne">
            <li><a href="https://www.facebook.com/musicstream.cc" target="_blank"><i class="fa fa-lg fa-facebook"></i></a></li>
            <li><a href="https://twitter.com/musicstream.cc" target="_blank"><i class="fa fa-lg fa-twitter"></i></a></li>
            <li><a href="https://www.plus.google.com/+musicstream.cc" target="_blank"><i class="fa fa-lg fa-google-plus"></i></a></li>
            <li><a href="https://github.com/music" target="_blank"><i class="fa fa-lg fa-github"></i></a></li>
            <li><a href="https://linkedin.com/in/music" target="_blank"><i class="fa fa-lg fa-linkedin"></i></a></li>
            <li><a href="skype:live:dafi.dafi30?call"><i class="fa fa-lg fa-skype" target="_blank"></i></a></li>
            <li><a href="http://stackexchange.com/users/4992378/music" target="_blank"><i class="fa fa-lg fa-stack-exchange"></i></a></li>
        </ul>
    </div>
</aside>