var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	var tournamentUrl = url+"getTournamentListForUpdateScore";
		$http({
			method : "GET",
			url : tournamentUrl
		  }).then(function mySuccess(response) {
			 // console.log(JSON.stringify(response.data));
			  $scope.tournamentDetails = response.data;
		  }, function myError(response) {
			//alert(response);
		  });
		var profileUrl = url+"getProfile";
		   $http({
		   	method : "GET",
		   	url : profileUrl
		     }).then(function mySuccess(response) {
		  	  $scope.profileData = response.data;
		   }, function myError(response) {
		 });
		   $scope.playerfirst1 = 0;
    	   $scope.playerSecond1 = 0;
    	   $scope.playerThird1 = 0;
    	   $scope.playerfirst2 = 0;
    	   $scope.playerSecond2 = 0;
    	   $scope.playerThird2 = 0;   
		$scope.listedTournaments = true;
		$scope.dropdownTournament = false;
		$scope.showtable = false;
		
		$scope.updateScoreTab = function(){
			$scope.listedTournaments = true;
			$scope.dropdownTournament = false;
		}
		$scope.showInputField = function(){
			if($scope.matchStatus == 'COMPLETED')
			$scope.showtable = true;
			else
				$scope.showtable = false;
		}
		
		
		$scope.buildDropDownList = function(tournamentId,categoryId){
			var matchRoundUrl = url+"getRoundMatchRoundList?tournamentId="+tournamentId+"&categoryId="+categoryId;
			$http({
				method : "GET",
				url : matchRoundUrl
			  }).then(function mySuccess(response) {
				  $scope.dropdownlist = response.data;
			  }, function myError(response) {
				//alert(response);
			  });
			
			//$scope.dropdownlist = list;
			$scope.tournamentId = tournamentId;
			$scope.categoryId = categoryId;
			$scope.listedTournaments = false;
			$scope.dropdownTournament = true;
		}
		$scope.GetPlayerList = function() {
            $scope.playerList = $scope.matchRound;
          };
        $scope.UpdateScore = function() {
  		  $scope.updatePlayerScore = angular.copy(JSON.parse($scope.playerDetails));
        };
        
       $scope.updatePlayerScores = function(){
    	   var matchId = parseInt($("#matchId").val());
    	   var tournamentid = parseInt($("#tournamentid").val());
    	   var categoryid = parseInt($("#categoryid").val());
    	   
    	   if($scope.matchStatus == 'COMPLETED'){
    		   var matchwinner = null;
        	   //first set
        	   var playerfirst1 = parseInt($("#playerfirst1").val()); 
        	   var playerSecond1 = parseInt($("#playerSecond1").val());
        	   var playerThird1 = parseInt($("#playerThird1").val());
        	   //second set
        	   var playerfirst2 = parseInt($("#playerfirst2").val()); 
        	   var playerSecond2 = parseInt($("#playerSecond2").val());
        	   var playerThird2 = parseInt($("#playerThird2").val());
        	   
        	   var team1 = $("#team1").val();
        	   var team2 = $("#team2").val();
        	   if((playerfirst1+playerSecond1+playerThird1) > (playerfirst2+playerSecond2+playerThird2)){
        		   matchwinner = team1;
        	   }
        	   else if((playerfirst1+playerSecond1+playerThird1) < (playerfirst2+playerSecond2+playerThird2)){
        		   matchwinner = team2;
        	   }else{
        		   showAlertSec("Both Team can't have same score!")
        		   return false;
        	   }
        	   var score = playerfirst1+"-"+playerfirst2+","+playerSecond1+"-"+playerSecond2+","+playerThird1+"-"+playerThird2;
        	   var formData = new FormData();
        	   formData.append('matchId', matchId);
        	   formData.append('tournamentid', tournamentid);
        	   formData.append('categoryid', categoryid);
        	   formData.append('score', score);
        	   formData.append('matchStatus', $scope.matchStatus);
        	   formData.append('matchWinner', matchwinner);
        	   
        	   var updateMatchScore = url+"updateMatchScore";
        		$.ajax({
        	        url: updateMatchScore,
        	        data: formData,
        	        contentType: false,
        	        processData: false,
        	        type: 'POST',
        	        success: function(data){
        	        	   $scope.matchStatus=null;
        	        	   $scope.playerfirst1 = 0;
        	        	   $scope.playerSecond1 = 0;
        	        	   $scope.playerThird1 = 0;
        	        	   $scope.playerfirst2 = 0;
        	        	   $scope.playerSecond2 = 0;
        	        	   $scope.playerThird2 = 0;
        	        	   $scope.showtable = false;
        	        	showAlertSec(data);
        	        	$scope.buildDropDownList(tournamentid,categoryid);
        	        	
        	        }
        	    }); 
    	   }else{
    		   var formData = new FormData();
        	   formData.append('matchId', matchId);
        	   formData.append('tournamentid', tournamentid);
        	   formData.append('categoryid', categoryid);
        	   formData.append('matchStatus', $scope.matchStatus);
    		   var updateMatchStatus = url+"updateMatchStatus";
    		   $.ajax({
       	        url: updateMatchStatus,
       	        data: formData,
       	        contentType: false,
       	        processData: false,
       	        type: 'POST',
       	        success: function(data){
       	        	   $scope.matchStatus=null;
       	        	showAlertSec(data);
       	        	$scope.buildDropDownList(tournamentid,categoryid);
       	        	
       	        }
       	    }); 
    	   }
    	   
       } 
       $scope.validateChangePassword = function () {	
    		var oldpwd = $("#oldPassword").val();
    		var newpwd = $("#newPassword").val();
    		var retypepwd = $("#repeatPassword").val();
    		var existPassword = $("#existPassword").val();
    		var changedPlayerId = $("#changedPlayerId").val();
    		
    		if(oldpwd == ""){
    			showAlertSec("Current Password Field should Not Be Empty");
    			return false;
    		}
    		if(existPassword != oldpwd){
    			showAlertSec("Current Password is Wrong");
    			return false;
    		}
    		if(newpwd == ""){
    			showAlertSec("New Password Field should Not Be Empty");
    			return false;
    		}
    		if(retypepwd == ""){
    			showAlertSec("Repeat Password Field should Not Be Empty");
    			return false;
    		}
    		if(newpwd != retypepwd){
    			showAlertSec("New Password and Repeat password should be match");
    			return false;
    		}
    			var formData = new FormData();
    			formData.append('oldpwd', oldpwd);
    			formData.append('newpwd', newpwd);
    			formData.append('retypepwd', retypepwd);
    			
    			$scope.changePassword(formData);
    	}
    	$scope.changePassword = function (formData){
    		var changepwdUrl = url+"changeOrganisePassword";
    		$.ajax({
    	        url: changepwdUrl,
    	        data: formData,
    	        contentType: false,
    	        processData: false,
    	        type: 'POST',
    	        success: function(data){
    	        	showAlertSec(data);
    	         if(data == "Password updated successfully")
    	        	window.location.href = "login";
    	        }
    	    });
    	}
         
});	 