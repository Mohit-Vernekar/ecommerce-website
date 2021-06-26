import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;

public class NewUser1 extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String fname=req.getParameter("fname").trim();
        String lname=req.getParameter("lname").trim();
        String emailid=req.getParameter("emailid").trim();
        String mobile=req.getParameter("mobile").trim();
        String password=req.getParameter("password").trim();
        String otp=req.getParameter("otpvalue");
        String otp1=req.getParameter("txtotp1");
        Connection con=DB_Connection.get_DBConnection();
       
        
        if(otp.equals(otp1))
        {         
                PreparedStatement pst=con.prepareStatement("insert into customers values(?,?,?,?)");
                pst.setString(1,fname);
                pst.setString(2,lname);
                pst.setString(3,emailid);
                pst.setString(4,mobile);
                pst.executeUpdate();
                pst.close();

                PreparedStatement pst2=con.prepareStatement("insert into login values(?,?)");
                pst2.setString(1, emailid);
                pst2.setString(2, password);


                pst2.executeUpdate();
                pst2.close();
                con.close();

                req.setAttribute("errormsg","<div class='alert alert-success' style='text-align: center;'>Sign up process successful.<a href='home.jsp'> You can login now. Login here</a> <br/></div>");       
                req.setAttribute("disabled", "disabled");

                RequestDispatcher rd=req.getRequestDispatcher("newuser1.jsp");
                rd.forward(req, res);
                      
        }
        else
        {
            req.setAttribute("errormsg","<div class='alert alert-danger' style='height:70px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Invalid OTP value.</div>");
            req.setAttribute("autofocus", "autofocus");
            req.setAttribute("fname",fname);
            req.setAttribute("lname",lname);
            req.setAttribute("mobile",mobile);
            req.setAttribute("emailid",emailid);
            req.setAttribute("otp",otp);
            req.setAttribute("password",password);
            RequestDispatcher rd=req.getRequestDispatcher("newuser1.jsp");
            rd.forward(req, res); 
        }
        }
        catch(Exception e)
        {
            pw.println(e);
        }
   }
}