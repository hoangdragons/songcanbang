package com.dolphin.cmscore.ws;

import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.LearningInformationDto;
import com.dolphin.cmscore.logic.LearningInformationLogic;
import com.dolphin.security.filter.JwtTokenHelper;
import com.dolphin.ws.WSHelper;

@Path("/learning-info")
@Stateless
public class LearningInformationWS {
	
	private final Logger logger = Logger.getLogger(CourseWs.class.getName());
	
	@Inject
	private LearningInformationLogic logic;
	
	@Context
	private HttpServletRequest httpRequest;
	
	JwtTokenHelper tokenHelper = new JwtTokenHelper();
	
	@PostConstruct
	public void init() {
		logger.info("Dolphin JAX-RS service started!");
	}
	
	private void setCreateBy(LearningInformationDto dto){
		dto.setCreatedBy(String.valueOf(WSHelper.getLoginId(httpRequest)));
	}
	
	private void setUpdateBy(LearningInformationDto dto){
		dto.setUpdatedBy(String.valueOf(WSHelper.getLoginId(httpRequest)));
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public LearningInformationDto push(LearningInformationDto dto) {
		setCreateBy(dto);
		return logic.push(dto);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRES_NEW,rollbackOn=Throwable.class)
	public LearningInformationDto update(LearningInformationDto dto) {
		setUpdateBy(dto);
		return logic.update(dto);
	}
	
	@Path("/check-completed/{courseId}/{materialId}")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	public LearningInformationDto getCompletedMaterial(@PathParam("courseId") Long courseId, 
			@PathParam("materialId") Long materialId){
		return logic.getCompletedMaterial(courseId, WSHelper.getLoginId(httpRequest), materialId);
		
	}
}
