var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	$("#success-alert").hide();
	$("#danger-alert").hide();
	$("#info-alert").hide();
	
	
	$scope.show = 1;
	
	
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
	
	$scope.init = function(){
		$scope.afterLoginTournament();
		$scope.getProfileData();
	}
	$scope.afterLoginTournament = function(){
		var mainCategoryList = url+"playerView/singleTournamentWithCategories?tournamentId="+$("#tournamentid").val();
		$http({
			method : "GET",
			url : mainCategoryList
		  }).then(function mySuccess(response) {
		    var list = response.data;
		    console.log(JSON.stringify(list));
		    $scope.tournamentCat = list;
			$scope.tournamentId = list.tournamentId;
			$scope.tournamentStartDate = list.tournamentStartDate;
			$scope.regEndDate = list.regEndDate;
			$scope.regStartDate = list.regStartDate;
			$scope.enableButtonDetails(list.tournamentId,list.regStartDate,list.regEndDate);
		  }, function myError(response) {
			//alert(response);
		});
		
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
	
	$scope.showFeature = function(id) {
		if(id==101){
			$scope.descToggle();
			$scope.show = 1;
		}else{
			 $scope.show = id;
		}
	}
	$scope.descToggle = function() {
		$scope.afterLoginTournament();
    };
	$scope.viewPlayersTournament = function(playerList,tournamentStart,tournamentId,categoryId,title,catName){
		$scope.tournametTtl = title;
		$scope.catTtle = catName;
		$scope.tournamentStartForSchedule = tournamentStart;
		$scope.tournamentIdForSchedule = tournamentId;
		$scope.categoryIdForSchedule = categoryId;
		
		var playerId = $("#popupmsg").val();
		if(playerId < 0 || playerId == "" || playerId == undefined){
			window.location.href = "playerhome";
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
		    $scope.isPlayerListPublish(tournamentId,categoryId);
		    $scope.getDraws();
			$scope.getSchedule();
		    $scope.showFeature(2);
		}
	}
$scope.isPlayerListPublish = function(tournamentId,categoryId){
	
	var isPublishUrl = url+"playerView/isPlayerListPublish?tournamentId="+tournamentId+"&categoryId="+categoryId;
	
	$http({
    	method : "GET",
    	url : isPublishUrl
      }).then(function mySuccess(response) {
    	  console.log("Shiva Sir::::::"+JSON.stringify(response.data));
    	  $scope.playersPublish = response.data.playersPublish;
      }, function myError(response) {
    	//alert(response);
      });
}
	$scope.getDraws = function(){
		var buildDrawsUrl = url+"playerView/buildCategoryDrwas?tournamentId="+$scope.tournamentIdForSchedule+"&categoryId="+$scope.categoryIdForSchedule+"&tournamentStart="+$scope.tournamentStartForSchedule;
	    $http({
	    	method : "GET",
	    	url : buildDrawsUrl
	      }).then(function mySuccess(response) {
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
	$scope.ViewTournamentLavelSchedule = function(tournamentId,title){
		
		$scope.titleName = title;
		$scope.getDayAndMatchList(tournamentId);
		var playerId = $("#popupmsg").val();
		if(playerId < 0 || playerId == "" || playerId == undefined){
			window.location.href = "playerhome";
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
				  $scope.messageWithinfo("Schedule not yet created...  ");
			  }
		  }, function myError(response) {
		  });
		}else
			$scope.messageWithinfo("Schedule not yet created...  ");
		}
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
	$( "#dateOfBirth" ).datepicker({
		  dateFormat : 'yy-mm-dd',
	     changeMonth: true,
	     changeYear: true,
	     yearRange: '-100y:c+nn',
	     maxDate: '-1d'
	   });
	$scope.registerPlayerForTournament = function(tournamentId,categoryId,tournamentFee,matchType,player,gender,age){
		$scope.tournamentIdForReg = tournamentId;
		$scope.categoryIdForReg = categoryId;
		$scope.tournamentFeeForReg = tournamentFee;
		$scope.matchTypeReg = matchType;
		if(!$scope.enableButton.matchStarted){
		var playerId = $("#popupmsg").val();
		if(playerId < 0 || playerId == "" || playerId == undefined){
			window.location.href = "playerhome";
		}else if(!(gender == true && age == true)){
			$scope.messageWithError("You are not eligible for this tournament...");
		}
		else{
			if(player < 0){
				if(matchType == 1)
			      $("#modalContactForm").modal("show");
				else{
					var tournamentUrl = url+"playerView/getPlayerList?tournamentId="+tournamentId+"&categoryId="+categoryId;
					$http({
						method : "GET",
						url : tournamentUrl
					  }).then(function mySuccess(response) {
						  $scope.otherPlayers = response.data;
					  }, function myError(response) {
						//alert(response);
					  });
					$scope.getRankCategories();
					 $("#modalDoublesRegForm").modal("show");
				}
				 
		  }else{
			  $scope.messageWithinfo("You've already resistered...");
		  }
		  }
		}else{
			$scope.messageWithinfo("Sorry registration closed for this tournament...");
		}
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
	
	$scope.registerPlayerForTournamentCategory = function(){
		var formData = new FormData();
		formData.append('cardHolderName', $scope.cardHolderName);
		formData.append('cardNumber', $scope.cardNumber);
		formData.append('cardType', $scope.cardType);
		formData.append('amount', $("#amount").val());
		formData.append('playerIdForReg', $("#playerIdForReg").val());
		formData.append('tournamentIdForReg',$("#tournamentIdForReg").val());
		formData.append('categoryIdForReg', $("#categoryIdForReg").val());
		formData.append('matchTypeReg', 1);
		formData.append('secondPlayer',-1);
		
		var paymentUrl = url+"registerPlayerForTournamentCategoryFromJs";
		$.ajax({
	        url: paymentUrl,
	        data: formData,
	        contentType: false,
	        processData: false,
	        type: 'POST',
	        success: function(data){
	        	$scope.afterLoginTournament();
	         if(data == "Payment Received Successfully"){
	        	 $("#modalContactForm").modal("hide");
	        	 $scope.messageWithSucces(data);
	         }else{
	        	 $scope.messageWithError(data);
	         }
	        }
	    });
		
	}
	
	//Player Registration
	$scope.validatePlayerRegistration = function () {
	    var name =  $scope.name; 
		var phone =  parseInt($scope.phone); 
		var email =  $scope.email; 
		var address =  $scope.address; 
		var dateOfBirth =  $("#dateOfBirth").val();
		var rankid = $scope.rankItem.rankId;
		var itaRank = parseInt($("#itaRank").val()); 
		var itaId = parseInt($("#itaId").val()); 
		//var gender = $("input[name='gender']:checked").val();
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
			//"gender":parseInt(gender),
			"points":5,
			"rank":rankid
			 }
			$scope.addSecondPlayerRegistration(input);
	  }
	// Player registration
	$scope.addSecondPlayerRegistration = function (input) {
		var addPlayerUrl = url+"playerView/addSecondPlayer";
		$.ajax({
			 async:false,
		      type: "POST",
		      contentType : 'application/json; charset=utf-8',
		      url:addPlayerUrl,
		      data: JSON.stringify(input), 
	           success: function(data){
	        	   if(data > 0){
	        		   $scope.secondPlayer = data;
	        		   $("#modalDoublesRegForm").modal("hide");
	   				   $("#modalSecondPayment").modal("show");
	        	   }
	        	   else if(data == -1)
	        		   $scope.registerPlyrValidate = "Player already registered";
	        	   else
	        		   $scope.registerPlyrValidate = "Something went wrong";
	        		   
	        }
	    });
		
/*		var addPlayerUrl = url+"playerView/addSecondPlayer", data = JSON.stringify(input),config='application/json; charset=utf-8';

		$http.post(addPlayerUrl, data, config).then(function (response) {
			$scope.secondPlayer = response.data;
			$("#modalDoublesRegForm").modal("hide");
			$("#modalSecondPayment").modal("show");
		}, function (response) {
			$("#modalDoublesRegForm").modal("hide");
		});*/
	}
	
	$scope.selectSecondPlayer = function () {
		$scope.secondPlayer = $( "#secondPlayer option:selected" ).val();
		$("#modalDoublesRegForm").modal("hide");
		$("#modalSecondPayment").modal("show");
	}
	$scope.registerDoublesPlayerForTournamentCategory = function(){
		var formData = new FormData();
		formData.append('cardHolderName', $scope.cardSecondHolderName);
		formData.append('cardNumber', $scope.cardSecondNumber);
		formData.append('cardType', $scope.cardSecondType);
		formData.append('amount', $("#Secondamount").val());
		formData.append('playerIdForReg', $("#SecondplayerIdForReg").val());
		formData.append('tournamentIdForReg',$("#SecondtournamentIdForReg").val());
		formData.append('categoryIdForReg', $("#SecondcategoryIdForReg").val());
		formData.append('matchTypeReg', 2);
		formData.append('secondPlayer',$scope.secondPlayer);
		
		var paymentUrl = url+"registerPlayerForTournamentCategoryFromJs";
		$.ajax({
	        url: paymentUrl,
	        data: formData,
	        contentType: false,
	        processData: false,
	        type: 'POST',
	        success: function(data){
	        	$scope.afterLoginTournament();
	         if(data == "Payment Received Successfully"){
	        	 $("#modalSecondPayment").modal("hide");
	        	 $scope.messageWithSucces(data);
	         }else{
	        	 $scope.messageWithError(data);
	         }
	        }
	    });
		
	}
	
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