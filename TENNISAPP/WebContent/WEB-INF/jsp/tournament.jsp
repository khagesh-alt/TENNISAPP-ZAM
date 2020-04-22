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
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" rel="stylesheet"/>
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />

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
   <spring:url value="/resources/javascript/custom/buildTournament.js" var="buildTournamentjs"/>
  <script src="${buildTournamentjs}"></script>
   
</head>
<style>
html, body {
        height: 100%;
        margin: 0px;
    }

  body{

    font-family: 'Open Sans', sans-serif;
font-family: 'Montserrat', sans-serif;
  }
.centerback{
  background: #fff;
    padding: 20px;
    border-radius: 5px;
}
.centerback li{
  width: 50%;
    text-align: center;
}

.navbar-brand{
  padding: 30px;
    font-weight: 700;
    font-size: 25px;
}
.row{
  margin:0px;
}
    .mbackground {
        background: rgba(0, 0, 0, 0.4) !important;
    }
    .header{

    }
    .sideNav{
        width :200px;
        height:100%;
    }
    .navbar{
    position: fixed;
    width: 100%;
    z-index: 1000;
    }
    .navbar-brand{
        padding: 0px;
    }
    .rightmenu{
        list-style: none;
       
        color: #fff;
        float: right;
    }
    .rightmenu a{
        padding: 18px;
    }
.w3-ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}
.whitebackground{
  position: absolute;
   /*  background: white; */
    width: 100%;
    height: 100%;
	background-image: url("resources/images/organiser.jpg");
	width:100%;
	 margin: 0px;
    -moz-background-size: cover;
	-webkit-background-size: cover;
	background-size: cover;
	background-position: top center !important;
	background-repeat: no-repeat !important;
	background-attachment: fixed;
    /* opacity: 0.7; */
}
.dropdown-toggle{
padding: 20px 20px 25px 20px;
}
.dropdown {
  position: relative;
  display: inline-block;
  color: #007bff;
}

.dropdown-profile {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
    background-color: #ff3547!important;
    color: #fff !important;
 }

.dropdown:hover .dropdown-profile {display: block;}
.uploadImage {
  height: 0;
  overflow: hidden;
  width: 0;
}

.uploadImage + label {
  background: #ff3547!important;
    border: none;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font-family: 'Poppins', sans-serif;
    font-size: inherit;
    font-weight: 600;
    outline: none;
    padding: 0.5rem 50px;
    position: relative;
    transition: all 0.3s;
    vertical-align: middle;
}
.customLabel{
font-size: .8rem;
-webkit-transform: translateY(-140%);
transform: translateY(-140%);
}
</style>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl">
<!--Main Navigation-->
    
        <nav class="navbar navbar-inverse mbackground">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="mytournaments"><span class="text-danger">Tennis</span>App</a>
              </div>
            
              <div class="rightmenu">
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
                <a href="login"><span>Login</span></a>
                </c:if>
                <a href="tournament" ><button type="button" class="btn btn-danger">Add Tournament</button></a>
                <a href="mytournaments" ><span>Tournaments</span></a>
                <!-- <a href="updateScore" ><span>Update Score</span></a> -->
                <!-- <a href="" data-toggle="modal" data-target="#sideModalTR"><span>Register Player</span></a> -->
                <div class="dropdown" style="padding: 18px;">Register
                <div class="dropdown-profile">
				    <a data-toggle="modal" data-target="#sideModalTR">Register Player</a>
				    <a data-toggle="modal" data-target="#bulkUploadPopup">Upload Player list</a>
				  </div>
                </div>
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
				<a href="upcomingtournament"><span>Upcoming Tournaments</span></a>
				</c:if>
				<c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
				<div class="dropdown" style="width: 160px;">
				<span class="white-text pb-2 pt-1 dropbtn" style="text-transform: uppercase;"><i class="fas fa-user-circle" style="font-size: 20px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</span>
				  <div class="dropdown-profile">
				    <a data-toggle="modal" data-target="#modelplayerProfile">PROFILE</a>
				    <a data-toggle="modal" data-target="#modelChangePassword">CHANGE PASSWORD</a>
				    <a href="./logout">LOGOUT</a>
				  </div>
				</div>
				<%-- <a href="./logout"><span>Logout</span></a>
				<span class="white-text pb-2 pt-1" style="text-transform: uppercase;"><i class="fas fa-user"></i>${sessionScope['scopedTarget.userSession'].name}</span>
				 --%></c:if>
              </div>
            </div>
          </nav>

    <!--Main Navigation-->
    <div class="row" style="margin-top: 100px;">
			<!-- alert Open -->
				<div class="col-sm-12" style="margin-top: 12px;position: fixed;top: 5em;left: 29em;z-index: 1;width: auto;">
					<div class="alert alert-success " id="success-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideSuccessAlert()" >&times;</a>
						<strong>Success! </strong>{{successmsg}}
					</div>
					<div class="alert alert-danger " id="danger-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideDangerAlert()" >&times;</a>
						<strong>Error! </strong> {{errormsg}}
					</div>
				</div>
		   <!-- alert close -->
			</div>
