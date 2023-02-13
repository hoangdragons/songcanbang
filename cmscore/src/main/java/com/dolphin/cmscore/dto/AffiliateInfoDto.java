package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class AffiliateInfoDto extends BaseDto implements Serializable {
	
	private static final long serialVersionUID = 85957562423440208L;

	private Long affiliateInfoId;
	
	private Long courseId;
	
	private String shvId;
	
	private String openerId;
	
	private String shvName;
	
	private String shvEmail;
	
	private String openerName;
	
	private String openerEmail;

	public Long getAffiliateInfoId() {
		return affiliateInfoId;
	}

	public void setAffiliateInfoId(Long affiliateInfoId) {
		this.affiliateInfoId = affiliateInfoId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getShvId() {
		return shvId;
	}

	public void setShvId(String shvId) {
		this.shvId = shvId;
	}

	public String getOpenerId() {
		return openerId;
	}

	public void setOpenerId(String openerId) {
		this.openerId = openerId;
	}

	public String getShvName() {
		return shvName;
	}

	public void setShvName(String shvName) {
		this.shvName = shvName;
	}

	public String getShvEmail() {
		return shvEmail;
	}

	public void setShvEmail(String shvEmail) {
		this.shvEmail = shvEmail;
	}

	public String getOpenerName() {
		return openerName;
	}

	public void setOpenerName(String openerName) {
		this.openerName = openerName;
	}

	public String getOpenerEmail() {
		return openerEmail;
	}

	public void setOpenerEmail(String openerEmail) {
		this.openerEmail = openerEmail;
	}
}
