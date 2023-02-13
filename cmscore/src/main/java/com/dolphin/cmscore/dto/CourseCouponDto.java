package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class CourseCouponDto extends BaseDto implements Serializable{
	private static final long serialVersionUID = -2029739764775417943L;
	
	private Long id;
	private Long courseId;
	private String couponType;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCourseId() {
		return courseId;
	}
	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
	public String getCouponType() {
		return couponType;
	}
	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}
}
