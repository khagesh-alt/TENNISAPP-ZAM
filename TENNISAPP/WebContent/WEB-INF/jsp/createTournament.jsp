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
  
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" rel="stylesheet"/>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
  <!-- Bootstrap CSS File -->
   <spring:url value="resources/player-home/lib/bootstrap/css/bootstrap.min.css" var="bootstrapmincss"/>
  <link rel="stylesheet" href="${bootstrapmincss}"> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />

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
	/* background-color: #ff3547 !important;
	color: #fff !important; */
	color: #18d26e !important;
}

.dropdown:hover .dropdown-profile {
	display: block;
}

.uploadImage {
	height: 0;
	overflow: hidden;
	width: 0;
}

.whitebackground input, .whitebackground select, .whitebackground textarea
	{
	border-radius: 0px;
	border: 1px solid #fff;
    background: transparent;
    color: #fff;
}

.whitebackground label {
	margin-top: 0.7em;
	margin-bottom: 0.1em;
	font-size: 13px;
	color: #fff;
}

.savebtn {
	position: fixed;
	bottom: 20px;
	right: 10px;
}

.backbtn {
	position: fixed;
	bottom: 20px;
	left: 10px;
}

table.table td, table.table th {
	border: none !important;
	font-family: 'Montserrat', sans-serif;
	color: #fff;
}

a {
	color: #fff;
}
.centredisplay label {
   color: #000;
    margin-top: 5px;
    font-size: 12px;
    font-weight: 400;
}
.centredisplay input {
    border-radius: 0px;
    color: #000;
    border: 1px solid #000;
}
select {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    display: block !important;
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
  </style>
</head>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl" ng-init="init()" style = "font-family: 'Montserrat', sans-serif;">
<div class="maincolor">
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="tournamentList" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class=""><a href="tournamentList">Home</a></li>
          <li class=""><a href="tournamentList">My Tournaments</a></li>
           <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 1}">
           <li class="menu-active">
          <div class="dropdown" style="font-size: 13px;font-weight: 600;">
		    <span class="white-text pb-2 pt-1 dropbtn" style="text-transform: uppercase;"><i class="fas fa-user-circle" style="font-size: 15px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</span>
			<span class="caret"></span>
			<div class="dropdown-profile">
			<a data-toggle="modal" data-target="#modelplayerProfile">PROFILE</a>
			<a data-toggle="modal" data-target="#modelChangePassword">CHANGE PASSWORD</a>
			<a href="./logout">LOGOUT</a>
		  </div>
	    </div>
	   </li>
	</c:if>
        </ul>
      </nav>
    </div>
  </header>
  
   <main id="main" style="margin-top: 100px;display: none;">
    <section>
     <input type="hidden" id="hiddenorganizername" value="${sessionScope['scopedTarget.userSession'].name}">
     <input type="hidden" id="hiddenorganizermail" value="${sessionScope['scopedTarget.userSession'].mailId}">
     <input type="hidden" id="hiddenorganizerphone" value="${sessionScope['scopedTarget.userSession'].phone}">
          
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
			
<div class="container">
<div class="breadcrump" style="color:#18d26e" >
  					<a href="tournamentList" style="color:#18d26e">My Tournaments </a> <a href="#" style="color:#18d26e"> > Create Tournament</a>
			</div>
 <div class="row">
