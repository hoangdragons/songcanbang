controllers.controller('TeachingCourseDetailController', ['$scope','$filter','$compile', '$stateParams','CategoriesFactory', 'CategoryFactory', 
                                                  'CourseFactory','CoursesFactory', 'LoadCourseService','CourseQuestionFactory',
                                                  'GenericCourseService',
                                                  'TeachersFactory',/*'TeacherFactory', 'TeacherSearchFactory',*/
                                                  '$sce', 'jwplayerService', '$injector','$location', 'Upload',
    function ($scope,$filter, $compile, $stateParams, CategoriesFactory, CategoryFactory, 
    		CourseFactory, CoursesFactory, LoadCourseService, CourseQuestionFactory,
    		GenericCourseService,
    		TeachersFactory,
    		$sce, jwplayerService, $injector, 
    		$location, Upload) {
	
		teachingCourseDetailObj.initialize($scope, $filter, $compile, $stateParams, CategoriesFactory, CategoryFactory, 
				CourseFactory, CoursesFactory, LoadCourseService, CourseQuestionFactory,GenericCourseService,
				TeachersFactory,/*TeacherFactory, TeacherSearchFactory,*/
				$sce, jwplayerService,  $injector, $location, Upload, false);
    }]);

controllers.controller('TeachingCourseCreationController', ['$scope','$filter','$compile', '$stateParams','CategoriesFactory', 'CategoryFactory', 
                                                    'CourseFactory','CoursesFactory', 'LoadCourseService','CourseQuestionFactory',
                                                    'GenericCourseService',
                                                    'TeachersFactory',/*'TeacherFactory', 'TeacherSearchFactory',*/
                                                    '$sce', 'jwplayerService', '$injector', '$location','Upload',
      function ($scope, $filter, $compile, $stateParams, CategoriesFactory, CategoryFactory, 
      		CourseFactory, CoursesFactory, LoadCourseService, CourseQuestionFactory,
      		GenericCourseService,
      		TeachersFactory,
      		$sce, jwplayerService, $injector, $location, Upload) {
		
		teachingCourseDetailObj.initialize($scope, $filter, $compile, $stateParams, CategoriesFactory, CategoryFactory, 
			CourseFactory, CoursesFactory, LoadCourseService, CourseQuestionFactory,
			GenericCourseService,
			TeachersFactory,/*TeacherFactory, TeacherSearchFactory,*/
			$sce, jwplayerService, $injector, $location, Upload, true);
    }]
);
////////////////////////////////////////////////////////////////////////////////
var teachingCourseDetailObj = {
		initialize: function($scope, $filter, $compile, $stateParams, CategoriesFactory, CategoryFactory, 
				CourseFactory, CoursesFactory, LoadCourseService, CourseQuestionFactory,
				GenericCourseService,
				TeachersFactory,/*TeacherFactory, TeacherSearchFactory,*/
				$sce, jwplayerService,  $injector, $location,Upload, isNew){
			$scope.$parent.showLogo = true;
			$scope.format = 'dd/MMMM/yyyy'; 
			var _scope = $scope;
			$scope.disableSelectSignedInUser =  false;			
			$scope.newTeacher= {};
			$scope.course = {};
			$scope.course.teachers = [];
			$scope.teachers =  TeachersFactory.query(
				function(data){
					console.log(data);
				});
			/** Prevent ENTER key on input text **/
			$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
				  if(e.which == 13) {
				    e.preventDefault();
				    return false;
				  }
				});

			$scope.showChapterNameEditor = function(){					
				$(".chapter-name-label").removeClass('open');				
				$(".chapter-name-label").addClass('closed');				
				$(".chapter-name-editor").removeClass('closed');				
				$(".chapter-name-editor").addClass('open');	
				
				$(".btn-del-chapter").addClass('closed');
				$(".btn-del-chapter").removeClass('open');
			}					
			$scope.hideChapterNameEditor = function(){					
				$(".chapter-name-editor").removeClass('open');
				$(".chapter-name-editor").addClass('closed');
				$(".chapter-name-label").removeClass('closed');				
				$(".chapter-name-label").addClass('open');
				
				$(".btn-del-chapter").addClass('open');
				$(".btn-del-chapter").removeClass('closed');
			}	
			
			$scope.showLessonNameEditor = function(){					
				$(".lesson-name-label").removeClass('open');				
				$(".lesson-name-label").addClass('closed');				
				$(".lesson-name-editor").removeClass('closed');				
				$(".lesson-name-editor").addClass('open');	
				
				$(".btn-del-chapter").addClass('closed');
				$(".btn-del-chapter").removeClass('open');
			}					
			$scope.hideLessonNameEditor = function(){					
				$(".lesson-name-editor").removeClass('open');
				$(".lesson-name-editor").addClass('closed');
				$(".lesson-name-label").removeClass('closed');				
				$(".lesson-name-label").addClass('open');
				
				$(".btn-del-chapter").addClass('open');
				$(".btn-del-chapter").removeClass('closed');
			}	
								
			/*Update video URL*/
			$scope.updateOverViewVideoUrl = function(url){
				if(typeof url !== "undefined" && url !== "")
					$scope.previewOverviewVideoUrl = $sce.trustAsResourceUrl(url);
			}
			/*//////////////////////////  Load  detail*/
			$scope.categories = CategoriesFactory.query();
			if(!isNew){
	        	LoadCourseService.load({id: $stateParams.id},
    		        function(data){
    		        	$scope.previewOverviewVideoUrl = $sce.trustAsResourceUrl(data.videoUrl);
    		        	$scope.newImageUrl = data.imageUrl;
    		            $scope.course = data;
    		            if($scope.course.helperCourse == 1){
    		            	$scope.course.helper = true;
    		            }else{
    		            	$scope.course.helper = false;
    		            }
    		            $scope.course.videoUrl = $sce.trustAsResourceUrl(data.videoUrl);
    		            $scope.setContent();
    		            
    		            // Set default choosen to true
    		            for(var i=0;i<$scope.course.teachers.length;i++){
    		            	var teacher = $scope.course.teachers[i];
    		            	$scope.course.teachers[i].choosen=true;
    		            	if(teacher.loginId == $scope.$parent.signedInUser.jti){
    		            		$scope.isCourseTeacher = true;
    		            	}
    		            }	
    					$scope.listQuestion = CourseQuestionFactory.findByCourse.query({courseId: $stateParams.id});
    					/*$scope.listComment = CourseCommentFactory.getListCommentByCourseId.query({courseId: $stateParams.courseId});*/
    		        }
	    	     );
	        }
        	if(isNew){
        		$scope.course = new Object();
        		$scope.course.helperCourse = 0;
        		$scope.course.isHelper = false;
        		$scope.course.currency = "VND";
        		var d = new Date();
        		$scope.course.puslishDate = new Date().toLocaleDateString('en-GB', {  
        		    day : 'numeric',
        		    month : 'numeric',
        		    year : 'numeric'
        		}).split(' ').join('/'); 
        		if(typeof $stateParams.catId !== 'undefined')
        			$scope.course.tblCategoryDto = CategoryFactory.get({id:$stateParams.catId});
        		$scope.course.teachers = [];     		
        	}	
