var app = angular.module('admin', [
                                     'angular-jwt',
                                     'ui.router',
                                     'ui.bootstrap', 
                                     'admin.services',
                                     'admin.filters', 
                                     'admin.directives',
                                     'admin.controllers',
                                     'globalErrorHandlerModule',
                                     'ngStorage',
                                     'pascalprecht.translate',
                                     'ng-jwplayer',
                                     'ngDragDrop',
                                     'ngAnimate', 
                                     'oc.lazyLoad', 
                                     'chieffancypants.loadingBar',
                                     'ngFileUpload',
                                     'ui.tinymce'
                                     ]
);
app.cmsAdminUrl = "http://localhost:8080/cmsadmin";
//app.cmsAdminUrl = "http://admin.songcanbang.org";

//app.cmsCoreUrl = "http://web.songcanbang.org";
app.cmsCoreUrl = "http://localhost:8080/cmscore";

app.idmUrl = "http://accounts.songcanbang.org";
//app.idmUrl = "http://localhost:8080/idm";

app.resourceBaseUrl = "http://rc.songcanbang.org";

//app.cmsWeb = "http://songcanbang.org/courses";
app.cmsWeb = "http://localhost:8080/cmsview";


app.config(['jwtInterceptorProvider', '$stateProvider', '$urlRouterProvider', '$httpProvider','$locationProvider', 
            function(jwtInterceptorProvider, $stateProvider, $urlRouterProvider, $httpProvider, $locationProvider) {
	$urlRouterProvider.otherwise('/app/dashboard');
    
    $stateProvider
      .state("app", {
        abstract : true,
        url: "/app",
        templateUrl: appHelper.componentView('layouts','basic-layout'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
      })
      $stateProvider
      .state("teaching", {
        abstract : true,
        url: "/teaching",
        templateUrl: appHelper.componentView('layouts','teaching-layout'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
      })

      /************* Collapsed Sidebar *************/
      .state("collapsed-sidebar", {
        url: "/collapsed-sidebar",
        templateUrl: appHelper.componentView('layouts','collapsed-sidebar'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.css('dashboard','widgets'),

              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
      })

      /************* Horizontal Menu *************/
      .state("horizontal-menu", {
        url: "/horizontal-menu",
        templateUrl: appHelper.componentView('layouts','horizontal-menu'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.css('dashboard','widgets'),
              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
      })

      /************* Menu With Header *************/
      .state("menu-with-header", {
        url: "/menu-with-header",
        templateUrl: appHelper.componentView('layouts','menu-with-header'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.css('dashboard','widgets'),
              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
      })

      /************* Right Sidebar *************/
      .state("right-sidebar", {
        url: "/right-sidebar",
        templateUrl: appHelper.componentView('layouts','right-sidebar'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.css('dashboard','widgets'),
              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
      })

      /************* Boxed Layout *************/
      .state("boxed-layout", {
        url: "/boxed-layout",
        templateUrl: appHelper.componentView('layouts','boxed-layout'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.css('dashboard','widgets'),
              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
      })
      /************* Dashboard *************/
      .state("app.dashboard", {
        url: "/dashboard",
        templateUrl: appHelper.componentView('dashboard','index'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.css('dashboard','widgets'),

              ASSETS.core.liveTile,
              ASSETS.js('dashboard','dashboard')
            ]);
          },
        }

      })
        // Category
        .state('app.categoryList', {
            url: '/categoryList',
            templateUrl: appHelper.componentView('category','category-list'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            }
        })
        
        .state('app.categoryDetail', {
            url: '/categoryDetail/:id',
            templateUrl: appHelper.componentView('category','category-detail'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'CategoryDetailController'
        }) 

        .state('app.categoryCreate', {
            url: '/categoryCreate',
            templateUrl: appHelper.componentView('category','category-detail'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'CategoryCreationController'
        })
        //Teacher
         .state('app.teacherList', {
            url: '/teacherList',
            templateUrl: appHelper.componentView('teacher','teacher-list'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'TeacherListController'
        })
        
        .state('app.teacherDetail', {
            url: '/teacherDetail/:id',
            templateUrl: appHelper.componentView('teacher','teacher-detail'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'TeacherDetailController'
        }) 
        
        .state('app.teacherCreate', {
            url: '/teacherCreate',
            templateUrl: appHelper.componentView('teacher','teacher-detail'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'TeacherCreateController'
        })
        //Publication
        .state('app.publicationList', {
            url: '/publicationList',
            templateUrl: appHelper.componentView('publication','publication-list'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'PublicationListController'
        })
        
        .state('app.publicationDetail', {
            url: '/publicationDetail/:id',
            templateUrl: appHelper.componentView('publication','publication-detail'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'PublicationDetailController'
        }) 
        
        .state('app.publicationCreate', {
            url: '/publicationCreate',
            templateUrl: appHelper.componentView('publication','publication-detail'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                ]);
              },
            },
            controller: 'PublicationCreateController'
        })
        
        //Course
//         .state('app.courseList', {
//            url: '/courseList/:catId',
//            templateUrl: appHelper.componentView('course','course-list'),
//            resolve: {
//              resources: function($ocLazyLoad){
//                return $ocLazyLoad.load([
//                ]);
//              },
//            },
//            controller: 'CourseListController'
//        })
//        .state('app.courseDetail', {
//            url: '/courseDetail/:id',
//            templateUrl: appHelper.componentView('course','course-detail'),
//            controller: 'CourseDetailController'
//        })
//         .state('app.courseCreation', {
//            url: '/courseCreation/:catId',
//            templateUrl: appHelper.componentView('course','course-detail'),
//            controller: 'CourseCreationController'
//        })    
        
        // Teaching Controller
	   .state('teaching.home', {
	       url: '/home',
	       templateUrl: appHelper.componentView('teaching','course-list'),
	       resolve: {
	         resources: function($ocLazyLoad){
	           return $ocLazyLoad.load([
	           ]);
	         },
	       },
	       controller: 'TeachingHomeController'
	   })
	   .state('teaching.courseDetail', {
	       url: '/course-detail/:id',
	       templateUrl: appHelper.componentView('teaching','course-detail'),
	       controller: 'TeachingCourseDetailController'
	   })
	   
	   .state('teaching.courseCreation', {
	       url: '/course-creation',
	       templateUrl: appHelper.componentView('teaching','course-detail'),
	       controller: 'TeachingCourseCreationController'
	   });
    
	    $locationProvider.html5Mode({
	        enabled: false,
	        requireBase: false
	    });
}])

.config(['$translateProvider', function($translateProvider){
  $translateProvider.useStaticFilesLoader({
    prefix: 'lang/',
    suffix: '.json'
  });
  $translateProvider.useSanitizeValueStrategy('escape');
  $translateProvider.preferredLanguage('vn_VI');
}])
.run(['$rootScope','$filter', '$state','$stateParams', '$location', '$localStorage', 'jwtHelper', '$http',
    function($rootScope, $filter, $state, $stateParams, $location, $localStorage, jwtHelper, $http) {      
      $rootScope.$state = $state;
      $rootScope.$stateParams = $stateParams;
	  $rootScope.$on('$stateChangeStart', function(e, to) {
	      var isDirty = dirtyCheck();
	
		  if( typeof isDirty !== "undefined" && isDirty == "\0" && (typeof window.ignoreDC == "undefined" || window.ignoreDC == false) ){
	      var confirm = window.confirm($filter('translate')('common.DIRTY_CHECK_ERROR'));
	      if(!confirm){
	        e.preventDefault();
	        return;  
	      }
	      }
	      if(to.name !="app.login" && to.name !== "app.logout"){
		  	  var token = undefined;
		  	  var originUrl = undefined;
		  	  
		  	  if($location.absUrl().indexOf('token') != -1){
		  		token = $location.absUrl().split('?')[1].split('=')[1];  
		  		originUrl = $location.absUrl().split('?')[0];
		  	  }
		  	  
		  	  if(typeof token !== "undefined" && token !== ''){
		  		$localStorage.jwt = token;
		  		window.location = originUrl;
		  	  }
			  if (typeof $localStorage.jwt == "undefined" 
				  || $localStorage.jwt === ""
				  || jwtHelper.isTokenExpired($localStorage.jwt)) {
				if(typeof $localStorage.jwt !== "undefined" && jwtHelper.isTokenExpired($localStorage.jwt)){
					delete $localStorage.jwt;
				}
				$rootScope.signedInUser = null;
		        e.preventDefault();
		        //$state.go('app.login');
		        window.location = app.idmUrl + '#/login?service=' +  encodeURIComponent($location.absUrl());
		      }else{
		    	$rootScope.signedInUser = $localStorage.jwt && jwtHelper.decodeToken($localStorage.jwt);
		    	$http.defaults.headers.Authorization = $localStorage.jwt;
		      }  
		  }else{
			  if(to.name == "app.login"){
				  window.location = app.idmUrl + '#/login?service=' +  encodeURIComponent($location.absUrl());
			  }
				  
		  }
	      
	  });
	}])
