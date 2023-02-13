package com.dolphin.idm.ws;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.inject.Inject;
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
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.dolphin.idm.entity.TblUser;
import com.dolphin.idm.logic.RoleLogic;
import com.dolphin.idm.logic.UserRoleLogic;
import com.dolphin.persistence.dto.RoleDto;
import com.dolphin.persistence.dto.UserRoleDto;

@Path("/role")
@Stateless
public class RoleWs {
	private final Logger logger = Logger.getLogger(RoleWs.class.getName());
	@Inject
	private UserRoleLogic userRoleLogic;
	
	@Inject
	private RoleLogic roleLogic;
	
	@PostConstruct
	public void init() {
		logger.info("User JAX-RS service started!");
	}
	
	/**
	 * Using HTTP GET method to get a list of user 
	 * Example: send GET request to http://<host>:<port>/c1s-web/rest-api/user. 
	 * @return
	 */
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<RoleDto> findAll(){
		return roleLogic.findAll();
	}	
	
	/**
	 * Using HTTP POST method to create an user 
	 * Example: send POST request to http://<host>:<port>/c1s-web/rest-api/user.
	 * the body should contain JSON String represent for an user. 
	 * @return
	 */
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	public RoleDto create(@NotNull(message = "formData: {validation.message.form.data.null}") @Valid RoleDto dto){
		return roleLogic.create(dto);
	}
	
	/**
	 * Using HTTP GET method to get an user matching the loginName (first one matched) 
	 * Example: To get instance of user with loginName=207012 
	 * send GET request to http://<host>:<port>/c1s-web/rest-api/user/getByLoginName/207012. 
	 * @param roleId ID of specific user 
	 * @return
	 */
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public RoleDto getUserById(@NotNull @PathParam("id") Long roleId){
		return roleLogic.get(roleId);
	}
	
	/**
	 * Updating an user by id using HTTP PUT method. 
	 * @param role User instance converting automatically from JSON string in request body
	 * @return
	 */
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	public Response update(@Valid RoleDto role){
		RoleDto dto = roleLogic.edit(role);
		return Response.ok().entity(dto).build();
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	public void delete(@NotNull @PathParam("id")Long roleId){		
		roleLogic.remove(roleLogic.get(roleId));
	}
	
	@SuppressWarnings("unchecked")
	@POST
	@Path("/update-by-user")	
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateByUser(Map<String, Object> data){		
		TblUser user = new TblUser();
		Map<String, Object> userObj = (Map<String, Object>)data.get("user");
		user.setUserId(new Long(userObj.get("userId").toString()));
		List<UserRoleDto> roleList = (List<UserRoleDto>)data.get("roleList");
		userRoleLogic.updateByUser(user, roleList);
	}
	
	@GET
	@Path("/search-by-user/{uId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<RoleDto> searchByUser(@NotNull @PathParam("uId") Long uId){
		List<RoleDto> ret = new ArrayList<RoleDto>();
		List<UserRoleDto> urList = userRoleLogic.getUserRoleByUserId(uId);
		for(UserRoleDto ur: urList){
			ret.add(roleLogic.get(ur.getRoleId()));
		}
		return ret;
	}
	
	@GET
	@Path("/search/{keyword}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<RoleDto> search(@NotNull @PathParam("keyword") String keyword){
		return roleLogic.search(keyword);
	}
	
	
	
	@GET
	@Path("/count")
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, Integer> count(){
		Map<String, Integer> ret = new HashMap<>();
		ret.put("count", roleLogic.count());
		return ret;
	}
}
