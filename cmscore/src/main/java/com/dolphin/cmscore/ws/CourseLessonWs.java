package com.dolphin.cmscore.ws;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblCourseLessonDto;
import com.dolphin.cmscore.logic.CourseLessonLogic;

@Path("/course-lesson")
@Stateless
public class CourseLessonWs {
	
	@Inject
	private CourseLessonLogic courseLessonLogic;
	
	@Path("{lessonId}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblCourseLessonDto get(@PathParam("lessonId") Long lessonId) {
		return courseLessonLogic.getCourseLessonById(lessonId);
	}
}