<c:if test="${sessionScope['scopedTarget.userSession'].loginType == 1}">
  <div class="row" style="margin-top: 12px;">
      <div class="col-sm-3"></div>
      <div class="col-sm-6 centerback"  style="background: #fff;margin-top: 10px;">
        <div class="tab-content" id="myTabContent" style="text-align: center;">
          <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
          
          <input type="hidden" id="hiddenorganizername" value="${sessionScope['scopedTarget.userSession'].name}">
          <input type="hidden" id="hiddenorganizermail" value="${sessionScope['scopedTarget.userSession'].mailId}">
          <input type="hidden" id="hiddenorganizerphone" value="${sessionScope['scopedTarget.userSession'].phone}">
          
		  <form ng-submit="postTournament()" name="createTournament" ngNativeValidate>
            <div class="md-form">
            <input type="hidden" id="organizerId" class="form-control" value="${sessionScope['scopedTarget.userSession'].organiserId}">
              <input type="text" id="tournamentName" class="form-control" ng-model="tournamentName" name="tournamentName" maxlength="200" required="required">
              <label>Tournament Name</label>
              <span style="color:Red;font-size: .8em;" ng-show="createTournament.tournamentName.$error.required">Tournament name is required!</span>
            </div>
            <div class="md-form">
                <div class="row">
                  <div class="col-sm-6"> 
                   <label class="customLabel" style="font-size: .8rem;">Organizer Name</label>
                   <input type="text" id="organizerName" ng-model="organizerName" name="organizerName" class="form-control" maxlength="20" required="required">
                   <span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerName.$error.required">Organizer name is required!</span>
                </div>
                <div class="col-sm-6"> 
                  <label class="customLabel" style="font-size: .8rem;">Organizer Email</label>
                  <input type="email" id="organizerEmail" ng-model="organizerEmail" name="organizerEmail" class="form-control" maxlength="50" required="required">
                  <span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerEmail.$error.required" style="font-size: .8em;">Email is required.</span>
			      <span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerEmail.$dirty&&createTournament.organizerEmail.$error.email">Not valid email!</span>  
               </div>
              </div>
              </div>
			  <div class="md-form">
                <div class="row">
                    <div class="col-sm-6"> 
                    <label class="customLabel" style="font-size: .8rem;">Phone Number</label>
					<input type="text" id="contactNo" ng-model="organizerMobile" name="organizerMobile" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
					<span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerMobile.$error.required">Phone Number is required!</span>
                    <span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerMobile.$error.number">Not valid number!</span>
                    <span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerMobile.$dirty&&createTournament.organizerMobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
					</div>
                    <div class="col-sm-6"> 
                    <label class="customLabel" style="font-size: .8rem;">Alt Number</label>
					<input type="text" id="altcontactNo" ng-model="organizerAltMobile" name="organizerAltMobile" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
					<span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerAltMobile.$error.required">Alt Number is required!</span>
                    <span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerAltMobile.$error.number">Not valid number!</span>
                    <span style="color:Red;font-size: .8em;" ng-show="createTournament.organizerAltMobile.$dirty&&createTournament.organizerAltMobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
					</div>
              </div>
              </div>
              <div class="md-form">
			     <div class="row">
				 <div class="col-sm-6"> 
                  <input type="text" id="referee" ng-model="referee" name="referee" class="form-control" maxlength="20" required="required">
                  <label for="referee">Referee</label>
                  <span style="color:Red;font-size: .8em;" ng-show="createTournament.referee.$error.required">Referee name is required!</span>
				  </div>
				  <div class="col-sm-6"> 
                    <select ng-options="s.venueName for s in venueDetails" ng-model="selitem" name="selitem" id="venueid" ng-change="getselectval()" class="form-control" required="required">
					<option value="">Select Academy</option>
					</select>
					<span style="color:Red;font-size: .8em;" ng-show="createTournament.selitem.$error.required">Academy is required!</span>
				  </div>
                 </div>
			  </div>
			  <div class="md-form">
				    <div class="row">
						<div class="col-sm-6"> 
						<input type="text" id="regStartDate" class="form-control tournamentDate" data-date-format="yyyy-mm-dd" required="required" readonly>
						<label>Registration Start Date</label>
						</div>
						<div class="col-sm-6"> 
						<input type="text" id="regEndDate" class="form-control tournamentDate" data-date-format="yyyy-mm-dd" required="required" readonly>
						<label>Registration End Date</label>
					   </div>
				  </div>
               </div>
			  <div class="md-form">
						<div class="row">
							<div class="col-sm-6"> 
							<input type="text" id="tournamentStartDate" class="form-control tournamentDate" data-date-format="yyyy-mm-dd" required="required" readonly>
							<label>Tournament Start Date</label>
							</div>
							<div class="col-sm-6"> 
							<input type="text" id="tournamentEndDate"  class="form-control tournamentDate" data-date-format="yyyy-mm-dd" required="required" readonly>
							<label>Tournament End Date</label>
							</div>
						</div>
                    </div>
			  
			  
              <div class="md-form">
			  <div class="row">
				 <div class="col-sm-12"> 
                  <!-- <input type="file" id="bannerImage" name="bannerImage" fileread="uploadme" accept="image/*" placeholder="Select Image" class="form-control"> -->
                  <input type="file" id="bannerImage" name="bannerImage" class="uploadImage" fileread="uploadme" accept="image/*" file-model="myFile" placeholder="Select Image"/>
                  <label for="bannerImage" />Choose a banner image</label>
				  <input type="text" ng-model="filename"></input>
				  </div>
                 </div>
                </div>
               <div class="md-form">
				<select id="listdata" class="selectpicker" multiple data-live-search="true" data-max-options="3" required="required" class="form-control"></select>
					<button type="button" class="btn btn-light" style="margin-left: 10px;background: #ff3547!important;color: #fff;" ng-click="getselectcategory()">GET Selected Categories</button>
				</div>
				<div class="md-form">
				<ul class="w3-ul" id="shiva"> 
				 <li ng-repeat="x in buildCourt" style="width:100%;">
					 <div class="row">
					 <div class="col-sm-12" style="padding: 0px;"> 
					 <input type="hidden" id="categoryId{{$index}}" style="border: none;" class="form-control" value="{{x.category_id}}">
					  <input type="text" style=" text-align: left; border: none;color: red;font-weight: 600;" class="form-control" value="{{x.category_name}}" readonly>
					</div>
					</div>
					 <div class="md-form">
						<div class="row">
							<div class="col-sm-6"> 
							<input type="text" id="entryFee{{x.category_id}}" class="form-control" pattern="\d*" maxlength="6" required="required">
							<label >Entry Fee</label>
							</div>
							<div class="col-sm-6"> 
							<input type="text" id="prizeMoney{{x.category_id}}" class="form-control" pattern="\d*" maxlength="6" required="required" required="required">
							<label >Prize Money</label>
							</div>
						</div>
                    </div>
                    
				</li>
				
				</ul>
				</div>
				<button type="submit" ng-show="calLength > 0" class="saveDetail btn btn-danger">Submit</button>
				</form>
			</div>
         
      </div>
    </div>
    <div class="col-sm-3"></div>
	</div>
	<!-- Profile  -->
