<%@ page import="studentdata.*, java.io.*, java.nio.charset.Charset" %>
<!DOCTYPE html>
<html>
  <%response.setHeader("Pragma","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Expires","0");
	response.setDateHeader("Expires",-1);
	if(session.getAttribute("TN")==null){
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.include(request,response);%>
		<div align="center" class="container animated fadeInUp" style="color:#00008B;font-size:18px">You are not logged in! Please Login!</div>
	<%}else{%>
		<head>
    	<title>AVENIR</title>
    	<link rel="stylesheet" href="css/style.css"/>
    	<link rel="stylesheet" href="css/bootstrap.min.css">
    	<link rel="stylesheet" href="css/ionicons.css"/>
    	<link rel="stylesheet" href="css/animate.css" />

    	<!-- jQuery -->
    	<script src="js/jquery.min.js"></script>
    	<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<%@ include file="timer.jsp" %>
		
		<!-- fonts -->
    	<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet"/>
    	<link href="https://fonts.googleapis.com/css?family=Share+Tech+Mono" rel="stylesheet"/>
    	<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">

    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
  		</head>

<%
session.setMaxInactiveInterval(60*200);
String tname = (String)session.getAttribute("TN");
String qno = (String)request.getParameter("QN");
int j=Integer.parseInt(qno);
if(j>=4){
	j=1; qno ="1";
}else if(j<=0){
	j=3; qno ="3";
}
String s = "/TechFestFinal/Upload?qn="+j;
%>
  		<body>
    		<!-- navbar -->
    		<div class="navbar navbar-default">
	      		<div class="container">
        			<div class="navbar-header">
	          			<b class="navbar-brand animated fadeInUp">AVENIR | Encoding</b>
    	    		</div>
        			<p class="navbar-text animated fadeInDown">Exam Interface</p>

	        		<p class="navbar-text animated fadeInRight navbar-right"><i class="ion-ios-person"></i><%= session.getAttribute("TN")%></p>
    	  		</div>
    		</div>
    		<!-- navbar ends -->

	    	<div class="container">	
    	  		<div class="row">
    	  		<form action="<%=s%>" method="post" id="submitBtn" enctype="multipart/form-data">
        			<!-- question number -->
        			<div class="col-md-1">
          				<h1 class='round-center animated rollIn' ><%= j %></h1><!-- it is the question number -->
        			</div>
        			<div class="col-md-6">
          				<!-- question box -->
          				<div class="panel panel-default">
	            			<!-- questions -->
	       					<div class="panel-body" > <!-- it is the question -->
              					<pre>
              	<%try{
              			FileInputStream fin = new FileInputStream("E:\\Google_Drive\\JAVA\\Java_EE\\My Projects Eclipse\\TechFestFinal\\WebContent\\Question\\"+j+".txt");
              			Reader reader = new InputStreamReader(fin,Charset.forName("utf-8"));
              			int i; 
              			do{
              				i= fin.read();
              				if(i!=-1)
              				out.print(Character.toString((char) i));
              			}while(i !=-1);
              			fin.close();
              	}catch(Exception e){
              			System.out.println("Exception e:" +e);
              	}%>
              					</pre>
	    	        		</div>
          				</div>
          				<div class='row'>
          					<div id="msg" class='col-md-6 col-md-offset-3 text-center'>
					
        					</div>
          				</div>
	          			<!-- next and previous button -->
    	      			<nav>
        	  				<ul class="pager" id="submit_button">
            					<li class="previous"><a href="quizpage.jsp?QN=<%out.println(--j);%>"><span>&larr;</span> Previous</a></li>
            					<li class="next"><a href="quizpage.jsp?QN=<%out.println(j+=2);%>">Next<span>&rarr;</span></a></li><br><br><br><br>
          					</ul>
        				</nav>
        				<div class='row'>
        					<div class='col-md-6 col-md-offset-3'>
        						<div class='form-inline'>
	        					<div class='form-group'>
	        						<input type="file" name="fileName" required>
	        					</div>
	        					<input type="submit" value="Check" class="btn btn-default">
	        				</div>
	        				<br>
	        				<a href="calculatepoint.jsp" class="btn btn-success center-block">Final Submit</a>
        					</div>
        				</div>
        			</div>
					
	   			</form>
	   				<div class="col-md-offset-3 col-md-2" id="timer">
    	      			<div class="panel panel-default">
        	    			<div class="panel-heading"><i class='ion-ios-timer-outline' ></i> Timer</div>
            				<div class="panel-body">
              					<h4>
                				<p class="animated fadeInDown timer text-center" id='quiz-time-left'></p>
              					</h4>
            				</div>
          				</div>
        			</div>
      			</div>
<%String choice = request.getParameter("flag");
if(choice != null && choice.equals("1"))
{
%>
		<script type="text/javascript">
		document.getElementById("msg").innerHTML = "Correct Answer";
		document.getElementById("msg").style.display="block";
		document.getElementById("msg").style.background="#0f0";
		</script>
<%} else if(choice != null && choice.equals("0")){ %>
		<script type="text/javascript">
		document.getElementById("msg").innerHTML = "Incorrect Answer";
		document.getElementById("msg").style.display="block";
		document.getElementById("msg").style.background="#f00";
		</script>
<%}%>
    		</div>
  		</body>
<%}%>
</html>
