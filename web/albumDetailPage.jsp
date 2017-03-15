<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% session = request.getSession(false);

    Object albumDet = session.getAttribute("selectedAlbum");
    Album selectedAlbum = (Album) albumDet;

    Object resultValue = session.getAttribute("userLogin");
    Member member = (Member) resultValue;
    if (session == null || session.getAttribute("userLogin") == null) {
%>
<h1>Sorry you can't access this page as you're not logged in!</h1>
<br> 
Please login/register here!: <a href="index.jsp">Index</a>
<%
} else {
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Css/common.css" rel="stylesheet" type="text/css"/>
<%@page import="Dtos.Member"%>
<%@page import="Dtos.Album"%>
<%@page import="Daos.AlbumDao"%>
<%@page import="Dtos.Order"%>
<%@page import="Daos.OrderDao"%>
<%@page import="Daos.ArtistDao"%>
<%@page import="Dtos.Artist"%>
<%@page import="Daos.GenreDao"%>
<%@page import="Dtos.Genre"%>
<%@page import="java.util.ArrayList"%>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Your Profile</title>

        <!-- Bootstrap -->
        <link href="cssBoot/bootstrap.min.css" rel="stylesheet">



        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <!-- Data Tables  -->

        <script>
            $(document).ready(function () {
                //-- Click on detail
                $("ul.menu-items > li").on("click", function () {
                    $("ul.menu-items > li").removeClass("active");
                    $(this).addClass("active");
                })

                $(".attr,.attr2").on("click", function () {
                    var clase = $(this).attr("class");

                    $("." + clase).removeClass("active");
                    $(this).addClass("active");
                })

                //-- Click on QUANTITY
                $(".btn-minus").on("click", function () {
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)) {
                        if (parseInt(now) - 1 > 0) {
                            now--;
                        }
                        $(".section > div > input").val(now);
                    } else {
                        $(".section > div > input").val("1");
                    }
                })
                $(".btn-plus").on("click", function () {
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)) {
                        $(".section > div > input").val(parseInt(now) + 1);
                    } else {
                        $(".section > div > input").val("1");
                    }
                })
            })
        </script>
        <style>

            body, html{

                background-image: url("images/headphonesBackground.jpg");
                background-size: 100%;

                font-family: 'Oxygen', sans-serif;
                background-size: cover;
            }

            ul > li{margin-right:25px;font-weight:lighter;cursor:pointer}
            li.active{border-bottom:3px solid green;}

            .item-photo{display:flex;justify-content:center;align-items:center;border-right:1px solid #f6f6f6;}
            .menu-items{list-style-type:none;font-size:11px;display:inline-flex;margin-bottom:0px;margin-top:20px}
            .btn-success{width:100%;border-radius:0px;}
            .section{width:100%;padding:2px;padding-left:15px;background:white}
            .title-price{margin-top:30px;margin-bottom:0px;color:black}
            .title-attr{margin-top:0px;margin-bottom:0px;color:black;}
            .btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0px;}
            .btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0px;}
            div.section > div {width:100%;display:inline-flex;}
            div.section > div > input {margin:0px;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
            .attr,.attr2{cursor:pointer;margin-right:5px;height:20px;font-size:10px;padding:2px;border:1px solid gray;border-radius:2px;}
            .attr.active,.attr2.active{ border:1px solid orange;}

            @media (max-width: 426px) {
                .container {margin-top:0px !important;}
                .container > .row{padding:0px !important;}
                .container > .row > .col-xs-12.col-sm-5{
                    padding-right:0px ;    
                }
                .container > .row > .col-xs-12.col-sm-9 > div > p{
                    padding-left:0px !important;
                    padding-right:0px !important;
                }
                .container > .row > .col-xs-12.col-sm-9 > div > ul{
                    padding-left:10px !important;

                }            
                .section{width:104%;}
                .menu-items{padding-left:0px;}
            }

        </style>


    </head>
    <body>
         <%
        
           AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();
              ArtistDao artDao = new ArtistDao("musicdb");
            ArrayList<Artist> artists = artDao.getAllArtists();
        
         

            
          
    %>
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
                        <li><a href="#">My cart (0) items</a></li>
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
					<a href="brwoseItems.jsp" title="Go to About Us section">Browse Items</a>
				</li>
                                
                        
           
				
				<li>
					<a data-toggle="modal"  href="EditProfile.jsp" title="Go to Edit Profile">Edit Profile</a>
				</li>
                                <li>
                                      <div class="col-xs-12 col-sm-8 col-md-12">
            <div class="well well-sm">
                <div class="row">
                    
                    <div class="col-sm-12 col-md-12">
                         <img src="<%=member.getDbImage()%>" alt="" class="img-rounded img-responsive">
                         <br>
                        <h4>
                            User : <%=member.getUsername()%></h4>
                        <p> <%=member.getTown()%> <i class="glyphicon glyphicon-map-marker">
                        </i></p>
                        <p>
                           
                            
                            <p><cite title="<%=member.getEmail()%>"><%=member.getEmail()%> <i class="glyphicon glyphicon-envelope">
                        </i></cite></p>
                                
                         
                            <p><cite title="<%=member.getFirstName()%>"><%=member.getFirstName()%> <i class="glyphicon glyphicon-pencil">
                        </i></cite></p>
                            
                            
                            
                            
                            
                           
                           
                        
                        
                        
                          <p><cite title="<%=member.getPhone()%>"><%=member.getPhone()%> <i class="glyphicon glyphicon-phone">
                        </i></cite></p>
                        <!-- Split button -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary">
                                Options</button>
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span><span class="sr-only">Social</span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li> <form NAME="form1" action="FrontController" method="post" method="get"  >
 <input class= "a"type="submit" value="Logout Here"/>
            <input type="hidden" name="action" value="logout"/>
                                </form>
                                </li> 
                                <li><a href="orders.jsp">Orders +</a></li>
                                <li class="divider"></li>
                                <li><a href="https://google.com">Search</a></li>
                                
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                </li>
           
			</ul>
                
                    
                    
		</nav>
	
		<aside id="accordion" class="social text-vertical-center">
			<div class="accordion-social">
				<ul class="panel-collapse collapse in nav nav-stacked" role="tabpanel" aria-labelledby="social-collapse" id="collapseOne">
					<li><a href="https://www.facebook.com/soldierupdesigns" target="_blank"><i class="fa fa-lg fa-facebook"></i></a></li>
					<li><a href="https://twitter.com/soldierupdesign" target="_blank"><i class="fa fa-lg fa-twitter"></i></a></li>
					<li><a href="https://www.plus.google.com/+soldierupdesigns" target="_blank"><i class="fa fa-lg fa-google-plus"></i></a></li>
					<li><a href="https://github.com/blayderunner123" target="_blank"><i class="fa fa-lg fa-github"></i></a></li>
					<li><a href="https://linkedin.com/in/blayderunner123" target="_blank"><i class="fa fa-lg fa-linkedin"></i></a></li>
					<li><a href="skype:live:soldierupdesigns?call"><i class="fa fa-lg fa-skype" target="_blank"></i></a></li>
					<li><a href="http://stackexchange.com/users/4992378/blayderunner123" target="_blank"><i class="fa fa-lg fa-stack-exchange"></i></a></li>
				</ul>
			</div>
		</aside>



        <%
            String userType = member.getUserType();
            if (userType.equals("user")) {
        %>

        <%
            OrderDao orderDao = new OrderDao("musicdb");
            ArrayList<Order> orders = orderDao.selectAllOrdersByUser(member.getUsername());

            ArtistDao artistDao = new ArtistDao("musicdb");
            GenreDao genreDao = new GenreDao("musicdb");

        %>








        <div class="row">
            <div class ="col-xs-12 col-sm-4 col-md-3">
                <div class ="customDIV"> LEft SIde Bar <br>

                 



                </div>

            </div>





            <div class ="col-xs-12 col-sm-4 col-md-7">
                <div class ="customDIV">
                    <br>


                    <div class="col-xs-6 col-sm-4 col-md-5 item-photo" style = "background: gray" >
                        <img style="max-width:100%;" src="<%=selectedAlbum.getAlbumImage()%>" />
                    </div>
                    <div class="col-xs-6 cols-sm-8 col-md-7" style="border:0px solid white;">
                        <!-- Details -->
                        <h3><%=selectedAlbum.getAlbumName()%></h3>    
                        <h5 style="color:#337ab7">Sold By <a href="#">MusicStream</a> · <small style="color:#337ab7">(5054 purchases)</small></h5>

                        <!-- Price -->
                        <h6 class="title-price"><small>Price Offer:</small></h6>
                        <h3 style="margin-top:0px;">U$S <%=selectedAlbum.getAlbumPrice()%></h3>

                        <!-- Album Details -->
                        <div class="section" style ="width:100%">
                            <h6 class="title-attr" style="margin-top:15px;" ><small>Stock</small></h6>                    
                            <div>
                                <div class="attr" style="width:100%; height: 90%; background:green;"><%=selectedAlbum.getAmountInStock()%></div>

                            </div>
                        </div>
                        <div class="section" style="padding-bottom:5px;">
                            <h6 class="title-attr"><small>Format :</small></h6>                    
                            <div>
                                <div class="attr2" style="width:100%; height: 90%; " ><%=selectedAlbum.getAlbumFormat()%></div>

                            </div>
                        </div>   
                        <div class="section" style="padding-bottom:20px;">
                            <h6 class="title-attr"><small>Amount : </small></h6>                    


                            <input value="" type ="number" style="width:30%; margin-left: 35%; margin-right: 35%" />

                        </div>                

                        <!-- Buy -->
                        <div class="section" style="padding-bottom:20px;">
                            
                            
                       
                            
                            
                            
                            
                            <button class="btn btn-success"><span style="margin-right:20px" class="" aria-hidden="true"></span> BUY</button>

                             <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>   <form action="FrontController" method="post">
                       



                        <div class="form-group ">
                            <input type="hidden"  name="albumID" id="albumID" value ="<%=selectedAlbum.getAlbumID()%>"/>
                            <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Add To Cart" />
                            <input type="hidden" name ="action" value="addToCart" />
                        </div>

                    </form></button>

                            <h6><a href="browseItems.jsp"><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span>Return To Browse</a></h6>
                        </div>                                        
                    </div>   


                    <div class="section" style="padding-bottom:20px;">
                        <ul class="menu-items">
                            <li class="active">Product Details</li>


                        </ul>
                        <div style="width:100%;border-top:1px solid silver">
                            <p style="padding:15px;">
                                <small>
                                    <div class="list-group col-xs-12 cols-sm-12 col-md-12">
                                        <a  class="list-group-item active">
                                            <h4 class="list-group-item-heading"> Album Artist: </h4>
                                            <p class="list-group-item-text"><%=artistDao.getArtistById(selectedAlbum.getArtistID()).getArtistName()%></p>
                                        </a>

                                        <a  class="list-group-item">
                                            <h4 class="list-group-item-heading"></h4>
                                            <p class="list-group-item-text"> <img style="max-width:100%;" src=" <%=artistDao.getArtistById(selectedAlbum.getArtistID()).getArtistPicture()%>" /></p>
                                        </a>
                                          <a  class="list-group-item ">
                                            <h4 class="list-group-item-heading"> Artist Bio: </h4>
                                            <p class="list-group-item-text"><%=artistDao.getArtistById(selectedAlbum.getArtistID()).getArtistBio()%></p>
                                        </a>

                                    </div>





                                    <br>

                                </small>
                            </p>
                            <small>



                                <div class="list-group col-xs-12 cols-sm-12 col-md-12">
                                    <a class="list-group-item active">
                                        <h4 class="list-group-item-heading">Album Name: </h4>
                                        <p class="list-group-item-text"> <%=selectedAlbum.getAlbumName()%></p>
                                    </a>
                                    <a  class="list-group-item">
                                        <h4 class="list-group-item-heading">Released: </h4>
                                        <p class="list-group-item-text">Released in <%=selectedAlbum.getReleaseDate()%></p>
                                    </a>





                                    <a class="list-group-item">
                                        <h4 class="list-group-item-heading">Album Genre: </h4>
                                        <p class="list-group-item-text"> <%=genreDao.getGenreById(selectedAlbum.getGenreID()).getGenre()%></p>
                                    </a>
                                    <a class="list-group-item">
                                        <h4 class="list-group-item-heading"> Available Formats: </h4>
                                        <p class="list-group-item-text"> <%=selectedAlbum.getAlbumFormat()%></p>
                                    </a>
                                    <a class="list-group-item">
                                        <h4 class="list-group-item-heading">Artist Age</h4>
                                        <p class="list-group-item-text"><%=artistDao.getArtistById(selectedAlbum.getArtistID()).getArtistAge()%></p>
                                    </a>

                                </div>











                            </small>
                                    
                        </div>
                                    
                    </div>      































                </div>

            </div>
            <div class ="col-xs-12 col-sm-4 col-md-2">
                <div class ="customDIV"> RIGHT SIde Bar  </div></div>

        </div>












        <%
        } else if (userType.equals("admin")) {
        %>
        <a href="adminMenu.jsp">Admin Menu</a>
        <%
            }

        %>



















<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
<%    }
%>