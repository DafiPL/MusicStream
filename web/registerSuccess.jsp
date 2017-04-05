<%-- 
    Document   : registerSuccess
    Created on : 02-03-2017, 13:56:27
    Author     : Dafi
--%>



<%@page import="Dtos.Artist"%>
<%@page import="Dtos.Album"%>
<%@page import="Daos.ArtistDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.AlbumDao"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
Bq4BWBgDDR2UcEmT
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dtos.Member"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>REGISTRATION SUCCESS</title>

        <!-- Bootstrap -->
        <link href="cssBoot/bootstrap.min.css" rel="stylesheet">
        <link href="Css/style.css" rel="stylesheet">


        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
         <!-- Loader -->
         <link rel="stylesheet" href="cssBoot/demo.css">
        <link rel="stylesheet" href="cssBoot/fakeLoader.css">
        
        <style>

            body, html{

                background-image: url("images/headphonesBackground.jpg");
                font-family: 'Oxygen', sans-serif;
                background-size: cover;
            }
        </style>
    </head>
    <body>
      <%
        
           AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();
              ArtistDao artDao = new ArtistDao("musicdb");
            ArrayList<Artist> artists = artDao.getAllArtists();
        
         

            
          
    %>
          <%@ include file="header.jsp" %>
        <div class="fakeloader"></div>
         <%
           
            Object mem = session.getAttribute("regInfo");
            Object passWord = session.getAttribute("theGeneratedPassword");
                if(mem !=null)
                {
                    Member m = (Member) mem;
                    String passwordGenerated = (String) passWord;
                
                

        %>

     <div class="row">
     
        
           <div class ="col-xs-12 col-sm-4 col-md-2">
            
                 
      



                 
         </div>
        
        
         <div class ="col-xs-12 col-sm-4 col-md-8">
            
                 <div class=" highlight" style="margin-left:0; width: 100%">
<h2>Welcome <%=m.getFirstName()%></h2>
	<div class="row">
  
		
           
        <ul>
            <li>EMAIL WITH REGISTRATION INFO HAS BEEN SENT!</li>

           
        </ul>
        </div>
        <div class="row">
        
       
          <a href="login.jsp">    <button class="btn btn-warning" role="button">Log In</button></a>
   
        </div>
        <p>Order Details have been sent to your Email Address.</p>
    </div>
            
      



                 
         </div>
           <div class ="col-xs-12 col-sm-4 col-md-2">
            
            
            
      



                 
         </div>
      
    </div>

        
        
        
        
        
        
        
        
        
     <%   } %>
        
        
        
        
            









   

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
                    timeToHide:6800,
                    bgColor:"#3498db",
                    spinner:"spinner5",
                    
                });
            });
        </script>
    </body>
</html>