package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class CouponDetailDto extends BaseDto implements Serializable {
	private static final long serialVersionUID = -1061678797923509166L;

	private Long id;
	
	private String couponType;
	
	private String code;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCouponType() {
		return couponType;
	}

	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
