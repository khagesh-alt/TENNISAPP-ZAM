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
  <link href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/compiled-4.8.0.min.css?ver=4.8.0 "rel="stylesheet">
  <link href="resources/player-home/img/favicon.png" rel="icon">
  <link href="resources/player-home/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
   <spring:url value="resources/player-home/lib/bootstrap/css/bootstrap.min.css" var="bootstrapmincss"/>
  <link rel="stylesheet" href="${bootstrapmincss}"> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!-- Libraries CSS Files -->
  <link href="resources/player-home/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/animate/animate.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="resources/player-home/css/style.css" rel="stylesheet">
  <style type="text/css">
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
  .centredisplay input {
    border-radius: 0px;
    background: transparent;
    color: #000;
    border: 1px solid #ccc;
}
a:focus {
    color: #fff !important;
    outline: none;
    text-decoration: none;
}
.caret {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 2px;
    vertical-align: middle;
    border-top: 4px dashed;
    border-top: 4px solid\9;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent;
}
.dropdown-toggle {
	padding: 20px 20px 25px 20px;
}

.dropdown {
	position: relative;
	display: inline-block;
	color: #fff;
}

.dropdown-profile {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	font-size: 12px;
}

.dropdown-profile a {
	color: black !important;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-profile a:hover {
	color: #18d26e !important;
}

.dropdown:hover .dropdown-profile {
	display: block;
}
body {
    font-family: "Open Sans", sans-serif;
}
#services .title a {
    color: #fff;
}
select {
    display: inline-block !important;
}
  </style>
</head>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl" ng-init="init()">
<div class="maincolor">
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="playerhome" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class=""><a href="playerhome">Home</a></li>
          <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
		  <li><a href="#" data-toggle="modal" data-target="#loginOrRegisterModel" ng-click="globalTournament(-1)">Login</a></li>
		  </c:if>
          <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
				<div class="dropdown" style="font-size: 13px;font-weight: 600;">
				<span class="white-text pb-2 pt-1 dropbtn" style="text-transform: uppercase;"><i class="fas fa-user-circle" style="font-size: 15px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</span>
				  <span class="caret"></span>
				  <div class="dropdown-profile">
				    <a data-toggle="modal" data-target="#modelplayerProfile">PROFILE</a>
				    <a data-toggle="modal" data-target="#modelChangePassword">CHANGE PASSWORD</a>
				    <a href="./playerlogout">LOGOUT</a>
				  </div>
				</div>
		 </c:if>
        </ul>
      </nav>
    </div>
  </header>
<main id="main" style="margin-top: 100px;">
<div class="row" style="display: none;" id="hideMainDiv">
			<!-- alert Open -->
				<div class="col-sm-12" style="margin-top: 12px;position: fixed;top: 5em;left: 29em;z-index: 2;width: auto;">
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
   <section id="services" style="background: none;padding: 0px;">
      <div class="container">

        <header class="section-header fadeInUp">
          <h3  style="color:#fff;">Academis</h3>
          <p  style="color:#fff;">Do you want to book a court, Find your nearest Academy/Court</p>
        </header>

        <div class="row">

          <div class="col-lg-4 col-md-6 box bounceInUp" data-wow-duration="1.4s" ng-repeat = "list in venueDetails">
            <div class="icon"><i class="ion-ios-location-outline"></i></div>
            <h4 class="title"><a href="">{{list.venueName}}</a></h4>
            <p class="description" style="color: #fff;">{{list.venueLocation}}</p>
            <p class="description" style="color: #18d26e" ng-if="list.venuelight == 0">Courts - {{list.noOfCourts}} (lighted) </p>
            <p class="description" style="color: #18d26e" ng-if="list.venuelight == 1">Courts - {{list.noOfCourts}} (Non lighted) </p>
            <button class="btn btn-success" style="float:right;border-radius:0px;border:0px;"> Book</button>
          </div>
        </div>
      </div>
    </section>
</main>

  <!-- Profile  -->
