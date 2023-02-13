//////////////////////////////////////////////////////////////
// Course controller
controllers.controller('CourseListController', ['$scope','$injector','$filter', '$compile','$stateParams',
                                                'CategoriesFactory','CategoryFactory', 
                                                'CoursesFactory','CourseFactory','CourseSearchFactory',
                                                'CourseSearchByCatFactory','$location',
  function ($scope, $injector, $filter, $compile,$stateParams, 
		  CategoriesFactory,CategoryFactory, 
		  CoursesFactory, CourseFactory, CourseSearchFactory, CourseSearchByCatFactory, 
		  $location) {  
	$scope.previewVideo = function(course){
    if(typeof course.videoUrl !== "undefined" && course.videoUrl != ""){    
      $injector.get('$modal').open({
        template: 
           '<div style="text-align:center;vertical-align:middle;height:auto;width:auto">'
          + '<div class="modal-header">'
          + '<h4 class="modal-title" id="myModalLabel">' + $filter('translate')('common.PREVIEW') +'</h4>'
          + '</div>'
          + '<video width="550" height="350" controls poster="http://rc.songcanbang.org/images/video.jpg" >'
          + '<source src="'+ course.videoUrl +'" type="video/mp4">'
          + 'Your browser doesnt support HTML5 video tag.'
          +'</video><div>',
      });
    }
  }
	$scope.edit = function(course) {
    	var courseId = course.courseId;
       $location.path('/app/courseDetail/' + courseId);
    };
    var today = new Date();
    // callback for ng-click 'deleteUser':
    $scope.deleteCourse = function (course) {
      var confirm=window.confirm($filter('translate')('common.CONFIRM_DELETE') + course.title);
      if(!confirm) 
        return;
    	var courseId = course.courseId;
        if (typeof(courseId) !== "undefined") {
        	CourseFactory.deleteCourse({ id: courseId }, function(dat){
            $scope.searchBySelectedCat();
          });
        }
    };

    // callback for ng-click 'createUser':
    $scope.create = function () {
    	if(typeof $scope.choices.category != "undefined" && typeof $scope.choices.category.categoryId !== 'undefined'){
    		$location.path('/app/courseCreation/' + $scope.choices.category.categoryId);
    	}else{
    		$location.path('/app/courseCreation/1');
    	}
        
    };
    
    $scope.backToCategoryList = function(){
    	$location.path('/app/categoryList');
    }
    
    $scope.searchBySelectedCat = function(){
      var categoryId = $scope.choices.category.categoryId;
      if(typeof categoryId !="undefined" && categoryId != null && categoryId != ""){
        CourseSearchByCatFactory.search({keyword:categoryId},
          function (d){
            $scope.courses = d;
          }, function(err){
            $scope.errorMessage = err.statusText;
            console.log(err);
          }
         );
      }else{
        $scope.courses = CoursesFactory.query();
      }
    }
    $scope.choices = {};
    
    if(typeof $stateParams.catId !="undefined" && $stateParams.catId != null && $stateParams.catId != ""){
      $scope.choices.category = CategoryFactory.get({id:$stateParams.catId},
          function(data){
            $scope.searchBySelectedCat();
      });
      
    }else{
      $scope.courses = CoursesFactory.query();
    }
    
    $scope.categories = CategoriesFactory.query();
}]);