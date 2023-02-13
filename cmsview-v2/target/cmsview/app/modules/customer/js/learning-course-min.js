app.controller("MyCoursesController",function(b,a,e,c,d){if(a.signedInUser==null){e.path("/homepage")}b.listCourse=[];b.reloadLsCourse=function(f){b.p=f;b.listCourse=c.getListCourseByUserId.query({userId:a.signedInUser.jti,page:b.p},function(g){console.log(g)});b.paging=c.getPagingCourse.get({userId:a.signedInUser.jti})};b.reloadLsCourse(1);b.listHelperCourse=d.loadHelperCourse.query(function(f){console.log("helper course length: "+f.length)})});app.controller("LearningCourseController",function(j,o,k,e,m,g,a,i,d,n,l,c,f,b,h){o.overviewTabTitle=g("translate")("learning.overviewTabTitle");o.courseContentTabTitle=g("translate")("learning.courseContentTabTitle");o.qaTabTitle=g("translate")("learning.qaTabTitle");o.teacherTabTitle=g("translate")("learning.teacherTabTitle");o.announcementsTabTitle=g("translate")("learning.announcementsTabTitle");if(k.signedInUser==null){e.path("/homepage")}o.rating={};o.rating.ratingStar=0;o.saveCourseRating=function(p){if(typeof p.courseId==="undefined"||typeof p.createdBy==="undefined"||p.courseId==""||p.createdBy==""||p.createdBy==null){p.userFullName=k.signedInUser.sub;p.avatarUrl=k.signedInUser.avataUrl;p.courseId=m.courseId;p.createdBy=k.signedInUser.jti;b.crudService.save(p,function(q){alert(g("translate")("rating.SAVE_SUCCESS"));o.closeDialog()})}else{p.courseId=m.courseId;p.updatedBy=k.signedInUser.jti;b.crudService.update(p,function(q){alert(g("translate")("rating.SAVE_SUCCESS"));o.closeDialog()})}};o.openRatingForm=function(){console.log(o.rating);$("#ratingStarComment").show()};o.closeDialog=function(){$("#ratingStarComment").hide()};o.course=i.loadFullCourseInfo.get({id:m.courseId},function(p){o.options={type:"mp4",width:"100%",height:239,autostart:false};o.overviewVideoUrl=j.trustAsResourceUrl(p.videoUrl);b.getUserRating.get({courseId:m.courseId},function(q){if(typeof q!=="undefined"&&q!=null&&q.courseId!=null&&q.createdBy!=null){for(var s=0;typeof q!=="undefined"&&s<q.length;s++){var t=q[s]}o.rating=q}})});o.listQuestion=l.getListQuestionByCourseId.query({courseId:m.courseId},function(p){console.log(p)});o.listComment=c.getListCommentByCourseId.query({courseId:m.courseId});o.changeLesson=function(p){o.selectedMaterial=p};o.insertCourseQuestion=function(p){if(typeof p!="undefined"&&p.question.trim()!=""){p.courseId=m.courseId;p.userId=k.signedInUser.jti;p.userAvataUrl=k.signedInUser.avataUrl;p.userName=k.signedInUser.aud;l.createQuestion.save(p,function(q){o.listQuestion=l.getListQuestionByCourseId.query({courseId:m.courseId});$("#questionArea").val("");alert("Cám ơn bạn đã gửi câu hỏi cho giảng viên. Câu hỏi của bạn sẽ được kiểm duyệt và gửi đến cho giảng viên trả lời trong thời gian sớm nhất có thể.")})}};o.insertComment=function(p){if(typeof p!="undefined"&&p.comment.trim()!=""){p.courseId=m.courseId;p.userFullName=k.signedInUser.sub;p.avatarUrl=k.signedInUser.avataUrl;c.createComment.save(p,function(q){$("#commentArea").val("");o.listComment=c.getListCommentByCourseId.query({courseId:m.courseId})})}};o.createSubComment=function(p){if(typeof p!="undefined"&&p.comment.trim()!=""){p.userFullName=k.signedInUser.sub;p.avatarUrl=k.signedInUser.avataUrl;f.createSubComment.save(p,function(q){o.listComment=c.getListCommentByCourseId.query({courseId:m.courseId})})}};o.showItem=function(p){if(p.type==1||p.type==2){o.previewVideoUrl(p.url)}};o.hideQuestionForm=function(){$(".new-question-form").css("display","none")};o.showQuestionForm=function(){$(".new-question-form").css("display","block")};o.checkComplete=function(p){var q={materialId:p.id,courseId:o.course.courseId,userId:k.signedInUser.jti,completed:(p.isCompleted?1:0)};h.push(q,function(r){o.course.completedMaterials=p.isCompleted?o.course.completedMaterials+1:o.course.completedMaterials-1})};o.hideEmoticonList=function(p){if(typeof p!=="undefined"&&p!==""){o.rating.ratingEmotion=p}$(".emoticon-list").removeClass("open");$(".emoticon-list").addClass("hide")};o.showEmoticonList=function(){$(".emoticon-list").removeClass("hide");$(".emoticon-list").addClass("open")};o.emoticonTimeout=function(){a(o.hideEmoticonList(),500)}});