var service=angular.module("dolphin.service",["ngResource"]);service.factory("CategoryFactory",CategoryFactory);service.factory("CourseFactory",CourseFactory);service.factory("CourseChapterFactory",CourseChapterFactory);service.factory("LoginFactory",LoginFactory);service.factory("LogoutFactory",LogoutFactory);service.factory("BoughtCourseFactory",BoughtCourseFactory);service.factory("CourseLessonFactory",CourseLessonFactory);service.factory("CourseQuestionFactory",CourseQuestionFactory);service.factory("CourseCommentFactory",CourseCommentFactory);service.factory("CourseSubCommentFactory",CourseSubCommentFactory);service.factory("CourseRatingFactory",CourseRatingFactory);service.factory("MagazinesFactory",MagazinesFactory);function CategoryFactory(b,a){return{getAll:b(a.cmscore+"/rest-api/category/",{}),courseCount:b(a.cmscore+"/rest-api/category/course-count/:categoryId",{categoryId:"@categoryId"}),getCategoryById:b(a.cmscore+"/rest-api/category/id/:id",{id:"@id"})}}function CourseFactory(b,a){return{courseCount:b(a.cmscore+"/rest-api/course/course-count/:categoryId",{categoryId:"@categoryId"}),getListCourseHomePage:b(a.cmscore+"/rest-api/course/get-list-course/:sortType/:categoryId",{sortType:"@sortType",categoryId:"@categoryId"}),getListCourseWithRcp:b(a.cmscore+"/rest-api/course/get-list-course-with-rcp/:page/:categoryId/:orderBy/:rcp",{page:"@page",categoryId:"@categoryId",orderBy:"@orderBy",rcp:"@rcp"}),getListCourse:b(a.cmscore+"/rest-api/course/get-list-course/:page/:categoryId/:orderBy",{page:"@page",categoryId:"@categoryId",orderBy:"@orderBy"}),searchListCourse:b(a.cmscore+"/rest-api/course/search-list-course/:page/:searchText/:orderBy",{page:"@page",searchText:"@searchText",orderBy:"@orderBy"}),getCourseById:b(a.cmscore+"/rest-api/course/id/:id",{id:"@id"}),CourseService:b(a.cmscore+"/rest-api/course",{},{update:{method:"PUT"}}),loadHelperCourse:b(a.cmscore+"/rest-api/course/load-helper-course/",{}),loadFullCourseInfo:b(a.cmscore+"/rest-api/course/load/:id",{id:"@id"}),loadFullCourseInfoFree:b(a.cmscore+"/rest-api/course/free-load/:id",{id:"@id"}),getTotalPageCourse:b(a.cmscore+"/rest-api/course/get-total-page-course/:categoryId",{categoryId:"@categoryId"}),getTotalPageSearchCourse:b(a.cmscore+"/rest-api/course/get-total-page-search-course/:searchText",{searchText:"@searchText"}),getCourseInformationForPayment:b(a.cmscore+"/rest-api/course/get-course-information-payment/:courseId",{courseId:"@courseId"})}}function CourseChapterFactory(b,a){return{getAllCourseChapterByCourseId:b(a.cmscore+"/rest-api/course-chapter/get-list-chapter/:courseId",{courseId:"@courseId"})}}function LoginFactory(d,c){var a={};a.login=b;return a;function b(e,f){d.post(c.idm+"/rest-api/security/login",e).success(function(g){f(g)})}}function LogoutFactory(b,a){return b(a.idm+"/rest-api/security/logout",{},{logout:{method:"GET"}})}function BoughtCourseFactory(b,a){return{createBoughtCourse:b(a.cmscore+"/rest-api/bought-course",{}),getListCourseByUserId:b(a.cmscore+"/rest-api/bought-course/get-course-by-user-id/:page",{page:"@page"}),getPagingCourse:b(a.cmscore+"/rest-api/bought-course/get-paging-course",{}),checkBoughtCourse:b(a.cmscore+"/rest-api/bought-course/check-bought-course/:courseId",{courseId:"@courseId"})}}function CourseLessonFactory(b,a){return{getCourseLessonById:b(a.cmscore+"/rest-api/course-lesson/:lessonId",{lessonId:"@lessonId"})}}function CourseQuestionFactory(b,a){return{createQuestion:b(a.cmscore+"/rest-api/course-question",{}),getListQuestionByCourseId:b(a.cmscore+"/rest-api/course-question/get-list-question/:courseId",{courseId:"@courseId"})}}function CourseCommentFactory(b,a){return{createComment:b(a.cmscore+"/rest-api/course-comment",{}),getListCommentByCourseId:b(a.cmscore+"/rest-api/course-comment/get-list-comment/:courseId",{courseId:"@courseId"})}}function CourseSubCommentFactory(b,a){return{createSubComment:b(a.cmscore+"/rest-api/course-sub-comment",{})}}function CourseRatingFactory(b,a){return{crudService:b(a.cmscore+"/rest-api/course-rating",{},{update:{method:"PUT"}}),getAllRatingByCourseId:b(a.cmscore+"/rest-api/course-rating/get-list-rating/:courseId",{courseId:"@courseId"}),getUserRating:b(a.cmscore+"/rest-api/course-rating/get-user-rating/:courseId",{courseId:"@courseId"})}}function MagazinesFactory(b,a){return{getListMagazines:b(a.cmscore+"/rest-api/magazines/get-list-magazines/:page",{page:"@page"}),getTotalPageMagazines:b(a.cmscore+"/rest-api/magazines/get-total-page-magazines",{}),getMagazineById:b(a.cmscore+"/rest-api/magazines/id/:id",{id:"@id"})}}service.factory("LearningInfoFactory",function(b,a){return b(a.cmscore+"/rest-api/learning-info",{},{push:{method:"POST"},update:{method:"PUT"},deleteLearningInfo:{method:"DELETE"}})});service.factory("ContactUsFactory",function(b,a){return b(a.cmscore+"/rest-api/contactus",{},{save:{method:"POST"},update:{method:"PUT"},deleteContactUs:{method:"DELETE"}})});service.factory("AffiliateInfoFactory",function(b,a){return b(a.cmscore+"/rest-api/affiliate-info",{},{save:{method:"POST"},update:{method:"PUT"},deleteAffiliateInfo:{method:"DELETE"}})});service.factory("LoadCouponDefFactory",function(b,a){return b(a.cmscore+"/rest-api/coupon/load-definition/:ccode",{ccode:"@ccode"})});