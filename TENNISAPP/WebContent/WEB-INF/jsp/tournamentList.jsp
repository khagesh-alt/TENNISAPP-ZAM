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

  <!-- Main Stylesheet File -->
  <link href="resources/player-home/css/style.css" rel="stylesheet">
   

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

body{
font-family: 'Montserrat', sans-serif;
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
	/* background-color: #ff3547 !important;
	color: #fff !important; */
	color: #18d26e !important;
}

.dropdown:hover .dropdown-profile {
	display: block;
}
[type=checkbox]:checked, [type=checkbox]:not(:checked) {
    opacity: 1;
    pointer-events: inherit;
}

.columnDiv {
    float: left;
    width: 32%;
    padding: 10px;
}
.tournament {
    width: 100%;
    text-align: center;
    margin-bottom: 11px;
    font-size: 13px;
}
.tournament h6 {
    width: 100%;
    background: #18d26e;
    padding: 5px;
    color: #fff;
    margin: 0 0 6px 0;
}
p {
    padding: 0;
    margin: 0 0 12px 0;
}
.mainSide b{
 font-weight: 500;
}
.indigo {
	background-color: #18d26e !important;
}
.table th {
	font-weight: bold;
}

.table td, .table th {
	border-top: none;
	text-align: left;
	padding-top: 0px;
}
.backbtn{
   position: fixed;
   bottom: 20px;
   left: 10px;
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
table.glyphicon-hover td:hover .glyphicon {
    visibility: visible;
}
table.glyphicon-hover .glyphicon {
    visibility: hidden;
}
select {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    display: block !important;
}
.custom-table td, .custom-table th {
	color: #000 !important;
	font-size: 12px;
}
.custom-table td{
font-weight: 500;
}
.centredisplay label {
    color: #000;
    margin-top: 5px;
    font-size: 12px;
    font-weight: 400;
}
.centredisplay input, .centredisplay textarea {
    border-radius: 0px;
    color: #000;
    border: 1px solid #000;
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

.schedule-tab  td:not(:nth-child(6))
{
 color: #000 !important;
 font-size: 12px;
 font-weight: 500;
}
.schedule-tab  th
{
 color: #000 !important;
 font-size: 12px;
}
  </style>
</head>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl">
<div class="maincolor">
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="tournamentList" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class=""><a href="tournamentList">Home</a></li>
          <li class="menu-active"><a href="tournamentList">My Tournaments</a></li>
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
<div id="wait" style="display:none;z-index: 1;position:absolute;top:50%;left:50%;padding:2px;"><img src='http://icon-park.com/imagefiles/loading7_red.gif' width="64" height="64" /><br>Please Wait..</div>
<input type="hidden" name="popupmsg" id="popupmsg" value="${message}" />

<main id="main" style="margin-top: 100px;display: none;" >
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
     
  <div ng-show="mytournamentdetails.length == 0" style="text-align: center; width: 100%;color: #fd0707;"><h3>No Existing Tournaments</h3></div>   
 <div style="width: 100%;float: right;" ng-show="show==0">
	<label class="checkbox-inline" style="float: right;color: #fff;margin-right: 10px;"><input type="checkbox" style="position: inherit;" data-ng-model='mactive' ng-init="mactive='pactive'" data-ng-true-value='pactive' data-ng-false-value=''/> Active</label>
    <a href="createtournament" class="btn btn-primary btn-success">Create tournament</a>
 
 </div>
 <section id="portfolio"  class="" ng-show="show==0">
      <div class="container">
        <div class="row portfolio-container">
          <div class="col-lg-4 col-md-6 portfolio-item filter-web fadeInUp" ng-repeat="list in mytournamentdetails | filter:{active :mactive}">
            <div class="portfolio-wrap">
              <figure>
                <img src="{{list.bannerImage}}" class="img-fluid" alt="">
                 <a href="#" class="link-preview" title="Edit" ng-click="updateTournamentDates(list.tournamentId,list.orgaizerId,list.title,list)"><i class="ion ion-edit"></i></a>
                <a href="#" class="link-details" title="More Details" ng-click="openTournament(list)"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">{{list.title}}</a></h4>
                <p>{{list.location}}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
</section>
 <section>
 <div class="container" ng-show="show==1">
 <div class="breadcrump" >
  <a href="tournamentList">My Tournaments </a> <a href="#"> > {{tournamentCat.title}}</a>
</div>
  <!--  <h6 style="font-size: 18px;font-weight: bold;color: #18d26e;display: inline;">{{tournamentCat.title}}</h6> -->
   

            <div class="mainSide" style="margin-top: 30px;">
            <details>
              <summary style="display: inherit;">
			  <div class="row" >
			   <div class="col-sm-9">
			   <b>Tournament starting on<span> {{tournamentCat.tournamentStartDate}} , till  {{tournamentCat.tournamentEndDate}} </span></b><br>
			     
			   </div>
			   <div class="col-sm-3" style="color : #18d26e">
			    Details...
			   </div>
			   
			  </div>
			  </summary>
			  <div class="row" style="color:#fff;margin-top:30px;">
			   <div class="col-lg-7 col-md-6 " >
            
            
            <div class="row">
            <div class="col-lg-1" style="padding:5px"><i class="ion-ios-location-outline"></i></div>
            <div class="col-lg-11">
            <p class="title" style="margin: 0px;">{{tournamentCat.venueName}} , {{tournamentCat.location}}</p>
           
            <span class="description">{{tournamentCat.phone}} , </span><span class="description">{{tournamentCat.email}}</span>
            </div>
            </div>
            <div class="row">
            <div class="col-lg-1" style="padding:5px"><i class="ion-ios-person-outline"></i></div>
            <div class="col-lg-11">
            <p class="description" data-toggle="tooltip" title="Organiser">{{tournamentCat.organizerName}}(organiser) , {{tournamentCat.refereeName}}(referee) </p>
            </div>
            </div>
            
           
            
          </div>
          <div class="col-lg-2 col-md-6 "></div>
          <div class="col-lg-3 col-md-6 ">
           <div class="dropdown">
    <button class="btn btn-success" type="button" data-toggle="dropdown">SCHEDULE
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li style="font-size: 12px;text-align: center;color: green;padding: 5px;font-weight: 500;"><a ng-click="ViewTournamentLavelSchedule(tournamentCat.tournamentId,tournamentCat.title)">VIEW </a></li>
      <li style="font-size: 12px;text-align: center;color: green;padding: 5px;font-weight: 500;">
      <a ng-if="!enableButton.scheduleCreated" ng-click="createTournamentLavelSchedule(tournamentCat.tournamentId)">CREATE</a>
      <a ng-if="enableButton.drawsCreated && enableButton.scheduleCreated" ng-click="createTournamentLavelSchedule(tournamentCat.tournamentId)">UPDATE</a>
      </li>
    </ul>
  </div>
          
          </div>
          <p style="width:100%;text-align: right">Registration opens on {{tournamentCat.regStartDate}} , closes {{tournamentCat.regEndDate}}</p>
          
			</div>
			</details>
			</div>
          <div class="categoryList">
			<hr>
			<table class="table">
		    <thead>
		    
		      <tr>
		        <th>Category</th>
		        <th style="text-align: center;">Entry Fee</th>
		        <th style="text-align: center;">Prize</th>
		        <th style="text-align: center;">Players</th>
		        <th style="text-align: center;">Schedule</th>
		        <th style="text-align: center;">Draw</th>
		        <th style="text-align: center;">View</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr ng-repeat="list in tournamentCat.categoryList">
		        <td>{{list.categoryName}}</td>
		        <td style="text-align: center;">{{list.tournamentFee}}</td>
		        <td style="text-align: center;">{{list.prizeMoney}}</td>
		        <td style="text-align: center;">{{list.playerList.length}}</td>
		        <td style="text-align: center;" ng-if="list.scheduleCreated"><i class="fas fa-check" style="color: green;text-align: left;"></i></td>
			    <td style="text-align: center;" ng-if="!list.scheduleCreated"><i class="fa fa-close" style="color:red;text-align: left;"></i></td>
			    <td style="text-align: center;" ng-if="list.drawsCreated"><i class="fas fa-check" style="color: green;text-align: left;"></i></td>
			    <td style="text-align: center;" ng-if="!list.drawsCreated"><i class="fa fa-close" style="color:red;text-align: left;"></i></td>
		        <td style="text-align: center;"><a class="btn btn-primary btn-success" style="padding: 6px;" 
					ng-click="viewPlayersTournament(tournamentCat.tournamentId,list.categoryId,list.tournamentFee,list.playerList,list.tournamentFee,tournamentCat.tournamentStartDate,list.matchType,tournamentCat.title,list.categoryName)">View</a></td>
		      </tr>
		    </tbody>
		  </table>
        </div>	
<button type="submit" class="btn btn-success waves-effect waves-light backbtn" ng-click="showFeature(0)">BACK</button>
</div>
<div class="container" ng-show="show==2">	
  <div class="breadcrump" >
  <a href="tournamentList">My Tournaments </a> <a href="#"> > {{tournametTtl}}</a><a href="#"> > {{catTtle}}</a>
</div>
<!-- <h6 style="font-size: 17px;font-weight: bold;color: #18d26e">{{tournametTtl}} ({{catTtle}})</h6> -->
   <ul class="nav nav-tabs nav-justified md-tabs indigo" id="myTabJust" role="tablist">
	<li class="nav-item">
	 <a class="nav-link active" id="players-tab-just" data-toggle="tab" href="#players-just" role="tab" aria-controls="players-just" aria-selected="true">Players</a>
	</li>
	<li class="nav-item" ng-click="getDraws()">
	 <a class="nav-link" id="draws-tab-just" data-toggle="tab" href="#draws-just" role="tab" aria-controls="draws-just"  aria-selected="false">Draws</a>
	</li>
  </ul>
<div class="tab-content card pt-5" id="myTabContentJust" style="overflow: auto;background: transparent;color: #fff;box-shadow: none;">
<div class="tab-pane fade" id="draws-just" role="tabpanel" aria-labelledby="draws-tab-just" style="width: 100%;">
  <div style="width: 100%;display: inline-block;">
	<i class="fas fa-download" style="font-size: 20px;color: #18d26e;float: left;cursor: pointer;" title="Download Draw" ng-click="download()"></i>&nbsp;&nbsp;&nbsp;
	<input type="checkbox" ng-model="drawPublish" style="position: inherit;" ng-click="activeOrInActiveDrawPublish(drawPublish)"> Publish Draw
	<div ng-if="compaireDate == false" style=" float: right;">
	<div ng-if="rounds.length <= 0 && playerListForAcategory.length > 0" class="text-right"> <a href="" class="btn btn-success" ng-click="adjustmentRakByOrg()">Create</a></div>
	<div ng-if="rounds.length > 0" class="text-right"><a href="" class="btn btn-success" ng-click="adjustmentRakByOrg()">Update</a></div>
   </div>
 </div>
<div ng-if="rounds.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Draw not created yet!</h6></div>
   <div ng-if="rounds.length == 3" id="downloaddraw3">
   <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournametTtl}} ({{catTtle}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle3.jsp" />
  </div>
  <div ng-if="rounds.length == 4" id="downloaddraw4">
  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournametTtl}} ({{catTtle}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle4.jsp" /> 
  </div>
  <div ng-if="rounds.length == 5" id="downloaddraw5">
  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournametTtl}} ({{catTtle}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle5.jsp" /> 
  </div>
  <div ng-if="rounds.length == 6" id="downloaddraw6">
  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournametTtl}} ({{catTtle}})</h6>
		<jsp:include page="/WEB-INF/jsp/svgSingle6.jsp" /> 
  </div>
