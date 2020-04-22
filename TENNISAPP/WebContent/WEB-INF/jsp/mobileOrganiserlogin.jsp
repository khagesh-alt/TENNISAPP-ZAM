<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
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
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans" rel="stylesheet">
  <!-- Bootstrap core CSS -->
  <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapmincss"/>
  <link rel="stylesheet" href="${bootstrapmincss}"> 
  <!-- Material Design Bootstrap -->
  <spring:url value="/resources/css/mdb.min.css" var="mdbmincss"/>
  <link rel="stylesheet" href="${mdbmincss}"> 
 <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
  <!-- Your custom styles (optional) -->
 <spring:url value="/resources/css/style.css" var="stylecss"/>
  <link rel="stylesheet" href="${stylecss}"> 
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
  <style>
  html{
  width: 100%;
    height: 100%;
  }
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
}

header {
    background-color: #062351;
    padding: 2px;
    text-align: center;
    font-size: 35px;
    color: white;
}

@media (max-width: 600px) {
    nav, article {
        width: 100%;
        height: auto;
    }
}
@font-face {
  font-family: "GothamRoundedBook";
  src: url(../assets/GothamRoundedBook_21018.ttf) format("truetype");
}
.mbackground {
        background: rgba(0, 0, 0, 0.4) !important;
    }
.whitebackground{
      width: 100%;
    height: 100%;
    background-image: url(/TENNISAPP-TESTING/resources/images/player.jpg);
    width: 100%;
    margin: 0px;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  
}
.info-color {
    background-color: #ff3547!important;
}
 .rightmenu{
        list-style: none;
       
        color: #fff;
        float: right;
    }
    .rightmenu a{
        padding: 18px;
    }
</style>
<script type="text/javascript">
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	var msg = $("#popupmsg").val();
	if(msg != ""){
		showAlertSec(msg);
	}
	 $('#popupmsg').val("");
	 
	 
});	 

</script>
</head>

<body  ng-app="myApp" ng-controller="myCtrl" class="whitebackground">
	<nav class="navbar navbar-inverse mbackground">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="mobileOrganiserlogin"><span
				class="text-danger">Tennis</span>App</a>
		</div>
		<div class="rightmenu">
				<c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
				<a href="./logout"><span>Logout</span></a>
				</c:if>
              </div>
	</div>
	</nav>
<div class="container">
 <input type="hidden" name="popupmsg" id="popupmsg" value="${message}" />
		<div style="margin-top: 50px;"></div>
		<!-- Material form subscription -->
		<div class="card">
			<h5 class="card-header info-color white-text text-center py-4">
				<strong>ORGANISER SIGN IN</strong>
			</h5>

			<div class="card-body px-lg-5">
				<form class="text-center" style="color: #757575;" action="./organiserLoginByMobile" method="post">
					<div class="md-form mt-3">
						<input type="number" id="userid" name="userid" class="form-control" required> 
							<label for="materialSubscriptionFormPasswords">Mobile No.</label>
					</div>
					<div class="md-form">
						<input type="password" id="loginpwd" name="loginpwd" class="form-control" required>
						 <label	for="materialSubscriptionFormEmail">Password</label>
					</div>
					<button	class="btn btn-outline-info btn-rounded btn-block z-depth-0 my-4 waves-effect"
						type="submit">Sign in</button>
				</form>
			</div>
		</div>
		<!-- Material form subscription -->
</div>
<!-- Alert Popup Open -->
<div class="modal fade" id="secalertPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="color: #ff3547;">
        <h6 class="modal-title" id="exampleModalLabel">Alert!</h6>
        <button type="button" class="close" onclick="hideAlertSec()" style="color: #000;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body alertmsg">
      </div>
      <div class="modal-footer d-flex">
        <button type="button" onclick="hideAlertSec()" class="btn btn-danger">Ok</button>
      </div>
    </div>
  </div>
</div>
<!-- Alert popup close -->
<spring:url value="/resources/javascript/jquery-3.3.1.min.js" var="jquery331minjs"/>
  <script src="${jquery331minjs}"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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