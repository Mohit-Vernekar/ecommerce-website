<%-- 
    Document   : signout
    Created on : March 26, 2018
    Author     : Mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Satish Interiors</title>
    </head>
    <body>
        <%
            session.removeAttribute("A1");
            session.removeAttribute("A2");
          
            response.sendRedirect("home.jsp");
        %>
    </body>
</html>
