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
                        <li><a href="Register.jsp">Register?</a></li>
                        <li><a href="forgotResetPassword.jsp">Forgot Password?</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <span class="caret"></span></a>
                            <ul  class="dropdown-menu" role="menu">
                                <li><a href="#">Buy</a></li>
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
            <form class="info" action="FrontController" method="post">
             <input style="margin-left:90%" class= "a"type="submit" value="Logout Here"/>
            <input type="hidden" name="action" value="logout"/>
              
            <br>
         
        Your current details are -
        <br>Username : <%=member.getUsername()%>
        <br>Password : <%=member.getFirstName()%>
        <br>User_Type : <%=member.getLastName()%>
        <br>Email : <%=member.getUserType()%>
        <br>Address : <%=member.getPhone()%>
        <br>Address : <%=member.getEmail()%>
        <br>Address : <%=member.getAddressLine1()%>
        <br>Address : <%=member.getTown()%>
        <br>
        <br>
        <br>
        <br><a href="placeOrder.jsp">Place an Order</a><br>
        <a href="updateAccount.jsp">Update Your Account</a><br>
        <a href="index.jsp">View Albums</a><br>
      
            
            
        </form>
                <%
            OrderDao orderDao = new OrderDao("musicdb");
            ArrayList<Order> orders = orderDao.selectAllOrdersByUser(member.getUsername());

           AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();


        %>
        <div class = "orderContainer" style="height: 500px; width:  50%;">
            
            
<h2>These are your previous order details</h2>
        <table id="example" class="display" width="90%" cellspacing="0">
        <thead >
            <tr>
               <th>Album ID</th>
                    <th>Genre ID</th>
                    <th>Artist ID</th>
                    <th>Album Name</th>
                    <th>Album Price</th>
                    <th>Stock</th>
                     <th>Format</th>
                     <th>Release Date</th>
                    
                   
                    <th></th>
            </tr>
        </thead>
        <tfoot >
            <tr>
                <th>Album ID</th>
                    <th>Album Name</th>
                    <th>Album Artist</th>
                    <th>Album Genre</th>
                    <th>Album Price</th>
                    <th>Image</th>
                    <th></th>
                  
            </tr>
        </tfoot>
        <tbody>
            <%                for (Order o : orders) {
            %>
            <tr>
                <td><%=o.getAlbumID()%></td>
                <td><%=albumDao.getAlbumByID(o.getAlbumID()).getAlbum_Name()%></td>
                <td><%=albumDao.getAlbumByID(o.getAlbum_ID()).getAlbum_Artist()%></td>
                <td><%=albumDao.getAlbumByID(o.getAlbum_ID()).getAlbum_Genre()%></td>
                <td><%=albumDao.getAlbumByID(o.getAlbum_ID()).getAlbum_Price()%></td>
                <td> <img src="<%=albumDao.getAlbumByID(o.getAlbum_ID()).getDbImage()%>" alt="Smiley face" height="42" width="42"></td>
                
                <td></td>
            

            </tr>
            <%
                }
            %>
             </tbody>
        </table>
            
            
            
            
            
            
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