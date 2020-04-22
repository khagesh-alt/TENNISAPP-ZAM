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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyAmSZwEGMWpCdpj0_3I-IzAkyF2NOF0AD8"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
   <spring:url value="/resources/javascript/custom/registration.js" var="registrationjs"/>
  <script src="${registrationjs}"></script>
   
</head>
<style>
html, body {
	height: 100%;
	margin: 0px;
}

body {
	font-family: 'Open Sans', sans-serif;
	font-family: 'Montserrat', sans-serif;
}

.centerback {
	background: #fff;
	padding: 20px;
	border-radius: 5px;
}

.centerback li {
	width: 50%;
	text-align: center;
}

.navbar-brand {
	padding: 30px;
	font-size: 25px;
}

.row {
	margin: 0px;
}

.mbackground {
	background: #ff3547 !important;
}

.header {
	
}

.sideNav {
	width: 200px;
	height: 100%;
}

.navbar {
	position: fixed;
	width: 100%;
	z-index: 1000;
}

.navbar-brand {
	padding: 0px;
}

.rightmenu {
	list-style: none;
	color: #fff;
	float: right;
}

.rightmenu a {
	padding: 18px;
}

.w3-ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.whitebackground{
  background-image: url("resources/images/organiserlogin.png");
  background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    position: absolute;
    width: 100%;
    margin: 0px;
    background-size: cover;
    background-position: top center !important;
    background-repeat: no-repeat;
    background-attachment: fixed;
   
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

a {
	color: #fff;
}

</style>
<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl" ng-init="init()">
<!--Main Navigation-->
    <input type="hidden" name="popupmsg" id="popupmsg" value="${message}" />
        <nav class="navbar navbar-inverse mbackground">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="upcomingtournament" style="color: #007bff"><span class="text-white">Tennis</span>App</a>
              </div>
            
              <div class="rightmenu">
              <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
                <a href="login" style="font-weight: 600;">Login</a>
                </c:if>
				<a href="upcomingtournament"><span>Upcoming Tournaments</span></a>
				<c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
				<a href="./playerlogout"><span>Logout</span></a>
				</c:if>
              </div>
            </div>
          </nav>

    <!--Main Navigation-->

<div class="container-fluid" style="margin-top: 100px;display: none;" id="hideMainDiv">
      <div class="row" style="margin-top: 12px;">
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
		
<div class="centredisplay" style="font-family: 'Montserrat', sans-serif;color: #fff;">		
	<h3>Hey Player</h3>	
</div>		
<div class="centredisplay" style="height: 100%;">		
<div  ng-show="signInTab">		
<label for="defaultForm-pass" style="color: red;padding: 10px 0px 0px 20px;">${message}</label>
	<form action="./playerLogin" ng-submit="validatePlayerLogin()" method="post" name="loginByPlayer" ngNativeValidate>
         <div class="">
              <label for="name">MOBILE NO.*</label>
			 <input type="text" id="userId" name="userId" class="form-control" ng-model="userId" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
			 <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$error.number">Not valid number!</span>
		     <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$dirty&&loginByPlayer.userId.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
		</div>
		<div class="">
		     <label for="name">PASSWORD*</label>
			 <input type="password" id="loginpassword" name="loginpassword" class="form-control" ng-model="loginpassword" maxlength="10" required="required">
	    </div><br>
	    <div class="">
	        <a href="#"  style="float: right;font-size: 15px;color: #565656;" ng-click="forgotPassword()">Forgot Password?</a>
			      <button type="submit" class="btn btn-danger btn-block">LOGIN</button>
	     </div>
	         <br>
           <a href="#"  ng-click="signUpTabShowHide()">Not registered? Create an account</a>
	</form>	
</div>	
<div ng-show="signUpTab"> 
 <form ng-submit="validatePlayerRegistration()" name="registerByPlayer" ngNativeValidate>
     <div class="">
       <div class="row">
         <div class="col-sm-12"> 
        <label for="name">Name*</label>
		<input type="text" id="name" class="form-control" ng-model="name" name="name" maxlength="20" required="required" ng-click="registerPlyrValidate = null">
       </div>
       </div>
     </div>
     <div class="">
        <div class="row">
		    <div class="col-sm-6"> 
		        <label for="phone">Phone*</label>
		        <input type="text" id="phone" ng-model="phone" name="phone" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="registerPlyrValidate = null">
			    <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$error.number">Not valid number!</span>
			    <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$dirty&&registerByPlayer.phone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
		    </div>
		    <div class="col-sm-6"> 
		    <label for="email">Email*</label>
		    <input type="email" id="email" ng-model="email" name="email" class="form-control" maxlength="45" required="required" ng-click="registerPlyrValidate = null">
            <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.email.$dirty&&registerByPlayer.email.$error.email">Not valid email!</span>
		    </div>
		</div>
     </div>
     <div class="">
		<div class="row">
		     <div class="col-sm-6"> 
		      <label for="pwd">Password*</label>
		      <input type="password" id="pwd" ng-model="pwd" name="pwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null">
		     </div>
		     <div class="col-sm-6"> 
		     <label for="repwd">Confirm Password*</label>
		      <input type="password" id="repwd" ng-model="repwd" name="repwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null">
		     </div>
		 </div>
    </div>
		<div class="row">
		    <div class="col-sm-6"> 
		    <label for="address">Address*</label>
			<textarea type="text" id="address" ng-model="address" name="address" class="md-textarea form-control" rows="1" maxlength="150" required="required" ng-click="registerPlyrValidate = null"></textarea>
			</div>
			<div class="col-sm-6"> 
			<label for="dateOfBirth">Date of Birth*</label>
			<input type="text" id="dateOfBirth" ng-model="dateOfBirth" class="form-control" required="required" ng-click="registerPlyrValidate = null">
			</div>
	   </div>
	   <div class="row">
		    <div class="col-sm-12"> 
		    <label for="address">Select Ranking*</label>
		    <select ng-model="rankItem" ng-options="rankdata.rankName for rankdata in rankList" class="form-control" name="rankItem" id="rankid" style="border-radius: 0px;background: transparent;border: 1px solid #fff;">
            </select>
           
			</div>
	   </div>
    <div class="" ng-if="rankItem.rankId != 1">
      <div class="row">
		  <div class="col-sm-6"> 
		      <label for="itaId">Id</label>
		      <input type="text" id="itaId" ng-model="itaId" class="form-control" pattern="\d*" maxlength="10">
		  </div>
	      <div class="col-sm-6"> 
	          <label for="itaRank">Rank</label>
		      <input type="text" id="itaRank" ng-model="itaRank" class="form-control" pattern="\d*" maxlength="10">
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
		   <p style="margin: 0px;color: red;font-size: 14px;font-weight: bold;">{{registerPlyrValidate}}</p>
         <div class="row"> 
	     <div class="col-sm-12">
			  <button type="submit" class="btn btn-danger btn-block">REGISTER</button>
	     </div>
     </div>
     <br>
     <div><a href="#" ng-click="signInTabShowHide()">Already registered user ? LOGIN</a></div>
  </form>
</div>	

<div ng-show="forgetPwd" class="container">
              <div class="row">
				<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<p style="margin: 0px; color: red; font-size: 14px;">{{changePwdValidate}}</p>
						<form ng-submit="validateForgetPassword()">
							<div class="">
								<label>Mobile*</label> <input type="text" id="orguserforgetId"
									name="orguserforgetId" class="form-control"
									ng-model="orguserforgetId" pattern="\d*" maxlength="10"
									required="required">
							</div>
							<br>
							<div class="">
								<button type="submit" class="btn btn-danger btn-block">Email
									LINK</button>
							</div>
							<br>
							<div>
								<a href="#" ng-click="signInTabShowHide()"> LOGIN</a>
							</div>
						</form>
					</div>
					<div class="col-lg-4"></div>
			</div>
			</div>

</div>		
		<%-- <div class="row">
   <div class="col-lg-3"></div>
            <div class="col-lg-6" style="margin-top: 50px;">
                <div class="card">
                    <div class="card-block" ng-show="signInTab">
                        <!--Header-->
                        <div class="form-header  purple darken-4" style="background-color: #ff3547!important;">
                            <h5>PLAYER SIGN IN</h5>
                        </div>
                        <!--Body-->
                        <label for="defaultForm-pass" style="color: red;padding: 10px 0px 0px 20px;">${message}</label>
                        <form action="./playerLogin" ng-submit="validatePlayerLogin()" method="post" name="loginByPlayer" ngNativeValidate>
                        <div class="md-form">
			              <input type="text" id="userId" name="userId" class="form-control" ng-model="userId" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
			              <label for="name">MOBILE NO.</label>
			              <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$error.required">Mobile is required!</span>
				          <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$error.number">Not valid number!</span>
				          <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$dirty&&loginByPlayer.userId.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
			            </div>
						<div class="md-form">
			              <input type="password" id="loginpassword" name="loginpassword" class="form-control" ng-model="loginpassword" maxlength="10" required="required">
			              <label for="name">PASSWORD</label>
			              <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.loginpassword.$error.required">Password is required!</span>
			            </div>
			            <div class="text-center">
			                <button type="submit" class="btn btn-danger">SIGN IN</button>
			            </div>
						</form>
                        <div style="font-size: 15px;font-family: inherit;text-align: center;">
						   <p class="right"><a href="#" ng-click="signUpTabShowHide()">Not registered? Create an account</a></p>
							</div>
                    </div>
                    <div class="card-block" ng-show="signUpTab">
                      <div class="form-header  purple darken-4" style="background-color: #ff3547!important;">
                            <h5>PLAYER SIGN UP</h5>
                      </div>
                      <form ng-submit="validatePlayerRegistration()" name="registerByPlayer" ngNativeValidate>
                      <p style="margin: 0px;color: red;font-size: 14px;">{{registerPlyrValidate}}</p>
                      <div class="md-form">
		              <input type="text" id="name" class="form-control" ng-model="name" name="name" maxlength="20" required="required" ng-click="registerPlyrValidate = null">
		              <label for="name">Name</label>
		              <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.name.$error.required">Player name is required!</span>
		            </div>
		            <div class="md-form">
		                <div class="row">
		                    <div class="col-sm-6"> 
		                <input type="text" id="phone" ng-model="phone" name="phone" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="registerPlyrValidate = null">
		                <label for="phone">Phone</label>
		                <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$error.required">Mobile is required!</span>
			                <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$error.number">Not valid number!</span>
			                <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$dirty&&registerByPlayer.phone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
		                </div>
		                <div class="col-sm-6"> 
		                    <input type="email" id="email" ng-model="email" name="email" class="form-control" maxlength="20" required="required" ng-click="registerPlyrValidate = null">
		                    <label for="email">Email</label>
		                    <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.email.$error.required" style="font-size: .8em;">Email is required.</span>
					        <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.email.$dirty&&registerByPlayer.email.$error.email">Not valid email!</span>
		                    </div>
		              </div>
		              </div>
					  <div class="md-form">
		                <div class="row">
		                    <div class="col-sm-6"> 
		                <input type="password" id="pwd" ng-model="pwd" name="pwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null">
		                <label for="pwd">Password</label>
		                <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.pwd.$error.required">Password is required!</span>
		                </div>
		                <div class="col-sm-6"> 
		                    <input type="password" id="repwd" ng-model="repwd" name="repwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null">
		                    <label for="repwd">Confirm Password</label>
		                    <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.repwd.$error.required">Confirm Password is required!</span>
		                    </div>
		              </div>
		              </div>
		              <div class="md-form">
		                 <div class="row">
		                    <div class="col-sm-6"> 
			                  <textarea type="text" id="address" ng-model="address" name="address" class="md-textarea form-control" rows="1" maxlength="150" required="required" ng-click="registerPlyrValidate = null"></textarea>
			                  <label for="address">Address</label>
			                  <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.address.$error.required">Address is required!</span>
			                </div>
			                <div class="col-sm-6"> 
			                  <input type="text" id="dateOfBirth" ng-model="dateOfBirth" class="form-control" required="required" ng-click="registerPlyrValidate = null">
			                  <label for="dateOfBirth">Date of Birth</label>
			                 </div>
		                 </div>
		               </div>
		              <div class="md-form">
		                  <div class="row">
		                  <div class="col-sm-6"> 
		                      <input type="text" id="itaId" ng-model="itaId" class="form-control" pattern="\d*" maxlength="10">
		                      <label for="itaId">AITA Id</label>
		                   </div>
		                  <div class="col-sm-6"> 
		                      <input type="text" id="itaRank" ng-model="itaRank" class="form-control" pattern="\d*" maxlength="10">
		                      <label for="itaRank">AITA Rank</label>
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
		              </div>
		              <div class="text-center">
		                <button type="submit" class="btn btn-danger">SIGN UP</button>
		              </div>
                    </form>
                    <div style="font-size: 15px;font-family: inherit;text-align: center;">
				   <p><a href="#" ng-click="signInTabShowHide()">Sign in</a></p>
						<div class="clear"></div>
					</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div> --%> 	
</div>    
<!-- SCRIPTS -->
    <!-- JQuery -->
     
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