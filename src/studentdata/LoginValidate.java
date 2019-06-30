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

//@WebServlet("/LoginValidate")
public class LoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		ServletContext context=getServletContext();
		String teamName=request.getParameter("teamName");
		String password=request.getParameter("password");
		String dname=context.getInitParameter("drivername");
		String dburl=context.getInitParameter("databaseurl");
		try{
			Class.forName(dname);
			Connection con=DriverManager.getConnection(dburl,"Vipul","123");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from studentdata where teamName='"+teamName+"' and password='"+password+"'");
			
			if(rs.next()){
				Statement st2=con.createStatement();
				ResultSet rs2=st2.executeQuery("select * from unplayedteams where teamname='"+teamName+"'");
				
				if(rs2.next()){
					String qn="1";
					HttpSession session=request.getSession();
					session.setMaxInactiveInterval(60*200);
					session.setAttribute("TN", teamName);
					session.setAttribute("QN", qn);
					
					java.util.Date dt=new java.util.Date();
					SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy 'at' hh:mm:ss a");
					String time=sdf.format(dt);
					int i=st.executeUpdate("update studentdata set STARTTIME='"+time+"' where teamname='"+teamName+"'");
					
					PreparedStatement pst=con.prepareStatement("insert into POINTSSCORED(TEAMNAME,POINTS,STARTTIME) values(?,?,?)");
					pst.setString(1, teamName);
					pst.setString(2, "0");
					pst.setString(3, time);
					int j=pst.executeUpdate();
					
					//int k=st.executeUpdate("delete unplayedteams where teamname='"+teamName+"'");
					if(i!=0 && j!=0){// && k!=0){
						response.sendRedirect("quizpage.jsp?QN=1");
					}
				}else{
					HttpSession session=request.getSession();
					session.setAttribute("message", "error2");
					response.sendRedirect("index.jsp");
					return;
				}
			}else{
				HttpSession session=request.getSession();
				session.setAttribute("message", "error1");
				response.sendRedirect("index.jsp");
				return;
			}
		}catch(Exception e){
			out.println(e.getMessage());
		}
	}
}
