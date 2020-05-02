var app = angular.module('myApp', ['ui.sortable']);
app.controller('myCtrl', function($scope, $http) {
	$("#hideMainDiv").show();
	$("#main").show();
	$("#success-alert").hide();
	$("#danger-alert").hide();
	$("#info-alert").hide();
var msg = $("#popupmsg").val();
if(msg != ""){
		showAlert(msg);
}
$('#popupmsg').val("");
	 
$( "#dateOfBirth" ).datepicker({
	dateFormat : 'yy-mm-dd',
	changeMonth: true,
	changeYear: true,
	yearRange: '-100y:c+nn',
    maxDate: '-1d'
});
$( ".tournamentDate" ).datepicker({
	dateFormat : 'yy-mm-dd',
	autoclose: true, 
    todayHighlight: true
});

$("#updateTournamentStartDate").change(function(){
	 var tournamentStartDate= $("#updateTournamentStartDate").val();
	  const regEndDateTemp = new Date(tournamentStartDate);
		regEndDateTemp.setDate(regEndDateTemp.getDate() - 1);
		var dd_re = regEndDateTemp.getDate();
	    var mm_re = regEndDateTemp.getMonth()+1; 
	    var yyyy_re = regEndDateTemp.getFullYear();
	     if(dd_re<10) 
	     {  dd_re='0'+dd_re;   } 
	     if(mm_re<10) {   mm_re='0'+mm_re;}

		$("#updateRegEndDate").val(yyyy_re+'-'+mm_re+'-'+dd_re);
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

 if (typeof(Storage) !== "undefined") {
	var showFlag= sessionStorage.getItem("showFlag");
	if(showFlag==null){
		$scope.showFeature(0);
	}else if( showFlag){
	$scope.showFeature(1);
	sessionStorage.removeItem("showFlag");
	}else{
		$scope.showFeature(0);
	}
}

$scope.myTournmentsCallBack=function(){
	$scope.showFeature(0);	
}

$scope.myVar = false;
var myUrl = window.location.href;
var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
var tournamentUrl = url+"getMyTournaments";
$http({
	method : "GET",
	url : tournamentUrl
  }).then(function mySuccess(response) {
    $scope.mytournamentdetails = response.data;
   // console.log(JSON.stringify(response.data));
    
  var mlist = response.data[response.data.length-1];
    
    $scope.tournamentCat = mlist;
	$scope.tournamentenableDate = mlist.tournamentStartDate;
	$scope.getDayAndMatchList(mlist.tournamentId);	
	$scope.enableButtonDetails(mlist.tournamentId,mlist.tournamentStartDate);
  }, function myError(response) {
	//alert(response);
});
var rankListUrl = url+"playerView/getAllRankCategories";
$http({
	method : "GET",
	url : rankListUrl
  }).then(function mySuccess(response) {
	  $scope.rankList = response.data;
	  $scope.rankItem = $scope.rankList[0];
  }, function myError(response) {
  });
$scope.mytournament = function(){
	var tournamentUrl = url+"getMyTournaments";
	$http({
		method : "GET",
		url : tournamentUrl
	  }).then(function mySuccess(response) {
		 //console.log(JSON.stringify(response.data));
	    $scope.mytournamentdetails = response.data;
	  }, function myError(response) {
		//alert(response);
	});
}

$scope.mainCategoryList = function(){
	var mainCategoryList = url+"mainCategoryList?tournamentId="+$scope.tournamentIdForReg;
	$http({
		method : "GET",
		url : mainCategoryList
	  }).then(function mySuccess(response) {
		 // console.log(JSON.stringify(response.data));
	    $scope.tournamentCat = response.data;
	  }, function myError(response) {
		//alert(response);
	});
}
//profile details
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
$scope.openTournament = function(list){
	$scope.mytournament();
	//$scope.listedTournaments = false;
	//$scope.tournamentTabs = false;
	//$scope.descTournaments = true;
	$scope.tournamentCat = list;
	$scope.tournamentenableDate = list.tournamentStartDate;
	$scope.getDayAndMatchList(list.tournamentId);	
	$scope.enableButtonDetails(list.tournamentId,list.tournamentStartDate);
	$scope.showFeature(1);
}
$scope.enableButtonDetails = function(tournamentId,tournamentStartDate){
	var isDrwasCreated = url+"playerView/isDrwasCreated?tournamentId="+tournamentId+"&tournamentStartDate="+tournamentStartDate;
	$http({
		method : "GET",
		url : isDrwasCreated
	  }).then(function mySuccess(response) {
	  // console.log(JSON.stringify(response.data));
	   $scope.enableButton = response.data;
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
$scope.tournamentToggle = function() {
	$scope.mytournament();
    $scope.descTournaments = false;
    $scope.tournamentTabs = false;
	$scope.listedTournaments = true;
};	
$scope.descToggle = function() {
	$scope.mainCategoryList();
	$scope.enableButtonDetails($scope.tournamentIdForReg,$scope.tournamentstrtdate);
   // $scope.listedTournaments = false;
   // $scope.tournamentTabs = false;
    //$scope.descTournaments = true;
};		
// Getting draws details
$scope.getDraws = function(){
	var buildDrawsUrl = url+"playerView/buildCategoryDrwas?tournamentId="+$scope.tournamentIdForReg+"&categoryId="+$scope.categoryIdForReg+"&tournamentStart="+$scope.tournamentstrtdate;
	$http({
		method : "GET",
		url : buildDrawsUrl
	}).then(function mySuccess(response) {
	// console.log(JSON.stringify(response.data));
		$scope.rounds = response.data.drwasList;
		$scope.compaireDate = response.data.matchStarted;
		$scope.drawPublish = response.data.drawsPublish;
     }, function myError(response) {
		 });
}

//getting Schedule details
$scope.getSchedule = function(){
    var scheduleUrl = url+"playerView/getScheduleList?tournamentId="+$scope.tournamentIdForReg+"&categoryId="+$scope.categoryIdForReg;
	$http({
	method : "GET",
	url : scheduleUrl
	}).then(function mySuccess(response) {
	$scope.scheduledetails = response.data;
	}, function myError(response) {
 });
}  
// Getting tournamentRegistered players
$scope.getRagisteredPlayers = function(){
	var myUrl = window.location.href;
	var url = myUrl.substring(0, myUrl.lastIndexOf('/') + 1);
   var scheduleUrl = url+"getRagisteredPlayers?tournamentId="+$scope.tournamentIdForReg+"&categoryId="+$scope.categoryIdForReg;
   $http({
	method : "GET",
	url : scheduleUrl
  }).then(function mySuccess(response) {
	// console.log(JSON.stringify(response.data));
	$scope.playerListForAcategory = response.data;
	$scope.registeredByFilter = undefined;
	$scope.CheckUncheckHeader();
  }, function myError(response) {
  });
}  

// View Players tournament
$scope.viewPlayersTournament = function(tournamentId,categoryId,tournamentFee,playerList,entryFee,tournamentStart,matchType,title,catName){
	$scope.tournametTtl = title;
	$scope.catTtle = catName;
	$scope.tournamentIdForReg = tournamentId;
	$scope.categoryIdForReg = categoryId;
	$scope.tournamentFeeForReg = tournamentFee;
	$scope.entryFeeForReg = entryFee;
	//$scope.playerListForAcategory = playerList;
	$scope.tournamentstrtdate = tournamentStart;
	$scope.matchTypeReg = matchType;
		
	$scope.getDraws();
	$scope.getSchedule();
	$scope.getRagisteredPlayers();
	$scope.enableButtonDetails(tournamentId,tournamentStart);
	
	//$scope.descTournaments = false;
	//$scope.listedTournaments = false;
	//$scope.tournamentTabs = true;
	$scope.showFeature(2);
	$scope.finalobj =[]; // schedule
	$scope.avgTime = 0;
	$scope.getPlayerPublishOrNot(tournamentId,categoryId);
}  
$scope.getPlayerPublishOrNot = function(tournamentId,categoryId){
	var existingPlayerUrl = url+"playerView/getPlayersPublishMethod?tournamentId="+tournamentId+"&categoryId="+categoryId;
	$http({
		method : "GET",
		url : existingPlayerUrl
	  }).then(function mySuccess(response) {
		  $scope.playerPublish = JSON.parse(response.data);
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
$scope.addExistingPlayer = function(){
	$scope.doublePlayersValidate = null;
	var existingPlayerUrl = url+"getExistingPlayerList?tournamentId="+$scope.tournamentIdForReg+"&categoryId="+$scope.categoryIdForReg;
	$http({
		method : "GET",
		url : existingPlayerUrl
	  }).then(function mySuccess(response) {
		  //console.log(JSON.stringify(response.data));
		  $scope.existingPlayers = response.data;
	  }, function myError(response) {
		//alert(response);
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
			 formData.append('tournamentId', $scope.tournamentIdForReg);
			 formData.append('categoryId', $scope.categoryIdForReg);
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
		        	//$scope.descToggle();
		            }
		    });
		}
	}
	
}

$scope.adjustmentRakByOrg = function(){
	$("#wait").css("display", "block");
	var json = {
			"playerRank": []
	      };
	var table = $("#adjRankTab tbody");

    table.find('tr').each(function (i) {
        var $tds = $(this).find('td'),
            playerId = parseInt($tds.eq(1).text()),
            updatedRank = parseInt($tds.eq(2).text())
            
            var input = {
    		"playerId":playerId,
    		"updatedRank":updatedRank,
    		"tournamentId": $scope.tournamentIdForReg,
    		"categoryId":$scope.categoryIdForReg
    };
    json.playerRank.push(input);
    });
    var adjustmentRankUrl = url+"updateAitaRankByOrganiser";
    $.ajax({
        url: adjustmentRankUrl,
        data: JSON.stringify(json),
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	$("#wait").css("display", "none");
        	//showAlertSec(data);
        	$scope.successmsg = data+"...";
    		$("#success-alert").fadeIn(1000);
      	    setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
        	// location.reload();
        	$scope.getDraws();
            }
    });
    $scope.showFeature(2);
}
$scope.addToTournamentDoubles = function(){
	var json = {
			"doublesPlayer": []
	      };
	$("#ItemsTable tbody").find('input[name="record"]').each(function(){
    	if($(this).is(":checked")){
           // $(this).parents("tr").remove();
    	        var $tds = $(this).parents("tr").find('td'),
    	            aitaRank = parseInt($tds.eq(7).text()),
    	            playerId = parseInt($tds.eq(8).text())
    	            
    	            var input = {
    	    		"playerId":playerId,
    	    		"aitaRank":aitaRank,
    	    		"tournamentId": $scope.tournamentIdForReg,
    	    		"categoryId":$scope.categoryIdForReg,
    	    		"entryFee":$scope.entryFeeForReg
    	    };
    	    json.doublesPlayer.push(input);
    			  
    	}
    });
	if((json.doublesPlayer.length) == 2){
		//console.log(JSON.stringify(json));
		  var addDoublesPlayerForTournament = url+"addDoublesPlayerForTournament";
		    $.ajax({
		        url: addDoublesPlayerForTournament,
		        data: JSON.stringify(json),
		        contentType: false,
		        processData: false,
		        type: 'POST',
		        success: function(data){
		        	$scope.getRagisteredPlayers();
		        	//$scope.descToggle();
		        	$scope.addExistingPlayer();
		        	$scope.doublePlayersValidate = data;
		        	//showAlertSec(data);
		        	//location.reload();
		            }
		    });
		
	}else{
		//console.log(JSON.stringify(json));
		//showAlertSec("Please select two players");
		$scope.doublePlayersValidate = "Please select two players...";
	}
	
	
}
$scope.adjustmentSchedule = function(){
	$scope.finalobj =[];
	var avgTime = parseInt($("#avgTime").val());
	if(avgTime > 0){
	var availableTimes= [];
	var flag = true,secFlag=true;
	for (var i = 0; i < $scope.daysAndMatch.days.length; i++) {
		  var array1 = ($("#firstStart"+i).val()).split(":");
		  var array2 = ($("#firstEnd"+i).val()).split(":");
		  var array3 = ($("#secondStart"+i).val()).split(":");
		  var array4 = ($("#secondEnd"+i).val()).split(":");
		  var avaldate = $("#avaldate"+i).text();
		  if($("#firstStart"+i).val() ==  "" || $("#firstEnd"+i).val() == "" || $("#secondStart"+i).val() == "" || $("#secondEnd"+i).val() == ""){
			  secFlag = false;
			  flag = false;
			  break;
		  }
		  if(((parseInt(array1[0]) * 60) + parseInt(array1[1])) > ((parseInt(array2[0]) * 60) + parseInt(array2[1]))){
			  //showAlertSec("Start Time should be less than end time.");
			  $scope.scheduleValidate = "Start Time should be less than end time...";
			  flag = false;
			  break;
		  }
		  if(((parseInt(array3[0]) * 60) + parseInt(array3[1])) > ((parseInt(array4[0]) * 60) + parseInt(array4[1]))){
			  //showAlertSec("Start Time should be less than end time.");
			  $scope.scheduleValidate = "Start Time should be less than end time...";
			  flag = false;
			  break;
		  }
		  var input = {
			        "startMM":((parseInt(array1[0]) * 60) + parseInt(array1[1])),
					"endMM":((parseInt(array2[0]) * 60) + parseInt(array2[1])),
					"day":avaldate
			        };
		  var input1 = {
				    "startMM":((parseInt(array3[0]) * 60) + parseInt(array3[1])),
					"endMM":((parseInt(array4[0]) * 60) + parseInt(array4[1])),
					"day":avaldate
			        };
		  availableTimes.push(input);
		  availableTimes.push(input1);
		}
	//console.log(JSON.stringify(availableTimes));
	
	if(flag == true && availableTimes.length > 0){
	var totalAvalibaleMinutes = 0;
	for(var i=0; i < availableTimes.length; i++){
		var totalMinutes = (availableTimes[i].endMM - availableTimes[i].startMM);
		totalAvalibaleMinutes += totalMinutes;
	}
	var requiredTime = ($scope.daysAndMatch.matchs.length * avgTime);
	if(requiredTime > (totalAvalibaleMinutes * $scope.daysAndMatch.court.length)){
		//showAlertSec("Not enough time to complete all matches.");
	  $scope.scheduleValidate = "Not enough time to complete all matches...";
	}else{
		var starttime =0,endtime=0;
		var finalobj =[];
		var k=1;
		var tempmatch =1;
	for(var j=0;j<availableTimes.length;j++){
		var i=k;
		starttime =  availableTimes[j].startMM;
		endtime = starttime + avgTime;
		if((starttime < availableTimes[j].endMM) && (endtime <= availableTimes[j].endMM)){
		    for(var c =0; c < $scope.daysAndMatch.court.length; c++){
		    if(finalobj.length < $scope.daysAndMatch.matchs.length){
		    	 var json1 = {
			 				"starttime":timeConvert(starttime),
			 				"endtime":timeConvert(endtime),
			 				"day":availableTimes[j].day,
			 				"court":$scope.daysAndMatch.court[c].courtId,
			 				"matchId":$scope.daysAndMatch.matchs[tempmatch-1].match_id,
			 				"match":tempmatch++
			 		        };
		    	finalobj.push(json1);
		    }
		    }
		}
		 for( i; finalobj.length < $scope.daysAndMatch.matchs.length; i++){
			 k= i;
			 var newValue = ((starttime) + avgTime);
			 var secNewValue = (newValue + avgTime);
			 if((newValue < availableTimes[j].endMM) && (secNewValue <= availableTimes[j].endMM) ){
				 for(var c =0; c < $scope.daysAndMatch.court.length; c++){
				 if(finalobj.length < $scope.daysAndMatch.matchs.length){
					 var json2 = {
								"starttime":timeConvert(newValue),
								"endtime":timeConvert(secNewValue),
								"day":availableTimes[j].day,
								"court":$scope.daysAndMatch.court[c].courtId,
								"matchId":$scope.daysAndMatch.matchs[tempmatch-1].match_id,
								"match":tempmatch++
						        };
					    finalobj.push(json2);
				 }
				}
			 }else{
				 k= i;
				 starttime = newValue; 
				 break;
			 }
			 starttime = newValue;
		 }
		 }
	if($scope.daysAndMatch.matchs.length == finalobj.length){
		$scope.saveScheduleData(finalobj);
	}else{
		//showAlertSec("All matches can't be schedule within the given time.");
		  $scope.scheduleValidate = "All matches can't be schedule within the given time...";
	}
	//console.log("finalobj==>"+JSON.stringify(finalobj));
	}
	}else{
		if(secFlag == true){
			//showAlertSec("Start Time should be less than end time.");
			$scope.scheduleValidate = "Start Time should be less than end time...";
		}
		else{
			//showAlertSec("Field should not be empty.");
			$scope.scheduleValidate = "Field should not be empty...";
		}
	}
	}else{
		 //showAlertSec("Please enter avg time.")
		$scope.scheduleValidate = "Please enter avg time...";
  }
}
$scope.saveScheduleData = function(finalobj){
	//console.log("finalobj==>"+JSON.stringify(finalobj));
	var schedulePostUrl = url+"saveScheduleData";
    $.ajax({
        url: schedulePostUrl,
        data: JSON.stringify({"finalobj": finalobj }),
        contentType: false,
        processData: false,
        async : false,
        type: 'POST',
        success: function(data){
        	if(data == "Success"){
        		$scope.mainCategoryList();
        		$("#updateSchedule").modal("hide");
        		$scope.successmsg = "Tournament got scheduled successfully...";
          		 $("#success-alert").fadeIn(1000);
          	  	 setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
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
	/*if((playerItaRank == "" || isNaN(playerItaRank)) && (playerItaId == "" || isNaN(playerItaId))){
		playerItaRank = 11111111;
		playerItaId = 11111111;
	}*/
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
	 formData.append('tournamentId',$scope.tournamentIdForReg);
	 formData.append('categoryId',$scope.categoryIdForReg);
	 
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
$scope.deleteFromTournament = function(playerId,paymentId,playername){
	
	$scope.showConfirm(playerId,paymentId,playername)
}
$scope.checkByMatch = function(prop){
    return function(item){
      return item[prop] == false;
    }
}
$scope.createTournamentLavelSchedule = function(tournamentId){
	$scope.enableButtonDetails(tournamentId,$scope.tournamentenableDate);
	$scope.getDayAndMatchList(tournamentId);
	
	if($scope.enableButton.drawsCreated){
		if(!$scope.enableButton.matchStarted){
		var createTournamentLavelSchedule = url+"createTournamentLavelSchedule?tournamentId="+tournamentId;
		$http({
			method : "GET",
			url : createTournamentLavelSchedule
		  }).then(function mySuccess(response) {
			  if(response.data.length > 0){
				  var appendCategory="";
				  angular.forEach(response.data, function (value, key) {
					  appendCategory += value.categoryName +", ";
			        });
				  $("#confirmationPopupForSchedule").modal("show");
				  $( ".confirmschedulemsg" ).text("Draws not yet created for "+appendCategory+"' Do you want to continue ?");
			  }else{
				  $("#updateSchedule").modal("show");
			  }
		  }, function myError(response) {
			//alert(response);
		  });
		}else{
			//showAlertSec("Tournament already started, now you can't update schedule!.");
			$scope.infomsg = "Tournament already started, now you can't update schedule...";
		    $("#info-alert").fadeIn(1000);
  	        setTimeout(function(){ $("#info-alert").fadeOut(1000) }, 3000);
		}
	}else{
		//showAlertSec("Draws not yet created, please first create draw.");
		$scope.infomsg = "Draws not yet created, please first create draw...";
	    $("#info-alert").fadeIn(1000);
	    setTimeout(function(){ $("#info-alert").fadeOut(1000) }, 3000);
	}
}
$scope.getConfirmedShedule = function(){
	$("#confirmationPopupForSchedule").modal("hide");
	$("#updateSchedule").modal("show");
}
$scope.ViewTournamentLavelSchedule = function(tournamentId,title){
	$scope.titleName = title;
	$scope.enableButtonDetails(tournamentId,$scope.tournamentenableDate);
	if($scope.enableButton.scheduleCreated){
	var ViewTournamentLavelSchedule = url+"playerView/ViewTournamentLavelSchedule?tournamentId="+tournamentId;
	$http({
		method : "GET",
		url : ViewTournamentLavelSchedule
	  }).then(function mySuccess(response) {
		  //console.log(JSON.stringify(response.data));
		  if(response.data.conditionVal != true){
			  $("#scheduleTournamentLavel").modal("show");
			  $scope.tournamentLvlSch = response.data.scheduleList;
		  }else{
			    $scope.infomsg = "Schedule not yet created...";
  		        $("#info-alert").fadeIn(1000);
    	        setTimeout(function(){ $("#info-alert").fadeOut(1000) }, 3000);
		  }
	  }, function myError(response) {
	  });
	}else{
		$scope.infomsg = "Schedule not yet created...";
	    $("#info-alert").fadeIn(1000);
        setTimeout(function(){ $("#info-alert").fadeOut(1000) }, 3000);
	}
}
$scope.updateMatchScore = function(list){
	$scope.matchStatus=null;
	   $scope.playerfirst1 = 0;
	   $scope.playerSecond1 = 0;
	   $scope.playerThird1 = 0;
	   $scope.playerfirst2 = 0;
	   $scope.playerSecond2 = 0;
	   $scope.playerThird2 = 0;
	   $scope.showtable = false;
	   $scope.updateMatchId = list.matchId;
	   $scope.updateCatId = list.categoryid;
	   $scope.updateTournamentId = list.tournamentid;
	   
	$scope.updateScoreData = list;
	if(list.byMatch){
		$scope.errormsg = "BYE Match you can't update...";
		$("#danger-alert").fadeIn(1000);
        setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
      //showAlertSec("BYE Match you can't update!");
	}
	else if(list.team1 == "" || list.team2 == "" ){
		$scope.errormsg = "Please update score for previous round...";
		$("#danger-alert").fadeIn(1000);
        setTimeout(function(){ $("#danger-alert").fadeOut(1000) }, 3000);
		//showAlertSec("Please update score for previous round!");
	}
	else
		$("#modalUpdateScoreForm").modal("show");
}
$scope.updatePlayerScores = function(){
	   /*var matchId = parseInt($("#matchId").val());
	   var tournamentid = parseInt($("#tournamentid").val());
	   var categoryid = parseInt($("#categoryid").val());
	   */
	   //if($scope.matchStatus == 'COMPLETED'){
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
 		   //showAlertSec("Both Team can't have same score!")
 		  $scope.scoreValidate = "Both Team can't have same score...";
 		   return false;
 	   }
 	   var score = playerfirst1+"-"+playerfirst2+","+playerSecond1+"-"+playerSecond2+","+playerThird1+"-"+playerThird2;
 	   var formData = new FormData();
 	   formData.append('matchId', $scope.updateMatchId);
 	   formData.append('tournamentid', $scope.updateTournamentId);
 	   formData.append('categoryid', $scope.updateCatId);
 	   formData.append('score', score);
 	   formData.append('matchStatus', 'COMPLETED');
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
 	        	  $("#modalUpdateScoreForm").modal("hide");
 	        	//showAlertSec(data);
 	        	 $scope.successmsg = data+"...";
 	    		$("#success-alert").fadeIn(1000);
 	      	    setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
 	        	$scope.getDraws();
 	        	
 	        }
 	    }); 
	   /*}else{
		   var formData = new FormData();
		   formData.append('matchId', $scope.updateMatchId);
	 	   formData.append('tournamentid', $scope.updateTournamentId);
	 	   formData.append('categoryid', $scope.updateCatId);
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
	        	   $("#modalUpdateScoreForm").modal("hide");
	        	showAlertSec(data);
	        	$scope.getDraws();
	        	
	        }
	    }); 
	   }*/
	   
} 

$scope.sortKey = ['scheduleDate','scheduleDate'];
$scope.sort = function(propName1,propName2){
      $scope.sortKey = [propName1,propName2];
      $scope.reverse = !$scope.reverse;
  }
$scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
   
	$('.timePicker').datetimepicker({
			format: 'HH:mm'
	   });
});
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

$scope.editPlayerDetails = function(playerDetails){
	$scope.updatePlayersValidate = null;
	if($scope.matchTypeReg == 1){
		$("#editPlayer").val(playerDetails.name);
		$scope.editPlayerId = playerDetails.playerId;
		$("#editDoublesPalyer").modal("show");
	}
	else{
		var str = playerDetails.name;
		  var res = str.split("&");
		  $("#editPlayer1").val(res[0].trim());
		  $("#editPlayer2").val(res[1].trim());
		  $scope.editPlayerId1 = playerDetails.playerId;
		  $scope.editPlayerId2 = playerDetails.playerId2;
		  $("#editDoublesPalyer").modal("show");
	}
	console.log(JSON.stringify(playerDetails));
}
$scope.deletePlayerValidate = function(){
	$scope.updatePlayersValidate = null;
}

$scope.postEditSinglePlayerDetails = function(){
	var playerfirst = $("#editPlayer").val().trim();
	if(playerfirst ==""){
		$scope.updatePlayersValidate = "Player should not be empty!";
		return false;
	}
	var finalobj =[];
	  var json1 = {
			"playername":playerfirst.trim(),
			"playerid": $scope.editPlayerId
	        };
  finalobj.push(json1);
  $scope.updatePlayers(finalobj);
}
$scope.postEditPlayerDetails = function(){
	var playerfirst = $("#editPlayer1").val().trim();
	var playerSecond = $("#editPlayer2").val().trim();
	
	if(playerfirst == ""){
		$scope.updatePlayersValidate="First Player should not be empty!";
		return false;
	}
	if(playerSecond == ""){
		$scope.updatePlayersValidate="Second Player should not be empty!";
		return false;
	}
	var finalobj =[];
	  var json1 = {
			"playername":playerfirst.trim(),
			"playerid": $scope.editPlayerId1
	        };
    finalobj.push(json1);
    var json2 = {
    		"playername":playerSecond.trim(),
			"playerid":$scope.editPlayerId2
	        };
    finalobj.push(json2);
	
   $scope.updatePlayers(finalobj);
	
}
$scope.updatePlayers = function(finalobj){
	var updatePlayerPostUrl = url+"updatePlayersDetails";
    $.ajax({
        url: updatePlayerPostUrl,
        data: JSON.stringify({"finalobj": finalobj }),
        contentType: false,
        processData: false,
        async : false,
        type: 'POST',
        success: function(data){
        	if(data == "Success"){
        		$scope.getRagisteredPlayers();
        		$("#editDoublesPalyer").modal("hide");
        		$scope.successmsg = "Player name updated!";
        		$("#success-alert").fadeIn(1000);
          	    setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
          }else{
        	  $scope.updatePlayersValidate = data;
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

$scope.updateTournamentDates = function(tournamentid,organiserId,title,list){
	$("#updateRegStartDate").val(list.rStartDate);
	$("#updateRegEndDate").val(list.rEndDate);
	$("#updateTournamentStartDate").val(list.tStartDate);
	$("#updateTournamentEndDate").val(list.tEndDate);
	$scope.extendTitle = title;
	$scope.extendtournamentid = tournamentid;
	$scope.extendorganiserId = organiserId;
	
	$("#extendsTournament").modal("show");
}
$scope.extendsTournament = function(){
	
	var regStartDate = $("#updateRegStartDate").val();
	var regEndDate = $("#updateRegEndDate").val();
	var tournamentStartDate = $("#updateTournamentStartDate").val();
	var tournamentEndDate = $("#updateTournamentEndDate").val();

	 
	 if(new Date(regStartDate) > new Date(regEndDate)){
		 $scope.tournamentDateValidate = "Registration End date should be greater than or equal to Start date...";
		 return false;
		}
	 if(new Date(regEndDate) >= new Date(tournamentStartDate)){
		
		 $scope.tournamentDateValidate ="Tournament Start date should be greater than Registration End date...";
			return false;
		}
	 
	 if(new Date(tournamentStartDate) > new Date(tournamentEndDate)){
		 $scope.tournamentDateValidate ="Tournament End date should be greater than  or equal to Start date...";
			return false;
		}
	 
	 var formData = new FormData();
	 formData.append('regStartDate', regStartDate);
	 formData.append('regEndDate', regEndDate);
	 formData.append('tournamentStartDate', tournamentStartDate);
	 formData.append('tournamentEndDate', tournamentEndDate);
	 formData.append('tournamentid', $scope.extendtournamentid);
	 formData.append('organiserId', $scope.extendorganiserId);
	 
	 var extendsDateUrl = url+"extendsTournamentDate";
	    $.ajax({
	    	async : false,
	        url: extendsDateUrl,
	        data: formData,
	        data: formData,
	        contentType: false,
	        processData: false,
	        type: 'POST',
	        success: function(data){
	        	//showAlert(data);
	        	if(data == "Success"){
	        		$scope.mytournament();
	        		$("#extendsTournament").modal("hide");
	        		$scope.successmsg = "Tournament dates updated, Please update schedule!";
	        		$("#success-alert").fadeIn(1000);
	          	    setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
	        	}else{
	        		$scope.tournamentDateValidate = data;
	        	}
	        }
	    });
}
$scope.bulkUploadAndRegisterForSingle = function(){
	$("#wait").css("display", "block");
	var formData = new FormData();
	formData.append('bulkUploadFile', $( '#bulkUploadFileForSingle' )[0].files[0]);
	formData.append('tournamentId', $scope.tournamentIdForReg);
	formData.append('categoryId', $scope.categoryIdForReg);
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
        	$("#wait").css("display", "none");
        	if(data == "Success"){
        		$scope.getRagisteredPlayers();
        		$("#alertPopup").modal("hide");
        		$("#bulkUploadPopupForSingle").modal("hide");
        	}
        	else{
        		$scope.uploadSingleMatchPlayers = data;
        	}
        	$('#bulkUploadFileForSingle').val('');
        }
    });  
}
$scope.bulkUploadAndRegisterForDouble = function(){
	$("#wait").css("display", "block");
	var formData = new FormData();
	formData.append('bulkUploadFile', $( '#bulkUploadFileForDouble' )[0].files[0]);
	formData.append('tournamentId', $scope.tournamentIdForReg);
	formData.append('categoryId', $scope.categoryIdForReg);
	formData.append('matchType', $scope.matchTypeReg);
	formData.append('entryFee', $scope.entryFeeForReg);
	
	var bulkUrl = url+"uploadBulkAndRegisterForDoubleMatch";
	$.ajax({
		async : false,
        url: bulkUrl,
        data: formData,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
        	$("#wait").css("display", "none");
        	if(data == "Success"){
        		$scope.getRagisteredPlayers();
        		$("#alertPopup").modal("hide");
        		$("#bulkUploadPopupForDouble").modal("hide");
        	}
        	else{
        		$scope.uploadDoubleMatchPlayers = data;
        	}
        	$('#bulkUploadFileForDouble').val('');
        }
    });  
}

$scope.activeOrInActiveDrawPublish = function(boolVal){
	 var activeVal = 1;
     if(boolVal){
    	 activeVal = 0;
     }
         
    var transactionUrl = url+"setActiveOrInActiveDraw?tournamentId="+$scope.tournamentIdForReg+"&categoryId="+$scope.categoryIdForReg+"&activeVal="+activeVal;
    $http({
        method : "GET",
        url : transactionUrl
      }).then(function mySuccess(response) {
          
      }, function myError(response) {
       });
   }
$scope.activeOrInActivePlayersPublish = function(boolVal){
	 var activeVal = 1;
    if(boolVal){
   	 activeVal = 0;
    }
        
   var transactionUrl = url+"setActiveOrInActivePlayers?tournamentId="+$scope.tournamentIdForReg+"&categoryId="+$scope.categoryIdForReg+"&activeVal="+activeVal;
   $http({
       method : "GET",
       url : transactionUrl
     }).then(function mySuccess(response) {
         
     }, function myError(response) {
      });
  }


$scope.CheckUncheckHeader = function () {
    $scope.IsAllChecked = true;
//console.log(JSON.stringify($scope.playerListForAcategory));
    for (var i = 0; i < $scope.playerListForAcategory.length; i++) {
        if (!$scope.playerListForAcategory[i].selected) {
            $scope.IsAllChecked = false;
            break;
        }
    };
    
};

$scope.CheckUncheckAll = function () {
    for (var i = 0; i < $scope.playerListForAcategory.length; i++) {
    	if($scope.playerListForAcategory[i].registeredBy != 0)
        $scope.playerListForAcategory[i].selected = $scope.IsAllChecked;
    }
};

$scope.deleteMultiplePlayer = function(){
	$scope.showMultiConfirm();
	
}
$scope.showMultiConfirm = function(){
	$("#confirmationMultiPlayerpopup").modal("show");
	$( ".confirmMultiPlayermsg" ).text("Are you sure you want to remove players");
}	

$scope.deleteMultiPlayer = function(){
	$("#confirmationMultiPlayerpopup").modal("hide");
	
	var json = {
			"multiplayerdelete": []
	      };
	for (var i = 0; i < $scope.playerListForAcategory.length; i++) {
    	if($scope.playerListForAcategory[i].registeredBy != 0 && $scope.playerListForAcategory[i].selected == true)
    		json.multiplayerdelete.push($scope.playerListForAcategory[i]);
    }
	if((json.multiplayerdelete).length > 0){
 	   var multiplayerdeleteUrl = url+"playerView/multiplayerdelete";
	    $.ajax({
	        url: multiplayerdeleteUrl,
	        data: JSON.stringify(json),
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
}



/*

$scope.deleteMultiplePlayer = function(){
		var json = {
				"multiplayerdelete": []
		      };
		var table = $("#adjRankTab tbody");

	    table.find('tr').each(function (i) {
	        var $tds = $(this).find('td'),
	            playerId = parseInt($tds.eq(1).text()),
	            paymentId = parseInt($tds.eq(10).text())
	            //name = parseInt($tds.eq(1).text())
	           var chkbox = $tds.eq(0).childNodes[0];
	        if(null != chkbox && true == chkbox.checked) {
	            var input = {
	    		"playerId":playerId,
	    		"paymentId":paymentId,
	    		"tournamentId": $scope.tournamentIdForReg,
	    		"categoryId":$scope.categoryIdForReg
	         };
	         json.multiplayerdelete.push(input);
	       }
	    });
	   // console.log(JSON.stringify(json));
       if((json.multiplayerdelete).length > 0){
    	   var multiplayerdeleteUrl = url+"playerView/multiplayerdelete";
   	    $.ajax({
   	        url: multiplayerdeleteUrl,
   	        data: JSON.stringify(json),
   	        contentType: false,
   	        processData: false,
   	        type: 'POST',
   	        success: function(data){
   	        	$scope.successmsg = data+"...";
   	    		$("#success-alert").fadeIn(1000);
   	      	    setTimeout(function(){ $("#success-alert").fadeOut(1000) }, 3000);
   	            }
   	    });
       }
	}*/
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
});
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
