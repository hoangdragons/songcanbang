'use strict';

var services = angular.module('idm.services', ['ngResource']);
services.factory('LoginFactory', LoginService);
services.factory('LogoutFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/security/logout', {}, {
        logout: { method: 'GET'}
    })
});

function LoginService($http) {
    var service = {};
    service.login = login;
    return service;
    function login(user, callback) {
    	var conf= { headers:  
	    	{
	    		'Content-Type': 'application/json'
//	    		,'Origin':'http://adkbtt.ehealth.gov.vn'
//	    		,'Origin':'*'
	    	}
    	}
        $http.post(app.idmUrl + '/rest-api/security/login', user,conf)
            .success(function (response) {
            	callback(response);
            });
    }
    /*
    function login(user, callback) {
        $http.post(app.idmUrl + '/rest-api/security/login', user)
            .success(function (response) {
            	callback(response);
            });
    }*/
}

services.factory('ClaimService', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/security/getLoggedInUser', {}, {
    	getLoggedInUser: { method: 'GET'}
    })
});


services.factory('facebookService', function($q, $rootScope, $stateParams) {
    return {
        getMyLastName: function() {
            var deferred = $q.defer();
            FB.api('/me', {
                fields: 'last_name'
            }, function(response) {
                if (!response || response.error) {
                    deferred.reject('Error occured');
                } else {
                    deferred.resolve(response);
                }
            });
            return deferred.promise;
        },
        logout: function(){
          var _self = this;
       	  FB.logout(function(response) {
       	    $rootScope.$apply(function() {
       	      $rootScope.user = _self.user = {};
       	    });
       	  });
        },
        getUserInfo : function() { 
      	  var _self = this;
      	  var user = {};
      	  FB.api('/me', {
              fields: 'context, name, public_key, first_name, last_name, gender, id'
      	  	},
      	  	function(res) {
      	    $rootScope.$apply(function() {
      	    	user.userId = res.id;
      	        user.fullName = res.name;
      	      
      	    });
      	  });
      	FB.getLoginStatus(function(res) {    
    		//{status: 'connected',authResponse: {accessToken: '...',expiresIn:'...',signedRequest:'...',userID:'...'}}
	    	  if (res.status === 'connected') {
	    		user.userId = res.authResponse.userID;
	    	    user.fbAccessToken = res.authResponse.accessToken;
	    	    user.password = '';
	    	    LoginService.login(user, function (data) {
					if(typeof data === "undefined" || data === ''){
						$rootScope.errorMsg = "Login failed";
					}else{
						if(typeof $stateParams.service !== "undefined" && $stateParams.service !== ''){
							window.location = decodeURIComponent($stateParams.service) + '?token='+data;
						}else{
							$scope.errorMsg = null;
							$localStorage.jwt = data;
							$scope.signedInUser = $localStorage.jwt && jwtHelper.decodeToken($localStorage.jwt);
							$location.path('/app/profile/');
						}
					}
					
			    });
	    	  }
      	  });
      	},
      	watchAuthenticationStatusChange : function() {
      	  var _self = this;
      	  FB.Event.subscribe('auth.authResponseChange', function(res) {
      	    if (res.status === 'connected') {
      	      _self.getUserInfo();
      	    }
      	  });
      	}
    }
});