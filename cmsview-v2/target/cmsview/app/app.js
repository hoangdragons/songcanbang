var dolphin = angular.module('dolphin', ['ui.router', 
                                         'ui.bootstrap', 
                                         'ngStorage', 
                                         'angular-jwt', 
                                         'dolphin.controller', 
                                         'ng-jwplayer', 
                                         'globalErrorHandlerModule',
                                         'pascalprecht.translate', 
                                         'ngAnimate', 
                                         'ngDragDrop',
                                         'ngSanitize', 
                                         'oc.lazyLoad',
                                         'chieffancypants.loadingBar',
                                         'duScroll',
                                         'sticky'
]);




dolphin.value('parentPage', {url: '/'});

dolphin.constant('contextPath', {
	
	cmsview: 'http://localhost:8080/cmsview',
	cmscore: 'http://localhost:8080/cmscore',
	cmsadmin: 'http://localhost:8080/cmsadmin',
	idm: 'http://accounts.songcanbang.org',

		
	
//	cmscore: 'http://web.songcanbang.org',
	/*
	 * cmsview: 'http://songcanbang.org/courses',
	 * cmsadmin: 'http://admin.songcanbang.org',
	idm: 'http://accounts.songcanbang.org'
	*/
});

dolphin.config(['$stateProvider', '$urlRouterProvider', 'contextPath','$locationProvider',
                function ($stateProvider, $urlRouterProvider, contextPath, $locationProvider){
	$stateProvider.state("courses", {
	        'abstract' : true,
	    	'url': "/courses",
	        'templateUrl': appHelper.componentView('layouts','template'),
	        'resolve': {
	          'resources': function($ocLazyLoad){
	            return $ocLazyLoad.load([
	              ASSETS.js('layouts','jquery.nicescroll.min'),
	              ASSETS.js('layouts','layouts'),
	              ASSETS.core.core,
	            ]);
	          },
	        }
	      	,'authenticate' : false
	      })

		.state('courses.courseList', {
	        url: '/courseList/:categoryId',
	        templateUrl: appHelper.componentView('course','courseList'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                 	ASSETS.css('course','courseList'),
	            ]);
	          },
	        },
	        authenticate : false,
	        controller: 'CourseListController'
	    })
	    .state('courses.search', {
	        url: '/search/:searchText',
	        templateUrl: appHelper.componentView('course','courseList'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                     ASSETS.css('course','courseList'),
	            ]);
	          },
	        },
	        authenticate : false,
	        controller: 'SearchCourseController'
	    })
	     .state('courses.cartDetail', {
	        url: '/cartDetail',
	        templateUrl: appHelper.componentView('course','shoppingCartDetail'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                     ASSETS.css('course','courseList'),
	            ]);
	          },
	        },
	        authenticate : false,
	        controller: 'ShoppingCartController'
	    })
	    .state('courses.courseDetail', {
	        url: '/courseDetail/:courseId',
	        templateUrl: appHelper.componentView('course','courseDetail'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                     ASSETS.css('course','courseDetail'),
	            ]);
	          },
	        },
	        authenticate : false,
	        controller: 'CourseDetailController'
	    })
	    .state('courses.customerDetail', {
	        url: '/customerDetail',
	        templateUrl: appHelper.componentView('customer','customerDetail'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                 	ASSETS.css('customer','customerDetail')
	            ]);
	          },
	        },
	        authenticate : true,
	        controller: 'CustomerDetailController'
	    })
	    .state('courses.learningCourse', {
	        url: '/learningCourse/:courseId',
	        templateUrl: appHelper.componentView('customer','learningCourse'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                 	ASSETS.css('customer','learningCourse')
	            ]);
	          },
	        },
	        authenticate : true,
	        controller: 'LearningCourseController'
	    })
	    .state('courses.myCourses', {
	        url: '/my-courses/:courseId',
	        templateUrl: appHelper.componentView('customer','my-courses'),
	        authenticate : true,
	        controller: 'MyCoursesController'
	    })
	    .state('courses.coursePayment', {
	        url: '/coursePayment/:courseId',
	        templateUrl: appHelper.componentView('payment','coursePayment'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                 	ASSETS.css('payment','coursePayment')
	            ]);
	          },
	        },
	        authenticate : true,
	        controller: 'CoursePaymentController'
	    })
		.state('courses.homepage', {
			url: '/homepage',
	        templateUrl: appHelper.componentView('homepage','homepage'),
	        resolve: {
	          resources: function($ocLazyLoad){
	            return $ocLazyLoad.load([
                 	ASSETS.css('homepage','homepage')
	            ]);
	          },
	        },
	        authenticate : false,
	        controller: 'HomepageController'
		});
	
		$locationProvider.html5Mode({
			enabled: false,
			requireBase: false
		});
	
//		$locationProvider.html5Mode({
//			enabled: true,
//			requireBase: false
//		});
		
//		$locationProvider.hashPrefix('!');
		
		$urlRouterProvider.otherwise("/courses/homepage");
		
}]);

dolphin.config(['$translateProvider', function($translateProvider){
	$translateProvider.useStaticFilesLoader({
		prefix: 'lang/',
		suffix: '.json'
	});
	$translateProvider.useSanitizeValueStrategy('escape');
	$translateProvider.preferredLanguage('vn_VI');
}]);

dolphin.run(['$rootScope','$state', '$location', '$localStorage', 'jwtHelper', 'contextPath', 
	function($rootScope, $state, $location, $localStorage, jwtHelper, contextPath) {
	$rootScope.$on('$stateChangeStart', function(e, to) {
	  	  var token = undefined;
	  	  var originUrl = undefined;
	  	  
	  	  if($location.absUrl().indexOf('?token=') != -1){
	  		token = $location.absUrl().split('?token=')[1];  
	  		originUrl = $location.absUrl().split('?')[0];
	  	  }else if($location.absUrl().indexOf('&token=') != -1){
	  		token = $location.absUrl().split('&token=')[1];  
	  		originUrl = $location.absUrl().split('&token=')[0];
	  	  }
	  	  
	  	  if(typeof token !== "undefined" && token !== ''){
	  		$localStorage.jwt = token;
	  		window.location = originUrl;
	  	  }
	  	  
	  	if ($localStorage.jwt && !jwtHelper.isTokenExpired($localStorage.jwt)) {
		  $rootScope.signedInUser = $localStorage.jwt && jwtHelper.decodeToken($localStorage.jwt);
		}else if($localStorage.jwt && jwtHelper.isTokenExpired($localStorage.jwt)){
			delete $localStorage.jwt;
		}
	  	
	  	if(to.authenticate && (typeof $rootScope.signedInUser === "undefined" || $rootScope.signedInUser == null))
	  	{
			window.location = contextPath.idm + '/#/app/login?service=' +  encodeURIComponent($location.absUrl());
		}else if($location.absUrl().indexOf('?shv=') !== -1 
					&& (typeof $rootScope.signedInUser === "undefined" || $rootScope.signedInUser == null)){
			window.location = contextPath.idm + '/#/app/login?service=' +  encodeURIComponent($location.absUrl());
		}
	  	
		//-- end of if login logout
		if (to.name !== "search") {
			$("#tl_search").val("");
			$("#tl_search").trigger('input');
		}
	});
}]);
dolphin.filter('range', function() {
  return function(input, total) {
    total = parseInt(total);

    for (var i=0; i<total; i++) {
      input.push(i);
    }

    return input;
  };
});