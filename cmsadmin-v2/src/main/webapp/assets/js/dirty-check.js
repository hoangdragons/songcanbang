'use strict';
window.ignoreDC == false;
var dirtyCheck = function (){
	var dirtyForms = $(".form-require-dirty-check");
	var dirtyElms = $(".ng-dirty");

	var ret = null;

	if(typeof dirtyForms !== "undefined" && typeof dirtyElms !== "undefined"
		&& dirtyForms.length > 0 && dirtyElms.length > 0){
		ret = "\0";
	}
		
	if(ret != null)
		return ret;
};

window.onbeforeunload = dirtyCheck;

