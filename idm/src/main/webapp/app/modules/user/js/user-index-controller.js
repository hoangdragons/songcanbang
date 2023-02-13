controllers.controller('UserIndexController', ['$scope','$location',
    function ($scope,$location) {  
		$scope.userProfile = function(userId){
			$location.path('/app/user-detail/' + userId);
		};
		$scope.roleDef = function(){
			$location.path('/app/role-list');
		};
		$scope.functionDef = function(){
			$location.path('/app/function-list');
		};
        $scope.userMgmt = function () {
            $location.path('/app/user-list');
        };
    }]);