<div class="col-sm-2"></div>
	<div class="col-sm-8" ng-show="show==0">
          <div class="col-sm-12" style="text-align: center;margin-bottom: 20px;">
		      <div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" class="custom-control-input" value="existingCourt" ng-model="place" name="place" id="defaultInline1">
			  <label class="custom-control-label" for="defaultInline1">Select Existing Academy</label>
			 </div>
			 
			 <div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" class="custom-control-input" value="newCourt" ng-model="place" name="place" id="defaultInline2" checked>
			  <label class="custom-control-label" for="defaultInline2">Create New Academy</label>
			</div>
	    </div>
	    
	    
	    
      
      
	    <div ng-show="place === 'existingCourt'" style="text-align: center;width: 100%;">
	      <form ng-submit="selectAcademy()">
	        <select ng-options="s.venueName for s in venueDetails" ng-model="selitem" name="selitem" id="venueid" ng-change="getselectval()" class="form-control" required="required">
			   <option value="">Select Academy</option>
			</select><br>
			<div class="col-sm-6" style="float: left;text-align: left;">
			<table class="table">
			<tbody>
		      <tr>
		        <th style="width: 20%;">Name:</th>
		        <td>{{academyDetails.venueName}}</td>
		      </tr>
		      <tr>
		        <td style="width: 20%;">Mobile:</td>
		        <td style="">{{academyDetails.mobile}}</td>
		      </tr>
		      <tr>
		        <td style="width: 20%;">Email:</td>
		        <td>{{academyDetails.email}}</td>
		       </tr>
		       </tbody>
		       </table>
		       </div>
		       <div class="col-sm-6" style="float: left;text-align: left;">
		       <table class="table">
			  <tbody>
		       <tr>
		        <td style="width: 20%;">Add:</td>
		        <td>{{academyDetails.venueLocation}}</td>
		       </tr>
		       <tr>
		        <td style="width: 20%;">Courts:</td>
		        <td>{{academyDetails.noOfCourts}}</td>
		       </tr>
		       <tr>
		        <td style="width: 20%;">Light:</td>
		         <td ng-if="academyDetails.light == 1">No</td>
		         <td ng-if="academyDetails.light == 0">Yes</td>
		      </tr>
			</tbody>
			</table>
			</div>
			<!-- <button type="submit" class="btn btn-success waves-effect waves-light backbtn" disabled>Back</button> -->
			<button type="submit" class="btn btn-success waves-effect waves-light savebtn">Next</button>
			</form>
   </div>
	     <div ng-show="place === 'newCourt'">
	      <form ng-submit="validateAddVenue()" name="academyAdd" ngNativeValidate>
	      <div class="col-sm-6" style="float: left;">
            <div class="">
               <label>Name*</label>
              <input type="text" class="form-control" ng-model="venueName" name="venueName" maxlength="100" required="required">
			  
            </div>
			<div class="">
			      <label>Location*</label>
                  <textarea type="text" ng-model="venueAddress" name="venueAddress" class="md-textarea form-control" rows="1" ng-maxlength="210" required="required"></textarea>
                  
			      <span style="color:Red;font-size: .6em;" ng-show="academyAdd.venueAddress.$dirty&&academyAdd.venueAddress.$error.maxlength">Address must not exceed 210 characters!</span>
            </div>
			<div class="">
			   <label>No of Courts*</label>
              <input type="number" class="form-control" ng-model="noOfCourts" name="noOfCourts" ng-pattern="/^[0-9]{1,2}$/" maxlength="2" required="required">
             
              <span style="color:Red;font-size: .6em;" ng-show="academyAdd.noOfCourts.$error.number">Not valid number!</span>
			  <span style="color:Red;font-size: .6em;" ng-show="academyAdd.noOfCourts.$dirty&&academyAdd.noOfCourts.$error.pattern">Only Numbers Allowed, should 2 digits!</span>
            </div>
          
           </div>
           <div class="col-sm-6" style="float: left;">
			<div class="">
			 <label>Mobile*</label>
              <input type="number" class="form-control" ng-model="mobile" name="mobile" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
              
              <span style="color:Red;font-size: .6em;" ng-show="academyAdd.mobile.$error.number">Not valid number!</span>
              <span style="color:Red;font-size: .6em;" ng-show="academyAdd.mobile.$dirty&&academyAdd.mobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
            </div>
			<div class="">
			  <label>Email*</label>
              <input type="email" class="form-control" ng-model="email" name="email" maxlength="40" required="required">
             
			  <span style="color:Red;font-size: .6em;" ng-show="academyAdd.email.$dirty&&academyAdd.email.$error.email">Not valid email!</span>
            </div>
            <div class="">
              <label>Lighted/Non Lighted*</label><br>
		       <div class="custom-control custom-radio custom-control-inline">
		       <input type="radio" class="custom-control-input" id="lighted" value="0" name="light">
		       <label class="custom-control-label" for="lighted">Lighted</label>
		       </div>
		       <div class="custom-control custom-radio custom-control-inline">
		       <input type="radio" class="custom-control-input" id="nonlighted" value="1" name="light" checked>
		       <label class="custom-control-label" for="nonlighted">Non Lighted</label>
		    </div>
		   </div>
            </div>
            <div style="text-align: center;width: 100%;display: inline-block;">
            <button type="" class="btn btn-success waves-effect waves-light backbtn" disabled>Back</button>
            <button type="submit" class="btn btn-success waves-effect waves-light savebtn">Save & Next</button>
            </div>
		  </form>
	    </div>
   </div>
   <div class="col-sm-8" ng-show="show==1">
       <form ng-submit="validateTournament()" name="createTournament" ngNativeValidate>
	       <div class="col-sm-6" style="float: left;">
	         <div class="">
              <input type="hidden" id="organizerId" class="form-control" value="${sessionScope['scopedTarget.userSession'].organiserId}">
               <label>Tournament Name*</label>
              <input type="text" id="tournamentName" class="form-control" ng-model="tournamentName" name="tournamentName" maxlength="200" required="required">
              
            </div>
            <div class=""> 
               <label >Organizer Name*</label>
               <input type="text" id="organizerName" ng-model="organizerName" name="organizerName" class="form-control" maxlength="20" required="required">
               
           </div>
           <div class=""> 
              <label >Phone Number*</label>
			  <input type="text" id="contactNo" ng-model="organizerMobile" name="organizerMobile" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
			  
              <span style="color:Red;font-size: .6em;" ng-show="createTournament.organizerMobile.$error.number">Not valid number!</span>
              <span style="color:Red;font-size: .6em;" ng-show="createTournament.organizerMobile.$dirty&&createTournament.organizerMobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
			</div>
			<!-- <div class=""> 
			 <label>Registration Start Date*</label>
			  <input type="text" id="regStartDate" class="form-control tournamentDate" style="background: transparent;" data-date-format="yyyy-mm-dd" required="required" readonly>
			 </div> -->
			 <div class=""> 
			    <label>Tournament Start Date*</label>
				<input type="text" id="tournamentStartDate" class="form-control tournamentDate" style="background: transparent;" data-date-format="yyyy-mm-dd" required="required" readonly>
			 </div>
			 <div class=""> 
			     <label>Choose a banner image</label>
                 <input type="file" id="bannerImage" name="bannerImage" fileread="uploadme" accept="image/*" placeholder="Select Image" class="form-control">
			</div>
	      </div>
	       <div class="col-sm-6" style="float: left;">
	         <div class=""> 
	           <label for="referee">Referee*</label>
               <input type="text" id="referee" ng-model="referee" name="referee" class="form-control" maxlength="20" required="required">
               
		    </div>
		    <div class=""> 
               <label>Organizer Email*</label>
               <input type="email" id="organizerEmail" ng-model="organizerEmail" name="organizerEmail" class="form-control" maxlength="50" required="required">
               
			   <span style="color:Red;font-size: .6em;" ng-show="createTournament.organizerEmail.$dirty&&createTournament.organizerEmail.$error.email">Not valid email!</span>  
            </div>
            <div class=""> 
               <label >Alt Number*</label>
			   <input type="text" id="altcontactNo" ng-model="organizerAltMobile" name="organizerAltMobile" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required">
			  
               <span style="color:Red;font-size: .6em;" ng-show="createTournament.organizerAltMobile.$error.number">Not valid number!</span>
               <span style="color:Red;font-size: .6em;" ng-show="createTournament.organizerAltMobile.$dirty&&createTournament.organizerAltMobile.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
			</div>
			<!-- <div class=""> 
			   <label>Registration End Date*</label>
			   <input type="text" id="regEndDate" class="form-control tournamentDate" style="background: transparent;" data-date-format="yyyy-mm-dd" required="required" readonly>
			 </div> -->
			 <div class=""> 
			    <label>Tournament End Date*</label>
				<input type="text" id="tournamentEndDate"  class="form-control tournamentDate" style="background: transparent;" data-date-format="yyyy-mm-dd" required="required" readonly>
			</div>
			<div class="">
				<select id="listdata" class="selectpicker" multiple data-live-search="true" data-max-options="3" required="required" ></select>
				
			</div>
	       </div>
		<button type="submit" class="btn btn-success waves-effect waves-light savebtn">Next</button>
       </form>
        <button type="" class="btn btn-success waves-effect waves-light backbtn" ng-click="showFeature(0);">Back</button>
    </div>
    <div class="col-sm-8" ng-show="show==2">
         <form ng-submit="postTournament()">
				<ul class="w3-ul" id="shiva" style="list-style-type: none;"> 
				 <li ng-repeat="x in buildCourt" style="width:100%;">
					 <input type="hidden" id="categoryId{{$index}}" style="border: none;" class="form-control" value="{{x.category_id}}">
					 <div>
					 <label style="color: #18d26e;">{{x.category_name}}</label>
					 </div>
					 <div class="col-sm-6" style="float: left;"> 
					 <label >Entry Fee</label>
					 <input type="text" id="entryFee{{x.category_id}}" class="form-control" pattern="\d*" maxlength="6" required="required">
					 </div>
					 <div class="col-sm-6" style="float: left;"> 
					 <label >Prize Money</label>
					 <input type="text" id="prizeMoney{{x.category_id}}" class="form-control" pattern="\d*" maxlength="6" required="required">
					</div>
				</li>
				</ul>
		        <button type="submit" class="btn btn-success waves-effect waves-light savebtn">Save & Next</button>
			</form>
			<button type="" class="btn btn-success waves-effect waves-light backbtn" ng-click="showFeature(1);">Back</button>
       </div>
       <div class="col-sm-2"></div>
     </div>
