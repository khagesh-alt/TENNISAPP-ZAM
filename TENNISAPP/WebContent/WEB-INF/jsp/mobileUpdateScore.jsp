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
  <spring:url value="/resources/javascript/custom/mobileUpdateScore.js" var="mobileUpdateScorejs"/>
  <script src="${mobileUpdateScorejs}"></script>
  <style>
  html{
  width: 100%;
    height: 100%;
  }
* {
    box-sizing: border-box;
}

body {
        font-family: 'Montserrat', sans-serif;
}

header {
    background-color: #062351;
    padding: 2px;
    text-align: center;
    font-size: 35px;
    color: white;
}

@media (max-width: 600px) {
    nav, article {
        width: 100%;
        height: auto;
    }
}
@font-face {
  font-family: "GothamRoundedBook";
  src: url(../assets/GothamRoundedBook_21018.ttf) format("truetype");
}
.mbackground {
        background: rgba(0, 0, 0, 0.4) !important;
    }
.whitebackground{
      width: 100%;
    height: 100%;
    background-image: url(/TENNISAPP-TESTING/resources/images/player.jpg);
    width: 100%;
    margin: 0px;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  
}
.info-color {
    background-color: #ff3547!important;
}
</style>
</head>

<body  ng-app="myApp" ng-controller="myCtrl" class="whitebackground">
	<nav class="navbar navbar-inverse mbackground">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="mobileOrganiserlogin"><span
				class="text-danger">Tennis</span>App</a>
		</div>
		<div class="rightmenu">
				<c:if test="${sessionScope['scopedTarget.userSession'].loginType != NAN}">
				<a href="./logout"><span>Logout</span></a>
				</c:if>
              </div>
	</div>
	</nav>
	<div class="container">
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
							ng-click="buildDropDownList(obj.matchRoundBean,list.tournamentId,obj.categoryId)">{{obj.categoryName}}</a>
							<a ng-if="obj.checkSchedule <= 0" class="btn btn-primary" style="background-color: #ff3547 !important; float: right; width: 100%;"
							>schedule not created yet</a>
						</div>
					</div>
				</div>
			</div>
			<br>
		</div>

		<div style="margin-top: 25px;" ng-show="dropdownTournament">
   <div class="card"> 
          <div class="card-body px-lg-5">
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
					  <table style="width:100%">
						  <tr>
						    <th>{{updatePlayerScore.player1}} : </th>
						    <td>Set1 <input type="number" id = "playerfirst1" name="playerfirst1" class="form-control" value="0" required="required"></td>
						    <td>Set2 <input type="number" id = "playerSecond1" name="playerSecond1" class="form-control"  value="0" required="required"></td>
						    <td>Set3 <input type="number" id = "playerThird1" name="playerThird1" class="form-control" value="0" required="required"></td>
						  </tr>
						  <tr>
						    <th>{{updatePlayerScore.player2}} : </th>
						    <td> <input type="number" id="playerfirst2" name="playerfirst2" class="form-control" value="0" required="required"></td>
						    <td> <input type="number" id="playerSecond2" name="playerSecond2" class="form-control" value="0" required="required"></td>
						    <td> <input type="number" id="playerThird2" name="playerThird2" class="form-control" value="0" required="required"></td>
						  </tr>
						</table>
					<label></label>
					  <select id="matchStatus"  ng-model="matchStatus" class="form-control" required="required">
					    <option value=''>Select Match Status</option>
					    <option value='YET-TO-PLAY'>YET-TO-PLAY</option>
					    <option value='IN-PROGRESS'>IN-PROGRESS</option>
					    <option value='COMPLETED'>COMPLETED</option>
					  </select>
					  <label></label>
					  <select id="matchWinner" class="form-control">
					    <option value=''>Select Winner</option>
					    <option value='{{updatePlayerScore.team1}}'>{{updatePlayerScore.player1}}</option>
					    <option value='{{updatePlayerScore.team2}}'>{{updatePlayerScore.player2}}</option>
					  </select>
					  <button type="submit" class="btn btn-danger">UPDATE</button>
					  <a class="btn btn-primary" style="background-color: #ff3547 !important;"
							ng-click="updateScoreTab()">BACK</a>
				</form>
			</div>
      </div>


</div>
	</div>
	
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
      <div class="modal-footer d-flex">
        <button type="button" onclick="hideAlert()" class="btn btn-danger">Ok</button>
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
      <div class="modal-footer d-flex">
        <button type="button" onclick="hideAlertSec()" class="btn btn-danger">Ok</button>
      </div>
    </div>
  </div>
</div>
<!-- Alert popup close -->
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