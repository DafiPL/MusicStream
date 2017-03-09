<%-- 
    Document   : showSearchMemberResult
    Created on : 02-Dec-2016, 13:56:27
    Author     : James
--%>

<%@page import="Dtos.Artist"%>
<%@page import="Dtos.Song"%>
<%@page import="Dtos.Album"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        
    </head>
    <body>
        
            <br><br><br><br><br><br>
           <h1>User list</h1>
        <%
            // Get items list from session
            ArrayList<Artist> artists = (ArrayList<Artist>) session.getAttribute("showSearchArtist");
            
            
            if (artists != null && !artists.isEmpty())
            {
        %>
        <table>
            <tr>
                <th>ArtistID</th>
                <th>Artist Name</th>
                <th>Artist Age</th>
                <th>Artist Bio</th>
                <th>Artist Picture</th>
                
                
            </tr>
            <%
                // loop
                for (Artist a : artists)
                {
            %>
            <tr>
                <td><%=a.getArtistID()%></td>
                <td><%=a.getArtistName()%></td>
                <td><%=a.getArtistAge()%></td>
               <td><%=a.getArtistBio()%></td>
                <td><%=a.getArtistPicture()%></td>
                

            </tr>
            <%
               
                }
            }   else
            {
                out.println("No artist found. Please try again.");
            }
            %>
        </table>
         <script>
            //back to top function
        if ($('#back-to-top').length) {
    var scrollTrigger = 10, // px
        backToTop = function () {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > scrollTrigger) {
                $('#back-to-top').addClass('show');
            } else {
                $('#back-to-top').removeClass('show');
            }
        };
    backToTop();
    $(window).on('scroll', function () {
        backToTop();
    });
    $('#back-to-top').on('click', function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: 0
        }, 50);
    });
}
</script>
    </body>
    
</html>
