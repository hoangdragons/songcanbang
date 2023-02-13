var services = angular.module('homepage.services', ['ngResource']);

services.factory('CourseFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/course/public/topten', {}, {
    })
});

services.factory('MagazineFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/magazines/public/topten', {}, {
    })
});
services.factory('TeacherFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/teacher/public/topten', {}, {
    })
});
services.factory('CategoryFactory', function ($resource) {
    return $resource(app.cmsCoreUrl + '/rest-api/category', {}, {})
});
