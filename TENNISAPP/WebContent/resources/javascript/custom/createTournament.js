var app = angular.module('myApp', ['ui.sortable']);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	$("#main").show();
	
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	$scope.tournmentRegEndDate;
	
	$scope.show = 0;
	$("#success-alert").hide();
	$("#danger-alert").hide();
	$("#info-alert").hide();
	
	$scope.init = function() {
		$scope.getAllCategories();
		$scope.getRankCategories();
		$scope.getProfile();
		
    };
	
	$scope.organizerName = $("#hiddenorganizername").val();
	$scope.organizerEmail = $("#hiddenorganizermail").val();
	$scope.organizerMobile = $("#hiddenorganizerphone").val();
	$scope.organizerAltMobile = $("#hiddenorganizerphone").val();
	
	$( "#dateOfBirth" ).datepicker({
		dateFormat : 'yy-mm-dd',
		changeMonth: true,
		changeYear: true,
		yearRange: '-100y:c+nn',
	    maxDate: '-1d'
	});
	$(".tournamentDate").datepicker({ 
        autoclose: true, 
        todayHighlight: true
  }).datepicker('update', new Date());
	
$('.selectpicker').selectpicker();	
$scope.getAllCategories = function(){
	var tournamentCatUrl = url+"getTournamentCategories";
	 $http({
		 method : "GET",
		 url : tournamentCatUrl
	   }).then(function mySuccess(response) {
		   $scope.categoryDetails = response.data;
		   	var options="";
		   $.each(response.data, function (index, value) {
	    	 options=options+"<option  value=\""+value.category_id+"\">"+value.category_name+"</option>";
	        });
	       $("#listdata").html(options);
	      $(".selectpicker").selectpicker('refresh');
	   }, function myError(response) {
	   });
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
$scope.getProfile = function(){
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
       	   window.location.href = "organiserlogin";
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
	var rankid = $scope.rankItem.rankId;
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
	if(rankid == undefined || isNaN(rankid) || rankid == ""){
		$scope.registerPlayerValidate = "Please select ranking from list...";
		return false;
	}
	/*if((playerItaRank == "" || isNaN(playerItaRank)) && !(playerItaId == "" || isNaN(playerItaId))){
		$scope.registerPlayerValidate = "AITA rank should not be empty...";
		return false;
	}
	if((playerItaId == "" || isNaN(playerItaId)) && !(playerItaRank == "" || isNaN(playerItaRank))){
		$scope.registerPlayerValidate = "AITA Id should not be empty...";
		return false;
	}*/
	if(((playerItaRank == "" || isNaN(playerItaRank)) || (playerItaId == "" || isNaN(playerItaId))) && rankid !=1){
		$scope.registerPlayerValidate = "Id & Rank should not be empty..";
		return false;
	}
	if((playerItaRank == "" || isNaN(playerItaRank)) && (playerItaId == "" || isNaN(playerItaId)) && rankid ==1){
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
	 formData.append('rankid',rankid);
	
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
// By default sport is tennis
$scope.sportType = "Tennis";

$scope.getselectval = function(){
	$scope.academyDetails = $scope.selitem;
}



// Select Academy from drop down
$scope.selectAcademy = function(){
	var venueId = $scope.selitem.venueId;
	$scope.showFeature(1);
}
$scope.showFeature = function(id) {
	   $scope.show = id;
}
$scope.validateAddVenue = function(){
    var venueName =  $scope.venueName; 
	var venueAddress =  $scope.venueAddress; 
	var noOfCourts = $scope.noOfCourts;
	var mobile =  $scope.mobile; 
	var email =  $scope.email;
	var sportType =  $scope.sportType;
	var light = $("input[name='light']:checked").val();
	if(venueName == "" || venueName == undefined){
		$scope.errormsg = "Name should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(venueAddress == "" || venueAddress == undefined){
		$scope.errormsg = "Address should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(noOfCourts <= 0   || noOfCourts == undefined){
		$scope.errormsg = "No of Court should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(mobile <= 0  || mobile == undefined){
		$scope.errormsg = "Mobile should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(email == ""  || email == undefined){
		$scope.errormsg = "Email should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	if(sportType == ""  || sportType == undefined){
		$scope.errormsg = "Sport Type should not be empty...";
		$("#danger-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		return false;
	}
	var formData = new FormData();
	formData.append('venueName', venueName);
	formData.append('venueAddress', venueAddress);
	formData.append('noOfCourts', noOfCourts);
	formData.append('mobile', mobile);
	formData.append('email', email);
	formData.append('sportType', sportType);
	formData.append('light',light);
	
	$scope.persistAcademy(formData);
}
$scope.persistAcademy = function (formData) {
	var tournamentBuilUrl = url+"persistAcademyByOrganiser";
	$.ajax({
		async : false,
        url: tournamentBuilUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	if(data != "Failed"){
        		var temp = JSON.parse(data);
        		$scope.selitem = temp;
        		$scope.academyDetails = temp;
                $scope.venueDetails.push(temp);
                $scope.showFeature(1);
        	}else{
        		$scope.messageWithError("Already mobile num registered please select from existing academy...");
        	}
            
        }
    });    
}	
$scope.validateTournament = function(){
	var tournamentName = $scope.tournamentName;
	var organizerName = $scope.organizerName;
	var organizerEmail = $scope.organizerEmail;
	var contactNo = $scope.organizerMobile;
	var altcontactNo = $scope.organizerAltMobile;
	var referee = $scope.referee;
	var organiserId = parseInt($("#organizerId").val());
	var regStartDate = $("#regStartDate").val();
	var regEndDate = $("#regEndDate").val();
	var tournamentStartDate = $("#tournamentStartDate").val();
	var tournamentEndDate = $("#tournamentEndDate").val();
	
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
	 if(new Date(regEndDate) >= new Date(tournamentStartDate)){
		
		 $scope.messageWithError("Tournament Start date should be greater than Registration End date...");
			return false;
		}
	 
	 if(new Date(tournamentStartDate) > new Date(tournamentEndDate)){
		 $scope.messageWithError("Tournament End date should be greater than  or equal to Start date...");
			return false;
		}
	 $scope.showFeature(2);
	 $scope.getselectcategory();
}
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
			$scope.messageWithError("Please select atleast one category...");
	$scope.buildCourt = inputjson;
	}

// Finally creating creating tornament
$scope.postTournament = function(){
	$("#wait").css("display", "block");
	var tournamentName = $scope.tournamentName;
	var organizerName = $scope.organizerName;
	var organizerEmail = $scope.organizerEmail;
	var contactNo = $scope.organizerMobile;
	var altcontactNo = $scope.organizerAltMobile;
	var referee = $scope.referee;
	var venueId = $scope.selitem.venueId;
	var organiserId = parseInt($("#organizerId").val());
	
	//Manual regStartDate and regEndDate
	/*var regStartDate = $("#regStartDate").val();
	var regEndDate = $("#regEndDate").val();*/
	
	//Automatica : regStartDate taking as tournment created date [current date]

	//crurrentdate creation as regStartDate
	var today = new Date();
	var dd = today.getDate();
    var mm = today.getMonth()+1; 
    var yyyy = today.getFullYear();
    if(dd<10) 
     {  dd='0'+dd;   } 
     if(mm<10) {   mm='0'+mm;}

	var regStartDate = yyyy+'-'+mm+'-'+dd;
	var tournamentStartDate = $("#tournamentStartDate").val();
	
	//regEndDate creation
	const regEndDateTemp = new Date(tournamentStartDate);
	regEndDateTemp.setDate(regEndDateTemp.getDate() - 1);
	var dd_re = regEndDateTemp.getDate();
    var mm_re = regEndDateTemp.getMonth()+1; 
    var yyyy_re = regEndDateTemp.getFullYear();
     if(dd_re<10) 
     {  dd_re='0'+dd_re;   } 
     if(mm_re<10) {   mm_re='0'+mm_re;}

	var regEndDate = yyyy_re+'-'+mm_re+'-'+dd_re;
	var tournamentEndDate = $("#tournamentEndDate").val();

	var formData = new FormData();
	 formData.append('bannerImage', $( '#bannerImage' )[0].files[0]);
	
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
formData.append('otherFields', JSON.stringify(crtjson));

	$scope.buildTournamentCat(formData);
	
}
$scope.buildTournamentCat = function (formData) {
	var tournamentBuilUrl = url+"buildTournament";
	$.ajax({
		async : false,
        url: tournamentBuilUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	$("#wait").css("display", "none");
            if(data > 0){
            	$scope.tournamentId = data;
            	//$scope.getAllRegisteredCategory(data);
            	$scope.messageWithSucces("Tournament created successfully...");
            	//$scope.showFeature(3);
            	
            	sessionStorage.setItem("showFlag",true);
            	window.location.href = "tournamentList";
            }else{
            	$("#wait").css("display", "none");
            	$scope.messageWithError("Something went wrong");
            }
        }
    });    
}	
$scope.getAllRegisteredCategory = function(tournamentId){
	$scope.tournamentId = tournamentId;
	var mainCategoryList = url+"allCategoryListForATournament?tournamentId="+tournamentId;
	$http({
		method : "GET",
		url : mainCategoryList
	  }).then(function mySuccess(response) {
		  //console.log(JSON.stringify(response.data));
		  
	    $scope.tournamentCat = response.data;
	  }, function myError(response) {
		//alert(response);
	});
	
}
$scope.getselectedCategoryData = function(){
	$scope.categoryId = $scope.selectedCat.categoryId;
	$scope.matchTypeReg = $scope.selectedCat.matchType;
	$scope.entryFeeForReg = $scope.selectedCat.tournamentFee;
	$scope.getRagisteredPlayers();
	
	
	$scope.showchild = 101;
	
	//console.log(JSON.stringify($scope.selectedCat));
}
//Getting tournamentRegistered players
$scope.getRagisteredPlayers = function(){
   var scheduleUrl = url+"getRagisteredPlayers?tournamentId="+$scope.tournamentId+"&categoryId="+$scope.categoryId;
   $http({
	method : "GET",
	url : scheduleUrl
  }).then(function mySuccess(response) {
	$scope.playerListForAcategory = response.data;
  }, function myError(response) {
  });
} 
$scope.addExistingPlayer = function(){
	$scope.doublePlayersValidate = null;
	var existingPlayerUrl = url+"getExistingPlayerList?tournamentId="+$scope.tournamentId+"&categoryId="+$scope.categoryId;
	$http({
		method : "GET",
		url : existingPlayerUrl
	  }).then(function mySuccess(response) {
		  $scope.existingPlayers = response.data;
	  }, function myError(response) {
	  });
	$("#addPlayerFromlist").modal("show");
}
$scope.addToTournament = function(removePlayerObj,index){
	
	$scope.playerListForAcategory.push(removePlayerObj);	
	for(var i=0;i<$scope.existingPlayers.length;i++){
		if($scope.existingPlayers[i].playerId == removePlayerObj.playerId){
			$scope.existingPlayers.splice(i,1);
			//$scope.$watch(existingPlayers);
			var formData = new FormData();
			 formData.append('playerId', removePlayerObj.playerId);//playerid
			 formData.append('tournamentId', $scope.tournamentId);
			 formData.append('categoryId', $scope.categoryId);
			 formData.append('entryFee', $scope.entryFeeForReg);
			 formData.append('itaRank', removePlayerObj.itaRank);
			var registerExistingPlayerUrl = url+"registerExistingPlayerUrl";
			$.ajax({
		        url: registerExistingPlayerUrl,
		        data: formData,
		        contentType: false,
		        processData: false,
		        type: 'POST',
		        success: function(data){
		        	$scope.getRagisteredPlayers();
		            }
		    });
		}
	}
}
$scope.bulkUploadAndRegisterForSingle = function(){
	var formData = new FormData();
	formData.append('bulkUploadFile', $( '#bulkUploadFileForSingle' )[0].files[0]);
	formData.append('tournamentId', $scope.tournamentId);
	formData.append('categoryId', $scope.categoryId);
	formData.append('matchType', $scope.matchTypeReg);
	formData.append('entryFee', $scope.entryFeeForReg);
	
	var bulkUrl = url+"uploadBulkAndRegisterForSingleMatch";
	$.ajax({
		async : false,
        url: bulkUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	if(data == "Success"){
        		$("#bulkUploadPopupForSingle").modal("hide");
        		$scope.messageWithSucces("Uploaded Successfully...");
        		$scope.getRagisteredPlayers();
        	}
        	else{
        		$scope.uploadSingleMatchPlayers = data;
        	}
        	$('#bulkUploadFileForSingle').val('');
        }
    });  
}
$scope.deleteFromTournament = function(playerId,paymentId,playername){
	
	$scope.showConfirm(playerId,paymentId,playername)
}
$scope.showConfirm = function(playerId,paymentId,playername){
	$("#confirmationpopup").modal("show");
	$( ".confirmmsg" ).text("Are you sure you want to remove player '"+playername+"'");
	$scope.mplayerId = playerId;
	$scope.mpaymentId = paymentId;
}
$scope.deletePlayer = function(){
	$("#confirmationpopup").modal("hide");
	var formData = new FormData();
	 formData.append('playerId',$scope.mplayerId);
	 formData.append('paymentId',$scope.mpaymentId);
	 formData.append('tournamentId',$scope.tournamentId);
	 formData.append('categoryId',$scope.categoryId);
	 
 var removePlayerFromTournament = url+"removePlayerFromTournament";
	$.ajax({
       url: removePlayerFromTournament,
       data: formData,
       contentType: false,
       processData: false,
       type: 'POST',
       success: function(data){
       	$scope.getRagisteredPlayers();
       	//showAlertSec(data);
       	$scope.successmsg = data+"...";
		$("#success-alert").fadeIn(1000);
  	    setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
       }
   });
	
}

















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
