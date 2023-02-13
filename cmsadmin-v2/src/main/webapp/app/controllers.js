var controllers = angular.module('admin.controllers', [
	                                                     'ui.router',
                                                       'oc.lazyLoad',
                                                       'uiGmapgoogle-maps',
                                                       'angular-jwt',
                                                       'ngFileUpload',
                                                       'ngStorage'
                                                       ]);
 

//////////////////////////////////////////////////////////////
// Common controller
//////////////////////////////////////////////////////////////
controllers.controller('CommonController', 
	['$scope','LoginFactory','LogoutFactory','CategoriesFactory',
  'UsersFactory', '$filter','Upload',
	'VideoUpload','ImageUpload','FileUpload','$localStorage', 
	'jwtHelper','$compile','$stateParams', '$translate','$location',
	'cfpLoadingBar', '$ocLazyLoad', '$timeout','$sce',
  function ($scope, LoginFactory, LogoutFactory, CategoriesFactory, UsersFactory, $filter, Upload, VideoUpload,ImageUpload,FileUpload, 
  			$localStorage, jwtHelper, $compile,$stateParams, $translate, $location,
  			cfpLoadingBar, $ocLazyLoad, $timeout,$sce) {  
	$scope.serverPath = ""/*$location.absUrl().substr(0, $location.absUrl().lastIndexOf("#")-9)*/;
	$scope.setLang = function(langKey) {
	    // Change the language during runtime
	    $translate.use(langKey);
      $("#selectedLangImg").attr('src', 'assets/images/flags/'+langKey.substring(0,2) + '.png');
	  };
	  $scope.cmsadminPromise = null;
	  $scope.loading = false;
   
	  $scope.fowardToLoginPage = function(){
		var url = encodeURIComponent($location.absUrl());
		window.location=app.idmUrl+ '/#/login?service='+ url;
	  }
      $scope.logout = function () {
  		$scope.signedInUser = undefined;
  		delete $localStorage.jwt;
  		
  		$timeout(function(){
  			var url = encodeURIComponent($location.absUrl());
  			window.location=app.idmUrl+ '/#/login?service='+ url;
  		},110);
      };
      
      $scope.openMyCourse = function(){
    	window.location = app.cmsWeb + '/#/courses/my-courses/?token=' + $localStorage.jwt;  
      }
      $scope.cmsadminPromise = null;

///////////////////////// Upload ////////////////////////////////////////////////////////////////////////////////
      
      $scope.uploadFile = function(file, fsuccess, ferror){
    	  // Upload data 
	       var fdata = new FormData();
	        fdata.append("file", file);
	        FileUpload.upload(fdata).$promise.then(fsuccess,ferror);  
      };
      $scope.uploadVideo = function(file, fsuccess, ferror){
    	  // Upload data 
	       var fdata = new FormData();
	        fdata.append("file", file);
	        VideoUpload.upload(fdata).$promise.then(fsuccess,ferror);  
      };
      $scope.uploadImage = function(file, fsuccess, ferror){
    	  // Upload data 
	       var fdata = new FormData();
	        fdata.append("file", file);
	        ImageUpload.upload(fdata).$promise.then(fsuccess,ferror);  
      };
 
///////////////////////// Role checking ////////////////////////////////////////////////////////////////////////////////
      $scope.isSuperRole = function(aRole){
        if(typeof aRole !== "undefined" && typeof aRole.roleName !== "undefined"){
        	return (aRole.roleName == 'ADMIN')
        }
        if($scope.signedInUser){
          if($scope.signedInUser.ROLES){           
            for(var i=0; i<$scope.signedInUser.ROLES.length;i++){
              var roleObj = $scope.signedInUser.ROLES[i];
              if(roleObj.roleName == 'ADMIN'){
                return true;
              }
            }
          }
        }
        return false;
      }
      $scope.isEdior = function(aRole){
          if(typeof aRole !== "undefined" && typeof aRole.roleName !== "undefined"){
          	return (aRole.roleName == 'ADMIN' || aRole.roleName == 'EDITOR')
          }
          if($scope.signedInUser){
            if($scope.signedInUser.ROLES){           
              for(var i=0; i<$scope.signedInUser.ROLES.length;i++){
                var roleObj = $scope.signedInUser.ROLES[i];
                if(roleObj.roleName == 'ADMIN' || aRole.roleName == 'EDITOR'){
                  return true;
                }
              }
            }
          }
          return false;
        }
      
      $scope.isSystemRole = function(aRole){
        if(typeof aRole !== "undefined" && typeof aRole.roleName !== "undefined"){
	        return (aRole.roleType == 0 || aRole.roleType == "0");
	      }
        if($scope.signedInUser){
          if($scope.signedInUser.ROLES){
            for(var i=0; i<$scope.signedInUser.ROLES.length;i++){
              var roleObj = $scope.signedInUser.ROLES[i];
              if(roleObj.roleType == 0 || roleObj.roleType == "0"){
                return true;
              }
            }
          }
        }
        return false;
      }
      
      $scope.isSystemFunction = function(aFunction){
        if(typeof aFunction !== "undefined" &&  typeof aFunction.functionType !== "undefined"){
        return (aFunction.functionType == 0 || aFunction.functionType == "0");
      }
        if($scope.signedInUser){
          if($scope.signedInUser.FUNCS){
            for(var i=0; i<$scope.signedInUser.FUNCS.length;i++){
              var funcObj = $scope.signedInUser.FUNCS[i];
              if(funcObj.functionType == 0 || funcObj.functionType == "0"){
                return true;
              }
            }
          }
        }
        return false;
      }
      $scope.checkPrivilege = function(funcName){
        if($scope.signedInUser){
          if($scope.isSuperRole()){
            return true;
          }
          if($scope.signedInUser.FUNCS){
            for(var i=0; i<$scope.signedInUser.FUNCS.length;i++){
              var funcObj = $scope.signedInUser.FUNCS[i];
              if(funcObj.functionName == funcName){
                return true;
              }
            }
          }
        }
        return false;
      }    
    $scope.changePass = function (user){
      delete user.new_password;
      var testUser = {'loginName':$scope.signedInUser.aud, 'password':user.password};
      var newUser = {'loginName':$scope.signedInUser.aud, 'password':user.confirm_password};
      $scope.errorMsg = '';
      $scope.cmsadminPromise = LoginFactory.login(testUser, 
        function (data) {
           UsersFactory.changePass(newUser, function(dat){
              $scope.errorMsg = $filter('translate')('common.CHANGE_PASSWORD_SUCCESS');
              $scope.changePasswdSuccess = true;
              //$scope.logout();
           }, function(err){
            $scope.errorMsg = $filter('translate')('common.CHANGE_PASSWORD_ERROR');
            console.log($scope.errorMsg);
           });
        },function(err){
            $scope.changePasswdSuccess = false;
            $scope.errorMsg = '';
            console.log(err);
        }
      );
    }      
    cfpLoadingBar.start();

    $scope.postClose = function(){
      if(typeof $scope.changePasswdSuccess !== "undefined" && $scope.changePasswdSuccess){
        $scope.logout();
        $scope.changePasswdSuccess = undefined;
      }
    }

    $scope.start = function() {
      cfpLoadingBar.start();
    };


    $scope.$storage = $localStorage.$default({
        miniSidebar: false
    });


    $scope.minibar = function (argument) {
    // $scope.$storage.miniSidebar = argument;
      console.log(argument);
    }
    
    $ocLazyLoad.load([
        ASSETS.js('dashboard','layout-main'),
    ]);
    $scope.categories = CategoriesFactory.query();
    
    $scope.convertHtml = function(text) {
		return $sce.trustAsHtml(text);
	} 
    
}])
.controller("leftSideBarCtrl", function($scope, $http){
  var leftSideBarCtrl = this;
  $('ul.menu-parent').accordion();
})
.controller('dashboardCtrl', function ($scope, $http) {

  var dashboardCtrl = this;
  $scope.$parent.showLogo = false;
  $('ul.tabs').tabs();

  $('.counter').each(count);

  function count(options) 
  {
      var $this = $(this);
      options = $.extend({}, options || {}, $this.data('countToOptions') || {});
      $this.countTo(options);
  }

  // Todo widget add list
  $('#add_todo').bind('keypress', function(e) {
    var len = $('.list-todo li').prevAll().length+1;
    if(e.keyCode==13){
      e.preventDefault();
      $('.add-to-input').before('<li class="list-group-item">' + 
        '<div class="ms-hover">' + 
        '<input type="checkbox" class="mark-complete" id="todo'+len+'">' + 
        '<label for="todo'+len+'"><span></span>' + $(this).val() + '</label>' + 
        '</div>' + 
        '</li>');
      $(this).val("");

    }
  });

  // Todo checkboc check event
  $(document).on('change', '.mark-complete', function(){
    if($(this).prop("checked"))
    {
      $(this).closest('.list-group-item').addClass('completed');
    }
    else
    {
      $(this).closest('.list-group-item').removeClass('completed'); 
    }
  });

  // Todo mark all list items
  $('.mark-all').click(function () {    
    if(this.checked) { // check select status
            $('input:checkbox').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox"   
                $('input:checkbox').prop('checked', this.checked),$( '.todo_widget .list-group-item' ).addClass('completed');            
            });
        }else{
            $('input:checkbox').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox"  
                $('input:checkbox').prop('checked', this.checked),$( '.todo_widget .list-group-item' ).removeClass('completed');                     
            });         
        }
    // $('input:checkbox').prop('checked', this.checked),$( '.todo_widget .list-group-item' ).toggleClass('completed');
  });
})

