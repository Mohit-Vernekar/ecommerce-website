
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class GetProductType extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
            PrintWriter pw=res.getWriter();
        
        try
        {
      
     
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select distinct type from products");
      
        ResultSet rs=pst1.executeQuery();
        String p="";
        while(rs.next())
        {
            p=p+"-"+rs.getString(1);
          
        }
        pw.println(p);
 
        }
        catch(Exception e)
        {
           
        }
    }
        
}