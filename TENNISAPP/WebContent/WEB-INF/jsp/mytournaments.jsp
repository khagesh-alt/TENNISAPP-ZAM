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
  <!-- Bootstrap core CSS -->
  <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapmincss"/>
  <link rel="stylesheet" href="${bootstrapmincss}"> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Material Design Bootstrap -->
  <link href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/compiled-4.8.0.min.css?ver=4.8.0 "rel="stylesheet">
  <spring:url value="/resources/css/mdb.min.css" var="mdbmincss"/>
  <link rel="stylesheet" href="${mdbmincss}">
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
  <!-- Your custom styles (optional) -->
 <spring:url value="/resources/css/style.css" var="stylecss"/>
  <link rel="stylesheet" href="${stylecss}"> 
  <spring:url value="/resources/javascript/modules/drag-drop.js" var="dragdropjs"/>
  <script src="${dragdropjs}"></script>
  <!-- <script src="http://cdn.jsdelivr.net/g/jquery@1,jquery.ui@1.10%28jquery.ui.core.min.js+jquery.ui.widget.min.js+jquery.ui.mouse.min.js+jquery.ui.sortable.min.js%29,angularjs@1.2,angular.ui-sortable"></script> -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> -->
<spring:url value="/resources/javascript/angular.min.js" var="angularminjs"/>
  <script src="${angularminjs}"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet"/>
  
   <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
   <spring:url value="/resources/javascript/custom/mytournaments.js" var="mytournamentsjs"/>
  <script src="${mytournamentsjs}"></script>
  <spring:url value="/resources/javascript/domtoimage.js" var="domtoimagejs"/>
  <script src="${domtoimagejs}"></script>
  <spring:url value="/resources/javascript/FileSaver.js" var="FileSaverjs"/>
  <script src="${FileSaverjs}"></script>
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

.whitebackground {
    background-image: url(resources/images/orgbg.png);
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
	background-color: #ff3547 !important;
	color: #fff !important;
}

.dropdown:hover .dropdown-profile {
	display: block;
}

.view-span {
	color: #747373;
	font-size: .9rem;
	font-weight: 400;
	padding: 0px 5px 0px 0px;
	line-height: 5px;
	font-family: 'Montserrat', sans-serif;
}

.md-form label {
	top: .0rem;
}

.table th {
	font-weight: bold;
}

.table td, .table th {
	border-top: none;
	text-align: left;
	padding-top: 0px;
}

table.table td, table.table th {
	padding-top: 0px;
	padding-bottom: 1rem;
}

.columnDiv {
	float: left;
	width: 32%;
	padding: 10px;
}

.indigo {
	background-color: #ff3547 !important;
}

.searchInput {
	width: 155px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
	background-color: white;
	padding: 5px 12px 5px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
	margin-bottom: 10px;
}

.searchInput:focus {
	width: 75%;
}

select {
	display: inline-block !important;
}

.main {
	height: 100%;
}

.rounds {
	float: left;
	height: 100%;
	width: 200px;
	/* background: #eeeeee; */
}

.firstset {
	height: 100%;
	width: 100%;
	display: table;
}

.match {
	width: 100%;
	/* background: #eeeeee; */
	display: flex;
}

.match svg {
	margin: auto;
}

.matchparent {
	display: table-cell;
	vertical-align: middle;
}

.rounds h6 {
	width: 100%;
	text-align: center;
	padding: 5px;
}

[type=checkbox]:checked, [type=checkbox]:not (:checked ) {
	position: absolute;
	opacity: 1;
	pointer-events: visible;
}

.stockLiftList span {
	text-align: center;
	box-sizing: border-box;
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline-block;
	white-space: nowrap;
	font-size: 12px;
	text-align: center;
	padding: 8px 2px 8px 1px;
	color: #000;
	float: left;
}

a {
	color: #fff;
}

.cardmain {
	border: 1px solid #d6d2d2;
	margin-bottom: 5px;
}

.cardmain span {
	padding: 10px;
	font-weight: 600;
	display: block;
	width: 100%;
	text-align: center;
}

.cardmain:hover {
	border: 1px solid red;
}