//////////////////////////////////// Manage Question ///////////////////////////        	
        	$scope.canManageQA = function(course){
        		for(var i=0;i<$scope.course.teachers.length;i++){
        			if(typeof $scope.course.teachers[i].loginId !== "undefined" 
        				&& $scope.course.teachers[i].loginId == $scope.$parent.signedInUser.jti){
        				return true;
        			}
        		}	
        		return false;
        	}
        	// Answer QA and update DB
        	$scope.updateCourseQuestion = function(question) {
        		if (typeof question != "undefined" && question.question.trim() != "") {
        			question.answerUserId = $scope.$parent.signedInUser.jti;
        			question.answerUserAvataUrl = $scope.$parent.signedInUser.avataUrl;
        			question.answerUserName = $scope.$parent.signedInUser.aud;
        			question.answer = question.newAnswer;
        			delete question.newAnswer;
        			
        			CourseQuestionFactory.createQuestion.update(question, function(data){
        				$scope.listQuestion = CourseQuestionFactory.findByCourse.query({courseId: $scope.course.courseId});
        				$(".answer").val("");
        			});
        			
        		}
        	}
/////////////////////// WYSIWYG Text editor ///////////////////////////
			$scope.tinymceModel = 'Initial content';
			$scope.getContent = function() {
			  $scope.course.content = _scope.tinymceModel;
			};
			$scope.setContent = function() {
		    	$scope.tinymceModel = $scope.course.content;
			};

			
			$scope.tinymceOptions = {
			    inline: false,
			    menubar: false,
			    /*plugins : 'advlist autolink link image lists charmap print preview',*/
			    plugins : 'advlist autolink link image lists charmap print preview textcolor colorpicker',
			    skin: 'lightgray',
			    toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
			    toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
			    /*plugins: [
				    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
				    'searchreplace wordcount visualblocks visualchars code fullscreen',
				    'insertdatetime media nonbreaking save table contextmenu directionality',
				    'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
				  ],
				  toolbar1: 'forecolor backcolor | undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
				  /*toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',*/
			    theme : 'modern',
			    setup : function(ed) {
			    	var courseTextContentTrigger = function(e) {
		    			_scope.tinymceModel = ed.getContent();
		    			$scope.$apply();
			        };
	                ed.on('keyup',courseTextContentTrigger);
	                ed.on('ExecCommand', courseTextContentTrigger);
	            } 
			  };
