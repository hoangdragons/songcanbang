package com.dolphin.idm.ws;

import java.util.HashMap;
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

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.idm.entity.RegisterUser;
import com.dolphin.idm.logic.UserLogic;
import com.dolphin.persistence.dto.UserDto;
import com.dolphin.ws.WSHelper;

@Path("/user")
@Stateless
public class UserWs {
	private final Logger logger = Logger.getLogger(UserWs.class.getName());
	@Inject
	private UserLogic userLogic;
	
	@Context
	private HttpServletRequest httpRequest;
	private Long loginId = null;
	private boolean loginIsAdmin = false;
	@PostConstruct
	public void init(){
		logger.info("User JAX-RS service started!");
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserDto> findAll(){
		return userLogic.findAll();
	}	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	public UserDto create(@NotNull(message = "formData: {validation.message.form.data.null}") @Valid UserDto user){
		return userLogic.create(user);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	public Response update(@Valid UserDto user){
		loginId = WSHelper.getLoginId(httpRequest);
		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
		if(loginId != null && (loginId.equals(user.getUserId()) || loginIsAdmin)){
			UserDto dto = userLogic.edit(user);
			return Response.ok().entity(dto).build();
		}else
			return Response.ok().entity(null).build();
	}

	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public UserDto getUserById(@NotNull @PathParam("id") Long userId){
		loginId = WSHelper.getLoginId(httpRequest);
		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
		if(loginId != null && (loginId.equals(userId) || loginIsAdmin)){
			return userLogic.get(userId);
		}else
			return null;
	}
	
	@Path("/change-pass")
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response updatePassword(UserDto user){
		loginId = WSHelper.getLoginId(httpRequest);
		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
		
		if(loginId != null && (loginId.equals(user.getUserId()) || loginIsAdmin)){
			// Not change password for Facebook and google account
			if((user.getFacebookId() == null || "".equals(user.getFacebookId()))
					&& (user.getPassword() == null  || "".equals(user.getPassword())) ){
				return Response.ok().entity(null).build();
			}
			if((user.getGoogleId() == null || "".equals(user.getGoogleId()))
					&& (user.getPassword() == null  || "".equals(user.getPassword())) ){
				return Response.ok().entity(null).build();
			}
			UserDto dto = userLogic.updatePassword(user);
			return Response.ok().entity(dto).build();
		}else{
			return Response.ok().entity(null).build();
		}
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	public void delete(@NotNull @PathParam("id")Long userId){	
		loginId = WSHelper.getLoginId(httpRequest);
		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
		if(loginId != null && (loginId.equals(userId) || loginIsAdmin)){
			UserDto user = userLogic.get(userId);
			if(user== null){
				return;
			}
			if((user.getFacebookId() == null || "".equals(user.getFacebookId()))
					&& (user.getPassword() == null  || "".equals(user.getPassword())) ){
				return;
			}
			if((user.getGoogleId() == null || "".equals(user.getGoogleId()))
					&& (user.getPassword() == null  || "".equals(user.getPassword())) ){
				return;
			}
			userLogic.remove(userLogic.get(userId));
		}else
			return;
	}
	
	@GET
	@Path("/search/{keyword}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserDto> search(@NotNull @PathParam("keyword") String keyword){
		loginId = WSHelper.getLoginId(httpRequest);
		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
		if(loginId.longValue() > 0L){
			return userLogic.search(keyword);
		}else
			return null;
	}
	
	@GET
	@Path("/load-with-paging/{limit}/{offset}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserDto> loadUserWithPagination(
			@NotNull @PathParam("limit")int limit, 
			@NotNull @PathParam("offset")int offset){
		loginId = WSHelper.getLoginId(httpRequest);
		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
		if(loginIsAdmin){
			if(limit == -1){
				return findAll();
			}else
				return userLogic.loadUserWithPagination(limit, offset -1);
		}else{
			return null;
		}
	}
	
	@POST
	@Path("/search-email")
	@Produces(MediaType.APPLICATION_JSON)
	public UserDto searchByEmail(String email){
//		loginId = WSHelper.getLoginId(httpRequest);
//		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
//		if(loginId > 0L){
		UserDto u1 = userLogic.getRegUserByEmail(email);
		UserDto u2 = userLogic.getUserByEmail(email);
		return u1 != null?u1:u2;
//		}else
//			return null;
	}
	
	@GET
	@Path("/search-login-name/{loginName}")
	@Produces(MediaType.APPLICATION_JSON)
	public UserDto searchLoginName(@NotNull @PathParam("loginName") String loginName){
//		loginId = WSHelper.getLoginId(httpRequest);
//		loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
//		if(loginId > 0L){
		UserDto u1 = userLogic.getRegUserByLoginName(loginName);
		UserDto u2 = userLogic.getUserByLoginName(loginName);
		return u1 != null?u1:u2;
//		}else
//			return null;
	}
	

	@GET
	@Path("/count")
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, Integer> count(){
		Map<String, Integer> ret = new HashMap<>();
		ret.put("count", userLogic.count());
		return ret;
	}
	
	// USER register API
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	@Path("/register")
	public UserDto register(@NotNull(message = "formData: {validation.message.form.data.null}") @Valid UserDto user){
		return userLogic.register(user);
	}
	
	/**
	 * Email confirmation on registration. 
	 * @param email
	 * @return
	 */
	@GET
	@Path("/register-confirm/{email}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public UserDto confirm(@NotNull @PathParam("email") String email, @NotNull @PathParam("token") String token){
		UserDto dto = userLogic.validate(email, token);
		RegisterUser regUser = new RegisterUser();
		try{
			BeanUtils.copyProperties(regUser, dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		userLogic.deleteRegUser(regUser);
		return dto;
	}
	
//	@POST
//	@Path("/delete-register-user")
//	@Produces(MediaType.APPLICATION_JSON)
//	public UserDto deleteRegUser(UserDto dto){
//		RegisterUser u = registerUserDao.getRegUserByLoginName(loginName);
//		
//		RegisterUser regUser = new RegisterUser();
//		try{
//			BeanUtils.copyProperties(regUser, dto);
//		}catch(Exception e){
//			/// ignore
//		}
//		userLogic.deleteRegUser(regUser);
//		return dto;
//	}
	
	
	// Reset password
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@ValidateOnExecution
	@Path("/reset-passwd")
	public UserDto requestResetPasswd(@NotNull(message = "formData: {validation.message.form.data.null}") @Valid UserDto user){
		return userLogic.requestResetPasswd(user);
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/update-profile")
	public UserDto updateProfile(UserDto dto) {
		return userLogic.updateProfile(dto);
	}
	
	/**
	 * Email confirmation on registration. 
	 * @param email
	 * @return
	 */
	@GET
	@Path("/reset-passwd/{email}/{token}")
	@Produces(MediaType.APPLICATION_JSON)
	public UserDto resetPassword(@NotNull @PathParam("email") String email, @NotNull @PathParam("token") String token){
		return userLogic.resetPassword(email, token);
	}
}
