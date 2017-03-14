<% session = request.getSession(false);






 Object albumDet = session.getAttribute("selectedAlbum");

    Album selectedAlbum = (Album) albumDet;

       
//RBAC
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



<%@page import="java.util.Collections"%>
<%@page import="Dtos.Member"%>
<%@page import="Dtos.Album"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Daos.AlbumDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Shop</title>

        <!-- Bootstrap -->
        <link href="cssBoot/bootstrap.min.css" rel="stylesheet">


        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link href="Css/common.css" rel="stylesheet" type="text/css"/>
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>


        <script>
            $(document).ready(function () {
                //-- Click on detail
                $("ul.menu-items > li").on("click", function () {
                    $("ul.menu-items > li").removeClass("active");
                    $(this).addClass("active");
                })

                $(".attr,.attr2").on("click", function () {
                    var clase = $(this).attr("class");

                    $("." + clase).removeClass("active");
                    $(this).addClass("active");
                })

                //-- Click on QUANTITY
                $(".btn-minus").on("click", function () {
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)) {
                        if (parseInt(now) - 1 > 0) {
                            now--;
                        }
                        $(".section > div > input").val(now);
                    } else {
                        $(".section > div > input").val("1");
                    }
                })
                $(".btn-plus").on("click", function () {
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)) {
                        $(".section > div > input").val(parseInt(now) + 1);
                    } else {
                        $(".section > div > input").val("1");
                    }
                })
            })
        </script>
        <style>

            body, html{

                background-image: url("images/headphonesBackground.jpg");
                background-size: 100%;

                font-family: 'Oxygen', sans-serif;
                background-size: cover;
            }

            ul > li{margin-right:25px;font-weight:lighter;cursor:pointer}
            li.active{border-bottom:3px solid white;}

            .item-photo{display:flex;justify-content:center;align-items:center;border-right:1px solid #f6f6f6;}
            .menu-items{list-style-type:none;font-size:11px;display:inline-flex;margin-bottom:0px;margin-top:20px}
            .btn-success{width:100%;border-radius:0px;}
            .section{width:100%;margin-left:-15px;padding:2px;padding-left:15px;padding-right:15px;background:white}
            .title-price{margin-top:30px;margin-bottom:0px;color:black}
            .title-attr{margin-top:0px;margin-bottom:0px;color:black;}
            .btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0px;}
            .btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0px;}
            div.section > div {width:100%;display:inline-flex;}
            div.section > div > input {margin:0px;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
            .attr,.attr2{cursor:pointer;margin-right:5px;height:20px;font-size:10px;padding:2px;border:1px solid gray;border-radius:2px;}
            .attr.active,.attr2.active{ border:1px solid orange;}

            @media (max-width: 426px) {
                .container {margin-top:0px !important;}
                .container > .row{padding:0px !important;}
                .container > .row > .col-xs-12.col-sm-5{
                    padding-right:0px ;    
                }
                .container > .row > .col-xs-12.col-sm-9 > div > p{
                    padding-left:0px !important;
                    padding-right:0px !important;
                }
                .container > .row > .col-xs-12.col-sm-9 > div > ul{
                    padding-left:10px !important;

                }            
                .section{width:104%;}
                .menu-items{padding-left:0px;}
            }

        </style>

    </head>
    <body>

        <%
            String userType = member.getUserType();
            if (userType.equals("user")) {
                





        %>


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

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="LoginSuccess.jsp">My Profile</a></li>
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
                                        <br>
                                        
                                         <small><cite title="<%=member.getPhone()%>"><%=member.getPhone()%> <i class="glyphicon glyphicon-phone">
                                                </i></cite></small>

                                        <input class= "a"type="submit" value="Logout Here"/>
                                        <input type="hidden" name="action" value="logout"/>

                                </div>
                            </div>
                        </div>
                    </div>



                </div>

            </div>





            <div class ="col-xs-12 col-sm-4 col-md-7">
                <div class ="customDIV"> MIDDLE SECTIONS 
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 item-photo">
                                <img style="max-width:100%;" src="<%=selectedAlbum.getAlbumImage()%>" />
                            </div>
                            <div class="col-xs-5" style="border:px solid white">
                                <!-- Details -->
                                <h3><%=selectedAlbum.getAlbumName()%></h3>    
                                        <h5 style="color:#337ab7">Sold By <a href="#">MusicStream</a> · <small style="color:#337ab7">(5054 purchases)</small></h5>

                                        <!-- Price -->
                                        <h6 class="title-price"><small>Price Offer:</small></h6>
                                        <h3 style="margin-top:0px;">U$S <%=selectedAlbum.getAlbumPrice()%></h3>

                                        <!-- Album Details -->
                                        <div class="section">
                                            <h6 class="title-attr" style="margin-top:15px;" ><small>COLOR</small></h6>                    
                                            <div>
                                                <div class="attr" style="width:25px;background:#5a5a5a;"></div>
                                                <div class="attr" style="width:25px;background:white;"></div>
                                            </div>
                                        </div>
                                        <div class="section" style="padding-bottom:5px;">
                                            <h6 class="title-attr"><small>CAPACIDAD</small></h6>                    
                                            <div>
                                                <div class="attr2">16 GB</div>
                                                <div class="attr2">32 GB</div>
                                            </div>
                                        </div>   
                                        <div class="section" style="padding-bottom:20px;">
                                            <h6 class="title-attr"><small>CANTIDAD</small></h6>                    
                                            <div>
                                                <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                                                <input value="1" />
                                                <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                                            </div>
                                        </div>                

                                        <!-- Botones de compra -->
                                        <div class="section" style="padding-bottom:20px;">
                                            <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Agregar al carro</button>
                                            <h6><a href="#"><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span> Agregar a lista de deseos</a></h6>
                                        </div>                                        
                                        </div>                              

                                        <div class="col-xs-9">
                                            <ul class="menu-items">
                                                <li class="active">Detalle del producto</li>
                                                <li>Garantía</li>
                                                <li>Vendedor</li>
                                                <li>Envío</li>
                                            </ul>
                                            <div style="width:100%;border-top:1px solid silver">
                                                <p style="padding:15px;">
                                                    <small>
                                                        Stay connected either on the phone or the Web with the Galaxy S4 I337 from Samsung. With 16 GB of memory and a 4G connection, this phone stores precious photos and video and lets you upload them to a cloud or social network at blinding-fast speed. With a 17-hour operating life from one charge, this phone allows you keep in touch even on the go. 

                                                        With its built-in photo editor, the Galaxy S4 allows you to edit photos with the touch of a finger, eliminating extraneous background items. Usable with most carriers, this smartphone is the perfect companion for work or entertainment.
                                                    </small>
                                                </p>
                                                <small>
                                                    <ul>
                                                        <li>Super AMOLED capacitive touchscreen display with 16M colors</li>
                                                        <li>Available on GSM, AT&T, T-Mobile and other carriers</li>
                                                        <li>Compatible with GSM 850 / 900 / 1800; HSDPA 850 / 1900 / 2100 LTE; 700 MHz Class 17 / 1700 / 2100 networks</li>
                                                        <li>MicroUSB and USB connectivity</li>
                                                        <li>Interfaces with Wi-Fi 802.11 a/b/g/n/ac, dual band and Bluetooth</li>
                                                        <li>Wi-Fi hotspot to keep other devices online when a connection is not available</li>
                                                        <li>SMS, MMS, email, Push Mail, IM and RSS messaging</li>
                                                        <li>Front-facing camera features autofocus, an LED flash, dual video call capability and a sharp 4128 x 3096 pixel picture</li>
                                                        <li>Features 16 GB memory and 2 GB RAM</li>
                                                        <li>Upgradeable Jelly Bean v4.2.2 to Jelly Bean v4.3 Android OS</li>
                                                        <li>17 hours of talk time, 350 hours standby time on one charge</li>
                                                        <li>Available in white or black</li>
                                                        <li>Model I337</li>
                                                        <li>Package includes phone, charger, battery and user manual</li>
                                                        <li>Phone is 5.38 inches high x 2.75 inches wide x 0.13 inches deep and weighs a mere 4.59 oz </li>
                                                    </ul>  
                                                </small>
                                            </div>
                                        </div>		
                                        </div>
                                        </div>













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
                                        <% }%>



                                        </body>
                                        </html>


