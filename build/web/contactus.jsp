<%-- 
    Document   : contactus
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
              $(document).ready(function(){
   
             $('a[href="contactus.jsp"]').parent().addClass('active');
             $('a[href="contactus.jsp"]').css('color','black');
             
             $('#e1').attr('href',"mailto:"+$('#e1').text())
        
});
         </script>
    </head>
    <body >
        
        
    <div class="row" >
        <div class="col-md-4 col-md-offset-3" style="margin-top: -40px">
        <div class="page-header"><h1>Customer support</h1></div>
       <div class="well">
           <i class="fa fa-envelope"></i> <b>Email</b><br/><br/>
           Please feel free to write to us on: <a id="e1">satishkumarvish432@gmail.com</a>
       </div>
        
        <div class="well">
           <i class="fa fa-phone"></i> <b>Phone</b><br/><br/>
           Talk to us on our 24hrs help line: <b>8286782900</b><br/>
           For complaints call: <b>7021422507</b><br/>
       </div>
        
        <div class="well">
           <i class="fa fa-home"></i> <b>Post</b><br/><br/>
           Maharashtra Hind Chawl<br/>
           Borivali(west), Mumbai-400092
       </div>
        </div>
        <div class="col-md-4" style="padding-top:80px;">
        <div class="card" style="height:200px">
  <img src="images/a1.jpg" alt="Mohit Vernekar" style="width:100%;height:300px">
  <div  style="background-color:white">
    <h4><b>Mohit Vernekar</b></h4> 
    <p>Architect & Engineer <br>
       at Satish Interiors</p> 
  </div>
</div>
        </div>
        
    </div>
    </body>
</html>
