package com.dolphin.cmscore.ws;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblCourseRatingDto;
import com.dolphin.cmscore.logic.CourseRatingLogic;
import com.dolphin.ws.WSHelper;

@Path("/course-rating")
@Stateless
public class CourseRatingWs {
	
	@Inject 
	private CourseRatingLogic courseRatingLogic;
	
	@Context
	private HttpServletRequest httpRequest;
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public TblCourseRatingDto create(TblCourseRatingDto ratingDto) {
		WSHelper.setCreateBy(ratingDto, httpRequest);
		return courseRatingLogic.createCourseRating(ratingDto);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public TblCourseRatingDto update(TblCourseRatingDto ratingDto) {
		WSHelper.setUpdateBy(ratingDto, httpRequest);
		return courseRatingLogic.updateUserRating(ratingDto);
	}
	
	@GET
	@Path("get-user-rating/{courseId}")
	public TblCourseRatingDto getUserRating(@PathParam("courseId") Long courseId) {
		Long userId = WSHelper.getLoginId(httpRequest);
		return courseRatingLogic.getUserRating(userId, courseId);
	}
	
	@GET
	@Path("/get-list-rating/{courseId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseRatingDto> getListRatingByCourseId(@PathParam("courseId") Long courseId) {
		return courseRatingLogic.getListRatingByCourseId(courseId);
	}
}
