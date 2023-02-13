/* Role services*/
services.factory('RolesFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/role', {}, {
        update: { method: 'PUT'},
        create: { method: 'POST'}
    })
});

services.factory('RoleFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/role/id/:id', {id: '@id'}, {
        show: { method: 'GET' },
        deleteRole: { method: 'DELETE' }
    })
});
services.factory('RoleUpdateByUserFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/role/update-by-user', {}, {
    	updateByUser: { method: 'POST' }
    })
});

services.factory('RoleSearchFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/role/search/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});

services.factory('RoleSearchByUserService', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/role/search-by-user/:uId', {}, {
        search: { method: 'GET', isArray: true }
    })
});