.flip-card-back h6 {
	display: block;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
.tournament{
width: 100%;
text-align: center;
margin-bottom: 11px;
font-size: 13px;
}
.tournament h6{
width: 100%;
background: #ff3547;
padding: 5px;
color: #fff;
}
.backbtn {
    position: fixed;
    bottom: 20px;
    left: 10px;
}
.savebtn {
	position: fixed;
	bottom: 20px;
	right: 10px;
}
.inprogeress{
color: #ff9800;
font-size: 11px;
}
.yettoplay{
color: #ef3b1cbd;
font-size: 11px;
}
.completed{
color: #0ebb5a;
font-size: 11px;
}
.card.card-cascade.wider.reverse .card-body.card-body-cascade {
    z-index: 0;
}
.md-form textarea.md-textarea {
    overflow-y: hidden;
    padding: 0.4rem 0;
    resize: none;
}
table.glyphicon-hover .glyphicon {
  visibility: hidden;
}
table.glyphicon-hover td:hover .glyphicon {
  visibility: visible;
}
.visibleHidden {
visibility: hidden;
}
span.glyphicon-hover .glyphicon {
  visibility: hidden;
}
span.glyphicon-hover span:hover .glyphicon {
  visibility: visible;
}
.customLabel{
font-size: .8rem;
-webkit-transform: translateY(-140%);
transform: translateY(-140%);
}
.modal-backdrop.show {
    opacity: 0;
}
[type=checkbox]:checked, [type=checkbox]:not(:checked) {
    position: relative;
    opacity: 1;
    pointer-events: visible;
}
.centredisplay label {
    color: #000;
    margin-top: 5px;
    font-size: 15px;
}
.centredisplay input, .centredisplay textarea {
    border-radius: 0px;
    color: #000;
    border: 1px solid #000;
}
.fixed-header thead{
 display: table;
 table-layout: fixed;
 width: calc( 100% - 1em );
}
.fixed-header tbody{
 display: block;
 height: 220px;
 overflow: auto;
}
.fixed-header tbody tr {
    display:table;
    width:100%;
    table-layout:fixed;
}
 .fixed-header tbody tr td {
    overflow: hidden;
    text-overflow: ellipsis;
} 
</style>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl">
<div id="wait" style="display:none;z-index: 1;position:absolute;top:50%;left:50%;padding:2px;"><img src='http://icon-park.com/imagefiles/loading7_red.gif' width="64" height="64" /><br>Please Wait..</div>
<input type="hidden" name="popupmsg" id="popupmsg" value="${message}" />
<!--Main Navigation-->
    
      <nav class="navbar navbar-inverse mbackground">
            <div class="container-fluid">
               <div class="navbar-header">
                <a class="navbar-brand" href="mytournaments" style="color: #007bff"><span class="text-white">Tennis</span>App</a>
              </div>
            
              <div class="rightmenu">
               <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
                <a href="login"><span>Login</span></a>
                </c:if>
                <a href="createtournament" ><span>Create Tournament</span></a>
                <a href="" ng-click="myTournmentsCallBack()" style="font-weight: 600;">Tournaments</a>
                <div class="dropdown" style="padding: 18px;">Register
                <div class="dropdown-profile">
				    <a data-toggle="modal" data-target="#sideModalTR">Register Player</a>
				    <!-- <a data-toggle="modal" data-target="#bulkUploadPopup">Upload Player list</a> -->
				    <a href="downloadPlayersListWithDetails">Download Existing Players</a>
				  </div>
                </div>
                
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
				<a href="upcomingtournament"><span>Upcoming Tournaments</span></a>
				</c:if>
				<c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
				<div class="dropdown" style="width: 160px;">
				<span class="white-text pb-2 pt-1 dropbtn" style="text-transform: uppercase;"><i class="fas fa-user-circle" style="font-size: 15px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</span>
				  <div class="dropdown-profile">
				    <a data-toggle="modal" data-target="#modelplayerProfile">PROFILE</a>
				    <a data-toggle="modal" data-target="#modelChangePassword">CHANGE PASSWORD</a>
				    <a href="./logout">LOGOUT</a>
				  </div>
				</div>
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
						<strong>Success!  {{successmsg}} </strong>
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
	<div style="width: 100%;float: right;" ng-show="show==0">
	<label class="checkbox-inline" style="float: right;"><input type="checkbox" style="position: inherit;" data-ng-model='mactive' ng-init="mactive='pactive'" data-ng-true-value='pactive' data-ng-false-value=''/> Active</label>
	</div>
		   <!-- alert close -->
			</div>
<div ng-show="mytournamentdetails.length == 0" style="text-align: center; width: 100%;color: #fd0707;margin-top: 140px;"><h3>No Existing Tournaments</h3></div>

<div class="row" ng-show="show==0">
 <div class="col-sm-3"  ng-repeat="list in mytournamentdetails | filter:{active :mactive}" >
    <div class="cardmain">
	<div class=" flip-card">
	  <div class="flip-card-inner">
	    <div class="flip-card-front">
	      <img src="{{list.bannerImage}}" alt="Banner Image" style="width:100%;height:100%;">
	    </div>
	    <div class="flip-card-back">
	      <h6>{{list.venueName}}</h6> 
	      <div style="width: 100%; font-size: 12px;padding: 5px;">
	            <img src="resources/images/tennisplayer.png" alt="" style="width: 10%;height: 31px;">
	         <span style="font-weight: normal;padding: 0px;" class="glyphicon-hover">
	           <span>{{list.tournamentStartDate}} - {{list.tournamentEndDate}} <i class="glyphicon fas fa-pen" title="Edit Date" ng-click="updateTournamentDates(list.tournamentId,list.orgaizerId,list.title,list)" style="color: #fff;font-size: 14px;"></i></span>
	         </span>
	      </div> 
	      <p ng-if="list.conditionVal" style="font-size: 12px;">Registration Started</p>
	      <p ng-if="!list.conditionVal" style="font-size: 12px;">Registration Closed</p>
	      <p><a class="white-text justify-content-end" ng-click="openTournament(list)" style="float: right;padding: 6px;font-size: 13px;"><h6> More <i class="fas fa-angle-double-right"></i>
		  </h6></a></p>
	    </div>
	  </div>
	</div>
	 <span>{{list.title}}</span>
	</div>
	</div>				
</div>		
<!-- Second Screen tournament details Start -->			
<div class="row" ng-show="show==1">			
    <div class="col-sm-9" style="padding: 0px;">
				<h6 class="card-title" style="font-size: 15px;font-weight: bold;">{{tournamentCat.title}}</h6>
					
					<div class="card columnDiv"  ng-repeat="list in tournamentCat.categoryList" style="margin:5px;">
					  <div class="card-header" style="font-weight: bold;font-size: 15px;">
						<span>{{list.categoryName}}</span>
						 <span title="View" style="float: right;font-size: 20px;color: #ff3547!important;" ng-click="viewPlayersTournament(tournamentCat.tournamentId,list.categoryId,list.tournamentFee,list.playerList,list.tournamentFee,tournamentCat.tournamentStartDate,list.matchType,tournamentCat.title,list.categoryName)"><i class="far fa-eye"></i></span>
					  </div>
					  <div class="card-body">
						<table class="table">
						 <tbody>
							<tr>
							  <th scope="row" style="font-size: 14px;padding-bottom: 0.5rem;">Entry Fee:</th>
							  <td style="text-align: left;font-size: 14px;padding-bottom: 0.5rem;">{{list.tournamentFee}}</td>
							</tr>
							<tr>
							  <th scope="row" style="font-size: 14px;padding-bottom: 0.5rem;">Prize Money:</th>
							  <td style="text-align: left;font-size: 14px;padding-bottom: 0.5rem;">{{list.prizeMoney}}</td>
							</tr>
							<tr>
							  <th scope="row" style="font-size: 14px;padding-bottom: 0.5rem;">Player :</th>
							  <td style="text-align: left;color: red;font-size: 14px;padding-bottom: 0.5rem;">{{list.playerList.length}}</td>
							</tr>
							<tr>
							  <th ng-if="list.scheduleCreated" style="font-size: 14px;padding-bottom: 0.5rem;"><i class="fas fa-check" style="color: green;text-align: left;"></i> Schedule</th>
							  <th ng-if="!list.scheduleCreated" style="font-size: 14px;padding-bottom: 0.5rem;"><i class="fas fa-close" style="color: red;text-align: left;"></i> Schedule</th>
							</tr>
							<tr>
							 <th ng-if="list.drawsCreated" style="font-size: 14px;padding-bottom: 0.5rem;"><i class="fas fa-check" style="color: green;text-align: left;"></i> Draw</th>
							 <th ng-if="!list.drawsCreated" style="font-size: 14px;padding-bottom: 0.5rem;"><i class="fas fa-close" style="color: red;text-align: left;"></i> Draw</th>
							</tr>
						  </tbody>
						</table>
						</div>
					</div>
			</div>
			<div class="col-sm-3">
			<div class="mainSide">
			  <div class="tournament">
			  <h6>Tournament</h6>
			  <span>{{tournamentCat.tournamentStartDate}} - {{tournamentCat.tournamentEndDate}}</span>
			  </div>
			 <div class="tournament">
			  <h6>Registration</h6>
			  <span>{{tournamentCat.regStartDate}} - {{tournamentCat.regEndDate}}</span>
			  </div>
			  <div class="tournament">
			  <h6>Details</h6>
			  <p>{{tournamentCat.organizerName}}</p>
			  <p>{{tournamentCat.phone}}</p>
			  <p>{{tournamentCat.email}}</p>
			  <p>{{tournamentCat.venueName}}</p>
			  <p>{{tournamentCat.location}}</p>
			  <p>{{tournamentCat.refereeName}}</p>
			  </div>
			  <div class="tournament">
			  <a class="btn btn-primary" style="background: #efe0e0 !important;color: #ff3547!important;padding: 6px;" ng-click="ViewTournamentLavelSchedule(tournamentCat.tournamentId,tournamentCat.title)">VIEW SCHEDULE</a>
			 </div>
			   <div class="tournament">
			  <a ng-if="!enableButton.scheduleCreated" class="btn btn-primary" style="padding: 6px;background: #efe0e0 !important;color: #ff3547!important;" ng-click="createTournamentLavelSchedule(tournamentCat.tournamentId)">CREATE SCHEDULE</a>
			  <a ng-if="enableButton.drawsCreated && enableButton.scheduleCreated" class="btn btn-primary" style="padding: 6px;background: #efe0e0 !important;color: #ff3547!important;" ng-click="createTournamentLavelSchedule(tournamentCat.tournamentId)">UPDATE SCHEDULE</a><br>
			  </div>
			</div>
			</div>
			<button type="submit" class="btn btn-danger waves-effect waves-light backbtn" ng-click="showFeature(0)">BACK</button>
</div>			

<!-- player view start -->
<div class="row" ng-show="show==2">	
 <div class="col-sm-1"></div>
 <div class="col-sm-10">
 <ul class="nav nav-tabs nav-justified md-tabs indigo" id="myTabJust" role="tablist">
				  <li class="nav-item">
				    <a class="nav-link active" id="players-tab-just" data-toggle="tab" href="#players-just" role="tab" aria-controls="players-just"
				      aria-selected="true">Players</a>
				  </li>
				  <li class="nav-item" ng-click="getDraws()">
				    <a class="nav-link" id="draws-tab-just" data-toggle="tab" href="#draws-just" role="tab" aria-controls="draws-just"
				      aria-selected="false">Draws</a>
				  </li>
			   </ul>
				<div class="tab-content card pt-5" id="myTabContentJust" style="overflow: auto;" >
				  <div class="tab-pane fade" id="draws-just" role="tabpanel" aria-labelledby="draws-tab-just" style="width: 100%;">
				  <div style="width: 100%;display: inline-block;">
				  <i class="fas fa-download" style="font-size: 20px;color: #ff3547;float: left;cursor: pointer;" title="Download Draw" ng-click="download()"></i>&nbsp;&nbsp;&nbsp;
				  
				  <input type="checkbox" ng-model="drawPublish" style="position: inherit;" ng-click="activeOrInActiveDrawPublish(drawPublish)"> Publish Draw
				  
				   <div ng-if="compaireDate == false" style=" float: right;">
						<div ng-if="rounds.length <= 0 && playerListForAcategory.length > 0" class="text-right"> <a href="" class="btn btn-primary" style="background-color: #ff3547!important;" ng-click="adjustmentRakByOrg()">Create</a></div>
						<div ng-if="rounds.length > 0" class="text-right"><a href="" class="btn btn-primary" style="background-color: #ff3547!important;" ng-click="adjustmentRakByOrg()">Update</a></div>
				   </div>
				   </div>
				   <div ng-if="rounds.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Draw not created yet!</h6></div>
				   
				  <div ng-if="rounds.length == 3" id="downloaddraw3" style="background-color: #ffffff;">
				  <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				     <%-- <jsp:include page="/WEB-INF/jsp/svg3.jsp" /> --%>
				     <jsp:include page="/WEB-INF/jsp/svgSingle3.jsp" />
				  </div>
				  <div ng-if="rounds.length == 4" id="downloaddraw4" style="background-color: #ffffff;">
				  <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				  <jsp:include page="/WEB-INF/jsp/svgSingle4.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 5" id="downloaddraw5" style="background-color: #ffffff;">
				  <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				  <jsp:include page="/WEB-INF/jsp/svgSingle5.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 6" id="downloaddraw6" style="background-color: #ffffff;">
				  <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				  <jsp:include page="/WEB-INF/jsp/svgSingle6.jsp" /> 
				  </div>
				  </div>
				  <div class="tab-pane fade show active" id="players-just" role="tabpanel" aria-labelledby="players-tab-just" style="overflow: auto;">
				  <div style="width: 100%;display: inline-block;">
				  <h6 class="card-title" style="display: inline-block;font-size: 15px;font-weight: bold;">{{tournamentCat.title}} ({{catTtle}})</h6>
				  <a ng-if="compaireDate == false" href="" class="btn btn-primary" style="background-color: #ff3547!important;float: right;" ng-click="addExistingPlayer()">+ADD PLAYER</a>
				  <a ng-if="compaireDate == false  && matchTypeReg == 1" href="" class="btn btn-primary" style="background-color: #ff3547!important;float: right;" data-toggle="modal" data-target="#bulkUploadPopupForSingle">BULK UPLOAD</a>
				  <a ng-if="compaireDate == false  && matchTypeReg == 2" href="" class="btn btn-primary" style="background-color: #ff3547!important;float: right;" data-toggle="modal" data-target="#bulkUploadPopupForDouble">BULK UPLOAD</a>
				  <h6 ng-if="compaireDate == true" style="color: red;text-align: right;font-size: 13px;">Tournament started, No players can be registered!</h6>
				  </div>
				  
				      <table class="table glyphicon-hover" id="adjRankTab">
						  <thead>
						    <tr>
						      <th scope="col">Seeding</th>
						      <th scope="col">Name</th>
						      <th scope="col">Age</th>
						      <th scope="col">Mob.</th>
						      <th scope="col">Email</th>
						      <th scope="col">AITA Id</th>
						      <th scope="col">AITA Rank</th>
						     <th scope="col"></th>
						    </tr>
						  </thead>
						  <tbody ui-sortable ng-model="playerListForAcategory">
						    <tr ng-repeat="players in playerListForAcategory">
						      <td style="display: none;">{{players.playerId}}</td>
						      <td ng-if="playerListForAcategory.length <=8" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 1}">{{$index+1}}</td>
						      <td ng-if="playerListForAcategory.length >8 && playerListForAcategory.length <=16" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 3}">{{$index+1}}</td>
						      <td ng-if="playerListForAcategory.length >16 && playerListForAcategory.length <=32" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 7}">{{$index+1}}</td>
						      <td ng-if="playerListForAcategory.length >32 && playerListForAcategory.length <=64" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index >15}">{{$index+1}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-click="editPlayerDetails(players)">{{players.name}} <i class="glyphicon fas fa-pen" style="color: #ff3547;"></i></td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.playerAge}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.phone}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.email}}</td>
						      <td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
						      <td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.itaId}}</td>
						      <td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
						      <td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.points}}</td>
						      <td ng-if="players.registeredBy == 1  && compaireDate == false" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">
						      <i class="fas fa-trash-alt" style="font-size: 11px;color: #000; padding: 2px;" ng-click="deleteFromTournament(players.playerId,players.paymentId,players.name)"></i>
						      </td>
						      <td ng-if="players.registeredBy == 0" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;"></td>
						    </tr>
						  </tbody>
						</table>
						<div ng-if="playerListForAcategory.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Players not registered yet!</h6></div>
				  </div>
				</div>
 <button type="" class="btn btn-danger waves-effect waves-light backbtn" ng-click="showFeature(101);">Back</button>
 </div>
