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
   <spring:url value="/resources/javascript/custom/super-admin.js" var="superadminjs"/>
  <script src="${superadminjs}"></script>
   
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
	background-image: url("resources/images/background.jpg");
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    position: absolute;
    width: 100%;
    /* height: 100%; */
    margin: 0px;
    background-size: cover;
    background-position: top center !important;
    background-repeat: no-repeat;
    background-attachment: fixed;
}
select {
    font-family: 'Montserrat', sans-serif;
    display: block !important;
}
i{
    height: 10px;
    width: 15px;
}
.customLabel{
font-size: .8rem;
-webkit-transform: translateY(-140%);
transform: translateY(-140%);
}
a{
color: #fff;
}
.centredisplay label {
    color: #000;
    margin-top: 5px;
    font-size: 15px;
}
.centredisplay input, .centredisplay textarea, .centredisplay select {
    border-radius: 0px;
    color: #000;
    border: 1px solid #000;
}

</style>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl">
<!--Main Navigation-->
    
      <nav class="navbar navbar-inverse mbackground">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="superadmin" style="color: #007bff"><span class="text-white">Tennis</span>App</a>
              </div>
              <div class="rightmenu">
                <a href="academy" style="font-weight: 600;">Academy</a>
                <a href="superadmin" >Organiser</a>
                <a href="activeTournaments">Tournaments</a>
                <a href="./adminlogout">Logout</a>
              </div>
            </div>
          </nav>

    <!--Main Navigation-->

    <div style="margin-top: 80px; display: none;" id="hideMainDiv">
    <div style="padding: 5px;color: #fff;font-size: 20px;">
     <span>Welcome Admin!!!</span>
       <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#sideModalTR" style="    float: right;">+ ADD ACADEMY</button>
     </div>
	<div class="container">
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
			<div class="row" style="    margin-top: 12px;">
		    <div class="col-sm-4" ng-repeat="venue in venueDetails">
			<div class="card">
			    <div class="card-body">
					<h6 class="card-title pink-text">{{venue.venueName}}
					<i class="fas fa-edit" ng-click="editAcademyDetails(venue)" style="cursor: pointer;float: right;color: #747373;"></i>
					</h6>
					<hr>
					<h6 class="card-title  pb-2 pt-1" style="margin-bottom: 2px;font-size: 14px;"><i class="fas fa-mobile"></i>  {{venue.contactMob}}</h6>
					<h6 class="card-title  pb-2 pt-1" style="margin-bottom: 2px;font-size: 14px;"><i class="fas fa-envelope"></i> {{venue.contactEmail}}</h6>
					<!-- <h6 class="card-title  pb-2 pt-1" style="margin-bottom: 2px;font-size: 14px;"><i class="fas fa-volleyball-ball"></i> {{venue.sportType}}</h6> -->
					<h6 class="card-title" style="margin-bottom: 2px;font-size: 14px;"><i class="fas fa-map-marker"></i> {{venue.venueLocation}}</h6>
				    <hr>
				    <div style="width: 100%;">
					<p class="card-text pink-text" style="width: 50%;float: left;"> <span>Available Courts:</span> <span>{{venue.noOfCourts}}</span> 
					</p>
					<p class="card-text pink-text"  style="width: 50%;float: left;"> <span>Light:</span>
					 <span ng-if="venue.venuelight == 0"><i class="fa fa-check" aria-hidden="true"></i></span> 
					 <span ng-if="venue.venuelight == 1"><i class="fa fa-times" aria-hidden="true"></i></span> 
					</p>
					</div>
				</div>
			</div>
			<div><br>
		</div>
		</div>
		</div>
      </div>
    </div>
	<!-- Side Modal Top Right -->
