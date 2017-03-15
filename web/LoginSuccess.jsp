<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% session = request.getSession(false);
    Object resultValue = session.getAttribute("userLogin");
    Member member = (Member) resultValue;
    if (session == null || session.getAttribute("userLogin") == null) {
%>
<h1>Sorry you can't access this page as you're not logged in!</h1>
<br> 
Please login/register here!: <a href="login.html">Login</a>
<%
} else {
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Css/common.css" rel="stylesheet" type="text/css"/>
<%@page import="Dtos.Member"%>
<%@page import="Dtos.Album"%>
<%@page import="Daos.AlbumDao"%>
<%@page import="Dtos.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.OrderDao"%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Your Profile</title>

        <!-- Bootstrap -->
        <link href="cssBoot/bootstrap.min.css" rel="stylesheet">
        <link href="css/common.css" rel="stylesheet">


        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <!-- Data Tables  -->
   
        <style>

            body, html{

                background-image: url("images/headphonesBackground.jpg");
  background-size: 100%;
                
                font-family: 'Oxygen', sans-serif;
                background-size: cover;
            }
            
        </style>
      
                  
    </head>
    <body>
        <h1 style ="color: white">Your Profile Page</h1>
       
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
                						<img height="20" width="20" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAB+0lEQVR4AcyYg5LkUBhG+1X2PdZGaW3btm3btm3bHttWrPomd1r/2Jn/VJ02TpxcH4CQ/dsuazWgzbIdrm9dZVd4pBz4zx2igTaFHrhvjneVXNHCSqIlFEjiwMyyyOBilRgGSqLNF1jnwNQdIvAt48C3IlBmHCiLQHC2zoHDu6zG1iXn6+y62ScxY9AODO6w0pvAqf23oSE4joOfH6OxfMoRnoGUm+de8wykbFt6wZtA07QwtNOqKh3ZbS3Wzz2F+1c/QJY0UCJ/J3kXWJfv7VhxCRRV1jGw7XI+gcO7rEFFRvdYxydwcPsVsC0bQdKScngt4iUTD4Fy/8p7PoHzRu1DclwmgmiqgUXjD3oTKHbAt869qdJ7l98jNTEblPTkXMwetpvnftA0LLHb4X8kiY9Kx6Q+W7wJtG0HR7fdrtYz+x7iya0vkEtUULIzCjC21wY+W/GYXusRH5kGytWTLxgEEhePPwhKYb7EK3BQuxWwTBuUkd3X8goUn6fMHLyTT+DCsQdAEXNzSMeVPAJHdF2DmH8poCREp3uwm7HsGq9J9q69iuunX6EgrwQVObjpBt8z6rdPfvE8kiiyhsvHnomrQx6BxYUyYiNS8f75H1w4/ISepDZLoDhNJ9cdNUquhRsv+6EP9oNH7Iff2A9g8h8CLt1gH0Qf9NMQAFnO60BJFQe0AAAAAElFTkSuQmCC" class="img-responsive pull-left" alt="Responsive image">
                					 Bootstrap Custom Navbar</a>
                			<li class="dropdown mega-dropdown">
                				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Men <span class="caret"></span></a>				
                				<ul class="dropdown-menu mega-dropdown-menu">
                					<li class="col-sm-3">
                						<ul>
                							<li class="dropdown-header">Men Collection</li>                            
                                            <div id="menCollection" class="carousel slide" data-ride="carousel">
                                              <div class="carousel-inner">
                                                <div class="item active">
                                                    <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                                    <h4><small>Summer dress floral prints</small></h4>                                        
                                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>       
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                                    <h4><small>Gold sandals with shiny touch</small></h4>                                        
                                                    <button class="btn btn-primary" type="button">9,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>        
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                                    <h4><small>Denin jacket stamped</small></h4>                                        
                                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>      
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
                                            <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                						</ul>
                					</li>
                					<li class="col-sm-3">
                						<ul>
                							<li class="dropdown-header">Features</li>
                							<li><a href="#">Auto Carousel</a></li>
                                            <li><a href="#">Carousel Control</a></li>
                                            <li><a href="#">Left & Right Navigation</a></li>
                							<li><a href="#">Four Columns Grid</a></li>
                							<li class="divider"></li>
                							<li class="dropdown-header">Fonts</li>
                                            <li><a href="#">Glyphicon</a></li>
                							<li><a href="#">Google Fonts</a></li>
                						</ul>
                					</li>
                					<li class="col-sm-3">
                						<ul>
                							<li class="dropdown-header">Plus</li>
                							<li><a href="#">Navbar Inverse</a></li>
                							<li><a href="#">Pull Right Elements</a></li>
                							<li><a href="#">Coloured Headers</a></li>                            
                							<li><a href="#">Primary Buttons & Default</a></li>							
                						</ul>
                					</li>
                					<li class="col-sm-3">
                						<ul>
                							<li class="dropdown-header">Much more</li>
                                            <li><a href="#">Easy to Customize</a></li>
                							<li><a href="#">Calls to action</a></li>
                							<li><a href="#">Custom Fonts</a></li>
                							<li><a href="#">Slide down on Hover</a></li>                         
                						</ul>
                					</li>
                				</ul>				
                			</li>
                            <li class="dropdown mega-dropdown">
                    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Women <span class="caret"></span></a>				
                				<ul class="dropdown-menu mega-dropdown-menu">
                					<li class="col-sm-3">
                    					<ul>
                							<li class="dropdown-header">Features</li>
                							<li><a href="#">Auto Carousel</a></li>
                                            <li><a href="#">Carousel Control</a></li>
                                            <li><a href="#">Left & Right Navigation</a></li>
                							<li><a href="#">Four Columns Grid</a></li>
                							<li class="divider"></li>
                							<li class="dropdown-header">Fonts</li>
                                            <li><a href="#">Glyphicon</a></li>
                							<li><a href="#">Google Fonts</a></li>
                						</ul>
                					</li>
                					<li class="col-sm-3">
                						<ul>
                							<li class="dropdown-header">Plus</li>
                							<li><a href="#">Navbar Inverse</a></li>
                							<li><a href="#">Pull Right Elements</a></li>
                							<li><a href="#">Coloured Headers</a></li>                            
                							<li><a href="#">Primary Buttons & Default</a></li>							
                						</ul>
                					</li>
                					<li class="col-sm-3">
                						<ul>
                							<li class="dropdown-header">Much more</li>
                                            <li><a href="#">Easy to Customize</a></li>
                							<li><a href="#">Calls to action</a></li>
                							<li><a href="#">Custom Fonts</a></li>
                							<li><a href="#">Slide down on Hover</a></li>                         
                						</ul>
                					</li>
                                    <li class="col-sm-3">
                    					<ul>
                							<li class="dropdown-header">Women Collection</li>                            
                                            <div id="womenCollection" class="carousel slide" data-ride="carousel">
                                              <div class="carousel-inner">
                                                <div class="item active">
                                                    <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                                    <h4><small>Summer dress floral prints</small></h4>                                        
                                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>       
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                                    <h4><small>Gold sandals with shiny touch</small></h4>                                        
                                                    <button class="btn btn-primary" type="button">9,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>        
                                                </div><!-- End Item -->
                                                <div class="item">
                                                    <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                                    <h4><small>Denin jacket stamped</small></h4>                                        
                                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>      
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
                                            <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
                						</ul>
                					</li>
                				</ul>				
                			</li>
                            <li><a href="#">Store locator</a></li>
                		</ul>
                        <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account <span class="caret"></span></a>
                          <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Separated link</a></li>
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
					<a href="/" title="Go to Top">Home</a>
				</li>
				<li>
					<a href="/about" title="Go to About Us section">About</a>
				</li>
				<li>
					<a href="/resume" title="Navigate to Jonathan Adcox IT Resume">Resume</a>
				</li>
				<li>
					<a href="/portfolio" title="Navigate to 'Our Services' section">Portfolio</a>
				</li>
				<!-- Future Development
				<li>
					<a href="#portfolio">Portfolio</a>
				</li> -->
				<li>
					<a href="/blog" title="Our Blog">Blog</a>
				</li>
				<li>
					<a data-toggle="modal" data-href="#loginModal" data-target="#loginModal" style="cursor:pointer;"> Hosting</a>
				</li>
			</ul>
		</nav>
	<div class="container">
			<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
				<div class="modal-dialog modal-default">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h3>Login to Hosting Portal - Control Panel</h3>
						</div>
						<div class="modal-body">
							<article class="container-form center-block">
								<!-- Form Content HERE! -->
								<form method="post" accept-charset="utf-8" autocomplete="off" role="form" class="form-horizontal" action="https://secure.yourwebhosting.com/secureLogin" enctype="application/x-www-form-urlencoded">
									<fieldset>
										<input type='hidden' name='__token_timestamp__' value='1426572610'>
										<input type='hidden' name='__token_val__' value='4d96cad055fac46518825357fcb49390'>
										<input type="hidden" name="destination" value="http://www.yourwebhosting.com/controlpanel/index.bml">
										<!-- Name input-->
										<div class="form-group">
											<label class="sr-only" for="credential_0">Username: </label>
											<div class="col-xs-12">
												<input id="credential_0" name="credential_0" type="text" placeholder="Your Username" class="form-control">
											</div>
										</div>
										<!-- Email input-->
										<div class="form-group">
											<label class="sr-only" for="credential_1">Password: </label>
											<div class="col-xs-12">
												<input id="email" type="password" name="credential_1" value="" placeholder="Your Password" class="form-control">
											</div>
										</div>
										<!-- Form actions -->
										<div class="form-group pull-right">
											<div class="col-md-12 text-right">
												<button type="submit" name="submit" value="Sign In" class="btn btn-lg">Submit</button>
											</div>
										</div>
									</fieldset>
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

           AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();


        %>

            
            
            
            
            
            
        
    <div class="row">
        <div class ="col-xs-12 col-sm-4 col-md-3">
            <div class ="customDIV"> LEft SIde Bar <br>
                
            <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        
                      <img src="<%=member.getDbImage()%>" alt="" class="img-rounded img-responsive">
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>
                            User : <%=member.getUsername()%></h4>
                        <small><cite title="<%=member.getTown()%>"><%=member.getTown()%> <i class="glyphicon glyphicon-map-marker">
                        </i></cite></small>
                        <p>
                           
                            
                            <small><cite title="<%=member.getEmail()%>"><%=member.getEmail()%> <i class="glyphicon glyphicon-envelope">
                        </i></cite></small>
                                
                            <br />
                            <small><cite title="<%=member.getFirstName()%>"><%=member.getFirstName()%> <i class="glyphicon glyphicon-pencil">
                        </i></cite></small>
                            
                            
                            
                            
                            
                           
                            <br />
                        
                        
                        
                          <small><cite title="<%=member.getPhone()%>"><%=member.getPhone()%> <i class="glyphicon glyphicon-phone">
                        </i></cite></small>
                        <!-- Split button -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary">
                                Options</button>
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span><span class="sr-only">Social</span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li> <input class= "a"type="submit" value="Logout Here"/>
            <input type="hidden" name="action" value="logout"/></li>
                                <li><a href="https://plus.google.com">Google +</a></li>
                                <li><a href="https://www.facebook.com">Facebook</a></li>
                                <li class="divider"></li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
            
            
            </div>
                
        </div>
        
        
        
        
        
         <div class ="col-xs-12 col-sm-4 col-md-7">
             <div class ="customDIV"> MIDDLE SECTIONS 
             
                

             
             
             
             
             
             
             
             
             
             
             
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
<%
    }
%>