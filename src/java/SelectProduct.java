import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class SelectProduct extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        String pcode=req.getParameter("pcode");

        try
        {
         
       
        Connection con=DB_Connection.get_DBConnection();
        
       
            PreparedStatement pst2=con.prepareStatement("select * from products where pcode=?");
            pst2.setString(1, pcode);
            ResultSet rs1=pst2.executeQuery();
                      
            String t="";
            
            if(rs1.next())
            {
                
                              

                t=t+"<div class='row' style=';height:100%'><div class='col-md-3 col-md-offset-1'> <div class='panel panel-danger'>  <div class='panel-body'>";
                t=t+"<img src='GetProductImage?pcode="+rs1.getString("pcode")+"'style='width:100%;height:200px' alt='Offer 1' class='img-responsive'></img></div></div></div>";
                            
                t=t+"<div class='col-md-3'><div style='font-size: 25px;font-family:monospace;'>"+rs1.getString("pname")+"</div>"; 
                
                t=t+"<div style='font-size: 25px;color:palevioletred;font-weight:bold;font-family:monospace;padding-top:10px;padding-bottom:10px'><i class='fa fa-rupee'></i>"+rs1.getString("price")+"/-</div>";
                t=t+"<div>Availability: <div style='font-family:monospace;font-size: 18px;color:green;'>In stock</div></div>";
                t=t+"<div style='font-size: 20px;font-weight:lighter;padding-top:3px;'>Quick Overview</div> <div style='font-size: 15px'>"+rs1.getString("description")+"</div><div style='padding-top:3px;padding-bottom:10px'>Type:"+rs1.getString("type")+"</div></div>";;
                t=t+"</div>";
                t=t+"<div class='row'>";
                t=t+"<form id='frmcart' class='form' name='frmcart' action='Cart' method='post'><div class='col-md-offset-1 col-md-3'><button type='submit' id='cart' class='btn btn-info ' style='font-size:15px;margin-right:25px'><span class='glyphicon glyphicon-shopping-cart'></span> Add to Cart</button> <button type='submit' id='buy' class='btn btn-info' style='font-size:15px'>  Purchase</button></div>";
                t=t+"<div class='col-md-2'><div class='input-group'> <span class='input-group-btn'><button type='button' id='minus' class='btn btn-danger btn-sm text-center'  ><span class='glyphicon glyphicon-minus' ></span></button></span><input type=text id='quantity' name='quantity' value='1' min='0' max='100' class='form-control text-center input-sm'> <span class='input-group-btn'><button type='button' id='plus' class='btn btn-success btn-sm'><span class='glyphicon glyphicon-plus' ></span></button></span></div></div>";
               
                t=t+"<input type='hidden' id='pcode' name='pcode' value='"+rs1.getString("pcode")+"'></form>";
                t=t+"<div id='m1' style='color: #a94442;padding-bottom: 10px '></div>";
                
                
                
               
                
                
                 pw.println(t);
            }
            else
            {
                
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Products to Display </style> ");

            }
                

        
       
       
      
        
       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}