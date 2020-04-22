var app = angular.module('myApp', []);
   app.controller('myCtrl', function($scope, $http) {
   	
	   var myUrl = window.location.href;
	   var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	   
   	$("#success-alert").hide();
   	$("#danger-alert").hide();
   	
$scope.validateResetPassword = function(){
	var forgottoken = $("#forgottoken").val();
	var forgotMobile = $("#forgotMobile").val();
	var newpwd = $scope.forgotnewpwd;
	var retypepwd = $scope.forgotrepwd;
	if(newpwd == ""){
		$scope.changePwdValidate = "New Password Field should Not Be Empty...";
		return false;
	}
	if(retypepwd == ""){
		$scope.changePwdValidate = "Repeat Password Field should Not Be Empty...";
		return false;
	}
	if(newpwd != retypepwd){
		$scope.changePwdValidate = "New Password and Repeat password should be match...";
		return false;
	}
	//return true;
	var formData = new FormData();
	formData.append('forgottoken', forgottoken);
	formData.append('forgotMobile', forgotMobile);
	formData.append('forgotnewpwd', newpwd);
	formData.append('forgotrepwd', retypepwd);
	
	$scope.resetpassworrd(formData);
	
}
$scope.resetpassworrd = function(formData){
	var resetPassword = url+"resetPassword";
	console.log(resetPassword);
	$.ajax({
		async : false,
        url: resetPassword,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	alert(data);
        	window.location.href = "organiserlogin";
        }
    });
}  

// For Player Forget password
$scope.validatePlayerResetPassword = function(){
	var forgottoken = $("#forgottoken").val();
	var forgotMobile = $("#forgotMobile").val();
	var newpwd = $scope.forgotnewpwd;
	var retypepwd = $scope.forgotrepwd;
	if(newpwd == ""){
		$scope.changePwdValidate = "New Password Field should Not Be Empty...";
		return false;
	}
	if(retypepwd == ""){
		$scope.changePwdValidate = "Repeat Password Field should Not Be Empty...";
		return false;
	}
	if(newpwd != retypepwd){
		$scope.changePwdValidate = "New Password and Repeat password should be match...";
		return false;
	}
	//return true;
	var formData = new FormData();
	formData.append('forgottoken', forgottoken);
	formData.append('forgotMobile', forgotMobile);
	formData.append('forgotnewpwd', newpwd);
	formData.append('forgotrepwd', retypepwd);
	
	$scope.resetPlayerpassworrd(formData);
	
}
$scope.resetPlayerpassworrd = function(formData){
	var resetPassword = url+"playerResetPassword";
	console.log(resetPassword);
	$.ajax({
		async : false,
        url: resetPassword,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	alert(data);
        	window.location.href = "playerhome";
        }
    });
}  
   	
});