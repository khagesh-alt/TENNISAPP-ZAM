var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	$("#success-alert").hide();
	$("#danger-alert").hide();
	$scope.organizerName = $("#hiddenorganizername").val();
	$scope.organizerEmail = $("#hiddenorganizermail").val();
	$scope.organizerMobile = $("#hiddenorganizerphone").val();
	$scope.organizerAltMobile = $("#hiddenorganizerphone").val();
	
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	
	 $(".tournamentDate").datepicker({ 
         autoclose: true, 
         todayHighlight: true
   }).datepicker('update', new Date());
	 
	 $(".dobDate").datepicker({ 
         autoclose: true, 
         todayHighlight: true
   }).datepicker('update', new Date(2010, 01, 01));
	 
 $('.selectpicker').selectpicker();
      var tournamentUrl = url+"getVenueAndCourtDetails";
		 $http({
			 method : "GET",
			 url : tournamentUrl
		   }).then(function mySuccess(response) {
			   //console.log(JSON.stringify(response.data));
			   $scope.venueDetails = response.data;
		   }, function myError(response) {
		   });
		 
		// profile
 var profileUrl = url+"getProfile";
   $http({
   	method : "GET",
   	url : profileUrl
     }).then(function mySuccess(response) {
   	 // console.log(JSON.stringify(response.data));
  	  $scope.profileData = response.data;
   }, function myError(response) {
	    	//alert(response);
 });
		    
$scope.getselectval = function () {
$scope.courtDetails = $scope.selitem.courts;
}
        var tournamentCatUrl = url+"getTournamentCategories";
		 $http({
			 method : "GET",
			 url : tournamentCatUrl
		   }).then(function mySuccess(response) {
			 //  console.log(JSON.stringify(response.data));
			   $scope.categoryDetails = response.data;
			   	var options="";
			   $.each(response.data, function (index, value) {
	 	    	 options=options+"<option value=\""+value.category_id+"\">"+value.category_name+"</option>";
	 	        });
	 	       $("#listdata").html(options);
	 	      $(".selectpicker").selectpicker('refresh');
		   }, function myError(response) {
			 //alert(response);
		   });
