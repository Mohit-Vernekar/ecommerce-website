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
                var n=$('#n').val();
             
             if(n!='null')
             {
                   
                 $("#dp").load("DisplayProducts?n="+encodeURIComponent(n));
                 
             }
             else
             {
                 
                 var n1=$('#n1').val();
                
                  $("#dp").load("DisplayProducts?n="+encodeURIComponent(n1));
             }
         
               
               
					
          
         });
         
          $(document).ready(function(){
               
                $("#close").click(function(){
                  $("#w1").animate({width: "0px"},{easing:'linear'});
                
                  setTimeout(
  function() 
  {
     $("#w1").css("display","none");
      $("#w2").css('width','50px');
      $("#w2").css("display","");
  }, 300);
                    
                    
                     
                });
                
                 $("#open").click(function(){
                  $("#w2").animate({width: "200px"},{easing:'linear'});
                 // alert('o');
                  setTimeout(
  function() 
  {
     $("#w2").css("display","none");
     $("#w1").css('width','200px');
      $("#w1").css('display','');
  }, 300);
                    
                });
                
            });

$(document).ready(function() {
 $('input[type=checkbox]').change(function() {
       
       var cr="";
       for(i=1;i<=4;i++)
       {
             
          if($('#c'+i).is(':checked')==true)
          {
              var v=$('#c'+i).val();
           
              cr=cr+"&c"+i+"="+v;   
             
              
          }
         
          
       }
         
       $("#dp").load("DisplayProducts?f=filter"+cr);
              
      
    });
    
   
});

      
        </script>
    </head>
    <body>
        <%
       
       
         session.setAttribute("guest", "guest");
               
       
        %>
        <input type="hidden" id="n" value="<%=request.getParameter("txtsearch")%>"></input>
        <input type="hidden" id="n1" value="<%= session.getAttribute("search")%>"></input>
        

        <div class="container" style="margin-left: 0px" >
            <div class="row">
                
                <div class=" col-md-2  well" id="w1" style="height:1000px;background-color: white;">
                    <i id="close" class="fa fa-close pull-right" style="font-size: 20px;cursor:pointer"></i>
                    <br/>
                    
                    
                        <input type="hidden" value="filter" name="filter"></input>
                         
                    
                    
                   
                    <div class="checkbox">
                        <label><input type="checkbox" value="1000" id="c1">less than 1000</label>
                     </div>
                    <div class="checkbox">
                        <label><input type="checkbox" value="1001-3000" id="c2">1001-3000</label>
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" value="3001-5000" id="c3">3001-5000</label>
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" value="5000" id="c4">more than 5000</label>
                    </div>
                  
                   
                </div>
                
                <div class="col-md-2 well" id="w2" style="height:1000px;background-color: white;display:none">
                    <i id="open" class="fa fa-bars pull-right" style="font-size: 20px;cursor:pointer"></i>
                </div>
               
                <div  id="dp" >         
                        
              
            </div>
        </div>
        </div>
        
        
    </body>
</html>
