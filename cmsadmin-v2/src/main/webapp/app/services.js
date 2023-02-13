'use strict';

var services = angular.module('admin.services', ['ngResource']);

services.factory('CategoriesFactory', function ($resource, $localStorage) {
    return $resource(app.cmsCoreUrl + '/rest-api/category', {}, {
        update: { method: 'PUT'},
        create: { method: 'POST'}
    })
});

services.factory('CategoryFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/category/id/:id', {id: '@id'}, {
        show: { method: 'GET' },
    	deleteCat: { method: 'DELETE' }
    })
});

services.factory('CategorySearchFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/category/search/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});

/*Course search*/
services.factory('CoursesFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/course', {}, {
        update: { method: 'PUT'},
        create: { method: 'POST'}
    })
});

services.factory('CourseFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/course/id/:id', {id: '@id'}, {
        show: { method: 'GET' },
        load: {method: 'GET'},
    	deleteCourse: { method: 'DELETE' }
    })
});
services.factory('LoadCourseService', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/course/load/:id', {id: '@id'}, {
        load: {method: 'GET'}
    })
});

services.factory('CourseSearchFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/course/search/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});

services.factory('CourseSearchByCatFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/course/search-by-cat/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});

services.factory('LoginFactory', LoginService);

services.factory('LogoutFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/security/logout', {}, {
        logout: { method: 'GET'}
    })
});

function LoginService($http) {
    var service = {};
    service.login = login;
    return service;

    function login(user, callback) {
    	var conf= { headers:  {
            'Content-Type': 'application/json'
         }
        };
        $http.post(app.idmUrl + '/rest-api/security/login', user,conf)
            .success(function (response) {
            	callback(response);
            });
    }
}

services.factory('ClaimService', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/security/getLoggedInUser', {}, {
    	getLoggedInUser: { method: 'GET'}
    })
});

/**Upload service**/
services.factory('FileUpload', function ($resource, $localStorage) {
    return $resource(app.idmUrl + '/rest-api/file/file-upload', {}, {
        upload: { 
                method: 'POST', 
                transformRequest: angular.identity, 
                headers: { 'Content-Type': undefined , 'Authorization':$localStorage.jwt}
        }
    })
});

/**Video Upload service**/
services.factory('VideoUpload', function ($resource, $localStorage) {
    return $resource(app.idmUrl + '/rest-api/file/video-upload', {}, {
        upload: { 
                method: 'POST', 
                transformRequest: angular.identity, 
                headers: { 'Content-Type': undefined , 'Authorization':$localStorage.jwt}
        }
    })
});

/** Image Upload service **/
services.factory('ImageUpload', function ($resource, $localStorage) {
    return $resource(app.idmUrl + '/rest-api/file/image-upload', {}, {
        upload: { 
                method: 'POST', 
                transformRequest: angular.identity, 
                headers: { 'Content-Type': undefined , 'Authorization':$localStorage.jwt}
        }
    })
});

/*User services*/
services.factory('UsersFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/change-pass', {}, {
        changePass: { method: 'PUT'}
    })
});

services.factory('TeachersFactory', function ($resource, $localStorage) {
    return $resource(app.cmsCoreUrl + '/rest-api/teacher', {}, {
        update: { method: 'PUT'},
        create: { method: 'POST'}
    })
});

services.factory('TeacherFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/teacher/id/:id', {id: '@id'}, {
        show: { method: 'GET' },
        deleteTeacher: { method: 'DELETE' }
    })
});

services.factory('TeacherSearchFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/teacher/search/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});


services.factory('PublicationsFactory', function ($resource, $localStorage) {
    return $resource(app.cmsCoreUrl + '/rest-api/magazines', {}, {
        update: { method: 'PUT'},
        create: { method: 'POST'}
    })
});

services.factory('PublicationFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/magazines/id/:id', {id: '@id'}, {
        show: { method: 'GET' },
        deletePublication: { method: 'DELETE' }
    })
});

services.factory('PublicationSearchFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/magazines/search/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});

services.factory('CourseQuestionFactory', CourseQuestionFactory);

services.factory('CourseCommentFactory', CourseCommentFactory);

services.factory('CourseSubCommentFactory', CourseSubCommentFactory);

services.factory('CourseRatingFactory', CourseRatingFactory);

function CourseQuestionFactory($resource) {
	return {
		createQuestion : $resource(app.cmsCoreUrl + '/rest-api/course-question', {},
				{update:{method:'PUT'}}
		),
		getListQuestionByCourseId : $resource(app.cmsCoreUrl + '/rest-api/course-question/get-list-question/:courseId', {courseId : '@courseId'}),
		findByCourse : $resource(app.cmsCoreUrl + '/rest-api/course-question/find-by-course/:courseId', {courseId : '@courseId'})
	}
}

function CourseCommentFactory($resource) {
	return {
		createComment : $resource(app.cmsCoreUrl + '/rest-api/course-comment', {}), 
		
		getListCommentByCourseId : $resource(app.cmsCoreUrl + '/rest-api/course-comment/get-list-comment/:courseId', {courseId : '@courseId'})
	}
}

function CourseSubCommentFactory($resource) {
	return {
		createSubComment : $resource(app.cmsCoreUrl + '/rest-api/course-sub-comment', {})
	}
}

function CourseRatingFactory($resource) {
	return {
		createRating : $resource(app.cmsCoreUrl + '/rest-api/course-rating', {}),
		
		getAllRatingByCourseId : $resource(app.cmsCoreUrl + '/rest-api/course-rating/get-list-rating/:courseId', {courseId : '@courseId'})
	}
}
function GenericCourseService($resource){
	return {
    	findTeachingCourses: $resource(app.cmsCoreUrl + '/rest-api/course/find-teaching-courses', {}),
    	loadHelperCourse : $resource(app.cmsCoreUrl + '/rest-api/course/load-helper-course/', {})
    }
}
services.factory('GenericCourseService', GenericCourseService);