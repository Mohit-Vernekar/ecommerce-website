<%-- 
    Document   : forgotpassword
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
    $('#frmforgotpassword').formValidation({
       
        framework: 'bootstrap',
       
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtuserid: {
                validators: {
                    notEmpty:{
                         message: 'The user ID is required!'
                    },
                    emailAddress: {message: 'Invalid email ID format!'}
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
           <div class="well" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;width:420px;height: 170px" >  
        <div class="btn-group btn-breadcrumb">
            <a href="#" class="btn btn-default completed" style="font-weight:  bolder;">Basic Details</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder;">Enter OTP value</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder">New Password</a>
        </div>
	   
           
             
           <form role="form" name="frmforgotpassword" id="frmforgotpassword" action="ForgotPassword" style="padding-top: 10px"  >
               
               <div class="form-group "  >
                       <label for="txtuserid">Enter User ID:</label>
                        <input type="text" class="form-control" id="txtuserid" name="txtuserid" style="width:420px" placeholder="Enter UserID" ${autofocus}>
                </div>
                            
                   
                        <button type="submit" class="btn btn-success "> Next >></button>
                   
              </form>                            
            </div>
    </div>
       </div>
    </body>
    
</html>