<div class="modal fade right show" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
      <div class="modal-dialog modal-side modal-top-right" role="document">
        <!--Content-->
        <div class="modal-content">
          <!--Header-->
          <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
            <h6 class="modal-title w-100" id="myModalLabel">Add Academy</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <!--Body-->
          <div class="modal-body centredisplay">
          <form ng-submit="validateAddVenue()" name="academyAdd" ngNativeValidate>
            <div class="">
              <label>Name *</label>
              <input type="text" class="form-control" ng-model="venueName" name="venueName" maxlength="100" required="required" autocomplete="off">
            </div>
			<div class="">
			   <label>Address *</label>
               <textarea type="text" ng-model="venueAddress" name="venueAddress" class="md-textarea form-control" rows="1" autocomplete="off" ng-maxlength="210" required="required"></textarea>
			   <span style="color:Red;font-size: .8em;" ng-show="academyAdd.venueAddress.$dirty&&academyAdd.venueAddress.$error.maxlength">Address must not exceed 210 characters!</span>
            </div>
			<div class="">
			  <label>No of Courts *</label>
              <input type="number" class="form-control" ng-model="noOfCourts" name="noOfCourts" ng-pattern="/^[0-9]{1,2}$/" maxlength="2" required="required" autocomplete="off">
              <span style="color:Red;font-size: .8em;" ng-show="academyAdd.noOfCourts.$error.number">Not valid number!</span>
			  <span style="color:Red;font-size: .8em;" ng-show="academyAdd.noOfCourts.$dirty&&academyAdd.noOfCourts.$error.pattern">Only Numbers Allowed, should 2 digits!</span>
            </div>
			<div class="">
			  <label>Mobile *</label>
              <input type="number" class="form-control" ng-model="mobile" name="mobile" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" autocomplete="off">
              <span style="color:Red;font-size: .8em;" ng-show="academyAdd.mobile.$error.number">Not valid number!</span>
              <span style="color:Red;font-size: .8em;" ng-show="academyAdd.mobile.$dirty&&academyAdd.mobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
            </div>
			<div class="">
			  <label>Email *</label>
              <input type="email" class="form-control" ng-model="email" name="email" maxlength="40" required="required" autocomplete="off">
			  <span style="color:Red;font-size: .8em;" ng-show="academyAdd.email.$dirty&&academyAdd.email.$error.email">Not valid email!</span>
            </div><br>
			<div class="">
              <select  ng-model="sportType" id="sportType" class="form-control" required="required">
				<!-- <option value="">Select Sport</option> -->
				<option value="Tennis">Tennis</option>
				<option value="Cricket">Cricket</option>
				<option value="Badminton">badminton</option>
			  </select>
            </div>
            <div class="">
		           <div class="custom-control custom-radio custom-control-inline">
		           <input type="radio" class="custom-control-input" id="lighted" value="0" name="light">
		           <label class="custom-control-label" for="lighted">Lighted</label>
		           </div>
		           <div class="custom-control custom-radio custom-control-inline">
		           <input type="radio" class="custom-control-input" id="nonlighted" value="1" name="light" checked>
		           <label class="custom-control-label" for="nonlighted">Non Lighted</label>
		           </div>
		   </div><br>
            <button type="submit" class="btn btn-danger">Add</button>
		  </form>
          </div>
          <!--Footer-->
          <div class="modal-footer">
          </div>
        </div>
        <!--/.Content-->
      </div>
    </div>
<!-- Side Modal Top Right -->
<!-- edit organiser -->
<div class="modal fade" id="editAcademyModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Update Academy</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form ng-submit="validateEditAcademy()" name="academyEdit" ngNativeValidate>
		 <div class="modal-body centredisplay">
		  <div class="">
			<label>Name *</label>
			<input type="text" name="editVenueName" ng-model="editVenueName" class="form-control" required="required" maxlength="100">
		</div>
		<div class="">
			<label>Mobile *</label>
			<input type="text" name="editContactMob" ng-model="editContactMob" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
			<span style="color:Red;font-size: .8em;" ng-show="academyEdit.editContactMob.$dirty&&academyEdit.editContactMob.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
		</div>
		<div class="">
			<label>Email *</label>
			<input type="email" name="editContactEmail" ng-model="editContactEmail" class="form-control" maxlength="40" required="required">
			<span style="color:Red;font-size: .8em;" ng-show="academyEdit.editContactEmail.$dirty&&academyEdit.editContactEmail.$error.email">Not valid email!</span>
		</div>
		<div class="">
			<label>Address</label>
			<textarea type="text" id="editacademyAddress" class="md-textarea form-control" name="editVenueLocation" ng-model="editVenueLocation" rows="1" ng-maxlength="210" required="required"></textarea>
			<span style="color:Red;font-size: .8em;" ng-show="academyEdit.editVenueLocation.$dirty&&academyEdit.editVenueLocation.$error.maxlength">Address must not exceed 210 characters!</span>
		</div>
		</div>
		<div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-danger">Update</button>
        </div>
		</form>
    </div>
  </div>
</div>
<!-- Edit organiser -->
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