var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);

	var tournamenturl = url + "playerView/activeORInActiveTournaments";
	$http({
		method : "GET",
		url : tournamenturl
	}).then(function mySuccess(response) {
		console.log(JSON.stringify(response.data));
		$scope.tournaments = response.data;
	}, function myError(response) {
	});
	
	$scope.activeOrInActive = function(tournamentid,bolVal){
		var activeVal = 0;
		if(bolVal == true)
			activeVal = 1;
    	var transactionUrl = url+"playerView/setActiveOrInActive?tournamentid="+tournamentid+"&activeVal="+activeVal;
    	$http({
    	    method : "GET",
    	    url : transactionUrl
    	  }).then(function mySuccess(response) {
    		  
    	  }, function myError(response) {
    	  });
	}

});