</div>
<div class="tab-pane fade show active categoryList" id="players-just" role="tabpanel" aria-labelledby="players-tab-just">
   <input type="checkbox" ng-model="playerPublish" style="position: inherit;" ng-click="activeOrInActivePlayersPublish(playerPublish)"> Publish Players
   <div style="width: 100%;display: inline-block;">
   
    <select ng-model="registeredByFilter" class="form-control" style="width: 20%;float: left;display: inline;margin-top: 10px;">
		  <option value>ALL PLAYERS</option>
		  <option ng-repeat="list in playerListForAcategory | unique:'playerRegBy'" value="{{list.playerRegBy}}">{{list.playerRegBy}}</option>
	   </select>
      <a class="btn btn-primary btn-success" style="float: left;" ng-click="deleteMultiplePlayer()">Delete</a>
   
	<a ng-if="compaireDate == false" href="" class="btn btn-primary btn-success" style="float: right;" ng-click="addExistingPlayer()">+ADD PLAYER</a>
	<a ng-if="compaireDate == false  && matchTypeReg == 1" href="" class="btn btn-primary btn-success" style="float: right;" data-toggle="modal" data-target="#bulkUploadPopupForSingle">BULK UPLOAD</a>
	<a ng-if="compaireDate == false  && matchTypeReg == 2" href="" class="btn btn-primary btn-success" style="float: right;" data-toggle="modal" data-target="#bulkUploadPopupForDouble">BULK UPLOAD</a>
	<h6 ng-if="compaireDate == true" style="color: red;text-align: right;font-size: 13px;">Tournament started, No players can be registered!</h6>
	</div>
	<h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 0px;">{{tournametTtl}} ({{catTtle}})</h6>
     <table class="table glyphicon-hover" id="adjRankTab">
		<thead>
		  <tr>
		    <th><input type="checkbox" ng-model="IsAllChecked" ng-change="CheckUncheckAll()" /></th>
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
		  <tr ng-repeat="players in playerListForAcategory | filter:{playerRegBy:registeredByFilter,playerRegBy:registeredByFilter||undefined}:true">
		    <td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">
		    <input ng-if="players.registeredBy != 0  && compaireDate == false" id="chkCustomer_{{players.playerId}}" type="checkbox" ng-model="players.selected" ng-change="CheckUncheckHeader()" /></td>
			<td style="display: none;">{{players.playerId}}</td>
			<td ng-if="playerListForAcategory.length <=8" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 1}">{{$index+1}}</td>
			<td ng-if="playerListForAcategory.length >8 && playerListForAcategory.length <=16" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 3}">{{$index+1}}</td>
			<td ng-if="playerListForAcategory.length >16 && playerListForAcategory.length <=32" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index > 7}">{{$index+1}}</td>
			<td ng-if="playerListForAcategory.length >32 && playerListForAcategory.length <=64" scope="row" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" ng-class="{'visibleHidden': $index >15}">{{$index+1}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" >{{players.name}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.playerAge}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.phone}}</td>
			<td style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.email}}</td>
			<td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			<td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.itaId}}</td>
			<td ng-if="players.points == 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			<td ng-if="players.points != 11111111" style="font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{players.points}}</td>
			<td ng-if="players.registeredBy != 0  && compaireDate == false" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">
			<i class="fas fa-trash-alt" style="font-size: 11px;color: #fff; padding: 2px;" ng-click="deleteFromTournament(players.playerId,players.paymentId,players.name)"></i>
			</td>
			<td ng-if="players.registeredBy == 0" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;"></td>
			<td style="display: none;">{{players.paymentId}}</td>
		 </tr>
	   </tbody>
	</table>
	<div ng-if="playerListForAcategory.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Players not registered yet!</h6></div>
