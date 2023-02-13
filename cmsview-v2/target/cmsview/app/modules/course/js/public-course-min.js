app.controller("CourseListController",function(a,d,c,b){a.rcp=12;a.reloadLsCourse=function(e){a.p=e;a.lsCourse=c.getListCourseWithRcp.query({page:a.p,categoryId:b.categoryId,orderBy:a.orderBy,rcp:a.rcp});a.currentCourseCount=c.courseCount.get({categoryId:b.categoryId},function(g){a.listPage=[];a.totalPage=Math.ceil(g.count/a.rcp);for(var f=1;f<=a.totalPage;f++){a.listPage.push(f)}})};a.selectedCategory=d.getCategoryById.get({id:b.categoryId});a.orderBy="puslishDate";a.reloadLsCourse(1)});app.controller("CourseDetailController",function(j,l,b,i,g,d,c,f,k,h,e,a){l.ratingEmotionMap={};l.averageRateLevel=0;l.rateLevel1=1;l.rateLevel2=2;l.rateLevel3=3;l.rateLevel4=4;l.rateLevel5=5;l.urlPage="";l.urlPage=e.absUrl();if(e.absUrl().indexOf("?shv=")==-1){if(typeof l.$parent.signedInUser!=="undefined"){l.urlPage=e.absUrl()+"?shv="+l.$parent.signedInUser.aud}}else{if(typeof l.$parent.signedInUser!=="undefined"){l.urlPage=e.absUrl().split("?shv=")[0]+"?shv="+l.$parent.signedInUser.aud}}l.lsRatings=[];i.loadFullCourseInfoFree.get({id:k.courseId},function(n){l.course=n;l.options={type:"mp4",width:"100%",height:250,autostart:false};l.videoUrl=h.trustAsResourceUrl(n.videoUrl);if(e.absUrl().indexOf("?shv=")!=-1&&typeof l.$parent.signedInUser!=="undefined"){var m=e.absUrl().split("?shv=")[1];b.save({courseId:n.courseId,shvId:m,openerId:l.$parent.signedInUser.jti})}l.loadRatings()});l.changeContents=function(m){$(".contentDetailCourse").hide();$('span[id^="contentName"]').removeClass("active");$("#contentName"+m).addClass("active");$("#contentDetailCourse"+m).show()};l.fowardToBuyCoursePage=function(){e.path("/courses/coursePayment/"+k.courseId)};l.lsRateLevel5=[];l.rateLevel5Percentage=0;l.lsRateLevel4=[];l.rateLevel4Percentage=0;l.lsRateLevel3=[];l.rateLevel3Percentage=0;l.lsRateLevel2=[];l.rateLevel2Percentage=0;l.lsRateLevel1=[];l.rateLevel1Percentage=0;l.loadRatings=function(){l.lsRatings=d.getAllRatingByCourseId.query({courseId:k.courseId},function(m){if(typeof m!=="undefined"&&m!=null&&m.length>0){for(var n=0;n<m.length;n++){var o=m[n];if(o.ratingStar==1){l.lsRateLevel1.push(o)}if(o.ratingStar==2){l.lsRateLevel2.push(o)}if(o.ratingStar==3){l.lsRateLevel3.push(o)}if(o.ratingStar==4){l.lsRateLevel4.push(o)}if(o.ratingStar==5){l.lsRateLevel5.push(o)}if(typeof o.ratingEmotion!=="undefined"&&o.ratingEmotion!=null){if(typeof l.ratingEmotionMap[o.ratingEmotion]==="undefined"||l.ratingEmotionMap[o.ratingEmotion]==null){l.ratingEmotionMap[o.ratingEmotion]=[o]}else{l.ratingEmotionMap[o.ratingEmotion].push(o)}}}l.rateLevel1Percentage=(100*l.lsRateLevel1.length/m.length).toFixed(2);l.rateLevel2Percentage=(100*l.lsRateLevel2.length/m.length).toFixed(2);l.rateLevel3Percentage=(100*l.lsRateLevel3.length/m.length).toFixed(2);l.rateLevel4Percentage=(100*l.lsRateLevel4.length/m.length).toFixed(2);l.rateLevel5Percentage=(100*l.lsRateLevel5.length/m.length).toFixed(2);l.averageRateLevel=((l.lsRateLevel1.length+l.lsRateLevel2.length*2+l.lsRateLevel3.length*3+l.lsRateLevel4.length*4+l.lsRateLevel5.length*5)/m.length).toFixed(2);l.fullRatingData=m;l.course.rating=l.averageRateLevel;i.CourseService.update(l.course)}})};l.filterRating=function(n){for(var m=1;m<=5;m++){l.clearFiltering(m)}if(n==1){l.lsRatings=l.lsRateLevel1;l.showClearFilterBtn(1)}if(n==2){l.lsRatings=l.lsRateLevel2;l.showClearFilterBtn(2)}if(n==3){l.lsRatings=l.lsRateLevel3;l.showClearFilterBtn(3)}if(n==4){l.lsRatings=l.lsRateLevel4;l.showClearFilterBtn(4)}if(n==5){l.lsRatings=l.lsRateLevel5;l.showClearFilterBtn(5)}};l.showClearFilterBtn=function(m){$(".btn-rating-filter-"+m).removeClass("closed");$(".btn-rating-filter-"+m).addClass("open")};l.clearFiltering=function(m){l.lsRatings=l.fullRatingData;$("*[class^='btn-rating-filter']").removeClass("open");$("*[class^='btn-rating-filter']").addClass("closed")};l.insertCourseRating=function(m){m.userFullName=j.signedInUser.sub;m.avatarUrl=j.signedInUser.avataUrl;m.ratingStar=l.rate;m.courseId=k.courseId;d.crudService.save(m,function(n){l.lsRatings=d.getAllRatingByCourseId.query({courseId:k.courseId})})};l.rate=0;l.rateFunction=function(m){l.rate=m};l.isBought=false;if(j.signedInUser!=null){c.checkBoughtCourse.get({courseId:k.courseId},function(m){l.isBought=m.isBought})}l.buyCourse=function(){if(l.course.helperCourse==1){e.path("/courses/learningCourse/"+l.course.courseId)}else{var m={userId:j.signedInUser.jti,courseId:k.courseId};c.createBoughtCourse.save(m,function(n){e.path("/courses/my-courses/")})}};l.continueToLearn=function(){e.path("/courses/learningCourse/"+l.course.courseId)};l.shareWithFacebook=function(){FB.ui({method:"feed",name:"SONGCANBANG.ORG",link:l.urlPage,caption:l.course.title,picture:l.course.imageUrl,description:l.course.contentSummary},function(m){if(m&&m.post_id){}else{}})};l.couponCodeTxt="";l.applyCoupon=function(){f.get({ccode:l.couponCodeTxt},function(m){if(typeof m!=="undefined"&&m!=null){l.course.discountPrice=Math.ceil((100-m.discount)*l.course.price/100)}})}});