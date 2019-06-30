package studentdata;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CalculatePoint")
public class CalculatePoint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		ServletContext context=getServletContext();
		String dname=context.getInitParameter("drivername");
		String dburl=context.getInitParameter("databaseurl");
		HttpSession session=request.getSession();
		String tname=(String)session.getAttribute("TN");
		
		java.util.Date dt=new java.util.Date();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy 'at' hh:mm:ss a");
		String time=sdf.format(dt);
		try{
			Class.forName(dname);
			Connection con=DriverManager.getConnection(dburl,"Vipul","123");
			
			PreparedStatement pst=con.prepareStatement("update POINTSSCORED set endtime='"+time+"' where teamname='"+tname+"'");
			int i=pst.executeUpdate();
			if(i!=0){
				session.invalidate();
				response.sendRedirect("logout.jsp");
			}
		}catch(Exception e){
			out.println(e.getMessage());
		}
	}
}