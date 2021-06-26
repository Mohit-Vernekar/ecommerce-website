import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import p1.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class PlaceOrder extends HttpServlet
{
    String bno,emailid,address,mode,fname;
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        
        emailid=req.getParameter("emailid");
        fname=req.getParameter("fname");
        String mobile=req.getParameter("mobile");
        mode=req.getParameter("btn_pay");
        address=req.getParameter("txtaddress");
        int grandtotal=Integer.parseInt(req.getParameter("grandtotal"));
       
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String b_date = df.format(new java.util.Date()).toString();
        
        Connection con=DB_Connection.get_DBConnection();


        Calendar c=Calendar.getInstance();
        bno=c.get(Calendar.YEAR)+""+c.get(Calendar.MONTH)+""+c.get(Calendar.DAY_OF_MONTH)+""+c.get(Calendar.MILLISECOND);

        HttpSession hs=req.getSession(false);
        
        try
        {
            
        if(hs.getAttribute("A1")!=null)
        {
             emailid=hs.getAttribute("A1").toString();
             
             PreparedStatement pst5=con.prepareStatement("select * from customers where emailid=?");
             pst5.setString(1,(String)hs.getAttribute("A1"));
             ResultSet rs5=pst5.executeQuery();
             rs5.next();
             mobile=rs5.getString("mobile");
             fname=rs5.getString("fname");
                     
        }
        
            PreparedStatement pst2=con.prepareStatement("insert into orders values(?,?,?,?,?,?)");
            pst2.setString(1,bno);
            pst2.setString(2,b_date);
            pst2.setString(3,address);
            pst2.setString(4,emailid);
            pst2.setInt(5,grandtotal);
            pst2.setString(6,mode);
            
                     
            pst2.executeUpdate();
            
            
            
            create_cart(req,res,pw);

               
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
    
    public void create_cart(HttpServletRequest req,HttpServletResponse res,PrintWriter pw)
    {
        HttpSession hs=req.getSession(false);
        Enumeration e=hs.getAttributeNames();
       
        
        Connection con=DB_Connection.get_DBConnection();
        String t="",t1="";
        t1="<table border=1><tr><th>Product name</th><th>Price</th><th>Quantity</th><th>Total</th></tr>";
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
                
                PreparedStatement pst3=con.prepareStatement("insert into orders_products values(?,?,?,?,?)");
                pst3.setString(1, bno);
                pst3.setString(2, rs1.getString("pcode"));
                pst3.setInt(3, qty);
                pst3.setInt(4, rs1.getInt("price"));
                pst3.setInt(5, rs1.getInt("price")*qty);
                pst3.execute();
                pst3.close();
                
                                
                t1=t1+"<tr>";
                t1=t1+"<td>"+rs1.getString("pname");
                t1=t1+"<td>"+rs1.getInt("price");
                t1=t1+"<td>"+qty;
                t1=t1+"<td>"+rs1.getInt("price")*qty;
                t1=t1+"</tr>";
                
              hs.removeAttribute(n);


                }   
                
        }
        t1=t1+"</table>";
        t=t+"<br/><div class='row pull-right text-primary' style='font-size:25px;font-weight:bold'>Grand total: <i class='fa fa-rupee'></i>"+total+"/-</div>";
              
              
            Properties p=new Properties();
            p.put("mail.smtp.starttls.enable","true");//here smtp donot get start security gets started
            p.put("mail.smtp.auth","true");
            p.put("mail.smtp.host","smtp.gmail.com");
            p.put("mail.smtp.port","587");

            Session s= Session.getInstance(p,new Authenticator()
            {
                    protected PasswordAuthentication getPasswordAuthentication() 
                    {
                                   return new PasswordAuthentication(DB_Connection.SENDERS_EMAILID,DB_Connection.SENDERS_PASSWORD);
                    }
            });
            
            MimeMessage msg=new MimeMessage(s);//multipurpose internet mail extension mime

            msg.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid));//here type recipient email id
            msg.setSubject("Order Confirmation");
           
            String m="<h2> Satish Interiors </h2> <div style='color:blue'> Customer name: "+fname+"</div><br/>Your Order is confirmed and details are as follows:<br/><b>Booking ID:</b>"+bno+"<br/>"+"<br/><b>Product details:<br/><br/></b>"+t1+"<br/><div style='color:blue'>Grand Total:"+total+"/-<br/>Payment mode:"+mode+"</div>";
            msg.setContent(m, "text/html; charset=utf-8");
            Transport.send(msg);

            
        RequestDispatcher rd=req.getRequestDispatcher("orderconfirm.jsp");
        req.setAttribute("p", t);
        rd.forward(req, res);
        }
        catch(Exception e1)
        {
            pw.println(e1);
        }
          
    }
        
}