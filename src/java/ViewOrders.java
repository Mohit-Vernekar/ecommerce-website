import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class ViewOrders extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        PreparedStatement pst2;
        try
        {
         
       
            Connection con=DB_Connection.get_DBConnection();
            
            if(hs.getAttribute("A1").toString().equalsIgnoreCase("admin@satishinteriors.com")==false)
            {
                pst2=con.prepareStatement("select * from orders where emailid=?");
                pst2.setString(1, hs.getAttribute("A1").toString());
            }
            else
            {
              pst2=con.prepareStatement("select * from orders");
               
            }
       
                       
            ResultSet rs1=pst2.executeQuery();
            
           // String t="<table  class='table table-striped'><thead><tr><th>Product Code</th><th>Name</th><th>Description</th><th>Type</th><th>Price</th></tr></thead>";
            //t=t+"<tbody id='products_table'>";
            String t="";
            if(rs1.next())
            {
                 int i=1;
                do
                {
               
                PreparedStatement pst3=con.prepareStatement("select * from orders_products,products where orderno=? and products.pcode=orders_products.pcode");
                pst3.setString(1, rs1.getString(1));
                ResultSet rs2=pst3.executeQuery();
                
                t=t+"<tr>";
                t=t+"<td>"+rs1.getString(1);
                t=t+"<td>"+rs1.getString(2);
                t=t+"<td>"+rs1.getString(3);
                t=t+"<td>"+rs1.getString(4);
                t=t+"<td>"+rs1.getString(5);
                t=t+"<td>"+rs1.getString(6);
                t=t+"<td><a style='cursor:pointer' data-toggle='collapse' data-target='#demo"+i+"'>Order Details</a></td>";
                
                t=t+"</tr>";
                String t1="";
                while(rs2.next())
                {
                t1=t1+"<b>Product name:</b> "+rs2.getString("products.pname")+"<span style='padding-right:5px'></span>";
                t1=t1+"<b>Qty:</b> "+rs2.getString("orders_products.qty")+"<span style='padding-right:5px'></span>";
                t1=t1+"<b>Price:</b> "+rs2.getString("orders_products.price")+"/-<span style='padding-right:5px'></span>";
                t1=t1+"<b>Total:</b> "+rs2.getString("orders_products.total")+"/-";
                }
               
                t=t+"<td colspan='4'><div id='demo"+i+"' class='collapse'>"+t1+"</div></td>";
                i++;
                }
                while(rs1.next());
                 pw.println(t);
            }
            else
            {
                
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Orders to Display </style> ");

            }
                

        
       
       
      
        
       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}