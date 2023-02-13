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

import com.dolphin.cmscore.dto.ContactUsDto;
import com.dolphin.cmscore.logic.ContactUsLogic;

@Path("/contactus")
@Stateless
public class ContactUsWs {
	
	@Inject
	private ContactUsLogic logic;
	
	
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ContactUsDto get(@PathParam("id") Long id){
		return logic.get(id);
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public ContactUsDto create(ContactUsDto dto){
		return logic.create(dto);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRES_NEW,rollbackOn=Throwable.class)
	public ContactUsDto update(ContactUsDto dto){
		return logic.update(dto);
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void delete(@PathParam("id") Long id){
		ContactUsDto dto = logic.get(id);
		logic.remove(dto);
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<ContactUsDto> findAll(){
		return logic.findAll();
	}
	
//	@GET
//	@Path("/public/topten")
//	@Produces(MediaType.APPLICATION_JSON)
//	public List<ContactUsDto> search() {
//		return logic.searchTopTen();
//	}
}