'use strict';

var services = angular.module('magazine.services', ['ngResource']);

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