/////////////////////// WYSIWYG Text editor ///////////////////////////
			
			$scope.teacherDescModel = $filter('translate')('course.teacher.TEACHER_INFO');
			$scope.getTeacherDescContent = function() {
			  $scope.newTeacher.teacherDesc = _scope.teacherDescModel;
			};
			$scope.setTeacherDescContent = function() {
		    	$scope.teacherDescModel = $scope.newTeacher.teacherDesc;
			};

			$scope.teacherDescOptions = {
			    inline: false,
			    menubar: false,
			    /*plugins : 'advlist autolink link image lists charmap print preview',*/
			    plugins : 'advlist autolink link image lists charmap print preview textcolor colorpicker',
			    skin: 'lightgray',
			    toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
			    toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
			    theme : 'modern',
			    setup : function(ed) {
			    	var textContentTrigger = function(e) {
			          $scope.teacherDescText = ed.getContent();
			          $scope.$apply();
			        };
	                ed.on('keyup',textContentTrigger);
	                ed.on('ExecCommand', textContentTrigger);
		           /* ed.on('SetContent', function(e) {
		              if(!e.initial)
		                textContentTrigger(e);
		            });*/
	            } 
			  };

			 $scope.selectLoginAsTeacher =  function(b) {
			 	if(!b){
			 		$scope.newTeacher.teacherFullname =  $scope.signedInUser.sub;
			        $scope.newTeacher.teacherEmail = $scope.signedInUser.email;
			        $scope.newTeacher.teacherAvataUrl = $scope.signedInUser.avataUrl;
			        $scope.newTeacher.phone = $scope.signedInUser.telephone;
			        $scope.newTeacher.choosen = true;
			        
			 	}else{
			 		$scope.newTeacher.teacherFullname =  null;
			        $scope.newTeacher.teacherEmail = null;
			        $scope.newTeacher.teacherAvataUrl = null;			       
			        $scope.newTeacher.phone = null;
			        $scope.newTeacher.choosen = false;
			 	}		        
		     };

		     /** From select existing teacher **/
		     $scope.toggleChoosenTeacher = function(teacher){
		     	if(typeof teacher == "undefined"){
		     		return false;
		     	}
		     	// change from false -> true
		     	if(!teacher.choosen){
		     		for(var i=0; i<$scope.course.teachers.length;i++){
		     			if(teacher.teacherName == $scope.course.teachers[i].teacherName
		     				){
		     				return false;
		     			}
		     		}
		     		$scope.course.teachers.push(teacher);
		     	}else{
		     		for(var i=0; i<$scope.course.teachers.length;i++){
		     			if(typeof $scope.course.teachers[i] == "undefined" 
		     				|| $scope.course.teachers[i].teacherId != teacher.teacherId)
		     				continue;
		     			else
		     			{
		     				$scope.course.teachers.splice(i, 1);
		     				break;
		     			}

		     		}
		     	}
		     }

		     /** From register new teacher **/
		     $scope.addTeacherAndContinue = function(){
		     	$scope.getTeacherDescContent();
		     	for(var i=0; typeof $scope.course.teachers != "undefined" && i<$scope.course.teachers.length;i++){
	     			if($scope.newTeacher.teacherFullname == $scope.course.teachers[i].teacherName){
	     				return false;
	     			}
	     		}
		     	$scope.course.teachers.push({
		     		'teacherCompany':$scope.newTeacher.teacherCompany,
		     		'teacherContent':$scope.newTeacher.teacherDesc,
		     		'teacherImage':$scope.newTeacher.teacherAvataUrl,
		     		'teacherName':$scope.newTeacher.teacherFullname,
		     		'phone':$scope.newTeacher.phone,
		     		'email':$scope.newTeacher.teacherEmail,
		     		'choosen':true,
		     		'loginName':$scope.newTeacher.loginName,
		     		'loginId': $scope.signedInUser.jti
		     	});
		     	$scope.newTeacher = new Object();	
		     	$scope.teacherDescModel = '';	     
		     	$scope.newTeacher.teacherDesc = null;   
		        //$scope.setTeacherDescContent();

		        $scope.disableSelectSignedInUser =  true;
		     }
			 $scope.useLoginUserAsTeacher = false;
			
			// Accordions Settings
			$scope.oneAtATime = true;
	        $scope.status = {
				    isCustomHeaderOpen: false,
				    isFirstOpen: true,
				    isFirstDisabled: false
			};

		    // TAB title
	        $scope.tab1Title  = $filter('translate')('course.TAB.BASIC_INFO');
	        $scope.tab2Title  = $filter('translate')('course.TAB.COURSE_DETAIL_INFO');
	       
	        $scope.tab3Title = $filter('translate')('course.TAB.LESSON_DETAIL_LECTURER');
	        
	        $scope.tab4Title = $filter('translate')('course.TAB.LESSON_DETAIL_QA');
	        $scope.tab5Title = $filter('translate')('course.TAB.LESSON_DETAIL_REVIEW');


	        $scope.options1 = {
                type: 'mp4'
            };
            $scope.previewOption = {
            	type: 'mp4',
            	width: 300,
            	height: 200
            }    		           
            $scope.$on('ng-jwplayer-ready', function(event, args) {
                //console.log('Player ' + args.playerId + ' ready. Playing video');
                var player = jwplayerService.myPlayer[args.playerId];
                player.play(false);
            });
            $scope.newMat = {};
            $(".accordion-toggle").on("click", function(){
            	$scope.newMat = {};
            });
			// callback for ng-click 'insertOrUpdate':
			$scope.insertOrUpdate = function () {
				window.ignoreDC = true;
				$scope.getContent();
				var originVideoUrl = $scope.course.videoUrl;
				$scope.course.videoUrl = $scope.course.videoUrl.toString();
				if(typeof $scope.course.publishDate !== "undefined"){
					var dateArr = $scope.course.publishDate.split('/');
					$scope.course.publishDate = new Date(dateArr[2],dateArr[1],dateArr[0]);
				}
				if(!isNew){
					if($scope.course.helper){
		        		$scope.course.helperCourse = 1;
		        	}else{
		        		$scope.course.helperCourse = 0;
		        	}
					 CoursesFactory.update($scope.course,
	            		function(data){
	            			var cat = $scope.course.tblCategoryDto;
	            			$location.path('/teaching/home');
	            		},
	            		function(err){
	            			$scope.course.videoUrl = originVideoUrl;
	            			//$sce.trustAsResourceUrl(data.videoUrl);
	            		}
					 );
				}else{
					var cat = $scope.course.tblCategoryDto;
					
		        	if(typeof cat == "undefined"){
		        		cat = $scope.category;
		        	}
		        	if($scope.course.helper){
		        		$scope.course.helperCourse = 1;
		        	}else{
		        		$scope.course.helperCourse = 0;
		        	}
		        	CoursesFactory.create($scope.course, 
		        		function(data){
		        			$location.path('/teaching/home');
		            	},
	            		function(err){
	            			$scope.course.videoUrl = originVideoUrl;
	            		}
		            );
				}
	           
	        };
	        
	        $scope.deleteLesson = function(chapter, lesson){
	        	if(window.confirm('Are you sure to delete lesson ' + lesson.lessionName + '?')){
		        	var idx = chapter.lessons.indexOf(lesson);
		        	if(idx != -1){
		        		chapter.lessons.splice(idx,1);
		        		if(!isNew)
		        			chapter.deleteLessonIdList.push(lesson.courseLessonId);
		        	}
	        	}
	        }
	        
	        $scope.deleteChapter = function(chapter){
	        	if(window.confirm('Are you sure to delete chapter ' + chapter.chapterName + '?')){
		        	var idx = $scope.course.chapters.indexOf(chapter);
		        	if(idx != -1){
		        		$scope.course.chapters.splice(idx, 1);
		        		if(!isNew)
		        			$scope.course.deleteChapterIdList.push(chapter.courseChapterId)
		        	}
	        	}
	        }
	        
	        $scope.deleteResource =  function(lesson,listItem, item){
	        	if(window.confirm('Are you sure to delete this lesson material: ' + item.title + '?')){
	        		var idx = listItem.indexOf(item);
		        	if(idx != -1){
		        		listItem.splice(idx, 1);
		        		if(!isNew)
		        			lesson.deleteMatIdList.push(item.id)
		        	}
	        	}
	        }
	        
	        $scope.addLesson = function(chapter, lessonName) {
	          if(typeof chapter.lessons === "undefined"){
	        	  chapter.lessons = [];
	          }
	          var flg = false;
	          for(x in chapter.lessons){
	        	  if(chapter.lessons[x].lessionName == lessonName){
	        		  flg = true;
	        	  } 
	          }
	          if(!flg){
	          	chapter.lessons.push({'lessionName':lessonName,'displayOrder':chapter.lessons.length + 1, 'order':chapter.lessons.length + 1, 'courseChapterId':chapter.courseChapterId });
	          }	        	  
	        };
	        
	        
	        $scope.createChapter = function (newChapterName){
	        	if(typeof $scope.course.chapters == "undefined"){
	        		$scope.course.chapters = [];
	        	}
	        	var flg = false;
	            for(x in $scope.course.chapters){
	          	  if($scope.course.chapters[x].chapterName == newChapterName){
	          		  flg = true;
	          	  } 
	            }
	            if(!flg){
	            	$scope.course.chapters.push({'chapterName' : newChapterName, 'courseChapterId' : '',
	            		'order' : ($scope.course.chapters.length + 1), 
	            		'courseId':$scope.course.courseId});
	            }
	        	
	        };
	        
	        // callback for ng-click 'cancel':
	        $scope.cancel = function () {
	        	window.ignoreDC = true;
	        	$location.path('/teaching/home');
	        };

	        $scope.setWorkingLesson = function(lesson){
				$scope.workingLesson = lesson;
	        }
	        
	        /* ADD material to current lesson **/
	        $scope.addLectureMaterial = function(lesson, title, url, type, isManual){
	        	$scope.errorMessage = '';
	        	if(isManual){
	        		if(typeof title == "undefined" || title == '' ){
		        		$scope.errorMessage =  $filter('translate')('course.error.MAT_TITLE_NULL');
		        		return;
		        	}
		        	if(typeof url == "undefined" || url == '' ){
		        		$scope.errorMessage =  $filter('translate')('course.error.MAT_LINK_URL_NULL');
		        		return;
		        	}
		        	if(typeof type == "undefined" || type == '' ){
		        		$scope.errorMessage =  $filter('translate')('course.error.MAT_TYPE_NULL');
		        		return;
		        	}
	        	}
	        	
	        	if(typeof lesson === "undefined"){
	        		lesson = $scope.workingLesson;
	        	}
	        	if(typeof lesson.materials === "undefined") 
	        		lesson.materials = [];

	        	var flg = false;
	            for(x in lesson.materials){
	          	  if(lesson.materials[x].url == url){
	          		  flg = true;
	          	  } 
	            }
	            if(!flg){
	            	if((type == 1 || type == 2) && isManual){
	            		var vid = document.getElementById("newMatVideo");  
	            		var duration = (vid.duration/60).toFixed(3);
		            	lesson.materials.push({'url':url,'type': parseInt(type), 'title':title,'ownerId':lesson.courseLessonId,'duration':duration});
	            	}else{
		            	lesson.materials.push({'url':url,'type': parseInt(type), 'title':title,'ownerId':lesson.courseLessonId,'duration':0});
	            	}
	            		            	
	            	$scope.newMat = {};
	            }
	        }

	        $scope.changeUpload =  function(updType, input, targetPreview){
	        	/*updType: 1 video; 2 voice; 3 picture; 4 document*/
				if (input.files && input.files[0]) {
			        var r = new FileReader();
			        r.onload = function (e) {
			        	if(updType == 1){ //Video
			        		$scope.uploadVideo(input.files[0]);
			        		$scope.newVideoURL = app.resourceBaseUrl + "/videos/" + input.files[0].name;
			        		if(typeof url !== "undefined" && url != ""){
	        					$scope.lessonVideoPreviewURL = $sce.trustAsResourceUrl(url);
	        				}
			        	};
			        	if(updType == 2){//Voice               
			        	   $scope.uploadVideo(input.files[0]);
                           $scope.newVoiceURL = app.resourceBaseUrl + "/materials/" + input.files[0].name;
                           $scope.previewVoice($scope.newVoiceURL);
						}
			        	if(updType == 3){//Picture
			        		$scope.uploadImage(input.files[0]);
			        		$scope.newPictureURL = $scope.lessonPicturePreviewURL = app.resourceBaseUrl + "/images/" + input.files[0].name;
			        	}
			        	
			        	// Document	
			        	if(updType == 4){		
			        		$scope.uploadFile(input.files[0]);
			        		$scope.newDocURL = app.resourceBaseUrl + "/materials/" + input.files[0].name;
			        	};
			        	
			        	// overview image
			        	if(updType == 5){
			        		$scope.uploadImage(input.files[0]);
			        		$scope.course.imageUrl = $scope.newImageUrl = $scope.lessonPicturePreviewURL =   app.resourceBaseUrl + "/images/" + input.files[0].name;
			        	}; 
			        	// overview video
			        	if(updType == 6){
			        		$scope.uploadVideo(input.files[0]);
			        		$scope.course.videoUrl = app.resourceBaseUrl + "/videos/" + input.files[0].name;
			        		$scope.updateOverViewVideoUrl(app.resourceBaseUrl + "/videos/" + input.files[0].name);
			        		
			        	}; 
			        	if(updType == 7){
			        		$scope.uploadImage(input.files[0]);
			        		$scope.newTeacher.teacherAvataUrl = app.resourceBaseUrl + "/images/" + input.files[0].name;
			        	}
			        };
			       r.readAsDataURL(input.files[0]);
				}
			};
		    
