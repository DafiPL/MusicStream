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
        <h1 style ="color: white">Your Profile Page</h1>

        <nav class="navbar navbar-default navbar-inverse" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Register.jsp">MusicStream</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="login.html">Log In!</a></li>
                        <li><a href="Register.jsp">Register</a></li>
                        <li><a href="forgotResetPassword.jsp">Forgot Password?</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Browse <span class="caret"></span></a>
                            <ul  class="dropdown-menu" role="menu">
                                <li><a href="browseItems.jsp">Shop</a></li>
                                <li><a href="albumDetailPage.jsp">Product  Detail</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>

                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>

                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>



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
                            <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> BUY</button>


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
                                    <div class="list-group col-xs-6 cols-sm-12 col-md-12">
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



                                <div class="list-group col-xs-6 cols-sm-12 col-md-12">
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




















        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
<%    }
%>