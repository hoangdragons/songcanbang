package com.dolphin.persistence.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;


/**
 * The persistent class for the user_role database table.
 * 
 */
public class UserRoleDto extends BaseDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long userRoleId;
	
	private Long roleId;
	
	private Long userId;

	public Long getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(Long userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
}