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
        </nav
        
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
            <div class ="customDIV"> LEft SIde Bar <br>
                
        
            
            
            </div>
                
        </div>
        
        
        
        
        
         <div class ="col-xs-12 col-sm-4 col-md-8">
             <div class ="customDIV"> MIDDLE SECTIONS <br>
            
        <h1>Your Information</h1>
        
        <h2>Welcome <%=m.getFirstName()%></h2>
        <h2>Your Username : <%=m.getUsername()%></h2>
         <h1>EMAIL WITH REGISTRATION INFO HAS BEEN SENT!</h1>
        <h1>Password</h1>
        <h2>Your Generated Password Is :  <%=passwordGenerated%> Please save it!</h2>
        
        
  
            
    

  






</div>
                 
         </div>
          <div class ="col-xs-12 col-sm-4 col-md-2">
              <div class ="customDIV"> RIGHT SIde Bar  </div></div>
      
    </div>

        
        
        
        
        
        
        
        
        
     <%   } %>
        
        
        
        
            









   


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>