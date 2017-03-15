<%@page import="Dtos.Album"%>
<%@page import="Dtos.Artist"%>
<%@page import="Daos.ArtistDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.AlbumDao"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!--FRVgt6c5w1HAjSUb -->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Log In</title>

        <!-- Bootstrap -->
        <link href="cssBoot/bootstrap.min.css" rel="stylesheet">
        <link href="css/layout.css" rel="stylesheet">


        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <style>

            body, html{

                background-image: url("images/headphonesBackground.jpg");
                background-size: 100%;

                font-family: 'Oxygen', sans-serif;
                background-size: cover;
            }


        </style>
        <SCRIPT LANGUAGE="JavaScript">

            function checker()
            {
                var regExp1 = /^[A-Za-z0-9 ]{3,20}$/;


                var result1 = document.form1.username.value.match(regExp1);
                var firstName = document.form1.username.value.match(regExp1);
                var lastName = document.form1.username.value.match(regExp1);


                var addressLine1 = document.form1.username.value.match(regExp1);
                var town = document.form1.username.value.match(regExp1);
                var county = document.form1.username.value.match(regExp1);


                if (result1 == null) {
                    alert("Sorry, Invalid Username>>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.username.value = ""
                    return false
                } else if (firstName == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.firstName.value = ""
                    return false
                } else if (lastName == null) {
                    alert("Sorry, Invalid Last Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.lastName.value = ""
                    return false
                } else if (addressLine1 == null) {
                    alert("Sorry, Invalid Adress >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.addressLine1.value = ""
                    return false
                } else if (town == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.town.value = ""
                    return false
                } else if (county == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 40 characters. ")
                    document.form1.county.value = ""
                    return false
                } else {
                    document.form1.submit()
                }
            }

        </SCRIPT>
    </head>
    <body>

        <%

            AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();
            ArtistDao artDao = new ArtistDao("musicdb");
            ArrayList<Artist> artists = artDao.getAllArtists();


        %>

        <%@ include file="header.jsp" %>



        <div class="row">
            <div class ="col-xs-12 col-sm-4 col-md-2">


            </div>





            <div class ="col-xs-12 col-sm-4 col-md-8">
                        <div class="row main">
                <div class="main-login main-center">
                    <h5>Sign up</h5>
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




                </div>
            </div>
 






</div>
                 
         </div>
            </div>


            
            <div class ="col-xs-12 col-sm-4 col-md-2">


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
            </script>
    </body>
</html>