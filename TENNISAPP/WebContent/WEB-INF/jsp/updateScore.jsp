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
   <spring:url value="/resources/javascript/custom/mobileUpdateScore.js" var="mobileUpdateScorejs"/>
  <script src="${mobileUpdateScorejs}"></script>
   
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
	background-image: url("/TENNISAPP-TESTING/resources/images/organiser.jpg");
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
[type="file"] {
  height: 0;
  overflow: hidden;
  width: 0;
}

[type="file"] + label {
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
                <a href="tournament" ><span>Add Tournament</span></a>
                <a href="mytournaments" ><span>Tournaments</span></a>
                <a href="updateScore" ><button type="button" class="btn btn-danger">Update Score</button></a>
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

    	<div class="container" style="margin-top: 100px;">
    	<%-- <form action="./uploadBulkData" id="" enctype="multipart/form-data" method="post">
				<div class="col-md-2" style="font-weight: 600;">
				 <label>Choose pdf File</label>
					<input type="file" id="bulkUploadFile" name="bulkUploadFile"	accept=".xls,.xlsx,.csv" required="required" placeholder="Select File"	class="">
				</div>
				<div class="col-md-2" style="font-weight: 600;">
					<input class="btn btn-default btn-rounded" type="submit" name="" value="SUBMIT" />
				</div>
				<div class="col-md-2"></div>
				</form>  --%>
		 <div class="row" style="margin-top: 10px;" ng-show="listedTournaments">
			<div class="col-sm-4" ng-repeat="list in tournamentDetails"
				style="margin-bottom: 5px;">
				<div class="card card-cascade narrower">

					<div class="card-body card-body-cascade">
						<h6 class="font-weight-bold card-title">{{list.title}}</h6>
						<h6 class="black-text pb-2 pt-1" style="float: left;font-size: 13px;">Start : {{list.startDate}}</h6>
						<h6 class="black-text pb-2 pt-1" style="float: right; font-size: 13px;">End : {{list.endDate}}</h6>
                         <div ng-repeat="obj in list.matchTournamentCategoryBean">
						 <a ng-if="obj.checkSchedule > 0" class="btn btn-primary" style="background-color: #ff3547 !important; float: right; width: 100%;"
							ng-click="buildDropDownList(list.tournamentId,obj.categoryId)">{{obj.categoryName}}</a>
							<a ng-if="obj.checkSchedule <= 0" class="btn btn-primary" style="background-color: #ff3547 !important; float: right; width: 100%;"
							>schedule not created yet</a>
						</div>
					</div>
				</div>
			</div>
			<br>
		</div>
</div>
<div style="margin-top: 25px;" ng-show="dropdownTournament">
<div class="col-md-3" style="float: left;">
        <div class="card"> 
          <div class="card-body">
				<form class="text-center" style="color: #757575;" ng-submit="updatePlayerScores()">
					<label for="noofround"></label> 
					<select id="noofround" ng-model="matchRound" ng-options="obj.roundList as obj.round for obj in dropdownlist" ng-change="GetPlayerList()" class="form-control" required="required">
						<option value=''>Select Round</option>
					</select>
					<label for="players"></label>
					  <select id="players" ng-disabled="!matchRound" ng-model="playerDetails" class="form-control" ng-change="UpdateScore()" required="required">
					    <option value=''>Select Match</option>
					    <option ng-repeat="x in playerList" value="{{x}}">{{x.player1}} v/s {{x.player2}}</option>
					  </select>
					  <label></label>
					  <input type="hidden" id = "matchId" name="matchId" class="form-control" value="{{updatePlayerScore.match_id}}">
					  <input type="hidden" id = "tournamentid" name="tournamentid" class="form-control" value="{{tournamentId}}">
					  <input type="hidden" id = "categoryid" name="categoryid" class="form-control" value="{{categoryId}}">
					  
					  <select id="matchStatus"  ng-model="matchStatus" class="form-control" required="required" ng-change="showInputField()">
					    <option value=''>Select Match Status</option>
					    <option value='YET-TO-PLAY'>YET-TO-PLAY</option>
					    <option value='IN-PROGRESS'>IN-PROGRESS</option>
					    <option value='COMPLETED'>COMPLETED</option>
					  </select>
					  <table style="width:100%" ng-show="showtable">
						  <tr>
						    <th>{{updatePlayerScore.player1}} : </th>
						    <td>Set1 <input type="number" id = "playerfirst1" name="playerfirst1" ng-model="playerfirst1" class="form-control" value="0" required="required"></td>
						    <td>Set2 <input type="number" id = "playerSecond1" name="playerSecond1" ng-model="playerSecond1" class="form-control"  value="0" required="required"></td>
						    <td>Set3 <input type="number" id = "playerThird1" name="playerThird1" ng-model="playerThird1" class="form-control" value="0" required="required"></td>
						  </tr>
						  <tr>
						    <th>{{updatePlayerScore.player2}} : </th>
						    <td> <input type="number" id="playerfirst2" name="playerfirst2" ng-model="playerfirst2" class="form-control" value="0" required="required"></td>
						    <td> <input type="number" id="playerSecond2" name="playerSecond2" ng-model="playerSecond2" class="form-control" value="0" required="required"></td>
						    <td> <input type="number" id="playerThird2" name="playerThird2" ng-model="playerThird2" class="form-control" value="0" required="required"></td>
						  </tr>
						</table>
					<label></label>
					  <input type="hidden" id="team1" name="team1" value="{{updatePlayerScore.team1}}">
					  <input type="hidden" id="team2" name="team2" value="{{updatePlayerScore.team2}}">
					  <!-- <select id="matchWinner" class="form-control">
					    <option value=''>Select Winner</option>
					    <option value='{{updatePlayerScore.team1}}'>{{updatePlayerScore.player1}}</option>
					    <option value='{{updatePlayerScore.team2}}'>{{updatePlayerScore.player2}}</option>
					  </select> -->
					  <button type="submit" class="btn btn-danger">UPDATE</button>
					  <a class="btn btn-primary" style="background-color: #ff3547 !important;"
							ng-click="updateScoreTab()">BACK</a>
				</form>
			</div>
      </div>
</div>
<div class="col-md-9" style="float: left;">
    <div class="card"> 
       <div class="card-body">
          <table class="table">
				<thead>
				   <tr>
					 <th scope="col" style="text-align: center;">Match</th>
					 <th scope="col" style="text-align: center;">Date</th>
					 <th scope="col" style="text-align: center;">Time</th>
					 <th scope="col" style="text-align: center;">Court</th>
					 <th scope="col" style="text-align: center;">Status</th>
					 <th scope="col" style="text-align: center;">Score</th>
					</tr>
				</thead>
				<tbody>
				  <tr ng-repeat="obj in playerList">
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
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;">{{obj.matchStatus}}</td>
					<td style="text-align: center;font-size: 12px;padding-top: 1.1rem;border-top: 1px solid #dee2e6;padding-top: 8px;padding-bottom: 8px;" title="set1,set2,set3">{{obj.score}}</td>
				</tr>
			</tbody>
		</table>
	</div>
  </div>
</div>
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
     <form ng-submit="validateChangePassword();" method="post">
        <div class="md-form mb-5">
          <input type="text" id="oldPassword" name="oldPassword" class="form-control" required="required">
          <label for="oldPassword">Enter Current Password</label>
       </div>
      
        <div class="md-form mb-5">
          <input type="password" id="newPassword" name="newPassword" class="form-control" required="required">
          <label for="oldPassword">Enter New Password</label>
       </div> 
       <div class="md-form mb-5">
          <input type="password" id="repeatPassword" name="repeatPassword" class="form-control" required="required">
          <label for="repeatPassword">Enter Repeat Password</label>
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