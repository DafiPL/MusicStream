<%-- 
    Document   : showSearchMemberResult
    Created on : 02-Dec-2016, 13:56:27
    Author     : James
--%>

<%@page import="Dtos.Member"%>
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
            ArrayList<Member> members = (ArrayList<Member>) session.getAttribute("showSearchMember");
            
            
            if (members != null && !members.isEmpty())
            {
        %>
        <table>
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>User Type</th>
                <th>Password</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address Line 1</th>
                <th>Town</th>
                <th>Country</th>
                <th>SaltGen</th>
                <th>Expiry Date</th>
                
                
            </tr>
            <%
                // loop
                for (Member m : members)
                {
            %>
            <tr>
                <td><%=m.getUsername()%></td>
                <td><%=m.getFirstName()%></td>
                <td><%=m.getLastName()%></td>
               <td><%=m.getUserType()%></td>
                <td><%=m.getPassword()%></td>
                <td><%=m.getPhone()%></td>
                <td><%=m.getEmail()%></td>
                <td><%=m.getAddressLine1()%></td>
                <td><%=m.getTown()%></td>
                <td><%=m.getCounty()%></td>
                <td><%=m.getSalt()%></td>
                <td><%=m.getExpiryDate()%></td>
               
                
            </tr>
            <%
               
                }
            }   else
            {
                out.println("No member found. Please try again.");
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
