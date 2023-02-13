package com.dolphin.cmscore.ws;

import java.lang.reflect.InvocationTargetException;
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

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dto.TblCategoryDto;
import com.dolphin.cmscore.logic.CategoryLogic;

/**
 * Class to manage RESTful service.
 * TODO Implement Asynchronous inside each method.
 */
@Path("/category")
@Stateless
public class CategoryWs {
	private final Logger logger = Logger.getLogger(CategoryWs.class.getName());
	
	@Inject
	private CategoryLogic logic;
	
	@PostConstruct
	public void init() {
		logger.info("Dolphin JAX-RS service started!");
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCategoryDto> findAll() {		
		return logic.findAllCategory();
	}	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public TblCategoryDto create(TblCategoryDto cat){		
		return logic.createCategory(cat);
	}
	
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblCategoryDto get(@PathParam("id") Long catId) {
		return logic.getCategory(catId);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public TblCategoryDto update(TblCategoryDto cat) {
		return logic.updateCategory(updateEditCat(cat)); 
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	public void delete(@PathParam("id")Long catId) {		
		logic.removeCategory(logic.getCategory(catId));
	}
	
	@GET
	@Path("/search/{keyword}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCategoryDto> search(@PathParam("keyword")String keyword) {
		return logic.searchCategory(keyword);
	}
	
	private TblCategoryDto updateEditCat(TblCategoryDto cat){
		TblCategoryDto dbCat = logic.getCategory(cat.getCategoryId());
		try {
			BeanUtils.copyProperties(dbCat, cat);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dbCat;
	}
}
