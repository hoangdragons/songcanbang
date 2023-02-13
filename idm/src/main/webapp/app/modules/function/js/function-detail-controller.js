controllers.controller('FunctionDetailController', ['$scope',
                                                    'FunctionsFactory','FunctionFactory', 'FunctionSearchFactory',
                                                  '$location','$http',
                                                  '$stateParams','$resource','$localStorage', 
    function ( $scope, FunctionsFactory,FunctionFactory,FunctionSearchFactory, 
    		$location, $http, $stateParams, $resource, $localStorage) 
    {        
		functionDetailObj.initialize( $scope,
			FunctionsFactory,FunctionFactory, FunctionSearchFactory,
			$location, $http, $stateParams, $resource, $localStorage, false);
	}
]);

controllers.controller('FunctionCreateController', ['$scope',
                                                    'FunctionsFactory','FunctionFactory', 'FunctionSearchFactory', 
                                                    '$location','$http',
                                                    '$stateParams','$resource','$localStorage',
      function ($scope, 
    		  FunctionsFactory,FunctionFactory,FunctionSearchFactory, 
      		$location, $http, $stateParams, $resource, $localStorage) 
      {   
		functionDetailObj.initialize( $scope,
				FunctionsFactory,FunctionFactory, FunctionSearchFactory,
				$location, $http, $stateParams, $resource, $localStorage,true);

  	  }
  ]);

var functionDetailObj = {
		initialize: function ( $scope,
			FunctionsFactory,FunctionFactory, FunctionSearchFactory,
			$location, $http, $stateParams, $resource, $localStorage, isCreate)
			{
				$scope.serverPath = app.idmUrl;
				if(isCreate){
					$scope.func = {};
				}
			/*	$scope.toggleSysFunc = function(){
					if($scope.isSystemFunc){
						$scope.isSystemFunc = false;
					}else{
						$scope.isSystemFunc = true;
					}
				};*/
			    $scope.insertOrUpdate = function () {    
			    	if($scope.isSystemFunc){
			    		$scope.func.functionType = 0;
			    	}else{
			    		$scope.func.functionType = 1;
			    	}
			    	if(isCreate){
			    		FunctionsFactory.create($scope.func,function(data){
			    			$scope.func = data;
			    			$location.path('/function-list');
			    		});
			    	}else{
			    		FunctionsFactory.update($scope.func,function(data){
			    			$location.path('/function-list');
			    		});
			    	}   
			        
			    };
			    $scope.cancel = function () {
			        $location.path('/function-list');
			    };
			    
			    if(!isCreate){
			    	$scope.func = FunctionFactory.show({id: $stateParams.id}, function(data){
			    		if(data.functionType == 0){
			    			$scope.isSystemFunc = true;
				    	}else{
				    		$scope.isSystemFunc = false;
				    	}
			    	});
			    }
			}
	}