</div>


</div>

	<!-- Side Modal Top Right -->
<div class="modal fade right show" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
          <div class="modal-body centredisplay">
          <form ng-submit="addPlayerByOrganizer()" name="registerByOrg" ngNativeValidate>
           <p style="margin: 0px;color: red;font-size: 14px;">{{registerPlayerValidate}}</p>
            <div class="">
              <label>Name *</label>
              <input type="text" id="playerName" class="form-control" ng-model="playerName" name="playerName" maxlength="25" required="required" autocomplete="off" ng-click="registerPlayerValidate = null">
            </div>
			<div class="">
			  <label>Phone *</label>
              <input type="text" id="playerPhone" class="form-control" ng-model="playerPhone" name="playerPhone" ng-pattern="/^[0-9]{10}$/" maxlength="10" autocomplete="off" required="required" ng-click="registerPlayerValidate = null">
              <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerPhone.$error.number">Not valid number!</span>
              <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerPhone.$dirty&&registerByOrg.playerPhone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
            </div>
			<div class="">
			  <label>Email *</label>
              <input type="email" id="playerEmail" class="form-control" ng-model="playerEmail" name="playerEmail" maxlength="25" required="required" autocomplete="off" ng-click="registerPlayerValidate = null">
			  <span style="color:Red;font-size: .8em;" ng-show="registerByOrg.playerEmail.$dirty&&registerByOrg.playerEmail.$error.email">Not valid email!</span>
            </div>
			<div class="">
			  <label>Address *</label>
              <textarea type="text" id="playerAddress" ng-model="playerAddress" name="playerAddress" class=" form-control" rows="1" maxlength="150" required="required" autocomplete="off" ng-click="registerPlayerValidate = null"></textarea>
            </div>
            <div class="">
            <label>Date Of Birth *</label>
            <input type="text" id="dateOfBirth" name="dateOfBirth" class="form-control tournamentDate" data-date-format="yyyy-mm-dd" required="required" autocomplete="off" readonly>
            </div>
            <div class="">
               <div class="row">
                 <div class="col-sm-12"> 
                   <label for="address">Select Ranking*</label>
		           <select ng-model="rankItem" ng-options="rankdata.rankName for rankdata in rankList" class="form-control" name="rankItem" id="rankid">
                   </select>
                       </div>
                </div>
                </div>
            <div class="" ng-if="rankItem.rankId != 1">
                  <div class="row">
                      <div class="col-sm-6"> 
                      <label>ID</label>
                      <input type="text" id="playerItaId" name="playerItaId" class="form-control" pattern="\d*" maxlength="10" autocomplete="off" ng-click="registerPlayerValidate = null">
                  </div>
                  <div class="col-sm-6"> 
                     <label>Rank</label>
                     <input type="text" id="playerItaRank" name="playerItaRank" class="form-control" pattern="\d*" maxlength="10" autocomplete="off" ng-click="registerPlayerValidate = null">
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
  <div class="modal-dialog modal-side modal-top-right" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
      <h6 class="modal-title w-100 font-weight-bold">Change Password</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body centredisplay">
     <form ng-submit="validateChangePassword();" method="post" name="changePassword" ngNativeValidate>
     <p style="margin: 0px;color: red;font-size: 14px;">{{changePwdValidate}}</p>
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
          <input type="password" id="repeatPassword" ng-model="repeatPassword" name="repeatPassword" class="form-control" required="required" ng-click="changePwdValidate = null">
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
<!-- add player from list  -->
<!-- Central Modal Small -->
<div class="modal fade" id="addPlayerFromlist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Change class .modal-sm to change the size of the modal -->
  <div class="modal-dialog modal-lg" role="document">


    <div class="modal-content">
      <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
        <h6 class="modal-title w-100" id="myModalLabel">ADD PLAYER TO TOURNAMENT</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p style="margin: 0px;color: green;font-size: 14px;">{{doublePlayersValidate}}</p>
      <input type="text" class="searchInput" ng-model="searchtext" placeholder="Search..">
      <a ng-if="matchTypeReg == 2" class="btn btn-primary" style="background-color: #ff3547!important;float: right;padding: 5px !important;" ng-click="addToTournamentDoubles()">+ADD</a>
      <div  style="height: 450px;overflow: auto;">
       <table class="table" id="ItemsTable">
		  <thead>
			<tr>
			  <th scope="col">#</th>
			  <th scope="col">Name</th>
			  <th scope="col">Age</th>
			  <th scope="col">Mob.</th>
			  <th scope="col">Email</th>
			  <th scope="col">AITA Id</th>
			  <th scope="col">AITA Rank</th>
			  <th scope="col" ng-if="matchTypeReg == 1">ADD</th>
		   </tr>
		 </thead>
		 <tbody ng-if="matchTypeReg == 1" style="">
		     <tr ng-repeat="existplayers in existingPlayers | filter:searchtext">
			  <th scope="row" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{$index+1}}</th>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.name}}">{{existplayers.name}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.playerAge}}">{{existplayers.playerAge}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.phone}}"><p>{{existplayers.phone}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.email}}"><p>{{existplayers.email}}</p></td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.itaId}}">{{existplayers.itaId}}</td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.itaRank}}">{{existplayers.itaRank}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;"><button type="button" class="btn btn-danger" style="padding: 5px !important;" ng-click="addToTournament(existplayers,$index)">+ADD</button></td>
			 </tr>
		</tbody>
		<tbody ng-if="matchTypeReg == 2">
		     <tr ng-repeat="existplayers in existingPlayers | filter:searchtext">
		      <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;"><input type="checkbox" name="record"></td>
		      <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.name}}</td>
		      <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.playerAge}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.phone}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.email}}</td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.itaId}}</td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{existplayers.itaRank}}</td>
			  <td style="display: none;">{{existplayers.itaRank}}</td>
			  <td style="display: none;">{{existplayers.playerId}}</td>
			 </tr>
		</tbody>
	 </table>
	 </div>
      </div>
    </div>
  </div>
