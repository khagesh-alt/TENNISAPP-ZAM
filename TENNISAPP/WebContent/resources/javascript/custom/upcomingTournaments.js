var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	$("#success-alert").hide();
	$("#danger-alert").hide();
	$("#info-alert").hide();
	
	var msg = $("#message").val();
	if(msg != ""){
		//showAlertSec(msg);
		$scope.successmsg = msg;
	    $("#success-alert").fadeIn(1000);
		setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
	}
	 $('#message').val("");
	 
	 $( "#dateOfBirth" ).datepicker({
		  dateFormat : 'yy-mm-dd',
	      changeMonth: true,
	      changeYear: true,
	      yearRange: '-100y:c+nn',
         maxDate: '-1d'
	    });
	 
$scope.show = 0;
$scope.showFeature = function(id) {
	if(id==101){
		$scope.descToggle();
		$scope.show = 1;
	}else{
		 $scope.show = id;
	}
}	 

	$scope.myVar = false;
	
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	
	 $scope.init = function() {
		 $scope.upcomingtournament();
		 $scope.getRankCategories();
		 $scope.getProfileData();
    };
    $scope.getRankCategories = function(){
    	var rankListUrl = url+"playerView/getAllRankCategories";
    	$http({
    		method : "GET",
    		url : rankListUrl
    	  }).then(function mySuccess(response) {
    		  console.log(JSON.stringify(response.data));
    		  $scope.rankList = response.data;
    		  $scope.rankItem = $scope.rankList[0];
    	  }, function myError(response) {
    	  });
    	}
