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
         
              var e='<%=session.getAttribute("A1")%>'
              $.get("GetProfileDetails?emailid="+e,function(data, status){
                  
               if(data!="")
               { 
                    var res = data.split("-");
                    $("#txtfname").val(res[0]);
                    $("#txtlname").val(res[1]);
                    $("#txtmobile").val(res[2]);
                    $("#txtsecretquestion").val(res[3]);
                    $("#txtanswer").val(res[4]);
                    
               }
    
    });
    
         });
        
         
         $(document).ready(function() {
            ${msg}
        });
        
      $(document).ready(function() {
    $('#frmeditprofile').formValidation({
       
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
                        message: 'The first name can only consist of alphabets!'
                    }
                }
            },
            txtlname: {
                validators: {
                    notEmpty: {
                        message: 'The last name is required!'
                        
                    },
                    
                    
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The last name can only consist of alphabets!'
                    }
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
            response.sendRedirect("home.jsp");
            return;
               }
       
        %>
        <div class="container-fluid" style="padding-top: 20px">
        <div class="row"  >
         <div class="col-md-4 col-md-offset-4" >
          
             <div class="panel panel-danger" >
                     
                     <div class="panel-body">

                  <form role="form" name="frmeditprofile" id="frmeditprofile" action="ModifyProfile" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtfname" id="txtfname" placeholder="Enter first name" >
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtlname" id="txtlname" placeholder="Enter last name"  >
                    </div>
                    
                    <div class="form-group">
                        <input type="tel" class="form-control" name="txtmobile" id="txtmobile" placeholder="Enter mobile no" maxlength="10">
                    </div>
                    
                                     
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-danger" id="register" style=";font-weight: bolder;" disabled>Save changes</button>
                    </div>
              </form>                            
            </div>
             </div>
         </div>
                    <div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header bg-success">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" >Success</h4>
      </div>
      <div class="modal-body">
        <p>Changed saved successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
</html>
