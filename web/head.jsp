<%-- 
    Document   : head
    Created on : March 26, 2018
    Author     : Mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Satish Interiors</title>
       
    
        
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/formValidation.css"/> <%--used for validation--%>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css"/> 
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/breadcrumbs.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-magnify.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/magnify.css">
        
         <script src="bootstrap-3.3.7-dist/js/jquery-3.1.1.js"></script>
         <script src="bootstrap-3.3.7-dist/js/jquery-1.12.0.js"></script>
         <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
         <script src="bootstrap-3.3.7-dist/js/moment.js"></script>
         <script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js"></script>
         <script src="bootstrap-3.3.7-dist/js/formValidation.js"></script> <%--used for validation--%>
         <script src="bootstrap-3.3.7-dist/js/bootstrap_1.js"></script>  <%--used for validation--%>
         <script src="bootstrap-3.3.7-dist/js/bootstrap-magnify.js"></script>
        
       <script>
           
           $(document).ready(function(){
                
                 
                  var m=window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
                 
                 
                  if(m=='cart_login.jsp')
                  {
                         
                     $('#check_cart').attr('value','cart');
                   
                  }
                  
           });

           
           $(document).ready(function(){
   
        $.get("GetProductType",function(data, status){
       
        var res = data.split("-");
        
      
        for (var i in res) 
        {
                if(res[i]!='')
                {
                 
                    $("#u1").append("<li><a href='displayproducts.jsp?txtsearch="+res[i]+"'>"+res[i]+"</a></li>");
                   
                }
            
           
        }
        
    });
    
    $(document).ready(function(){
      $("#vp").click(function(){
       $(this).css('color','black');
       $(this).parent().addClass('active');
             
      });
  });
        
   
});

           $(document).ready(function() {
    $('#frmlogin').formValidation({
       
        framework: 'bootstrap',
         container: 'tooltip',
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
                         message: 'The email ID is required!'
                    },
                    emailAddress: {message: 'Invalid email ID format!'}
                }
            },
            txtpassword: {
                validators: {
                    notEmpty: {
                        message: 'The password value is required!'
                        
                    }
                 }
            }
            
        }
          
    });
});

            function call1()
             {
                 $("#a1").hide();
             }

             
$(document).ready(function(){
    $("#login").click(function(){
        $("#modal_login").modal();
    });
});


           $(document).ready(function() {
    $('#frmsearch').formValidation({
       
        framework: 'bootstrap',
         container: 'popover',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        container:'popover',
        fields: {
             
            txtsearch: {
                validators: {
                    notEmpty:{
                         message: 'Enter some value!'
                    }
                }
            }
            
        }
          
    });
});

</script>
<style>
    
    .row {
        height: 130px;
       
      }
    @media screen and (max-width: 1200px) {
      #r1 {
        height: auto;
     
      }
      
    }