$scope.upcomingtournament = function(){
	var tournamentUrl = url+"playerView/getUpcommingTournament";
	$http({
		method : "GET",
		url : tournamentUrl
	  }).then(function mySuccess(response) {
		  //console.log(JSON.stringify(response.data));
		  $scope.tournamentCategoryDetails = response.data;
	  }, function myError(response) {
	  });
}
		$scope.singleTournamentWithCategories = function(){
			var mainCategoryList = url+"playerView/singleTournamentWithCategories?tournamentId="+$scope.tournamentId;
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
		
	$scope.openTournament = function(list){
		$scope.tournamentCat = list;
		$scope.tournamentId = list.tournamentId;
		$scope.tournamentStartDate = list.tournamentStartDate;
		$scope.regEndDate = list.regEndDate;
		$scope.regStartDate = list.regStartDate;
		$scope.enableButtonDetails(list.tournamentId,list.regStartDate,list.regEndDate);
		$scope.showFeature(1);
	}
	$scope.enableButtonDetails = function(tournamentId,regStartDate,regEndDate){
		var isDrwasCreated = url+"playerView/isPlayerviewDrwasCreated?tournamentId="+tournamentId+"&regEndDate="+regEndDate+"&regStartDate="+regStartDate;
		$http({
			method : "GET",
			url : isDrwasCreated
		  }).then(function mySuccess(response) {
		   $scope.enableButton = response.data;
		   //console.log(JSON.stringify(response.data));
		  }, function myError(response) {
			//alert(response);
		});
	}
	$scope.getDayAndMatchList = function(tournamentId){
		 var daysAndMatchUrl = url+"playerView/getDaysAndNoOfMatchs?tournamentId="+tournamentId;
			$http({
			   method : "GET",
			   url : daysAndMatchUrl
			  }).then(function mySuccess(response) {
			   $scope.daysAndMatch = response.data;
			  }, function myError(response) {
				  
			 });
	}

	$scope.ViewTournamentLavelSchedule = function(tournamentId,title){
		$scope.titleName = title;
		$scope.getDayAndMatchList(tournamentId);
		var playerId = $("#popupmsg").val();
		if(playerId < 0 || playerId == "" || playerId == undefined){
			$("#centralModalLg").modal("show");
			$scope.tournamentTabs = false;
		}else{
		$scope.enableButtonDetails($scope.tournamentId,$scope.regStartDate,$scope.regEndDate);
		if($scope.enableButton.scheduleCreated){
		var ViewTournamentLavelSchedule = url+"playerView/ViewTournamentLavelSchedule?tournamentId="+tournamentId;
		$http({
			method : "GET",
			url : ViewTournamentLavelSchedule
		  }).then(function mySuccess(response) {
			  if(response.data.conditionVal != true){
				  $("#scheduleTournamentLavel").modal("show");
				  $scope.tournamentLvlSch = response.data.scheduleList;
			  }else{
				  //showAlertSec("Schedule not yet created.");
				  $scope.messageWithinfo("Schedule not yet created...  ");
			  }
		  }, function myError(response) {
		  });
		}else
			//showAlertSec("Schedule not yet created.");
			$scope.messageWithinfo("Schedule not yet created...  ");
		}
	}
    $scope.tournamentToggle = function() {
    	$scope.upcomingtournament();
        $scope.descTournaments = false;
        $scope.tournamentTabs = false;
		$scope.listedTournaments = true;
    };	
	$scope.registerPlayerForTournament = function(tournamentId,categoryId,tournamentFee,matchType,player,gender,age){
		$scope.tournamentIdForReg = tournamentId;
		$scope.categoryIdForReg = categoryId;
		$scope.tournamentFeeForReg = tournamentFee;
		$scope.matchTypeReg = matchType;
		if(!$scope.enableButton.matchStarted){
		var playerId = $("#popupmsg").val();
		if(playerId < 0 || playerId == "" || playerId == undefined){
			$("#centralModalLg").modal("show");
			$scope.tournamentTabs = false;
		}else if(!(gender == true && age == true)){
			//showAlertSec("You are not eligible for this tournament!.");
			$scope.messageWithError("You are not eligible for this tournament...");
		}
		else{
			if(player < 0){
			var tournamentUrl = url+"playerView/getPlayerList?tournamentId="+tournamentId+"&categoryId="+categoryId;
			$http({
				method : "GET",
				url : tournamentUrl
			  }).then(function mySuccess(response) {
				  $scope.otherPlayers = response.data;
				  console.log(JSON.stringify(response.data));
			  }, function myError(response) {
				//alert(response);
			  });
			$("#modalContactForm").modal("show");
			$scope.tournamentTabs = false;
		  }else{
			  //showAlertSec("You've already resistered!.");
			  $scope.messageWithinfo("You've already resistered...");
		  }
		  }
		}else{
			//showAlertSec("Tournament already started now you can't participate!.");
			$scope.messageWithinfo("Sorry registration closed for this tournament...");
		}
	}
	$scope.getDraws = function(){
		var buildDrawsUrl = url+"playerView/buildCategoryDrwas?tournamentId="+$scope.tournamentIdForSchedule+"&categoryId="+$scope.categoryIdForSchedule+"&tournamentStart="+$scope.tournamentStartForSchedule;
	    $http({
	    	method : "GET",
	    	url : buildDrawsUrl
	      }).then(function mySuccess(response) {
	    	 // console.log(JSON.stringify(response.data));
	    	  $scope.rounds = response.data.drwasList;
	    	  $scope.compaireDate = response.data.matchStarted;
	    	  $scope.drawPublish = response.data.drawsPublish;
	      }, function myError(response) {
	    	//alert(response);
	      });
	  }
	  $scope.getSchedule = function(){
		  var scheduleUrl = url+"playerView/getScheduleList?tournamentId="+$scope.tournamentIdForSchedule+"&categoryId="+$scope.categoryIdForSchedule
			$http({
				method : "GET",
				url : scheduleUrl
			  }).then(function mySuccess(response) {
				  $scope.scheduledetails = response.data;
			  }, function myError(response) {
			  });
	  } 
	$scope.viewPlayersTournament = function(playerList,tournamentStart,tournamentId,categoryId,title,catName){
		$scope.tournametTtl = title;
		$scope.catTtle = catName;
		$scope.tournamentStartForSchedule = tournamentStart;
		$scope.tournamentIdForSchedule = tournamentId;
		$scope.categoryIdForSchedule = categoryId;
		
		var playerId = $("#popupmsg").val();
		if(playerId < 0 || playerId == "" || playerId == undefined){
			//$scope.tournamentTabs = false;
			$("#centralModalLg").modal("show");
		}else{
			$scope.playerListForAcategory = playerList;
			var buildDrawsUrl = url+"/playerView/buildCategoryDrwas?tournamentId="+tournamentId+"&categoryId="+categoryId+"&tournamentStart="+tournamentStart;
		    $http({
		    	method : "GET",
		    	url : buildDrawsUrl
		      }).then(function mySuccess(response) {
		    	 // alert(response.data.drwasList.length);
		    	  $scope.rounds = response.data.drwasList;
		    	  $scope.compaireDate = response.data.matchStarted;
		    	  $scope.drawPublish = response.data.drawsPublish;
		      }, function myError(response) {
		    	//alert(response);
		      });
		    
		    /*var scheduleUrl = url+"playerView/getScheduleList?tournamentId="+tournamentId+"&categoryId="+categoryId
			$http({
				method : "GET",
				url : scheduleUrl
			  }).then(function mySuccess(response) {

				  $scope.scheduledetails = response.data;
			  }, function myError(response) {
			  });*/
		    $scope.getDraws();
			$scope.getSchedule();
		    $scope.showFeature(2);
			//$scope.descTournaments = false;
			//$scope.listedTournaments = false;
			//$scope.tournamentTabs = true;
		}
	}
	$scope.descToggle = function() {
		$scope.singleTournamentWithCategories();
        /*$scope.listedTournaments = false;
        $scope.tournamentTabs = false;
        $scope.descTournaments = true;*/
    };	
	$scope.validatePlayerRegistration = function () {
	    var name =  $scope.name; 
		var phone =  $scope.phone; 
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
			$scope.registerPlyrValidate ="Name should not be empty...";
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
			$scope.registerPlyrValidate = "AITA rank should not be empty...";
			return false;
		}
		if((itaId == "" || isNaN(itaId)) && !(itaRank == "" || isNaN(itaRank))){
			$scope.registerPlyrValidate = "AITA Id should not be empty...";
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
		    	// console.log(JSON.stringify(data));
		    	 if(data.responseText == "Success"){
		    		 $scope.messageWithSucces("Player registered successfully");
		    		 $("#centralModalLg").modal("hide");
		    	 }
		    		 //showAlertSec("Player registered successfully");
				 else
					 $scope.registerPlyrValidate = data.responseText;
					// showAlert(data.responseText);
		    		 //location.reload();
		      },
		      error: function (data) {
		    	if(data.responseText == "Success"){
		    		$("#centralModalLg").modal("hide");
		    		$scope.messageWithSucces("Player registered successfully");
		    	}
				 else
					 $scope.registerPlyrValidate = data.responseText;
		    		 //location.reload();
		      }
		  });
	}
