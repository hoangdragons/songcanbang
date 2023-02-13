var controllers = angular.module('magazine.controllers', [
	                                                     'ui.router',
                                                       'oc.lazyLoad',
                                                       'uiGmapgoogle-maps',
                                                       'angular-jwt',
                                                       'ngFileUpload',
                                                       'ngStorage'
                                                       ]);
 

//////////////////////////////////////////////////////////////
// Common controller
//////////////////////////////////////////////////////////////
controllers.controller('CommonController', 
	['$scope','LoginFactory','LogoutFactory',
	 '$filter',
	 '$compile','$stateParams', '$translate','$location',
	 'cfpLoadingBar', '$ocLazyLoad', 
  function ($scope, LoginFactory, LogoutFactory, $filter,
  			 $compile,$stateParams, $translate, $location,
  			cfpLoadingBar, $ocLazyLoad) {  
	$scope.serverPath = "";
	$scope.setLang = function(langKey) {
	    // Change the language during runtime
	    $translate.use(langKey);
      $("#selectedLangImg").attr('src', 'assets/images/flags/'+langKey.substring(0,2) + '.png');
	  };
	  $scope.cmsadminPromise = null;
	  $scope.loading = false;
   
	  $scope.login = function (user) {
		  $scope.loading = true;
      if(!$scope.signedInUser){
				$scope.cmsadminPromise = LoginFactory.login(user, 
					function (data) {
						if(typeof data === "undefined" || data === ''){
							$scope.errorMsg = "Login failed";
							$scope.loading = false;
						}else{
							$scope.errorMsg = null;
							delete $localStorage.jwt; 
							$localStorage.jwt = data;
							$scope.signedInUser = $localStorage.jwt && jwtHelper.decodeToken($localStorage.jwt);
							$scope.loading = false;
							$location.path('/category-list');
						}
					
			    	},function(err){
			    		console.log(err);
			    	}
				);
			}
		};
      
      $scope.logout = function () {
      	$scope.loading = true;
      	LogoutFactory.logout( 
      	function(data){
      		$localStorage.jwt = null;
      		delete $localStorage.jwt;        		
      		$scope.signedInUser = null;
      		$scope.loading = false;
      		// Debug data
      		$location.path('/app/login');
          });
      	
      };
}])
