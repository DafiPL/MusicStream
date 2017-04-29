<%@page import="Daos.GenreDao"%>
<%@page import="Daos.ReviewDao"%>
<%@page import="Daos.ArtistDao"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% session = request.getSession(false);
    
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
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.OrderDao"%>

<html lang="en">
    <head>
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
            if (userType.equals("admin")) {
        %>

        <%
            ArtistDao artistDao = new ArtistDao("musicdb");
            GenreDao genreDao = new GenreDao("musicdb");
            ReviewDao reviewDao = new ReviewDao("musicdb");
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
                                            Social</button>
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span><span class="sr-only">Social</span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Twitter</a></li>
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

                    <div class="span3 well" style = "width: 90%; margin-left: 5%; ">
                        <legend>Delete</legend>
                        <form action="FrontController" method="post">

                            <select name="choice" >
                                <option value="">Choose an option to delete</option>
                                <option value="song">Song</option>
                                <option value="album">Album</option>
                                <option value="artist">Artist</option> 
                                <option value="genre">Genre</option>
                                <option value="member">Member</option>



                            </select>
                            <input class="span3" name="deleteItem" placeholder="Item ID" type="text">
                            <button class="btn btn-warning" type="submit" value="delete">Delete</button>
                            <input type="hidden" name ="action" value="delete" />
                        </form>
                    </div>



                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Search item by Name</legend>

                            <select name="searchchoice" >
                                <option value="">Choose an option to search</option>
                                <option value="song">Song</option>
                                <option value="album">Album</option>
                                <option value="artist">Artist</option> 
                                <option value="genre">Genre</option>
                                <option value="member">Member</option>
                            </select>

                            <input class="span3" name="itemName" placeholder="Item Name" type="text" /> 
                            <input class="btn btn-warning" type="submit" value="Search" />
                            <input type="hidden" name ="action" value="search" />
                        </form>
                    </div>


                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">

                        <form action="AddItem.jsp" method="post">
                            <legend>Add item by Choice</legend>
                            <select name="addchoice" >
                                <option value="">Choose an option to add</option>
                                <option value="song">Song</option>
                                <option value="album">Album</option>
                                <option value="artist">Artist</option> 
                                <option value="genre">Genre</option>
                                
                            </select>

                            <input class="btn btn-warning" type="submit" value="Add" />
                            
                        </form>
                    </div>

                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">

                        <form action="FrontController" method="post">
                            <legend>Edit songs by choice</legend>

                            <select name="editchoice" >
                                <option value="">Choose an option to edit</option>
                                <option value="1">SongID</option>
                                <option value="2">albumID</option>
                                <option value="3">song Name</option> 
                                <option value="4">Song Release</option>

                            </select>

                            <input  class="span3" name="itemId" placeholder="Song ID" type="text" /> </td> 
                            <input class="span3" name="value" placeholder="New Value" type="text" /> </td> 
                            <input class="btn btn-warning" type="submit" value="Edit Song" />
                            <input type="hidden" name ="action" value="edit" />
                            <input type="hidden" name ="control" value="1" />
                        </form>
                    </div>

                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Edit album by choice</legend>

                            <select name="editchoice" >
                                <option value="">Choose an option to edit</option>
                                <option value="1">albumId</option>
                                <option value="2">genreID</option>
                                <option value="3">artistID</option>
                                <option value="4">album Name</option> 
                                <option value="5">Album Price</option>
                                <option value="6">Amount In Stock</option>
                                <option value="7">Album Format</option>
                                <option value="8">Release Date</option>
                            </select>

                            <input class="span3" name="itemId" placeholder="Album ID" type="text" /> </td> 
                            <input class="span3" name="value" placeholder="New Value" type="text" /> </td> 
                            <input class="btn btn-warning"  type="submit" value="Edit Album" />

                            <input type="hidden" name ="action" value="edit" />
                            <input type="hidden" name ="control" value="2" />
                        </form>
                    </div>

                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Edit artist by choice</legend>
                            <select name="editchoice" >
                                <option value="">Choose an option to edit</option>
                                <option value="1">ArtistID</option>
                                <option value="2">Artist Name</option>
                                <option value="3">Artist Age</option> 
                                <option value="4">Artist Bio</option>
                                <option value="5">Artist Picture</option>
                            </select>
                            <input class="span3" name="itemId" placeholder="Artist ID" type="text" /> </td> 
                            <input class="span3" name="value" placeholder="New Value" type="text" /> </td> 

                            <input class="btn btn-warning" type="submit" value="Edit Artist" />
                            <input type="hidden" name ="action" value="edit" />
                            <input type="hidden" name ="control" value="3" />
                        </form>
                    </div>


                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Edit genre by choice</legend>

                            <select name="editchoice" >
                                <option value="">Choose an option to edit</option>
                                <option value="1">GenreID</option>
                                <option value="2">Genre Name</option>
                            </select>

                            <input class="span3" name="itemId" placeholder="Genre ID" type="text" /> </td> 
                            <input class="span3" name="value" placeholder="New Value" type="text" /> </td> 

                            <input class="btn btn-warning"  type="submit" value="Edit Genre" />
                            <input type="hidden" name ="action" value="edit" />
                            <input type="hidden" name ="control" value="4" />
                        </form>
                    </div>

                    











                </div>

            </div>
            <div class ="col-xs-12 col-sm-4 col-md-2">
                <div class ="customDIV"> RIGHT SIde Bar  </div></div>

        </div>












        <%
        } else if (userType.equals("user")) {
        %>
        <h1>You Dont Have Acess To View This Page</h1>
        <a href="Index.jsp">Home</a>
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