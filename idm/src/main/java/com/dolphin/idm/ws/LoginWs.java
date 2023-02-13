package com.dolphin.idm.ws;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.lang.StringUtils;
import org.junit.Assert;
import org.junit.Test;

import com.dolphin.annotation.interceptor.Logged;
import com.dolphin.idm.logic.FunctionLogic;
import com.dolphin.idm.logic.RoleFunctionLogic;
import com.dolphin.idm.logic.RoleLogic;
import com.dolphin.idm.logic.UserLogic;
import com.dolphin.idm.logic.UserRoleLogic;
import com.dolphin.idm.security.IDMJwtTokenHelper;
import com.dolphin.persistence.dto.FunctionDto;
import com.dolphin.persistence.dto.RoleDto;
import com.dolphin.persistence.dto.RoleFunctionDto;
import com.dolphin.persistence.dto.UserDto;
import com.dolphin.persistence.dto.UserRoleDto;
import com.dolphin.security.digest.SHA256PasswordEncoder;
import com.dolphin.util.PropertyUtil;
import com.google.gson.Gson;

import io.jsonwebtoken.Claims;

@Path("/security")
@Stateless
public class LoginWs {
	@Inject
	private UserLogic userLogic;
	
	@Inject 
	private RoleLogic roleLogic;
	
	@Inject
	FunctionLogic functionLogic;
	
	@Inject
	RoleFunctionLogic roleFunctionLogic;
	
	@Inject 
	private UserRoleLogic userRoleLogic;
	
//	private SHA256PasswordEncoder enc = new SHA256PasswordEncoder(true);
	
	private PropertyUtil propertyUtil = new PropertyUtil();
	
	/**
	 * Validate FB account exist
	 * @param token
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void validateFaceBookUserId(String token) throws Exception{
		try { 
			Gson gson = new Gson();
			String VALIDATE_FACEBOOK_USERID_URL = propertyUtil.get("VALIDATE_FACEBOOK_USERID_URL");
			HttpsURLConnection hsu = (HttpsURLConnection) openConn(VALIDATE_FACEBOOK_USERID_URL + token, "GET");
			String ret = "";
			String tmp;
			
			BufferedReader isr = new BufferedReader(new InputStreamReader(hsu.getInputStream()));
			while ((tmp = isr.readLine()) != null) {
				if(!StringUtils.isEmpty(tmp))
					ret += tmp;
			}
			isr.close();			
			hsu.disconnect();
			Map<String, String> u = gson.fromJson(ret, Map.class);
			Assert.assertNotNull(u);
			Assert.assertNotNull(u.get("id"));
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;

		} 
	}
	
	/**
	 * Validate FB if user login to Dolphin project
	 * @param token
	 * @throws Exception
	 * @Deprecated not valid check
	 */
	@SuppressWarnings("unchecked")
	public void validateFaceBookAppId(String token)throws Exception{
		try { 
			Gson gson = new Gson();
			String VALIDATE_FACEBOOK_APPID_URL = propertyUtil.get("VALIDATE_FACEBOOK_APPID_URL");
			String DOLPHIN_FB_ID = propertyUtil.get("DOLPHIN_FB_ID");
			HttpsURLConnection hsu = (HttpsURLConnection) openConn(VALIDATE_FACEBOOK_APPID_URL + token, "GET");
			String ret = "";
			String tmp;
			
			BufferedReader isr = new BufferedReader(new InputStreamReader(hsu.getInputStream()));
			while ((tmp = isr.readLine()) != null) {
				if(!StringUtils.isEmpty(tmp))
					ret += tmp;
			}
			isr.close();			
			hsu.disconnect();
			Map<String, String> u = gson.fromJson(ret, Map.class);
			Assert.assertNotNull(u);
			Assert.assertNotNull(u.get("id"));
			Assert.assertEquals(u.get("id"), DOLPHIN_FB_ID);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		} 
	}
	
