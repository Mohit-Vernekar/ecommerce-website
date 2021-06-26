<%-- 
    Document   : displaytrucks
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
          
              
               $("#products_table").load("ViewAllCustomers");
               
					
          
         });
         
         $(document).ready(function(){
  $("#txtsearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

        $(document).ready(function(){
               
                $("a[href='viewgoldproduct.jsp']").css('background-color', 'blue');
                
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

        <div class="container">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                     <div class="input-group">
    
          <input type="text" class="form-control" placeholder="Search" id="txtsearch">
          <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                     </div>
                    
                    <table  class='table table-bordered'><thead><tr><th>First Name</th><th>Last Name</th><th>Email ID</th><th>Mobile</th></tr></thead>
                        <tbody id='products_table'>
                            
                        </tbody>
                    </table>
                    
                   
                        <div id="d1">
                
            </div>
        </div>
            </div>
        </div>
       
    </body>
</html>