{ /////////////////////// Xu ly multiple upload ////////////////////////////

 // $scope.files = [];
  var version = '11.1.3';
  $scope.invalidFiles = [];

  // make invalidFiles array for not multiple to be able to be used in ng-repeat in the ui
  $scope.$watch('invalidFiles', function (invalidFiles) {
    if (invalidFiles != null && !angular.isArray(invalidFiles)) {
      $timeout(function () {$scope.invalidFiles = [invalidFiles];});
    }
  });

 
  $scope.multipleUpload = function (files, lesson) {
  	/*$('#uploadStats').css('display','block');*/
    $scope.formUpload = false;
    if (files != null) {    		
      // make files array for not multiple to be able to be used in ng-repeat in the ui
      if (!angular.isArray(files)) {
      	files = [files];
       /* $timeout(function () {
          $scope.files = files = [files];
        });*/
        return;
      }
      for (var i = 0; i < files.length; i++) {
        $scope.errorMsg = null;
        (function (f) {
          f.index = i;
          if(typeof f.type !== "undefined" && f.type.indexOf('video') != -1){
          	f.url = app.resourceBaseUrl + '/videos/' + f.name;
          	f.uploadType = 1;
          	$scope.upload(f,lesson, true, 1);
          }else if(typeof f.type !== "undefined" && f.type.indexOf('audio') != -1){
          	f.url = app.resourceBaseUrl + '/voices/' + f.name;
          	f.uploadType = 2;
          	$scope.upload(f,lesson, true, 2);
          }else if(typeof f.type !== "undefined" && f.type.indexOf('image') != -1){
          	f.url = app.resourceBaseUrl + '/images/' + f.name;
          	f.uploadType = 3;
          	$scope.upload(f,lesson, true, 3);
          }else{
          	f.url = app.resourceBaseUrl + '/materials/' + f.name;
          	f.uploadType = 4;
          	$scope.upload(f, lesson, true, 4);
          }
          
        })(files[i]);
      }
    }
  };

  $scope.isResumeSupported = Upload.isResumeSupported();

  $scope.restart = function (file) {
    if (Upload.isResumeSupported()) {
        $http.get('https://angular-file-upload-cors-srv.appspot.com/upload?restart=true&name=' + encodeURIComponent(file.name)).then(function () {
        $scope.upload(file, true);
      });
    } else {
      $scope.upload(file);
    }
  };

  $scope.chunkSize = 10000;
  $scope.upload = function(file, lesson, resumable, t) {
    var uploadUrl = '';
    if(t == 1){
      uploadUrl = app.idmUrl + '/rest-api/file/video-upload';
    }else if(t == 2){
      uploadUrl = app.idmUrl + '/rest-api/file/voice-upload';
    }else if(t == 3){
      uploadUrl = app.idmUrl + '/rest-api/file/image-upload';
    }else{
      uploadUrl = app.idmUrl + '/rest-api/file/file-upload';
    }

    file.upload = Upload.upload({
      url: uploadUrl,
      /*resumeSizeUrl: resumable ? 'https://angular-file-upload-cors-srv.appspot.com/upload?name=' + encodeURIComponent(file.name) : null,
      resumeChunkSize: resumable ? $scope.chunkSize : null,*/
      headers: {
        /*'Content-Type': undefined , */
        'Authorization':localStorage.jwt
      },
      data: {username: $scope.signedInUser, file: file}
    });

    file.upload.then(function (response) {
      console.log(file.progress + '  Adding file to lesson ' + file.name);
      $scope.addLectureMaterial(lesson, '', file.url, file.uploadType);   
      $timeout(function () {
        file.result = response.data;        
      });
    }, function (response) {
      if (response.status > 0)
        $scope.errorMsg = response.status + ': ' + response.data;
    }, function (evt) {
      // Math.min is to fix IE which reports 200% sometimes
      file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));     
      $scope.uploadPercentage = file.progress + '%';
      $scope.uploadEvtMsg = 'Uploading: ' + file.progress + '% ';
    });

    file.upload.xhr(function (xhr) {
      // xhr.upload.addEventListener('abort', function(){console.log('abort complete')}, false);
    });
  }
  $scope.clearUploadStat = function(files){
  	files = [];
  }

  $scope.confirm = function () {
    return confirm('Are you sure? Your local changes will be lost.');
  };

  $scope.getReqParams = function () {
    return $scope.generateErrorOnServer ? '?errorCode=' + $scope.serverErrorCode +
    '&errorMessage=' + $scope.serverErrorMsg : '';
  };

  angular.element(window).bind('dragover', function (e) {
    e.preventDefault();
  });
  angular.element(window).bind('drop', function (e) {
    e.preventDefault();
  });

  $scope.modelOptionsObj = {};
 /* $scope.$watch('validate+dragOverClass+modelOptions+resize+resizeIf', function (v) {
    $scope.validateObj = eval('(function(){return ' + $scope.validate + ';})()');
    $scope.dragOverClassObj = eval('(function(){return ' + $scope.dragOverClass + ';})()');
    $scope.modelOptionsObj = eval('(function(){return ' + $scope.modelOptions + ';})()');
    $scope.resizeObj = eval('(function($file){return ' + $scope.resize + ';})()');
    $scope.resizeIfFn = eval('(function(){var fn = function($file, $width, $height){return ' + $scope.resizeIf + ';};return fn;})()');
  });*/
  $timeout = function () {
    $scope.capture = localStorage.getItem('capture' + version) || 'camera';
    $scope.pattern = localStorage.getItem('pattern' + version) || 'image/*,audio/*,video/*';
    $scope.acceptSelect = localStorage.getItem('acceptSelect' + version) || 'image/*,audio/*,video/*';
    $scope.modelOptions = localStorage.getItem('modelOptions' + version) || '{debounce:100}';
    $scope.dragOverClass = localStorage.getItem('dragOverClass' + version) || '{accept:\'dragover\', reject:\'dragover-err\', pattern:\'image/*,audio/*,video/*,text/*\'}';
    $scope.disabled = localStorage.getItem('disabled' + version) == 'true' || false;
    $scope.multiple = localStorage.getItem('multiple' + version) == 'true' || false;
    $scope.allowDir = localStorage.getItem('allowDir' + version) == 'true' || true;
    $scope.validate = localStorage.getItem('validate' + version) || '{size: {max: \'20MB\', min: \'10B\'}, height: {max: 12000}, width: {max: 12000}, duration: {max: \'5m\'}}';
    $scope.keep = localStorage.getItem('keep' + version) == 'true' || false;
    $scope.keepDistinct = localStorage.getItem('keepDistinct' + version) == 'true' || false;
    $scope.orientation = localStorage.getItem('orientation' + version) == 'true' || false;
    $scope.runAllValidations = localStorage.getItem('runAllValidations' + version) == 'true' || false;
    $scope.resize = localStorage.getItem('resize' + version) || "{width: 1000, height: 1000, centerCrop: true}";
    $scope.resizeIf = localStorage.getItem('resizeIf' + version) || "$width > 5000 || $height > 5000";
    $scope.dimensions = localStorage.getItem('dimensions' + version) || "$width < 12000 || $height < 12000";
    $scope.duration = localStorage.getItem('duration' + version) || "$duration < 10000";
    $scope.maxFiles = localStorage.getItem('maxFiles' + version) || "500";
    $scope.ignoreInvalid = localStorage.getItem('ignoreInvalid' + version) || "";
    $scope.$watch('validate+capture+pattern+acceptSelect+disabled+capture+multiple+allowDir+keep+orientation+' +
      'keepDistinct+modelOptions+dragOverClass+resize+resizeIf+maxFiles+duration+dimensions+ignoreInvalid+runAllValidations', function () {
      localStorage.setItem('capture' + version, $scope.capture);
      localStorage.setItem('pattern' + version, $scope.pattern);
      localStorage.setItem('acceptSelect' + version, $scope.acceptSelect);
      localStorage.setItem('disabled' + version, $scope.disabled);
      localStorage.setItem('multiple' + version, $scope.multiple);
      localStorage.setItem('allowDir' + version, $scope.allowDir);
      localStorage.setItem('validate' + version, $scope.validate);
      localStorage.setItem('keep' + version, $scope.keep);
      localStorage.setItem('orientation' + version, $scope.orientation);
      localStorage.setItem('keepDistinct' + version, $scope.keepDistinct);
      localStorage.setItem('dragOverClass' + version, $scope.dragOverClass);
      localStorage.setItem('modelOptions' + version, $scope.modelOptions);
      localStorage.setItem('resize' + version, $scope.resize);
      localStorage.setItem('resizeIf' + version, $scope.resizeIf);
      localStorage.setItem('dimensions' + version, $scope.dimensions);
      localStorage.setItem('duration' + version, $scope.duration);
      localStorage.setItem('maxFiles' + version, $scope.maxFiles);
      localStorage.setItem('ignoreInvalid' + version, $scope.ignoreInvalid);
      localStorage.setItem('runAllValidations' + version, $scope.runAllValidations);
    });
  };

}
		}	
};
