package com.dolphin.cmscore.ws;

import java.util.List;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.TblMaterialUploadDto;
import com.dolphin.cmscore.logic.MaterialUploadLogic;

/**
 * Class to manage RESTful service.
 * TODO Implement Asynchronous inside each method.
 *
 */
@Path("/material")
@Stateless
public class MaterialUploadWs {
	private final Logger logger = Logger.getLogger(MaterialUploadWs.class.getName());
	
	@Inject
	private MaterialUploadLogic logic;
	
	@PostConstruct
	public void init() {
		logger.info("Dolphin JAX-RS service started!");
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblMaterialUploadDto> findAll() {
		return logic.findAll();
	}	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public TblMaterialUploadDto create(TblMaterialUploadDto dto){		
		return logic.create(dto);
	}
	
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblMaterialUploadDto get(@PathParam("id") Long id) {
		return logic.get(id);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public TblMaterialUploadDto update(TblMaterialUploadDto dto) {
		return logic.update(dto); 
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	public void delete(@PathParam("id")Long id) {	
		logic.remove(id);
	}
}
