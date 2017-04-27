
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
                } else if (firstName == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.firstName.value = ""
                    return false
                } else if (lastName == null) {
                    alert("Sorry, Invalid Last Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.lastName.value = ""
                    return false
                } else if (addressLine1 == null) {
                    alert("Sorry, Invalid Adress >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.addressLine1.value = ""
                    return false
                } else if (town == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 20 characters. ")
                    document.form1.town.value = ""
                    return false
                } else if (county == null) {
                    alert("Sorry, Invalid First Name >>  Alphabets, numbers and space(' ') no special characters min 3 and max 40 characters. ")
                    document.form1.county.value = ""
                    return false
                } else {
                    document.form1.submit()
                }
            }

        </SCRIPT>
    </head>
    <body>

    

        <%@ include file="header.jsp" %>



        <div class="row">
            <div class ="col-xs-12 col-sm-4 col-md-2">


            </div>





            <div class ="col-xs-12 col-sm-4 col-md-8">


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
            <div class ="col-xs-12 col-sm-4 col-md-2">


            </div>

























































            <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="js/bootstrap.min.js"></script>
            <script>
                            $(document).ready(function () {
                                $("[rel='tooltip']").tooltip();
                            });
            </script>
    </body>
</html>