</div>
<!-- Central Modal Small -->

<!-- add player from list close -->
<!-- Alert Popup Open -->
<div class="modal fade" style="z-index: 10500;" id="alertPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
<div class="modal fade" style="z-index: 10500;" id="secalertPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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

<!-- Schedule Popup Open -->

<!-- Full Height Modal Right -->
<div class="modal fade bottom " id="updateSchedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static"  aria-hidden="true">
  <div class="modal-dialog modal-full-height modal-bottom" role="document">

    <div class="modal-content">
      <div class="modal-header" style="background-color: #ff3547 !important;color: #fff;text-align: center;">
        <h6 class="modal-title w-100" id="myModalLabel">SCHEDULE</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color: #fff;">&times;</span>
        </button>
      </div>
      <div class="modal-body">
					<div style="width: 100%; padding: 10px; margin-bottom: 5px;text-align: center;">

						<span
							style="text-align: center; font-size: 11px; float: left; padding: 5px;">Avg
							time to complete a match:* </span> <input type="number"
							class="form-control" name="avgTime" ng-model="avgTime"
							id="avgTime" style="font-size: 10px; float: left; width: auto;" ng-click="scheduleValidate = null">
							
							<p style="margin: 0px;color: red;font-size: 14px;">{{scheduleValidate}}</p>
							
							<span style="float: right;font-weight: 600;font-size: 14px;">No. of court: {{daysAndMatch.court.length}}</span>
					</div>
					<div style="width: 100%;">
						<div style="float: left; width: 80%; padding-left: 10px;">
						<div style="float: left;width: 50%;text-align: center;margin-top: 5px;color: #ff3547 !important;">AM</div>
						<div style="float: right; width: 50%;text-align: center;margin-top: 5px;color: #ff3547 !important;">PM</div>
							<table style="width: 100%">
								<tr ng-repeat="n in daysAndMatch.days"
									on-finish-render="ngRepeatFinished">
									<td style="font-weight: bold; font-size: 10px;">{{n.date}}</td>
									<td style="padding: 5px 10px 5px 10px; font-size: 10px;">Start
										Time:*<input type="text" id="firstStart{{$index}}"
										class="form-control timePicker" style="font-size: 10px;" ng-click="scheduleValidate = null">
									</td>
									<td style="padding: 5px 10px 5px 10px; font-size: 10px;">End
										Time:*<input type="text" id="firstEnd{{$index}}"
										class="form-control timePicker" style="font-size: 10px;" ng-click="scheduleValidate = null">
									</td>
									<td style="padding: 5px 10px 5px 10px; font-size: 10px;">Start
										Time:*<input type="text" id="secondStart{{$index}}"
										class="form-control timePicker" style="font-size: 10px;" ng-click="scheduleValidate = null">
									</td>
									<td style="padding: 5px 10px 5px 10px; font-size: 10px;">End
										Time:*<input type="text" id="secondEnd{{$index}}"
										class="form-control timePicker" style="font-size: 10px;" ng-click="scheduleValidate = null">
									</td>
									<td style="display: none;" id="avaldate{{$index}}">{{n.date}}</td>
								</tr>
							</table>
						</div>
						<div
							style="float: left; width: 17%; padding-left: 10px; text-align: center;">
							<a href="" class="btn btn-primary"
								style="background-color: #ff3547 !important; margin-top: 25px;"
								ng-click="adjustmentSchedule()">Schedule</a>
						</div>
					</div>
				</div>
      <div class="modal-footer justify-content-center">
       <!--  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Full Height Modal Right -->


