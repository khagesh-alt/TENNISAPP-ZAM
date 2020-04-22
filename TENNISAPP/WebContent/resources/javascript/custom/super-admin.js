var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	$("#success-alert").hide();
	$("#danger-alert").hide();
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	
	    var venueurl = url+"playerView/getVenues";
		$http({
			method : "GET",
			url : venueurl
		  }).then(function mySuccess(response) {
			 // console.log(JSON.stringify(response.data));
			  $scope.venueDetails = response.data;
		  }, function myError(response) {
		  });
	$scope.getListOfVenues = function(){
		var venueurl = url+"playerView/getVenues";
		$http({
			method : "GET",
			url : venueurl
		  }).then(function mySuccess(response) {
			  //console.log(JSON.stringify(response.data));
			  $scope.venueDetails = response.data;
		  }, function myError(response) {
		  });
	}
	$scope.sportType = "Tennis";
	
	$scope.validateAddVenue = function () {
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
		var input = {
		"venue_name": venueName,
	    "venue_location": venueAddress,
	    "no_of_courts":noOfCourts,
		"contact_mob":mobile+"",
	    "contact_email":email,
	    "sport_type":sportType,
	    "venue_light":parseInt(light)
		 }
		 //console.log(JSON.stringify(input));
		$scope.addVenue(input,venueName);
  }
	$scope.addVenue = function (input,venueName) {
		var addVenueUrl = url+"playerView/addVenue";
	 $.ajax({
			async : false,
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : addVenueUrl,
			data : JSON.stringify(input),
			Success : function(data) {
				if (data.responseText == "Success") {
					$("#sideModalTR").modal("hide");
					$scope.successmsg = venueName+ " registered successfully...";
					$("#success-alert").fadeIn(1000);
					setTimeout(function() {
						$("#success-alert").fadeOut(1000)
					}, 3000);
					$scope.getListOfVenues();
				} else {
					$scope.errormsg = data.responseText;
					$("#danger-alert").fadeIn(1000);
					setTimeout(function() {
						$("#danger-alert").fadeOut(1000)
					}, 3000);
				}
			},
			error : function(data) {
				if (data.responseText == "Success") {
				$("#sideModalTR").modal("hide");
				$scope.successmsg = venueName+ " registered successfully...";
				$("#success-alert").fadeIn(1000);
				setTimeout(function() {
					$("#success-alert").fadeOut(1000)
				}, 3000);
				$scope.getListOfVenues();
			} else {
				$scope.errormsg = data.responseText;
				$("#danger-alert").fadeIn(1000);
				setTimeout(function() {
					$("#danger-alert").fadeOut(1000)
				}, 3000);
			}}
		});
	}	  
	// Add Organiser Part
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
						$("#sideModalTR").modal("hide");
						$scope.successmsg = orgName+" Credentials sent to registered mail ID...";
						$("#success-alert").fadeIn(1000);
						setTimeout(function() {
							$("#success-alert").fadeOut(1000)
						}, 3000);
						$scope.getOrganiserList();
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
					$("#sideModalTR").modal("hide");
					$scope.successmsg = orgName+" Credentials sent to registered mail ID...";
					$("#success-alert").fadeIn(1000);
					setTimeout(function() {
						$("#success-alert").fadeOut(1000)
					}, 3000);
					$scope.getOrganiserList();
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
  var organiserListurl = url+"playerView/getOrganiserList";
		$http({
			method : "GET",
			url : organiserListurl
		  }).then(function mySuccess(response) {
			 // console.log(JSON.stringify(response.data));
			  $scope.organiserDetails = response.data;
		  }, function myError(response) {
			//alert(response);
		  });
