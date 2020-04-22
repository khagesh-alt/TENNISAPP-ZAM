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
  <link href="https://mdbootstrap.com/legacy/4.3.2/assets/compiled.min.css"rel="stylesheet">
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
  
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyAmSZwEGMWpCdpj0_3I-IzAkyF2NOF0AD8"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <script type="text/javascript" src="https://cdn.rawgit.com/wpalahnuk/ngAutocomplete/master/src/ngAutocomplete.js"></script>
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
.purple.darken-4 {
    background-color: #ff3547!important;
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
.form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + .75rem + 2px);
    padding: 0px 0px 2px 5px;
    font-size: 1rem;
    font-weight: 400;
    line-height: 2.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl">
<!--Main Navigation-->
<c:if test="${sessionScope['scopedTarget.adminSession'].loginId > 0}">
      <nav class="navbar navbar-inverse mbackground">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="superadmin" style="color: #007bff"><span class="text-white">Tennis</span>App</a>
              </div>
              <div class="rightmenu">
                <a href="academy" >Academy</a>
                <a href="superadmin" style="font-weight: 600;">Organiser</a>
                <a href="activeTournaments" ><span>Tournaments<span></a>
                <a href="./adminlogout"><span>Logout</span></a>
              </div>
            </div>
          </nav>
  </c:if>
 <c:if test="${sessionScope['scopedTarget.adminSession'].loginId == NAN}">     
<div class="container">          
   <div class="row">
   <div class="col-lg-3"></div>
            <div class="col-lg-6" style="margin-top: 100px;">
                <div class="card">
                    <div class="card-block">
                        <!--Header-->
                        <div class="form-header  purple darken-4">
                            <h5>ADMIN</h5>
                        </div>
                        <!--Body-->
                        <label for="defaultForm-pass" style="color: red;padding: 10px 0px 0px 20px;">${message}</label>
                        <form action="./adminUserLogin" class="form_span" id="" method="post">
                        <div class="md-form">
                            <i class="fa fa-lock prefix" style="color: #ff3547!important"></i>
                            <input type="password" id="userid" name="userId" class="form-control">
                            <label for="userid">Enter Your Admin ID</label>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" style="background-color: #ff3547!important">Login</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-3"></div>
        </div> 
 </div>         
  </c:if>        
          
          
          
          
  <c:if test="${sessionScope['scopedTarget.adminSession'].loginId > 0}">
    <!--Main Navigation-->
  <div style="margin-top: 80px;display: none;" id="hideMainDiv">
     <div style="padding: 5px;color: #fff;font-size: 20px;">
     <span>Welcome Admin!!!</span>
       <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#sideModalTR" style="float: right;">+ ADD ORGANISER</button>
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
		    <div class="col-sm-4" ng-repeat="organiser in organiserDetails">   
			  <div class="card card-cascade narrower">
				  <div class="card-body card-body-cascade">
					<!-- Label -->
					<h6 class="pink-text pb-2 pt-1"><i class="fas fa-user"></i> {{organiser.name}}
					 <i class="fas fa-edit" ng-click="editOrganiserDetails(organiser)" style="cursor: pointer;float: right;color: #747373;"></i>
					</h6>
					<!-- Title -->
					<h6 class="card-title  pb-2 pt-1" style="margin-bottom: 2px;font-size: 14px;"><i class="fas fa-mobile"></i>  {{organiser.phone}}</h6>
					<h6 class="card-title  pb-2 pt-1" style="margin-bottom: 2px;font-size: 14px;"><i class="fas fa-envelope"></i> {{organiser.mailId}}</h6>
					<!-- Text -->
					<h6 class="card-title" style="margin-bottom: 2px;font-size: 14px;"><i class="fas fa-map-marker"></i> {{organiser.address}}</h6>
					</div>
               </div>
		    </div>
		</div>
      </div>
  </div>
    </c:if>
	<!-- Side Modal Top Right -->
<div class="modal fade right show" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
      <div class="modal-dialog modal-side modal-top-right" role="document">
        <!--Content-->
        <div class="modal-content">
          <!--Header-->
          <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
            <h6 class="modal-title w-100" id="myModalLabel">Add Organizer</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <!--Body-->
          <div class="modal-body centredisplay">
          <form ng-submit="validateAddOrganiser()" name="organiserAdd" ngNativeValidate>
            <div class="">
               <label>Name *</label>
               <input type="text" class="form-control" ng-model="orgName" name="orgName" maxlength="70" required="required" autocomplete="off"> 
            </div>
			<div class="">
			  <label>Mobile *</label>
              <input type="number" class="form-control" ng-model="orgMobile" name="orgMobile" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" autocomplete="off">
              <span style="color:Red;font-size: .8em;" ng-show="organiserAdd.orgMobile.$error.number">Not valid number!</span>
              <span style="color:Red;font-size: .8em;" ng-show="organiserAdd.orgMobile.$dirty&&organiserAdd.orgMobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
            </div>
			<div class="">
			  <label>Email</label>
              <input type="email" class="form-control" ng-model="orgEmail" name="orgEmail" maxlength="40" required="required" autocomplete="off">
			  <span style="color:Red;font-size: .8em;" ng-show="organiserAdd.orgEmail.$dirty&&organiserAdd.orgEmail.$error.email">Not valid email!</span>
            </div>
			<div class="">
			  <label>Address</label>
              <textarea type="text" id="orgAddress" ng-model="orgAddress" name="orgAddress" class="form-control" rows="1" ng-maxlength="210" required="required" autocomplete="off"></textarea>
			  <span style="color:Red;font-size: .8em;" ng-show="organiserAdd.orgAddress.$dirty&&organiserAdd.orgAddress.$error.maxlength">Address must not exceed 210 characters!</span>
            </div>
            <button type="submit" class="btn btn-danger">Add</button>
		  </form>
          </div>
        </div>
        <!--/.Content-->
      </div>
    </div>
<!-- Side Modal Top Right -->
<!-- edit organiser -->
<div class="modal fade" id="editOrganiserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
        <h6 class="modal-title w-100">Update Organiser</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form ng-submit="validateEditOrganiser()" name="organiserEdit" ngNativeValidate>
      <div class="modal-body centredisplay">
            <div class="">
              <label>Name *</label>
              <input type="text" name="editorgName" ng-model="editorgName" class="form-control" required="required" maxlength="40" autocomplete="off">
            </div>
			<div class="">
			  <label>Email *</label>
              <input type="email" name="editOrgEmail" ng-model="editOrgEmail" class="form-control" required="required" maxlength="40" autocomplete="off">
			  <span style="color:Red;font-size: .8em;" ng-show="organiserEdit.editOrgEmail.$dirty&&organiserEdit.editOrgEmail.$error.email">Not valid email!</span>
            </div>
			<div class="">
			  <label>Address *</label>
              <textarea type="text" id="editOrgAddress" name="editOrgAddress" ng-model="editOrgAddress" class=" form-control"required="required" maxlength="210" autocomplete="off"></textarea>
			  <span style="color:Red;font-size: .8em;" ng-show="organiserEdit.editOrgAddress.$dirty&&organiserEdit.editOrgAddress.$error.maxlength">Address must not exceed 210 characters!</span>
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