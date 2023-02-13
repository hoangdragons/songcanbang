package com.dolphin.persistence.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class RoleFunctionDto extends BaseDto implements Serializable{
	private static final long serialVersionUID = 6979423914940057294L;

	private Long roleFunctionId;
	
	private Long roleId;
	
	private Long functionId;

	public Long getRoleFunctionId() {
		return roleFunctionId;
	}

	public void setRoleFunctionId(Long roleFunctionId) {
		this.roleFunctionId = roleFunctionId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getFunctionId() {
		return functionId;
	}

	public void setFunctionId(Long functionId) {
		this.functionId = functionId;
	}
	
	
}