</div>	

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
      <div class="modal-body mx-3" style="font-family: 'Montserrat', sans-serif;font-size: 13px;color: #000;">
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
      <div class="modal-header text-center" style="background: #18d26e!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Change Password</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body centredisplay">
     <form ng-submit="validateChangePassword();" method="post" name="changePassword" ngNativeValidate>
     <p style="margin: 0px;color: red;font-size: 13px;">{{changePwdValidate}}</p>
        <div class="">
          <label>Enter Current Password *</label>
          <input type="text" id="oldPassword" ng-model="oldPassword" name="oldPassword" class="form-control" required="required" autocomplete="off" ng-click="changePwdValidate = null">
       </div>
      
        <div class="">
          <label>Enter New Password *</label>
          <input type="password" id="newPassword" ng-model="newPassword" name="newPassword" class="form-control" required="required" autocomplete="off" ng-click="changePwdValidate = null">
       </div> 
       <div class="">
          <label>Enter Repeat Password *</label>
          <input type="password" id="repeatPassword" ng-model="repeatPassword" name="repeatPassword" class="form-control" required="required" autocomplete="off" ng-click="changePwdValidate = null">
       </div>  
       <input type="hidden" id="existPassword" name="existPassword" value="${sessionScope['scopedTarget.userSession'].password}" class="form-control" required="required">
       <input type="hidden" id="changedPlayerId" name="changedPlayerId" value="${sessionScope['scopedTarget.userSession'].organiserId}" class="form-control" required="required">           
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-success" style="color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- changepwd -->
</section>
</main>
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  
  <script src="resources/player-home/lib/jquery/jquery.min.js"></script>
   
  <script src="resources/player-home/lib/jquery/jquery-migrate.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
 <!--  <script src="resources/player-home/lib/bootstrap/js/bootstrap.bundle.min.js"></script> -->
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
  
  <spring:url value="/resources/javascript/modules/drag-drop.js" var="dragdropjs"/>
  <script src="${dragdropjs}"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
   <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
   <spring:url value="/resources/javascript/custom/createTournament.js" var="createTournamentjs"/>
  <script src="${createTournamentjs}"></script>
  <spring:url value="/resources/javascript/domtoimage.js" var="domtoimagejs"/>
  <script src="${domtoimagejs}"></script>
  <spring:url value="/resources/javascript/FileSaver.js" var="FileSaverjs"/>
  <script src="${FileSaverjs}"></script>
  </div>
</body>
</html>
