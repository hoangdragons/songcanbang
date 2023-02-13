var controllers = angular.module('idm.controllers', [
                                                       'ui.grid', 
                                                       'ui.grid.autoResize',
                                                       'angular-jwt',
                                                       'ngStorage'
                                                       ]);
//////////////////////////////////////////////////////////////
// Common controller
//////////////////////////////////////////////////////////////
controllers.controller('CommonController', ['$rootScope','$scope','$injector','LoginFactory','LogoutFactory','UserRegisterFactory','UsersFactory',
	'UserSearchFactory', 'UserSearchEmailFactory', 'UserSearchLoginNameFactory',
	'$compile','$stateParams', '$translate','$location','$localStorage','jwtHelper','$filter',
  function ($rootScope, $scope,$injector, LoginFactory,LogoutFactory,UserRegisterFactory,UsersFactory,UserSearchFactory, UserSearchEmailFactory, UserSearchLoginNameFactory,
		  	$compile,$stateParams, $translate, $location,$localStorage, jwtHelper, $filter) {  
	$scope.registerUser = function (newUser) {    
		var w1 = UserSearchEmailFactory.search(newUser.email);
		w1.$promise.then(function(d){
			if(typeof d.loginName == "undefined"){
				var w2 = UserSearchLoginNameFactory.search({loginName:newUser.loginName});
				w2.$promise.then(function(d2){
					if(typeof d2.loginName == "undefined"){
				    	UserRegisterFactory.register(newUser,function(data){
							$scope.success_message = "common.REGISTER_USER_SUCCESS";
							$scope.user = data;
							$scope.message = "User registration successfully!";
							$location.path('/user-detail/' + data.userId);
					    }, function(err){throw err});
					}else{
						$scope.showModalMessage('register.TITLE','register.LOGIN_NAME_EXIST', true);
						return;
					}
				}, function(err){throw err})
			}else{
				$scope.showModalMessage('register.TITLE','register.EMAIL_EXIST', true);
				return;
			}
		}, function(err){throw err})

    };
    
    $scope.showModalMessage = function(titleKey, message, isErr){
		 $scope.modal = $injector.get('$modal').open({
	        template: 
	        	'<div style="text-align:center;vertical-align:middle;height:auto;width:auto">'
	        	+'<div class="modal-header" style="background: linear-gradient(-180deg, rgb(0,123,190), rgb(0,176,234));color: #fff;">'
		        +'<h4 class="modal-title" id="myModalLabel">' + $filter('translate')(titleKey) +'</h4>'
		        +'</div>'
	        	+'<div class="modal-body">'
	        	+'<div class="col-sm-12">'
	        	+ (isErr?'<span class="ion-android-warning" style="color:red;font-size:25px;margin-right:10px"></span>':'')
	        	+ '<label>'+ $filter('translate')(message) +'</label>'
	        	+'</div>'
	        	+'</div>'
	        	+'<div class="modal-footer">'
	        	+'<button class="btn btn-primary btn-radius" ng-click="ok();" type="submit">'+$filter('translate')('common.BTN_CLOSE')+'</button>'
	        	+'</div>'
	        	+'</div>'
				,controller:'PopupController'
	      });
	}
	$scope.idmUrl = app.idmUrl;
	$scope.openProfile = function(){
		$location.path('/app/profile/');
	}
	$scope.openMyCourse = function(){
		window.location = app.cmsWeb + '/#/courses/my-courses/?token='+ $localStorage.jwt;
	}
	
	$scope.openInstructionPage = function(){
		window.location = app.cmsAdminUrl + '/#/teaching/home?token='+ $localStorage.jwt;
	}
	$scope.keyword = "";
	$scope.globalSearch = function(keyword){
		UserSearchFactory.search({keyword:keyword}, function(data){
			$scope.users = data;
			
			$location.path('/app/search');
		});
	}
	
	$scope.login = function (user) {
		if(!$rootScope.signedInUser){
			LoginFactory.login(user, function (data) {
				if(typeof data === "undefined" || data === ''){
					$scope.errorMsg = "Login failed";
				}else{
					console.log("service = "+$stateParams.service);
					if(typeof $stateParams.service !== "undefined" && $stateParams.service !== ''){
						if($stateParams.service.indexOf('?') == -1){
							window.location = decodeURIComponent($stateParams.service) + '?token='+data;
						}else{
							window.location = decodeURIComponent($stateParams.service) + '&token='+data;
						}
						
					}else{
						// For normal system should navigate to profile page
//						$scope.errorMsg = null;
//						$localStorage.jwt = data;
//						$rootScope.signedInUser = $localStorage.jwt && jwtHelper.decodeToken($localStorage.jwt);
						
						//$location.path('/app/profile/');
						
						// This navigation is customized for MOH
						window.location.href = app.homepage+ '?token='+data;;
					}
				}
				
		    });
		}
	};
	
	$scope.setLang = function(langKey) {
	  // Change the language during runtime
	  $translate.use(langKey);
	};
      
      $scope.homePage = function(){
    	  window.location.href = app.homepage;
      }
      ///////////////////////// Role checking /////////////////////////
      $rootScope.isSuperRole = function(aRole){
    	  if(typeof aRole !== "undefined" && typeof aRole.roleName !== "undefined"){
			  return (aRole.roleName == 'ADMIN')
		  }
    	  if($scope.signedInUser){
    		  if($scope.signedInUser.ROLES){
    			  var roles = JSON.parse($scope.signedInUser.ROLES);
    			  for(var i=0; i<roles.length;i++){
    				  var roleObj = roles[i];
    				  if(roleObj.roleName == 'ADMIN'){
    					  return true;
    				  }
    			  }
    		  }
    	  }
    	  return false;
      }
      $scope.isSuperRole = $rootScope.isSuperRole;
      
      $rootScope.isSystemRole = function(aRole){
    	  if(typeof aRole !== "undefined" && typeof aRole.roleName !== "undefined"){
			  return (aRole.roleType == 0 || aRole.roleType == "0");
		  }
    	  if($scope.signedInUser){
    		  if($scope.signedInUser.ROLES){
    			  var roles = JSON.parse($scope.signedInUser.ROLES);
    			  for(var i=0; i<roles.length;i++){
    				  var roleObj = roles[i];
    				  if(roleObj.roleType == 0 || roleObj.roleType == "0"){
    					  return true;
    				  }
    			  }
    		  }
    	  }
    	  return false;
      }
      $scope.isSystemRole = $rootScope.isSystemRole;
      
      $rootScope.hasRole = function(r){
    	  if($scope.signedInUser){
    		  if($scope.signedInUser.ROLES){
    			  var roles = JSON.parse($scope.signedInUser.ROLES);
    			  for(var i=0; i<roles.length;i++){
    				  var roleObj = roles[i];
    				  if(roleObj.roleName == r){
    					  return true;
    				  }
    			  }
    		  }
    	  }
    	  return false;
      }
      $scope.hasRole = $rootScope.hasRole;
      
      $rootScope.getRoleNames = function(r){
    	  var ret  = '';
		  if($scope.signedInUser.ROLES){
			  var roles = JSON.parse($scope.signedInUser.ROLES);
			  for(var i=0; i<roles.length;i++){
				  var roleObj = roles[i];
				  if(roleObj.roleName){
					  ret += roleObj.roleName + ' ';
				  }
			  }
		  }
    	  return ret;
      }
      $scope.getRoleNames = $rootScope.getRoleNames;
      
      $rootScope.isSystemFunction = function(aFunction){
    	  if(typeof aFunction !== "undefined" &&  typeof aFunction.functionType !== "undefined"){
			  return (aFunction.functionType == 0 || aFunction.functionType == "0");
		  }
    	  if($scope.signedInUser){
    		  if($scope.signedInUser.FUNCS){
    			  var funcs = JSON.parse($scope.signedInUser.FUNCS);
    			  for(var i=0; i<funcs.length;i++){
    				  var funcObj = funcs[i];
    				  if(funcObj.functionType == 0 || funcObj.functionType == "0"){
    					  return true;
    				  }
    			  }
    		  }
    	  }
    	  return false;
      }
      $scope.isSystemFunction = $rootScope.isSystemFunction;
      
      $rootScope.checkPrivilege = function(funcName){
    	  if($scope.signedInUser){
    		  if($scope.isSuperRole()){
    			  return true;
    		  }
    		  if($scope.signedInUser.FUNCS){
    			  var funcs = JSON.parse($scope.signedInUser.FUNCS);
    			  for(var i=0; i<funcs.length;i++){
    				  var funcObj = funcs[i];
    				  if(funcObj.functionName == funcName){
    					  return true;
    				  }
    			  }
    		  }
    	  }
    	  return false;
      }  
      $scope.checkPrivilege = $rootScope.checkPrivilege;
      
      $localStorage.shoppingCart = [];
      $scope.addToCart = function(course){
    	  $localStorage.shoppingCart.push(course);
      }
      $scope.removeFromCart = function(course){
    	  var removeList = someArray.filter(function(c) {
    		    return c.courseId !== course.courseId;
    		});
    	  $localStorage.shoppingCart = removeList;
      }
      $scope.countCartItem = function(){
    	  return $localStorage.shoppingCart.length;
      }
}]);
controllers.controller('PopupController', ['$scope','$filter','$modalInstance','UserResetPasswordFactory',
	function ($scope,$filter, $modalInstance, UserResetPasswordFactory) {
	$scope.user = {};
	$scope.resetPasswd = function(){
		UserResetPasswordFactory.req($scope.user, function(d){
			$('#modal_message').text($filter('translate')('loginPage.RESET_PASSWORD_SUCCESS'));
			//alert($filter('translate')('loginPage.RESET_PASSWORD_SUCCESS'));
			//$scope.close();
		}, function(err){throw err});
	}
	$scope.close = function () {
		$modalInstance.dismiss('cancel');
		};
		$scope.ok = function () {
		    $modalInstance.close();
		};
}]);