<!-- Schedule Popup Close -->

<!-- Modal -->
<div class="modal fade" id="confirmationpopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body confirmmsg">
      </div>
      <div class="modal-footer" style="padding: 5px;">
        <button type="button" class="btn btn-primary" style="background-color: #ff3547 !important;padding: 6px 12px 6px 12px;" ng-click="deletePlayer()">OK</button>
        <button type="button" class="btn btn-secondary" style="background-color: #ff3547 !important;padding: 6px 12px 6px 12px;" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="confirmationPopupForSchedule" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body confirmschedulemsg">
      </div>
      <div class="modal-footer" style="padding: 5px;">
        <button type="button" class="btn btn-primary" style="background-color: #ff3547 !important;padding: 6px 12px 6px 12px;" ng-click="getConfirmedShedule()">Continue</button>
        <button type="button" class="btn btn-secondary" style="background-color: #ff3547 !important;padding: 6px 12px 6px 12px;" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<!-- Tournament Lavel Schedule open model -->
<!-- Button trigger modal-->

<!-- Modal: modalCart -->
<div class="modal fade" id="scheduleTournamentLavel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header" style="background-color: #ff3547 !important;color: #fff;">
        <!-- <h4 class="modal-title" id="myModalLabel">SCHEDULE</h4> -->
         <div style="width: 100%;">
            <span style="float: left;padding: 5px;">No. of courts : {{daysAndMatch.court.length}}</span>
           <select ng-model="matchRoundFilter" class="form-control" style="float: right;font-size: 11px;width: auto; margin-right: 10px;">
			 <option value>ALL ROUNDS</option>
			 <option ng-repeat="obj in tournamentLvlSch | unique:'round'" value="{{obj.round}}">{{obj.round}}</option>
     	   </select>
     	   <select ng-model="matchStatusFilter" class="form-control" style=" margin-right: 10px;float: right;font-size: 11px;width: auto;">
			  <option value>ALL MATCHES</option>
			  <option ng-repeat="obj in tournamentLvlSch | unique:'matchStatus'" value="{{obj.matchStatus}}">{{obj.matchStatus}}</option>
	       </select>
	       <select ng-model="matchCategoryFilter" class="form-control" style="margin-right: 10px;float: right;font-size: 11px;width: auto;">
			  <option value>ALL CATEGORY</option>
			  <option ng-repeat="obj in tournamentLvlSch | unique:'categoryName'" value="{{obj.categoryName}}">{{obj.categoryName}}</option>
	       </select>
	       <i class="fas fa-download" style="font-size: 20px;color: #fff;padding: 5px 15px 0px 0px;float: right;cursor: pointer;" title="Download Schedule" ng-click="downloadschedule()"></i>
     	 </div>  
     	   
     	   
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color: #fff !important;">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body" id="scheduleListTable" style="background-color: #fff;">
     <!--  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
	  <li class="nav-item" ng-repeat="obj in tournamentLvlSch | unique:'categoryName'">
	    <a class="nav-link " id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" ng-model="matchCategoryFilter"
	      aria-controls="pills-home" aria-selected="true">{{obj.categoryName}}</a>
	  </li>
	</ul> -->
	<p id="scheduleListTitleShow" style="font-weight: bold;">{{titleName}}</p>
         <table class="table">
				<thead>
				   <tr>
					 <th scope="col" style="text-align: center;">Match</th>
					 <th scope="col" style="text-align: center;" ng-click="sort('scheduleDate','scheduleDate')">Date
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='scheduleDate,scheduleDate'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;">Time</th>
					 <th scope="col" style="text-align: center;" ng-click="sort('court','court')">Court
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='court,court'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;" ng-click="sort('roundNo','roundNo')">Round
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='roundNo,roundNo'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;">Status</th>
					 <th scope="col" style="text-align: center;" ng-click="sort('categoryName','categoryName')">Category
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='categoryName,categoryName'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;">Score</th>
					</tr>
				</thead>
				<tbody>
				  <tr ng-repeat="obj in tournamentLvlSch | filter:{matchStatus:matchStatusFilter,matchStatus:matchStatusFilter||undefined,round:matchRoundFilter,round:matchRoundFilter||undefined,categoryName:matchCategoryFilter,categoryName:matchCategoryFilter||undefined}:true | filter: checkByMatch('isbyMatch') | orderBy:sortKey:reverse">
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">
					<div ng-if="obj.matchStatus != 'COMPLETED'">
					{{obj.player1}} <label style="padding: 0px 5px 0px 5px;font-weight: 600;">vs</label> {{obj.player2}}
					</div>
					<div ng-if="obj.matchStatus == 'COMPLETED'">
					<span ng-if="obj.winner == 1" style="color: #0ebb5a;">{{obj.player1}}</span>
					<span ng-if="obj.winner != 1">{{obj.player1}}</span>
					<label style="padding: 0px 5px 0px 5px;font-weight: 600;">vs</label>
					<span ng-if="obj.winner == 3" style="color: #0ebb5a;">{{obj.player2}}</span>
					<span ng-if="obj.winner != 3">{{obj.player2}}</span>
					</div>
					</td>
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{obj.scheduleDate}}</td>
				    <td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{obj.startTime}} - {{obj.endTime}}</td>
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{obj.court}}</td>
					<td style="text-align: center;text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{obj.round}}</td>
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'
							inprogeress': obj.matchStatus == 'IN-PROGRESS','yettoplay': obj.matchStatus == 'YET-TO-PLAY','completed': obj.matchStatus == 'COMPLETED'}"><i class="fas fa-baseball-ball"></i></td>
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="set1,set2,set3">{{obj.categoryName}}</td>
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="set1,set2,set3">{{obj.score}}</td>
				</tr>
			</tbody>
		</table>

      </div>
      <!--Footer-->
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!-- Modal: modalCart -->