	/**
	 * Validate FB if user login to Dolphin project
	 * @param token
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void validateGoogleAccount(UserDto candidateUser, String accessToken)throws Exception{
		try { 
			Gson gson = new Gson();
			String VALIDATE_GOOGLE_ACCOUNT_URL = propertyUtil.get("VALIDATE_GOOGLE_ACCOUNT_URL");
			HttpsURLConnection hsu = (HttpsURLConnection) openConn(VALIDATE_GOOGLE_ACCOUNT_URL + accessToken, "GET");
			String ret = "";
			String tmp;
			
			BufferedReader isr = new BufferedReader(new InputStreamReader(hsu.getInputStream()));
			while ((tmp = isr.readLine()) != null) {
				if(!StringUtils.isEmpty(tmp))
					ret += tmp;
			}
			isr.close();			
			hsu.disconnect();
			/*
	       	 	{
					 "id": "114624943412782049475",
					 "email": "nghia.n.v2007@gmail.com",
					 "verified_email": true,
					 "name": "Nguyễn Nghĩa",
					 "given_name": "Nguyễn",
					 "family_name": "Nghĩa",
					 "link": "https://plus.google.com/114624943412782049475",
					 "picture": "https://lh6.googleusercontent.com/-JyESdPzgZ8A/AAAAAAAAAAI/AAAAAAAABI4/3oEe-nPkb1o/photo.jpg",
					 "gender": "male",
					 "locale": "vi"
				 }
	       	 */
			Map<String, String> u = gson.fromJson(ret, Map.class);
			Assert.assertNotNull(u);
			Assert.assertEquals(u.get("id"), candidateUser.getGoogleId());
			Assert.assertEquals(u.get("email"), candidateUser.getEmail());
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		} 
	}
	
	/**
	 * Open a connection to server with REQUEST_METHOD definition
	 * @param urlk
	 * @param method
	 * @return
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public static URLConnection openConn(String urlk, String method) throws MalformedURLException, IOException {
		URL url = new URL(urlk);
		HttpsURLConnection hsu = (HttpsURLConnection) url.openConnection();
		hsu.setConnectTimeout(5000);
        hsu.setReadTimeout(5000);
        hsu.setUseCaches(true);
        
        // Prevent user from wrong setting request method
        if("POST".equals(method) || "PUT".equals(method)){
            hsu.setDoOutput(true);            
        }else{
            hsu.setDoInput(true);
        }
		hsu.setRequestMethod(method);
		
		return hsu;
	}

	@Path("/login")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	@Logged
	public Response login(UserDto user, @Context final HttpServletRequest request) {
		UserDto u = null;
		String token = null;
		String fbAccessToken = user.getFbAccessToken();
		String googleAccessToken = user.getGoogleAccessToken();
		try {
			SHA256PasswordEncoder enc = new SHA256PasswordEncoder(true);
			if(user.getLoginName() == null || user.getLoginName().equals("")){
				throw new Exception("Invalid user name");
			}
			if((fbAccessToken == null || "".equals(fbAccessToken))
					&& (googleAccessToken == null || "".equals(googleAccessToken)) 
					&& (user.getPassword() == null || user.getPassword().equals(""))){
				throw new Exception("Invalid password");
			}
			
			// Check if facebook login
			if(fbAccessToken != null && !"".equals(fbAccessToken)){
				validateFaceBookAppId(fbAccessToken);
				validateFaceBookUserId(fbAccessToken);
				
				// push facebok account to local DB.
				u = userLogic.syncFacebookAccount(user);
			}
			
			//Check if google login
			if(googleAccessToken != null && !"".equals(googleAccessToken)){
				validateGoogleAccount(user, googleAccessToken);
				
				// push facebok account to local DB.
				u = userLogic.syncGoogleAccount(user);
			}
			
			// Just checking password if not login by Social network
			// at this time we check with facebook only.
			if((fbAccessToken == null || "".equals(fbAccessToken)) 
					&& (googleAccessToken == null || "".equals(googleAccessToken))){
				u = userLogic.getUserByLoginName(user.getLoginName());
				if(u != null && u.getPassword() != null && !u.getPassword().equals("")){
					String providePasswd = enc.encodePassword(user.getPassword(), null);
					if(!providePasswd.equals(u.getPassword())){
						throw new Exception("Wrong password");
					}
				}
			}		
			
			// Role information
			Map<String, Object> uExInfo = new HashMap<String, Object>();
			System.out.println("-------------- Debug user ID " + u); 
			List<UserRoleDto> dtoList = userRoleLogic.getUserRoleByUserId(u.getUserId());
			List<RoleDto> userRoleList = new ArrayList<RoleDto>();
			List<FunctionDto> userFunctionNameList = new ArrayList<FunctionDto>();
			for(UserRoleDto ur: dtoList){
				userRoleList.add(roleLogic.get(ur.getRoleId()));
				List<RoleFunctionDto> rfDtoList = roleFunctionLogic.getFunctionByRoleId(ur.getRoleId());
				for(RoleFunctionDto rfDto:rfDtoList){
					FunctionDto fdto = functionLogic.get(rfDto.getFunctionId());
					if(!userFunctionNameList.contains(fdto)){
						userFunctionNameList.add(fdto);
					}
				}
			}
			Gson gson = new Gson();
			String userRoleJsonString = gson.toJson(userRoleList);
			
			String userFuncJsonString = gson.toJson(userFunctionNameList);
			
			uExInfo.put("ROLES", userRoleJsonString);
			uExInfo.put("FUNCS", userFuncJsonString);
			
			uExInfo.put("loginNameHash",enc.encodePassword(u.getLoginName(), null));
			uExInfo.put("avataUrl", u.getAvataUrl());
			uExInfo.put("email", u.getEmail());
			uExInfo.put("telephone", u.getTelephone());
			uExInfo.put("fullName", u.getFullName());
			uExInfo.put("userId", u.getUserId());
			
			Date d = u.getBirthday();
			
			if(d != null){
				SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
				uExInfo.put("birthday", sd.format(d));
				Calendar birthDate = Calendar.getInstance();
				birthDate.setTime(d);
				int birthYear = birthDate.get(Calendar.YEAR);
				
				Calendar curDate = Calendar.getInstance();
				curDate.setTimeInMillis(System.currentTimeMillis());
				
				int curYear = curDate.get(Calendar.YEAR);
				int age = curYear - birthYear;
				// Age
				uExInfo.put("age", age);
			}
			
			// Occupation
			uExInfo.put("occupation", u.getOccupation());
			// Sexuality
			if(u.getSex() != null){
				uExInfo.put("sex", u.getSex() == 1?"Male":"Female");
			}
			
			// Main address
			uExInfo.put("mainAddress", u.getMainAddress());
			
			//uExInfo.put("addDate", u.getCreatedAt());
			
			uExInfo.put("facebookId", u.getFacebookId());
			uExInfo.put("googleId", u.getGoogleId());
			
			uExInfo.put("fbAccessToken", user.getFbAccessToken());
			uExInfo.put("googleAccessToken", user.getGoogleAccessToken());
			
			token = IDMJwtTokenHelper.getInstance().createJWT(
					request.getRemoteHost()
					, u
					, uExInfo
					, (12*60*60*1000));
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return Response.ok().entity(token).build();
	}
	
	@Path("/logout")
	@GET	
	@Logged
	public Response logout(@Context final HttpServletRequest request) {
		try {			
			request.logout();
		} catch (ServletException ex) {
			ex.printStackTrace();
		}
		
		return Response.ok().build();
	}
	
	@Path("/getLoggedInUser")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Logged
	public Response getLoggedInUser(@Context final HttpServletRequest request) {
		String token = request.getHeader("Authorization");
		if(token == null)
			return Response.ok().build();
		
		Claims claims = null;
		try {
			claims = IDMJwtTokenHelper.getInstance().parseJWT(token);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		claims.getId();
		return Response.ok().entity(claims).build();
	}
	@Test
	public void testValidFBAccount(){
		String tempToken = "EAARwUHqzpNgBAKEqjKbPtxZBK6wi2WrQymWPXxiFMxr607qx07PlDd7mH3ZCgLqRaYlzLjqTbfBhXZCGvQwQS93pT1qYpKMJZACvqmQZCHMFYRZBCLDKarPP5a9CFEnQNqjAFWsrGSIqfwc7mZBVnukQpHYs9fxbBwLnpbelT71WZBk2Cex7ckkU";
		try {
			// Test accountId = 10212086152647568 Nghianv FB account
			validateFaceBookAppId(tempToken);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			// Test accountId = 10212086152647568 Nghianv FB account
			validateFaceBookUserId(tempToken);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
