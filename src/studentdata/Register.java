package studentdata;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String studentName = request.getParameter("studentName");
		String teamName = request.getParameter("teamName");
		String memberType = request.getParameter("memberType");
		String emailID = request.getParameter("emailID");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		ServletContext context = getServletContext();
		String dname = context.getInitParameter("drivername");
		String dburl = context.getInitParameter("databaseurl");
		try {
			Class.forName(dname);
			Connection con = DriverManager.getConnection(dburl, "Vipul", "123");

			PreparedStatement pst1 = con.prepareStatement("Select * from studentdata where emailid='" + emailID + "'");
			PreparedStatement pst2 = con.prepareStatement("Select * from studentdata where mobile='" + mobile + "'");
			ResultSet rs1 = pst1.executeQuery();
			ResultSet rs2 = pst2.executeQuery();
			if (rs1.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("message", "error1");
				response.sendRedirect("signup.jsp");
			} else if (rs2.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("message", "error2");
				response.sendRedirect("signup.jsp");
			} else if (memberType.equals("Lead")) {
				pst1 = con.prepareStatement("Select * from studentdata where teamname='" + teamName + "' and membertype='Lead'");
				rs1 = pst1.executeQuery();
				if (rs1.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("message", "error3");
					response.sendRedirect("signup.jsp");
					return;
				}
			} else if (memberType.equals("Member")) {
				pst1 = con.prepareStatement("Select count(*) from studentdata where teamname='" + teamName + "' and membertype='Member'");
				rs1 = pst1.executeQuery();
				rs1.next();
				if (rs1.getInt(1) == 1) {
					HttpSession session = request.getSession();
					session.setAttribute("message", "error4");
					response.sendRedirect("signup.jsp");
					return;
				}
			}

			pst1 = con.prepareStatement("Insert into studentdata(STUDENTNAME,TEAMNAME,MEMBERTYPE,EMAILID,MOBILE,PASSWORD) values(?,?,?,?,?,?)");
			pst1.setString(1, studentName);
			pst1.setString(2, teamName);
			pst1.setString(3, memberType);
			pst1.setString(4, emailID);
			pst1.setString(5, mobile);
			pst1.setString(6, password);
			int i = pst1.executeUpdate();

			int j;
			pst1 = con.prepareStatement("select * from UNPLAYEDTEAMS where teamname='" + teamName + "'");
			rs1 = pst1.executeQuery();
			if (rs1.next() == false) {
				pst2 = con.prepareStatement("Insert into UNPLAYEDTEAMS values(?)");
				pst2.setString(1, teamName);
				j = pst2.executeUpdate();
				if (i != 0 && j != 0) {
					response.sendRedirect("signupSuccess.jsp");
					return;
				}
			}

			if (i != 0) {
				response.sendRedirect("signupSuccess.jsp");
				return;
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}
}
