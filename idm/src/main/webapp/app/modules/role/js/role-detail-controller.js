controllers.controller('RoleDetailController', ['$scope',
                                                  'RolesFactory','RoleFactory','RoleSearchFactory',
                                                  'FunctionsFactory','FunctionSearchByRoleService','FunctionUpdateByRoleFactory',
                                                  '$location','$http',
                                                  '$stateParams','$resource','$localStorage', 'jwtHelper',
    function ( $scope, 
    		RolesFactory,RoleFactory,RoleSearchFactory, 
    		FunctionsFactory,FunctionSearchByRoleService,FunctionUpdateByRoleFactory,
    		$location, $http, $stateParams, $resource, $localStorage,jwtHelper) 
    { 
	roleDetailObj.initialize( $scope, 
				RolesFactory,RoleFactory,RoleSearchFactory, 
				FunctionsFactory,FunctionSearchByRoleService,FunctionUpdateByRoleFactory,
	  		$location, $http, $stateParams, $resource, $localStorage,jwtHelper, false);
	}
]);

controllers.controller('RoleCreateController', ['$scope',
                                                'RolesFactory','RoleFactory','RoleSearchFactory',
                                                'FunctionsFactory','FunctionSearchByRoleService','FunctionUpdateByRoleFactory',
                                                '$location','$http',
                                                '$stateParams','$resource','$localStorage', 'jwtHelper',
  function ( $scope, RolesFactory,RoleFactory,RoleSearchFactory, 
		  FunctionsFactory,FunctionSearchByRoleService,FunctionUpdateByRoleFactory,
  		$location, $http, $stateParams, $resource, $localStorage,jwtHelper) 
  { 
	roleDetailObj.initialize( $scope, 
				RolesFactory,RoleFactory,RoleSearchFactory, 
				FunctionsFactory,FunctionSearchByRoleService,FunctionUpdateByRoleFactory,
	  		$location, $http, $stateParams, $resource, $localStorage,jwtHelper, true);
	}
]);

var roleDetailObj = {
	initialize: function ( $scope, RolesFactory,RoleFactory,RoleSearchFactory, 
		FunctionsFactory,FunctionSearchByRoleService,FunctionUpdateByRoleFactory,
		$location, $http, $stateParams, $resource, $localStorage,jwtHelper, isCreate)
		{
			$scope.serverPath = app.idmUrl;
			$scope.tab1Title = 'role.BASIC_INFO';
			$scope.tab2Title = 'role.MAPPING_INFO';
			if(isCreate){
				$scope.role = {};
			}
			$scope.toggleSysRole = function(){
				if($scope.isSystemRole){
					$scope.isSystemRole = false;
				}else{
					$scope.isSystemRole = true;
				}
			};
		    $scope.insertOrUpdate = function () {    
		    	if($scope.isSystemRole){
	    			$scope.role.roleType = 0;
	    		}else{
	    			$scope.role.roleType = 1;
	    		}
		    	if(isCreate){
		    		RolesFactory.create($scope.role,function(data){
		    			$scope.role = data;
		    			roleDetailObj.updateFunction($scope,FunctionUpdateByRoleFactory, $location);
		    		});
		    	}else{
		    		RolesFactory.update($scope.role,function(data){
		    			roleDetailObj.updateFunction($scope,FunctionUpdateByRoleFactory, $location);
		    		});
		    	}   
		        
		    };
		    $scope.cancel = function () {
		        $location.path('/role-list');
		    };
		    
		    $scope.revoke = function(){
				var selectedItem = $("#rightValues option:selected").clone();
				if($("#rightValues option[value='"+selectedItem[0].value+"']").length > 0){
					$("#rightValues option[value='"+selectedItem[0].value+"']").remove();
				}
			    
			}
		    $scope.grant = function(){
				var selectedItem = $("#leftValues option:selected").clone();
				if($("#rightValues option[value='"+selectedItem[0].value+"']").length <=0){
					$("#rightValues").append(selectedItem);
				}
			}
		    
		    $scope.availableFunctionList = FunctionsFactory.query();
		    $scope.modAvailableFunctionList = [];
		  
		    if(!isCreate){
		    	$scope.role = RoleFactory.show({id: $stateParams.id},
		    	function(data){
		    		if($scope.role.roleType == 0){
		    			$scope.isSystemRole = true;
		    		}else{
		    			$scope.isSystemRole = false;
		    		}
		    	});
		       
		        $scope.roleFunctions = [];
		        $scope.roleFunctionList = FunctionSearchByRoleService.search({uId: $stateParams.id},
		        		function(data){
		        			$scope.roleFunctions = data;
		        		}
		        );
		    }
		},
	updateFunction: function($scope, FunctionUpdateByRoleFactory, $location){
		var funcList = [];
	    $('#rightValues option').each(function(i, item){
	    		var txt = item.text;
	    		var val = item.value;
	    		funcList[i] = {"functionName": txt , "functionId":val};
	    	});
	   
	    var data = {
	    		"role":$scope.role,
	    		"functionList":funcList
	    }
	    FunctionUpdateByRoleFactory.updateByRole(data, function(data){
	    	$location.path('/role-list');
	    },
	    function(err){
	    	console.info(err);
	    });
	}
}