package com.dolphin.cmscore.ws;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblCourseCommentDto;
import com.dolphin.cmscore.logic.CourseCommentLogic;

@Path("/course-comment")
@Stateless
public class CourseCommentWs {

	@Inject 
	private CourseCommentLogic courseCommentLogic;
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public int create(TblCourseCommentDto comment) {
		return courseCommentLogic.createCourseComment(comment);
	}
	
	@GET
	@Path("/get-list-comment/{courseId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseCommentDto> getListQuestionByCourseId(@PathParam("courseId") Long courseId) {
		return courseCommentLogic.getListCommentByCourseId(courseId);
	}
}
