<%-- 
    Document   : addproduct
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
   
        $.get("GetProductType",function(data, status){
       
        var res = data.split("-");
        
      
        for (var i in res) 
        {
                if(res[i].trim()!='')
                {
                    var option = new Option(res[i].trim(), res[i].trim())
                    $("#type").append(option);
                }
            
           
        }
        
    });
        
   
});
        
        $(document).ready(function(){
    $("#btn_reset").click(function(){
          $("#txtpname").val("");
          $("#txtpcode").val("");
           $("#txtdesc").val("");
           $("#txtprice").val("");
         
           $("#img1").removeAttr("src");
           $("#txtpcode").removeAttr("readonly");
           $("#img1").css("display","none");
    });
});



    
    
    
           
            
           
  
        
        $(document).ready(function(){
           
         $("#txtpcode").keyup(function(){
       
        var l=$("#txtpcode").val().length;
        var pcode=$("#txtpcode").val()
        if( l == 10)
        {
            $.get("GetProduct?pcode="+pcode,function(data, status){
                
               if(data!="")
               {
                    var res = data.split("-");  
                    $("#txtpname").val(res[0]);
                    $("#txtdesc").val(res[1]);
                    $("#type").val(res[2].trim());
                    $("#txtprice").val(res[3]);
                   
                    $("#img1").attr("src","GetProductImage?pcode="+pcode);
                    $("#txtpcode").attr("readonly", "true");
                    $("#img1").css("display","");
                    $("#msg").text("");
               }
               else
               {
                       $("#msg").text("Invalid product id.");
                       
                  $("#txtpname").val("");
                  $("#txtdesc").val("");
                   $("#txtprice").val("");
                      
                    $("#img1").removeAttr("src");
               }
            
        
    });
        }
        else
            {
                 $("#txtpname").val("");
                  $("#txtdesc").val("");
                   $("#txtprice").val("");
                      
                    $("#img1").removeAttr("src");
            }
    });
});
        
       

       

function call()
        {
           if($('#img1').attr('src') != "")
            {
              
                return true;
            }
            else
                {
                    return false;
                }

        }

        $(document).ready(function() {
    $('#frmeditproduct').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtpname: {
                validators: {
                    notEmpty:{
                         message: 'Value is required!'
                    }
                }
            },
            
            txtdesc: {
                validators: {
                    notEmpty:{
                         message: 'Value is required!'
                    }
                }
            },
            
	   
	     txtprice: {
                validators: {
                    notEmpty: {
                        message: 'Value is required!'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 1,
                        message: 'The value must be greater than or equal to 1!'
                    }
                 }
            },
            txtqty: {
                validators: {
                    notEmpty: {
                        message: 'Value is required!'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 1,
                        message: 'The value must be greater than or equal to 1!'
                    }
                 }
            },
            
            txtpic: {
                validators: {
                    callback: {
                  
                        callback: function(value, validator, $field) {
                                                
                            
                                return {
                                    valid: call(),
                                    message:'Please select an image.'
                                }
                            
                           
                   
                    
                    
                }
            }
                 }

            
           
            
        }
        }
          
    });
});
        $(document).ready(function() {
            ${msg}
        });
        
        
        $(document).ready(function(){
            $("#txtpic").change(function(event){
                  
               
                    var tmppath1 = URL.createObjectURL($(this).get(0).files[0]);
                   $("#img1").fadeIn("fast").attr('src',tmppath1 )
                   $("#h1").val("false");
                   
            });
        });
      
    </script>
    </head>
    <body>
      
       

        <div class="container-fluid">
        <div class="row">
            <div class="col-md-offset-4 col-md-4">
       <legend>Modify Product Details</legend>
      <div class="well" >
      <form id="frmeditproduct" class="form-horizontal" action="ModifyProduct" method="post" enctype="multipart/form-data">
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtpcode">Product Code:</label>
                 <div class="col-md-6">
                   <input type="text" class="form-control" id="txtpcode" name="txtpcode">
                    <p id="msg" style="color:#a94442"></p>
                    </div>
                
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtpname">Product Name:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtpname" name="txtpname">
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtdesc">Product Description:</label>
                 <div class="col-md-6">
                   <textarea class="form-control" rows="3" id="txtdesc" name="txtdesc"></textarea>
                 </div>
          </div>
          <div class="form-group">
                <label class="control-label col-md-4" for="type">Type:</label>
                 <div class="col-md-6">
                     <select class="form-control" id="type" name="type">
                                                
                     </select>
                 </div>
          </div>
          
                
          <div class="form-group">
                <label class="control-label col-md-4" for="txtprice">Price:</label>
                 <div class="col-md-6">
                     <div class="input-group">
                         <span class="input-group-addon"><i class="fa fa-rupee"></i></span>
                        <input type="text" class="form-control" id="txtprice" name="txtprice">
                    
                    </div>
                 </div>
          </div>
          
          
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtpic">Select pic:</label>
                 <div class="col-md-6">
                       <label class="btn btn-default" style="width:100%;height:35px">
                           Browse <input type="file" style="opacity:0;"  id="txtpic" name="txtpic"></input>
                        </label>
                     <img id="img1" class="zoom" style="width:75px;height: 75px;display:none">
                    
                       
                 </div>
          </div>          

          <input type="hidden" name="h1" id="h1" value="true">

          <div class="form-group"> 
            <div class="col-md-offset-2 col-md-4">
              <button type="submit" class="btn btn-primary btn-block" ><i class="fa fa-plus-circle"></i> Save</button>
            </div>
              <div class="col-md-4">
             <button type="button" id="btn_reset" class="btn btn-primary btn-block" ><i class="fa fa-ban"></i> Reset</button>
            </div>
          </div>
        
          
      </form>
  </div>
</div>
            </div>
        </div>
        

<div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" >Success</h4>
      </div>
      <div class="modal-body">
        <p>Product details saved successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
    <div id="div1">
        
    </div>
</html>
