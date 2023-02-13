/*
 http://docs.angularjs.org/api/ngResource.$resource

 Default ngResources are defined as

 'get':    {method:'GET'},
 'save':   {method:'POST'},
 'query':  {method:'GET', isArray:true},
 'remove': {method:'DELETE'},
 'delete': {method:'DELETE'}
 */
var service = angular.module('dolphin.service', ['ngResource']);

//init
service.factory('CategoryFactory', CategoryFactory);

service.factory('CourseFactory', CourseFactory);

service.factory('CourseChapterFactory', CourseChapterFactory);

service.factory('LoginFactory', LoginFactory);

service.factory('LogoutFactory', LogoutFactory);

service.factory('BoughtCourseFactory', BoughtCourseFactory);

service.factory('CourseLessonFactory', CourseLessonFactory);

service.factory('CourseQuestionFactory', CourseQuestionFactory);

service.factory('CourseCommentFactory', CourseCommentFactory);

service.factory('CourseSubCommentFactory', CourseSubCommentFactory);

service.factory('CourseRatingFactory', CourseRatingFactory);

service.factory('MagazinesFactory', MagazinesFactory);

//implement factory
function CategoryFactory($resource, contextPath) {
	return { 
		getAll : $resource(contextPath.cmscore + '/rest-api/category/', {}),
		courseCount : $resource(contextPath.cmscore + '/rest-api/category/course-count/:categoryId', {categoryId : '@categoryId'}),
		getCategoryById : $resource(contextPath.cmscore + '/rest-api/category/id/:id', {id : '@id'})
	}
}

function CourseFactory($resource, contextPath) {
	return {
		courseCount : $resource(contextPath.cmscore + '/rest-api/course/course-count/:categoryId', {categoryId : '@categoryId'}),
		getListCourseHomePage : $resource(contextPath.cmscore + '/rest-api/course/get-list-course/:sortType/:categoryId', {sortType : '@sortType', categoryId: '@categoryId'}),
		getListCourseWithRcp : $resource(contextPath.cmscore + '/rest-api/course/get-list-course-with-rcp/:page/:categoryId/:orderBy/:rcp',
				{page : '@page', categoryId: '@categoryId', orderBy: '@orderBy', rcp: '@rcp'}),
		getListCourse : $resource(contextPath.cmscore + '/rest-api/course/get-list-course/:page/:categoryId/:orderBy', {page : '@page', categoryId: '@categoryId', orderBy: '@orderBy'}),
		
		searchListCourse : $resource(contextPath.cmscore + '/rest-api/course/search-list-course/:page/:searchText/:orderBy', {page : '@page', searchText: '@searchText', orderBy: '@orderBy'}),
		
		getCourseById : $resource(contextPath.cmscore + '/rest-api/course/id/:id', {id : '@id'}),
		
		CourseService : $resource(contextPath.cmscore + '/rest-api/course', {}, {
			update: {method: 'PUT'}
		}),
		
		loadHelperCourse : $resource(contextPath.cmscore + '/rest-api/course/load-helper-course/', {}),
		
		loadFullCourseInfo : $resource(contextPath.cmscore + '/rest-api/course/load/:id', {id : '@id'}),
		
		loadFullCourseInfoFree : $resource(contextPath.cmscore + '/rest-api/course/free-load/:id', {id : '@id'}),
		
		getTotalPageCourse : $resource(contextPath.cmscore + '/rest-api/course/get-total-page-course/:categoryId', {categoryId : '@categoryId'}),
		
		getTotalPageSearchCourse : $resource(contextPath.cmscore + '/rest-api/course/get-total-page-search-course/:searchText', {searchText : '@searchText'}),
		
		getCourseInformationForPayment : $resource(contextPath.cmscore + '/rest-api/course/get-course-information-payment/:courseId', {courseId : '@courseId'})
	}
}

function CourseChapterFactory($resource, contextPath) {
	return {
		getAllCourseChapterByCourseId : $resource(contextPath.cmscore + '/rest-api/course-chapter/get-list-chapter/:courseId', {courseId : '@courseId'})
	}
}

function LoginFactory($http, contextPath) {
    var service = {};
    service.login = login;
    return service;

    function login(user, callback) {
        $http.post(contextPath.idm + '/rest-api/security/login', user).success(function (response) {
        	callback(response);
        });
    }
}

function LogoutFactory($resource, contextPath) {
	return $resource(contextPath.idm + '/rest-api/security/logout', {}, {
        logout: { method: 'GET'}
    })
}

