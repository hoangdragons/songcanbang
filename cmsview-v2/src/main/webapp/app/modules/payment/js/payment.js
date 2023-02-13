/* controller of coursePayment.html*/
app.controller('CoursePaymentController', function($scope,$filter, $rootScope, $location, $stateParams,$localStorage, CourseFactory, BoughtCourseFactory) {
	if ($rootScope.signedInUser == null) {
		$location.path('/homepage');
	}
	
	$scope.listPage = ['coursePayment.STEP_1', 'coursePayment.STEP_2', 'coursePayment.STEP_3', 'coursePayment.STEP_4'];
	$scope.courses=[];
	if($stateParams.courseId != -1){
		CourseFactory.loadFullCourseInfoFree.get({id: $stateParams.courseId},
			function(course){
				$scope.courses.push(course);	
			}
		);
		
	}else{
		$scope.courses = $localStorage.shoppingCart;
	}
	
	$scope.userInfo = {
		userName : $rootScope.signedInUser.sub,
		email : $rootScope.signedInUser.email,
		telephone : $rootScope.signedInUser.telephone,
		birthday : $rootScope.signedInUser.birthday
	};
	
	$scope.step = 1;
	
	$scope.changeCheckoutType = function (checkoutType) {
		$scope.checkoutType = checkoutType;
	}
	
	$scope.nextPage = function () {
		if ($scope.step == 2 && typeof $scope.checkoutType == "undefined") {
			alert("Vui lòng chọn phương thức thanh toán");
			return;
		}
		if ($scope.step < 4) {
			if ($scope.step == 3) {
				if (confirm("Bạn có chắc muốn mua khóa học này không?")) {
					$scope.courses.forEach(function(course){
						//create bought course
						var boughtCourse = {userId: $rootScope.signedInUser.jti, courseId: course.courseId};
						BoughtCourseFactory.createBoughtCourse.save(boughtCourse);
						$scope.removeFromCart(course);
					});
				} else {
					return;
				}
			}
			$scope.step += 1;
		} else if ($scope.step == 4) {
			//forward to napas
			$location.path('/homepage');
		}
	}
	
	$scope.prevPage = function () {
		$scope.step -= 1;
	}
});