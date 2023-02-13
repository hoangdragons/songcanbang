var app = angular.module('homepage', [
									 'angular-jwt',
                                     'homepage.controllers',  
                                     'homepage.services',
                                     'ui.router',
                                     'ngStorage',
                                     'pascalprecht.translate'
]);
//local debuging
/*
app.baseUrl = "http://songcanbang.org";
app.cmsViewUrl = "http://songcanbang.org/courses";
app.cmsAdminUrl = "http://admin.songcanbang.org";
*/

app.cmsCoreUrl = "http://web.songcanbang.org";
app.idmUrl = "http://accounts.songcanbang.org";
app.resourceBaseUrl = "http://rc.songcanbang.org";


app.baseUrl = "http://localhost:8080/homepage";
app.cmsViewUrl = "http://localhost:8080/cmsview";
app.cmsAdminUrl = "http://localhost:8080/cmsadmin-v2";

/*
app.cmsCoreUrl = "http://localhost:8080/cmscore";
app.idmUrl = "http://localhost:8080/idm";
app.resourceBaseUrl = "http://localhost:8080/";
*/

//app.context = "";

app.context = "/homepage";

app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider','$httpProvider', 
          function($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) {
//	$urlRouterProvider.otherwise("/" + app.context);
	$urlRouterProvider.otherwise("/index");

  $stateProvider
      .state('index', {
//          url: '/' + app.context,
      	url:'/index',
//          templateUrl:app.context + '/view.html',
      	 templateUrl: 'view.html',
          authenticate : false,
          controller: 'HomepageController'
      })
      $locationProvider.html5Mode({
          enabled: false,
          requireBase: false
      });
}]);
app.config(['$translateProvider', function($translateProvider){
$translateProvider.useStaticFilesLoader({
  prefix: 'lang/',
  suffix: '.json'
});
$translateProvider.useSanitizeValueStrategy('escape');
$translateProvider.preferredLanguage('vn_VI');
}]);
app.run(['$rootScope','$filter', '$state','$stateParams', '$location', '$localStorage', 'jwtHelper', '$http',
  function($rootScope, $filter, $state, $stateParams, $location, $localStorage, jwtHelper, $http) {  
//.run(['$rootScope','$state', '$location', '$localStorage', 'jwtHelper', 
//	function($rootScope, $state, $location, $localStorage, jwtHelper) {
	$rootScope.$on('$stateChangeStart', function(e, to) {
		var token = undefined;
		var originUrl = undefined;
		 // Calculate origin URL
		if($location.absUrl().indexOf('?token=') != -1){
			token = $location.absUrl().split('?token=')[1];  
			originUrl = $location.absUrl().split('?')[0];
		}else if($location.absUrl().indexOf('&token=') != -1){
			token = $location.absUrl().split('&token=')[1];  
			originUrl = $location.absUrl().split('&token=')[0];
		}
		// Đặt lại url nếu token valid
		if(typeof token !== "undefined" && token !== ''){
			$localStorage.jwt = token;
			window.location = originUrl;
		}
		  	  
		if ($localStorage.jwt && !jwtHelper.isTokenExpired($localStorage.jwt)) {
			//Thiết lập thông tin đăng nhập nếu người dùng hợp lệ
		  $rootScope.signedInUser = $localStorage.jwt && jwtHelper.decodeToken($localStorage.jwt);
		}else if($localStorage.jwt && jwtHelper.isTokenExpired($localStorage.jwt)){
			// Delete  token nếu hết hiệu lực
			delete $localStorage.jwt;
		}
		
		if(to.authenticate && (typeof $rootScope.signedInUser === "undefined" || $rootScope.signedInUser == null))
		{
			window.location = app.idmUrl + '/#/app/login?service=' +  encodeURIComponent($location.absUrl());
		}else if($location.absUrl().indexOf('?shv=') !== -1 
					&& (typeof $rootScope.signedInUser === "undefined" || $rootScope.signedInUser == null)){
			window.location = app.idmUrl + '/#/app/login?service=' +  encodeURIComponent($location.absUrl());
		}
	  	
		//-- end of if login logout
//		if (to.name !== "search") {
//			$("#tl_search").val("");
//			$("#tl_search").trigger('input');
//		}
	});
}]);

