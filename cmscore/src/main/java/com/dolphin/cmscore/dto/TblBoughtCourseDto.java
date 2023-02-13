package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class TblBoughtCourseDto extends BaseDto implements Serializable {

	private static final long serialVersionUID = -4278570002688035895L;
	
	private Long id;
	private Long userId;
	private Long courseId;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
	
}
