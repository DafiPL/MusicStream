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
Please login/register here!: <a href="login.jsp">Login</a>
<%
    } else {

   %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Css/common.css" rel="stylesheet" type="text/css"/>
<%@page import="Dtos.Member"%>
<%@page import="Dtos.Album"%>
<%@page import="Daos.AlbumDao"%>
<%@page import="Dtos.Artist"%>
<%@page import="Daos.ArtistDao"%>
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

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"/>
         <link rel="stylesheet" href="cssBoot/demo.css">
        <link rel="stylesheet" href="cssBoot/fakeLoader.css">
        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <!-- Data Tables  -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <style>

            body, html{

                background-image: url("images/headphonesBackground.jpg");
                background-size: 100%;

                font-family: 'Oxygen', sans-serif;
                background-size: cover;
            }

        </style>
        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    "pagingType": "full_numbers"
                });
            });
        </script>
        <%
            AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();
            ArtistDao artDao = new ArtistDao("musicdb");
            ArrayList<Artist> artists = artDao.getAllArtists();


        %>

    </head>
    <body>
<div class="fakeloader"></div>
        <%@ include file="headerLoggedIn.jsp" %>


        <%                 String userType = member.getUserType();
            if (userType.equals("user")) {
        %>

        <%
            OrderDao orderDao = new OrderDao("musicdb");
            ArrayList<Order> orders = orderDao.selectAllOrdersByUser(member.getUsername());


        %>








        <div class="row">
            <div class ="col-xs-12 col-sm-4 col-md-3">
               
                    

                    <h2>Your Playlist For Today</h2>
                    <iframe src="https://embed.spotify.com/?uri=spotify:album:5uP9oyMK5lpzbB7K6UeT3X" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>






                

            </div>





            <div class ="col-xs-12 col-sm-4 col-md-6">
                <div class ="customDIV"> 

                    <table id="example" class="display" width="100%" cellspacing="0" style="background:#3399ff">
                        <thead >
                            <tr>
                                <th>Order ID</th>
                                <th>Album</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Image</th>

                            </tr>
                        </thead>

                        <tbody>
                            <%                for (Order o : orders) {
                            %>
                            <tr>



                                <td><%=o.getOrderID()%></td>
                                <td><%=albumDao.getAlbumById(o.getAlbumID()).getAlbumName()%></td>
                                <td><%=o.getQuantity()%></td>
                                <td><%=o.getPrice()%></td>

                                <td> <img src="<%=albumDao.getAlbumById(o.getAlbumID()).getAlbumImage()%>" alt="" height="100" width="120"></td>

                            </tr>
                            <%
                                }
                            %>
                        </tbody>




                    </table>




                    .










                </div>

            </div>
            <div class ="col-xs-12 col-sm-4 col-md-3">
                <div class ="customDIV"> </div></div>

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
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
      
         <script src="js/bootstrap.min.js"></script>
        
        <script src="js/fakeLoader.min.js"></script>


        <script>
            $(document).ready(function () {
                $("[rel='tooltip']").tooltip();
            });
        </script>
                  <script>
            $(document).ready(function(){
                $(".fakeloader").fakeLoader({
                    timeToHide:1800,
                    bgColor:"#3498db",
                    spinner:"spinner5",
                    
                });
            });
        </script>
        
    </body>
</html>
<%    }
%>