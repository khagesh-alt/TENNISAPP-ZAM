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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- Material Design Bootstrap -->
  <spring:url value="/resources/css/mdb.min.css" var="mdbmincss"/>
  <link rel="stylesheet" href="${mdbmincss}"> 
  <link href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/compiled-4.8.0.min.css?ver=4.8.0 "rel="stylesheet">
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <spring:url value="/resources/css/style.css" var="stylecss"/>
  <link rel="stylesheet" href="${stylecss}"> 
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
   <spring:url value="/resources/javascript/custom/upcomingTournaments.js" var="upcomingTournamentsjs"/>
  <script src="${upcomingTournamentsjs}"></script>
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
	width: 100%;
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
h6.glyphicon-hover .glyphicon {
  visibility: hidden;
}
h6.glyphicon-hover span:hover .glyphicon {
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
.centredisplay label{
 margin-top: 5px;
 font-size: 15px;
}
.centredisplay input{
    border-radius: 0px;
    background: transparent;
} 
.centredisplay textarea{
   border-radius: 0px;
    background: transparent;
}
</style>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl" ng-init="init()">
<!--Main Navigation-->
    
        <nav class="navbar navbar-inverse mbackground">
            <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="mytournaments" style="color: #007bff"><span class="text-white">Tennis</span>App</a>
              </div>
            
              <div class="rightmenu">
              <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
                <!-- <a href="organiserlogin">Create Tournament</a> -->
                <a href="login"><span>Login</span></a>
                <div class="dropdown">
                <span class="white-text pb-2 pt-1 dropbtn"><i class="fas fa-align-justify"></i></span>
                 <div class="dropdown-profile" style="right: -20px;">
				    <a href="organiserlogin">Create Tournament</a>
				  </div>
               </div>
                </c:if>
                 <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 1}">
                <a href="mytournaments" ><span>Tournaments</span></a>
                </c:if>
				<c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
				<c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
				<div class="dropdown" style="padding: 18px;">
				<span class="white-text pb-2 pt-1 dropbtn" style="text-transform: uppercase;"><i class="fas fa-user-circle" style="font-size: 15px;padding: 3px;"></i>${sessionScope['scopedTarget.userSession'].name}</span>
				  <div class="dropdown-profile">
				    <a data-toggle="modal" data-target="#modelplayerProfile">PROFILE</a>
				    <a data-toggle="modal" data-target="#modelChangePassword">CHANGE PASSWORD</a>
				    <a href="./playerlogout">LOGOUT</a>
				  </div>
				</div>
				</c:if>
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
	
	
	<input type="hidden" name="popupmsg" id="popupmsg" value="${sessionScope['scopedTarget.userSession'].playerId}" />
	<input type="hidden" name="message" id="message" value="${message}" />
	
