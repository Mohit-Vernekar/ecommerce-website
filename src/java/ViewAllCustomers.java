import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class ViewAllCustomers extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
         
       
        Connection con=DB_Connection.get_DBConnection();
        
       
            PreparedStatement pst2=con.prepareStatement("select * from customers where emailid != ?");
            pst2.setString(1, "admin@satishinteriors.com");
            
            ResultSet rs1=pst2.executeQuery();
            
         
            String t="";
            if(rs1.next())
            {
                do
                {
                t=t+"<tr>";
                t=t+"<td>"+rs1.getString(1);
                t=t+"<td>"+rs1.getString(2);
                t=t+"<td>"+rs1.getString(3);
                t=t+"<td>"+rs1.getString(4);
                
               
                t=t+"</tr>";
                }
                while(rs1.next());
                 pw.println(t);
            }
            else
            {
                
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Customers to Display </style> ");

            }
                

        
       
       
      
        
       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}