<%-- 
    Document   : displaytrucks
    Created on : Mar 26, 2018
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

$('body').on('click','#btn_checkout',function(e){
  var i=1;
  while(true)
  {
     if($('#quantity'+i).length)
     {
         if($('#quantity'+i).val().trim()=='')
        {
           $('#m'+i).text("Error in quantity!");
           e.preventDefault();
        } 
        i++;
     }
     else
     {
         break;
     }
     
  }
   
        
    });


$('body').on('click','.btn-success',function(){
  
    // Stop acting like a button
        //e.preventDefault();
        // Get the field name
        var x=$(this).attr('id');
       
        var q='#quantity'+x.substr(-1);
        var quantity = parseInt($(q).val());
      
        // If is not undefined
            
            $(q).val(quantity + 1);

          //e.submit();
            // Increment
        
    });

   $('body').on('click','.btn-danger',function(e){
        // Stop acting like a button
       // e.preventDefault();
        // Get the field name
        var x=$(this).attr('id');
      
        var q='#quantity'+x.substr(-1);
        var quantity = parseInt($(q).val());
               
        // If is not undefined
      
            // Increment
            if(quantity>1){
            $(q).val(quantity - 1);
         //   e.submit();
            }
            else
            {
               var m='#m'+x.substr(-1);
               $(m).text("Quantity cannot be less than 1!");
               e.preventDefault();
            }
    });
    
    $( "input[name='quantity']" ).keyup(function() {
    
         var x=$(this).attr('id');
       var q='#quantity'+x.substr(-1);
       
    
        var q= parseInt($(q).val());
        if(q=='')
     {
         
         
             var m='#m'+x.substr(-1);
               $(m).text("Quantity value is required!");

         
        
     }
     else  if(q<=0 || $.isNumeric(q)==false)
     {
        
         
             var m='#m'+x.substr(-1);
               $(m).text("Invalid quantity!");
                    
       
     }
      else  if(q>0)
            {
                $(this.form).submit();
            }
        
       
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
                
       
        %>
        <div class="container">
       
            <h3 style="display: inline-block">Shopping Cart</h3>   <a href="displayproducts.jsp?n=<%= session.getAttribute("search")%>" class="btn btn-primary pull-right"><i class="fa fa-angle-double-left"></i> Continue to Shop</a>            
            
           
                ${p}
           
        </div>
        
        
    </body>
</html>
