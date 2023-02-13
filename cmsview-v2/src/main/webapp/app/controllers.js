/* Check if a course is exist in an array of course*/ 
Array.prototype.contains = function(course) {
    var i = this.length;
    while (i--) {
        if (this[i].courseId === course.courseId) {
            return true;
        }
    }
    return false;
}
var app = angular.module('dolphin.controller', ['dolphin.service', 'dolphin.directive']);

//////////////////////////////////////////////////////////////
//Common controller
//////////////////////////////////////////////////////////////
app.controller('CommonController', function ($scope, $translate, $location, parentPage, contextPath, $sce, 
		$injector, $filter,
		CategoryFactory, ContactUsFactory, $localStorage, $timeout) { 
	/* Contact Us process */
	$scope.categories = CategoryFactory.getAll.query();
	$scope.openCategory = function(cat)
    {
	  window.location.href=contextPath.cmsview + '/#/courses/courseList/' + cat.categoryId;
    }
	$scope.contactInfo = {};
	 $scope.contactSCB = function(contactInfo){
		 ContactUsFactory.save(contactInfo, function(e){
			 alert('Contact songcanbang.org successfully!');
			 $scope.contactInfo = {};
		 });
	 }
	 $scope.previewVideoUrl = function(videoUrl){
	    if(typeof videoUrl !== "undefined" && videoUrl != ""){
	      $injector.get('$modal').open({
	        template: 
	           '<div style="text-align:center;vertical-align:middle;height:auto;width:auto">'
	          + '<div class="modal-header">'
	          + '<h4 class="modal-title" id="myModalLabel">' + $filter('translate')('common.PREVIEW') +'</h4>'
	          + '</div>'
	          + '<video width="550" height="350" controls poster="http://rc.songcanbang.org/images/video.jpg" >'
	          + '<source src="'+ videoUrl +'" type="video/mp4">'
	          + 'Your browser doesnt support HTML5 video tag.'
	          +'</video><div>',
	      });
	    }
	}
	/* END Contact Us process */
	$scope.openProfile = function(){
		window.location = contextPath.idm  + '/#/app/profile/?token='+$localStorage.jwt;
	}
	$scope.previewVideo = function(course){
		$scope.previewVideoUrl(course.videoUrl);
	}
	
	$scope.contextPath = contextPath;
	
	$scope.setLang = function(langKey) {
	    // Change the language during runtime
	    $translate.use(langKey);
	    $("#selectedLangImg").attr('src', 'assets/images/flags/' + langKey.substring(0,2) + '.png');
	};
	
	$scope.convertMoney = function(money) {
		if (typeof money != "undefined") {
			if (money == 0) {
				return 'common.PRICE_FREE';
			} else {
				return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "đ";
			}
		}
	}
	$scope.searchCourse = function(searchText) {
		if (typeof searchText != 'undefined' && searchText.trim() != '') {
			$location.path('/courses/search/' + searchText.trim());
		} else {
			$location.path('/courses/courseList/0');
		}
	}
	
	$scope.fowardToLoginPage = function() {
		var url = encodeURIComponent($location.absUrl());
		window.location=contextPath.idm+ '/#/app/login?service='+ url;
	}
	$scope.registerNewUser = function(){
		
	}
	 $scope.logout = function () {
	  		$scope.$parent.signedInUser = undefined;
	  		delete $localStorage.jwt;
	  		$timeout(function(){
	  			window.location = contextPath.cmsview;
	  		},110);
	      };
	$scope.openInstructionPage = function(){
		if(typeof $scope.$parent.signedInUser === "undefined" ||  $scope.$parent.signedInUser == null){
			$scope.fowardToLoginPage();
		}
		window.location = contextPath.cmsadmin + "/#/teaching/home?token="+$localStorage.jwt;
	}
	
	$scope.convertHtml = function(text) {
		return $sce.trustAsHtml(text);
	} 
	
	$scope.trustUrl = function(text) {
		return $sce.trustAsResourceUrl(text)
	} 
	
	$scope.lsCategory = CategoryFactory.getAll.query();
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
	  $scope.showCourseDetail = function(courseId){
		$location.path('/courses/courseDetail/' + courseId);
	  }
	  // Shopping cart
	  $scope.totalAmount = 0;
	  $scope.totalOriginAmount = 0;
	  $scope.savePercentage = 0;
	  
	  (function(){
		  if(typeof $localStorage.shoppingCart !== "undefined" && $localStorage.shoppingCart !== null){
			  $localStorage.shoppingCart.forEach(function(c){
				  $scope.totalOriginAmount += c.price;
				  $scope.totalAmount += c.discountPrice;  
			  });  
		  }else{
			  $localStorage.shoppingCart = [];
		  }
	  })();
	  
	  $scope.shoppingCart = $localStorage.shoppingCart;
      $scope.addToCart = function(course){
    	  if(typeof $localStorage.shoppingCart == "undefined" || $localStorage.shoppingCart == null){
    		  $localStorage.shoppingCart = new Array();
    	  }
    	  if(!$localStorage.shoppingCart.contains(course)){
    		  $localStorage.shoppingCart.push(course);
    		  $scope.totalOriginAmount += course.price;
			  $scope.totalAmount += course.discountPrice;  
    		  $scope.cartItemLength = $localStorage.shoppingCart && $localStorage.shoppingCart.length ? $localStorage.shoppingCart.length:0;
    	  }
    	  $scope.shoppingCart = $localStorage.shoppingCart;
    	  
      }
      $scope.removeFromCart = function(course){
    	  var removeList = $localStorage.shoppingCart.filter(function(c) {
    		    return c.courseId !== course.courseId;
    		});
    	  if($localStorage.shoppingCart.length > removeList.length){
    		  $localStorage.shoppingCart = removeList;
    		  $scope.totalOriginAmount -= c.price;
			  $scope.totalAmount -= c.discountPrice;  
        	  $scope.cartItemLength = $localStorage.shoppingCart && $localStorage.shoppingCart.length ? $localStorage.shoppingCart.length:0;
        	  $scope.shoppingCart = $localStorage.shoppingCart;
    	  }
    	  
      }
      $scope.cartItemLength = $localStorage.shoppingCart && $localStorage.shoppingCart.length ? $localStorage.shoppingCart.length:0;
});

