var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	$("#success-alert").hide();
	$("#danger-alert").hide();
	$("#info-alert").hide();
	var msg = $("#popupmsg").val();
	 $('#popupmsg').val("");
	 
	 $( "#dateOfBirth" ).datepicker({
		  dateFormat : 'yy-mm-dd',
	      changeMonth: true,
	      changeYear: true,
	      yearRange: '-100y:c+nn',
          maxDate: '-1d'
	    });
	 $scope.init = function() {
			$scope.getRankCategories();
			//$scope.rankSelected = true;
	    };
	 $scope.signUpTab = false;
	 $scope.forgetPwd = false;
	 $scope.signInTab = true;
	 $scope.signUpTabShowHide = function () {
        $scope.signInTab =  false;
        $scope.forgetPwd = false;
	    $scope.signUpTab = true;
     }
	$scope.signInTabShowHide = function () {
		$scope.signUpTab = false;
		$scope.forgetPwd = false;
		$scope.signInTab =  true;
    }
	$scope.forgotPassword = function(){
		$scope.signInTab = false;
		$scope.signUpTab = false;
		$scope.forgetPwd = true;
	}
$scope.getRankCategories = function(){
	var rankListUrl = url+"playerView/getAllRankCategories";
	$http({
		method : "GET",
		url : rankListUrl
	  }).then(function mySuccess(response) {
		  $scope.rankList = response.data;
		  $scope.rankItem = $scope.rankList[0];
	  }, function myError(response) {
	  });
	}
$scope.validatePlayerRegistration = function () {
    var name =  $scope.name; 
	var phone =  parseInt($scope.phone); 
	var email =  $scope.email; 
	var pwd =  $scope.pwd; 
	var repwd =  $scope.repwd; 
	var address =  $scope.address; 
	var dateOfBirth =  $("#dateOfBirth").val();
	var rankid = $scope.rankItem.rankId;
	var itaRank = parseInt($("#itaRank").val()); 
	var itaId = parseInt($("#itaId").val()); 
	var gender = $("input[name='gender']:checked").val();
	if(name.trim() == ""){
		//showAlertSec("Name should not be empty");
		$scope.registerPlyrValidate = "Name should not be empty...";
		return false;
	}
	if(phone == ""){
		$scope.registerPlyrValidate = "Phone should not be empty...";
		return false;
	}
	if(email.trim() == ""){
		$scope.registerPlyrValidate = "Email should not be empty...";
		return false;
	}
	if(pwd.trim() == ""){
		$scope.registerPlyrValidate = "Password should not be empty...";
		return false;
	}
	if(repwd.trim() == ""){
		$scope.registerPlyrValidate = "Confirm password should not be empty...";
		return false;
	}
	if(pwd.trim() != repwd.trim()){
		$scope.registerPlyrValidate = "Password And Repassword should be match...";
		return false;
	}
	if(address.trim() == ""){
		$scope.registerPlyrValidate = "Address should not be empty...";
		return false;
	}
	if(dateOfBirth == ""){
		$scope.registerPlyrValidate = "Date of birth should not be empty...";
		return false;
	}
	if(rankid == undefined || isNaN(rankid) || rankid == ""){
		$scope.registerPlyrValidate = "Please select ranking from list...";
		return false;
	}
	/*if((itaRank == "" || isNaN(itaRank)) && !(itaId == "" || isNaN(itaId))){
		$scope.registerPlyrValidate = "Rank should not be empty...";
		return false;
	}
	if((itaId == "" || isNaN(itaId)) && !(itaRank == "" || isNaN(itaRank))){
		$scope.registerPlyrValidate = "Id should not be empty..";
		return false;
	}*/
	if(((itaRank == "" || isNaN(itaRank)) || (itaId == "" || isNaN(itaId))) && rankid !=1){
		$scope.registerPlyrValidate = "Id & Rank should not be empty..";
		return false;
	}
	if((itaRank == "" || isNaN(itaRank)) && (itaId == "" || isNaN(itaId)) && rankid ==1){
		itaRank = 11111111;
		itaId = 11111111;
	}
	
		var input = {
		"name": name,
		"dateOfBirth":dateOfBirth,
		"address":address,
		"lavel":"high",
		"phone":phone,
		"email":email,
		"itaId":itaId,
		"itaRank":itaRank,
		"pwd":pwd,
		"repwd":repwd,
		"gender":parseInt(gender),
		"points":5,
		"rank":rankid
		 }
		$scope.addPlayerRegistration(input);
  }
