import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import p1.*;

public class GetProductid extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
       
        try
        {
           
        String pcode="";
        Connection con=DB_Connection.get_DBConnection();
        Calendar cl=Calendar.getInstance();
       
        PreparedStatement pst=con.prepareStatement("select max(pcode) from products");
        ResultSet rs=pst.executeQuery();
        rs.next();
        String v=rs.getString(1);
        if(v!=null)
        {
                if(String.valueOf(cl.get(Calendar.YEAR)).equals(v.substring(1,5)))
                {
                        int v1=Integer.parseInt(v.substring(v.length()-5));
                        v1=v1+1;
                        pcode="P"+cl.get(Calendar.YEAR)+String.format("%05d",v1);
                }
                else
                {
                        pcode="P"+cl.get(Calendar.YEAR)+"00001";
                }
        }
        else
        {

                pcode="P"+cl.get(Calendar.YEAR)+"00001";
        }
        pst.close();
        pw.println(pcode);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}