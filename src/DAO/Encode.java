package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Encode {
		Connection con;
		Statement stmt;
	void connect () throws Exception {
		Class c = Class.forName("oracle.jdbc.driver.OracleDriver");
		// forName loads the class from HDD to MM
		 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "vipul", "123");
	}
	public boolean login(String name, String mob, String email) throws Exception{
		connect();
		stmt = con.createStatement();
		System.out.print(name);
		int marks = 0;
		long ct=System.currentTimeMillis()/1000;
		int flag = stmt.executeUpdate("insert into TEAM_DETAILS values ( '"+ mob + "', '"+ email + "', '" + name +"',"+ct+","+marks+")");
		con.close();
		if(flag!=0)
			return true;
		return false;
	}
	public boolean marking(int f, String tn) throws Exception
	{
		connect();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select points from pointsscored where teamname='"+tn+"'");
		rs.next();
		double points=Double.parseDouble(rs.getString(1));
		if (f == 1)
			points +=100;
		else
			points -= 10;
		PreparedStatement pst=con.prepareStatement("update POINTSSCORED set points='"+points+"' where teamname='"+tn+"'");
		int i=pst.executeUpdate();
		con.close();
		if(i!=0)
			return true;
		return false;
	}
}