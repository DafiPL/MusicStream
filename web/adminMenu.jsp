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
<%@page import="java.util.ArrayList"%>

<html lang="en">
    <head>
        <link href="Css/common.css" rel="stylesheet" type="text/css"/>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Edit Profile</title>

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
    <body>   <%
        AlbumDao albumDao = new AlbumDao("musicdb");
        ArrayList<Album> albums = albumDao.getAllAlbums();
        ArtistDao artDao = new ArtistDao("musicdb");
        ArrayList<Artist> artists = artDao.getAllArtists();


        %>
        <%@ include file="headerLoggedIn.jsp" %>

        <div class="row">
            <div class ="col-xs-12 col-sm-4 col-md-2">
                <div class ="customDIV"> LEft SIde Bar <br>





                </div>

            </div>

            <div class ="col-xs-12 col-sm-4 col-md-8">
                <div class ="customDIV">
                
   
      
      <!-- edit form column -->
    
       
       
        
        

                    <h1>Admin Page</h1>
                    <hr>
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-3">
                            
                        </div>

                        <!-- edit form column -->
                        <div class="col-md-9 personal-info">
                            
                            <h3>Edit info</h3>

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

                    <hr>


                    <%
                        }

                    %>



                </div>
            </div>
            <div class ="col-xs-12 col-sm-4 col-md-2">
                <div class ="customDIV"> LEft SIde Bar <br>





                </div>

            </div>
        </div>

        <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>



        <script>
            $(document).ready(function () {
                $("[rel='tooltip']").tooltip();
            });
            <%
            %>
        </script>
    </body>
</html>
