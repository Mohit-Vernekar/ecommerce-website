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
       
       $('a[href="workwithus.jsp"]').parent().addClass('active');
       $('a[href="workwithus.jsp"]').css('color','black');
       $('#e1').attr('href',"mailto:"+$('#e1').text())
       

});
</script>
    </head>
    <body>
        <body>
        
        
   <div class="row" >
      <div class="col-md-6 col-md-offset-3" style="margin-top: -40px" >
        <div class="page-header"><h1>Work with us</h1></div>
       <div class="well">
          We are always in a search of new talent and hard working people to enable us to expand our team.<br/>
          So if you are keen to work with us please email us your resume on the following email ID <a id="e1">satishkumarvish432@gmail.com</a> <br/>
          Our team would get back to you shortly.
       </div>
      </div>
    </div>
    </body>
</html>
