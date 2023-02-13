directives.directive('passwordMatch', function() {
    return {
      require: 'ngModel',
      scope: {
        otherModelValue: '=passwordMatch'
      },
      link: function(scope, element, attributes, ngModel) {
       /* ngModel.$validators.compareTo = function(modelValue) {
          return modelValue === scope.otherModelValue;
        };*/
        scope.$watch('otherModelValue', function() {
          /*ngModel.$validate();*/
          var chk = element.val() === scope.otherModelValue;
          if((typeof element.val() === "undefined" || element.val() == '') && 
        		  (typeof scope.otherModelValue == "undefined" || scope.otherModelValue == '')){
        	  chk = true;
          }
          ngModel.$setValidity('passwordMatch', chk);
        });
    	
      }
    };
  });

