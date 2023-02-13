package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.Date;

import com.dolphin.persistence.dto.BaseDto;
import com.fasterxml.jackson.annotation.JsonFormat;

public class CouponMasterDto extends BaseDto implements Serializable {
	private static final long serialVersionUID = 7342139741375301029L;

	private Long couponMasterId;
	
	private String couponType;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy", timezone="CET")
    private Date startAt;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy", timezone="CET")
    private Date endAt;
	
	private Double discount;

	private String description;
	
	private String name;
	
	private String logo;

	public Long getCouponMasterId() {
		return couponMasterId;
	}

	public void setCouponMasterId(Long couponMasterId) {
		this.couponMasterId = couponMasterId;
	}

	public String getCouponType() {
		return couponType;
	}

	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}

	public Date getStartAt() {
		return startAt;
	}

	public void setStartAt(Date startAt) {
		this.startAt = startAt;
	}

	public Date getEndAt() {
		return endAt;
	}

	public void setEndAt(Date endAt) {
		this.endAt = endAt;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
}