/* Tasks Controller */
.controller('rightSidebarCtrl', ['$scope','$ocLazyLoad', 
  function ($scope, $ocLazyLoad, $http, $localStorage) {
  var dashboardCtrl = this;
  
  $('ul.tabs').tabs();

  $('.counter').each(count);

  function count(options) 
  {
      var $this = $(this);
      options = $.extend({}, options || {}, $this.data('countToOptions') || {});
      $this.countTo(options);
  }

  // Todo widget add list
  $('#add_todo').bind('keypress', function(e) {
    var len = $('.list-todo li').prevAll().length+1;
    if(e.keyCode==13){
      e.preventDefault();
      $('.add-to-input').before('<li class="list-group-item">' + 
        '<div class="ms-hover">' + 
        '<input type="checkbox" class="mark-complete" id="todo'+len+'">' + 
        '<label for="todo'+len+'"><span></span>' + $(this).val() + '</label>' + 
        '</div>' + 
        '</li>');
      $(this).val("");

    }
  });

  // Todo checkboc check event
  $(document).on('change', '.mark-complete', function(){
    if($(this).prop("checked"))
    {
      $(this).closest('.list-group-item').addClass('completed');
    }
    else
    {
      $(this).closest('.list-group-item').removeClass('completed'); 
    }
  });

  // Todo mark all list items
  $('.mark-all').click(function () {    
    if(this.checked) { // check select status
            $('input:checkbox').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox"   
                $('input:checkbox').prop('checked', this.checked),$( '.todo_widget .list-group-item' ).addClass('completed');            
            });
        }else{
            $('input:checkbox').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox"  
                $('input:checkbox').prop('checked', this.checked),$( '.todo_widget .list-group-item' ).removeClass('completed');                     
            });         
        }
    // $('input:checkbox').prop('checked', this.checked),$( '.todo_widget .list-group-item' ).toggleClass('completed');
  });
}])