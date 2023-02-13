controllers.controller('UserListController', ['$scope','$filter',
                                                  'UsersFactory','UserFactory','UserSearchFactory','UserPaginationFactory',
                                                  'UserCountFactory',
                                                  '$location','$http',
                                                  '$stateParams','$resource','$localStorage', 'jwtHelper',
    function ( $scope,$filter, UsersFactory,UserFactory,UserSearchFactory, UserPaginationFactory,UserCountFactory,
    		$location, $http, $stateParams, $resource, $localStorage,jwtHelper) 
    {   
		
	    $scope.edit = function(user) {
	    	$location.path('/app/user-detail/' + user.userId);
	    };
	    $scope.deleteUser = function (user) {
	    	if(!window.confirm($filter('translate')('common.CONFIRM_DELETE') + user.fullName )){
	    		return;
	    	}
        	UserFactory.deleteUser({ id: user.userId });
	        $scope.users = UsersFactory.query();
	    };

	    // callback for ng-click 'createUser':
	    $scope.create = function () {
	        $location.path('/app/user-create');
	    };
	    
	    $scope.search = function (key) {
	    	$(".history-panel").css('display','block');
	    	
	    };
	    // Load all search data store in localStorage.
	    $scope.loadStorage = function(){
	    	// Empty list
	    	$("#historySearchLink").empty();    	
	    	var j = 0;    
	        // Using session storage
	        for (var i = 0; i < sessionStorage.length; i++){
	            var k = sessionStorage.key(i);
	            var displayKey = k.substring(24);
	            if(k != null & k.indexOf("DOLPHIN_CATEGORY_SEARCH_") !== -1){
	          	 var cellClass = (j %2 == 0 )? "history-cell-even" : "history-cell-odd";
	          	 var htmlContent = 
	          		$compile(
	   	            		"<span class='"+cellClass+"' style='width:250px !important'>" 
	   	            		+ "<a class=\"search-storage\" ng-click=\"loadSearchHistory('"+k+"')\" >"+displayKey+"</a>"
	   	            		+ "<button class=\"scb-del-storage-icon-btn\" ng-click=\"deleteStorage('"+k+"')\"><span style=\"color:red\"class=\"glyphicon glyphicon-trash\"></button>"
	   	            		+ "</span>"
	   	            		)($scope); 
	              $("#historySearchLink").append(htmlContent);
	              j++;
	            }
	          }
	    };   
	    $scope.deleteStorage = function (searchId) {    
	      // Using session storage
		  sessionStorage.removeItem(searchId);
	      $scope.loadStorage();
	    };
	    $scope.loadSearchHistory = function(id){
		  // Using sessionStorage
		  for (var i = 0; i < sessionStorage.length; i++){
		      var k = sessionStorage.key(i);
		      if(k == id){
		    	  $scope.gridOptions.data = JSON.parse(sessionStorage.getItem(k));
		      }
	  	  }
	    }
	    // Using session storage
	    $scope.loadSearchFromSessionStorage = function(id){
	    	$scope.gridOptions.data = sessionStorage.getObj(k);
	    }
	    
	    //========================== PAGING function =============================================//
	    $scope.move2FirstPage = function(){
	    	// set offset = 0
	    	$scope.pageInfo.offset = 1;
	    	$scope.loadUserWithPaging();
	    }
	    
	    $scope.move2PrevPage = function(){
	    	if(parseInt($scope.pageInfo.offset) - parseInt($scope.pageInfo.limit.id) > 0){
	    		$scope.pageInfo.offset = parseInt($scope.pageInfo.offset) - parseInt($scope.pageInfo.limit.id);
	    	}else{
	    		$scope.pageInfo.offset = 1;
	    	}
	    	$scope.loadUserWithPaging();
	    }
	   
	    $scope.move2NextPage = function(){
	    	if(parseInt($scope.pageInfo.offset) + parseInt($scope.pageInfo.limit.id) < $scope.totalRow.count){
	    		$scope.pageInfo.offset = parseInt($scope.pageInfo.offset) + parseInt($scope.pageInfo.limit.id);
	    	}else{
	    		$scope.pageInfo.offset = $scope.totalRow.count;
	    	}

	    	$scope.loadUserWithPaging();
	    }
	    $scope.move2LastPage = function(){
	    	$scope.pageInfo.offset = $scope.totalRow.count;
	    	$scope.pageInfo.limit.id = $scope.pageInfo.limit.value = $scope.totalRow.count;
	    	$scope.loadUserWithPaging();
	    }
	    
	    $scope.calculateLastRow = function(){
	    	if($scope.totalRow.count == $scope.pageInfo.offset
	    			|| ((parseInt($scope.pageInfo.offset) + parseInt($scope.pageInfo.limit.id)) > $scope.totalRow.count)){
	    		$scope.pageInfo.lastRow = $scope.totalRow.count; 
	    	}else{
	    		$scope.pageInfo.lastRow = parseInt($scope.pageInfo.offset) + parseInt($scope.pageInfo.limit.id);
	    	}
	    }
	    
	    $scope.loadUserWithPaging = function(){
	    	$scope.pageInfo.offset = ($scope.pageInfo.offset <= 1)?1 
	    			: $scope.pageInfo.offset < $scope.totalRow.count? $scope.pageInfo.offset:$scope.totalRow.count;
	    	$scope.calculateLastRow();
	    	$scope.users = UserPaginationFactory.search({limit:$scope.pageInfo.limit.id, offset:($scope.pageInfo.offset <= 0)?0:$scope.pageInfo.offset});
	    };
	    $scope.totalRow = UserCountFactory.count();
	    $scope.pageInfo = {};
	    $scope.pageInfo.rowPerPageList =  [{id:5, value:5},{id:10,value:10},{id:15,value:15},{id:20,value:20},{id:50,value:50},{id:-1,value:"ALL"}];	    
	    $scope.pageInfo.limit = {id:5, value:5};
	    
	    // === DEFAULT offset
	    $scope.pageInfo.offset = 1;
	    
	    $scope.loadUserWithPaging();
	    //========================== END OF PAGING function =============================================//	    
	    $scope.loadStorage();
	    $scope.serverPath = app.idmUrl;
	}
]);