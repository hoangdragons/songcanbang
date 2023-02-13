
/*
 http://docs.angularjs.org/api/ngResource.$resource

 Default ngResources are defined as

 'get':    {method:'GET'},
 'save':   {method:'POST'},
 'query':  {method:'GET', isArray:true},
 'remove': {method:'DELETE'},
 'delete': {method:'DELETE'}
 */
/**Upload service**/
services.factory('FileUpload', function ($resource, $localStorage) {
    return $resource(app.idmUrl+'/rest-api/file/file-upload', {}, {
        upload: { 
        		method: 'POST', 
        		transformRequest: angular.identity, 
        		headers: { 'Content-Type': undefined , 'Authorization':$localStorage.jwt}
        }
    })
});

/**Video Upload service**/
services.factory('VideoUpload', function ($resource, $localStorage) {
    return $resource(app.idmUrl+'/rest-api/file/video-upload', {}, {
        upload: { 
        		method: 'POST', 
        		transformRequest: angular.identity, 
        		headers: { 'Content-Type': undefined , 'Authorization':$localStorage.jwt}
        }
    })
});

/** Image Upload service **/
services.factory('ImageUpload', function ($resource, $localStorage) {
    return $resource(app.idmUrl+'/rest-api/file/image-upload', {}, {
        upload: { 
        		method: 'POST', 
        		transformRequest: angular.identity, 
        		headers: { 'Content-Type': undefined , 'Authorization':$localStorage.jwt}
        }
    })
});
/*User services*/
services.factory('UsersFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user', {}, {
        update: { method: 'PUT'},
        create: { method: 'POST'}
    })
});

services.factory('UserFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/id/:id', {id: '@id'}, {
        show: { method: 'GET' },
        deleteUser: { method: 'DELETE' }
    })
});

services.factory('UserSearchFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/search/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});
services.factory('UserSearchEmailFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/search-email', {}, {
        search: { method: 'POST', isArray: false }
    })
});
services.factory('UserSearchLoginNameFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/search-login-name/:loginName', {loginName:'@loginName'}, {
        search: { method: 'GET', isArray: false }
    })
});

services.factory('UserPaginationFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/load-with-paging/:limit/:offset', {}, {
        search: { method: 'GET', isArray: true }
    })
});

services.factory('UserCountFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/count', {}, {
        count: { method: 'GET'}
    })
});

services.factory('UserRegisterFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/register', {}, {
        register: { method: 'POST'}
    })
});

services.factory('RegisterConfirmFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/register-confirm/:email/:token', {}, {
        confirm: { method: 'GET'}
    })
});
services.factory('UserResetPasswordFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/reset-passwd', {}, {
        req: { method: 'POST'}
    })
});
services.factory('ResetPasswordConfirmFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/user/reset-passwd/:email/:token', {}, {
        confirm: { method: 'GET'}
    })
});