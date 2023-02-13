//////////////////////////////////////////////////////////////
// Course controller
controllers.controller('TeachingHomeController', ['$scope','$injector','$filter', '$compile','$stateParams',
                                                'CategoriesFactory','CategoryFactory', 
                                                'CoursesFactory','CourseFactory','CourseSearchFactory',
                                                'CourseSearchByCatFactory','GenericCourseService',
                                                '$location',
  function ($scope, $injector, $filter, $compile,$stateParams, 
		  CategoriesFactory,CategoryFactory, 
		  CoursesFactory, CourseFactory, CourseSearchFactory, CourseSearchByCatFactory, GenericCourseService,
		  $location) {  
	$scope.$parent.showLogo = true;
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
       $location.path('/teaching/course-detail/' + courseId);
    };
    // callback for ng-click 'deleteUser':
//    $scope.deleteCourse = function (course) {
//      var confirm=window.confirm($filter('translate')('common.CONFIRM_DELETE') + course.title);
//      if(!confirm) 
//        return;
//    	var courseId = course.courseId;
//        if (typeof(courseId) !== "undefined") {
//        	CourseFactory.deleteCourse({ id: courseId }, function(dat){
//            $scope.searchBySelectedCat();
//          });
//        }
//    };

//    // callback for ng-click 'createUser':
//    $scope.create = function () {
//    	if(typeof $scope.choices.category != "undefined" && typeof $scope.choices.category.categoryId !== 'undefined'){
//    		$location.path('/teaching/courseCreation/' + $scope.choices.category.categoryId);
//    	}else{
//    		$location.path('/teaching/courseCreation/1');
//    	}
//        
//    };
    
    $scope.doSearch = function(){
    	if(typeof $scope.courses !== "undefined" && $scope.courses.length >0){
    		var txt = $scope.searchText;
    		var searchData = [];
    		if(txt == undefined || txt =="" || txt == null){
    			$scope.courses = GenericCourseService.findTeachingCourses.query({loginId: $scope.$parent.signedInUser.jti});
    			return;
    		}
    		for(idx in $scope.courses_backup){
    			var c = $scope.courses[idx];
    			var ret = typeof c !== "undefined" && typeof c.content !== "undefined" && c.content.indexOf(txt) != -1;
    			ret = ret || (typeof c !== "undefined" && typeof c.title !== "undefined" && c.title.indexOf(txt) != -1);
    			ret = ret || (typeof c !== "undefined" && typeof c.imageUrl !== "undefined" && c.imageUrl.indexOf(txt) != -1);
    			
    			if(ret){
    				searchData.push(c);
    			}
    		}
    		$scope.courses = searchData;
    	}
    	
    }
    $scope.backToCategoryList = function(){
    	$location.path('/teaching/home');
    }
    
    $scope.categories = CategoriesFactory.query();
    $scope.courses = GenericCourseService.findTeachingCourses.query(
    		function(){
    			$scope.courses_backup = $scope.courses;
    });
    $scope.listHelperCourse = [];
    if($scope.isSuperRole()){
    	GenericCourseService.loadHelperCourse.query(function(dat){
    		console.log('helper course length: '+dat.length);
    	});
    }
    
}]);