function BoughtCourseFactory($resource, contextPath) {
	return {
		createBoughtCourse : $resource(contextPath.cmscore + '/rest-api/bought-course', {}),
		
		getListCourseByUserId : $resource(contextPath.cmscore + '/rest-api/bought-course/get-course-by-user-id/:page', 
				{page : '@page'}),
		
		getPagingCourse : $resource(contextPath.cmscore + '/rest-api/bought-course/get-paging-course', 
				{}),
		
		checkBoughtCourse : $resource(contextPath.cmscore + '/rest-api/bought-course/check-bought-course/:courseId', 
				{courseId: '@courseId'})
	}
}

function CourseLessonFactory($resource, contextPath) {
	return {
		getCourseLessonById : $resource(contextPath.cmscore + '/rest-api/course-lesson/:lessonId', {lessonId : '@lessonId'})
	}
}

function CourseQuestionFactory($resource, contextPath) {
	return {
		createQuestion : $resource(contextPath.cmscore + '/rest-api/course-question', {}),
		
		getListQuestionByCourseId : $resource(contextPath.cmscore + '/rest-api/course-question/get-list-question/:courseId', {courseId : '@courseId'})
	}
}

function CourseCommentFactory($resource, contextPath) {
	return {
		createComment : $resource(contextPath.cmscore + '/rest-api/course-comment', {}), 
		
		getListCommentByCourseId : $resource(contextPath.cmscore + '/rest-api/course-comment/get-list-comment/:courseId', {courseId : '@courseId'})
	}
}

function CourseSubCommentFactory($resource, contextPath) {
	return {
		createSubComment : $resource(contextPath.cmscore + '/rest-api/course-sub-comment', {})
	}
}

function CourseRatingFactory($resource, contextPath) {
	return {
		crudService : $resource(contextPath.cmscore + '/rest-api/course-rating', {},{
			update: {method: 'PUT'}
		}),
		getAllRatingByCourseId : $resource(contextPath.cmscore + '/rest-api/course-rating/get-list-rating/:courseId', {courseId : '@courseId'}),
		getUserRating: $resource(contextPath.cmscore + '/rest-api/course-rating/get-user-rating/:courseId', {courseId : '@courseId'})
	}
}

function MagazinesFactory($resource, contextPath) {
	return {
		getListMagazines : $resource(contextPath.cmscore + '/rest-api/magazines/get-list-magazines/:page', {page : '@page'}),
	
		getTotalPageMagazines : $resource(contextPath.cmscore + '/rest-api/magazines/get-total-page-magazines', {}),
		
		getMagazineById : $resource(contextPath.cmscore + '/rest-api/magazines/id/:id', {id : '@id'})
	}
}

//service.factory('Course10Factory', function ($resource, contextPath) {
//    return $resource(contextPath.cmscore + '/rest-api/course/public/topten', {}, {
//    })
//});
//
//service.factory('Magazine10Factory', function ($resource, contextPath) {
//    return $resource(contextPath.cmscore + '/rest-api/magazines/public/topten', {}, {
//    })
//});
//service.factory('Teacher10Factory', function ($resource, contextPath) {
//    return $resource(contextPath.cmscore + '/rest-api/teacher/public/topten', {}, {
//    })
//});

service.factory('LearningInfoFactory', function ($resource, contextPath) {
    return $resource(contextPath.cmscore + '/rest-api/learning-info', {}, {
        push: { method: 'POST' },
        update: {method: 'PUT'},
    	deleteLearningInfo: { method: 'DELETE' }
    })
});

service.factory('ContactUsFactory', function ($resource, contextPath) {
    return $resource(contextPath.cmscore + '/rest-api/contactus', {}, {
        save: { method: 'POST' },
        update: {method: 'PUT'},
    	deleteContactUs: { method: 'DELETE' }
    })
});
service.factory('AffiliateInfoFactory', function ($resource, contextPath) {
    return $resource(contextPath.cmscore + '/rest-api/affiliate-info', {}, {
        save: { method: 'POST' },
        update: {method: 'PUT'},
    	deleteAffiliateInfo: { method: 'DELETE' }
    })
});

//Service declaration

service.factory('LoadCouponDefFactory', function ($resource, contextPath) {
    return $resource(contextPath.cmscore + '/rest-api/coupon/load-definition/:ccode', {ccode : '@ccode'})
});