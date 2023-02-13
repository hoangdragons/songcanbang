 var directive = angular.module('dolphin.directive', []);
/*
 directive.directive('fbShare', ['$window', '$rootScope', function ($window, $rootScope) {
      return {
          restrict: 'A',
          scope: {
        	  fbShare: '=?'
          },
          link: function (scope, element, attrs) {
              if (!$window.FB) {
                  //Load Facebook SDK if not already loaded
                  $.getScript('//connect.facebook.net/en_US/sdk.js', function () {
                      $window.FB.init({
                          appId: '1249390865130712',
                          xfbml: true,
                          version: 'v2.8'
                      });
                      renderLikeButton();
                  });
              } else {
                  renderLikeButton();
              }

              var watchAdded = false;
              function renderLikeButton() {
                  if (!!attrs.fbShare && !scope.fbShare && !watchAdded) {
                      // wait for data if it hasn't loaded yet
                      watchAdded = true;
                      var unbindWatch = scope.$watch('fbShare', function (newValue, oldValue) {
                          if (newValue) {
                              renderLikeButton();
                              $window.FB.ui({
                            	  method: 'feed',
                            	  link: newValue,
                            	  caption: 'Songcanbang.org',
                            	}, function(response){});
                              
                              // only need to run once
                              unbindWatch();
                          }
                          
                      });
                      return;
                  } else {
                      element.html('<div class="fb-feed-button"' + (!!scope.fbShare ? ' data-size="large" data-href="' + scope.fbShare + '"' : '') + ' data-layout="button"></div>');
                          $window.FB.XFBML.parse(element.parent()[0]);
                      }
                  }
              }
          };
      }
  ]);
*/
 directive.directive('googlePlus', ['$window', function ($window) {
      return {
          restrict: 'A',
          scope: {
              googlePlus: '=?'
          },
          link: function (scope, element, attrs) {
              if (!$window.gapi) {
                  // Load Google SDK if not already loaded
                  $.getScript('//apis.google.com/js/platform.js', function () {
                      renderPlusButton();
                  });
              } else {
                  renderPlusButton();
              }

              var watchAdded = false;
              function renderPlusButton() {
                  if (!!attrs.googlePlus && !scope.googlePlus && !watchAdded) {
                      // wait for data if it hasn't loaded yet
                      watchAdded = true;
                      var unbindWatch = scope.$watch('googlePlus', function (newValue, oldValue) {
                          if (newValue) {
                              renderPlusButton();

                              // only need to run once
                              unbindWatch();
                          }

                      });
                      return;
                  } else {
                      element.html('<div class="g-plusone"' + (!!scope.googlePlus ? ' data-href="' + scope.googlePlus + '"' : '') + ' data-size="medium"></div>');
                          $window.gapi.plusone.go(element.parent()[0]);
                      }
                  }
              }
          };
      }
  ]);

directive.directive('tweetShare', ['$window', '$location',
   function ($window, $location) {
       return {
           restrict: 'A',
           scope: {
               tweet: '=',
               tweetUrl: '='
           },
           link: function (scope, element, attrs) {
               if (!$window.twttr) {
                   // Load Twitter SDK if not already loaded
                   $.getScript('//platform.twitter.com/widgets.js', function () {
                       renderTweetButton();
                   });
               } else {
                   renderTweetButton();
               }

               var watchAdded = false;
               function renderTweetButton() {
                   if (!!attrs.tweetUrl && !scope.tweetUrl && !watchAdded) {
                       // wait for data if it hasn't loaded yet
                       watchAdded = true;
                       var unbindWatch = scope.$watch('tweetShare', function (newValue, oldValue) {
                           if (newValue) {
                               renderTweetButton();
                           
                               // only need to run once
                               unbindWatch();
                           }
                       });
                       return;
                   } else {
                       element.html('<a href="https://twitter.com/share" class="twitter-share-button" data-text="" data-url="' + (scope.tweetUrl || $location.absUrl()) + '">Tweet</a>');
                           $window.twttr.widgets.load(element.parent()[0]);
                       }
                   }
               }
           };
       }
   ]);

directive.directive("starRating", function() {
	return {
		restrict : "EA",
		template : "<ul class='rating'>" +
		"  <li ng-repeat='star in stars' ng-class='star' ng-click='toggle($index)'>" +
		"    <i class='fa fa-star'></i>" + //&#9733
		"  </li>" +
		"</ul>",
		scope : {
			ratingValue : "=ngModel",
			max : "=?", //optional: default is 5
			onRatingSelected : "&?",
			readable: "=?"
		},
		link : function(scope, elem, attrs) {
			if (scope.max == undefined) { scope.max = 5; }
			function updateStars() {
				scope.stars = [];
				for (var i = 0; i < scope.max; i++) {
					scope.stars.push({
						filled : i < scope.ratingValue
					});
				}

			};
			scope.toggle = function(index) {
				if (scope.readable == undefined || scope.readable == false){
					scope.ratingValue = index + 1;
					scope.onRatingSelected({
						rating: index + 1
					});
				}
			};
			scope.$watch("ratingValue", function(newVal, oldVal) {
				if (typeof newVal != 'undefined') {updateStars(); }
			});
		}
	};
});


angular.module("sticky", []).directive("sticky", function($window) {
  return {
    link: function(scope, element, attrs) {

      var $win = angular.element($window);

      if (scope._stickyElements === undefined) {
        scope._stickyElements = [];

        $win.bind("scroll.sticky", function(e) {
          var pos = $win.scrollTop();
          for (var i=0; i<scope._stickyElements.length; i++) {

            var item = scope._stickyElements[i];

            if (!item.isStuck && pos > item.start) {
              item.element.addClass("stuck");
              item.isStuck = true;

              if (item.placeholder) {
                item.placeholder = angular.element("<div></div>")
                    .css({height: item.element.outerHeight() + "px"})
                    .insertBefore(item.element);
              }
            }
            else if (item.isStuck && pos < item.start) {
              item.element.removeClass("stuck");
              item.isStuck = false;

              if (item.placeholder) {
                item.placeholder.remove();
                item.placeholder = true;
              }
            }
          }
        });

        var recheckPositions = function() {
          for (var i=0; i<scope._stickyElements.length; i++) {
            var item = scope._stickyElements[i];
            if (!item.isStuck) {
              item.start = item.element.offset().top;
            } else if (item.placeholder) {
              item.start = item.placeholder.offset().top;
            }
          }
        };
        $win.bind("load", recheckPositions);
        $win.bind("resize", recheckPositions);
      }

      var item = {
        element: element,
        isStuck: false,
        placeholder: attrs.usePlaceholder !== undefined,
        start: element.offset().top
      };

      scope._stickyElements.push(item);

    }
  };
});