package com.dolphin.cmscore.ws;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.CouponMasterDto;
import com.dolphin.cmscore.dto.CourseCouponDto;
import com.dolphin.cmscore.dto.CourseTeacherDto;
import com.dolphin.cmscore.dto.TblBoughtCourseDto;
import com.dolphin.cmscore.dto.TblCourseDto;
import com.dolphin.cmscore.dto.TblTeacherDto;
import com.dolphin.cmscore.logic.BoughtCourseLogic;
import com.dolphin.cmscore.logic.CouponMasterLogic;
import com.dolphin.cmscore.logic.CourseCouponLogic;
import com.dolphin.cmscore.logic.CourseRatingLogic;
import com.dolphin.cmscore.logic.CourseTeacherLogic;
import com.dolphin.cmscore.logic.TeacherLogic;
import com.dolphin.security.filter.JwtTokenHelper;
import com.dolphin.ws.WSHelper;

@Path("/bought-course")
@Stateless
public class BoughtCourseWs {
	
	@Inject
	private BoughtCourseLogic boughtCourseLogic;
	
	@Inject
	private CourseTeacherLogic courseTeacherLogic;
	
	@Inject
	private TeacherLogic teacherLogic;
	
	@Context
	private HttpServletRequest httpRequest;
	
	@Inject
	private CourseCouponLogic courseCouponLogic;
	
	@Inject
	private CouponMasterLogic couponMasterLogic;
	
	@Inject
	private CourseRatingLogic courseRatingLogic;
	
	JwtTokenHelper tokenHelper = new JwtTokenHelper();
	
	@GET
	@Path("/get-course-by-user-id/{page}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> getListCourseByUserId(@PathParam("page") int page) {
		Long userId = WSHelper.getLoginId(httpRequest);
		List<TblCourseDto> dtos =  new ArrayList<TblCourseDto>();
		for(TblCourseDto dto: boughtCourseLogic.getListCourseByUserId(userId, page)){
			// Update discount info
			List<CourseCouponDto> listAppliedCoupon = courseCouponLogic.getByCourse(dto.getCourseId());
			double discountPrice = dto.getPrice();
			double totalDiscount = 0d;
			for(CourseCouponDto coupon:listAppliedCoupon){
				CouponMasterDto couponMasterDto = couponMasterLogic.getByCouponType(coupon.getCouponType());
				totalDiscount += couponMasterDto.getDiscount();
			}
			if(totalDiscount > 0d && dto.getPrice() >0){
				discountPrice = dto.getPrice() * (1 - totalDiscount /100);
			}
			dto.setDiscountPrice(discountPrice);
			
			// Update rating
			dto.setTotalRating(courseRatingLogic.countRatingByCourseId(dto.getCourseId()));
			
			List<CourseTeacherDto> ctds = courseTeacherLogic.findByCourse(dto.getCourseId());
			List<TblTeacherDto> teachers = new ArrayList<TblTeacherDto>();
			for(CourseTeacherDto d:ctds){
				TblTeacherDto t = teacherLogic.get(d.getTeacherId());
				teachers.add(t);
			}
			dto.setTeachers(teachers);
			dtos.add(dto);
		}
		return dtos;
	}
	
	@GET
	@Path("/get-paging-course")
	@Produces(MediaType.APPLICATION_JSON)
	public HashMap<String, Object> getTotalPageSeachCourse() {
		Long userId = WSHelper.getLoginId(httpRequest);
		return boughtCourseLogic.getTotalPageSeachCourse(userId);
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public int create(TblBoughtCourseDto boughtCourse) {
		Long userId = WSHelper.getLoginId(httpRequest);
		if(userId != null && userId.intValue() >0){
			return boughtCourseLogic.createBoughtCourse(boughtCourse);
		}else{
			return -1;
		}
		
	}
	
	@GET
	@Path("/check-bought-course/{courseId}")
	@Produces(MediaType.APPLICATION_JSON)
	public HashMap<String, Object> isBought(@PathParam("courseId") Long courseId) {
		Long userId = WSHelper.getLoginId(httpRequest);
		HashMap<String, Object> result = new HashMap<>();
		result.put("isBought", boughtCourseLogic.checkBoughtCourse(userId, courseId));
		return result;
	}
}
