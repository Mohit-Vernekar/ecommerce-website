<%-- 
    Document   : forgotpassword2
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
             txtpassword: {
                validators: {
                    notEmpty: {
                        message: 'The password value is required!'
                        
                    },
                    identical: {
                        field: 'txtconfirmpassword',
                        message: 'The password and confirm password values do not match!'

                    }
                 }
            },
            txtconfirmpassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password value is required!'
                    },
                    identical: {
                        field: 'txtpassword',
                        message: 'The password and confirm password values do not match!'

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
           <div class="well" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;width:413px;" >  
        <div class="btn-group btn-breadcrumb">
            <a href="#" class="btn btn-default " style="font-weight:  bolder; ">Basic Details:</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder;">Enter OTP:</a>
            <a href="#" class="btn btn-default completed" style="font-weight:  bolder;">New Password:</a>
        </div>
       
      
         
             
                  <form id="frmforgotpassword2" method="post" action="ForgotPassword2" style="padding-top: 10px"  >
                     <div class="form-group">
                          <label for="txtpassword">Enter new password:</label>
                        <input type="password" class="form-control" name="txtpassword" id="txtpassword" placeholder="Enter new password"  >
                    </div>
                    <div class="form-group">
                         <label for="txtconfirmpassword">Enter confirm password:</label>
                        <input type="password" class="form-control" name="txtconfirmpassword" id="txtconfirmpassword" placeholder="Re-enter password"  >
                    </div>
                     <div class="form-group ">
                        <button type="submit" class="btn btn-default" style=" width:25%;background-color: #333;color:white ">Submit</button>
                    </div>
                    <input type="hidden" name="userid" value="${userid}">
              </form>                            
            </div>
    </div>
    
    </body>
</html>
