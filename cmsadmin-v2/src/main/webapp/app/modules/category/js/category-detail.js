controllers.controller('CategoryDetailController', ['$scope', '$stateParams', 'CategoryFactory','CategoriesFactory', '$location',
    function ($scope, $stateParams, CategoryFactory, CategoriesFactory, $location) {
		$scope.changeUpload =  function(input){
            if (input.files && input.files[0]) {
                var r = new FileReader();
                r.onload = function (e) {
                    $scope.uploadImage(input.files[0]);
                    $scope.category.image = app.resourceBaseUrl + "/images/" + input.files[0].name;
                };
               r.readAsDataURL(input.files[0]);
            }
        };
	    // callback for ng-click 'insertOrUpdate':
		$scope.insertOrUpdate = function () {
            window.ignoreDC = true;
            CategoriesFactory.update($scope.category,
            		function(data){
            			$location.path('/app/categoryList');
            		});
        };

        // callback for ng-click 'cancel':
        $scope.cancel = function () {
            window.ignoreDC = true;
            $location.path('/app/categoryList');
        };
        
        $scope.category = CategoryFactory.show({id: $stateParams.id});
    }]);

controllers.controller('CategoryCreationController', ['$scope', 'CategoriesFactory', '$location', '$localStorage',
    function ($scope, CategoriesFactory, $location, $localStorage) {
        $scope.category = {};
        $scope.changeUpload =  function(input){
            if (input.files && input.files[0]) {
                var r = new FileReader();
                r.onload = function (e) {
                    $scope.uploadImage(input.files[0]);
                    $scope.category.image = app.resourceBaseUrl + "/images/" + input.files[0].name;
                };
               r.readAsDataURL(input.files[0]);
            }
        };
        // callback for ng-click 'createNewUser':
        $scope.insertOrUpdate = function () {
            window.ignoreDC = true;
            CategoriesFactory.create($scope.category, function(data){
            	$location.path('/app/categoryList');
            });
        };
        // callback for ng-click 'cancel':
        $scope.cancel = function () {
            window.ignoreDC = true;
            $location.path('/app/categoryList');
        };
    }]);
