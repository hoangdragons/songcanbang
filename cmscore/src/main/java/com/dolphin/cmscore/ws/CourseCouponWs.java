package com.dolphin.cmscore.ws;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.CourseCouponDto;
import com.dolphin.cmscore.logic.CourseCouponLogic;
import com.dolphin.security.filter.JwtTokenHelper;
import com.dolphin.ws.WSHelper;

@Path("/course-coupon")
@Stateless
public class CourseCouponWs {
	@Context
	private HttpServletRequest httpRequest;
	
	JwtTokenHelper tokenHelper = new JwtTokenHelper();
	
	@Inject
	private CourseCouponLogic logic;
	
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public CourseCouponDto get(@PathParam("id") Long id){
		return logic.get(id);
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public CourseCouponDto create(CourseCouponDto dto){
		Long loginId = WSHelper.getLoginId(httpRequest);
		if(loginId == null || loginId.longValue() <=0){
			return null;
		}
		WSHelper.setCreateBy(dto, httpRequest);
		return logic.create(dto);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRES_NEW,rollbackOn=Throwable.class)
	public CourseCouponDto update(CourseCouponDto dto){
		Long loginId = WSHelper.getLoginId(httpRequest);
		if(loginId == null || loginId.longValue() <=0){
			return null;
		}
		WSHelper.setUpdateBy(dto, httpRequest);
		return logic.update(dto);
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void delete(@PathParam("id") Long id){
		Long loginId = WSHelper.getLoginId(httpRequest);
		if(loginId == null || loginId.longValue() <=0){
			return;
		}
		CourseCouponDto dto = logic.get(id);
		logic.remove(dto);
	}
	
	@Path("/for-course/{courseId}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public List<CourseCouponDto> loadAppliedCoupons(@PathParam("courseId") Long courseId){
		Long loginId = WSHelper.getLoginId(httpRequest);
		if(loginId == null || loginId.longValue() <=0){
			return null;
		}
		return logic.getByCourse(courseId);
	}
}