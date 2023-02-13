var controllers = angular.module('homepage.controllers', [
	                                                   /*'ui.router',
                                                       'oc.lazyLoad',
                                                       'uiGmapgoogle-maps',
                                                       'angular-jwt',
                                                       'ngFileUpload',
                                                       'ngStorage'*/
                                                       ]);
 

//////////////////////////////////////////////////////////////
// Common controller
//////////////////////////////////////////////////////////////
controllers.controller('HomepageController', 
	['$scope','$compile','$stateParams', '$translate','$location','$sce','$injector','$filter', 'CategoryFactory', 'CourseFactory', 'MagazineFactory','TeacherFactory',
  function ($scope, $compile, $stateParams, $translate, $location,$sce, $injector, $filter, CategoryFactory, CourseFactory, MagazineFactory,TeacherFactory) {
	$scope.topTenCourse = CourseFactory.query(function(data){
		console.log(data);
	});
	$scope.categories = CategoryFactory.query();
	$scope.topTenMagazine = MagazineFactory.query();
	$scope.topTenTeacher = TeacherFactory.query();
	$scope.setLang = function(langKey) {
	    // Change the language during runtime
	    $translate.use(langKey);
	};
	  $scope.loading = false;
	  $scope.scrollToElement = function(menu, ms){
		var speed = (ms) ? ms : 600;
		$('html,body').animate({
			scrollTop: $(menu).offset().top
		}, speed);
	  }
	  
	  $scope.goServices = function (){
		  window.location.href=app.cmsViewUrl;
	  } 
	  $scope.convertHtml = function(text) {
			return $sce.trustAsHtml(text);
		} 
	  $scope.login = function(){
		var url = encodeURIComponent($location.absUrl()) + "/courses/";
		window.location=app.idmUrl+ '/#/app/login?service='+ url;
	  }
	  $scope.searchKey = '';
	  
	  $scope.introVideoUrl = $sce.trustAsResourceUrl(app.baseUrl + '/assets/videos/new_intro.mov');
	  
	  $scope.searchCourse = function(){		  
		window.location.href=app.cmsViewUrl + '#/courses/search/' + $scope.searchKey;  
	  };
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
	  $scope.openCourse = function(courseId){
		  window.location.href= app.cmsViewUrl + "/#/courses/courseDetail/" +courseId; 
	  }
	  $scope.openCategory = function(cat)
	  {
		  window.location.href=app.cmsViewUrl + '/#/courses/courseList/' + cat.categoryId;
	  }
}]);
