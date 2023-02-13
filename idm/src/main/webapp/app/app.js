var app = angular.module('dolphin', ['ui.router', 
                                         'ui.bootstrap', 
                                         'ngStorage', 
                                         'angular-jwt', 
                                         'idm.controllers', 
                                         'idm.directives',
                                         'idm.services',
                                         'idm.filters',
                                         'ng-jwplayer', 
                                         'globalErrorHandlerModule',
                                         'pascalprecht.translate', 
                                         'ngAnimate', 
                                         'ngSanitize', 
                                         'oc.lazyLoad',
                                         'chieffancypants.loadingBar'
                                         ,'directive.g+signin'
]);

//app.cmsCoreUrl = "http://localhost:8080/cmscore";
//app.idmUrl = "http://localhost:8080/idm";
//app.cmsWeb = "http://localhost:8080/cmsview";
//app.homepage = "http://localhost:8080/cmsview";
	
app.cmsCoreUrl = "http://web.songcanbang.org";
app.idmUrl = "http://accounts.songcanbang.org";
app.cmsWeb = "http://www.songcanbang.org";
app.homepage = "http://www.songcanbang.org";

app.resourceBaseUrl = "http://rc.ehealth.gov.vn";

app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
                function ($stateProvider, $urlRouterProvider, $locationProvider){
	$stateProvider
    .state("app", {
        abstract : true,
        url: "/app",
        templateUrl: appHelper.componentView('layouts','template'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
              ASSETS.js('layouts','jquery.nicescroll.min'),
              ASSETS.js('layouts','layouts'),
              ASSETS.core.core,
            ]);
          },
        }
    	,authenticate : false
    })

     .state('app.login', {
        url: '/login?service=',
        templateUrl: appHelper.componentView('security','login'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
                ASSETS.css('security','signin')
            ]);
          },
        },
        authenticate : false,
        controller: 'LoginController'
    })

     .state('app.logout', {
        url: '/logout?service=',
        templateUrl: appHelper.componentView('security','logout'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
            ]);
          },
        },
        authenticate : false,
        controller: 'LogoutController'
     })
    .state('app.user-register', {
        url: '/user-register',
        templateUrl: appHelper.componentView('user','user-register'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
            ]);
          },
        },
        authenticate : false,
        controller: 'UserRegisterController'
    })
    
     .state('app.register-confirm', {
        url: '/register-confirm/:email/:token',
        templateUrl: appHelper.componentView('user','register-confirm'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
            ]);
          },
        },
        authenticate : false,
        controller: 'RegisterConfirmController'
    })
//    
//     .state('app.user-reset-password', {
//        url: '/request-reset-password',
//        templateUrl: appHelper.componentView('user','user-reset-password'),
//        resolve: {
//          resources: function($ocLazyLoad){
//            return $ocLazyLoad.load([
//            ]);
//          },
//        },
//        authenticate : false,
//        controller: 'UserResetPasswordController'
//    })
    
     .state('app.reset-password-confirm', {
        url: '/reset-password/:email/:token',
        templateUrl: appHelper.componentView('user','reset-password-confirm'),
        resolve: {
          resources: function($ocLazyLoad){
            return $ocLazyLoad.load([
            ]);
          },
        },
        authenticate : false,
        controller: 'ResetPasswordConfirmController'
    })

	$locationProvider.html5Mode({
		enabled: false,
		requireBase: false
	});
	$urlRouterProvider.otherwise("/app/login");
}]);
app.config(['$translateProvider', function($translateProvider){
	  $translateProvider.useStaticFilesLoader({
	    prefix: 'lang/',
	    suffix: '.json'
	  });
	  $translateProvider.useSanitizeValueStrategy('escape');
	  $translateProvider.preferredLanguage('vn_VI');
	}]);
