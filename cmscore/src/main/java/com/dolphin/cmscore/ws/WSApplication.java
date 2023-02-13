package com.dolphin.cmscore.ws;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

@ApplicationPath("/rest-api")
public class WSApplication extends Application{

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        // Add all needed 
        resources.add(CategoryWs.class);
        resources.add(CourseWs.class);
        resources.add(CourseChapterWs.class);
        resources.add(BoughtCourseWs.class);
        resources.add(CourseLessonWs.class);
        resources.add(CourseQuestionWs.class);
        resources.add(CourseCommentWs.class);
        resources.add(CourseSubCommentWs.class);
        resources.add(CourseRatingWs.class);
        resources.add(TeacherWs.class);
        resources.add(MagazinesWs.class);
        resources.add(LearningInformationWS.class);
        resources.add(ContactUsWs.class);
        resources.add(AffiliateInfoWs.class);
        resources.add(CouponWs.class);
        resources.add(CourseCouponWs.class);
        return resources;
    }
    
    @Override
    public Set<Object> getSingletons() {
        final Set<Object> instances = new HashSet<Object>();
        return instances;
    }
}
