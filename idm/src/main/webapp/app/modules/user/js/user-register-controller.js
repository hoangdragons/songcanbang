controllers.controller('UserRegisterController', ['$scope','$filter',
                                                  'UserRegisterFactory','UserSearchEmailFactory','UserSearchLoginNameFactory',
                                                  '$location','$http',
                                                  '$stateParams','$resource','$localStorage', 
    function ( $scope, $filter,
    		UserRegisterFactory, UserSearchEmailFactory, UserSearchLoginNameFactory,
    		$location, $http, $stateParams, $resource, $localStorage) 
    {        
	userRegDetailObj.initialize( $scope,
			UserRegisterFactory, 
				$location, $http, $stateParams, $resource, $localStorage, true);
	}
]);

var userRegDetailObj = {
		initialize: function ( $scope,$filter,
				UserRegisterFactory,  UserSearchEmailFactory, UserSearchLoginNameFactory,
			$location, $http, $stateParams, $resource, $localStorage, isCreate)
			{
				$scope.serverPath = app.idmUrl;
				$scope.user = {};
				var w1 = UserSearchEmailFactory.search($scope.user.email);
				w1.$promise.then(function(d){
					if(typeof d.loginName == "undefined"){
						var w2 = UserSearchLoginNameFactory.search({loginName:$scope.user.loginName});
						w2.$then(function(e){
							if(typeof d.loginName == "undefined"){
								$scope.insertOrUpdate = function () {   
									// Original
							    	UserRegisterFactory.register($scope.user,function(data){
						    			$scope.success_message = "common.REGISTER_USER_SUCCESS";
						    			$scope.user = data;
						    			$scope.message = "User registration successfully!";
//						    			$location.path('/user-detail/' + data.userId);
						    		});
							    	// END original
							    };
							}else{
								alert($filter('translate')('register.LOGIN_NAME_EXIST'));
								return;
							}
						})
					}else{
						alert($filter('translate')('register.EMAIL_EXIST'));
						return;
					}
				})
			}
	}

controllers.controller('RegisterConfirmController', ['$scope','$filter',
    'RegisterConfirmFactory',
    '$location','$http',
    '$stateParams','$resource','$localStorage', 
	function ( $scope, $filter,
		RegisterConfirmFactory, 
		$location, $http, $stateParams, $resource, $localStorage) 
	{        
			$scope.serverPath = app.idmUrl;
			$scope.user = {};
			
			RegisterConfirmFactory.confirm({email: $stateParams.email, token: $stateParams.token}, function(data){
				$scope.showModalMessage(
						$filter('translate')("common.INFO"),
						$filter('translate')("common.CONFIRM_USER_REGISTRATION_SUCCESS"), 
						false);
				$location.path('/login?service=' + app.homepage);
			});
	}
]);