<div class="row" ng-show="show==0">
 <div class="col-sm-3"  ng-repeat="list in tournamentCategoryDetails" >
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
	         <span style="font-weight: normal;">
	           {{list.tournamentStartDate}} - {{list.tournamentEndDate}}
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
						 <span title="View" style="float: right;font-size: 20px;color: #ff3547!important;" ng-click="viewPlayersTournament(list.playerList,tournamentCat.tournamentStartDate,tournamentCat.tournamentId,list.categoryId,tournamentCat.title,list.categoryName)"><i class="far fa-eye"></i></span>
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
							<c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
							<tr>
							  <th scope="row" style="font-size: 14px;padding-bottom: 0.5rem;">Player :</th>
							  <td style="text-align: left;color: red;font-size: 14px;padding-bottom: 0.5rem;">{{list.playerList.length}}</td>
							</tr>
							<tr>
							  <th ng-if="list.scheduleCreated" style="font-size: 14px;padding-bottom: 0.5rem;" colspan = "2"><i class="fas fa-check" style="color: green;text-align: left;"></i> Schedule</th>
							  <th ng-if="!list.scheduleCreated" style="font-size: 14px;padding-bottom: 0.5rem;" colspan = "2"><i class="fa fa-close" style="color:red;text-align: left;"></i> Schedule</th>
							</tr>
							<tr>
							 <th ng-if="list.drawsCreated" style="font-size: 14px;padding-bottom: 0.5rem;"><i class="fas fa-check" style="color: green;text-align: left;"></i> Draw</th>
							 <th ng-if="!list.drawsCreated" style="font-size: 14px;padding-bottom: 0.5rem;"><i class="fas fa-close" style="color: red;text-align: left;"></i> Draw</th>
							<th style="font-size: 14px;padding-bottom: 0.5rem;">
							  <a class="btn btn-primary btn-danger" style="padding: 6px;" 
							       ng-click="registerPlayerForTournament(tournamentCat.tournamentId,list.categoryId,list.tournamentFee,list.matchType,list.playerId,list.categoryGender,list.catAge)">Register</a>
							  </th>
							
							</tr>
							<tr>
							 <th ng-show="${sessionScope['scopedTarget.userSession'].playerId} == list.playerId" style="font-size: 14px;padding-bottom: 0.5rem;" colspan = "2"><i class="fas fa-check" style="color: green;text-align: left;"></i> Registered</th>
							 <th ng-show="${sessionScope['scopedTarget.userSession'].playerId} != list.playerId" style="font-size: 14px;padding-bottom: 0.5rem;" colspan = "2"><i class="fas fa-close" style="color: red;text-align: left;"></i> Registered</th>
							</tr>
							
							</c:if>
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
			</div>
			</div>
			<button type="submit" class="btn btn-danger waves-effect waves-light backbtn" ng-click="showFeature(0)">BACK</button>
</div>	
<!-- Third Screen Players List Start -->		
<!-- player view start -->
<div class="row" ng-show="show==2">	
 <div class="col-sm-1"></div>
 <div class="col-sm-10">
       <ul class="nav nav-tabs nav-justified md-tabs indigo" id="myTabJust" role="tablist">
			      <li class="nav-item" ng-click="mainFunction()">
				    <a class="nav-link active" id="players-tab-just" data-toggle="tab" href="#players-just" role="tab" aria-controls="players-just"
				      aria-selected="true">Players</a>
				  </li>
				  <li class="nav-item" ng-click="getDraws()">
				    <a class="nav-link" id="draws-tab-just" data-toggle="tab" href="#draws-just" role="tab" aria-controls="draws-just"
				      aria-selected="false">Draws</a>
				  </li>
			   </ul>
				<div class="tab-content card pt-5" id="myTabContentJust" style="overflow: auto;">
				  <div class="tab-pane fade" id="draws-just" role="tabpanel" aria-labelledby="draws-tab-just" style="width: 100%;">
				  <i class="fas fa-download" style="font-size: 20px;color: #ff3547;width: 100%;float: left;cursor: pointer;" title="Download Draw" ng-click="download()"></i>
				  
				  <div ng-if="rounds.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Draw not created yet!</h6></div>
				  
				  <div ng-if="rounds.length > 0 && !drawPublish" style="text-align: center; width: 100%;color: #fd0707;"><h6>Draw not yet published!</h6></div>
				  
				  <div ng-if="rounds.length == 3 && drawPublish" id="downloaddraw3" style="background-color: #ffffff;">
				   <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				     <jsp:include page="/WEB-INF/jsp/svgSingle3.jsp"/>
				  </div>
				  <div ng-if="rounds.length == 4 && drawPublish" id="downloaddraw4" style="background-color: #ffffff;">
				   <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				  <jsp:include page="/WEB-INF/jsp/svgSingle4.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 5 && drawPublish" id="downloaddraw5" style="background-color: #ffffff;">
				   <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				  <jsp:include page="/WEB-INF/jsp/svgSingle5.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 6 && drawPublish" id="downloaddraw6" style="background-color: #ffffff;">
				   <div style="width: 100%;text-align: center;margin-bottom: 5px; font-weight: bold;">{{tournametTtl}} ({{catTtle}})</div>
				  <jsp:include page="/WEB-INF/jsp/svgSingle6.jsp" /> 
				  </div>
				  </div>
				  <div class="tab-pane fade show active" id="players-just" role="tabpanel" aria-labelledby="players-tab-just">
				  <%-- <div ng-if="playerListForAcategory.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Players not registered yet!</h6></div> --%>
				  <h6 class="card-title" style="display: inline-block;font-size: 15px;font-weight: bold;">{{tournamentCat.title}} ({{catTtle}})</h6>
				      <table class="table">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">Name</th>
						      <th scope="col">Age</th>
						      <th scope="col">Mob.</th>
						      <th scope="col">Email</th>
						      <th scope="col">AITA Id</th>
						      <th scope="col">AITA Rank</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr ng-repeat="players in playerListForAcategory">
						      <th ng-if="playerListForAcategory.length <=8" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 1}">{{$index+1}}</th>
						      <th ng-if="playerListForAcategory.length >8 && playerListForAcategory.length <=16" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 3}">{{$index+1}}</th>
						      <th ng-if="playerListForAcategory.length >16 && playerListForAcategory.length <=32" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 7}">{{$index+1}}</th>
						      <th ng-if="playerListForAcategory.length >32 && playerListForAcategory.length <=64" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 15}">{{$index+1}}</th>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.name}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.playerAge}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.phone}}</td>
						      <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.email}}</td>
						      <td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
						      <td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.itaId}}</td>
						      <td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
						      <td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.points}}</td>
						    </tr>
						  </tbody>
						</table>
						<div ng-if="playerListForAcategory.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Players not registered yet!</h6></div>
				  </div>
				</div>
			
       
 <button type="" class="btn btn-danger waves-effect waves-light backbtn" ng-click="showFeature(101);">Back</button>
 </div>
 <div class="col-sm-1">
 </div>
