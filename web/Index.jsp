<!DOCTYPE html>

<% session = request.getSession(false);
    Object resultValue = session.getAttribute("userLogin");
    Member member = (Member) resultValue;
   
%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Css/common.css" rel="stylesheet" type="text/css"/>

<%@page import="Dtos.Album"%>
<%@page import="Daos.AlbumDao"%>
<%@page import="Dtos.Artist"%>
<%@page import="Daos.ArtistDao"%>
<%@page import="Dtos.Member"%>
<%@page import="Daos.MemberDao"%>
<%@page import="java.util.ArrayList"%>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Index Menu</title>

     <!-- Bootstrap -->
        <link href="cssBoot/bootstrap.min.css" rel="stylesheet">
  
   
        <link rel="stylesheet" href="cssBoot/demo.css">
        <link rel="stylesheet" href="cssBoot/fakeLoader.css">


        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="style.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        

        <style>
  

        </style>
        
     
    </head>
    
    <%
        
           AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();
              ArtistDao artDao = new ArtistDao("musicdb");
            ArrayList<Artist> artists = artDao.getAllArtists();
        
         

            
          
    %>
    <body id="page-top" name="page-top" class="active">
        <div class="fakeloader"></div>







   <%@ include file="header.jsp" %>
       
		<div class="masthead">
            <div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">


                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#bs-carousel" data-slide-to="1"></li>
                    <li data-target="#bs-carousel" data-slide-to="2"></li>
                </ol>
      
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item slides active">
                        <div class="slide-1"></div>
                            <div class="hero">
                                <hgroup>
                                    <h1>Music is life.</h1>        
                                    <h3>Register Now !</h3>
                                </hgroup>
                          <a href="Register.jsp">  <button class="btn btn-hero btn-lg" role="button">Register Here</button></a>
                                      
                        </div>
                    </div>
                    <div class="item slides">
                        <div class="slide-2"></div>
                            <div class="hero">        
                                <hgroup>
                                    <h1>Music is amazing </h1>        
                                    <h3>Already a Member? Log In</h3>
                                </hgroup>       
                            <a href="login.jsp">    <button class="btn btn-hero btn-lg" role="button">Login Here</button></a>
                            </div>
                        </div>
                        <div class="item slides">
                            <div class="slide-3"></div>
                                <div class="hero">        
                                    <hgroup>
                                        <h1>Music is for everyone.</h1>        
                                        <h3>Have a look at our products</h3>
                                    </hgroup>
                                  <a href="browseItems.jsp">  <button class="btn btn-hero btn-lg" role="button">Browse Items</button></a>
                                </div>
                            </div>
                        </div> 
                    </div>
		        </div>
            </div>
        </div>
        
		
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