$scope.getselectcategory = function () {
var inputjson = [];
	$.each($("#listdata option:selected"), function(){
		var temp = parseInt($(this).val());
		angular.forEach($scope.categoryDetails, function (value, key) {
			if(value.category_id == temp){
				var  input = {
       	   	        		"category_id":value.category_id,
       	   	        		"category_name":value.category_name,
							"courts":$scope.courtDetails
	    		       };
					   inputjson.push(input);
			}
        });
	});
	if(inputjson.length <= 0)
		//showAlertSec("Please select atleast one category.")
		$scope.messageWithError("Please select atleast one category...");
$scope.buildCourt = inputjson;
$scope.calLength = inputjson.length;
}
// Post method
$scope.postTournament = function(){
	
	var tournamentName = $scope.tournamentName;
	var organizerName = $scope.organizerName;
	var organizerEmail = $scope.organizerEmail;
	var contactNo = $scope.organizerMobile;
	var altcontactNo = $scope.organizerAltMobile;
	var referee = $scope.referee;
	var venueId = $scope.selitem.venueId;
	var organiserId = parseInt($("#organizerId").val());
	var regStartDate = $("#regStartDate").val();
	var regEndDate = $("#regEndDate").val();
	var tournamentStartDate = $("#tournamentStartDate").val();
	var tournamentEndDate = $("#tournamentEndDate").val();

	
	var formData = new FormData();
	 formData.append('bannerImage', $( '#bannerImage' )[0].files[0]);
	 
	 if(tournamentName == "" || tournamentName == undefined){
		 $scope.messageWithError("Title should not be empty...");
			return false;
		}
	 if(organizerName == "" || organizerName == undefined){
		 $scope.messageWithError("Organiser Name should not be empty...");
			return false;
		}
	 if(organizerEmail == "" || organizerEmail == undefined){
		 $scope.messageWithError("Email should not be empty...");
			return false;
		}
	 if(!validateNumber(contactNo)){
		 $scope.messageWithError("Invalid Phone...");
			return false;
		}
	 if(!validateNumber(altcontactNo)){
		 $scope.messageWithError("Invalid Alt Phone...");
			return false;
		}
	 if(new Date(regStartDate) > new Date(regEndDate)){
		 $scope.messageWithError("Registration End date should be greater than or equal to Start date...");
		 return false;
		}
	 if(new Date(regEndDate) > new Date(tournamentStartDate)){
		 $scope.messageWithError("Tournament Start date should be greater than or equal to Registration End date...");
			return false;
		}
	 if(new Date(tournamentStartDate) > new Date(tournamentEndDate)){
		 $scope.messageWithError("Tournament End date should be greater than  or equal to Start date...");
			return false;
		}
	 
	var category = [];
	
	$('#shiva li').each(function(i){
      var categoryId = $("#categoryId"+i).val();
	  var entryFee = $("#entryFee"+categoryId).val();
	  var prizeMoney = $("#prizeMoney"+categoryId).val();
	  var Brands= [];
	      var  inputparent = {
       	   	        		"categoryId":parseInt(categoryId),
							"entryFee":parseInt(entryFee),
							"prizeMoney":parseInt(prizeMoney)
	    		       };
                       category.push(inputparent);
   
   });
   var crtjson ={
				"tournament":tournamentName,
				"organizer":organizerName,
				"referee":referee,
				"mailId":organizerEmail,
				"contactNo":contactNo+"",
				"altContactNo":altcontactNo+"",
				"venueId":venueId,
				"organiserId":organiserId,
				"regStartDate":regStartDate,
				"regEndDate":regEndDate,
				"tournamentStartDate":tournamentStartDate,
				"tournamentEndDate":tournamentEndDate,
				"category":category
				};
console.log(JSON.stringify(crtjson));
formData.append('otherFields', JSON.stringify(crtjson));

	$scope.buildTournamentCat(formData);
	
}
$scope.buildTournamentCat = function (formData) {
	var button = $('.saveDetail');
	 $(button).attr('disabled', 'disabled');
	var tournamentBuilUrl = url+"buildTournament";
	$.ajax({
		async : false,
        url: tournamentBuilUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
            if(data == "Tournament created successfully."){
            	$scope.messageWithSucces("Tournament created successfully...");
       	     window.location.href = "tournamentList";
            }else{
            	$scope.messageWithError(data);
            }
        }
    });    
}	
$scope.validateChangePassword = function () {	
	var oldpwd = $scope.oldPassword;
	var newpwd = $scope.newPassword;
	var retypepwd = $scope.repeatPassword;
	var existPassword = $("#existPassword").val();
	var changedPlayerId = $("#changedPlayerId").val();
	
	if(oldpwd == ""){
		$scope.changePwdValidate = "Current Password Field should Not Be Empty...";
		return false;
	}
	if(existPassword != oldpwd){
		$scope.changePwdValidate = "Current Password is Wrong...";
		return false;
	}
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
		var formData = new FormData();
		formData.append('oldpwd', oldpwd);
		formData.append('newpwd', newpwd);
		formData.append('retypepwd', retypepwd);
		
		$scope.editPassword(formData);
}
$scope.editPassword = function (formData){
	var changepwdUrl = url+"changeOrganisePassword";
	$.ajax({
		async : false,
        url: changepwdUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
         if(data == "Password updated successfully"){
        	 $scope.successmsg = "Password updated successfully...";
       		 $("#success-alert").fadeIn(1000);
       	  	 setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
       	   window.location.href = "login";
         }else{
        	 $scope.errormsg = data;
     		 $("#danger-alert").fadeIn(1000);
     	  	 setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
         }
        }
    });
}	
$scope.addPlayerByOrganizer = function(){
	var playerName = $scope.playerName; 
	var playerPhone = $scope.playerPhone;
	var playerEmail = $scope.playerEmail;
	var playerAddress = $scope.playerAddress;
	var dateOfBirth = $("#dateOfBirth").val();
	var playerItaId = $("#playerItaId").val();
	var playerItaRank = $("#playerItaRank").val();
	var playerGender = $("input[name='playerGender']:checked").val();
	
	if(playerName == "" || playerName == undefined){
		$scope.registerPlayerValidate = "Name should not be empty...";
		return false;
	}
	if(!validateNumber(playerPhone)){
		$scope.registerPlayerValidate = "Invalid Phone...";
		return false;
	}
	if(playerEmail == "" || playerEmail == undefined){
		$scope.registerPlayerValidate = "Email should not be empty...";
		return false;
	}
	if(playerAddress == "" || playerAddress == undefined){
		$scope.registerPlayerValidate = "Address should not be empty...";
		return false;
	}
	if((playerItaRank == "" || isNaN(playerItaRank)) && !(playerItaId == "" || isNaN(playerItaId))){
		//showAlertSec("AITA rank should not be empty");
		$scope.registerPlayerValidate = "AITA rank should not be empty...";
		return false;
	}
	if((playerItaId == "" || isNaN(playerItaId)) && !(playerItaRank == "" || isNaN(playerItaRank))){
		$scope.registerPlayerValidate = "AITA Id should not be empty...";
		return false;
	}
	if((playerItaRank == "" || isNaN(playerItaRank)) && (playerItaId == "" || isNaN(playerItaId))){
		playerItaRank = 11111111;
		playerItaId = 11111111;
	}
	var formData = new FormData();
	 formData.append('playerName',playerName);
	 formData.append('playerPhone',playerPhone);
	 formData.append('playerEmail',playerEmail);
	 formData.append('playerAddress',playerAddress);
	 formData.append('dateOfBirth',dateOfBirth);
	 formData.append('playerItaId',playerItaId);
	 formData.append('playerItaRank',playerItaRank);
	 formData.append('playerGender',playerGender);
	
	var addPlayerByOrganizer = url+"addPlayerByOrganizer";
	$.ajax({
		async : false,
        url: addPlayerByOrganizer,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	if(data == "Player Registered Successfully"){
        		$scope.successmsg = "Player Registered Successfully...";
        		$("#success-alert").fadeIn(1000);
          	    setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
        	}else{
        		$scope.registerPlayerValidate = data+"...";
            }
        }
    });   
}
$scope.bulkUpload = function(){
	var formData = new FormData();
	formData.append('bulkUploadFile', $( '#bulkUploadFile' )[0].files[0]);
	var bulkUrl = url+"uploadBulkData";
	$.ajax({
        url: bulkUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	showAlertSec(data);
        	$('#bulkUploadFile').val('')
        }
    });  
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
$scope.$watch('myFile', function(newFileObj){
       if(newFileObj)
           $scope.filename = newFileObj.name; 
   });
});
app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
/*$scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
	$(".tournamentDate").datepicker({ 
            autoclose: true, 
            todayHighlight: true
        }).datepicker('update', new Date());
   
	$('.timePicker').datetimepicker({
			format: 'HH:mm'
	   });
});
});

app.directive('onFinishRender', function ($timeout) {
	return {
		restrict: 'A',
		link: function (scope, element, attr) {
			if (scope.$last === true) {
				$timeout(function () {
					scope.$emit('ngRepeatFinished');
				});
			}
		}
	}
*/