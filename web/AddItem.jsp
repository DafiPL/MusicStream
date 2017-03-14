<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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






        <div class="row">
            <div class ="col-xs-12 col-sm-4 col-md-2">
                <div class ="customDIV"> LEft SIde Bar <br>




                </div>

            </div>





            <div class ="col-xs-12 col-sm-4 col-md-8">
                <div class ="customDIV"> MIDDLE SECTIONS <br>


                    <%
                        // Get items list from session
                        String choice = request.getParameter("addchoice");

                        if (choice.equals("song")) {
                    %>

                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Add Song</legend>


                            <input class="span3" name="albumID" placeholder="Album ID" type="text" /> 
                            <input class="span3" name="songName" placeholder="Song Name" type="text" />
                            <input class="span3" name="songRelease" placeholder="Song Release" type="text" />
                            <input class="btn btn-warning" type="submit" value="Add Song" />
                            <input type="hidden" name ="action" value="add" />
                            <input type="hidden" name ="addchoice" value="song" />
                        </form>
                    </div>
                    <% } else if (choice.equals("album")) {

                    %>

                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Add Album</legend>


                            <input class="span3" name="albumID" placeholder="Album ID" type="text" /> 
                            <input class="span3" name="genreID" placeholder="Genre ID" type="text" />
                            <input class="span3" name="artistID" placeholder="Artist ID" type="text" />
                            <input class="span3" name="albumName" placeholder="Album Name" type="text" />
                            <input class="span3" name="albumPrice" placeholder="Album Price" type="text" />
                            <input class="span3" name="amountInStock" placeholder="Amount In Stock" type="text" />
                            <input class="span3" name="albumFormat" placeholder="Album Format" type="text" />
                            <input class="span3" name="releaseDate" placeholder="Release Date" type="text" />
                            <input class="span3" name="albumImage" placeholder="Album Imagine" type="text" />
                            <input class="btn btn-warning" type="submit" value="Add Song" />
                            <input type="hidden" name ="action" value="add" />
                            <input type="hidden" name ="addchoice" value="album" />
                        </form>
                    </div>

                    <% } else if (choice.equals("artist")) {
                    %>

                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Add Artist</legend>


                            <input class="span3" name="artistID" placeholder="Album ID" type="text" /> 
                            <input class="span3" name="artistName" placeholder="Genre ID" type="text" />
                            <input class="span3" name="artistAge" placeholder="Artist ID" type="text" />
                            <input class="span3" name="artistBio" placeholder="Album Name" type="text" />
                            <input class="span3" name="artistPicture" placeholder="Album Price" type="text" />
                            <input class="btn btn-warning" type="submit" value="Add Song" />
                            <input type="hidden" name ="action" value="add" />
                            <input type="hidden" name ="addchoice" value="artist" />
                        </form>
                    </div>
                    <% } else if (choice.equals("genre")) {
                    %>

                    <div class="span3 well" style = "width: 90%; margin-left: 5%;">
                        <form action="FrontController" method="post">
                            <legend>Add Genre</legend>
                            <input class="span3" name="genreID" placeholder="Genre ID" type="text" />
                            <input class="span3" name="genreName" placeholder="Genre Name" type="text" />

                            <input class="btn btn-warning" type="submit" value="Add Song" />
                            <input type="hidden" name ="action" value="add" />
                            <input type="hidden" name ="addchoice" value="genre" />
                        </form>
                    </div>
                    <% }
                    %>



                </div>




            </div>
            <div class ="col-xs-12 col-sm-4 col-md-2">
                <div class ="customDIV"> RIGHT SIde Bar  </div></div>

        </div>







































        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>