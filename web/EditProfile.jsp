<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% session = request.getSession(false);

    Object albumDet = session.getAttribute("selectedAlbum");
    Album selectedAlbum = (Album) albumDet;

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
        <%@ include file="headerLoggedIn.jsp" %>
        <div class="fakeloader"></div>
        <div class="row">
            <div class ="col-xs-12 col-sm-4 col-md-2">
                <div class ="customDIV"> LEft SIde Bar <br>





                </div>

            </div>

            <div class ="col-xs-12 col-sm-4 col-md-8">
                <div class ="customDIV">



                    <!-- edit form column -->







                    <hr>
                    <div class="row">
                        <br>
                        <br>
                        <br> <!-- left column -->
                        <div class="col-md-3">
                            <div class="text-center">
                                <form method="post" action="uploadServlet" enctype="multipart/form-data">

                                    <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
                                    <h6>Upload a different photo...</h6>

                                    <input type="file" name="photo"  class="form-control">
                                    <input type="hidden" name ="username" value="<%=member.getUsername() %>" />

                                    <input type="submit" name="submit" value="Upload" class="form-control">
                                </form>
                            </div>
                        </div>
                        <br>
                        <br>
                        <!-- edit form column -->
                        <div class="col-md-9 personal-info">
                            <div class="alert alert-info alert-dismissable">
                                <a class="panel-close close" data-dismiss="alert">X</a> 
                                <i class="fa fa-coffee"></i>
                                Welcome, <strong>Change</strong>Your Account Information Below
                            </div>
                            <h3>Personal info</h3>

                            <form  class="form-horizontal" role="form" action="FrontController" method="post">
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">First name:</label>
                                    <div class="col-lg-8">
                                        <input class="form-control"  name="firstname" type="text" value="<%=member.getFirstName()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Last name:</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" type="text" name="lastname" value="<%=member.getLastName()%>" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Phone Number</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" type="text" name="phone" value="<%=member.getPhone()%>" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Email:</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" type="text" name="email" value="<%=member.getEmail()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Username:</label>
                                    <div class="col-md-8">
                                        <input class="form-control" name="username" type="text" value="<%=member.getUsername()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control"  name="password" type="password" value="<%=member.getPassword()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Confirm password:</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="password" name="confirmpassword" value="<%=member.getPassword()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Street:</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="address" value="<%=member.getAddressLine1()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Town:</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="town" value="<%=member.getTown()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">County:</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" name="county" value="<%=member.getCounty()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label"></label>
                                    <div class="col-md-8">
                                        <input   type="submit" class="btn btn-primary" value="Save Changes">
                                        <span></span>
                                        <input type="reset" class="btn btn-default" value="Cancel">
                                    </div>
                                </div>
                                <input type="hidden" name ="action" value="editprofile" />
                            </form>
                        </div>
                    </div>

                    <hr>


                    <%
                        }

                    %>



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

        <script src="js/fakeLoader.min.js"></script>

        <script>
            $(document).ready(function () {
                $("[rel='tooltip']").tooltip();
            });
            <%
            %>
        </script>
        <script>
            $(document).ready(function () {
                $(".fakeloader").fakeLoader({
                    timeToHide: 1800,
                    bgColor: "#3498db",
                    spinner: "spinner5",

                });
            });
        </script>
    </body>
</html>
