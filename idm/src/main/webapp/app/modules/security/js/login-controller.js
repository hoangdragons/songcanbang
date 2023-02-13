
controllers.controller('LoginController', ['$scope','$injector','$filter','LoginFactory','LogoutFactory','UserRegisterFactory','$location','$http'
                                           ,'$stateParams','$resource','$localStorage', 'jwtHelper',
    function ( $scope,$injector,$filter, LoginFactory,LogoutFactory,UserRegisterFactory, $location, $http, $stateParams, $resource, $localStorage,jwtHelper) {
	    // MOVED ALL METHOD TO COMMON CONTROLLER
//		if($localStorage.jwt != null 
//				&& typeof $localStorage.jwt !== "undefined" 
//					&& $localStorage.jwt !== "undefined"
//						&& $localStorage.jwt !== ''){
//			if( typeof jwtHelper.decodeToken($localStorage.jwt) !== "undefined"){
//				if(typeof $stateParams.service !== "undefined" && $stateParams.service !== ''){
//     				if($stateParams.service.indexOf('?') !== -1){
//     					window.location = decodeURIComponent($stateParams.service + '&token=')+$localStorage.jwt;
//     				}else{
//     					window.location = decodeURIComponent($stateParams.service + '?token=')+$localStorage.jwt;
//     				}
//     			}else{
//     				window.location = app.homepage;
//     			}
//			}
//		};
		$scope.lostPassword = function(queue){
			 $scope.modal = $injector.get('$modal').open({
		        template: 
		        	'<div style="text-align:center;vertical-align:middle;height:auto;width:auto">'
 			        +'<div class="modal-header">'
 			        +'<h4 class="modal-title" id="myModalLabel">' + $filter('translate')('loginPage.RESET_PASSWORD') +'</h4>'
 			        +'</div>'
		        	+'<div class="modal-body">'
		        	+'<div class="col-sm-12" id="modal_message"></div>'
		        	+'<div class="col-sm-12">'
		        	+'<input type="text" ng-model="user.email" class="form-control" placeholder="'+$filter('translate')('loginPage.EMAIL_PLACE_HOLDER')+'">'
		        	+'<h6 class="note"><i class="ion-android-mail"></i>'+
		        	$filter('translate')('loginPage.EMAIL_COMMENT')+'</h6>'
		        	+'</div>'
		        	+'</div>'
		        	+'<div class="modal-footer">'
		        	+'<button type="button" class="btn btn-primary" ng-click="resetPasswd()">'+$filter('translate')('common.SEND')+'</button>'
		        	+'<button class="btn btn-primary btn-radius" ng-click="ok();" type="submit">'+$filter('translate')('common.BTN_CLOSE')+'</button>'
		        	+'</div>'
		        	+'</div>'
					,controller:'PopupController'
 		      });
		}
        $scope.register = function(){
        	$location.path('/app/user-register');
        };
    }]);