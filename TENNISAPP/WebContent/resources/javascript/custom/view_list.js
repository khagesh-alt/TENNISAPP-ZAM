var app = angular.module('myApp', []);
$("#hideMainDiv").show();
$("#success-alert").hide();
$("#danger-alert").hide();
$("#info-alert").hide();
//location.reload();
app.controller('myCtrl', function($scope, $http) {
	 $scope.init = function() {
		 $scope.upcomingtournament();
		 $scope.getRankCategories();
		 $scope.getProfileData();
    };
    
    
var myUrl = window.location.href;
var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
var msg = $("#popupmsg").val();
if(msg != null && msg != ""){
	//alert(msg);
	$('#popupmsg').val("");
}
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
$scope.messageWithinfo = function(data){
	$scope.infomsg = data;
    $("#info-alert").fadeIn(1000);
	setTimeout(function(){ $("#info-alert").fadeOut(1000) }, 3000);
}

$( "#dateOfBirth" ).datepicker({
	  dateFormat : 'yy-mm-dd',
     changeMonth: true,
     changeYear: true,
     yearRange: '-100y:c+nn',
     maxDate: '-1d'
   });
// To get All upcomming or live tournament
$scope.upcomingtournament = function(){
var tournamentUrl = url+"playerView/getUpcommingTournament";
 $http({
    method : "GET",
    url : tournamentUrl
 }).then(function mySuccess(response) {
  $scope.tournamentCategoryDetails = response.data;
  //console.log(JSON.stringify(response.data));
  }, function myError(response) {
  });
}  

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

// To get all exist categories
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
// Player Login
$scope.validatePlayerLogin = function () {
    var userId =  parseInt($scope.userId); 
	var loginpassword =  $scope.loginpassword; 
	
	if(userId == ""){
		$scope.messageWithError("Mobile No. should not be empty");
		return false;
	}
	if(loginpassword == "" || loginpassword == undefined){
		$scope.messageWithError("Password should not be empty");
		return false;
	}
	var formData = new FormData();
	formData.append('userId',userId);
	formData.append('loginpassword',loginpassword);
	$scope.playerLoginFun(formData);
  }	
$scope.playerLoginFun = function(formData){
	var loginUrl = url+"playerView/secPlayerLogin";
	$.ajax({
		async : false,
        url: loginUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	if(data == "Success"){
        		if(localStorage.getItem("tournamentGlobalID") >= 0){
        		   window.location.href = "redirectToShowTournament?tournamentId="+localStorage.getItem("tournamentGlobalID");
        		}
        		else
        			location.reload();
        	}else{
        		$scope.loginPlyrValidate = data;
        	}
        }
    });
}
$scope.globalTournament = function(tournamentGlobalID){
	//$scope.tournamentGlobalID = tournamentGlobalID;
	if (typeof(Storage) !== "undefined") {
		  localStorage.setItem("tournamentGlobalID", tournamentGlobalID);
	}
}


//Player Registration
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
		$scope.registerPlyrValidate = "Name should not be empty...";
		return false;
	}
	if(phone == ""){
		$scope.registerPlyrValidate = "Phone should not be empty...";
		return false;
	}
	if((phone.toString()).length < 9){
		$scope.registerPlyrValidate = "Enter Valid Phone Number...";
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
// Player registration
$scope.addPlayerRegistration = function (input) {
	var addPlayerUrl = url+"playerView/addPlayer";
	$.ajax({
		  async:false,
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      url:addPlayerUrl,
	      data: JSON.stringify(input), 
	      Success: function (data) {
	    	 if(data.responseText == "Success"){
	    	   $scope.signUpTab = false;
	    	   $scope.forgetPwd = false;
	    	   $scope.signInTab = true;
	    	   $scope.messageWithSucces("Player registered successfully");
	    	 }
			 else
				 $scope.registerPlyrValidate = data.responseText;
	    	     //alert(data.responseText);
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
	      }
	  });
}
// Forget password
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
// Forget password
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
// Show tournament model
$scope.showTournamentModel = function(list){
	$scope.tournament = list;
	if (typeof(Storage) !== "undefined") {
		  localStorage.setItem("tournamentGlobalID", list.tournamentId);
	}
	$("#viewTournament").modal("show");
}
$scope.liveClass = "filter-active";
$scope.liveOrUpcoming = false;
$scope.filterFun = function(val){
	if(val == false){
		$scope.liveClass = "filter-active";
		$scope.upcomingClass = "";
		$scope.liveOrUpcoming = val;
	}else if(val == true){
		$scope.upcomingClass = "filter-active";
		$scope.liveClass = "";
		$scope.liveOrUpcoming = val;
	}
}
$scope.getProfileData = function(){
	var profileUrl = url+"getProfile";
	$http({
		method : "GET",
		url : profileUrl
	  }).then(function mySuccess(response) {
		  console.log(JSON.stringify(response.data));
		  $scope.profileData = response.data;
	  }, function myError(response) {
		//alert(response);
	  });
}
$scope.validateChangePassword = function () {	
	var oldpwd = $scope.oldPassword;
	var newpwd = $scope.newPassword;
	var retypepwd = $scope.repeatPassword;
	var existPassword = $("#existPassword").val();
	var changedPlayerId = $("#changedPlayerId").val();
	
	if(oldpwd == ""){
		//alert("Current Password Field should Not Be Empty");
		$scope.changePwdValidate = "Current Password Field should Not Be Empty...";
		return false;
	}
	if(existPassword != oldpwd){
		//alert("Current Password is Wrong");
		$scope.changePwdValidate = "Current Password is Wrong...";
		return false;
	}
	if(newpwd == ""){
		//alert("New Password Field should Not Be Empty");
		$scope.changePwdValidate = "New Password Field should Not Be Empty...";
		return false;
	}
	if(retypepwd == ""){
		//alert("Repeat Password Field should Not Be Empty");
		$scope.changePwdValidate = "Repeat Password Field should Not Be Empty...";
		return false;
	}
	if(newpwd != retypepwd){
		//alert("New Password and Repeat password should be match");
		$scope.changePwdValidate = "New Password and Repeat password should be match...";
		return false;
	}
		var formData = new FormData();
		formData.append('oldpwd', oldpwd);
		formData.append('newpwd', newpwd);
		formData.append('retypepwd', retypepwd);
		
		$scope.editPassword(formData);
}
$scope.editPassword = function (formData){
	var changepwdUrl = url+"playerView/changePlayerPassword";
	$.ajax({
        url: changepwdUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	//showAlertSec(data);
         if(data == "Password updated successfully"){
        	 $scope.messageWithSucces(data);
        	 window.location.href = "playerhome";
         }else{
        	 $scope.changePwdValidate = data;
         }
        }
    });
}
});