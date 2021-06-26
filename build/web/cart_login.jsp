<%-- 
    Document   : signup
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
    $('#frmguest').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtfname: {
                validators: {
                    notEmpty: {
                        message: 'The first name is required!'
                        
                    },
                    
                    
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The first name can only consist of alphabets, numbers and underscore!'
                    }
                }
            },
           
           
            txtemailid: {
                validators: {
                    notEmpty:{
                         message: 'The email ID is required!'
                    },
                    emailAddress: {message: 'Invalid emailid format!'}
                }
            },
             txtmobile: {
                validators: {
                    notEmpty: {},
                    digits: {},
                    phone: {
                        country: 'IN'
                    }
                }
            }
            
        }
          
    });
});


        
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
        <div class="container-fluid" style="padding-top: 20px">
        <div class="row"  >
         <div class="col-md-6 col-md-offset-3" >
           ${errormsg}
             <div class="panel panel-info" >
                     <div class="panel-heading" style="font-weight: bolder;  "><i class="fa fa-user-plus" ></i> Continue as Guest user</div>
                     <div class="panel-body">

                  <form role="form" name="frmguest" id="frmguest" action=Cart_Login method="get">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtfname" placeholder="Enter first name" value="${fname}">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="txtemailid"  placeholder="Enter email ID" ${autofocus} >
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" name="txtmobile" placeholder="Enter mobile no" maxlength="10"  value="${mobile}">
                    </div>
                    <input type="hidden" name="btn_cart" value="guest">
                    <div class="form-group text-center">
                        <button type="submit"  class="btn btn-info" id="register" style="width:25%;font-weight: bolder;">Continue</button>
                    </div>
              </form>                            
            </div>
             </div>
                  
         </div>
                      
                    
                    
        </div>
    </body>
</html>
