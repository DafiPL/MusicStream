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
            ArrayList<Album> albums = (ArrayList<Album>) session.getAttribute("showSearchAlbum");
            
            
            if (albums != null && !albums.isEmpty())
            {
        %>
        <table>
            <tr>
                <th>albumID</th>
                <th>GenreID</th>
                <th>ArtistID</th>
                <th>Album Name</th>
                <th>Album Price</th>
                <th>Amount In Stock</th>
                <th>Album Format</th>
                <th>Release Date</th>
                
            </tr>
            <%
                // loop
                for (Album a : albums)
                {
            %>
            <tr>
                <td><%=a.getAlbumID()%></td>
                <td><%=a.getGenreID()%></td>
                <td><%=a.getArtistID()%></td>
               <td><%=a.getAlbumName()%></td>
                <td><%=a.getAlbumPrice()%></td>
                <td><%=a.getAmountInStock()%></td>
                <td><%=a.getAlbumFormat()%></td>
                <td><%=a.getReleaseDate()%></td>

            </tr>
            <%
               
                }
            }   else
            {
                out.println("No item found. Please try again.");
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
