import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;

public class Login extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
                
        try
        {
           
        String u=req.getParameter("txtuserid");
        String p=req.getParameter("txtpassword");
        String c=req.getParameter("check_cart");
            
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst=con.prepareStatement("select * from login,customers where login.userid=? and login.password=? and login.userid=customers.emailid");
        pst.setString(1,u);
        pst.setString(2,p);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
            
                HttpSession hs=req.getSession(true);
                hs.setAttribute("A1", u);
                hs.setAttribute("A2", rs.getString("customers.fname"));
                if(hs.getAttribute("guest")!=null)
                {
                    hs.removeAttribute("guest");
                }
                if(c.equals(""))
                    
                {
                    res.sendRedirect("home.jsp");
                }
                else
                {
                    res.sendRedirect("Cart_Login");
                    //RequestDispatcher rd=req.getRequestDispatcher("Cart_Login");
                    //rd.forward(req, res);
                }

            
           
            
            
        }
        else
        {
           
            
            req.setAttribute("msg", "$('#modal-msg').modal('show');");
            RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
            rd.forward(req, res);
                         
        }
         
        }
        catch(IOException e)
        {
            pw.println(e);
        } catch (SQLException e) {
            pw.println(e);
        } catch (ServletException e) {
            pw.println(e);
        }
        
    }
}