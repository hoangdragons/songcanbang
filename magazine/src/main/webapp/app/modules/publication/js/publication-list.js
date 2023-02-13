controllers.controller('PublicationListController', ['$scope','$filter','$compile', 
												  'PublicationsFactory','PublicationFactory','PublicationSearchFactory', 
                                                  '$location', '$localStorage',
  function ($scope, $filter, $compile, PublicationsFactory, PublicationFactory, PublicationSearchFactory,
		  $location, $localStorage) {
	 
    $scope.edit = function(pub) {
    	var magazineId = pub.magazineId;
       $location.path('/app/publicationDetail/' + magazineId);
    };
   
    $scope.deletePublication = function (pub) {
      var confirm=window.confirm($filter('translate')('common.CONFIRM_DELETE') + pub.title);
      if(!confirm) 
        return;
    	var magazineId = pub.magazineId;
        if (typeof(magazineId) !== "undefined") {
        	PublicationFactory.deletePublication({ id: magazineId }, function(dat){
            $scope.publications = PublicationsFactory.query();
          });       	
        }
        
    };

    // callback for ng-click 'createUser':
    $scope.create = function () {
        $location.path('/app/publicationCreate');
    };
    
    $scope.loadPublicationDetail = function (pub) {
    	var magazineId = pub.magazineId;
    	 if (typeof(magazineId) !== "undefined") {
    		 $location.path('/app/publicationList/'+ magazineId);
         }
        
    };
  
    $scope.publications = PublicationsFactory.query();
}]);// ENd of TeacherListController