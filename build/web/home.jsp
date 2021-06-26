<%-- 
    Document   : home
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
    $('#frmsignup').formValidation({
       
        framework: 'bootstrap',
        container:'popover',
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
            txtemailid: {
                validators: {
                    notEmpty:{
                         message: 'The email ID is required!'
                    },
                    emailAddress: {message: 'Invalid email ID format!'}
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
            },
            txtpassword: {
                validators: {
                    notEmpty: {
                        message: 'The password value is required!'
                        
                    },
                    identical: {
                        field: 'txtconfirmpassword',
                        message: 'The password and confirm password values do not match!'

                    },
                    different: {
                        field: 'txtfname,txtlname' ,
                        message: 'The password cannot be the same as first name and last name'
                       
                    },
                   
                     
                                       
                    stringLength: {
                        min: 8,
                        message: 'The password must be atleast 8 characters long!'
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
      <%
           session=request.getSession(true);
          
         %>

        <div class="container-fluid" style="padding-top: -60px">
        <div class="row" >
             <div class="col-md-8">
                 <div class="container-fluid">
                     <div id="myCarousel" class="carousel slide" data-ride="carousel" >
                                                
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                          <li data-target="#myCarousel" data-slide-to="1"></li>
                          <li data-target="#myCarousel" data-slide-to="2"></li>
                          <li data-target="#myCarousel" data-slide-to="3"></li>
                          <li data-target="#myCarousel" data-slide-to="4"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active"  >
                            <img src="images/img1.jpg" alt="Chania" style="height:600px;width:100%">
                          </div>

                          <div class="item" >
                              <img src="images/img2.jpg" alt="Chania" style="height:600px;width:100%"> 
                          </div>

                          <div class="item">
                              <img src="images/img3.jpg" alt="Flower" style="height:600px;width:100%">
                          </div>
                          
                          <div class="item">
                              <img src="images/img4.jpg" alt="Flower" style="height:600px;width:100%">
                          </div>
                            
                          <div class="item">
                              <img src="images/img5.jpg" alt="Flower"  style="height:600px;width:100%">
                          </div>
                        </div>
    
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"  ></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right " aria-hidden="true"  ></span>
                        <span class="sr-only">Next</span>
                      </a>
                </div>
            </div>
             </div>
             <%
                if(session.getAttribute("A1")==null)
               {
             %>
                
               <div class="col-md-4">
                   ${errormsg}
                 <legend>Register New User</legend>
                 <div class="well">
                <form role="form" name="frmsignup" id="frmsignup" action="NewUser" method="post">
                    <div class="form-group">
                        <label for="txtfname">First Nameee:</label>
                        <input type="text" class="form-control" name="txtfname" placeholder="Enter first name" value="${fname}">
                    </div>
                    <div class="form-group">
                        <label for="txtlname">Last Name:</label>
                        <input type="text" class="form-control" name="txtlname" placeholder="Enter last name"  value="${lname}">
                    </div>
                    <div class="form-group">
                        <label for="txtemailid">Email ID:</label>
                        <input type="email" class="form-control" name="txtemailid"  placeholder="Enter email ID" ${autofocus}>
                    </div>
                    <div class="form-group">
                        <label for="txtmobileno">Mobile no:</label>
                        <input type="tel" class="form-control" name="txtmobile" placeholder="Enter mobile no" maxlength="10"  value="${mobile}">
                    </div>
                    <div class="form-group">
                        <label for="txtpassword">Password:</label>
                        <input type="password" class="form-control" name="txtpassword" placeholder="Enter password" onCopy="return false" onPaste="return false">
                    </div>
                    <div class="form-group">
                        <label for="txtconfirmpassword">Confirm Password:</label>
                        <input type="password" class="form-control" name="txtconfirmpassword" placeholder="Enter confirm password" onCopy="return false" onPaste="return false">
                    </div>
                                      
                    <div class="form-group text-center  ">
                         <button type="submit" class="btn btn-default" id="register" style="background-color: #333300;color:white" >Register</button>
                    </div>
              </form>                            
               </div></div>
                        <%
                                               }
           %>
                                
        </div>
            
        </div>
       
      <div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header bg-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:red">Error</h4>
      </div>
      <div class="modal-body">
        <p style="color:red">Invalid User ID or Password</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>  

    </body>
</html>
