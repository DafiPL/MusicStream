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
            ArrayList<Song> songs = (ArrayList<Song>) session.getAttribute("showSearchSong");
            
            
            if (songs != null && !songs.isEmpty())
            {
        %>
        <table>
            <tr>
                <th>songID</th>
                <th>albumID</th>
                <th>song Name</th>
                <th>song Release</th>
                
                
            </tr>
            <%
                // loop
                for (Song s : songs)
                {
            %>
            <tr>
                <td><%=s.getId()%></td>
                <td><%=s.getAlbum_id()%></td>
                <td><%=s.getSongName()%></td>
                <td><%=s.getSongRelease()%></td>
                

            </tr>
            <%
               
                }
            }   else
            {
                out.println("No song found. Please try again.");
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
