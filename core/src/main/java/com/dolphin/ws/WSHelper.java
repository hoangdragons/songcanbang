package com.dolphin.ws;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dolphin.persistence.dto.BaseDto;
import com.dolphin.persistence.dto.RoleDto;
import com.dolphin.security.filter.JwtTokenHelper;
import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;

import io.jsonwebtoken.Claims;

public class WSHelper {
	
	static JwtTokenHelper tokenHelper = new JwtTokenHelper();
	public static Gson gson = new Gson();
	
	public static Long getLoginId(HttpServletRequest httpRequest){
		return new Long(getLoginClaims(httpRequest).getId());
	}
	
	public static String getLoginName(HttpServletRequest httpRequest){
		return getLoginClaims(httpRequest).getAudience();
	}
	
	public static Claims getLoginClaims(HttpServletRequest httpRequest){
		String token = httpRequest.getHeader("Authorization");
		if(token == null || token.equals("")){
			return null;
		}
		Claims claims = tokenHelper.parseJWT(token);
		return claims;
	}
	
	public static Boolean checkRole(HttpServletRequest httpRequest, String roleName){
		List<RoleDto> listRole = WSHelper.getUserRoleList(WSHelper.getLoginClaims(httpRequest));
		if(listRole == null || listRole.size() ==0){
			return false;
		}
		for(RoleDto dto: listRole){
			System.out.println("Role name: "  + dto.getRoleName());
			if(dto.getRoleName() != null && roleName.equals(dto.getRoleName())){
				return true;
			}
		}
		return false;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<RoleDto> getUserRoleList(Claims claims){
		List<LinkedTreeMap> userRoleList1 = WSHelper.gson.fromJson(claims.get("ROLES").toString(), List.class);
		List<RoleDto> userRoleList = new ArrayList<RoleDto>();
		for(LinkedTreeMap m:userRoleList1){
			RoleDto dto = new RoleDto();
			dto.setRoleId(new Double(m.get("roleId").toString()).longValue());
			dto.setRoleName(m.get("roleName").toString());
			dto.setRoleType(new Double(m.get("roleType").toString()).intValue());
			dto.setDescription(m.get("description").toString());
			userRoleList.add(dto);
		}
		return userRoleList;
	}
	@SuppressWarnings({"unchecked" })
	public static boolean loginIsAdmin(HttpServletRequest httpRequest){
		String token = httpRequest.getHeader("Authorization");
		Claims claims = tokenHelper.parseJWT(token);
		String rolesJSON = (String)claims.get("ROLES");
		Gson g = new Gson();
		List<Object> userRoleList = g.fromJson(rolesJSON, List.class); 
		if(userRoleList == null || userRoleList.size() == 0){
			return false;
		}
		for(Object d: userRoleList){
			Map<String, Object> map = (Map<String, Object>)d;
			String roleName = map.get("roleName").toString();
			if(roleName != null && roleName.equals("ADMIN")){
				return true;
			}
		}
		return false;
	}
	
	public static void setCreateBy(BaseDto dto, HttpServletRequest httpRequest){
		dto.setCreatedBy(String.valueOf(WSHelper.getLoginId(httpRequest)));
	}
	
	public static void setUpdateBy(BaseDto dto, HttpServletRequest httpRequest){
		dto.setUpdatedBy(String.valueOf(WSHelper.getLoginId(httpRequest)));
	}
}
