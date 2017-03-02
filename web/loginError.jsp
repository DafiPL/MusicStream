<%-- 
    Document   : loginError
    Created on : 04-Feb-2017, 17:10:42
    Author     : Dafi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dtos.Member"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
            // Get the error message variable out of the session
            Object msg = session.getAttribute("userEntryError");
            // Cast it to a String so we can use it
            String error = (String) msg;
            // Display the message
  
%>

        <div> <%=error%> </div>
        
        
        <%
            // We have finished with the results of this action
            // so now we can remove the value from the session
            session.removeAttribute("userEntryError");
            // This makes sure that old error messages 
            // don't mistakenly get printed out later
%> 



<div><a href="Register.jsp">Back to register</a></div>
<div><a href="login.html">back to login</a></div>
    </body>
</html>
