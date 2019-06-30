package studentdata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MCQ {
	static Connection con;
	static Statement st;
	static PreparedStatement ps;
	static ResultSet rs;
	static void connectDatabase() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//forName loads the class from HDD to MM
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "Vipul", "123");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	static public ResultSet getMCQ() {
		try{
			connectDatabase();
			st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=st.executeQuery("select * from MCQ");
			return rs;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return null;
	}
}
