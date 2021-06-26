<%-- 
    Document   : aboutus
    Created on : March 26, 2018
    Author     : Mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Satish Interiors</title>
        <%@ include file="head.jsp" %>
        
        <script>
           
         $(document).ready(function(){
       
       $('a[href="aboutus.jsp"]').parent().addClass('active');
       $('a[href="aboutus.jsp"]').css('color','black');

});
</script>
    </head>
    <body>
        <body>
        
        
   <div class="row" >
      <div class="col-md-6 col-md-offset-3" style="margin-top: -40px" >
        <div class="page-header"><h1>About us</h1></div>
       <div class="well">
         Satish Interiors is an interior designing and furnishing company, founded by Mr. Arunkumar Vishwakarma. We provide you with a wide range of choices which best fits your interior designing and furnishing requirements.
       </div>
      </div>
    </div>
    </body>
</html>
