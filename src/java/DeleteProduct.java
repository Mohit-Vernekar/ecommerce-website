import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;


public class DeleteProduct extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        String pid=req.getParameter("pid");
        try
        {
       
            Connection con=DB_Connection.get_DBConnection();


            PreparedStatement pst=con.prepareStatement("delete from products where pcode=?");
            pst.setString(1, pid);
            pst.executeUpdate();
            pst.close();
      
            RequestDispatcher rd=req.getRequestDispatcher("ManageProducts");
            rd.forward(req,res);
         
           
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}