<!-- Tournament lavel schedule close model  -->
<div class="modal fade" id="modalUpdateScoreForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h6 class="modal-title w-100 font-weight-bold">Update Score</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
      <form class="text-center" style="color: #757575;" ng-submit="updatePlayerScores()">
      <p style="margin: 0px;color: red;font-size: 14px;">{{scoreValidate}}</p>
		<label></label>
		<table style="width:100%">
			<tr>
			  <th style="padding: 5px;">{{updateScoreData.playerName1}} : </th>
			  <td style="padding: 5px;">Set1 <input type="number" id = "playerfirst1" name="playerfirst1" ng-model="playerfirst1" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;">Set2 <input type="number" id = "playerSecond1" name="playerSecond1" ng-model="playerSecond1" class="form-control"  value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;">Set3 <input type="number" id = "playerThird1" name="playerThird1" ng-model="playerThird1" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			</tr>
			<tr>
			  <th style="padding: 5px;">{{updateScoreData.playerName2}} : </th>
			  <td style="padding: 5px;"> <input type="number" id="playerfirst2" name="playerfirst2" ng-model="playerfirst2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;"> <input type="number" id="playerSecond2" name="playerSecond2" ng-model="playerSecond2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;"> <input type="number" id="playerThird2" name="playerThird2" ng-model="playerThird2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			</tr>
		</table>
		<label></label>
        <input type="hidden" id="team1" name="team1" value="{{updateScoreData.team1}}">
		<input type="hidden" id="team2" name="team2" value="{{updateScoreData.team2}}">
		<button type="submit" class="btn btn-danger">UPDATE</button>
		 <a class="btn btn-primary" style="background-color: #ff3547 !important;" data-dismiss="modal">Close</a>
	</form>
    </div>
    <div class="modal-footer d-flex justify-content-center">
     </div>
    </div>
  </div>
