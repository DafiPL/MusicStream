<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% session = request.getSession(false);
   
    
    Object orderDet = session.getAttribute("orderDetials");
    Order o = (Order) orderDet;
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
        <link href="Css/style.css" rel="stylesheet">


        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
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
       <div class="fakeloader"></div>
          <%@ include file="headerLoggedIn.jsp" %>
   
            
             <%

            String userType = member.getUserType();
            if (userType.equals("user")) {
        %>
       
           
            
            
            
            
            
            
       
          <div class="row">
        <div class ="col-xs-12 col-sm-4 col-md-2">
           
                
        </div>
        
        
        
        
        
         <div class ="col-xs-12 col-sm-4 col-md-8">
          

<div class=" highlight" style="margin-left:0; width: 100%">
<h2>Order Successful !</h2>
	<div class="row">
  
		
          
        <ul>
            <li>Your Order Has Been Received.</li>

           
        </ul>
        </div>
        <div class="row">
        
       
          <a href="browseItems.jsp">    <button class="btn btn-warning" role="button">Keep Browsing</button></a>
   
        </div>
        <p>Order Details have been sent to your Email Address.</p>
    </div>
	
</div>
</div>
                 
         </div>
          <div class ="col-xs-12 col-sm-4 col-md-2">
           
      
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
        <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script src="js/bootstrap.min.js"></script>
        
        <script src="js/fakeLoader.min.js"></script>
     
        <script>
    		$(document).ready(function(){
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
<%
    }
%>