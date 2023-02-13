controllers.controller('PublicationDetailController', ['$scope', '$filter', '$stateParams', 
					   'PublicationFactory','PublicationsFactory', '$location','$localStorage',
    function ($scope, $filter, $stateParams, PublicationFactory, PublicationsFactory, $location, $localStorage) {
		pubObj.initialize($scope, $filter, $stateParams, PublicationFactory, PublicationsFactory, $location, $localStorage, true);
    }
]);

        

controllers.controller('PublicationCreateController', ['$scope', '$filter', '$stateParams', 
    'PublicationFactory', 'PublicationsFactory', '$location', '$localStorage',
    function ($scope, $filter,$stateParams, PublicationFactory,PublicationsFactory, $location, $localStorage) {
        pubObj.initialize($scope, $filter, $stateParams, PublicationFactory, PublicationsFactory, $location, $localStorage, false);
}]);

var pubObj = {
    initialize: function($scope, $filter, $stateParams, PublicationFactory, PublicationsFactory, $location, $localStorage,isUpdate){
        $scope.publication = {};
        $scope.changeUpload =  function(input){
            if (input.files && input.files[0]) {
                var r = new FileReader();
                r.onload = function (e) {
                    $scope.uploadImage(input.files[0]);
                    $scope.publication.image = app.resourceBaseUrl + "/images/" + input.files[0].name;
                };
               r.readAsDataURL(input.files[0]);
            }
        };
        // callback for ng-click 'insertOrUpdate':
        $scope.insertOrUpdate = function () {
            $scope.getContent();
            window.ignoreDC = true;
            $scope.publication.teachers = [{'teacherId':1, 'teacherCompany':1,'teacherContent':'',
                'teacherImage':'','teacherName':''}];
            if(isUpdate){ // update
                PublicationsFactory.update($scope.publication
                    ,function(data){
                        $location.path('/app/publicationList');
                    }
                );
            }else{ // create
                PublicationsFactory.create($scope.publication
                    , function(data){
                        $location.path('/app/publicationList');
                    }
                );
            }
            
        };
        
        // callback for ng-click 'cancel':
        $scope.cancel = function () {
            window.ignoreDC = true;
            $location.path('/app/publicationList');
        };
        
        // bien trung gian nhan gia trij tu tinymce
        $scope.contentText = '';

        // Model khong can thiet 
        $scope.contentModel = '';
        $scope.getContent = function() {
          $scope.publication.content = $scope.contentText;
        };
        $scope.setContent = function() {
            $scope.contentModel = $scope.publication.content;
        };

        $scope.pubContentOptions = {
            inline: false,
            menubar: false,
            //plugins : 'advlist autolink link image lists charmap print preview',
            plugins : 'advlist autolink link image lists charmap print preview textcolor colorpicker',
            skin: 'lightgray',
            toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
            toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
            theme : 'modern'
            ,setup : function(ed) {
                var textContentTrigger = function(e) {
                  $scope.contentText = ed.getContent();
                  $scope.$apply();
                };
                ed.on('keyup',textContentTrigger);
                ed.on('ExecCommand', textContentTrigger);
                ed.on('SetContent', function(e) {
                  if(!e.initial)
                    textContentTrigger(e);
                });
            }
        };

        if(isUpdate){
             PublicationFactory.show({id: $stateParams.id}
                , function(data){
                    $scope.publication = data;
                    $scope.setContent();
            });
        }else{

        }
       
    }
}
