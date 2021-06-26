import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class ForgotPassword2 extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String password=req.getParameter("txtpassword").trim();
        String confirmpassword=req.getParameter("txtconfirmpassword");      
        String userid=req.getParameter("userid");  
        Connection con=DB_Connection.get_DBConnection();
           
        if(password.equals(confirmpassword))
        {         
           PreparedStatement pst=con.prepareStatement("update login set password=? where userid=?");
           pst.setString(1, password);
           pst.setString(2,userid);
           pst.execute();
           req.setAttribute("disabled", "disabled");
           req.setAttribute("errormsg","<div class='alert alert-success' style='height:70px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Password changed successfully<br/><a href='home.jsp'> Click here</a> to go to login page</div>");
            RequestDispatcher rd=req.getRequestDispatcher("forgotpassword2.jsp");
            rd.forward(req, res);
                                
        }
        else
        {
            req.setAttribute("errormsg","<div class='alert alert-danger' style='height:70px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Password and confirm password do not match</div>");
            req.setAttribute("autofocus", "autofocus");
            RequestDispatcher rd=req.getRequestDispatcher("forgotpassword2.jsp");
            rd.forward(req, res); 
        }
        }
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}