</div>
</div>
 <button type="" class="btn btn-success waves-effect waves-light backbtn" ng-click="showFeature(101);">Back</button>
</div>
</section>

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
<!-- Extend Date  -->
<div class="modal fade right show" id="extendsTournament" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
      <div class="modal-dialog modal-side modal-top-right" role="document">
        <!--Content-->
        <div class="modal-content">
          <!--Header-->
          <div class="modal-header text-center" style="background: #18d26e!important;color: #fff;">
            <h6 class="modal-title w-100">{{extendTitle}}</h6>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <!--Body-->
          <div class="modal-body centredisplay">
          <p style="margin: 0px;color: red;font-size: 14px;">{{tournamentDateValidate}}</p>
          <form ng-submit="extendsTournament()">
            <div class="" style="display: none;">
             <label>Registration Start Date*</label>
            <input type="text" id="updateRegStartDate" name="updateRegStartDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null">
            </div>
            <div class="">
            <label>Registration End Date*</label>
            <input type="text" id="updateRegEndDate" name="updateRegEndDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null">
            </div>
            <div class="">
            <label>Tournament Start Date*</label>
            <input type="text" id="updateTournamentStartDate" name="updateTournamentStartDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null" >
            </div>
            <div class="">
            <label>Tournament End Date*</label>
            <input type="text" id="updateTournamentEndDate" name="updateTournamentEndDate" class="form-control tournamentDate" required="required" autocomplete="off" ng-click="tournamentDateValidate = null">
            </div>
               <div style="text-align: center;width: 100%;"> <button type="submit" class="btn btn-success">Update</button></div>
		  </form>
          </div>
          <!--Footer-->
        </div>
        <!--/.Content-->
      </div>
    </div>
