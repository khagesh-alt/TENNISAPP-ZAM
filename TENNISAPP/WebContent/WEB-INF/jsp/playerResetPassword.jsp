<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
<title>www.tennisapp.com</title>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- Font Awesome -->
  <link href="resources/player-home/img/favicon.png" rel="icon">
  <link href="resources/player-home/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
  <!-- Bootstrap CSS File -->
   <spring:url value="resources/player-home/lib/bootstrap/css/bootstrap.min.css" var="bootstrapmincss"/>
  <link rel="stylesheet" href="${bootstrapmincss}"> 
   <link href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/compiled-4.8.0.min.css?ver=4.8.0 "rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!-- Libraries CSS Files -->
  <link href="resources/player-home/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/animate/animate.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/player-home/css/style.css" rel="stylesheet">
    
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
    <spring:url value="/resources/javascript/custom/resetPassword.js" var="resetPasswordjs"/>
  <script src="${resetPasswordjs}"></script>
</head>
<style>
html, body {
        height: 100%;
        margin: 0px;
       
    }

  body{
     height:100%;
    font-family: 'Open Sans', sans-serif;
font-family: 'Montserrat', sans-serif;
  } 

.mainSide{
   color :#fff;
  }
 .whitebackground {
    background-image: url(resources/player-home/img/intro-carousel/2.jpg);
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    position: absolute;
    width: 100%;
    height: 100%;
    margin: 0px;
    background-size: cover;
    background-position: top center !important;
    background-repeat: no-repeat;
    background-attachment: fixed;
}
.maincolor{
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.8);
    position : absolute;
    overflow: auto;
}

.centredisplay{
   display: flex;
  justify-content: center;
  align-items: center;
  
}
.centredisplay label{
 color: #fff;
 margin-top: 5px;
 font-size: 15px;
}
.centredisplay input{
border-radius: 0px;
    background: transparent;
    /* color: #fff; */
    border: 1px solid #fff;
} 

.centredisplay button{
 /* background: #ff3547; */
 border-radius :0px;
}

.redcolor{
color: #ff3547;
}

</style>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl">
      
<div class="container-fluid maincolor" style="height: 100%">  
<header id="header">
    <div class="container-fluid">
      <div id="logo" class="pull-left">
        <h1><a href="playerhome" class="scrollto">TennAPP</a></h1>
      </div>
    </div>
  </header>


<div class="row" style="margin-top: 12px;">
			<!-- alert Open -->
				<div class="col-sm-12" style="margin-top: 12px;position: fixed;top: 5em;left: 29em;z-index: 1;width: auto;">
					<div class="alert alert-success " id="success-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideSuccessAlert()" >&times;</a>
						<strong>Success! </strong> {{successmsg}}
					</div>
					<div class="alert alert-danger " id="danger-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideDangerAlert()" >&times;</a>
						<strong>Error! </strong> {{errormsg}}
					</div>
				</div>
		   <!-- alert close -->
			</div>
			
			
			<div class="centredisplay" style="height: 80%;">
			<div class="row" style="    width: 100%;">
				<div class="col-lg-4"></div>
				 <div class="col-lg-4">
			     <p style="margin: 0px;color: red;font-size: 14px;">{{changePwdValidate}}</p>
                        <form  method="post" ngNativeValidate ng-submit="validatePlayerResetPassword();" >
                        <div class="" style="margin-top:2%;">
			           <h6 style="color: green;"><b>Reset Your Password :</b></h6>	
			            </div>
			            <input type="hidden" id="forgottoken" name="forgottoken" class="form-control" value="${resetbean.token}" readonly="readonly">
                         <div>
                            <label>MOBILE NO.</label>
                            <input type="text" id="forgotMobile" name="forgotMobile" class="form-control" value="${resetbean.mobile}" readonly="readonly">
                          </div> 
                          <div>
                            <label>New Password*</label>
                            <input type="text" id="forgotnewpwd" name="forgotnewpwd" class="form-control" ng-model="forgotnewpwd" maxlength="10" required="required">
                          </div> 
                          <div>
                            <label>Retype New Password*</label>
                            <input type="text" id="forgotrepwd" name="forgotrepwd" class="form-control" ng-model="forgotrepwd" maxlength="10" required="required">
                          </div> 
                          <br>
                        <div class="">
                            <button type="submit" class="btn btn-success btn-block" >SUBMIT</button>
                        </div>
                        </form>
                        </div>
                      <div class="col-lg-4"></div>
                </div>  
	</div>		
 </div>         

    <!-- SCRIPTS -->
    <!-- JQuery -->
  <spring:url value="/resources/javascript/jquery-3.3.1.min.js" var="jquery331minjs"/>
  <script src="${jquery331minjs}"></script>
    <!-- Bootstrap tooltips -->
  <spring:url value="/resources/javascript/popper.min.js" var="popperminjs"/>
  <script src="${popperminjs}"></script>
    <!-- Bootstrap core JavaScript -->
  <spring:url value="/resources/javascript/bootstrap.min.js" var="bootstrapminjs"/>
  <script src="${bootstrapminjs}"></script>
    <!-- MDB core JavaScript -->
  <spring:url value="/resources/javascript/mdb.min.js" var="mdbminjs"/>
  <script src="${mdbminjs}"></script>
  
</body>
</html>