<div class="modal fade" id="modelplayerProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #18d26e!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Profile</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3" style="font-family: 'Montserrat', sans-serif;font-size: 13px;color: #000;font-weight: 300;">
      <p style="margin-bottom: 0.5rem;">
     <strong><b>Name : </b></strong>
     <strong>{{profileData.player_name}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Age  : </b></strong>
     <strong>{{profileData.player_age}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Gender : </b></strong>
     <strong>{{profileData.gender}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Phone : </b></strong>
     <strong>{{profileData.player_phone}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Email : </b></strong>
     <strong>{{profileData.player_email}}</strong>
     </p>
     <!-- <p style="margin-bottom: 0.5rem;">
     <strong><b>AITA : </b></strong>
     <strong>{{profileData.player_itarank}}</strong>
     </p> -->
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Address : </b></strong>
     <strong>{{profileData.player_add}}</strong>
     </p> 
    </div>
  </div>
</div>
</div>
<!-- Profile -->
  <!-- changePwd -->
<div class="modal fade right" id="modelChangePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #18d26e!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Change Password</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body centredisplay">
     <form ng-submit="validateChangePassword();" method="post" name="changePassword" ngNativeValidate>
     <p style="margin: 0px;color: red;font-size: 14px;">{{changePwdValidate}}</p>
        <div class="">
          <label>Current Password*</label>
          <input type="text" id="oldPassword" ng-model="oldPassword" name="oldPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.oldPassword.$error.required">Old password is required!</span>
       </div>
      
        <div class="">
        <label>New Password*</label>
          <input type="password" id="newPassword" ng-model="newPassword" name="newPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.newPassword.$error.required">New password is required!</span>
       </div> 
       <div class="">
        <label>Repeat Password*</label>
          <input type="password" id="repeatPassword" ng-model="repeatPassword" name="repeatPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.repeatPassword.$error.required">Repeat password is required!</span>
       </div>  
       <input type="hidden" id="existPassword" name="existPassword" value="${sessionScope['scopedTarget.userSession'].password}" class="form-control" required="required">
       <input type="hidden" id="changedPlayerId" name="changedPlayerId" value="${sessionScope['scopedTarget.userSession'].playerId}" class="form-control" required="required">           
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-success" style="color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- changepwd -->
<!-- Login/register Model -->
  <div class="modal fade" id="loginOrRegisterModel">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title">Login/Register</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body " style ="padding: 0px;">
         <div style="padding: 15px;font-size: 12px;" ng-show="signInTab">
          <form ng-submit="validatePlayerLogin()" method="post" name="loginByPlayer" ngnativevalidate="" class="centredisplay login-bg ng-valid-pattern ng-valid-maxlength ng-dirty ng-valid-parse ng-valid ng-valid-required">
	         <div class="">
	              <label for="name" class="active">MOBILE NO.*</label>
				 <input type="text" id="userId" name="userId" class="form-control ng-valid-pattern ng-valid-maxlength ng-not-empty ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched" ng-model="userId" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="loginPlyrValidate = null">
				 <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$error.number" class="ng-hide">Not valid number!</span>
			     <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$dirty&amp;&amp;loginByPlayer.userId.$error.pattern" class="ng-hide">Only Numbers Allowed, should 10 digits!</span>
			</div>
			<div class="">
			     <label for="name" class="active">PASSWORD*</label>
				 <input type="password" id="loginpassword" name="loginpassword" class="form-control ng-valid-maxlength ng-not-empty ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched" ng-model="loginpassword" maxlength="10" required="required" ng-click="loginPlyrValidate = null">
		    </div><br>
		    <div class="">
		       <p style="margin: 0px;color: red;font-size: 12px;">{{loginPlyrValidate}}</p>
		        <a href="#" style="float: right;font-size: 15px;color: #565656;" ng-click="forgotPassword()">Forgot Password?</a>
				      <button type="submit" class="btn btn-success" style="width: 100%;">LOGIN</button>
		     </div>
	           <br>
            <a href="#" ng-click="signUpTabShowHide()">Not registered? Create an account</a>
	     </form>
	     </div>
	     <div style="padding: 15px;font-size: 12px;" ng-show="signUpTab">
	     <form ng-submit="validatePlayerRegistration()" name="registerByPlayer" ngNativeValidate class="centredisplay">
	       <div class="row">
	         <div class="col-sm-12"> 
	        <label for="name">Name*</label>
			<input type="text" id="name" class="form-control" ng-model="name" name="name" maxlength="20" required="required" autocomplete="off" ng-click="registerPlyrValidate = null">
	       </div>
	     </div>
	        <div class="row">
			    <div class="col-sm-6"> 
			        <label for="phone">Phone*</label>
			        <input type="text" id="phone" ng-model="phone" name="phone" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
				    <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.phone.$error.number">Not valid number!</span>
				    <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.phone.$dirty&&registerByPlayer.phone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
			    </div>
			    <div class="col-sm-6"> 
			    <label for="email">Email*</label>
			    <input type="email" id="email" ng-model="email" name="email" class="form-control" maxlength="45" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
	            <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.email.$dirty&&registerByPlayer.email.$error.email">Not valid email!</span>
			    </div>
			</div>
				<div class="row">
				     <div class="col-sm-6"> 
				      <label for="pwd">Password*</label>
				      <input type="password" id="pwd" ng-model="pwd" name="pwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
				     </div>
				     <div class="col-sm-6"> 
				     <label for="repwd">Confirm Password*</label>
				      <input type="password" id="repwd" ng-model="repwd" name="repwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
				     </div>
				 </div>
				<div class="row">
				    <div class="col-sm-6"> 
				    <label for="address">Address*</label>
					<textarea type="text" id="address" ng-model="address" name="address" class="md-textarea form-control" rows="1" maxlength="150" required="required" ng-click="registerPlyrValidate = null" autocomplete="off"></textarea>
					</div>
					<div class="col-sm-6"> 
					<label for="dateOfBirth">Date of Birth*</label>
					<input type="text" id="dateOfBirth" ng-model="dateOfBirth" class="form-control" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
					</div>
			   </div>
			   <div class="row">
				    <div class="col-sm-12"> 
				    <label for="address">Select Ranking*</label>
				    <select ng-model="rankItem" ng-options="rankdata.rankName for rankdata in rankList" class="form-control" name="rankItem" id="rankid" style="border-radius: 0px;background: transparent;border: 1px solid #ccc;" autocomplete="off">
		            </select>
					</div>
			   </div>
			    <div class="" ng-if="rankItem.rankId != 1">
			      <div class="row">
					  <div class="col-sm-6"> 
					      <label for="itaId">Id</label>
					      <input type="text" id="itaId" ng-model="itaId" class="form-control" pattern="\d*" maxlength="10" autocomplete="off">
					  </div>
				      <div class="col-sm-6"> 
				          <label for="itaRank">Rank</label>
					      <input type="text" id="itaRank" ng-model="itaRank" class="form-control" pattern="\d*" maxlength="10" autocomplete="off">
					  </div>
			       </div>
			     </div><br>
			     <div class="row">
					  <div class="col-sm-6"> 
					  <div class="custom-control custom-radio">
					  <input type="radio" class="custom-control-input" id="male" value="0" name="gender" checked>
					  <label class="custom-control-label" for="male">Male</label>
				       </div>
					  </div>
					  <div class="col-sm-6"> 
					  <div class="custom-control custom-radio">
					  <input type="radio" class="custom-control-input" id="female" value="1" name="gender">
					  <label class="custom-control-label" for="female">Female</label>
					  </div>
					  </div>
					  </div><br>
					   <p style="margin: 0px;color: red;font-size: 12px;">{{registerPlyrValidate}}</p>
			         <div class="row"> 
				     <div class="col-sm-12">
						  <button type="submit" class="btn btn-success" style="width: 100%;">REGISTER</button>
				     </div>
			     </div>
		     <br>
		     <div><a href="#" ng-click="signInTabShowHide()">Already registered user ? LOGIN</a></div>
		  </form>
	     </div>
	     <div style="padding: 15px;font-size: 12px;" ng-show="forgetPwd">
			  <form ng-submit="validateForgetPassword()" class="centredisplay">
				<div class="">
					<label>Mobile*</label> <input type="text" id="orguserforgetId" name="orguserforgetId" class="form-control" ng-model="orguserforgetId" pattern="\d*" maxlength="10" required="required">
				</div>
				<br>
				<p style="margin: 0px; color: red; font-size: 12px;">{{changePwdValidate}}</p>
				<div class="">
					<button type="submit" class="btn btn-success" style="width: 100%;">Email LINK</button>
				</div>
				<br>
				<div>
					<a href="#"  ng-click="signInTabShowHide()"> LOGIN</a>
				</div>
			</form>
		</div>
        </div>
      </div>
    </div>
  </div>
  </div>
<input type="hidden" name="popupmsg" id="popupmsg" value="${message}" />
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
  <script  src="resources/javascript/custom/view_academy_list.js" ></script>
  <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
</body>
</html>
