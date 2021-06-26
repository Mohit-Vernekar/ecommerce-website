
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class GetProduct extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
            PrintWriter pw=res.getWriter();
        
        try
        {
      
       String p=req.getParameter("pcode");
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from products where pcode=?");
        pst1.setString(1,p);
        ResultSet rs=pst1.executeQuery();
        
        if(rs.next())
        {
            pw.println(rs.getString(2)+"-"+rs.getString(3)+"-"+rs.getString(4)+"-"+rs.getString(5));
            
        }
        
 
        }
        catch(Exception e)
        {
           
        }
    }
        
}