</style>


    </head>
    
    <body>
       <%
        int count=0;
            session=request.getSession(false);
            java.util.Enumeration e=session.getAttributeNames();
            while(e.hasMoreElements())
            {
                String n=(String)e.nextElement();
                if(n.charAt(0)=='P')
                {
                    count++;
                }
            }    
        %>

       
             <div class="container-fluid" >
                 <div class="row" style="background-color:#c0a16b;color :white  ;padding-top: 20px;" id="r1">
                <div class="col-md-3">
            <p style="font-size:40px;font-weight:bolder;font-style:normal;font-family:cursive;padding-left:1%"><a href="home.jsp" style="text-decoration: none;color:white">Satish Interiors</a></p>
           </div>
                
              <%
                if(session.getAttribute("A1")!=null && ((String)session.getAttribute("A1")).equalsIgnoreCase("admin@satishinteriors.com"))
                {
              %>
              
              <div class="col-md-2 col-md-offset-7" id="d2">
                  
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><p style="text-align: center;cursor: pointer;"><i class="fa fa-2x fa-user-secret" style="color:white"></i></p>
                <p style="text-align: center;font-size: 15px;font-weight: bolder;cursor: pointer;color:white">Hello,<%=session.getAttribute("A2") %> <i class="fa fa-angle-down"></i></p></a>
              <ul class="dropdown-menu dropdown-menu-right">
                  <li><a href="addnewproduct.jsp">Add Product</a></li>
                  <li><a href="viewproduct.jsp">View/Remove Product</a></li>
                  <li><a href="modifyproduct.jsp">Edit Product</a></li>
                  <li><a href="vieworders.jsp">View Orders</a></li>
                  <li><a href="viewcustomer.jsp">View Customers</a></li>
                  <li><a href="viewfeedback.jsp">View Feedback</a></li>
                 
                   <li><hr></hr></li>
                   <li><a href="changepassword.jsp" style="margin-top:-10px">Change Password</a></li>
                   <li><a href="modifyprofile.jsp">Edit Profile</a></li>
                   <li ><a href="signout.jsp" >Sign out</a></li>
            </ul>  
              </div> 
              <%
                }
                else if(session.getAttribute("A1")!=null)
                {
                    
              %>
               <div class="col-md-2 col-md-offset-5" id="d2">
                  <form method="post" action="Cart" style="display:inline-block;padding-right: 30px">
                       <input type="hidden" name="cartval" value="cart"></input>
                <button type="submit" class="glyphicon glyphicon-shopping-cart" style="border:none;font-size:50px;cursor: pointer;background-color:#c0a16b"><span class="badge" style="margin-left:-30px;margin-top: -35px;background-color:whitesmoke;color:black ;font-size: 12px"><%= count %></span></button>
                   </form>
            <a class="dropdown-toggle" style="display:inline-block" data-toggle="dropdown" href="#"><p style="text-align: center;cursor: pointer;color:white"><i class="fa fa-2x fa-user-circle-o"></i></p>
                <p style="text-align: center;font-size: 15px;font-weight: bolder;cursor: pointer;color:white">Hello,<%=session.getAttribute("A2") %> <i class="fa fa-angle-down"></i></p></a>
              <ul class="dropdown-menu dropdown-menu-right">
                  <li><a href="vieworders.jsp">View Orders</a></li>
                  <li><a href="viewfeedback.jsp">View Feedback</a></li>
                   <li><hr></hr></li>
                   <li><a href="changepassword.jsp" style="margin-top:-10px">Change Password</a></li>
                   <li><a href="modifyprofile.jsp">Edit Profile</a></li>
                   <li ><a href="signout.jsp" >Sign out</a></li>
            </ul>  
              </div> 
             <% 
                }
                else
                {    
               %>
    
                
                <div class="col-md-3 col-md-offset-6">
                    <form method="post" action="Cart" style="display:inline-block;padding-right: 30px">
                       <input type="hidden" name="cartval" value="cart"></input>
                <button type="submit" class="glyphicon glyphicon-shopping-cart" style="border:none;font-size:50px;cursor: pointer;background-color: #c0a16b"><span class="badge" style="margin-left:-30px;margin-top: -35px;background-color:whitesmoke;color:black ;font-size: 18px"><%= count %></span></button>
                   </form>
                   
           <form action="Login" id="frmlogin" method="post" style="display:inline-block">
  <div class="form-group">
        <input type="email" class="form-control input-sm" id="txuserid" name="txtuserid" placeholder="User ID/Email ID">
  </div>
  <div class="form-group" style="margin-top:-10px;margin-bottom: 5px">
      <input type="password" class="form-control input-sm" id="txtpassword" name="txtpassword" placeholder="Password"> 
      
  </div>
               <input type="hidden" id="check_cart" name="check_cart" ></input>
    <button type="submit" class="btn btn-default" style="height: 30px;font-size: 10px">Submit</button>
    <a href="forgotpassword.jsp" style="color:white;padding-left: 30px">Forgot password</a></li>
</form>
                    
                </div>
                <%
                    }
                 %>
            </div>
             </div>     
                     <nav class="navbar navbar-default" style=";background-color:#c0a16b;" >
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li><a class="glyphicon glyphicon-home" href="home.jsp" style="color:white;font-weight: bold;font-size: 18px">    </a></li>
      <li><a href="aboutus.jsp" style="color:white">Company profile</a></li>
      <li><a href="contactus.jsp" style="color:white">Contact us</a></li>
      <%
          if(session.getAttribute("A1")!=null && ((String)session.getAttribute("A1")).equalsIgnoreCase("admin@satishinteriors.com"))
                {
      %>
                
      <li><a href="feedback.jsp" style="color:white;display: none"  >Suggestions/Feedback</a></li> 
      <%
          }
          else
        {
                    

%>
      <li><a href="feedback.jsp" style="color:white;">Suggestions/Feedback</a></li> 
      <%
          }
%>
      <li><a href="workwithus.jsp" style="color:white">Careers</a></li>
      
      <%
          if(session.getAttribute("A1")!=null && ((String)session.getAttribute("A1")).equalsIgnoreCase("admin@satishinteriors.com"))
                {
      %>
                
      <li class="dropdown">
        <a id="vp" class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:white;display: none">View Products
        <span class="caret"></span></a>
        <ul class="dropdown-menu" id="u1">
         
        </ul>
      </li> 
      <%
          }
          else
        {
                    

%>
      <li class="dropdown">
        <a id="vp" class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:white">View Products
        <span class="caret"></span></a>
        <ul class="dropdown-menu" id="u1">
         
        </ul>
      </li> 
      <%
          }
%>
      

    </ul>
      <form class="navbar-form navbar-right" action="displayproducts.jsp" style="padding-right:40px" id="frmsearch">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search" name="txtsearch">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>

  </div>
</nav>
                 

        
      
    </body>
    
      
</html>