<!-- Extend Date -->
<!-- add player from list  -->
<!-- Central Modal Small -->
<div class="modal fade" id="addPlayerFromlist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Change class .modal-sm to change the size of the modal -->
  <div class="modal-dialog modal-lg" role="document">

    <div class="modal-content">
      <div class="modal-header text-center" style="background: #18d26e!important;color: #fff;">
        <h6 class="modal-title w-100" id="myModalLabel">ADD PLAYER TO TOURNAMENT</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p style="margin: 0px;color: green;font-size: 14px;">{{doublePlayersValidate}}</p>
      <input type="text" class="searchInput" ng-model="searchtext" placeholder="Search..">
      <a ng-if="matchTypeReg == 2" class="btn btn-success" style="float: right;padding: 5px !important;" ng-click="addToTournamentDoubles()">+ADD</a>
      <div  style="height: 450px;overflow: auto;">
       <table class="table custom-table" id="ItemsTable">
		  <thead>
			<tr>
			  <th scope="col" style="color: #9c9c9c;">#</th>
			  <th scope="col" style="color: #9c9c9c;">Name</th>
			  <th scope="col" style="color: #9c9c9c;">Age</th>
			  <th scope="col" style="color: #9c9c9c;">Mob.</th>
			  <th scope="col" style="color: #9c9c9c;">Email</th>
			  <th scope="col" style="color: #9c9c9c;">AITA Id</th>
			  <th scope="col">AITA Rank</th>
			  <th scope="col" ng-if="matchTypeReg == 1" style="color: #9c9c9c;">ADD</th>
		   </tr>
		 </thead>
		 <tbody ng-if="matchTypeReg == 1" style="">
		     <tr ng-repeat="existplayers in existingPlayers | filter:searchtext">
			  <th scope="row" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;color: #9c9c9c;">{{$index+1}}</th>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.name}}">{{existplayers.name}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.playerAge}}">{{existplayers.playerAge}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.phone}}"><p>{{existplayers.phone}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.email}}"><p>{{existplayers.email}}</p></td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.itaId}}">{{existplayers.itaId}}</td>
			  <td ng-if="existplayers.itaRank == 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">-</td>
			  <td ng-if="existplayers.itaRank != 11111111" style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="{{existplayers.itaRank}}">{{existplayers.itaRank}}</td>
			  <td style="padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;"><button type="button" class="btn btn-success" style="padding: 5px !important;" ng-click="addToTournament(existplayers,$index)">+ADD</button></td>
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
	        <button type="submit" class="btn btn-success">Update</button>
	      </div>
	      </form>
	      <form ng-submit="postEditSinglePlayerDetails();" method="post" ng-if="matchTypeReg == 1">
	        <div class="">
	          <label >Player*</label>
	          <input type="text" id="editPlayer" name="editPlayer" value="{{editPlayer}}" class="form-control" required="required" ng-click="deletePlayerValidate()">
	       </div>
	      <div style="text-align: center;">
	        <button type="submit" class="btn btn-success">Update</button>
	      </div>
	      </form>
      </div>
    </div>
  </div>
