<%@ page language="java" import="java.io.*, javax.servlet.http.HttpSession,java.sql.*,java.text.*" import="DAO.Encode" session="false" contentType="text/html;  charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
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
%>