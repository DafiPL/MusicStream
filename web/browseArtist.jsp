<%@page import="Dtos.Artist"%>
<%@page import="Daos.ArtistDao"%>
<% session = request.getSession(false);
    Object res = session.getAttribute("userLogin");
    Member members = (Member) res;
    if (session == null || session.getAttribute("userLogin") == null) {
%>
<h1>Sorry you can't access this page as you're not logged in!</h1>
<br> 
Please login/register here!: <a href="login.jsp">Login</a>
<%
} else {
%>




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
       <link href="cssBoot/bootstrap.css" rel="stylesheet">
    
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"/>
     
      <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link href="Css/common.css" rel="stylesheet" type="text/css"/>
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>


        <script>
  $(document).ready(function() {
    $('#example').DataTable( {
        "pagingType": "full_numbers"
    } );
} );
            </script>
            <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
            
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

          <%

            String userType = members.getUserType();
            if (userType.equals("user")) {
        %>
       
       
          <%@ include file="headerLoggedIn.jsp" %>

          <div class="row">
        <div class ="col-xs-12 col-sm-4 col-md-3">
            <div class ="customDIV">
                <br><br><br><br><br><br><br>
                <div class="fb-comments" style ="background: white;"data-href="http://localhost:8084/musicStream/browseArtist.jsp" data-width="300" data-numposts="20"></div>

            
            
            
            </div>
                
        </div>
        
        
        
        
        
         <div class ="col-xs-12 col-sm-4 col-md-8">
             <div class ="customDIV" >
                 <br><br><br><br><br>
             
                 <table id="example" class="display" width="100%" cellspacing="0" style="background:#3399ff">
        <thead >
            <tr>
               <th>Artist Name</th>
                    <th>Artist Age</th>
                    <th>Artist Bio</th>
                    <th>Image</th>
                 
            </tr>
        </thead>
        
        <tbody>
              <%                for (Artist art : artists) {
                %>
                <tr>



                    <td><%=art.getArtistName()%></td>
                    <td><%=art.getArtistAge()%></td>
                    <td><%=art.getArtistBio()%></td>
                    
                    <td> <img src="<%=art.getArtistPicture()%>" alt="" height="100" width="120"></td>
                    
                </tr>
                <%
                    }
                %>
        </tbody>
                
                
              
                
            </table>

             
             
             
             
             
             
             
             
             
             
             
             </div>
                 
         </div>
          <div class ="col-xs-12 col-sm-4 col-md-1">
              <div class ="customDIV">  </div></div>
      
    </div>
         <%
                } else if (userType.equals("admin")) {
                %>
                <a href="adminMenu.jsp">Admin Menu</a>
                <%
                }
            
        %>
        <% }%>
        
        
          <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        
       
        <script>
    		$(document).ready(function(){
				$("[rel='tooltip']").tooltip();
			});
		</script>
     
    </body>
</html>


