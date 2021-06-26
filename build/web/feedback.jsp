<%-- 
    Document   : feedback
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
         
       $('a[href="feedback.jsp"]').parent().addClass('active');
       $('a[href="feedback.jsp"]').css('color','black');
       
});
         
        
             
        
         
      $(document).ready(function() {
    $('#frmfeedback').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtname: {
                validators: {
                    notEmpty: {
                        message: 'The name is required!'
                        
                    },
                    
                    
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The name can only consist of alphabets!'
                    }
                }
            },
            
            txtemail: {
                validators: {
                    notEmpty:{
                         message: 'The email ID is required!'
                    },
                    emailAddress: {}
                }
            },
             txtphone: {
                validators: {
                    notEmpty: {},
                    digits: {},
                    phone: {
                        country: 'IN'
                    }
                }
            },
            txtfeedback: {
                validators: {
                    notEmpty: {
                        message: 'The feedback is required!'
                        
                    }
                    
                 }
            }
            
            
        }
          
    });
});
        
    </script>
    </head>
    <body>
        
        
  
   
    <div class="row"  >
         <div class="col-md-4 col-md-offset-4" >
         ${msg}
             <legend style="border-bottom:2px solid">Enter details</legend>
                  <form role="form" name="frmfeedback" id="frmfeedback" action="Feedback">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtname" placeholder="Enter name" >
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="txtemail" id="txtemail" placeholder="Enter email ID" >
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" name="txtphone" placeholder="Enter mobile no" maxlength="10"  >
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="5" name="txtfeedback" placeholder="Enter comments/feedback (max 500 chars)" maxlength="500"></textarea>
                    </div>
                                                          
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-success"  style="width:25%">Submit</button>
                    </div>
              </form>                            
            </div>
    </div>
</html>
