package com.dolphin.persistence.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;


public class FunctionDto extends BaseDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long functionId;

	private String functionName;
	
	private String description;
	
	private Integer functionType;

	public FunctionDto() {
	}

	public Long getFunctionId() {
		return functionId;
	}

	public void setFunctionId(Long functionId) {
		this.functionId = functionId;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getFunctionType() {
		return functionType;
	}

	public void setFunctionType(Integer functionType) {
		this.functionType = functionType;
	}

	@Override
	public boolean equals(Object obj) {
		if(!(obj instanceof FunctionDto)){
			return false;
		}else{
			FunctionDto dto = (FunctionDto)obj;
			return dto.getFunctionId() == this.getFunctionId() && dto.getFunctionName() == this.getFunctionName()
					&& dto.getFunctionType() == this.getFunctionType()
					&& dto.getDescription() == this.getDescription();
		}
	}

	
		
}