</div>
<!-- Edit Player Modal -->
<div class="modal fade" id="editDoublesPalyer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Player</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body centredisplay">
      <p style="margin: 0px;color: red;font-size: 14px;">{{updatePlayersValidate}}</p>
	      <form ng-submit="postEditPlayerDetails();" method="post" ng-if="matchTypeReg == 2">
	        <div class="">
	        <label>First Player*</label>
	          <input type="text" id="editPlayer1" name="editPlayer1" value="{{editPlayer1}}" class="form-control" required="required" ng-click="deletePlayerValidate()">
	       </div>
	        <div class="">
	        <label>Second Player*</label>
	          <input type="text" id="editPlayer2" name="editPlayer2" value="{{editPlayer2}}" class="form-control" required="required" ng-click="deletePlayerValidate()">
	       </div> 
	      <div style="text-align: center;">
	        <button type="submit" class="btn btn-unique" style="background:#ff3547!important;">Update</button>
	      </div>
	      </form>
	      <form ng-submit="postEditSinglePlayerDetails();" method="post" ng-if="matchTypeReg == 1">
	        <div class="">
	          <label >Player*</label>
	          <input type="text" id="editPlayer" name="editPlayer" value="{{editPlayer}}" class="form-control" required="required" ng-click="deletePlayerValidate()">
	       </div>
	      <div style="text-align: center;">
	        <button type="submit" class="btn btn-unique" style="background:#ff3547!important;">Update</button>
	      </div>
	      </form>
      </div>
    </div>
  </div>