<div class="modal fade" id="modelplayerProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Profile</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Name : </b></strong>
     <strong>{{profileData.player_name}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Phone : </b></strong>
     <strong>{{profileData.player_phone}}</strong>
     </p>
     <p style="margin-bottom: 0.5rem;">
     <strong><b>Email : </b></strong>
     <strong>{{profileData.player_email}}</strong>
     </p>
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
  <div class="modal-dialog  modal-side modal-top-right" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Change Password</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3">
     <form ng-submit="validateChangePassword();" method="post" name="changePassword" ngNativeValidate>
     <p style="margin: 0px;color: red;font-size: 14px;">{{changePwdValidate}}</p>
        <div class="md-form mb-5">
          <input type="text" id="oldPassword" ng-model="oldPassword" name="oldPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <label for="oldPassword">Enter Current Password</label>
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.oldPassword.$error.required">Old password is required!</span>
       </div>
      
        <div class="md-form mb-5">
          <input type="password" id="newPassword" ng-model="newPassword" name="newPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <label for="oldPassword">Enter New Password</label>
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.newPassword.$error.required">New password is required!</span>
       </div> 
       <div class="md-form mb-5">
          <input type="password" id="repeatPassword" ng-model="repeatPassword" name="repeatPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
          <label for="repeatPassword">Enter Repeat Password</label>
          <span style="color:Red;font-size: .8em;" ng-show="changePassword.repeatPassword.$error.required">Repeat password is required!</span>
       </div>  
       <input type="hidden" id="existPassword" name="existPassword" value="${sessionScope['scopedTarget.userSession'].password}" class="form-control" required="required">
       <input type="hidden" id="changedPlayerId" name="changedPlayerId" value="${sessionScope['scopedTarget.userSession'].organiserId}" class="form-control" required="required">           
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-unique" style="background: #ff3547!important;color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- changepwd -->
</c:if>
<!-- Alert Popup Open -->
<div class="modal fade" id="alertPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="color: #ff3547;">
        <h6 class="modal-title" id="exampleModalLabel">Alert!</h6>
        <button type="button" class="close" onclick="hideAlert()" style="color: #000;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body alertmsg">
      </div>
      <div class="modal-footer d-flex" style="padding: 5px;">
        <button type="button" onclick="hideAlert()" class="btn btn-danger" style="background-color: #ff3547 !important;padding: 6px 12px 6px 12px;">Ok</button>
      </div>
    </div>
  </div>
</div>
<!-- Alert popup close -->
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
      <div class="modal-footer d-flex" style="padding: 5px;">
        <button type="button" onclick="hideAlertSec()" class="btn btn-danger" style="background-color: #ff3547 !important;padding: 6px 12px 6px 12px;">Ok</button>
      </div>
    </div>
  </div>
</div>
<!-- Alert popup close -->
<!-- Side Modal Top Right -->
<!-- Side Modal Top Right -->
<div class="modal fade right show" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
      <div class="modal-dialog modal-side modal-top-right" role="document">
        <!--Content-->
        <div class="modal-content">
          <!--Header-->
          <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
            <h6 class="modal-title w-100" id="myModalLabel">REGISTER PLAYER</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <!--Body-->
          <div class="modal-body">
          <form ng-submit="addPlayerByOrganizer()" name="registerByOrg" ngNativeValidate>
          <p style="margin: 0px;color: red;font-size: 14px;">{{registerPlayerValidate}}</p>
            <div class="md-form">
              <input type="text" id="playerName" class="form-control" ng-model="playerName" name="playerName" maxlength="25" required="required" ng-click="registerPlayerValidate = null">
              <label>Name</label>
              <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerName.$error.required">Player name is required!</span>
              
            </div>
			<div class="md-form">
              <input type="text" id="playerPhone" class="form-control" ng-model="playerPhone" name="playerPhone" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="registerPlayerValidate = null">
              <label for="playerPhone">Phone</label>
              <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerPhone.$error.required">Mobile is required!</span>
              <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerPhone.$error.number">Not valid number!</span>
              <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerPhone.$dirty&&registerByOrg.playerPhone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
            </div>
			<div class="md-form">
              <input type="email" id="playerEmail" class="form-control" ng-model="playerEmail" name="playerEmail" maxlength="25" required="required" ng-click="registerPlayerValidate = null">
              <label for="playerEmail">Email</label>
              <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerEmail.$error.required" style="font-size: .8em;">Email is required.</span>
			  <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerEmail.$dirty&&registerByOrg.playerEmail.$error.email">Not valid email!</span>
            </div>
			<div class="md-form">
                  <textarea type="text" id="playerAddress" ng-model="playerAddress" name="playerAddress" class="md-textarea form-control" rows="1" maxlength="150" required="required" ng-click="registerPlayerValidate = null"></textarea>
                  <label for="playerAddress">Address</label>
                  <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerAddress.$error.required">Address is required!</span>
            </div>
            <div class="md-form">
            <input type="text" id="dateOfBirth" name="dateOfBirth" class="form-control dobDate" data-date-format="yyyy-mm-dd" required="required" readonly >
                  <label for="dateOfBirth">Date Of Birth</label>
            </div>
            
            <div class="md-form">
                  <div class="row">
                      <div class="col-sm-6"> 
                      <input type="text" id="playerItaId" name="playerItaId" class="form-control" pattern="\d*" maxlength="10">
                      <label for="playerItaId">AITA Id</label>
                  </div>
                  <div class="col-sm-6"> 
                      <input type="text" id="playerItaRank" name="playerItaRank" class="form-control" pattern="\d*" maxlength="10">
                      <label for="playerItaRank">AITA Rank</label>
                      </div>
                </div>
                </div><br>
                <div class="row">
                    <div class="col-sm-6"> 
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="playerMale" value="0" name="playerGender" checked>
                            <label class="custom-control-label" for="playerMale">Male</label>
                          </div>
                </div>
                <div class="col-sm-6"> 
                    <div class="custom-control custom-radio">
                        <input type="radio" class="custom-control-input" id="playerFemale" value="1" name="playerGender">
                        <label class="custom-control-label" for="playerFemale">Female</label>
                      </div>
                  </div>
              </div>
               <div style="text-align: center;width: 100%;"> <button type="submit" class="btn btn-danger">Add</button></div>
		  </form>
          </div>
          <!--Footer-->
        </div>
        <!--/.Content-->
      </div>
    </div>
<!-- Side Modal Top Right -->
<!-- Side Modal Top Right -->
<!-- Bulk upload -->
<div class="modal fade right show" id="bulkUploadPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
		<div class="modal-dialog modal-side modal-top-right" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header text-center"
					style="background: #ff3547 !important; color: #fff;">
					<h6 class="modal-title w-100" id="myModalLabel">UPLOAD PLAYER LIST</h6>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" style="color: #fff;">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<!--Body-->
				<div class="modal-body">
				        <div class="md-form" style="text-align: right;margin: 0px;">
							<a href="downloadExcelFormat">Download format</a>
						</div>
					<form ng-submit="bulkUpload()">
						<div class="md-form">
							<input type="file" id="bulkUploadFile" class="form-control"	name="bulkUploadFile" accept=".xls,.xlsx,.csv" required="required" placeholder="Select File">
						</div>
						<div style="text-align: center; width: 100%;">
							<button type="submit" class="btn btn-danger">Upload</button>
						</div>
					</form>
				</div>
				<!--Footer-->
			</div>
			<!--/.Content-->
		</div>
	</div>
<!-- Bulk upload close -->
    <!-- SCRIPTS -->
    <!-- JQuery -->
  <spring:url value="/resources/javascript/jquery-3.3.1.min.js" var="jquery331minjs"/>
  <script src="${jquery331minjs}"></script>
    <!-- Bootstrap tooltips -->
  <spring:url value="/resources/javascript/popper.min.js" var="popperminjs"/>
  <script src="${popperminjs}"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

    <!-- MDB core JavaScript -->
  <spring:url value="/resources/javascript/mdb.min.js" var="mdbminjs"/>
  <script src="${mdbminjs}"></script>
  
</body>
</html>