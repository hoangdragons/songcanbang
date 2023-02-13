controllers.controller('CategoryListController', ['$scope','$filter','$compile', 'CategoriesFactory','CategoryFactory','CategorySearchFactory', 
                                                  '$location', '$localStorage',
  function ($scope, $filter, $compile, CategoriesFactory, CategoryFactory, CategorySearchFactory,
		  $location, $localStorage) {
	 
    $scope.edit = function(cat) {
    	var categoryId = cat.categoryId;
       $location.path('/app/categoryDetail/' + categoryId);
    };
    var today = new Date();
    // callback for ng-click 'deleteUser':
    $scope.deleteCat = function (cat) {
      var confirm=window.confirm($filter('translate')('common.CONFIRM_DELETE') + cat.categoryName);
      if(!confirm) 
        return;
    	var categoryId = cat.categoryId;
        if (typeof(categoryId) !== "undefined") {
        	CategoryFactory.deleteCat({ id: categoryId }, function(dat){
            $scope.categories = CategoriesFactory.query();
          });       	
        }
        
    };

    // callback for ng-click 'createUser':
    $scope.create = function () {
        $location.path('/app/categoryCreate');
    };
    
    $scope.loadCoursesDetail = function (cat) {
    	var categoryId = cat.categoryId;
    	 if (typeof(categoryId) !== "undefined") {
    		 $location.path('/app/courseList/'+ categoryId);
         }
        
    };
    
    $scope.search = function (key) {
    	if(typeof(key) == 'undefined'){
    		key = $("#searchTxt").val();
    	}
    	 if(key == null ||key ==''){
    		 $scope.categories = CategoriesFactory.query();
    	 }else{
    		 $scope.categories = CategorySearchFactory.search({keyword:key},
	    		function (data){
    			 	// Using Session storage
    			 	var tmp = JSON.stringify(data);
    			 	if (typeof(Storage) != "undefined" && typeof(key) !== "undefined" && key !== "") {
    			 	   sessionStorage.setItem("DOLPHIN_CATEGORY_SEARCH_" + key, tmp);
			           $scope.loadStorage();
			         }
	    		}, function(err){
	    			$scope.errorMessage = err.statusText;
	    			console.log(err);
	    		});
    	 }
         $scope.gridOptions.data = $scope.categories;
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
      // Using session storage
	  sessionStorage.removeItem(searchId);
      $scope.loadStorage();
    };

    $scope.categories = CategoriesFactory.query();
    //$scope.loadStorage();
}]);// ENd of CateoryListController