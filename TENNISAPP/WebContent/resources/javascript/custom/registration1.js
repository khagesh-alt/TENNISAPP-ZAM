var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
$scope.validateOrganizerLogin = function () {
    var userId =  $scope.orguserId; 
	var loginpassword =  $scope.orgloginpassword; 
	
	if(userId == ""){
		alert("User Id should not be empty");
		return false;
	}
	if(loginpassword == "" || loginpassword == undefined){
		alert("Password should not be empty");
		return false;
	}
		var input = {
		"userId": userId,
		"password":loginpassword
		 }
		$scope.organizerLogin(input);
  }
  $scope.organizerLogin = function (input) {
	  var url = 'http://localhost:8080/TENNIS/organizerLogin', data = JSON.stringify(input),config='application/json; charset=utf-8';
	  $http.post(url, data, config).then(function (response) {
		  console.log(response.data.id);
		  if(response.data.id >= 0 && response.data.id != null){
			  sessionStorage.setItem("orgname", response.data.name);
			  sessionStorage.setItem("orgid", response.data.id);
			  sessionStorage.setItem("orgphone", response.data.phone);
			  sessionStorage.setItem("orgmailId", response.data.mailId);
			window.location.href = "tournment.html";
		  }else{
			  //alert(response.statusText);
			  alert("Failure");
			  location.reload();
		  }
     }, function (response) {
		alert("Failure");
		location.reload();
		});
}
});