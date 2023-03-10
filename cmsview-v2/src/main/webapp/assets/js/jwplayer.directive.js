
(function() {
    'use strict';

    angular
        .module('ng-jwplayer')
        .directive('jwplayer', JWPlayer);

    /* @ngInject */
    function JWPlayer($compile, $log, $rootScope, jwplayerService) {

        var player;

        var _renderJWPlayerElement = function(scope, element) {
            var playerId = scope.playerId || 'myPlayer1';
            var getTemplate = function (playerId) {
                    return '<div id="' + playerId + '"></div>';
                };

            element.html(getTemplate(playerId));
            $compile(element.contents())(scope);
            player = jwplayerService.initJWPlayer(playerId);
            player.setup(scope.playerOptions);

            player.on('ready', function() {
                $rootScope.$broadcast('ng-jwplayer-ready', { 
                    playerId: playerId 
                 });
            });

        };

        return {
            restrict: 'EC',
            scope: {
                playerId: '@',
                playerOptions: '=',
                listVideoUrl: '='
            },
            link: function (scope, element, attrs) {
                
                var playerId = scope.playerId || 'myPlayer1';

                scope.$on('$destroy', function () {
                    $log.debug('jwplayer onDestroy: ' + playerId);
                    jwplayerService.cleanUp(playerId);
                });

                scope.$watch(function () {
                    return scope.listVideoUrl;
                }, function (value) {
                    $log.debug('ng-src(' + playerId + ') has changed: ' + value);
                    if (angular.isDefined(scope.playerOptions)) {
                    	
                    	if (value.constructor === Array) {
                    		var lsUrl = []
                    		for (var i = 0; i < value.length; i++) {
                    			lsUrl.push({file: value[i]});
							}
                    		scope.playerOptions.playlist = lsUrl;
						} else {
							scope.playerOptions.file = value;
						}
                    	
                        _renderJWPlayerElement(scope, element);
                    }
                });

                /*if (angular.isDefined(scope.ngSrc) && angular.isDefined(scope.playerOptions)) {
                    scope.playerOptions.file = attrs.ngSrc;
                    _renderJWPlayerElement(scope, element);
                }*/
            }
        };
    }
})();
