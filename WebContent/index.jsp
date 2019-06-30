<!DOCTYPE html>
<html>
  <%response.setHeader("Pragma","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Expires","0");
	response.setDateHeader("Expires",-1);%>
	
		  <head>
    		<title>LOG IN</title>
		    <link rel="stylesheet" href="css/style.css"/>
    		<link rel="stylesheet" href="css/bootstrap.min.css">
    		<link rel="stylesheet" href="css/ionicons.css"/>
    		<link rel="stylesheet" href="css/animate.css" />

    		<!-- jquery -->
    		<script src="js/jquery.min.js"></script>
    		<script type="text/javascript" src="js/bootstrap.min.js"></script>

		    <!-- fonts -->
    		<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet"/>
    		<link href="https://fonts.googleapis.com/css?family=Share+Tech+Mono" rel="stylesheet"/>
    		<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">


		    <meta charset="utf-8">
    		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    		<meta name="viewport" content="width=device-width, initial-scale=1">
  		  </head>

		  <body>
      		<!-- navbar -->
      		<div class="navbar navbar-default">
        		<div class="container">
		            <div class="navbar-header">          
            			<I><b class="navbar-brand animated fadeInUp">AVENIR | Encoding</b></I>
          			</div>
          			<p class="navbar-brand">&nbsp; | </p>
          			<p class="navbar-text animated fadeInDown">Exam Interface</p>
          			<a type="button" class="btn btn-default navbar-btn navbar-right" href="signup.jsp"><i class='ion-ios-body-outline'></i> Register</a>
          			<a class="btn navbar-btn navbar-right" href="rules.pdf" style="color:white;font-weight:bold;">Rules</a>
        		</div>
      		</div>
      		<!-- navbar ends -->

		    <div class="container animated fadeInUp">
        		<div class="page-header">
          			<h1><i class='ion-log-in'></i> Log in</h1>
        		</div>
        		<!-- log in form starts from here -->

		        <div class="col-md-6">
        		    <form action="LoginValidate" method="post">
            			<div class="form-group">
              				<dl class="dl-horizontal">
                				<dt><label for='emailLogin' class="col-sm-2 col-md-2 control-label">Team Name</lable></dt>
                				<dd><input type='text' class='form-control' id='emailLogin' placeholder="Enter your Team Name" name="teamName" required/></dd>
              				</dl>
              				<dl class="dl-horizontal">
                				<dt><label for='passwordLogin' class="col-sm-2 col-md-2 control-label">Password</lable></dt>
                				<dd><input type='password' class='form-control' id='passwordLogin' placeholder="Enter your password" name="password" required/></dd>
              				</dl>
              				<dl class="dl-horizontal">
                				<dt></dt>
                				<dd><button type='submit' class="btn btn-info"><i class='ion-log-in'></i> Log in</button></dd>
              				</dl>
            			</div>
          			</form>
        		</div>

		        <!-- log in form ends -->
      		</div>
			<%String msg=(String)session.getAttribute("message");
  			if("error1".equals(msg)){%>
  				<div align="center" class="container animated fadeInUp" style="color:#00008B;font-size:18px"><%="Invalid Student ID or Password!!"%></div>
				<%session.invalidate();
				return;
		  	}else if("error2".equals(msg)){%>
  				<div align="center" class="container animated fadeInUp" style="color:#00008B;font-size:18px"><%="You have played the contest! Login Prohibited!"%></div>
				<%session.invalidate();
				return;
  			}
  			if(session.getAttribute("TN")!=null){
  				session.invalidate();
  			}%>
  		  </body>
</html>