</div>


</div>	

<!-- Central Modal Small -->
<div class="modal fade" id="centralModalLg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: #ff3547!important;color: #fff;">
        <h4 class="modal-title w-100" id="myModalLabel"></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item" style="width: 50%;">
            <a class="nav-link active" id="loginPlayer-tab" data-toggle="tab" href="#loginPlayer" role="tab" aria-controls="home" aria-selected="true" style="color: blue;">Sign in</a>
          </li>
          <li class="nav-item" style="width: 50%;">
            <a class="nav-link" id="loginOrg-tab" data-toggle="tab" href="#loginOrg" role="tab" aria-controls="profile" aria-selected="false" style="color: blue;">Sign up</a>
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade show active" id="loginPlayer" role="tabpanel" aria-labelledby="loginPlayer-tab">
			  <%-- <form action="./playerLogin" method="post" name="loginByPlayer" ngNativeValidate> --%>
			  <form ng-submit="validatePlayerLogin()" name="loginByPlayer" ngNativeValidate>
			  
			  <p style="margin: 0px;color: red;font-size: 14px;">{{loginPlayerValidate}}</p>
			  
	            <div class="centredisplay">
	            <label for="userId">MOBILE NO.*</label>
	              <input type="number" id="userId" name="userId" class="form-control" ng-model="userId" required="required" ng-pattern="/^[0-9]{10}$/" maxlength="10" ng-click="loginPlayerValidate = null">
	             <!--  <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$error.required">Mobile is required!</span> -->
	                <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$error.number">Not valid number!</span>
	                <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$dirty&&loginByPlayer.userId.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
	            </div>
				<div class="centredisplay">
				<label for="loginpassword">PASSWORD*</label>
	              <input type="password" id="loginpassword" name="loginpassword" class="form-control" ng-model="loginpassword" required="required" ng-click="loginPlayerValidate = null">
	             <!--  <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.loginpassword.$error.required">Password is required!</span> -->
	            </div>
	            <div style="text-align: center;">
	                <button type="submit" class="btn btn-danger">SIGN IN</button>
	                </div>
			  </form>
			</div>
          <div class="tab-pane fade" id="loginOrg" role="tabpanel" aria-labelledby="loginOrg-tab">
		    <form ng-submit="validatePlayerRegistration()" name="registerByPlayer" ngNativeValidate>
		    
		    <p style="margin: 0px;color: red;font-size: 14px;">{{registerPlyrValidate}}</p>
		    
            <div class="centredisplay">
            <label for="name">Name*</label>
              <input type="text" id="name" class="form-control" ng-model="name" name="name" required="required" maxlength="20" ng-click="registerPlyrValidate = null">
              <!-- <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.name.$error.required">Player name is required!</span> -->
            </div>
            <div class="centredisplay">
                <div class="row">
                    <div class="col-sm-6"> 
                     <label for="phone">Mobile*</label>
	                <input type="text" id="phone" ng-model="phone" name="phone" class="form-control" required="required" ng-pattern="/^[0-9]{10}$/" maxlength="10" ng-click="registerPlyrValidate = null">
	                <!-- <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$error.required">Mobile is required!</span> -->
	                <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$error.number">Not valid number!</span>
	                <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.phone.$dirty&&registerByPlayer.phone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
	                </div>
                   <div class="col-sm-6"> 
                   <label for="email">Email*</label>
                    <input type="email" id="email" ng-model="email" name="email" class="form-control" required="required" maxlength="45" ng-click="registerPlyrValidate = null">
                    <!-- <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.email.$error.required" style="font-size: .8em;">Email is required.</span> -->
			        <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.email.$dirty&&registerByPlayer.email.$error.email">Not valid email!</span>
                    </div>
              </div>
              </div>
			  <div class="centredisplay">
                <div class="row">
                    <div class="col-sm-6"> 
                    <label for="pwd">Password*</label>
                <input type="password" id="pwd" ng-model="pwd" name="pwd" class="form-control" required="required" maxlength="10" ng-click="registerPlyrValidate = null">
              <!--   <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.pwd.$error.required">Password is required!</span> -->
                </div>
                <div class="col-sm-6"> 
                <label for="repwd">Confirm Password*</label>
                    <input type="password" id="repwd" ng-model="repwd" name="repwd" class="form-control" required="required" maxlength="10" ng-click="registerPlyrValidate = null">
                    <!-- <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.repwd.$error.required">Confirm Password is required!</span> -->
                    </div>
              </div>
              </div>
              <div class="centredisplay">
                <div class="row">
                  <div class="col-sm-6"> 
                  <label for="address">Address*</label>
                  <textarea type="text" id="address" ng-model="address" name="address" class="md-textarea form-control" rows="1" maxlength="150" required="required" ng-click="registerPlyrValidate = null"></textarea>
                  <!-- <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.address.$error.required">Address is required!</span> -->
                  </div>
                  <div class="col-sm-6"> 
                   <label for="dateOfBirth">Date Of Birth*</label>
	                  <input type="text" id="dateOfBirth" ng-model="dateOfBirth" name="dateOfBirth" class="form-control" required="required" ng-click="registerPlyrValidate = null">
	                  <!-- <span style="color:Red;font-size: .8em;" ng-show="registerByPlayer.dateOfBirth.$error.required">DOB is required!</span> -->
	              </div>
                </div>
              </div>
              <div class="centredisplay">
                  <div class="row">
                  <div class="col-sm-12"> 
                  <label for="address">Select Ranking*</label>
		            <select ng-model="rankItem" ng-options="rankdata.rankName for rankdata in rankList" class="form-control" name="rankItem" id="rankid">
                  </select>
                     </div>
                 </div>
                </div>
              <div class="centredisplay" ng-if="rankItem.rankId != 1">
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
              </div>
               <div style="text-align: center;">
                <button type="submit" class="btn btn-danger">SIGN UP</button>
                </div>
				</form>
		  </div>
      </div>
    </div>
     <!--  <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-sm">Save changes</button>
      </div> -->
    </div>
  </div>
