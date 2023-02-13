package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class TblMaterialUploadDto extends BaseDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5922695406306971071L;

	private Long id;
	
	private Long ownerId;
	
	private String url;
	
	private Integer type;
	
	private String title;
	
	private Double duration;
	
	private Boolean isCompleted;	
	
	public Boolean getIsCompleted() {
		return isCompleted;
	}

	public void setIsCompleted(Boolean isCompleted) {
		this.isCompleted = isCompleted;
	}

	public Double getDuration() {
		return duration;
	}

	public void setDuration(Double duration) {
		this.duration = duration;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Long ownerId) {
		this.ownerId = ownerId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "{" +title + ","+ url +"," + type+ "}";
	}

	
	
}
