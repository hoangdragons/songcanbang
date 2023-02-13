package com.dolphin.persistence.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class RoleDto extends BaseDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3278490011744337876L;

	private Long roleId;

	private String roleName;
	
	private Integer roleType;
	
	private String description;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getRoleType() {
		return roleType;
	}

	public void setRoleType(Integer roleType) {
		this.roleType = roleType;
	}

	

}
