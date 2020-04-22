var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	$("#main").show();
	$("#success-alert").hide();
	$("#danger-alert").hide();
	$("#info-alert").hide();
	
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	var msg = $("#popupmsg").val();
	 $('#popupmsg').val("");
  $scope.validateOrganizerLogin = function () {
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
$scope.signUpTab = false;
$scope.forgetPwd = false;
$scope.signInTab = true;
$scope.signUpTabShowHide = function(){
	$scope.signInTab = false;
	$scope.forgetPwd = false;
	$scope.signUpTab = true;
}
$scope.signInTabShowHide = function(){
	$scope.signUpTab = false;
	$scope.forgetPwd = false;
	$scope.signInTab = true;
}
$scope.forgotPassword = function(){
	$scope.signInTab = false;
	$scope.signUpTab = false;
	$scope.forgetPwd = true;
}
//Add Organiser Part
$scope.validateAddOrganiser = function () {
    var orgName =  $scope.orgName; 
	var orgMobile =  $scope.orgMobile; 
	var orgEmail =  $scope.orgEmail; 
	var orgAddress =  $scope.orgAddress; 
	
	if(orgName.trim() == ""){
		$scope.errormsg = "Name should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(orgMobile == ""){
		$scope.errormsg = "Phone should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(!validateNumber(orgMobile)){
		$scope.errormsg = "Invalid Phone...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(orgEmail.trim() == ""){
		$scope.errormsg = "Email should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(orgAddress.trim() == ""){
		$scope.errormsg = "Password should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
		var input = {
		"name": orgName,
		"address":orgAddress,
		"phone":orgMobile,
		"mailId":orgEmail
		 }
		$scope.addOrganizerRegistration(input,orgName);
  }
  $scope.addOrganizerRegistration = function (input,orgName) {
	  var orgregurl = url+"playerView/organizerRegistration";
	$.ajax({
		  async:false,
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      url: orgregurl,
	      data: JSON.stringify(input), 
	      Success: function (data) {
	    	  console.log(JSON.stringify(data));
					if (data.responseText == "Success") {
						$scope.signInTabShowHide();
						$("#sideModalTR").modal("hide");
						$scope.successmsg = orgName+" Credentials sent to registered mail ID...";
						$("#success-alert").fadeIn(1000);
						setTimeout(function() {
							$("#success-alert").fadeOut(1000)
						}, 3000);
					} else {
						$("#sideModalTR").modal("hide");
						$scope.errormsg = data.responseText;
						$("#danger-alert").fadeIn(1000);
						setTimeout(function() {
							$("#danger-alert").fadeOut(1000)
						}, 3000);
					}
	      },
	      error: function (data) {
				if (data.responseText == "Success") {
					$scope.signInTabShowHide();
					$("#sideModalTR").modal("hide");
					$scope.successmsg = orgName+" Credentials sent to registered mail ID...";
					$("#success-alert").fadeIn(1000);
					setTimeout(function() {
						$("#success-alert").fadeOut(1000)
					}, 3000);
				} else {
					$("#sideModalTR").modal("hide");
					$scope.errormsg = data.responseText;
					$("#danger-alert").fadeIn(1000);
					setTimeout(function() {
						$("#danger-alert").fadeOut(1000)
					}, 3000);
				}
      }
	  });
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
		var changepwdUrl = url+"forgotPassword";
		$.ajax({
			async : false,
	        url: changepwdUrl,
	        data: formData,
	        contentType: false,
	        processData: false,
	        type: 'POST',
	        success: function(data){
	        	$scope.changePwdValidate = data;
	        /* if(data == "Password updated successfully"){
	        	 $scope.successmsg = "Password updated successfully...";
	       		 $("#success-alert").fadeIn(1000);
	       	  	 setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
	       	   window.location.href = "organiserlogin";
	         }else{
	        	 $scope.errormsg = data;
	     		 $("#danger-alert").fadeIn(1000);
	     	  	 setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
	         }*/
	        }
	    });
	}
});