$scope.validatePlayerLogin = function(){
	var userId = $("#userId").val(); 
	var loginpassword = $("#loginpassword").val();
	if(userId == "" || userId == undefined || userId <= 0){
		$scope.loginPlayerValidate = "Mobile No. should Not Be Empty...";
		return false;
	}
	if(loginpassword == ""){
		$scope.loginPlayerValidate = "Password should Not Be Empty...";
		return false;
	}
	var formData = new FormData();
	formData.append('userId', userId);
	formData.append('loginpassword', loginpassword);
	
	var playerLoginUrl = url+"playerView/secPlayerLogin";
	$.ajax({
        url: playerLoginUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        async:false,
        success: function(data){
        	if(data == "Success"){
        		sessionStorage.setItem('tournamentflag', true);
        		sessionStorage.setItem('tournamentidsession', $scope.tournamentId);
        		showAlert("logged in successfully !");
        	}
        	else{
        		$scope.loginPlayerValidate = data;
        	}
        }
    });
}	
$scope.afterLoginTournament = function(tournamentid){
	var mainCategoryList = url+"playerView/singleTournamentWithCategories?tournamentId="+tournamentid;
	$http({
		method : "GET",
		url : mainCategoryList
	  }).then(function mySuccess(response) {
	    var list = response.data;
	    $scope.tournamentCat = list;
		$scope.tournamentId = list.tournamentId;
		$scope.tournamentStartDate = list.tournamentStartDate;
		$scope.regEndDate = list.regEndDate;
		$scope.regStartDate = list.regStartDate;
		$scope.enableButtonDetails(list.tournamentId,list.regStartDate,list.regEndDate);
		$scope.showFeature(1);
	  }, function myError(response) {
		//alert(response);
	});
	
}
if (typeof(Storage) !== "undefined") {
	var showFlag= sessionStorage.getItem("tournamentflag");
	if(showFlag){
		var tournamentid = sessionStorage.getItem("tournamentidsession");
		$scope.afterLoginTournament(tournamentid);
		sessionStorage.removeItem('tournamentflag');
		sessionStorage.removeItem('tournamentidsession');
	}
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
$scope.registerPlayerForTournamentCategory = function(){
	var formData = new FormData();
	formData.append('cardHolderName', $scope.cardHolderName);
	formData.append('cardNumber', $scope.cardNumber);
	formData.append('cardType', $scope.cardType);
	formData.append('amount', $("#amount").val());
	formData.append('playerIdForReg', $("#playerIdForReg").val());
	formData.append('tournamentIdForReg',$("#tournamentIdForReg").val());
	formData.append('categoryIdForReg', $("#categoryIdForReg").val());
	formData.append('matchTypeReg', $("#matchTypeReg").val());
	formData.append('secondPlayer',$( "#secondPlayer option:selected" ).val());
	
	var paymentUrl = url+"registerPlayerForTournamentCategoryFromJs";
	$.ajax({
        url: paymentUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	$scope.upcomingtournament();
        	$scope.singleTournamentWithCategories();
         if(data == "Payment Received Successfully"){
        	 $("#modalContactForm").modal("hide");
        	 $scope.messageWithSucces(data);
         }else{
        	 $scope.messageWithError(data);
         }
        }
    });
	
}
// profile
$scope.getProfileData = function(){
	var profileUrl = url+"getProfile";
	$http({
		method : "GET",
		url : profileUrl
	  }).then(function mySuccess(response) {
		  //console.log(JSON.stringify(response.data));
		  $scope.profileData = response.data;
	  }, function myError(response) {
		//alert(response);
	  });
}

