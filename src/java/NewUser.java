import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class NewUser extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String fname=req.getParameter("txtfname").trim();
        String lname=req.getParameter("txtlname").trim();
        String emailid=req.getParameter("txtemailid").trim();
        String mobile=req.getParameter("txtmobile").trim();
        String password=req.getParameter("txtpassword").trim();
        Random r=new Random();
        int a=r.nextInt(10);
        int b=r.nextInt(10);
        int c=r.nextInt(10);
        int d=r.nextInt(10);
        String otp=a+""+b+""+c+""+d;
        
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("select * from customers where emailid=?");
        pst1.setString(1, emailid);
        ResultSet rs=pst1.executeQuery();
        
        if(rs.next()==false)
        {         
            
            
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
            msg.setFrom(new InternetAddress(DB_Connection.SENDERS_EMAILID));
            msg.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid));//here type recipient email id
            msg.setSubject("Online interiors account activation");
            String m="Greetings,<br> Your OTP for account activation is "+otp;
            //msg.setText(m,"UTF-8","html");
            msg.setContent(m, "text/html; charset=utf-8");
            Transport.send(msg);

            req.setAttribute("errormsg","<div class='alert alert-success' style='text-align: center;'>Pleas enter the OTP sent to your emailid</div>");       
            req.setAttribute("fname",fname);
            req.setAttribute("lname",lname);
            req.setAttribute("mobile",mobile);
            req.setAttribute("emailid",emailid);
            req.setAttribute("otp",otp);
            req.setAttribute("password",password);
            RequestDispatcher rd=req.getRequestDispatcher("newuser1.jsp");
            rd.forward(req, res);
                      
        }
        else
        {
            req.setAttribute("fname",fname);
            req.setAttribute("lname",lname);
            req.setAttribute("mobile",mobile);
            req.setAttribute("errormsg","<div class='alert alert-danger' style='height:70px;text-align:center'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>The specified email id is already registered with us.</div>");
            req.setAttribute("autofocus", "autofocus");
            RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
            rd.forward(req, res); 
        }
        }
        catch(Exception e)
        {
            pw.println(e);
           
        }

              
        
    }
}