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
 <!--  <link rel='stylesheet' href='https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/compiled-4.8.0.min.css?ver=4.8.0'> -->
  <!-- Your custom styles (optional) -->
 <spring:url value="/resources/css/style.css" var="stylecss"/>
  <link rel="stylesheet" href="${stylecss}"> 
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
   <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
   <spring:url value="/resources/javascript/custom/activeTournaments.js" var="superadminjs"/>
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
table.table thead th {
    font-family: 'Montserrat', sans-serif;
    font-size: 14px;
    font-weight: bold;
}
table.table tbody td {
    font-family: 'Montserrat', sans-serif;
    font-size: 14px;
}
.custom-control-input:checked~.custom-control-label::before {
    color: #fff;
    border-color: #27AE60;
    background-color: #27AE60;
}
a{
color: #fff;
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
                <a href="academy">Academy</a>
                <a href="superadmin">Organiser</a>
                <a href="activeTournaments" style="font-weight: 600;">Tournaments</a>
                <a href="./adminlogout"><span>Logout</span></a>
              </div>
            </div>
          </nav>

    <!--Main Navigation-->

	<div style="margin-top: 80px;display: none;" id="hideMainDiv">
		<div style="padding: 5px; color: #fff; font-size: 20px;">
			<span>Welcome Admin!!!</span>
		</div>
		<div class="container">
			<div class="row" style="margin-top: 12px;background: #fff;padding: 20px;">

				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Tournament</th>
							<th scope="col">Organiser</th>
							<th scope="col">Status</th>
							<th scope="col">Active / In active</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="data in tournaments">
							<th scope="row">{{$index+1}}</th>
							<td>{{data.title}}</td>
							<td>{{data.orgName}}</td>
							<td>{{data.status}}</td>
							<td>
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input"	id="customSwitch{{$index+1}}" ng-model="data.active" ng-click="activeOrInActive(data.tournamentid,data.active)"> <label
										class="custom-control-label" for="customSwitch{{$index+1}}"></label>
								</div> <!-- <div class="switch">
									<label> In active <input type="checkbox" ng-model="data.active" ng-click="activeOrInActive(data.tournamentid,data.active)"> <span
										class="lever"></span> Active
									</label>
								</div> -->
							</td>
						</tr>
					</tbody>
				</table>




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
    <!-- Bootstrap core JavaScript -->
  <spring:url value="/resources/javascript/bootstrap.min.js" var="bootstrapminjs"/>
  <script src="${bootstrapminjs}"></script>
    <!-- MDB core JavaScript -->
  <spring:url value="/resources/javascript/mdb.min.js" var="mdbminjs"/>
  <script src="${mdbminjs}"></script>
</body>
</html>