app.config(['$compileProvider',function($compileProvider){
	$compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|file|ftp|blob):|data:image\//);	
}]);
app.run(function($rootScope, $window, facebookService, LoginFactory, $state, $stateParams, $location, $localStorage, jwtHelper, $http, $sce) {
	  //Facebook API
	  $rootScope.fbUser = {};
	  $rootScope.googleUser = {};
	  
	  $rootScope.$on('event:google-plus-signin-success', function (event,authResult) {
	    var gplusAccessToken = authResult.Zi.access_token;
	    var googleUserInfoService = 'https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token='+gplusAccessToken;
	    $http.get(googleUserInfoService)
        .success(function (uInfo) {
        	$rootScope.googleUser.fullName = uInfo.name;
        	$rootScope.googleUser.loginName = 'google_' + uInfo.id;
        	$rootScope.googleUser.googleId = uInfo.id;
        	$rootScope.googleUser.sex = uInfo.gender === "male"? 1:0;
        	$rootScope.googleUser.email = uInfo.email;
        	$rootScope.googleUser.cover = '';
        	
          	if (typeof uInfo !== "undefined") {
          		$rootScope.signedInUser = null;
          	} 		
        	
        	$rootScope.googleUser.avataUrl = uInfo.picture;
        	$rootScope.googleUser.googleAccessToken = gplusAccessToken;
         	$rootScope.googleUser.password = '';
         	LoginFactory.login($rootScope.googleUser, function (data) {
         		if(typeof data === "undefined" || data === ''){
         			$rootScope.errorMsg = "Login failed";
        		}else{
         			if(typeof $stateParams.service !== "undefined" && $stateParams.service !== ''){
         				if($stateParams.service.indexOf('?') !== -1){
         					window.location = decodeURIComponent($stateParams.service + '&token=')+data;
         				}else{
         					window.location = decodeURIComponent($stateParams.service + '?token=')+data;
         				}
         				
         			}else{
         				alert("Error: No callback url available!!!");
         			}
         		}
         	});
        });
	  });
	  $rootScope.$on('event:google-plus-signin-failure', function (event,authResult) {
		console.log('Signin failure');
	  });
	  
	  $rootScope.loginFacebook= function(){
		  FB.getLoginStatus(function(res) {    
		  	  if (res.status !== 'connected') {
		  		FB.login(function(response) {
					if (response.status === 'connected') {
						$rootScope.fbGetUserInfo();
					} 
				  });	
		  	  }else{
		  		$rootScope.fbGetUserInfo();
		  	  }
		  });
	  }
	  
	  $rootScope.logout = function () {
		if (typeof $rootScope.signedInUser === "undefined"){
			 alert("Invalid token!!!");
			 if(typeof $rootScope.serviceUrl !== "undefined")
				 window.location.href = $rootScope.serviceUrl;
		}
  		if (typeof $rootScope.signedInUser.fbAccessToken !== "undefined" 
  			&& $rootScope.signedInUser.fbAccessToken != null
  			&& FB.getAccessToken() != null) {
            FB.logout(function(response) {
          		$rootScope.signedInUser = null;
          		window.location.href = $rootScope.serviceUrl;
            });
  		}else if (typeof $rootScope.signedInUser.googleAccessToken !== 'undefined' && $rootScope.signedInUser.googleAccessToken !== '') 
  		{
            // Google sign out
  			if (typeof $rootScope.gapiAuth !== "undefined" && $rootScope.gapiAuth.isSignedIn.get()) {
  				$rootScope.gapiAuth.signOut().then(function () {
  	  	      	  $rootScope.signedInUser = null;
  	  	      	  window.location.href = $rootScope.serviceUrl;
  	  		    });
  			}else{
 	  	      	  $rootScope.signedInUser = null;
 	  	      	  window.location.href = $rootScope.serviceUrl;
  			}
        }else{
      		$rootScope.signedInUser = null;
      		window.location.href = $rootScope.serviceUrl;
        }
	  };
	  
	  $rootScope.fbGetUserInfo = function() { 
		    FB.api('/me', {
	            fields: 'context, name, public_key, first_name, last_name, gender, id, hometown, location, cover, education'
		  	  },
		  	  function(res1) {
		        $rootScope.$apply(function() {
		        	$rootScope.fbUser.fullName = res1.name;
		        	$rootScope.fbUser.loginName = 'fb_' + res1.id;
		        	$rootScope.fbUser.facebookId = res1.id;
		        	$rootScope.fbUser.sex = res1.gender === "male"? 1:0;
		        	$rootScope.fbUser.email = 'contact@ninhbinhedu.vsystems.vn';
		        	$rootScope.fbUser.cover = res1.cover.source;
		        	 FB.getLoginStatus(function(res) {    
		 				//{status: 'connected',authResponse: {accessToken: '...',expiresIn:'...',signedRequest:'...',userID:'...'}}
		 		  	  if (res.status === 'connected') {
		 	      		$rootScope.signedInUser = null;
		 		  		//Get user picture
		 		  		FB.api(
	 		  			    "/me/picture",
	 		  			    function (response) {
	 		  			      if (response && !response.error) {
	 		  			    	$rootScope.fbUser.avataUrl = response.data.url;
	 		  			    	$rootScope.fbUser.fbAccessToken = res.authResponse.accessToken;
	 			 		  		$rootScope.fbUser.password = '';
	 			 		  		LoginFactory.login($rootScope.fbUser, function (data) {
	 			 					if(typeof data === "undefined" || data === ''){
	 			 						$rootScope.errorMsg = "Login failed";
	 			 					}else{
	 			 						if(typeof $stateParams.service !== "undefined" && $stateParams.service !== ''){
	 			 							if($stateParams.service.indexOf('?') !== -1){
	 			 	         					window.location = decodeURIComponent($stateParams.service + '&token=')+data;
	 			 	         				}else{
	 			 	         					window.location = decodeURIComponent($stateParams.service + '?token=')+data;
	 			 	         				}
	 			 						}else{
	 			 							alert("Error: No callback url available!!!");
	 			 						}
	 			 					}
	 			 				});
	 		  			      }
	 		  			    }
	 		  			);
		 		  		
		 		  	  }
		 			});
		      });
		    });
	       
		};
		
	  /**/
	  // --/> Facebook login
		
	  // <!-- UI state change 
	  $rootScope.$on('$stateChangeStart', function(e, to, toParam, from, fromParam) {
		    // Parse token 
		    var token = undefined;
	  	    var originUrl = undefined;
	  	    var lc = $location.absUrl();
		  	
	  	    if(lc.indexOf('service=') !==-1)
		  	{
		  		if(lc.indexOf('&token=') != -1){
		  			token = lc.split('&token=')[1];
		  			$rootScope.serviceUrl = decodeURIComponent(lc.split('?service=')[1].split('&token=')[0]);
			  	}else
		  		{
			  		$rootScope.serviceUrl = decodeURIComponent(lc.split('?service=')[1]);
		  		}
		  	}else
	  		{
		  		if(lc.indexOf('token=') != -1){
		  			token = lc.split('&token=')[1];
		  			$rootScope.serviceUrl = decodeURIComponent(lc.split('?service=')[1].split('&token=')[0]);
			  	}
			  	$rootScope.serviceUrl = app.homepage;
	  		}
	  	  
		    if (token && !jwtHelper.isTokenExpired(token)) 
		    {
		  	  $rootScope.signedInUser = token && jwtHelper.decodeToken(token);
		    }
	  });
	  // --/> End of UI state change
	});
	// --/> End of app.run

	/** Prevent ENTER key on input text **/
	$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
	  if(e.which == 13) {
	    e.preventDefault();
	    return false;
	  }
	});	

