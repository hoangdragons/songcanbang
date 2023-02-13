package com.dolphin.idm.ws;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.executable.ValidateOnExecution;
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
import javax.ws.rs.core.Response;

import com.dolphin.idm.entity.Role;
import com.dolphin.idm.logic.FunctionLogic;
import com.dolphin.idm.logic.RoleFunctionLogic;
import com.dolphin.persistence.dto.FunctionDto;
import com.dolphin.persistence.dto.RoleFunctionDto;

/**
 * Class to manage RESTful service.
 * TODO Implement Asynchronous inside each method.
 *
 */
@Path("/function")
@Stateless
public class FunctionWs {
	private final Logger logger = Logger.getLogger(FunctionWs.class.getName());
	@Inject
	private FunctionLogic functionLogic;
	
	@Inject
	private RoleFunctionLogic roleFunctionLogic;
	
	@Context
	private HttpServletRequest httpRequest;
	
	@PostConstruct
	public void init() {
		logger.info("Role function JAX-RS service started!");
	}	
	/**
	 * Using HTTP GET method to get a list of user 
	 * Example: send GET request to http://<host>:<port>/c1s-web/rest-api/user. 
	 * @return
	 */
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<FunctionDto> findAll(){
		return functionLogic.findAll();
	}	
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	public FunctionDto create(@NotNull(message = "formData: {validation.message.form.data.null}") @Valid FunctionDto function){
		return functionLogic.create(function);
	}
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public FunctionDto getFunctionById(@NotNull @PathParam("id") Long functionId){
		return functionLogic.get(functionId);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	public Response update(@Valid FunctionDto functionDto){
		FunctionDto dto = functionLogic.edit(functionDto);
		return Response.ok().entity(dto).build();
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	public void delete(@NotNull @PathParam("id")Long functionId){		
		functionLogic.remove(functionLogic.get(functionId));
	}
	
	@GET
	@Path("/search/{keyword}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<FunctionDto> search(@NotNull @PathParam("keyword") String keyword){
		return functionLogic.search(keyword);
	}
	
	@GET
	@Path("/search-by-role/{rId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<FunctionDto> searchByRole(@NotNull @PathParam("rId") Long rId){
		List<FunctionDto> ret = new ArrayList<FunctionDto>();
		List<RoleFunctionDto> rfDto = roleFunctionLogic.getFunctionByRoleId(rId);
		for(RoleFunctionDto rf: rfDto){
			ret.add(functionLogic.get(rf.getFunctionId()));
		}
		return ret;
	}
	
	@POST
	@Path("/update-by-role")	
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateByRole(Map<String, Object> data){		
		Role role = new Role();
		@SuppressWarnings("unchecked")
		Map<String, Object> roleObj = (Map<String, Object>)data.get("role");
		role.setRoleId(new Long(roleObj.get("roleId").toString()));
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> functionList = (List<Map<String, Object>>)data.get("functionList");
		roleFunctionLogic.updateByRole(role, functionList);
	}
	
	
}