</div>
<!-- Central Modal Small -->

<div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #ff3547!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Payment</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3">
      <%-- <form action="./registerPlayerForTournamentCategory" method="post" name="registerPlayerTournament" ngNativeValidate> --%>
      <form ng-submit="registerPlayerForTournamentCategory()" method="post" name="registerPlayerTournament" ngNativeValidate>
	      <div ng-if="matchTypeReg == 2" class="md-form mb-5">
		         <select id="secondPlayer" name="secondPlayer" ng-model="secondPlayer" class="form-control" required="required">
				  <option value="">Select Other Player*</option>
				  <option ng-repeat="x in otherPlayers | filter:{ player_id: '!${sessionScope['scopedTarget.userSession'].playerId}'}" value="{{x.player_id}}">{{x.player_name}}</option>
				</select>
				<span style="color:Red;font-size: .8em;" ng-show="registerPlayerTournament.secondPlayer.$error.required">Other player is required!</span>
	        </div>
        <div class="centredisplay">
        <label >Card Holder Name*</label>
          <input type="text" id="cardHolderName" ng-model="cardHolderName" name="cardHolderName" class="form-control validate" required="required">
         <!--  <span style="color:Red;font-size: .8em;" ng-show="registerPlayerTournament.cardHolderName.$error.required">Card Holder Name is required!</span> -->
       </div>
      
        <div class="centredisplay">
        <label >Card Number*</label>
          <input type="text" id="cardNumber" ng-model="cardNumber" name="cardNumber" class="form-control validate" required="required">
         <!--  <span style="color:Red;font-size: .8em;" ng-show="registerPlayerTournament.cardNumber.$error.required">Card number is required!</span> -->
       </div>
      
        <div class="centredisplay">
        <label></label>
	         <select id="cardType" ng-model="cardType" name="cardType" class="form-control" required="required">
			  <option value="">Select Card Type*</option>
			  <option value="Visa">Visa</option>
			  <option value="MasterCard">MasterCard</option>
			  <option value="Contactless">Contactless</option>
			  <option value="RuPay">RuPay</option>
			  <option value="Maestro">Maestro</option>
			</select>
			<!-- <span style="color:Red;font-size: .8em;" ng-show="registerPlayerTournament.cardType.$error.required">Card type is required!</span> -->
        </div>

        <div class="centredisplay">
        <label></label>
          <input type="number" id="amount" name="amount" ng-value="tournamentFeeForReg" class="form-control validate" readonly="readonly">
        </div>
         <input type="hidden" id="playerIdForReg" name="playerIdForReg" value="${sessionScope['scopedTarget.userSession'].playerId}"  required="required">
         
         <input type="hidden" id="tournamentIdForReg" name="tournamentIdForReg" ng-value="tournamentIdForReg" required="required">
         
         <input type="hidden" id="categoryIdForReg" name="categoryIdForReg" ng-value="categoryIdForReg" required="required">
         <input type="hidden" id="matchTypeReg" name="matchTypeReg" ng-value="matchTypeReg" required="required">
         
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-unique" style="background: #ff3547!important;color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- changePwd -->
<div class="modal fade" id="modelChangePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
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
       <input type="hidden" id="changedPlayerId" name="changedPlayerId" value="${sessionScope['scopedTarget.userSession'].playerId}" class="form-control" required="required">           
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-unique" style="background: #ff3547!important;color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- changepwd -->
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
     <p style="margin-bottom: 0.5rem;">
     <strong><b>AITA : </b></strong>
     <strong>{{profileData.player_itarank}}</strong>
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
<!-- View Schedule Open  -->
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
      <p id="scheduleListTitleShow" style="font-weight: bold;">{{titleName}}</p>
         <table class="table" >
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
<!--  View Schedule Close -->
<!-- Alert popup close -->
    <!-- SCRIPTS -->
    <!-- JQuery -->
    
  <spring:url value="/resources/javascript/jquery-3.3.1.min.js" var="jquery331minjs"/>
  <script src="${jquery331minjs}"></script>
    <!-- Bootstrap tooltips -->
  <spring:url value="/resources/javascript/popper.min.js" var="popperminjs"/>
  <script src="${popperminjs}"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <spring:url value="/resources/javascript/bootstrap.min.js" var="bootstrapminjs"/>
  <script src="${bootstrapminjs}"></script>
    <!-- MDB core JavaScript -->
  <spring:url value="/resources/javascript/mdb.min.js" var="mdbminjs"/>
  <script src="${mdbminjs}"></script>
  
</body>
</html>