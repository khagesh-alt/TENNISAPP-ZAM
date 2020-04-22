<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>TennAPP</title>
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
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
  <link href="resources/player-home/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Main Stylesheet File -->
  <link href="resources/player-home/css/style.css" rel="stylesheet">
    <spring:url value="/resources/javascript/domtoimage.js" var="domtoimagejs"/>
  <script src="${domtoimagejs}"></script>
    <spring:url value="/resources/javascript/FileSaver.js" var="FileSaverjs"/>
  <script src="${FileSaverjs}"></script>

  <style type="text/css">
  .mainSide{
   color :#fff;
  }
  .categoryList td,th{
    color :#fff ;
  }
 .whitebackground {
    background-image: url(resources/player-home/img/intro-carousel/1.jpg);
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
.row {
    margin: 0px;
    padding: 5px;	
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
    color: #fff;
    border: 1px solid #fff;
} 
.centredisplay textarea{
border-radius: 0px;
    background: transparent;
    color: #fff;
    border: 1px solid #fff;
} 

.centredisplay button{
 /* background: #ff3547; */
 border-radius :0px;
}

.redcolor{
color: #ff3547;
}
body{
font-family: 'Montserrat', sans-serif;
}
select {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    display: block !important;
}
  </style>
</head>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl">
<div class="maincolor">
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="playerhome" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="mytournaments">Home</a></li>
		  <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 1}">
		   <li><a href="./logout" >Logout</a></li>
		 </c:if>
        </ul>
      </nav>
    </div>
  </header>
  
   <main id="main" style="margin-top: 100px;display: none;">
    <section>
     <input type="hidden" id="tournamentid" value="${sessionScope['scopedTarget.tournamentSession'].tournamentid}"/>
     <input type="hidden" name="popupmsg" id="popupmsg" value="${sessionScope['scopedTarget.userSession'].playerId}" />
	<input type="hidden" name="message" id="message" value="${message}" />
	
	<div class="row" style="margin-top: 12px;display: none;" id="hideMainDiv">
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
					<div class="alert alert-info " id="info-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideInfoAlert()">&times;</a>
						<strong>Info! </strong> {{infomsg}}
					</div>
				</div>
		   <!-- alert close -->
			</div>
	<div style="text-align: center;color: #fff;">
	<h3>Welcome Organizer</h3>
    </div>
<div class="container centredisplay">
	<div ng-show="signInTab">
	<label for="defaultForm-pass" style="color: red;padding: 10px 0px 0px 20px;">${message}</label>
	          <form action="./organizerLogin" ng-submit="validateOrganizerLogin()" method="post" name="loginByorganiser" ngNativeValidate>
	                <label for="orguserId">MOBILE NO.*</label>
	                <input type="text" id="orguserId" name="orguserId" class="form-control" ng-model="orguserId" pattern="\d*" maxlength="10" required="required" autocomplete="off">
					<span class="redcolor" style="font-size: .8em;" ng-show="loginByorganiser.orguserId.$dirty&&loginByorganiser.orguserId.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
	                <label for="orgloginpassword">PASSWORD*</label>
	                <input type="password" id="orgloginpassword" name="orgloginpassword" class="form-control" maxlength="10" ng-model="orgloginpassword" required="required" autocomplete="off">
	                 <br>
	                 <a href="#"  style="float: right;font-size: 15px;color: #c5c5c5;" ng-click="forgotPassword()">Forgot Password?</a>
	                 <button type="submit" class="btn btn-primary btn-success btn-block">LOGIN</button>
	               <br>
	                 <a href="#"  ng-click="signUpTabShowHide()" style="color: #007bff; ">Not registered? Create an account</a>
	           </form>
	</div>
	<div ng-show="signUpTab">
            <form ng-submit="validateAddOrganiser()" name="organiserAdd" ngNativeValidate>
	           <label>Name*</label>
			   <input type="text" class="form-control" ng-model="orgName" name="orgName" maxlength="70" required="required" autocomplete="off"> 
			   <label for="orgMobile">Mobile*</label>
			   <input type="number" class="form-control" ng-model="orgMobile" name="orgMobile" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" autocomplete="off">
			   <span class="redcolor" style="font-size: .8em;" ng-show="organiserAdd.orgMobile.$error.number">Not valid number!</span>
			   <span class="redcolor" style="font-size: .8em;" ng-show="organiserAdd.orgMobile.$dirty&&organiserAdd.orgMobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
               <br>
               <label>Email*</label>
               <input type="email" class="form-control" ng-model="orgEmail" name="orgEmail" maxlength="45" required="required" autocomplete="off">
    		   <span class="redcolor" style="font-size: .8em;" ng-show="organiserAdd.orgEmail.$dirty&&organiserAdd.orgEmail.$error.email">Not valid email!</span>
			    <br>        
			   <label>Address*</label>
			   <textarea type="text" id="orgAddress" ng-model="orgAddress" name="orgAddress" class="md-textarea form-control" rows="1" ng-maxlength="210" required="required" autocomplete="off"></textarea>
			   <span class="redcolor" style="font-size: .8em;" ng-show="organiserAdd.orgAddress.$dirty&&organiserAdd.orgAddress.$error.maxlength">Address must not exceed 210 characters!</span>
			   <br>
               <button type="submit" class="btn btn-primary btn-success btn-block" >REGISTER</button>
               <br>
               <a href="#" ng-click="signInTabShowHide()" style="color: #007bff; ">Already registered user ? LOGIN</a>
            </form>
     </div>
	<div ng-show="forgetPwd" >
		<p style="margin: 0px; color: red; font-size: 14px;">{{changePwdValidate}}</p>
		<form ng-submit="validateForgetPassword()">
			<label>Mobile*</label> <input type="text" id="orguserforgetId" name="orguserforgetId" class="form-control" ng-model="orguserforgetId" pattern="\d*" maxlength="10"	required="required" ng-click="changePwdValidate = null">
			<br>
			<button type="submit" class="btn btn-primary btn-success btn-block">Email LINK</button>
			<br>
			<a href="#" ng-click="signInTabShowHide()" style="color: #007bff; "> LOGIN</a>
		</form>
	</div>
</div>	
</section>
</main>
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  
  <script src="resources/player-home/lib/jquery/jquery.min.js"></script>
   
  <script src="resources/player-home/lib/jquery/jquery-migrate.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src="resources/player-home/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/player-home/lib/easing/easing.min.js"></script>
  <script src="resources/player-home/lib/superfish/hoverIntent.js"></script>
  <script src="resources/player-home/lib/superfish/superfish.min.js"></script>
  <script src="resources/player-home/lib/wow/wow.min.js"></script>
  <script src="resources/player-home/lib/waypoints/waypoints.min.js"></script>
  <script src="resources/player-home/lib/counterup/counterup.min.js"></script>
  <script src="resources/player-home/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="resources/player-home/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="resources/player-home/lib/lightbox/js/lightbox.min.js"></script>
  <script src="resources/player-home/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="resources/player-home/contactform/contactform.js"></script>
  
  
  <!-- Template Main Javascript File -->
  <script src="resources/player-home/js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  
    <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
  <spring:url value="/resources/javascript/custom/organiserlogin.js" var="organiserloginjs"/>
  <script src="${organiserloginjs}"></script>
  </div>
</body>
</html>