$scope.getOrganiserList = function(){
	var organiserListurl = url+"playerView/getOrganiserList";
	$http({
		method : "GET",
		url : organiserListurl
	  }).then(function mySuccess(response) {
		 // console.log(JSON.stringify(response.data));
		  $scope.organiserDetails = response.data;
	  }, function myError(response) {
		//alert(response);
	  });
}
$scope.editOrganiserDetails = function(list){
	//console.log(JSON.stringify(list));
	$scope.editOrganiser = list;
	$scope.editorgName = list.name;
	$scope.editOrgEmail = list.mailId;
	$scope.editOrgAddress = list.address;
	$scope.editOrgId = list.orgId;
	$("#editOrganiserModel").modal("show");
}
$scope.validateEditOrganiser = function () {
    var orgName =    $scope.editorgName;
	var orgEmail =   $scope.editOrgEmail;
	var orgAddress = $scope.editOrgAddress;
	var orgId =      $scope.editOrgId;
	
	if(orgName.trim() == ""){
		alert("Name should not be empty");
		return false;
	}
	if(orgEmail.trim() == ""){
		alert("Email should not be empty");
		return false;
	}
	if(orgAddress.trim() == ""){
		alert("Password should not be empty");
		return false;
	}
		var input = {
		"name": orgName,
		"address":orgAddress,
		"mailId":orgEmail,
		"orgId":orgId
		 }
		$scope.editOrganizerRegistration(input);
  }
$scope.editOrganizerRegistration = function (input) {
	  var orgediturl = url+"playerView/editOrganiserByID";
	$.ajax({
		  async:false,
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      url: orgediturl,
	      data: JSON.stringify(input), 
	      Success: function (data) {
	    	  $("#editOrganiserModel").modal("hide");
				$scope.successmsg = data.responseText;;
				$("#success-alert").fadeIn(1000);
				setTimeout(function() {
					$("#success-alert").fadeOut(1000)
				}, 3000);
				$scope.getOrganiserList();
	      },
	      error: function (data) {
	    	  $("#editOrganiserModel").modal("hide");
				$scope.successmsg = data.responseText;;
				$("#success-alert").fadeIn(1000);
				setTimeout(function() {
					$("#success-alert").fadeOut(1000)
				}, 3000);
				$scope.getOrganiserList();
	      }
	  });
}
// Edit Academy
$scope.editAcademyDetails = function(list){
	$scope.editAcademy = list;
	$scope.editVenueName = list.venueName;
	$scope.editContactMob = list.contactMob;
	$scope.editContactEmail = list.contactEmail;
	$scope.editVenueLocation = list.venueLocation;
	$scope.editVenueId = list.venueId;
	
	$scope.user = 'John Doe';
    $scope.email = 'john.doe@gmail.com';
	
	
	$("#editAcademyModel").modal("show");
}
$scope.validateEditAcademy = function () {
    var acdName =    $scope.editVenueName;
	var acdMobile =  $scope.editContactMob;
	var acdEmail =   $scope.editContactEmail;
	var acdAddress = $scope.editVenueLocation;
	var acdId =      $scope.editVenueId;
	
	if(acdName.trim() == ""){
		alert("Name should not be empty");
		return false;
	}
	if(acdMobile == ""){
		alert("Phone should not be empty");
		return false;
	}
	if(acdEmail.trim() == ""){
		alert("Email should not be empty");
		return false;
	}
	if(acdAddress.trim() == ""){
		alert("Password should not be empty");
		return false;
	}
	var input = {
			"venueId": acdId,
		    "venueName": acdName,
		    "venueLocation":acdAddress,
			"contactMob":acdMobile,
			"contactEmail":acdEmail
		    
			 }
		$scope.editAcademyRegistration(input);
  }
$scope.editAcademyRegistration = function (input) {
	  var acdediturl = url+"playerView/editAcademyByID";
	$.ajax({
		  async:false,
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      url: acdediturl,
	      data: JSON.stringify(input), 
	      Success: function (data) {
	    	 // showAlert(data.responseText);
	    	  $scope.successmsg = data.responseText;
	    	  $("#editAcademyModel").modal("hide");
	    	  $("#success-alert").fadeIn(1000);
	    	  setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
	    	  $scope.getListOfVenues();
	      },
	      error: function (data) {
	    	  //showAlert(data.responseText);
	    	  $scope.successmsg = data.responseText;
	    	  $("#editAcademyModel").modal("hide");
	    	  $("#success-alert").fadeIn(1000);
	    	  setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
	    	  $scope.getListOfVenues();
	      }
	  });
}
});