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
    color: #000;
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

/* table.table td, table.table th {
	padding-top: 0px;
	padding-bottom: 1rem;
} */
body{
font-family: 'Montserrat', sans-serif;
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
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
    float: left;
}
  </style>
</head>

<body class="whitebackground" ng-app="myApp" ng-controller="myCtrl" ng-init="init()">
<div class="maincolor" >
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="playerhome" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="playerhome">Home</a></li>
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
    <section>
     <input type="hidden" id="tournamentid" value="${sessionScope['scopedTarget.tournamentSession'].tournamentid}"/>
     <input type="hidden" name="popupmsg" id="popupmsg" value="${sessionScope['scopedTarget.userSession'].playerId}" />
	<input type="hidden" name="message" id="message" value="${message}" />
	
	<div class="row" style="margin-top: 12px;display: none;" id="hideMainDiv">
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
			
			<div class="container" ng-show="show==1">
			<div class="breadcrump" >
  					<a href="tournamentList">Tournaments </a> <a href="#"> > {{tournamentCat.title}}</a>
			</div>
			<!-- <h6  style="font-size: 18px;font-weight: bold;color: #18d26e;display: inline;">{{tournamentCat.title}}</h6>
			<a class="btn btn-primary btn-success" style="padding: 6px;" ng-click="ViewTournamentLavelSchedule(tournamentCat.tournamentId,tournamentCat.title)">VIEW SCHEDULE</a> -->
			
              <!-- <div class="mainSide ">
			  <div class="row">
			   <div class="col-sm-6">
			   <b>Tournament : </b><span><i> {{tournamentCat.tournamentStartDate}} - {{tournamentCat.tournamentEndDate}} </i></span>
			   </div>
			   <div class="col-sm-6">
			   <b>Registration : </b><span><i>{{tournamentCat.regStartDate}} - {{tournamentCat.regEndDate}}</i></span>
			   </div>
			  </div>
			   <div class="row">
			   <div class="col-sm-6">
			   <b>Organiser : </b><span><i> {{tournamentCat.organizerName}} </i></span>
			   </div>
			   <div class="col-sm-6">
			   <b>Contact : </b><span><i>{{tournamentCat.phone}} ,  {{tournamentCat.email}}</i></span>
			   </div>
			  </div>
			  <div class="row">
			   <div class="col-sm-6">
			   <b>Location : </b><span><i>{{tournamentCat.venueName}}, {{tournamentCat.location}} </i></span>
			   </div>
			   <div class="col-sm-6">
			   <b>Referee : </b><span><i>{{tournamentCat.refereeName}}</i></span>
			   </div>
			  </div>
			</div>	 -->
			
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
           <a class="btn btn-primary btn-success" style="padding: 6px;" ng-click="ViewTournamentLavelSchedule(tournamentCat.tournamentId,tournamentCat.title)">VIEW SCHEDULE</a>
          
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
		        <th style="text-align: center;">Registered</th>
		        <th style="text-align: center;">View</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr ng-repeat="list in tournamentCat.categoryList">
		        <td>{{list.categoryName}}</td>
		        <td style="text-align: center;">{{list.tournamentFee}}</td>
		        <td style="text-align: center;">{{list.prizeMoney}}</td>
		        <c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
		        <td style="text-align: center;">{{list.playerList.length}}</td>
		        <td style="text-align: center;" ng-if="list.scheduleCreated"><i class="fas fa-check" style="color: green;text-align: left;"></i></td>
			    <td style="text-align: center;" ng-if="!list.scheduleCreated"><i class="fa fa-close" style="color:red;text-align: left;"></i></td>
		        <td style="text-align: center;" ng-if="list.drawsCreated"><i class="fas fa-check" style="color: green;text-align: left;"></i></td>
			    <td style="text-align: center;" ng-if="!list.drawsCreated"><i class="fa fa-close" style="color:red;text-align: left;"></i></td>
		        <td style="text-align: center;" ng-if="list.playerId < 0"><a class="btn btn-primary btn-success" style="padding: 6px;" 
									       ng-click="registerPlayerForTournament(tournamentCat.tournamentId,list.categoryId,list.tournamentFee,list.matchType,list.playerId,list.categoryGender,list.catAge)">Register</a></td>
				<td style="text-align: center;" ng-if="list.playerId >= 0"><i class="fas fa-check" style="color: green;text-align: left;"></i></td>
		        <td style="text-align: center;"><a class="btn btn-primary btn-success" style="padding: 6px;" 
									       ng-click="viewPlayersTournament(list.playerList,tournamentCat.tournamentStartDate,tournamentCat.tournamentId,list.categoryId,tournamentCat.title,list.categoryName)">View</a></td>
		        </c:if>
		      </tr>
		    </tbody>
		  </table>
