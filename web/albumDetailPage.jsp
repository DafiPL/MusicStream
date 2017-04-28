<%@page import="Dtos.Review"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% session = request.getSession(false);

    Object albumDet = session.getAttribute("selectedAlbum");
    Album selectedAlbum = (Album) albumDet;

    ArrayList<Review> reviews = (ArrayList<Review>) session.getAttribute("allreviews");

    if (session == null || session.getAttribute("userLogin") == null) {
%>
<h1>Sorry you can't access this page as you're not logged in!</h1>
<br> 
Please login/register here!: <a href="login.jsp">Login</a>
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
<%@page import="Daos.ReviewDao"%>
<%@page import="Dtos.Review"%>

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
        <link href="cssBoot/bootstrap.css" rel="stylesheet" media="screen">



        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="Css/style.css">
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <!-- Loader  -->
        <link rel="stylesheet" href="cssBoot/demo.css">
        <link rel="stylesheet" href="cssBoot/fakeLoader.css">

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
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <%

            %>
            <%@ include file="headerLoggedIn.jsp" %>
        <div class="fakeloader"></div>

        <%            String userType = member.getUserType();
            if (userType.equals("user")) {
        %>

        <%
            ArtistDao artistDao = new ArtistDao("musicdb");
            GenreDao genreDao = new GenreDao("musicdb");
            ReviewDao reviewDao = new ReviewDao("musicdb");
        %>








        <div class="row">





            <div class ="col-xs-12 col-sm-4 col-md-8">
                <div class ="customDIV">

                    <br><br><br>

                    <div class="col-xs-6 col-sm-4 col-md-5 item-photo" style = "background: gray" >
                        <img style="max-width:100%;" src="<%=selectedAlbum.getAlbumImage()%>" />
                    </div>
                    <div class="col-xs-6 cols-sm-8 col-md-7" style="border:0px solid white;">
                        <!-- Details -->
                        <h3><%=selectedAlbum.getAlbumName()%></h3>    
                        <h5 style="color:#337ab7">Sold By <a href="Index.jsp">MusicStream</a> · <p style="color:#337ab7">(5054 purchases)</p></h5>

                        <!-- Price -->
                        <h6 class="title-price"><p>Price Offer:</p></h6>
                        <h3 style="margin-top:0px;">U$S <%=selectedAlbum.getAlbumPrice()%></h3>

                        <!-- Album Details -->
                        <div class="section" style ="width:100%">
                            <h6 class="title-attr" style="margin-top:15px;" ><p>Stock</p></h6>                    
                            <div>
                                <div class="attr" style="width:100%; height: 90%; background:orange;"><%=selectedAlbum.getAmountInStock()%></div>

                            </div>
                        </div>
                        <div class="section" style="padding-bottom:5px;">
                            <h6 class="title-attr"><p>Format :</p></h6>                    
                            <div>
                                <div class="attr2" style="width:100%; height: 90%;background:orange; " ><%=selectedAlbum.getAlbumFormat()%></div>

                            </div>
                        </div>   
                        <div class="section" style="padding-bottom:20px;">
                            <h6 class="title-attr"><p>Amount : </p></h6>                    

                            <form action="FrontController" method="post">
                                <input type ="number"  name="quantity" id="quantity" value ="1"/>

                        </div>                

                        <!-- Buy -->
                        <div class="section" style="padding-bottom:20px;">







                            <button class="btn btn-success">




                                <div class="form-group ">
                                    <input type="hidden"  name="username" id="username" value ="<%=member.getUsername()%>"/>
                                    <input type="hidden"  name="albumID" id="albumID" value ="<%=selectedAlbum.getAlbumID()%>"/>


                                    <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Buy Now!" />
                                    <input type="hidden" name ="action" value="orderItem" />
                                </div>

                                </form></button>


                            <form action="FrontController" method="post">
                                <br>
                                <input type ="number"  name="amount" id="amount" value ="1"/>
                                <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 
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
                            <li class="active">Album Details</li>


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

                                        <a class="list-group-item active">
                                            <h4 class="list-group-item-heading">Album Reviews</h4>
                                        </a>
                                        
                                        <% for (int i = 0; i < reviews.size(); i++) {%>
                                        <a  class="list-group-item ">
                                             <p class="list-group-item-text"><%= reviews.get(i).getUsername().toString()%>:</p>
                                            <p class="list-group-item-text"><%= reviews.get(i).getReview().toString()%></p>
                                        </a>
                                        <% }%>
                                        <form action="FrontController" method="post">
                                            <input type="text" name="review" placeholder="Enter Review Here!!"/> 


                                            <input type="hidden" name ="action" value="addreview" />
                                            <input type="hidden" name ="reviewalbumid" value="<%=selectedAlbum.getAlbumID()%>" />
                                            <input class="btn btn-warning"  type="submit" value="add" />

                                        </form>
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
            <div class ="col-xs-12 col-sm-4 col-md-4">
                <div class ="customDIV">
                    <br><br><br>
                    <div class="fb-comments" style ="background:white" data-href="http://localhost:8084/musicStream/albumDetailPage.jsp" data-width="400" data-numposts="20"></div>
                </div>
            </div>
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

        <script src="js/fakeLoader.min.js"></script>

        <script>
            $(document).ready(function () {
                $("[rel='tooltip']").tooltip();
            });
        </script>
        <script>
            $(document).ready(function () {
                $(".fakeloader").fakeLoader({
                    timeToHide: 1800,
                    bgColor: "#3498db",
                    spinner: "spinner5",

                });
            });
        </script>

    </body>
</html>
<%    }
%>