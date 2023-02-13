package com.dolphin.cmscore.ws;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblCourseSubCommentDto;
import com.dolphin.cmscore.logic.CourseSubCommentLogic;

@Path("/course-sub-comment")
@Stateless
public class CourseSubCommentWs {
	
	@Inject 
	private CourseSubCommentLogic courseSubCommentLogic;
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public int create(TblCourseSubCommentDto subComment) {
		return courseSubCommentLogic.createCourseSubComment(subComment);
	}

}
