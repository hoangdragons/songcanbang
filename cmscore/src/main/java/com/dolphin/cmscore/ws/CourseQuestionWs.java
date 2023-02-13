package com.dolphin.cmscore.ws;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblCourseQuestionDto;
import com.dolphin.cmscore.logic.CourseQuestionLogic;

@Path("/course-question")
@Stateless
public class CourseQuestionWs {
	
	@Inject 
	private CourseQuestionLogic courseQuestionLogic;
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public int create(TblCourseQuestionDto question) {
		return courseQuestionLogic.createCourseQuestion(question);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public int update(TblCourseQuestionDto question) {
		return courseQuestionLogic.update(question);
	}
	
	@GET
	@Path("/get-list-question/{courseId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseQuestionDto> getListQuestionByCourseId(@PathParam("courseId") Long courseId) {
		return courseQuestionLogic.getListQuestionByCourseId(courseId);
	}
	
	/**
	 * Find all question (not filter by answer) by course id.
	 * @param courseId
	 * @return
	 */
	@GET
	@Path("/find-by-course/{courseId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseQuestionDto> findByCourse(@PathParam("courseId") Long courseId) {
		return courseQuestionLogic.findByCourse(courseId);
	}
}
