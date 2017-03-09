<%-- 
    Document   : showSearchMemberResult
    Created on : 02-Dec-2016, 13:56:27
    Author     : James
--%>

<%@page import="Dtos.Genre"%>
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
            ArrayList<Genre> genres = (ArrayList<Genre>) session.getAttribute("showSearchGenre");
            
            
            if (genres != null && !genres.isEmpty())
            {
        %>
        <table>
            <tr>
                <th>GenreID</th>
                <th>Genre Name</th>
                
                
            </tr>
            <%
                // loop
                for (Genre g : genres)
                {
            %>
            <tr>
                <td><%=g.getId()%></td>
                <td><%=g.getGenre()%></td>
                

            </tr>
            <%
               
                }
            }   else
            {
                out.println("No genre found. Please try again.");
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
