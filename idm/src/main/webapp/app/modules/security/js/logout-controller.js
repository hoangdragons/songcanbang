
controllers.controller('LogoutController', ['$scope','LoginFactory','LogoutFactory','UserRegisterFactory','$location','$http'
                                           ,'$stateParams','$resource','$localStorage', 'jwtHelper',
    function ( $scope, LoginFactory,LogoutFactory,UserRegisterFactory, $location, $http, $stateParams, $resource, $localStorage,jwtHelper) {
	    delete $localStorage.jwt;
	    $localStorage.jwt = undefined;
	    $localStorage.jwt = null;
		if(typeof $stateParams.service !== "undefined" && $stateParams.service !== ''){
			window.location = decodeURIComponent($stateParams.service);
		}else{
			window.location = app.homepage;
		}
    }]);