</div>
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
							<a href="downloadExcelFormat" style="color: blue;">Download format</a>
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
<!-- Bulk upload for Single -->
<div class="modal fade" id="bulkUploadPopupForSingle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
		<div class="modal-dialog" role="document">
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
							<a href="downloadExcelFormat" style="color: blue;">Download format</a>
						</div>
					<form ng-submit="bulkUploadAndRegisterForSingle()">
						<div class="md-form">
							<input type="file" id="bulkUploadFileForSingle" class="form-control"	name="bulkUploadFileForSingle" accept=".xls,.xlsx,.csv" required="required" placeholder="Select File">
						</div>
						<div style="text-align: center; width: 100%;">
						<p style="margin: 0px;color: red;font-size: 14px;">{{uploadSingleMatchPlayers}}</p>
							<button type="submit" class="btn btn-danger">Upload</button>
						</div>
					</form>
				</div>
				<!--Footer-->
			</div>
			<!--/.Content-->
		</div>
	</div>
<!-- Bulk upload for single close -->
<!-- Extend Date  -->
<div class="modal fade right show" id="extendsTournament" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
      <div class="modal-dialog modal-side modal-top-right" role="document">
        <!--Content-->
        <div class="modal-content">
          <!--Header-->
          <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
            <h6 class="modal-title w-100">{{extendTitle}}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <!--Body-->
          <div class="modal-body centredisplay">
          <p style="margin: 0px;color: red;font-size: 14px;">{{tournamentDateValidate}}</p>
          <form ng-submit="extendsTournament()">
            <div class="">
             <label>Registration Start Date*</label>
            <input type="text" id="updateRegStartDate" name="updateRegStartDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null">
            </div>
            <div class="">
            <label>Registration End Date*</label>
            <input type="text" id="updateRegEndDate" name="updateRegEndDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null">
            </div>
            <div class="">
            <label>Tournament Start Date*</label>
            <input type="text" id="updateTournamentStartDate" name="updateTournamentStartDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null">
            </div>
            <div class="">
            <label>Tournament End Date*</label>
            <input type="text" id="updateTournamentEndDate" name="updateTournamentEndDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null">
            </div>
               <div style="text-align: center;width: 100%;"> <button type="submit" class="btn btn-danger">Update</button></div>
		  </form>
          </div>
          <!--Footer-->
        </div>
        <!--/.Content-->
      </div>
    </div>
<!-- Extend Date -->
<!-- Bulk upload for Double -->
<div class="modal fade" id="bulkUploadPopupForDouble" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
		<div class="modal-dialog" role="document">
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
							 <a href="downloadExcelFormatForDoubles" style="color: blue;">Download format</a>
						</div>
					<form ng-submit="bulkUploadAndRegisterForDouble()">
						<div class="md-form">
							<input type="file" id="bulkUploadFileForDouble" class="form-control" name="bulkUploadFileForDouble" accept=".xls,.xlsx,.csv" required="required" placeholder="Select File">
						</div>
						<div style="text-align: center; width: 100%;">
						<p style="margin: 0px;color: red;font-size: 14px;">{{uploadDoubleMatchPlayers}}</p>
							<button type="submit" class="btn btn-danger">Upload</button>
						</div>
					</form>
				</div>
				<!--Footer-->
			</div>
			<!--/.Content-->
		</div>
	</div>
<!-- Bulk upload for Double close -->
 <!-- SCRIPTS -->
    <!-- JQuery -->
  <spring:url value="/resources/javascript/jquery-3.3.1.min.js" var="jquery331minjs"/>
  <script src="${jquery331minjs}"></script>
    <!-- Bootstrap tooltips -->
  <spring:url value="/resources/javascript/popper.min.js" var="popperminjs"/>
  <script src="${popperminjs}"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Bootstrap core JavaScript -->
  <spring:url value="/resources/javascript/bootstrap.min.js" var="bootstrapminjs"/>
  <script src="${bootstrapminjs}"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.js" type="text/javascript" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <!-- MDB core JavaScript -->
  <spring:url value="/resources/javascript/mdb.min.js" var="mdbminjs"/>
  <script src="${mdbminjs}"></script>
</body>
</html>