</div>		
</div>
	
<div class="container" ng-show="show==2">
<div class="breadcrump" >
  <a href="tournamentList">Tournaments </a> <a href="#"> > {{tournametTtl}}</a><a href="#"> > {{catTtle}}</a>
</div>	
 <div class="">
 <!-- <h6 style="font-size: 17px;font-weight: bold;color: #18d26e" id="khagesh">{{tournamentCat.title}} ({{catTtle}})</h6> -->
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
				<div class="tab-content card pt-5" id="myTabContentJust" style="overflow: auto;background: transparent;color: #fff;">
				  <div class="tab-pane fade" id="draws-just" role="tabpanel" aria-labelledby="draws-tab-just" style="width: 100%;">
				  <i class="fas fa-download" style="font-size: 20px;color: #18d26e;width: 100%;float: left;cursor: pointer;" title="Download Draw" ng-click="download()"></i>
				  
				  <div ng-if="rounds.length <= 0" style="text-align: center; width: 100%;color: #fd0707;"><h6>Draw not created yet!</h6></div>
				  
				  <div ng-if="rounds.length > 0 && !drawPublish" style="text-align: center; width: 100%;color: #fd0707;"><h6>Draw not yet published!</h6></div>
				  
				  <div ng-if="rounds.length == 3 && drawPublish" id="downloaddraw3">
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				     <jsp:include page="/WEB-INF/jsp/svgSingle3.jsp"/>
				  </div>
				  <div ng-if="rounds.length == 4 && drawPublish" id="downloaddraw4">
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				  <jsp:include page="/WEB-INF/jsp/svgSingle4.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 5 && drawPublish" id="downloaddraw5">
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				  <jsp:include page="/WEB-INF/jsp/svgSingle5.jsp" /> 
				  </div>
				  <div ng-if="rounds.length == 6 && drawPublish" id="downloaddraw6">
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 5px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				  <jsp:include page="/WEB-INF/jsp/svgSingle6.jsp" /> 
				  </div>
				  </div>
				  <div class="tab-pane fade show active categoryList" id="players-just" role="tabpanel" aria-labelledby="players-tab-just">
				  <div ng-if="!playersPublish" style="text-align: center; width: 100%;color: #fd0707;"><h6>Players not yet published!</h6></div>
				  <h6 style="font-size: 14px;font-weight: bold;color: #18d26e;text-align: center;margin-bottom: 0px;">{{tournamentCat.title}} ({{catTtle}})</h6>
				      <table class="table" ng-if="playersPublish">
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
			
       
 <button type="" class="btn btn-success waves-effect waves-light backbtn" ng-click="showFeature(101);">Back</button>
</div> 
</div>	
	
<!-- View Schedule Open  -->
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
         <table class="table schedule-tab" >
				<thead>
				   <tr>
					 <th scope="col" style="text-align: center;color: #000;">Match</th>
					 <th scope="col" style="text-align: center;color: #000;" ng-click="sort('scheduleDate','scheduleDate')">Date
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='scheduleDate,scheduleDate'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;color: #000;">Time</th>
					 <th scope="col" style="text-align: center;color: #000;" ng-click="sort('court','court')">Court
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='court,court'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;color: #000;" ng-click="sort('roundNo','roundNo')">Round
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='roundNo,roundNo'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;color: #000;">Status</th>
					 <th scope="col" style="text-align: center;color: #000;" ng-click="sort('categoryName','categoryName')">Category
					 <label class="fas fa-angle-down" style="color:#000 !important;" ng-show="sortKey=='categoryName,categoryName'" ng-class="{'fas fa-angle-up':reverse,'fas fa-angle-down':!reverse}"></label>
					 </th>
					 <th scope="col" style="text-align: center;color: #000;">Score</th>
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
<div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #00c851!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Payment</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3">
      <form ng-submit="registerPlayerForTournamentCategory()" method="post" name="registerPlayerTournament" ngNativeValidate>
        <div class="centredisplay">
        <label >Card Holder Name*</label>
          <input type="text" id="cardHolderName" ng-model="cardHolderName" name="cardHolderName" class="form-control validate" required="required">
       </div>
      
        <div class="centredisplay">
        <label >Card Number*</label>
          <input type="text" id="cardNumber" ng-model="cardNumber" name="cardNumber" class="form-control validate" required="required">
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
        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
</div>	
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
      <div class="modal-body mx-3" style="font-family: 'Montserrat', sans-serif;font-size: 13px;">
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


 <!--  View Schedule Close -->	
