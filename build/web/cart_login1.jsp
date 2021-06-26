<%-- 
    Document   : displaytrucks
    Created on : March 26, 2018
    Author     : Mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Satish Interiors</title>
        <%@include file="head.jsp" %>
        <script>
            
           
         

       
        </script>
    </head>
    <body>
      <%
        
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        if((String)session.getAttribute("A1")==null)
               {
           if((String)session.getAttribute("guest")==null)
               {
               
               response.sendRedirect("home.jsp");
                return;
               }
       }
       
        %>
        <div class="container ">
       
            <h3 style="display: inline-block">Review your order</h3>   <a href="displayproducts.jsp" class="btn btn-primary pull-right"><i class="fa fa-angle-double-left"></i> Continute to Shop</a>            
            
           
                ${p}
           
        </div>
        
        
    </body>
</html>
