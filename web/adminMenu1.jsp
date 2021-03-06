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
                                <li><a href="#">Another action</a></li>
                                <li><a href="EditProfile.jsp">Edit Profile</a></li>
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
            if (userType.equals("admin")) {
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