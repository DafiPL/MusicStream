<%-- 
    Document   : LoginSuccess
    Created on : 01-Feb-2017, 12:09:36
    Author     : Dafi
--%>

<% session = request.getSession(false);
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Css/common.css" rel="stylesheet" type="text/css"/>
<%@page import="Dtos.Member"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%

            String userType = member.getUserType();
            if (userType.equals("user")) {
        %>
            <form action="FrontController" method="post">
            
              <h1>Welcome <%=member.getUsername()%>, This is your profile!</h1>
         
        Your current details are -
        <br>Username : <%=member.getUsername()%>
        <br>Password : <%=member.getFirstName()%>
        <br>User_Type : <%=member.getLastName()%>
        <br>Email : <%=member.getUserType()%>
        <br>Address : <%=member.getPhone()%>
        <br>Address : <%=member.getEmail()%>
        <br>Address : <%=member.getAddressLine1()%>
        <br>Address : <%=member.getTown()%>
        <input class= "a"type="submit" value="Logout Here"/>
            <input type="hidden" name="action" value="logout"/>
        <br>
        <br>
        <br><a href="placeOrder.jsp">Place an Order</a><br>
        <a href="updateAccount.jsp">Update Your Account</a><br>
        <a href="index.jsp">View Albums</a><br>
      
            
            
        </form>

     
        


        

       
        <a href="FrontController?action=logout">LogOut</a>


        <%
                } else if (userType.equals("admin")) {
                %>
                <a href="adminMenu.jsp">Admin Menu</a>
                <%
                }
            
        %>



    </body>
</html>
<%
    }
%>
