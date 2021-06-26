import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Enumeration;
import p1.*;

public class Cart_Login extends HttpServlet
{
    String emailid="",mobile="",fname="";
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        
        
        try
        {
        if(hs.getAttribute("A1")!=null)    
        {
                String t=create_cart(req,res,pw);

                req.setAttribute("p", t);

                RequestDispatcher rd=req.getRequestDispatcher("cart_login1.jsp");

                rd.forward(req, res);
        }
        else
        {
            
       
            String btn=req.getParameter("btn_cart");
         
            if(btn.equalsIgnoreCase("guest"))
            {

                fname=req.getParameter("txtfname");
                emailid=req.getParameter("txtemailid");
                mobile=req.getParameter("txtmobile");

                String t=create_cart(req,res,pw);

                req.setAttribute("p", t);

                RequestDispatcher rd=req.getRequestDispatcher("cart_login1.jsp");

                rd.forward(req, res);
            }
            else if(btn.equalsIgnoreCase("login"))
            {

                String u=req.getParameter("txtuserid");
                String p=req.getParameter("txtpassword");
                Connection con=DB_Connection.get_DBConnection();
                PreparedStatement pst=con.prepareStatement("select * from login,customers where login.userid=? and login.password=? and login.userid=customers.emailid");
                pst.setString(1,u);
                pst.setString(2,p);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                {

                        hs=req.getSession(true);
                        hs.setAttribute("A1", u);
                        hs.setAttribute("A2", rs.getString("customers.fname"));
                        if(hs.getAttribute("guest")!=null)
                        {
                            hs.removeAttribute("guest");
                        }
                        String t=create_cart(req,res,pw);

                        RequestDispatcher rd=req.getRequestDispatcher("cart_login1.jsp");
                        req.setAttribute("p", t);
                        rd.forward(req, res);
                }
                else
                {

                    req.setAttribute("msg", "<div class='alert alert-danger' style='height:50px;background-color:white;font-weight:bolder;border:none'>Invalid Credentials</div>");
                    RequestDispatcher rd=req.getRequestDispatcher("cart_login.jsp");
                    rd.forward(req, res);

                }
            }
         }
         
        }
        catch(Exception e)
        {
            pw.println(e);
        }
        
    }
    public String create_cart(HttpServletRequest req,HttpServletResponse res,PrintWriter pw)
    {
        HttpSession hs=req.getSession(false);
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

                t=t+"<div class='row' style='height:100%'> <div class='panel panel-danger'>  <div class='panel-body'><div class='col-md-3' style='margin-right:-150px'>";
                t=t+"<img src='GetProductImage?pcode="+rs1.getString("pcode")+"'style='width:100px;height:100px' alt='Offer 1' class='img-responsive'></img></div>";


                t=t+"<div class='col-md-2'><div style='font-size: 20px;font-family:monospace;font-weight:bolder'>"+rs1.getString("pname")+"</div>"; 


                t=t+"<div style='font-family:monospace;font-size: 12px;color:green;'>In stock</div>";
                t=t+"<div style='font-size: 18px;font-weight:lighter;padding-top:3px;'>Quick Overview</div> <div style='font-size: 15px'>"+rs1.getString("description")+"</div><div style='padding-top:3px;'>Weight: 200gm</div><div style='padding-top:3px;padding-bottom:10px'>Type:"+rs1.getString("type")+"</div></div>";;

                t=t+"<div class='col-md-2 col-md-offset-2'>Quantity: "+qty+"</div>";

                t=t+"<div class='col-md-1 col-md-offset-1' text-right' ><div style='font-size: 16px;font-weight:bold;font-family:monospace;padding-bottom:10px'><i class='fa fa-rupee'></i>"+rs1.getString("price")+"/-</div></div>";
                t=t+"<div class='col-md-1 col-md-offset-1' style='padding-right:0px;'><div style='font-size: 18px;color:palevioletred;font-weight:bold;font-family:monospace;padding-bottom:10px'><i class='fa fa-rupee'></i>"+(rs1.getInt("price")*qty)+"/-</div>";
                t=t+"</div></div></div></div>";
                total=total+(rs1.getInt("price")*qty);
                i++;
               


                }   
                
        }
        t=t+"<div class='row pull-right text-primary' style='font-size:25px;font-weight:bold'>Grand total: <i class='fa fa-rupee'></i>"+total+"/-</div>";
        t=t+"<br/><div class='row pull-left'><a href='payment.jsp?emailid="+emailid+"&mobile="+mobile+"&fname="+fname+"&grandtotal="+total+"'id='btn_checkout' class='btn btn-primary' style='width:100%'><i class='fa fa-credit-card'></i> Make Payment</a></div>";
            
              
        
        }
        catch(Exception e1)
        {
            pw.println(e1);
        }
         return t;
    }
}