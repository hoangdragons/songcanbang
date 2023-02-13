
//User detail (Edit, update) Controller
controllers.controller('UserSearchController', ['$scope',
                                                'UsersFactory','UserFactory','UserSearchFactory',
                                                'ImageUpload','RoleUpdateByUserFactory',
                                                'RoleSearchByUserService','RolesFactory',
                                                '$location','$http',
                                                '$stateParams','$resource','$localStorage', 'jwtHelper',
  function ( $scope, UsersFactory,UserFactory,UserSearchFactory, 
		  ImageUpload, RoleUpdateByUserFactory, RoleSearchByUserService, RolesFactory, 
  		$location, $http, $stateParams, $resource, $localStorage,jwtHelper) 
   {    
	userSearchObj.initialize($scope, $stateParams, 
			ImageUpload,
			UsersFactory, UserFactory, UserSearchFactory, 
			RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
			$location, false);
    }
]);

var userSearchObj = {
	imageUpload: null,
	initialize: function($scope, $stateParams, ImageUpload,
			UsersFactory, UserFactory, UserSearchFactory, 
			RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
			$location, isCreate){
		
		$scope.idmUrl = app.idmUrl;
		$scope.user = $scope.signedInUser;
		
		$scope.showProfile = function(user){
			user.sex = user.sex == 0? 'Female': 'Male';
			$scope.$parent.user = user;
			$location.path('/app/profile/' + user.fullName);
		}
	}	
}