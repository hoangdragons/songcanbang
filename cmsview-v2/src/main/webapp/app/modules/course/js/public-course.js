//controller of courseList.html
app.controller('CourseListController', function($scope, CategoryFactory, CourseFactory, $stateParams) {
	$scope.rcp = 12;
	$scope.reloadLsCourse = function (page) {
		$scope.p = page;
		$scope.lsCourse = CourseFactory.getListCourseWithRcp.query({page: $scope.p, categoryId: $stateParams.categoryId, orderBy: $scope.orderBy, rcp: $scope.rcp});
		$scope.currentCourseCount = CourseFactory.courseCount.get({categoryId: $stateParams.categoryId}, function(num){
			$scope.listPage = [];
			$scope.totalPage = Math.ceil(num.count/$scope.rcp);
			for(var idx = 1; idx <= $scope.totalPage;idx++){
				$scope.listPage.push(idx);
			}
		});
	}
	
	$scope.selectedCategory = CategoryFactory.getCategoryById.get({id: $stateParams.categoryId});
	
	$scope.orderBy = 'puslishDate';
	$scope.reloadLsCourse(1);
	
});

/*controller of courseDetail.html*/
app.controller('CourseDetailController', function($rootScope, $scope, AffiliateInfoFactory, CourseFactory, CourseChapterFactory, 
		CourseRatingFactory, BoughtCourseFactory,LoadCouponDefFactory, $stateParams, $sce, $location, $state) {

	$scope.ratingEmotionMap = {};
	$scope.averageRateLevel = 0;
	$scope.rateLevel1 = 1;
	$scope.rateLevel2 = 2;
	$scope.rateLevel3 = 3;
	$scope.rateLevel4 = 4;
	$scope.rateLevel5 = 5;
	
	$scope.urlPage = '';
	$scope.urlPage = $location.absUrl();
	if($location.absUrl().indexOf('?shv=') == -1){
		if(typeof $scope.$parent.signedInUser !== "undefined"){
			$scope.urlPage = $location.absUrl() + '?shv=' + $scope.$parent.signedInUser.aud;
		}
	}else{
		if(typeof $scope.$parent.signedInUser !== "undefined"){
			$scope.urlPage = $location.absUrl().split('?shv=')[0] + '?shv=' + $scope.$parent.signedInUser.aud;
		}
	}
	$scope.lsRatings =  [];
	CourseFactory.loadFullCourseInfoFree.get({id: $stateParams.courseId}, function (data) {
		$scope.course = data;
		$scope.options = {
			type: 'mp4',
			width: "100%",
			height: 250,
			autostart: false
		};
		$scope.videoUrl = $sce.trustAsResourceUrl(data.videoUrl);
		if($location.absUrl().indexOf('?shv=') != -1 && typeof $scope.$parent.signedInUser !== "undefined"){
			// Update sharer points.
			var sharerId = $location.absUrl().split('?shv=')[1];
			AffiliateInfoFactory.save({courseId: data.courseId, shvId: sharerId, openerId:$scope.$parent.signedInUser.jti});
		}
		$scope.loadRatings();
	});
	
	$scope.changeContents = function (content) {
		$(".contentDetailCourse").hide();
		$('span[id^="contentName"]').removeClass("active");
		$("#contentName" + content).addClass("active");
		$("#contentDetailCourse" + content).show();
	}
	
	//Forward to buying flow to buy the course.
	$scope.fowardToBuyCoursePage = function() {
		$location.path('/courses/coursePayment/' + $stateParams.courseId);
	}
	/*********   Rating function   ************/
	$scope.lsRateLevel5 = [];
	$scope.rateLevel5Percentage = 0.0;
	
	$scope.lsRateLevel4 = [];
	$scope.rateLevel4Percentage = 0.0;
	
	$scope.lsRateLevel3 = [];
	$scope.rateLevel3Percentage = 0.0;
	
	$scope.lsRateLevel2 = [];
	$scope.rateLevel2Percentage = 0.0;
	
	$scope.lsRateLevel1 = [];
	$scope.rateLevel1Percentage = 0.0;
	
	$scope.loadRatings = function(){
		$scope.lsRatings = CourseRatingFactory.getAllRatingByCourseId.query({courseId: $stateParams.courseId}, function(ratingData){
			if(typeof ratingData !== "undefined" && ratingData != null
					&& ratingData.length > 0){
				/* Calculate rating level */
				for(var i=0;i< ratingData.length; i++){
					var r = ratingData[i];
					if(r.ratingStar == 1){$scope.lsRateLevel1.push(r);}
					if(r.ratingStar == 2){$scope.lsRateLevel2.push(r);}
					if(r.ratingStar == 3){$scope.lsRateLevel3.push(r);}
					if(r.ratingStar == 4){$scope.lsRateLevel4.push(r);}
					if(r.ratingStar == 5){$scope.lsRateLevel5.push(r);}
					
					//Summarize emotion
					if(typeof r.ratingEmotion !== "undefined" && r.ratingEmotion != null){
						if(typeof $scope.ratingEmotionMap[r.ratingEmotion] === "undefined" 
							|| $scope.ratingEmotionMap[r.ratingEmotion] == null){
							$scope.ratingEmotionMap[r.ratingEmotion] = [r];
						}else{
							$scope.ratingEmotionMap[r.ratingEmotion].push(r);
						}
					}
				}
				/* Calculate rating percentage */
				$scope.rateLevel1Percentage = (100 * $scope.lsRateLevel1.length/ratingData.length).toFixed(2);
				$scope.rateLevel2Percentage = (100 * $scope.lsRateLevel2.length/ratingData.length).toFixed(2);
				$scope.rateLevel3Percentage = (100 * $scope.lsRateLevel3.length/ratingData.length).toFixed(2);
				$scope.rateLevel4Percentage = (100 * $scope.lsRateLevel4.length/ratingData.length).toFixed(2);
				$scope.rateLevel5Percentage = (100 * $scope.lsRateLevel5.length/ratingData.length).toFixed(2);
				
				/* Calculate Avg. rate level */
				$scope.averageRateLevel = (($scope.lsRateLevel1.length + $scope.lsRateLevel2.length * 2 + $scope.lsRateLevel3.length * 3
				+ $scope.lsRateLevel4.length*4 + $scope.lsRateLevel5.length*5)/ratingData.length).toFixed(2);
				$scope.fullRatingData = ratingData;
				$scope.course.rating = $scope.averageRateLevel;
				CourseFactory.CourseService.update($scope.course);			
			}
			
		});
	}
	
	$scope.filterRating = function(level){
		for(var i=1;i<=5;i++){
            $scope.clearFiltering(i);
          }
		if(level == 1) {
			$scope.lsRatings = $scope.lsRateLevel1;
			$scope.showClearFilterBtn(1);
		}
		if(level == 2) {
			$scope.lsRatings = $scope.lsRateLevel2;
			$scope.showClearFilterBtn(2);
		}
		if(level == 3) {
			$scope.lsRatings = $scope.lsRateLevel3;
			$scope.showClearFilterBtn(3);
		}
		if(level == 4) {
			$scope.lsRatings = $scope.lsRateLevel4;
			$scope.showClearFilterBtn(4);
		}
		if(level == 5) {
			$scope.lsRatings = $scope.lsRateLevel5;
			$scope.showClearFilterBtn(5);
		}
	}
	$scope.showClearFilterBtn = function(level){
		$('.btn-rating-filter-'+level).removeClass('closed');
		$('.btn-rating-filter-'+level).addClass('open');
	}
	
	$scope.clearFiltering = function(level){
		$scope.lsRatings = $scope.fullRatingData;
		$("*[class^='btn-rating-filter']").removeClass('open');
		$("*[class^='btn-rating-filter']").addClass('closed');
	} 
	
	/*********  END Rating function   ************/
	$scope.insertCourseRating = function(rating) {
		rating.userFullName = $rootScope.signedInUser.sub;
		rating.avatarUrl = $rootScope.signedInUser.avataUrl;
		rating.ratingStar = $scope.rate;
		rating.courseId = $stateParams.courseId;
		
		CourseRatingFactory.crudService.save(rating, function(data){
			/* Reload course rating*/
			$scope.lsRatings = CourseRatingFactory.getAllRatingByCourseId.query({courseId: $stateParams.courseId});
			//TODO comment out to avoid refresh page, need to find the right way to load rating.
			//$state.refresh();
		});
	}
	
	$scope.rate = 0;
	$scope.rateFunction = function(rating) {
		$scope.rate = rating;
	}
	
	$scope.isBought = false;
	if ($rootScope.signedInUser != null) {
		BoughtCourseFactory.checkBoughtCourse.get({courseId: $stateParams.courseId}, function(data) {
			$scope.isBought = data.isBought;
		});
	}
	//Buy course immediately not go through the buying flow (use for free course)
	$scope.buyCourse = function() {
		if($scope.course.helperCourse == 1)
		{
			$location.path('/courses/learningCourse/' + $scope.course.courseId);
		}else{
			var boughtCourse = {userId: $rootScope.signedInUser.jti, courseId: $stateParams.courseId};
			BoughtCourseFactory.createBoughtCourse.save(boughtCourse, function(dat){
				$location.path('/courses/my-courses/');
			});
		}
	}
	$scope.continueToLearn = function(){
		$location.path('/courses/learningCourse/' + $scope.course.courseId);
	}
	/* Share course on Facebook */
	$scope.shareWithFacebook = function(){
		FB.ui({
            method: 'feed',
            name: 'SONGCANBANG.ORG',
            link: $scope.urlPage,
            caption: $scope.course.title,
            picture: $scope.course.imageUrl,
            description: $scope.course.contentSummary
        }, function(response) {
            if(response && response.post_id){}
            else{}
        });
	}
	$scope.couponCodeTxt = "";
	$scope.applyCoupon = function(){
		LoadCouponDefFactory.get({ccode: $scope.couponCodeTxt}, function(couponMaster){
			if(typeof couponMaster !== "undefined" && couponMaster != null){
				$scope.course.discountPrice = Math.ceil((100 - couponMaster.discount)* $scope.course.price/100);
			}
		});
	}
});