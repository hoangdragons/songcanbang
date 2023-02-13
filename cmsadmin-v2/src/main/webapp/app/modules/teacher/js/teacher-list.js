controllers.controller('TeacherListController', ['$scope','$filter','$compile', 
												  'TeachersFactory','TeacherFactory','TeacherSearchFactory', 
                                                  '$location', '$localStorage',
  function ($scope, $filter, $compile, TeachersFactory,TeacherFactory,TeacherSearchFactory,
		  $location, $localStorage) {
	 
    $scope.edit = function(teacher) {
    	var teacherId = teacher.teacherId;
       $location.path('/app/teacherDetail/' + teacherId);
    };
    var today = new Date();
    
    $scope.deleteTeacher = function (teacher) {
      var confirm=window.confirm($filter('translate')('common.CONFIRM_DELETE') + teacher.teacherName);
      if(!confirm) 
        return;
    	var teacherId = teacher.teacherId;
        if (typeof(teacherId) !== "undefined") {
        	TeacherFactory.deleteTeacher({ id: teacherId }, function(dat){
            $scope.teachers = TeachersFactory.query();
          });       	
        }
        
    };

    // callback for ng-click 'createUser':
    $scope.create = function () {
        $location.path('/app/teacherCreate');
    };
    
    $scope.loadTeacherDetail = function (teacher) {
    	var teacherId = teacher.teacherId;
    	 if (typeof(teacherId) !== "undefined") {
    		 $location.path('/app/teacherList/'+ teacherId);
         }
        
    };
  
    $scope.teachers = TeachersFactory.query();
    
}]);// ENd of TeacherListController