$scope.addPlayerRegistration = function (input) {
	var addPlayerUrl = url+"playerView/addPlayer";
	$.ajax({
		  async:false,
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      url:addPlayerUrl,
	      data: JSON.stringify(input), 
	      Success: function (data) {
	    	 //console.log(JSON.stringify(data));
	    	 if(data.responseText == "Success"){
	    	   $scope.signUpTab = false;
	    	   $scope.forgetPwd = false;
	    	   $scope.signInTab = true;
	    	 $scope.messageWithSucces("Player registered successfully");
	    	 }
			 else
				 $scope.registerPlyrValidate = data.responseText;
	    		 //location.reload();
	      },
	      error: function (data) {
	    	if(data.responseText == "Success"){
	    		$scope.signUpTab = false;
		    	$scope.forgetPwd = false;
		    	$scope.signInTab = true;
	    		$scope.messageWithSucces("Player registered successfully");
	    	}
			 else
				 $scope.registerPlyrValidate = data.responseText;
	    		// location.reload();
	      }
	  });
}
$scope.validatePlayerLogin = function () {
    var userId =  parseInt($scope.userId); 
	var loginpassword =  $scope.loginpassword; 
	
	if(userId == ""){
		showAlertSec("Mobile No. should not be empty");
		return false;
	}
	if(loginpassword == "" || loginpassword == undefined){
		showAlertSec("Password should not be empty");
		return false;
	}
	return true;
		/*var input = {
		"userId": userId,
		"password":loginpassword
		 }
		$scope.playerLogin(input);*/
  }
  /*$scope.playerLogin = function (input) {
	  //url+"addPlayer";
	  var playerLoginUrl = url+"playerLogin";
	  var url = playerLoginUrl, data = JSON.stringify(input),config='application/json; charset=utf-8';
	  $http.post(url, data, config).then(function (response) {
		  console.log(response.data.playerId);
		  if(response.data.playerId >= 0){
			  sessionStorage.setItem("name", response.data.name);
			window.location.href = "tournamentCategory.html";
		  }else{
			  alert(response.statusText);
			  location.reload();
		  }
     }, function (response) {
		alert("Failure");
		//location.reload();
		});
		
}
*/$scope.validateOrganizerLogin = function () {
    var userId =  parseInt($scope.orguserId); 
	var loginpassword =  $scope.orgloginpassword; 
	
	if(userId == ""){
		showAlertSec("Mobile NO. should not be empty");
		return false;
	}
	if(loginpassword == "" || loginpassword == undefined){
		showAlertSec("Password should not be empty");
		return false;
	}
	return true;
		/*var input = {
		"userId": userId,
		"password":loginpassword
		 }
		$scope.organizerLogin(input);*/
  }
  /*$scope.organizerLogin = function (input) {
	  var url = url+"organizerLogin", data = JSON.stringify(input),config='application/json; charset=utf-8';
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
}*/
$scope.messageWithError = function(data){
	$scope.errormsg = data;
	$("#danger-alert").fadeIn(1000);
  	setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
}
$scope.messageWithSucces = function(data){
	$scope.successmsg = data;
    $("#success-alert").fadeIn(1000);
	setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
}
$scope.validateForgetPassword = function(){
	var mobile = $scope.orguserforgetId;
	
	if(mobile == ""){
		$scope.changePwdValidate = "Mobile Field should Not Be Empty...";
		return false;
	}
	
		var formData = new FormData();
		formData.append('mobile',mobile);
		$scope.editPassword(formData);
}
$scope.editPassword = function (formData){
	var changepwdUrl = url+"playerforgotPassword";
	$.ajax({
		async : false,
        url: changepwdUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	console.log(data);
        	$scope.changePwdValidate = data;
        }
    });
}
});