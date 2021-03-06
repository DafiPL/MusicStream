<%@page import="Dtos.Artist"%>
<%@page import="Daos.ArtistDao"%>
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

            String userType = member.getUserType();
            if (userType.equals("user")) {
        %>
       
            <%
        
           AlbumDao albumDao = new AlbumDao("musicdb");
            ArrayList<Album> albums = albumDao.getAllAlbums();
              ArtistDao artDao = new ArtistDao("musicdb");
            ArrayList<Artist> artists = artDao.getAllArtists();
        
         

            
          
    %>
          <%@ include file="headerLoggedIn.jsp" %>

          <div class="row">
        <div class ="col-xs-12 col-sm-4 col-md-3">
            <div class ="customDIV">
                

            
            
            
            </div>
                
        </div>
        
        
        
        
        
         <div class ="col-xs-12 col-sm-4 col-md-7">
             <div class ="customDIV" style ="background: white">
             
                 <table id="example" class="display" width="100%" cellspacing="0" style="background:#3399ff">
        <thead >
            <tr>
               <th>Album ID</th>
                    <th>Album Name</th>
                    <th>Album Price</th>
                    <th>Album Stock</th>
                    <th>Format</th>
                    <th>Release Date</th>
                    <th>Cover</th>
                    <th>BUY NOW!!!</th>
            </tr>
        </thead>
        
        <tbody>
              <%                for (Album a : albums) {
                %>
                <tr>



                    <td><%=a.getAlbumID()%></td>
                    <td><%=a.getAlbumName()%></td>
                    <td><%=a.getAlbumPrice()%></td>
                    <td><%=a.getAmountInStock()%></td>
                    <td><%=a.getAlbumFormat()%></td>
                    <td><%=a.getReleaseDate()%></td>
                    <td> <img src="<%=a.getAlbumImage()%>" alt="" height="42" width="42"></td>
                      <td>   <form action="FrontController" method="post">
                       



                        <div class="form-group ">
                            <input type="hidden"  name="albumName" id="albumName" value ="<%=a.getAlbumID()%>"/>
                            <input style ="width: 100%; height: 40px; color: black;" class ="a" type="submit" value="Buy" />
                            <input type="hidden" name ="action" value="albumDetail" />
                        </div>

                    </form></td>
                </tr>
                <%
                    }
                %>
        </tbody>
                
                
              
                
            </table>

             
             
             
             
             
             
             
             
             
             
             
             </div>
                 
         </div>
          <div class ="col-xs-12 col-sm-4 col-md-2">
              <div class ="customDIV"> </div></div>
      
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


