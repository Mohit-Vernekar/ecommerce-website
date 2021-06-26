<%-- 
    Document   : newpaper
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
            ${msg}
        });


           
            
            $(document).ready(function() {
    $('#frmchangepassword').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {

	     txtoldpassword: {
                validators: {
                    notEmpty: {
                        message: 'The password value is required!'
                        
                    }
                 }
            },

             txtnewpassword: {
                validators: {
                    notEmpty: {
                        message: 'The new password value is required!'
                        
                    },
                    different: {
                        field: 'txtoldpassword',
                        message: 'Old Password and new password cannot be the same!'

                    },
                    identical: {
                        field: 'txtreenterpassword',
                        message: 'The new password and confirm password values do not match!'

                    },
                    stringLength: {
                        min: 8,
                        message: 'The password must atleast 8 characters long!'
                    }
                 }
            },
            txtreenterpassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password value is required!'
                        
                    },
                    identical: {
                        field: 'txtnewpassword',
                        message: 'The new password and confirm password values do not match!'

                    },
                    stringLength: {
                        min: 8,
                        message: 'The password must be atleast 8 characters long!'
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
            response.sendRedirect("home.jsp");
            return;
               }
       
        %>
      <div class="container-fluid" >
         <div class="row" >
             
             <div class="col-md-offset-4 col-md-4">
                 
                 <div class="panel panel-danger" >
                   <div class="panel-heading" style="font-weight: bolder;">Change Password</div>
                    <div class="panel-body" >
                    <form role="form"  id="frmchangepassword" action="ChangePassword" method="post"  >
                                        <div class="form-group">
                                            <label for="txtoldpin">Enter old password:</label>
                                            <input type="password" class="form-control" name="txtoldpassword" >
                                        </div>
                                     <div class="form-group ">
                                            <label for="txtnewpin">Enter new password:</label>
                                            <input type="password" class="form-control" name="txtnewpassword" >
                                        </div>
                                     <div class="form-group">
                                            <label for="txtreenterpin">Re-enter new password:</label>
                                            <input type="password" class="form-control" name="txtreenterpassword" >
                                        </div>
                                               
                                        <div class="form-group text-center">
                                            <button type="submit"  class="btn btn-success">Change</button>
                                        </div>
                                  </form>
            </div>
             
         </div>
         </div>
<div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header bg-info">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" >${m2}</h4>
      </div>
      <div class="modal-body">
        <p>${m1}</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>  

    </body>
</html>





