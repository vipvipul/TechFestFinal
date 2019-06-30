<!DOCTYPE html>
<html>
  <head>
    <title>REGISTER</title>
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
          <b class="navbar-brand animated fadeInUp">AVENIR | Encoding</b>
        </div>
        <p class="navbar-brand">&nbsp; |</p>
        <p class="navbar-text animated fadeInDown">Exam Interface</p>
        <a type="button" class="btn btn-default navbar-btn navbar-right" href="index.jsp"><i class='ion-ios-body-outline'></i> Log in</a>
      </div>
    </div>
    <!-- navbar ends -->

    <div class="container animated fadeInLeft">
      <div class="page-header animated fadeIn">
        <h1><i class='ion-ios-body-outline'></i> Register</h1>
      </div>

      <!-- registration form starts -->
      <div class="row animated fadeIn">
        <div class="col-md-6">
          <form action="Register" method="post">
            <div class="form-group">
              <dl class="dl-horizontal">
                <dt><label for="nameReg" class="control-label">Full Name</dt>
                  <dd><input type="text" class="form-control" placeholder="eg. Rohit Kumar Singh" id='nameReg' name="studentName" required/></dd>
              </dl>
               <dl class="dl-horizontal">
                <dt><label for="teamNameReg" class="control-label">Team Name</dt>
                  <dd><input type="text" class="form-control" placeholder="eg. Coding Masters" id='teamNameReg' name="teamName" required/></dd>
              </dl>
              <dl class="dl-horizontal">
                <dt><label for="memberTypeReg" class="control-label">Member Type</dt>
                  <dd>
                    <div class="row">
                      <div class="col-md-4">
                        <input type="radio" id='memberTypeReg' name='memberType' value='Lead' required/> Team Lead
                      </div>
                      <div class="col-md-6">
                        <input type="radio" id='memberTypeReg' name='memberType' value='Member' required/> Team Member
                      </div>
                    </div>
                  </dd>
              </dl>
              <dl class="dl-horizontal">
                <dt><label for="emailReg" class="control-label">Email ID</dt>
                  <dd><input type="email" class="form-control" placeholder="eg. rohit.techy@gmail.com" id='emailReg' name="emailID" required/></dd>
              </dl>
              <dl class="dl-horizontal">
                <dt><label for="numReg" class="control-label">Phone Number</dt>
                  <dd><input type="number" class="form-control" placeholder="eg. 998788789" id='numReg' name="mobile" required/></dd>
              </dl>
              <dl class="dl-horizontal">
                <dt><label for="passwordReg" class="control-label">Password</dt>
                  <dd><input type="password" class="form-control" placeholder="eg. p@$$w0rd" id='passwordReg' name="password" required/></dd>
              </dl>
              <dl class="dl-horizontal">
                <dt></dt>
                <dd>
                  <div class="row">
                    <div class="col-md-3">
                      <button type="submit" class="btn btn-info"><i class="ion-ios-body-outline"></i> Register</button>
                    </div>
                    <div class="col-md-3">
                      <button type="reset" class="btn btn-danger"><i class="ion-ios-refresh-outline"></i> Reset</button>
                    </div>
                  </div>
                </dd>
              </dl>
            </div>
          </form>
        </div>
      </div>
      <!-- registration form ends -->
    </div>

<%String msg=(String)session.getAttribute("message");
if("error1".equals(msg)){%>
	<div class="container animated fadeInLeft" align="center" style="color:#00008B;font-size:18px"><%="Email ID already registered!!"%></div>
	<%session.invalidate();
}else if("error2".equals(msg)){%>
	<div class="container animated fadeInLeft" align="center" style="color:#00008B;font-size:18px"><%="Mobile already registered!!"%></div>
	<%session.invalidate();
}else if("error3".equals(msg)){%>
	<div class="container animated fadeInLeft" align="center" style="color:#00008B;font-size:18px"><%="Team Name already taken!! Choose another."%></div>
	<%session.invalidate();
}else if("error4".equals(msg)){%>
	<div class="container animated fadeInLeft" align="center" style="color:#00008B;font-size:18px"><%="One member already registered with this team name!! Choose another."%></div>
	<%session.invalidate();
}%>

  </body>
</html>