<div class="modal fade" id="modalDoublesRegForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #00c851!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Second Player</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3" style="font-size: 12px;">
      <div class="col-sm-12" style="text-align: center;margin-bottom: 20px;">
		      <div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" class="custom-control-input" value="existingCourt" ng-model="place" name="place" id="defaultInline1">
			  <label class="custom-control-label" for="defaultInline1">Existing Player</label>
			 </div>
			 <div class="custom-control custom-radio custom-control-inline">
			  <input type="radio" class="custom-control-input" value="newCourt" ng-model="place" name="place" id="defaultInline2" checked>
			  <label class="custom-control-label" for="defaultInline2">New Player</label>
			</div>
	    </div>
	    <div ng-show="place === 'existingCourt'" style="text-align: center;width: 100%;">
	       <form ng-submit="selectSecondPlayer()" method="post" name="registerPlayerTournament" ngNativeValidate>
	         <div class="md-form mb-5">
		         <select id="secondPlayer" name="secondPlayer" ng-model="secondPlayer" class="form-control" required="required">
				  <option value="">Select Other Player*</option>
				  <option ng-repeat="x in otherPlayers | filter:{ player_id: '!${sessionScope['scopedTarget.userSession'].playerId}'}" value="{{x.player_id}}">{{x.player_name}}</option>
				</select>
				<span style="color:Red;font-size: .8em;" ng-show="registerPlayerTournament.secondPlayer.$error.required">Other player is required!</span>
	        </div>
	        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Next</button>
	        </form>
	    </div>
	     <div ng-show="place === 'newCourt'">
	     <form ng-submit="validatePlayerRegistration()" method="post" name="registerPlayerTournament" ngNativeValidate>
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
			     <!-- <div class="row">
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
					  </div><br> -->
					   <p style="margin: 0px;color: red;font-size: 12px;">{{registerPlyrValidate}}</p>
			         <div class="row"> 
			     </div>
			     <div class="modal-footer d-flex justify-content-center">
			        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Next</button>
			      </div>
			     </form>
		     <br>
	     </div>
	      <%--  --%>
      <!-- <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Next</button>
      </div> -->
      </form>
    </div>
  </div>
</div>
</div>
<!--  View Schedule Close -->	
<div class="modal fade" id="modalSecondPayment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center" style="background: #00c851!important;color: #fff;">
        <h6 class="modal-title w-100 font-weight-bold">Payment</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #fff;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body mx-3">
      <form ng-submit="registerDoublesPlayerForTournamentCategory()" method="post" name="registerDoublesPlayerTournament" ngNativeValidate>
        <div class="centredisplay">
        <label >Card Holder Name*</label>
          <input type="text" id="cardSecondHolderName" ng-model="cardSecondHolderName" name="cardSecondHolderName" class="form-control validate" required="required">
       </div>
      
        <div class="centredisplay">
        <label >Card Number*</label>
          <input type="text" id="cardSecondNumber" ng-model="cardSecondNumber" name="cardSecondNumber" class="form-control validate" required="required">
       </div>
      
        <div class="centredisplay">
        <label></label>
	         <select id="cardSecondType" ng-model="cardSecondType" name="cardSecondType" class="form-control" required="required">
			  <option value="">Select Card Type*</option>
			  <option value="Visa">Visa</option>
			  <option value="MasterCard">MasterCard</option>
			  <option value="Contactless">Contactless</option>
			  <option value="RuPay">RuPay</option>
			  <option value="Maestro">Maestro</option>
			</select>
        </div>

        <div class="centredisplay">
        <label></label>
          <input type="number" id="Secondamount" name="Secondamount" ng-value="tournamentFeeForReg" class="form-control validate" readonly="readonly">
        </div>
         <input type="hidden" id="SecondplayerIdForReg" name="SecondplayerIdForReg" value="${sessionScope['scopedTarget.userSession'].playerId}"  required="required">
         
         <input type="hidden" id="SecondtournamentIdForReg" name="SecondtournamentIdForReg" ng-value="tournamentIdForReg" required="required">
         
         <input type="hidden" id="SecondcategoryIdForReg" name="SecondcategoryIdForReg" ng-value="categoryIdForReg" required="required">
         <input type="hidden" id="SecondmatchTypeReg" name="SecondmatchTypeReg" ng-value="matchTypeReg" required="required">
         
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-unique" style="background: #00c851!important;color: #fff;">Submit</button>
      </div>
      </form>
    </div>
  </div>
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
  
  <spring:url value="/resources/javascript/custom/showTournament.js" var="showTournamentjs"/>
  <script src="${showTournamentjs}"></script>
  </div>
</body>
</html>
