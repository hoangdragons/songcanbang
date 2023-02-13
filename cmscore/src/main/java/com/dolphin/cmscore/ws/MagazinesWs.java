package com.dolphin.cmscore.ws;

import java.util.HashMap;
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

import com.dolphin.cmscore.dto.TblCourseDto;
import com.dolphin.cmscore.dto.TblMagazinesDto;
import com.dolphin.cmscore.dto.TblTeacherDto;
import com.dolphin.cmscore.logic.MagazinesLogic;

@Path("/magazines")
@Stateless
public class MagazinesWs {
	
	@Inject
	private MagazinesLogic magazinesLogic;
	
	@GET
	@Path("/get-list-magazines/{page}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblMagazinesDto> getListManazines(@PathParam("page") int page) {
		return magazinesLogic.getListManazines(page);
	}
	
	@GET
	@Path("/get-total-page-magazines")
	@Produces(MediaType.APPLICATION_JSON)
	public HashMap<String, Object> getTotalPageMagazines() {
		return magazinesLogic.getTotalPageMagazines();
	}
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblMagazinesDto get(@PathParam("id") Integer magazineId) {
		return magazinesLogic.get(magazineId);
	}

	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblMagazinesDto create(TblMagazinesDto dto){
		return magazinesLogic.create(dto);
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRES_NEW,rollbackOn=Throwable.class)
	public TblMagazinesDto update(TblMagazinesDto dto){
		return magazinesLogic.edit(dto);
	}

	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void delete(@PathParam("id") Integer id){
		TblMagazinesDto dto = magazinesLogic.get(id);
		magazinesLogic.remove(dto);
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblMagazinesDto> findAll(){
		return magazinesLogic.findAll();
	}
	
	@GET
	@Path("/public/topten")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblMagazinesDto> search() {
		return magazinesLogic.searchTopTen();
	}
}
