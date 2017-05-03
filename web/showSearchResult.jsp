<%-- 
    Document   : showSearchMemberResult
    Created on : 02-Dec-2016, 13:56:27
    Author     : Kevin
--%>

<%@page import="Dtos.Member"%>
<%@page import="Dtos.Genre"%>
<%@page import="Dtos.Artist"%>
<%@page import="Dtos.Song"%>
<%@page import="Dtos.Album"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Index Menu</title>

    <!-- Bootstrap -->
    <link href="cssBoot/bootstrap.min.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">


    <!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    <style>
        body, html{

            background-image: url("images/headphonesBackground.jpg");
            font-family: 'Oxygen', sans-serif;
            background-size: cover;
        }
    </style>
</head>
<body>
    <h1>Hello</h1>
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
                <a class="navbar-brand" href="Index.jsp">MusicStream</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="login.html">Log In!</a></li>
                    <li><a href="Register.jsp">Register?</a></li>
                    <li><a href="forgotResetPassword.jsp">Forgot Password?</a></li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Albums</a></li>
                            <li><a href="#">Artists</a></li>
                            <li><a href="#">Buy</a></li>
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
                <ul class="nav navbar-nav navbar-right">
                    <li><p class="navbar-text">Already have an account? >></p></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
                        <ul id="login-dp" class="dropdown-menu">
                            <li>
                                <div class="row">
                                    <div class="col-md-12">
                                        Like us on:
                                        <div class="social-buttons">
                                            <a href="https://www.facebook.com" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                                            <a href="https://www.twitter.com" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
                                        </div>

                                        <form action="FrontController" method="post">
                                            <div class="form-group">
                                                <label class="sr-only" for="username">Username</label>
                                                <input type="text" name ="username" class="form-control" id="username" placeholder="Username :" required>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                <input type="password" name= "password" class="form-control" id="password" placeholder="Password" required>
                                                <div class="help-block text-right"><a href="forgotResetPassword.jsp">Forget the password ?</a></div>
                                            </div>
                                            <div class="form-group">
                                                <input class="a" type="submit" value="Login" />
                                                <input type="hidden" name ="action" value="login" />
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> keep me logged-in
                                                </label>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="bottom text-center">
                                        New here ? <a href="#"><b>Join Us</b></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>






    




          

       
       
        <%
            // Get items list from session
            ArrayList<Album> albums = (ArrayList<Album>) session.getAttribute("showSearchAlbum");
            ArrayList<Song> songs = (ArrayList<Song>) session.getAttribute("showSearchSong");
            ArrayList<Artist> artists = (ArrayList<Artist>) session.getAttribute("showSearchArtist");
            ArrayList<Genre> genre = (ArrayList<Genre>) session.getAttribute("showSearchGenre");
            ArrayList<Member> members = (ArrayList<Member>) session.getAttribute("showSearchMember");
%>

<div class ="col-xs-12 col-sm-4 col-md-8">
             <div class ="customDIV">
                 <div class="span3 well" style = "width: 90%; margin-left: 5%; ">
<%
            if (albums != null && !albums.isEmpty()) {
        %>
        <legend><B>Searched Album</B></legend>
        
        <table>
            <tr>
                <th>albumID</th> 
                <th>GenreID</th>
                <th>ArtistID</th>
                <th>Album Name</th>
                <th>Album Price</th>
                <th>Amount In Stock</th>
                <th>Album Format</th>
                <th>Release Date</th>

            </tr>
            <%
                // loop
                for (Album a : albums) {
            %>
            <tr>
                <td><%=a.getAlbumID()%></td>
                <td><%=a.getGenreID()%></td>
                <td><%=a.getArtistID()%></td>
                <td><%=a.getAlbumName()%></td>
                <td><%=a.getAlbumPrice()%></td>
                <td><%=a.getAmountInStock()%></td>
                <td><%=a.getAlbumFormat()%></td>
                <td><%=a.getReleaseDate()%></td>

            </tr>
        </table></div>
        <%

            }
        }  if (songs != null && !songs.isEmpty()) {
        %>
        <legend>Searched Song</legend>
    <table>
        <tr>
            <th>Song ID</th>
            <th>Album ID</th>
            <th>Song Name</th>
            <th>Song Release</th>


        </tr>
        <%
            // loop
            for (Song s : songs) {
        %>
        <tr>
            <td><%=s.getId()%></td><pre>..</pre>
            <td><%=s.getAlbum_id()%></td>
            <td><%=s.getSongName()%></td>
            <td><%=s.getSongRelease()%></td>
        </tr>
    </table>
    <%

        }
    } if (genre != null && !genre.isEmpty()) {
    %>
    <legend>Searched Genre</legend>
    <table>
        <tr>
            <th>Genre ID</th>
            <th>Genre Name</th>



        </tr>
        <%
            // loop
            for (Genre g : genre) {
        %>
        <tr>
            <td><%=g.getId()%></td> 
            <td><%=g.getGenre()%></td>

        </tr>
    </table>
    <%

        }
    } else if (members != null && !members.isEmpty()) {
    %>
    <legend>Searched Member</legend>
    <table>
        <tr>
            <th>Member ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>UserType</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Email</th>
            <th>UserType</th>
            <th>Address</th>
            <th>Town</th>
            <th>County</th>
            <th>UserType</th>
            <th>SaltGen</th>
            <th>Register Date</th>
            <th>Expiry Date</th>
            <th>Avatar</th>






        </tr>
        <%
            // loop
            for (Member m : members) {
        %>
        <tr>
            <td><%=m.getUsername()%></td>
            <td><%=m.getFirstName()%></td>
            <td><%=m.getLastName()%></td>
            <td><%=m.getUserType()%></td>
            <td><%=m.getPassword()%></td>
            <td><%=m.getPhone()%></td>
            <td><%=m.getEmail()%></td>
            <td><%=m.getAddressLine1()%></td>
            <td><%=m.getTown()%></td>
            <td><%=m.getCounty()%></td>
            <td><%=m.getSalt()%></td>
            <td><%=m.getDate()%></td>
            <td><%=m.getExpiryDate()%></td>




        </tr>
    </table>
        <%

                }
            } else {
                out.println("No item found. Please try again.");
            }
        %>
</div>
                 
         </div>


          

    
    
        <script>
            //back to top function
            if ($('#back-to-top').length) {
                var scrollTrigger = 10, // px
                        backToTop = function () {
                            var scrollTop = $(window).scrollTop();
                            if (scrollTop > scrollTrigger) {
                                $('#back-to-top').addClass('show');
                            } else {
                                $('#back-to-top').removeClass('show');
                            }
                        };
                backToTop();
                $(window).on('scroll', function () {
                    backToTop();
                });
                $('#back-to-top').on('click', function (e) {
                    e.preventDefault();
                    $('html,body').animate({
                        scrollTop: 0
                    }, 50);
                });
            }
        </script>


        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
