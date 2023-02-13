//controller of customerDetail.html
app.controller('MyCoursesController', function($scope, $rootScope, $location, BoughtCourseFactory, CourseFactory) {
	if ($rootScope.signedInUser == null) {
		$location.path('/homepage');
	}
	$scope.listCourse = [];
	$scope.reloadLsCourse = function (page) {
		$scope.p = page;
		$scope.listCourse = BoughtCourseFactory.getListCourseByUserId.query({userId: $rootScope.signedInUser.jti, page: $scope.p}, function(d){
			console.log(d);
		});
		$scope.paging = BoughtCourseFactory.getPagingCourse.get({userId: $rootScope.signedInUser.jti});
	}
	
	$scope.reloadLsCourse(1);
	
	$scope.listHelperCourse = CourseFactory.loadHelperCourse.query(function(dat){
		console.log('helper course length: '+dat.length);
	});
	
});

/** ============================ **/

//controller of learningCourse.html
app.controller('LearningCourseController', function($sce, $scope, $rootScope, $location, $stateParams, $filter, $timeout, CourseFactory, CourseChapterFactory, 
		CourseLessonFactory, CourseQuestionFactory, CourseCommentFactory, CourseSubCommentFactory, CourseRatingFactory, LearningInfoFactory) {
	 $scope.overviewTabTitle  = $filter('translate')('learning.overviewTabTitle');	
	 $scope.courseContentTabTitle  = $filter('translate')('learning.courseContentTabTitle');
	 $scope.qaTabTitle  = $filter('translate')('learning.qaTabTitle');
	 $scope.teacherTabTitle  = $filter('translate')('learning.teacherTabTitle');
	 $scope.announcementsTabTitle  = $filter('translate')('learning.announcementsTabTitle');
	 
	if ($rootScope.signedInUser == null) {
		$location.path('/homepage');
	}
	////////////// Star rating ///////////////////
	$scope.rating = {};
	$scope.rating.ratingStar = 0;
	/* Truong hop rating lan dau tien */
	$scope.saveCourseRating = function(rating) {
		if(typeof rating.courseId ==="undefined" || typeof rating.createdBy === "undefined"
			|| rating.courseId == "" || rating.createdBy == "" || rating.createdBy == null){
			rating.userFullName = $rootScope.signedInUser.sub;
			rating.avatarUrl = $rootScope.signedInUser.avataUrl;
			/*rating.ratingStar = $scope.rate;*/
			rating.courseId = $stateParams.courseId;
			rating.createdBy = $rootScope.signedInUser.jti;
			
			CourseRatingFactory.crudService.save(rating, function(data){
				alert($filter('translate')('rating.SAVE_SUCCESS'));
				$scope.closeDialog();
			});
		}else{/* Truong hop rate lai */
			rating.courseId = $stateParams.courseId;
			rating.updatedBy = $rootScope.signedInUser.jti;
			CourseRatingFactory.crudService.update(rating, function(data){
				alert($filter('translate')('rating.SAVE_SUCCESS'));
				$scope.closeDialog();
			});
		}
		
	}
	$scope.openRatingForm = function(){
		console.log($scope.rating);
		$("#ratingStarComment").show();
	}
	$scope.closeDialog = function(){
		$("#ratingStarComment").hide();
	}
	//////////// END star rating /////////////////
	
	
	$scope.course = CourseFactory.loadFullCourseInfo.get({id: $stateParams.courseId}, function(data){
		$scope.options = {
				type: 'mp4',
				width: "100%",
				height: 239,
				autostart: false
			};
		$scope.overviewVideoUrl = $sce.trustAsResourceUrl(data.videoUrl);
		CourseRatingFactory.getUserRating.get({courseId:$stateParams.courseId},function(ratingData){
			if(typeof ratingData !== "undefined" && ratingData != null
					&& ratingData.courseId != null && ratingData.createdBy != null){
				for(var i=0;typeof ratingData !== "undefined" && i< ratingData.length; i++){
					var r = ratingData[i];
					
				}
				$scope.rating = ratingData;
			}
		});
	});
	
	$scope.listQuestion = CourseQuestionFactory.getListQuestionByCourseId.query({courseId: $stateParams.courseId}, function(e){
		console.log(e);
	});
	
	$scope.listComment = CourseCommentFactory.getListCommentByCourseId.query({courseId: $stateParams.courseId});
	
	$scope.changeLesson = function(material) {
		$scope.selectedMaterial = material;
	}
	
	$scope.insertCourseQuestion = function(question) {
		if (typeof question != "undefined" && question.question.trim() != "") {
			question.courseId = $stateParams.courseId;
			question.userId = $rootScope.signedInUser.jti;
			question.userAvataUrl = $rootScope.signedInUser.avataUrl;
			question.userName = $rootScope.signedInUser.aud;
			CourseQuestionFactory.createQuestion.save(question, function(data){
				$scope.listQuestion = CourseQuestionFactory.getListQuestionByCourseId.query({courseId: $stateParams.courseId});
				$("#questionArea").val("");
				alert("Cám ơn bạn đã gửi câu hỏi cho giảng viên. Câu hỏi của bạn sẽ được kiểm duyệt và gửi đến cho giảng viên trả lời trong thời gian sớm nhất có thể.");
			});
			
		}
	}
	
	$scope.insertComment = function(comment) {
		if (typeof comment != "undefined" && comment.comment.trim() != "") {
			comment.courseId = $stateParams.courseId;
			comment.userFullName = $rootScope.signedInUser.sub;
			comment.avatarUrl = $rootScope.signedInUser.avataUrl;
			CourseCommentFactory.createComment.save(comment, function(data) {
				$("#commentArea").val("");
				$scope.listComment = CourseCommentFactory.getListCommentByCourseId.query({courseId: $stateParams.courseId});
			});
		}
	}
	
	$scope.createSubComment = function(subComment) {
		if (typeof subComment != "undefined" && subComment.comment.trim() != "") {
			subComment.userFullName = $rootScope.signedInUser.sub;
			subComment.avatarUrl = $rootScope.signedInUser.avataUrl;
			CourseSubCommentFactory.createSubComment.save(subComment, function(data) {
				$scope.listComment = CourseCommentFactory.getListCommentByCourseId.query({courseId: $stateParams.courseId});
			});
		}
	}
	$scope.showItem = function(mat){
		// mat.type: 1 - video, 2: voice, 3: Picture, 4: document. 
		if(mat.type == 1 || mat.type == 2){
			$scope.previewVideoUrl(mat.url);
		}
	}
	
	$scope.hideQuestionForm = function(){
		$(".new-question-form").css("display","none");
	}
	
	$scope.showQuestionForm = function(){
		$(".new-question-form").css("display","block");
	}

	$scope.checkComplete = function(mat){
		// Register completed material
		var infoDto = {materialId : mat.id, courseId : $scope.course.courseId, userId : $rootScope.signedInUser.jti, completed : (mat.isCompleted?1:0)};
		LearningInfoFactory.push(infoDto, 
		function(infoDto){
			$scope.course.completedMaterials = mat.isCompleted ? $scope.course.completedMaterials+1:$scope.course.completedMaterials-1;
		});
	}
	
	/* Emoticon */
	$scope.hideEmoticonList = function(selectedIcon){
		if(typeof selectedIcon !== "undefined" && selectedIcon !== ''){
			$scope.rating.ratingEmotion = selectedIcon;
		}
		
		$('.emoticon-list').removeClass('open');
		$('.emoticon-list').addClass('hide');
	}
	$scope.showEmoticonList = function(){
		$('.emoticon-list').removeClass('hide');
		$('.emoticon-list').addClass('open');
	}
	$scope.emoticonTimeout = function(){
		 $timeout($scope.hideEmoticonList(), 500);
	}
});

/** ============================ **/
