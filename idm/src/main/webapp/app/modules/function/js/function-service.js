
/*Function services*/
services.factory('FunctionsFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/function', {}, {
        update: { method: 'PUT'},
        create: { method: 'POST'}
    })
});

services.factory('FunctionFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/function/id/:id', {id: '@id'}, {
        show: { method: 'GET' },
        deleteFunction: { method: 'DELETE' }
    })
});

services.factory('FunctionSearchFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/function/search/:keyword', {}, {
        search: { method: 'GET', isArray: true }
    })
});

services.factory('FunctionUpdateByRoleFactory', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/function/update-by-role', {}, {
    	updateByRole: { method: 'POST' }
    })
});

services.factory('FunctionSearchByRoleService', function ($resource) {
    return $resource(app.idmUrl + '/rest-api/function/search-by-role/:uId', {}, {
        search: { method: 'GET', isArray: true }
    })
});