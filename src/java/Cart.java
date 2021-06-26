import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Enumeration;
import p1.*;


public class Cart extends HttpServlet
{
    String pcode;
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        
        HttpSession hs=req.getSession(false);
        String v=req.getParameter("cartval");
        if(v==null)
        {
             pcode=req.getParameter("pcode");
        }
        
        String btn=req.getParameter("btn_delete");
        int q=0;
        System.out.println(btn);
        if(btn==null && v==null)
        {
            q=Integer.parseInt(req.getParameter("quantity").trim());
            hs.setAttribute(pcode,new Integer(q));
        }
        else if(btn!=null)
        {
             hs.removeAttribute(pcode);
        }
       
        Enumeration e=hs.getAttributeNames();
       
        
        Connection con=DB_Connection.get_DBConnection();
        String t="";
        
        try
        {
            
        int total=0;
        int i=1;
        while(e.hasMoreElements())
        {
            String n=(String)e.nextElement();
            if(n.charAt(0)=='P')
            {
                Integer q1=(Integer)hs.getAttribute(n);
                int qty=q1.intValue();

                PreparedStatement pst2=con.prepareStatement("select * from products where pcode=?");
                pst2.setString(1, n);
                ResultSet rs1=pst2.executeQuery();
                rs1.next();                          

                t=t+"<div class='row' style=';height:100%'> <div class='panel panel-danger'>  <div class='panel-body'><div class='col-md-3' style='margin-right:-150px'>";
                t=t+"<img src='GetProductImage?pcode="+rs1.getString("pcode")+"'style='width:100px;height:100px' alt='Offer 1' class='img-responsive'></img></div>";


                t=t+"<div class='col-md-2'><div style='font-size: 20px;font-family:monospace;font-weight:bolder'>"+rs1.getString("pname")+"</div>"; 


                t=t+"<div style='font-family:monospace;font-size: 12px;color:green;'>In stock</div>";
                t=t+"<div style='font-size: 18px;font-weight:lighter;padding-top:3px;'>Quick Overview</div> <div style='font-size: 15px'>"+rs1.getString("description")+"</div><div style='padding-top:3px;'>Weight: 200gm</div><div style='padding-top:3px;padding-bottom:10px'>Type:"+rs1.getString("type")+"</div></div>";;

                t=t+"<form id='frmqty' name='frmqty' action='Cart' method='post'> <input type='hidden' name='pcode' value='"+rs1.getString("pcode")+"' ><div class='col-md-2 col-md-offset-2'>Quantity<div class='input-group'> <span class='input-group-btn'><button type='submit' id='minus"+i+"' class='btn btn-danger btn-sm text-center'  ><span class='glyphicon glyphicon-minus' ></span></button></span><input type=text id='quantity"+i+"' name='quantity' value='"+qty+"' min='0' max='100'  class='form-control text-center input-sm'> <span class='input-group-btn'><button type='submit' id='plus"+i+"' class='btn btn-success btn-sm'><span class='glyphicon glyphicon-plus' ></span></button></span></div><div id='m"+i+"' style='color: #a94442;padding-bottom: 10px '></div></div></form>";

                t=t+"<div class='col-md-2' style='padding-left:100px' ><div style='font-size: 16px;font-weight:bold;font-family:monospace;padding-bottom:10px'><i class='fa fa-rupee'></i>"+rs1.getString("price")+"/-</div></div>";
                t=t+"<div class='col-md-2' style='padding-left:90px' ><div style='font-size: 18px;color:palevioletred;font-weight:bold;font-family:monospace;padding-bottom:10px'><i class='fa fa-rupee'></i>"+(rs1.getInt("price")*qty)+"/-</div>";
                t=t+"<br/><br/><br/><br/> <form id='frmdelete' action='Cart' method='post'> <input type='hidden' name='pcode' value='"+rs1.getString("pcode")+"' ><button type='submit' class='btn btn-success' name='btn_delete' value='delete'>Remove from cart</button></div></form>";
                t=t+"</div></div></div>";
                total=total+(rs1.getInt("price")*qty);
                i++;
                //t=t+"<input type='hidden' id='h1' value='"+rs1.getString("pcode")+"'>";


                }   
                
        }
        if(t!="")
        {
                t=t+"<div class='row pull-right text-primary' style='font-size:25px;font-weight:bold'>Grand total: <i class='fa fa-rupee'></i>"+total+"/-</div>";
                if(hs.getAttribute("A1")==null)
                {
                    t=t+"<br/><div class='row pull-left'><a href='cart_login.jsp' id='btn_checkout' class='btn btn-primary' style='width:100%'><i class='fa fa-angle-double-right'></i> Check out</a></div>";
                }
                else
                {
                    t=t+"<br/><div class='row pull-left'><a href='Cart_Login' id='btn_checkout' class='btn btn-primary' style='width:100%'><i class='fa fa-angle-double-right'></i> Check out</a></div>";
                }
        }
        else
        {
            t=t+"<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Products to display in the cart </style>";
        }
                RequestDispatcher rd=req.getRequestDispatcher("cart.jsp");
                req.setAttribute("p", t);
                rd.forward(req, res);
        
        }
        catch(Exception e1)
        {
            pw.println(e1);
        }

              
        
    }
}