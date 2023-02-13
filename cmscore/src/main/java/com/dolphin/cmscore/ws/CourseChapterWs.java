package com.dolphin.cmscore.ws;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblCourseChapterDto;
import com.dolphin.cmscore.logic.CourseChapterLogic;

@Path("/course-chapter")
@Stateless
public class CourseChapterWs {
	
	@Inject
	private CourseChapterLogic courseChapterLogic;
	
	@Path("/get-list-chapter/{courseId}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseChapterDto> get(@PathParam("courseId") Long courseId) {
		return courseChapterLogic.getListChapterByCourseId(courseId);
	}
}
