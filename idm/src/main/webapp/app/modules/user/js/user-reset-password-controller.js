controllers.controller('ResetPasswordConfirmController', ['$scope','$filter',
    'ResetPasswordConfirmFactory',
    '$location','$http',
    '$stateParams','$resource','$localStorage', 
	function ( $scope, $filter,
			ResetPasswordConfirmFactory, 
		$location, $http, $stateParams, $resource, $localStorage) 
	{        
			$scope.serverPath = app.idmUrl;
			$scope.user = {};
			
			ResetPasswordConfirmFactory.confirm({email: $stateParams.email, token: $stateParams.token}, function(data){
				$scope.success_message = "common.CONFIRM_USER_REGISTRATION_SUCCESS";
				alert($filter('translate')('loginPage.PASSWORD_RESET_TO_DEFAULT'));
				window.location.href=app.homepage;
			});
	}
]);