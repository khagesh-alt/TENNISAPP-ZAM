function showAlert(msg){
	$("#alertPopup").modal("show");
	$( ".alertmsg" ).text(msg);
}
function hideAlert(){
	$("#alertPopup").modal("hide");
	location.reload();
}
function showAlertSec(msg){
	$("#secalertPopup").modal("show");
	$( ".alertmsg" ).text(msg);
}
function hideAlertSec(){
	$("#secalertPopup").modal("hide");
}
function timeConvert(n) {
	var num = n;
	var hours = (num / 60);
	var rhours = leftPad(Math.floor(hours));
	var minutes = (hours - rhours) * 60;
	var rminutes = leftPad(Math.round(minutes));
	return rhours + ":" + rminutes;
}

function leftPad(number) {    
    return ((number < 10 && number >= 0) ? '0' : '') + number;  
}
 function hideSuccessAlert(){
	$("#success-alert").fadeOut(1000);
}
 function hideDangerAlert(){
		$("#danger-alert").fadeOut(1000);
	}
 function hideInfoAlert(){
		$("#info-alert").fadeOut(1000);
	}
 function validateNumber(number){
		var regex = /^[0-9]*(?:\.\d{1,2})?$/;    // allow only numbers [0-9] 
		return regex.test(number);
	}