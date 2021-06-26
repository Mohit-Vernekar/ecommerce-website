<%-- 
    Document   : signup1
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
    $('#frmsignup1').formValidation({
       
        framework: 'bootstrap',
         container: 'tooltip',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             
            txtotp1: {
                validators: {
                    notEmpty:{
                         message: 'Please enter OTP value.'
                    }
                   
                }
            }
            
        }
          
    });
});
        </script>
    </head>
    <body>
       
        <div class="row" style="padding-top:20px" >
         <div class="col-md-4 col-md-offset-4" >
           ${errormsg}
             <legend style="border-bottom:2px solid">Enter OTP value</legend>
                  <form role="form" name="frmsignup1" id="frmsignup1" action="NewUser1" method="post"  >
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtotp1" placeholder="Input OTP here:" ${autofocus} ${disabled} >
                    </div>
                           <input type="hidden"  name="fname" value="${fname}">  
                            <input type="hidden"  name="lname" value="${lname}">
                             <input type="hidden"  name="mobile" value="${mobile}">
                              <input type="hidden"  name="emailid" value="${emailid}">
                             
                               <input type="hidden"  name="otpvalue" value="${otp}" >
                               <input type="hidden"  name="password" value="${password}" >
                    <div class="form-group ">
                        <button type="submit"  class="btn btn-default"  ${disabled} style="background-color: #333300;color:white"  >Submit</button>
                    </div>
              </form>                            
            </div>
    </div>
      
    </body>
</html>
