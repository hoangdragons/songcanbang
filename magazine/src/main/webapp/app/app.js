var app = angular.module('magazine', [
                                     'ui.router',
                                     'ui.bootstrap', 
                                     'magazine.services',
                                     'magazine.filters', 
                                     'magazine.directives',
                                     'magazine.controllers',
                                     'globalErrorHandlerModule',
                                     'ngStorage',
                                     'pascalprecht.translate',
                                     'ng-jwplayer',
                                     'ngAnimate', 
                                     'oc.lazyLoad', 
                                     'chieffancypants.loadingBar'
                                     
]);



app.cmsAdminUrl = "http://admin.songcanbang.org";
app.cmsCoreUrl = "http://web.songcanbang.org";
app.idmUrl = "http://accounts.songcanbang.org";
app.resourceBaseUrl = "http://rc.songcanbang.org";


//local debuging
/*app.cmsAdminUrl = "http://localhost:8080/admin";
app.cmsCoreUrl = "http://localhost:8080/cmscore";
app.idmUrl = "http://localhost:8080/idm";
app.resourceBaseUrl = "http://localhost:8080/";
*/
app.config(['jwtInterceptorProvider', '$stateProvider', '$urlRouterProvider', '$httpProvider','$locationProvider', 
            function(jwtInterceptorProvider, $stateProvider, $urlRouterProvider, $httpProvider, $locationProvider) {
	$urlRouterProvider.otherwise('/app/publicationList');
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
      .state('app.login', {
            url: '/login',
            templateUrl: appHelper.componentView('security','login'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                  /*ASSETS.js('security','login-controller')*/
                ]);
              },
            }
        })
        .state('app.logout', {
            url: '/logout',
            templateUrl: appHelper.componentView('security','logout'),
            resolve: {
              resources: function($ocLazyLoad){
                return $ocLazyLoad.load([
                  /*ASSETS.js('security','login-controller')*/
                ]);
              },
            }
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

