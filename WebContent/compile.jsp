<%@ page language="java" import="java.io.*, javax.servlet.http.HttpSession, DAO.Encode" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>

	<body>
		<h2>${requestScope.message}</h2>
		<%
	String qn = request.getParameter("qn");
	String filename = request.getParameter("tempfile");
	String timeout = "15s";
	String inputfile = "/home/amar/workspace/TechFestFinal/WebContent/Input/"+qn+".txt";
	String param = filename +" " + timeout + " " + inputfile ;
	String command = "python /home/amar/workspace/TechFestFinal/WebContent/compiler.py ";
	System.out.println(command + param);
	Process p = Runtime.getRuntime().exec(command + param );
	BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
	String ret = in.readLine();
	//System.out.println("value is : "+ret);
	
	HttpSession session = request.getSession(false);
	session.setMaxInactiveInterval(7320);
	String output="/home/amar/workspace/TechFestFinal/WebContent/Output/"+qn+".txt";
	System.out.println(output + "  " + ret);
	//String s = request.getParameter("tempfile");
	try{
	File f1 = new File(ret);// OUTFILE
    File f2 = new File(output);// INPUT

    FileReader fR1 = new FileReader(f1);
    FileReader fR2 = new FileReader(f2);

    BufferedReader reader1 = new BufferedReader(fR1);
    BufferedReader reader2 = new BufferedReader(fR2);

    String line1 = null;
    String line2 = null;
    int flag = 1;
    while ((flag == 1) && ((line1 = reader1.readLine()) != null)
            && ((line2 = reader2.readLine()) != null)) {
        if (!line1.equalsIgnoreCase(line2))
            flag = 0;
    }
	if(flag==1&&(((line1=reader1.readLine())!=null&&(line2=reader2.readLine())==null)||((line1=reader1.readLine())==null&&(line2=reader2.readLine())!=null)))
		flag =0;
    reader1.close();
    reader2.close();
    System.out.println("Flag " + flag);
    if(flag==1)
    	session.setAttribute(qn,"1");
    Encode ob=new Encode();
	String tn = (String)session.getAttribute("TN");
	boolean f = ob.marking(flag, tn);
	String site= "quizpage.jsp?QN="+qn+"&flag="+ flag;
	response.sendRedirect(site);
	}
	catch(Exception e){
		System.out.println("Exception:" + e);
	}
	%>
	</body>

	</html>