import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class DisplayProducts extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(true);
        
        
      String n=req.getParameter("n");
      String filter=req.getParameter("f");
      hs.setAttribute("search", n);
//pw.println(n);
        try
        {
         
       
            Connection con=DB_Connection.get_DBConnection();
            ResultSet rs1=null;
            if(filter==null)
            {
                PreparedStatement pst2=con.prepareStatement("select * from products where type like ?");
                pst2.setString(1,"%"+n+"%");
                rs1=pst2.executeQuery();
            }
            else
            {
                 String c1=req.getParameter("c1");
                 String c2=req.getParameter("c2");
                 String c3=req.getParameter("c3");
                 String c4=req.getParameter("c4");
                
                 
                 String c22[]={null,null};
                 if(c2!=null)
                 {
                     c22=c2.split("-");
                 }
                 
                  String c33[]={null,null};
                 if(c3!=null)
                 {
                     c33=c3.split("-");
                 }
                 
                 PreparedStatement pst2=con.prepareStatement("select * from products where price < ? or (price > ? and price <= ?)or (price > ? and price <= ?) or price > ? ");
                 
                 pst2.setString(1,c1);
                 pst2.setString(2,c22[0]);
                 pst2.setString(3,c22[1]);
                 pst2.setString(4,c33[0]);
                 pst2.setString(5,c33[1]);
                 pst2.setString(6,c4);
                 rs1=pst2.executeQuery();
            }
                      
            String t="";
            int i=1;
            if(rs1.next())
            {
                
                do
                {                  
                t=t+"<div class='well' style='height:260px;background-color:white;'>";
                t=t+"<div class='col-md-3'>";
                t=t+"<img src='GetProductImage?pcode="+rs1.getString("pcode")+"'style='width:100%;height:200px;float:right' alt='Offer 1' class='img-thumbnail'>";
                t=t+"</div>";
                t=t+"<div class='col-md-3'><div style='font-size: 25px;font-family:monospace;font-weight:bolder;padding-bottom:10px'>"+rs1.getString("pname")+"</div>";
                t=t+"<div style='font-size: 18px;font-weight:bold;padding-bottom:10px'>Quick Overview</div> <div style='font-size: 15px;margin-top:-10px'>"+rs1.getString("description")+"</div><div style='padding-top:3px;padding-bottom:10px;font-weight:bold'>Type:"+rs1.getString("type")+"</div>";                
                t=t+"<div class='text-info' style='font-size: 16px;font-weight:bold;font-family:monospace;padding-bottom:10px'>Price: <i class='fa fa-rupee'></i>"+rs1.getString("price")+"/-</div>";
                // t=t+"<p>Type:"+rs1.getString("type");
                t=t+"<a href='selectproduct.jsp?pcode="+rs1.getString("pcode")+"' style='cursor: pointer'> More details</a>";
               
                 t=t+"</div></div>";
               
                
                i++;
                }
                while(rs1.next());
                 pw.println(t);
            }
            else
            {
                
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Products to Display </style> ");

            }
 
       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}