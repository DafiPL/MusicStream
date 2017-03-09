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
        



















        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
<%
    }
%>