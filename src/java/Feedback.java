import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class Feedback extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String name=req.getParameter("txtname").trim();
        String email=req.getParameter("txtemail").trim();
        String mobile=req.getParameter("txtphone").trim();
        String feedback=req.getParameter("txtfeedback").trim();
              
        Connection con=DB_Connection.get_DBConnection();
            
        PreparedStatement pst=con.prepareStatement("insert into feedback values(?,?,?,?)");
        pst.setString(1,name);
        pst.setString(2,email);
        pst.setString(3,mobile);
        pst.setString(4,feedback);

        pst.executeUpdate();
        pst.close();

         req.setAttribute("msg","<div class='alert alert-success' style='text-align: center;'>Thank you for your valuable feed back. We value your association with us..</div>");       
         RequestDispatcher rd=req.getRequestDispatcher("feedback.jsp");
         rd.forward(req, res);
                      
        }
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}