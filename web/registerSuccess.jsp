<%-- 
    Document   : LoginSuccess
    Created on : 02-Feb-2017, 12:09:36
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
    <a href="login.html">log in</a>
  <body>

         <%
           
            Object mem = session.getAttribute("regInfo");
            Object passWord = session.getAttribute("theGeneratedPassword");
                if(mem !=null)
                {
                    Member m = (Member) mem;
                    String passwordGenerated = (String) passWord;
                

        %>
        <h1>Your Information</h1>
        <h1>Name : </h1>
        <h2>Welcome <%=m.getUsername()%></h2>
        <h1>Password</h1>
        <h2>Your Generated Password Is :  <%=passwordGenerated%> Please save it!</h2>
        
  
            
            <%}

%>

       
    </body>
</html>
