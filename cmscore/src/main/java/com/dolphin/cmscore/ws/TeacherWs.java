package com.dolphin.cmscore.ws;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
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
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblTeacherDto;
import com.dolphin.cmscore.logic.CourseTeacherLogic;
import com.dolphin.cmscore.logic.TeacherLogic;

@Path("/teacher")
@Stateless
public class TeacherWs {
	
	@Inject
	private TeacherLogic logic;
	
	@Inject
	private CourseTeacherLogic courseTeacherLogic;
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblTeacherDto get(@PathParam("id") Long id){
		return logic.get(id);
	}
//	public Integer createList(List<TblTeacherDto> teacherList){
//		
//	}
//	
//	public Integer updateList(List<TblTeacherDto> teacherList){
//		
//	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblTeacherDto create(TblTeacherDto dto){
		return logic.create(dto);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRES_NEW,rollbackOn=Throwable.class)
	public TblTeacherDto update(TblTeacherDto dto){
		return logic.update(dto);
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void delete(@PathParam("id") Long id){
		TblTeacherDto dto = logic.get(id);
		logic.remove(dto);
		courseTeacherLogic.deleteByTeacher(id);
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblTeacherDto> findAll(){
		return logic.findAll();
	}
	
	@GET
	@Path("/public/topten")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblTeacherDto> search() {
		return logic.searchTopTen();
	}
}