</div>
<!-- Bulk upload for Single -->
<div class="modal fade" id="bulkUploadPopupForSingle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
		<div class="modal-dialog" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header text-center"
					style="background: #18d26e !important; color: #fff;">
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
							<button type="submit" class="btn btn-success">Upload</button>
						</div>
					</form>
				</div>
				<!--Footer-->
			</div>
			<!--/.Content-->
		</div>
	</div>
<!-- Bulk upload for single close -->
<!-- Bulk upload for Double -->
<div class="modal fade" id="bulkUploadPopupForDouble" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true">
		<div class="modal-dialog" role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header text-center"
					style="background: #18d26e !important; color: #fff;">
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
							<button type="submit" class="btn btn-success">Upload</button>
						</div>
					</form>
				</div>
				<!--Footer-->
			</div>
			<!--/.Content-->
		</div>
	</div>
<!-- Bulk upload for Double close -->
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
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" ng-click="deletePlayer()">OK</button>
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" data-dismiss="modal">Close</button>
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
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" ng-click="getConfirmedShedule()">Continue</button>
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<!-- Tournament Lavel Schedule open model -->
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
			  <th style="padding: 5px;color: #000;">{{updateScoreData.playerName1}} : </th>
			  <td style="padding: 5px;color: #000;">Set1 <input type="number" id = "playerfirst1" name="playerfirst1" ng-model="playerfirst1" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;">Set2 <input type="number" id = "playerSecond1" name="playerSecond1" ng-model="playerSecond1" class="form-control"  value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;">Set3 <input type="number" id = "playerThird1" name="playerThird1" ng-model="playerThird1" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			</tr>
			<tr>
			  <th style="padding: 5px;color: #000;">{{updateScoreData.playerName2}} : </th>
			  <td style="padding: 5px;color: #000;"> <input type="number" id="playerfirst2" name="playerfirst2" ng-model="playerfirst2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;"> <input type="number" id="playerSecond2" name="playerSecond2" ng-model="playerSecond2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			  <td style="padding: 5px;color: #000;"> <input type="number" id="playerThird2" name="playerThird2" ng-model="playerThird2" class="form-control" value="0" required="required" ng-click="scoreValidate = null"></td>
			</tr>
		</table>
		<label></label>
        <input type="hidden" id="team1" name="team1" value="{{updateScoreData.team1}}">
		<input type="hidden" id="team2" name="team2" value="{{updateScoreData.team2}}">
		<button type="submit" class="btn btn-success">UPDATE</button>
		 <a class="btn btn-success" data-dismiss="modal">Close</a>
	</form>
    </div>
    <div class="modal-footer d-flex justify-content-center">
     </div>
    </div>
  </div>
