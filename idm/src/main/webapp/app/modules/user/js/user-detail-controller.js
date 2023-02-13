
//User detail (Edit, update) Controller
controllers.controller('UserDetailController', ['$scope',
                                                'UsersFactory','UserFactory','UserSearchFactory',
                                                'ImageUpload','RoleUpdateByUserFactory',
                                                'RoleSearchByUserService','RolesFactory',
                                                '$location','$http',
                                                '$stateParams','$resource','$localStorage', 'jwtHelper',
  function ( $scope, UsersFactory,UserFactory,UserSearchFactory, 
		  ImageUpload, RoleUpdateByUserFactory, RoleSearchByUserService, RolesFactory, 
  		$location, $http, $stateParams, $resource, $localStorage,jwtHelper) 
  {    
	userDetailObj.initialize($scope, $stateParams, 
			ImageUpload,
			UsersFactory, UserFactory, UserSearchFactory, 
			RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
			$location, false);
    }]);

controllers.controller('UserCreationController', ['$scope','$stateParams','ImageUpload',
                                                  'UsersFactory','UserFactory','UserSearchFactory', 
                                                  'RoleUpdateByUserFactory','RoleSearchByUserService','RolesFactory',
                                                  '$location',
    function ($scope, $stateParams, ImageUpload,
    		UsersFactory, UserFactory, UserSearchFactory, 
    		RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
    		$location) {
		userDetailObj.initialize($scope, $stateParams, ImageUpload,
			UsersFactory, UserFactory, UserSearchFactory, 
			RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
			$location, true);
}]);

var userDetailObj = {
	imageUpload: null,
	initialize: function($scope, $stateParams, ImageUpload,
			UsersFactory, UserFactory, UserSearchFactory, 
			RoleUpdateByUserFactory, RoleSearchByUserService,RolesFactory,
			$location, isCreate){
		
		$scope.tab1Title = 'user.BASIC_INFO_TITLE';
	    $scope.tab2Title = 'user.ROLE_INFO';
	    $scope.tab3Title = 'user.ORDER_HISTORY_INFO';
	    userDetailObj.imageUpload = ImageUpload;
	    $scope.insertOrUpdate = function () {    
	    	if($scope.user.sex){// male = 1, female = 0
	    		$scope.user.sex = 1;
	    	}else{
	    		$scope.user.sex = 0;
	    	}
	    	if(isCreate){
	    		UsersFactory.create($scope.user,function(data){
	    			$scope.updateRoleInfo();
	    			$location.path('/user-list');
	    		});
	    	}else{
	    		UsersFactory.update($scope.user,function(data){
	    			$scope.updateRoleInfo();
	    			$location.path('/user-list');
	    		});
	    	}   
	        
	    };
	    $scope.updateRoleInfo = function(){
	    	var rList = [];
	        $('#rightValues option').each(function(i, item){
	        		var txt = item.text;
	        		var val = item.value;
	        		rList[i] = {"roleName": txt , "roleId":val};
	        	});
	       
	        var data = {
	        		"user":$scope.user,
	        		"roleList":rList
	        }
	        RoleUpdateByUserFactory.updateByUser(data, 
		        function(data){
		        	$location.path('/user-list');
		        },
		        function(err){
		        	console.info(err);
		        }
	        );
	    }
	    
	    $scope.cancel = function () {
	        $location.path('/user-list');
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
	    $scope.availableRoleList = RolesFactory.query();
	    $scope.modAvailableRoleList = [];
	    
	    /**
	     * Change user avata and upload to server
	     */
	    $scope.newAvataUrl = "";
	    $scope.updateUserAvata = function(s){
	    	$scope.user.avataUrl = s;
	    }
	    $scope.changeAvata =  function(input, targetImg){
			if (input.files && input.files[0]) {
		        var r = new FileReader();
		        r.onload = function (e) {
		            $('#'+ targetImg)
		                .attr('src', e.target.result)
		                .width(200)
		                .height(200);
		        };

		        r.readAsDataURL(input.files[0]);
		        // Upload data 
		        var fdata = new FormData();
		        fdata.append("file", input.files[0]);
		        ImageUpload.upload(fdata).$promise.then(function(response){
		             //successful
		        	console.log('Upload Success');
		        	$scope.user.avataUrl = app.resourceBaseUrl + "/images/" + input.files[0].name;
		        },function(error){
		        	console.log('Upload Error');
		            //error
		        });
		        
			}
		};
	    if(!isCreate){
	    	var userId = $stateParams.id
	    	$scope.user = UserFactory.show({id: userId},
	        	function(data){
	        		if(typeof data.avataUrl === "undefined" || data.avataUrl == null
	        				|| data.avataUrl == ''){
	        			data.avataUrl = app.resourceBaseUrl + '/images/person.png';
	        		}
	        		if(data.sex == 0){
	        			data.sex = false;
	        		}else{
	        			data.sex = true;
	        		}
	        	}
	        );
	       
	        $scope.userRoles = [];
	        $scope.userRoleList = RoleSearchByUserService.search({uId: $stateParams.id},
	        		function(data){
	        			$scope.userRoles = data;
	        		}
	        );
	    }else{
	    	$scope.userRoles = [];
	    	$scope.user = new Object();
	    }
	}
}