$scope.checkByMatch = function(prop){
    return function(item){
      return item[prop] == false;
    }
}
$scope.sortKey = ['scheduleDate','scheduleDate'];
$scope.sort = function(propName1,propName2){
      $scope.sortKey = [propName1,propName2];
      $scope.reverse = !$scope.reverse;
  }
$scope.download = function(){
	var svgid = $scope.rounds.length;
	domtoimage.toBlob(document.getElementById("downloaddraw"+svgid))
    .then(function(blob) {
      window.saveAs(blob, $scope.tournametTtl+"("+$scope.catTtle+').png');
    });
}
$scope.downloadschedule = function(){
	domtoimage.toBlob(document.getElementById('scheduleListTable'))
    .then(function(blob) {
      window.saveAs(blob, $scope.titleName+'.png');
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
$scope.messageWithinfo = function(data){
	$scope.infomsg = data;
    $("#info-alert").fadeIn(1000);
	setTimeout(function(){ $("#info-alert").fadeOut(1000) }, 3000);
}






});
app.filter("firstWord", function() {
	return function(data) {
		if(!data) return data;
		data = data.split(' ');
		return data[0];
	};
})
app.filter('unique', function () {

    return function (items, filterOn) {

        if (filterOn === false) {
            return items;
        }

        if ((filterOn || angular.isUndefined(filterOn)) && angular.isArray(items)) {
            var hashCheck = {}, newItems = [];

            var extractValueToCompare = function (item) {
                if (angular.isObject(item) && angular.isString(filterOn)) {
                    return item[filterOn];
                } else {
                    return item;
                }
            };

            angular.forEach(items, function (item) {
                var valueToCheck, isDuplicate = false;

                for (var i = 0; i < newItems.length; i++) {
                    if (angular.equals(extractValueToCompare(newItems[i]), extractValueToCompare(item))) {
                        isDuplicate = true;
                        break;
                    }
                }
                if (!isDuplicate) {
                    newItems.push(item);
                }

            });
            items = newItems;
        }
        return items;
    };
});