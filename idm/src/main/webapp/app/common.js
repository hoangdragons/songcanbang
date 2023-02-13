Array.prototype.contains = function(obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {
            return true;
        }
    }
    return false;
}
angular.module('globalErrorHandlerModule', ['ngStorage'])
    .factory('dolphinHttpInterceptor', ['$rootScope', '$q','$injector', function ($rootScope, $q, $injector) {
        return {
        	'requestError': function(rejection) {
                // handle same as below
        		$injector.get('$modal').open({
                    template: '<div class="error_panel">Exception occured</div>Status: '+rejection.status + '<br/> Reason: ' + rejection.statusText,
                  });
                return $q.reject(rejection);
            },
            'responseError': function (rejection) {
                // $modal provider come from ui.bootstrap
                $injector.get('$modal').open({
                    template: '<div class="error_panel">Exception occured</div>Status: '+rejection.status + '<br/> Reason: ' + rejection.statusText,
                  });
                return $q.reject(rejection);
            }
        };
    }])   
    .config(function ($httpProvider) {
        $httpProvider.interceptors.push('dolphinHttpInterceptor');
        $httpProvider.interceptors.push(['$q','$location','$localStorage','jwtHelper', function ($q, $location, $localStorage) {
     	   return {
     		  'request': function (config) {
    	           config.headers = config.headers || {};
    	           if ($localStorage.jwt) {
    	               config.headers.Authorization = $localStorage.jwt;
    	           }
    	           return config;
    	       },
     	       'responseError': function (response) {
     	           if (response.status === 401 || response.status === 403) {
     	        	   console.log(response.status);
     	        	   
     	           }
     	           return $q.reject(response);
     	       }
     	   };
     	}]);
    });