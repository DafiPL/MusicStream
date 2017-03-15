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
                
    <h1>Edit Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
          <h6>Upload a different photo...</h6>
          
          <input type="file" class="form-control">
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          Welcome, <strong>Change</strong>Your Account Information Below
        </div>
        <h3>Personal info</h3>
        
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <label class="col-lg-3 control-label">First name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="Jane">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Last name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="Bishop">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Company:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="janesemail@gmail.com">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Time Zone:</label>
            <div class="col-lg-8">
              <div class="ui-select">
                <select id="user_time_zone" class="form-control">
                  <option value="Hawaii">(GMT-10:00) Hawaii</option>
                  <option value="Alaska">(GMT-09:00) Alaska</option>
                  <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                  <option value="Arizona">(GMT-07:00) Arizona</option>
                  <option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                  <option value="Central Time (US &amp; Canada)" selected="selected">(GMT-06:00) Central Time (US &amp; Canada)</option>
                  <option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                  <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
                </select>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="janeuser">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" value="11111122333">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" value="11111122333">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="button" class="btn btn-primary" value="Save Changes">
              <span></span>
              <input type="reset" class="btn btn-default" value="Cancel">
            </div>
          </div>
        </form>
      </div>
  </div>

<hr>
                    <div class="span3 well" style = "width: 90%; margin-left: 5%; ">
                        <legend>Your Profile</legend>
                        <%
                            if (member != null) {
                        %>
                        <form action="FrontController" method="post">
                            <table>
                                <tr>
                                    <th>Username</th> <p>
                                <th>First Name</th> 
                                <th>Last Name</th>
                                <th>Password</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Street</th>
                                <th>Town</th>
                                <th>County</th>
                                <th>Register Date</th>
                                <th>ExpiryDate</th>

                                </tr>

                                <tr>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="username" value="<%=member.getUsername()%>"/></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="firstname" value="<%=member.getFirstName()%>" /></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="lastname" value="<%=member.getLastName()%> " /></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="password" value="<%=member.getPassword()%>" /></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="phone" value="<%=member.getPhone()%>" /></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="email" value="<%=member.getEmail()%>" /></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="address" value="<%=member.getAddressLine1()%>" /></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="town" value="<%=member.getTown()%>" /></td>
                                    <td> <input style ="width: 100%; height: 40px; color: black;" class ="a" type="JTextField" name="county" value="<%=member.getCounty()%>" /></td>
                                    <td> <%=member.getDate()%></td>
                                    <td> <%=member.getExpiryDate()%></td>

                                <button class="btn btn-warning" type="submit" value="edit">Edit</button>
                                <input type="hidden" name ="action" value="editprofile" />
                                </tr>
                            </table>
                        </form>
                        <%
                            }
}
                        %>


                    </div>
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