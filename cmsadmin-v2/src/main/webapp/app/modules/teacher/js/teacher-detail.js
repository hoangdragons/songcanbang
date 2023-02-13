controllers.controller('TeacherDetailController', ['$scope', '$filter', '$stateParams', 
					   'TeacherFactory','TeachersFactory', '$location',
    function ($scope, $filter, $stateParams, TeacherFactory, TeachersFactory, $location) {
    	var _scope = $scope;
		$scope.changeUpload =  function(input){
            if (input.files && input.files[0]) {
                var r = new FileReader();
                r.onload = function (e) {
                    $scope.uploadImage(input.files[0]);
                    $scope.teacher.teacherImage = app.resourceBaseUrl + "/images/" + input.files[0].name;
                };
               r.readAsDataURL(input.files[0]);
            }
        };
	    // callback for ng-click 'insertOrUpdate':
		$scope.insertOrUpdate = function () {
			$scope.getTeacherDescContent();
            window.ignoreDC = true;
            TeachersFactory.update($scope.teacher,
            		function(data){
            			$location.path('/app/teacherList');
            		});
        };

        // callback for ng-click 'cancel':
        $scope.cancel = function () {
            window.ignoreDC = true;
            $location.path('/app/teacherList');
        };
        
        // bien trung gian nhan gia trij tu tinymce
        $scope.teacherDescText = $filter('translate')('course.teacher.TEACHER_INFO');

        // Model khong can thiet 
        $scope.teacherDescModel = $filter('translate')('course.teacher.TEACHER_INFO');
		$scope.getTeacherDescContent = function() {
		  $scope.teacher.teacherContent = $scope.teacherDescText;
		};
		$scope.setTeacherDescContent = function() {
	    	$scope.teacherDescModel = $scope.teacher.teacherContent;
		};

		$scope.teacherDescOptions = {
		    inline: false,
		    menubar: false,
		    /*plugins : 'advlist autolink link image lists charmap print preview',*/
		    plugins : 'advlist autolink link image lists charmap print preview textcolor colorpicker',
		    skin: 'lightgray',
		    toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
		    toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
		    theme : 'modern'
		    ,setup : function(ed) {
		    	var textContentTrigger = function(e) {
		          $scope.teacherDescText = ed.getContent();
		          $scope.$apply();
		        };
                ed.on('keyup',textContentTrigger);
                ed.on('ExecCommand', textContentTrigger);
	            ed.on('SetContent', function(e) {
	              if(!e.initial)
	                textContentTrigger(e);
	            });
            }
		};
        TeacherFactory.show({id: $stateParams.id}
        	, function(data){
        		$scope.teacher = data;
        		$scope.setTeacherDescContent();
        	});
    }]);

controllers.controller('TeacherCreateController', ['$scope', '$filter', 'TeachersFactory', '$location', '$localStorage',
    function ($scope, $filter, TeachersFactory, $location, $localStorage) {
        $scope.teacher = {};
        var _scope = $scope;
        $scope.changeUpload =  function(input){
            if (input.files && input.files[0]) {
                var r = new FileReader();
                r.onload = function (e) {
                    $scope.uploadImage(input.files[0]);
                    $scope.teacher.teacherImage = app.resourceBaseUrl + "/images/" + input.files[0].name;
                };
               r.readAsDataURL(input.files[0]);
            }
        };
        // callback for ng-click 'createNewUser':
        $scope.insertOrUpdate = function () {
        	$scope.getTeacherDescContent();
            window.ignoreDC = true;
            TeachersFactory.create($scope.teacher, function(data){
            	$location.path('/app/teacherList');
            });
        };
        // callback for ng-click 'cancel':
        $scope.cancel = function () {
            window.ignoreDC = true;
            $location.path('/app/teacherList');
        };
        
        // bien trung gian nhan gia trij tu tinymce
        $scope.teacherDescText = $filter('translate')('course.teacher.TEACHER_INFO');

        // Model khong can thiet 
        $scope.teacherDescModel = $filter('translate')('course.teacher.TEACHER_INFO');
		$scope.getTeacherDescContent = function() {
		  $scope.teacher.teacherContent = $scope.teacherDescText;
		};
		$scope.setTeacherDescContent = function() {
	    	$scope.teacherDescModel = $scope.teacher.teacherContent;
		};

		$scope.teacherDescOptions = {
		    inline: false,
		    menubar: false,
		    /*plugins : 'advlist autolink link image lists charmap print preview',*/
		    plugins : 'advlist autolink link image lists charmap print preview textcolor colorpicker',
		    skin: 'lightgray',
		    toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
		    toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
		    theme : 'modern'
		    ,setup : function(ed) {
		    	var textContentTrigger = function(e) {
		          $scope.teacherDescText = ed.getContent();
		          $scope.$apply();
		        };
                ed.on('keyup',textContentTrigger);
                ed.on('ExecCommand', textContentTrigger);
	            ed.on('SetContent', function(e) {
	              if(!e.initial)
	                textContentTrigger(e);
	            });
            }
		};		
    }]);
