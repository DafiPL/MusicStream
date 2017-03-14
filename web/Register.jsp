<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Register</title>

        <!-- Bootstrap -->
        <link href="cssBoot/bootstrap.min.css" rel="stylesheet">
        <link href="css/layout.css" rel="stylesheet">


        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        
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
                   <SCRIPT LANGUAGE="JavaScript">
            
            function checker()
            {   
                var regExp1 = /^[A-Za-z0-9 ]{3,20}$/;
                
             
                var result1 = document.form1.username.value.match(regExp1);
                var firstName = document.form1.username.value.match(regExp1);
                var lastName = document.form1.username.value.match(regExp1);
                
                
                var addressLine1 = document.form1.username.value.match(regExp1);
                var town = document.form1.username.value.match(regExp1);
                var county = document.form1.username.value.match(regExp1);
                
               
                if (result1 == null) {
                    alert("Sorry, Invalid Username>>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.username.value = ""
                    return false
                } 
               else  if (firstName == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.firstName.value = ""
                    return false
                }
                 else  if (lastName == null) {
                    alert("Sorry, Invalid Last Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.lastName.value = ""
                    return false
                }
              
              
                else  if (addressLine1 == null) {
                    alert("Sorry, Invalid Adress >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.addressLine1.value = ""
                    return false
                }
                 else  if (town == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.town.value = ""
                    return false
                }
                 else  if (county == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 40 characters. ")
                    document.form1.county.value = ""
                    return false
                }
                
        
        
        
        
        else {
                    document.form1.submit()
                }
            }
            
        </SCRIPT>
    </head>
    <body>
        <h1>Registration Page</h1>
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

            <div class="row">
        <div class ="col-xs-12 col-sm-4 col-md-2">
            <div class ="customDIV"> LEft SIde Bar <br>
                
        
            
            
            
            </div>
                
        </div>
        
        
        
        
        
         <div class ="col-xs-12 col-sm-4 col-md-8">
             <div class ="customDIV"> MIDDLE Section <br>
             
            <div class="row main">
                <div class="main-login main-center">
                    <h5>Sign up</h5>
                    <form NAME="form1" action="FrontController" method="post" method="get" ONSUBMIT="return checker()" >
                         <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Username</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username" required  pattern="[a-z]{1,15}" title="Username should only contain lowercase letters. e.g. john"/>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="name" class="cols-sm-2 control-label">Your First Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>

                                    <input name="firstName" class="form-control"   id="firstName" placeholder="eg. Damian" size=15 type="text"required  pattern="[a-zA-Z]{1,30}" title="First Name Characters A-Z a-z letters. e.g. John"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="cols-sm-2 control-label">Your Last Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>

                                    <input name="lastName" class="form-control"   id="lastName"  placeholder="eg. Mikolajczyk"size=15 type="text"required  pattern="[a-zA-Z]{1,30}" title="Second Name Characters A-Z a-z letters. e.g. Marley"/>
                                </div>
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="phone" class="cols-sm-2 control-label">Phone Number</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input name ="phone" class="form-control" name="phone" id="phone"  placeholder="Enter your Phone Number" type="tel" required  pattern="[0-9]{1,10}" title="Phone Number Must be 10 digits long"/>
                                </div>
                            </div>
                        </div>






                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Your Email</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>

                                    <input name="email" id="email"  class="form-control" placeholder="eg. damian@gmail.com" size=15 type="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="characters@characters.domain (characters followed by an @ sign, followed by more characters, and then a '.' " />
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="adress" class="cols-sm-2 control-label">Address :</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>

                                    <input name="addressLine1" id="addressLine1" class="form-control" placeholder="eg.36 Broom Field Heights" size=15 type="text" required pattern="[a-zA-Z 0-9]{1,30}" title="Numbers And Letters"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="city" class="cols-sm-2 control-label">Enter City</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>

                                    <input name="town" id="town" class="form-control" placeholder="eg. Dublin " size=15  type="text"required pattern="[a-zA-Z]{1,30}" title="Letters Only" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="county" class="cols-sm-2 control-label">Enter County</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>                           
                                    <input name="county" id ="county"  class="form-control" placeholder="eg. Cavan" size=15 type="text"required  pattern="[a-zA-Z]{1,30}" title="Letters Only" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Register Now" />
                <input type="hidden" name ="action" value="register" />
                        </div>

                    </form>
                        
                  

                       
                </div>
            </div>
        
             
             
             
             </div>
                 
         </div>
          <div class ="col-xs-12 col-sm-4 col-md-2">
              <div class ="customDIV"> RIGHT SIde Bar  </div></div>
      
    </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       



















        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>