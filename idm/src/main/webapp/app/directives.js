'use strict';

/* Directives */


var directives = angular.module('idm.directives', ['idm.services']);

directives.directive('ngEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.ngEnter);
                });
 
                event.preventDefault();
            }
        });
    };
});
directives.directive('emailCheck', 
	[ 'CheckEmailExistsFactory', function (CheckEmailExistsFactory) {
	  return {
	    require: 'ngModel',
	    restrict:'A',
	    link: function (scope, elem, attrs, ctrl) {
	        elem.on('blur', function (evt) {
	          scope.$apply(function () {
	        	  
	        	  CheckEmailExistsFactory.checkEmail({email:elem.val()},
		        		  function(data){
	        		  		data.$promise.then(function(ret){
	        		  			console.log(JSON.stringify(ret));
	        		  			if(typeof(ret) !== 'undefined'
	        		  				&& ret.email != null
	        		  				&& typeof(ret.email) !== 'undefined' 
	        		  				&& ret.email !== ""){
	        		  				ctrl.$setValidity('emailCheck', false);
	        		  			}else{
	        		  				ctrl.$setValidity('emailCheck', true);
	        		  			}
	        		  		});
		        	  		
		        	  	  }, function(err){
		        	  		console.log(err);
		        	  	  }
		        );
	          
	       });
	      });
	     }
	    }
	}]);
directives.directive('email', 
		[ 'CheckEmailExistsFactory', function (CheckEmailExistsFactory) {
		  return {
		    require: 'ngModel',
		    restrict:'AC',/* Restrict to attribute or class*/
		    link: function (scope, elem, attrs, ctrl) {
		    	//For view -> model validation
		    	ctrl.$parsers.unshift(function(value) {
		    		CheckEmailExistsFactory.checkEmail({email:elem.val()},
			        		  function(data){
		        		  		data.$promise.then(function(ret){
		        		  			if(typeof(ret) !== 'undefined'
		        		  				&& ret.email != null
		        		  				&& typeof(ret.email) !== 'undefined' 
		        		  				&& ret.email !== "")
		        		  			{
		        		  				ctrl.$setValidity('email', false);
		        		  				return undefined;
		        		  			}else{
		        		  				ctrl.$setValidity('email', true);
		        		  				return value;
		        		  			}
		        		  		});
			        	  		
			        	  	  }, function(err){
			        	  		console.log(err);
			        	  	  }
			        	  	  );
		          });

		     }//end link
		    }
		}]);