</div>
<!-- Schedule Popup Open -->

<!-- Full Height Modal Right -->
<div class="modal fade bottom " id="updateSchedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static"  aria-hidden="true">
  <div class="modal-dialog modal-full-height modal-bottom" role="document">

    <div class="modal-content">
      <div class="modal-header" style="background-color: #18d26e !important;color: #fff;text-align: center;">
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
						<div style="float: left;width: 50%;text-align: center;margin-top: 5px;color: green !important;">AM</div>
						<div style="float: right; width: 50%;text-align: center;margin-top: 5px;color: green !important;">PM</div>
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
							<a href="" class="btn btn-success"
								style="margin-top: 25px;"
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
<!-- Modal: modalCart -->
<div class="modal fade" id="scheduleTournamentLavel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header" style="background-color: #18d26e !important;color: #fff;">
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
         <table class="table schedule-tab">
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

<!-- Modal -->
<div class="modal fade" id="confirmationMultiPlayerpopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body confirmMultiPlayermsg">
      </div>
      <div class="modal-footer" style="padding: 5px;">
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" ng-click="deleteMultiPlayer()">OK</button>
        <button type="button" class="btn  btn-success" style="padding: 6px 12px 6px 12px;" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</main>
</div>
<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  
  <script src="resources/player-home/lib/jquery/jquery.min.js"></script>
   
  <script src="resources/player-home/lib/jquery/jquery-migrate.min.js"></script>
  <spring:url value="/resources/javascript/modules/drag-drop.js" var="dragdropjs"/>
  <script src="${dragdropjs}"></script>
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
   <spring:url value="/resources/javascript/custom/mytournaments.js" var="mytournamentsjs"/>
  <script src="${mytournamentsjs}"></script>
  <spring:url value="/resources/javascript/domtoimage.js" var="domtoimagejs"/>
  <script src="${domtoimagejs}"></script>
  <spring:url value="/resources/javascript/FileSaver.js" var="FileSaverjs"/>
  <script src="${FileSaverjs}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.js" type="text/javascript" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
</body>
</html>
