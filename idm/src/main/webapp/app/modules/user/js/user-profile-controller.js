
//User detail (Edit, update) Controller
controllers.controller('UserProfileController', ['$scope',
                                                'UsersFactory','UserFactory','UserSearchFactory',
                                                'ImageUpload','RoleUpdateByUserFactory',
                                                'RoleSearchByUserService','RolesFactory',
                                                '$location','$http',
                                                '$stateParams','$resource','$localStorage', 'jwtHelper',
  function ( $scope, UsersFactory,UserFactory,UserSearchFactory, 
		  ImageUpload, RoleUpdateByUserFactory, RoleSearchByUserService, RolesFactory, 
  		$location, $http, $stateParams, $resource, $localStorage,jwtHelper) 
  {    
	userProfileObj.initialize($scope, $stateParams, 
			ImageUpload,
			UsersFactory, UserFactory, UserSearchFactory, 
			RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
			$location, false);
    }]);

var userProfileObj = {
	imageUpload: null,
	initialize: function($scope, $stateParams, ImageUpload,
			UsersFactory, UserFactory, UserSearchFactory, 
			RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
			$location, isCreate){
		
		$scope.idmUrl = app.idmUrl;		
		if(typeof $stateParams.id === "undefined" || $stateParams.id == '' ){
			$scope.user = $scope.signedInUser;
		}
		$scope.userDetail = function(){
			$location.path('/app/user-detail/' + $scope.signedInUser.jti);
		}
	}	
}