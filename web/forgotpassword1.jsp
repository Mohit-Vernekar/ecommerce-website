<%-- 
    Document   : forgotpassword1
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
             
             
$(document).ready(function() {
    $('#frmforgotpassword2').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtotp1: {
                validators: {
                    notEmpty: {
                        message: 'Please enter OTP sent to your email ID to continue.'
                        
                    }
                    
                    
                   
                }
            
            }
            
        }
          
    });
});
         </script>
     
    </head>
    <body>
      
           
       <div class="row">
         <div class="col-md-4 col-md-offset-4" >
             ${errormsg}  
           <div class="well" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;width:380px;" >  
        <div class="btn-group btn-breadcrumb">
            <a href="#" class="btn btn-default" style="font-weight:  bolder; ">Basic Details</a>
            <a href="#" class="btn btn-default completed" style="font-weight:  bolder;">Enter OTP</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder">New Password</a>
        </div>
          
                  <div class="text-primary">${m}</div>
                  <form role="form"  id="frmforgotpassword2" action="ForgotPassword1" method="post" style="padding-top: 10px" >
                    <div class="form-group">
                         <label for="txtotp1">Enter OTP</label>
                        <input type="text" class="form-control" id="txtotp1" style="width: 370px" name="txtotp1" placeholder="Enter OTP value" maxlength="4" ${autofocus} >
                        <input type="hidden" name="otp" value="${otp}">
                        <input type="hidden" name="userid" value="${userid}">
                         
                    </div>
                     
                      <a href="forgotpassword.jsp" class="btn btn-success"> << Previous</a>
                      <button type="submit" style="float: right" class="btn btn-success">Next >></button>
                    
              </form>                            
            </div>
      
             
    </div>
    
    </body>
</html>
