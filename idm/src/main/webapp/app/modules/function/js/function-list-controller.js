controllers.controller('FunctionListController', ['$scope','$compile','$filter',
                                                  'FunctionsFactory','FunctionFactory','FunctionSearchFactory',
                                                  '$location','$http',
                                                  '$stateParams','$resource','$localStorage', 
    function ( $scope,$compile,$filter, FunctionsFactory,FunctionFactory,FunctionSearchFactory, 
    		$location, $http, $stateParams, $resource, $localStorage) 
    {        
	$scope.edit = function(row) {
    	var functionId = row.entity.functionId;
       $location.path('/function-detail/' + functionId);
    };
    $scope.deleteFunction = function (row) {
    	if(!window.confirm($filter('translate')('common.CONFIRM_DELETE') + row.entity.functionName )){
    		return;
    	}
    	var index = $scope.gridOptions.data.indexOf(row.entity);
    	var functionId = row.entity.functionId;
        if (index !== -1 && typeof(functionId) !== "undefined") {
        	FunctionFactory.deleteFunction({ id: functionId });
        	$scope.gridOptions.data.splice(index, 1);
        }
        $scope.functions = FunctionsFactory.query();
    };

    // callback for ng-click 'createRole':
    $scope.create = function () {
   		$location.path('/function-create');
        
    };
    
    $scope.search = function (key) {
    	if(typeof(key) == 'undefined'){
    		key = $("#searchTxt").val();
    	}
    	 if(key == null ||key ==''){
    		 $scope.functions = FunctionsFactory.query();
    	 }else{
    		 $scope.functions = FunctionSearchFactory.search({keyword:key},
	    		function (data){
    			 	// Using Session storage
    			 	var tmp = JSON.stringify(data);
    			 	if (typeof(Storage) != "undefined" && typeof(key) !== "undefined" && key !== "") {
    			 	   sessionStorage.setItem("DOLPHIN_FUNCTION_SEARCH_" + key, tmp);
			           $scope.loadStorage();
			         }
	    		}, function(err){
	    			$scope.errorMessage = err.statusText;
	    			console.log(err);
	    		});
    	 }
         $scope.gridOptions.data = $scope.functions;
    };
    // Load all search data store in localStorage.
    $scope.loadStorage = function(){
    	// Empty list
    	$("#historySearchLink").empty();    	
    	var j = 0;    
        // Using session storage
        for (var i = 0; i < sessionStorage.length; i++){
            var k = sessionStorage.key(i);
            var displayKey = k.substring("DOLPHIN_FUNCTION_SEARCH_".length);
            if(k != null & k.indexOf("DOLPHIN_FUNCTION_SEARCH_") !== -1){
          	 var cellClass = (j %2 == 0 )? "history-cell-even" : "history-cell-odd";
          	 var htmlContent = 
          		$compile(
  	            		"<span class='"+cellClass+"' style='width:250px !important;'>" 
  	            		+ "<a class=\"search-storage\" ng-click=\"loadSearchHistory('"+k+"')\" >"+displayKey+"</a>"
  	            		+ "<button class=\"scb-del-storage-icon-btn\" ng-click=\"deleteStorage('"+k+"')\"><span style=\"color:red\"class=\"glyphicon glyphicon-trash\"></span></button>"
  	            		+ "</span>"
  	            		)($scope)
  	            		; 
              $("#historySearchLink").append(htmlContent);
              j++;
            }
          }
    };   
    $scope.deleteStorage = function (searchId) {    
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
    var colActionHeaderCellTemplate                  = '<div style="margin-left:5px;margin-top:5px">{{"common.ACTION"|translate}}</div>';
    var colFunctionNameHeaderCellTemplate            = '<div style="margin-left:5px;margin-top:5px">{{"role.NAME"|translate}}</div>';
    var colFunctionDescriptionHeaderCellTemplate     = '<div style="margin-left:5px;margin-top:5px">{{"role.DESCRIPTION"|translate}}</div>';
    
    $scope.gridOptions = {
      enableFiltering: false,
      enableSorting: true,
      enablePinning: true,
      onRegisterApi: function(gridApi){
        $scope.gridApi = gridApi;      
      },
      columnDefs: 
      [
       /*Function Name*/
       { 
         name:'Name',
         field: 'functionName',
         pinnedLeft: true, 
         width: 300,
 		 enableHiding : false,
 		 enableColumnMenu: false,
 		 headerCellTemplate: colFunctionNameHeaderCellTemplate,
         visible: true,
 	      cellTemplate:  '<div class="ui-grid-cell-contents"><div style="float:left">{{COL_FIELD}}</div>'
       },
       /*Function Description*/
       { 
         name:'Description',
         field: 'description',
         pinnedLeft: true, 
         width: 300,
 		 enableHiding : false,
 		 enableColumnMenu: false,
 		 headerCellTemplate: colFunctionDescriptionHeaderCellTemplate,
         visible: true,
 	      cellTemplate:  '<div class="ui-grid-cell-contents"><div style="float:left">{{COL_FIELD}}</div>'
       },
       /*Action */
       { 
         name:'Action',
         field: 'userId',
         pinnedLeft: true, 
         width: 150,
 		 enableHiding : false,
 		 enableColumnMenu: false,
 		 headerCellTemplate: colActionHeaderCellTemplate,
         visible: true,
 	      cellTemplate:'<div class="ui-grid-cell-contents cell-align-center" >'
 	      +'<button class="scb-icon-btn" ng-click="grid.appScope.edit(row)">'
 	      +'<span style=\"color:blue\" class=\"glyphicon glyphicon-pencil\"></span></button>'
 	      +'<button class="scb-icon-btn" ng-click="grid.appScope.deleteFunction(row)">'
 	      +'<span style=\"color:red\" class=\"glyphicon glyphicon-trash\"></span></button></div>'
       }  
      ]
    };
   
    $scope.gridOptions.data = FunctionsFactory.query();
    $scope.loadStorage();	
}]);