//controller of homepage.html
app.controller('HomepageController', function($scope, CategoryFactory, CourseFactory, $location) {
	$scope.orderBy = 'puslishDate';
	$scope.lsCategoryAndCourse = [];
	$scope.prevButtonIsEnabled = true;
	$scope.infiniteScrollIsEnabled=true;
	$scope.nextButtonIsEnabled=true;
	
	var w = (window.innerWidth > 0) ? window.innerWidth : screen.width;
	var listSize = 1;
	// Calculate how many item should be on a row
	listSize = w <=500 ?1: w> 500 && w<600 ?3: w>600 && w<960?4:w>960&& w<1024?5:6;
	
	$scope.nextPage = function (categoryAndCourse){
		if(categoryAndCourse.page * 6 < categoryAndCourse.courseCount.count){
			categoryAndCourse.page++;
			categoryAndCourse.lsCourse = CourseFactory.getListCourseWithRcp.query({page: categoryAndCourse.page, categoryId: categoryAndCourse.categoryId,
				orderBy: $scope.orderBy, rcp: listSize});
		}
	}
	
	$scope.previousPage = function (categoryAndCourse){
		if(categoryAndCourse.page > 1){
			categoryAndCourse.page--;
			categoryAndCourse.lsCourse =  CourseFactory.getListCourseWithRcp.query({page: categoryAndCourse.page, categoryId: categoryAndCourse.categoryId,
				orderBy: $scope.orderBy, rcp: listSize});
		}
	}
	
	CategoryFactory.getAll.query(function(data) {
		loadCourse(data);
	});
	var loadCourse = function(data){
		for (var idx = 0; idx < data.length; idx++) {
			var categoryAndCourse = {
					page: 1,
					categoryName: data[idx].categoryName,
					categoryId : data[idx].categoryId,
					courseCount: CourseFactory.courseCount.get({categoryId: data[idx].categoryId}),
					lsCourse: CourseFactory.getListCourseWithRcp.query({page: 1, categoryId: data[idx].categoryId, orderBy: $scope.orderBy, rcp: listSize})
				};
			$scope.lsCategoryAndCourse.push(categoryAndCourse);
		}
	}
	
});

app.controller('SearchCourseController', function($scope, CategoryFactory, CourseFactory, $stateParams) {
	$scope.reloadLsCourse = function (page) {
		$scope.p = page;
		$scope.lsCourse = CourseFactory.searchListCourse.query({page: $scope.p, searchText: $stateParams.searchText, orderBy: $scope.orderBy});
		$scope.paging = CourseFactory.getTotalPageSearchCourse.get({searchText: $stateParams.searchText});
	}
	
	$scope.orderBy = 'puslishDate';
	$scope.reloadLsCourse(1);
});

app.controller('ShoppingCartController', function($scope, LoadCouponDefFactory, $localStorage,$stateParams, $location) {
	$scope.checkout = function(){
		// Payment made with shopping cart (-1), if pay for one course -1 should be replaced by course id.
		$location.path('/courses/coursePayment/-1');
	}
	
	$scope.couponCodeTxt = "";
	$scope.applyCoupon = function(){
		LoadCouponDefFactory.get({ccode: $scope.couponCodeTxt}, function(couponMaster){
			if(typeof couponMaster !== "undefined" && couponMaster != null){
				$scope.totalOriginAmount = 0;
				$scope.totalAmount = 0;
				$localStorage.shoppingCart.forEach(function(c){
					  $scope.totalOriginAmount += c.price;
					  c.discountPrice = Math.ceil((100 - couponMaster.discount)* c.price/100);
					  $scope.totalAmount += c.discountPrice;  
				  });
				
			}
		});
	}
	
});