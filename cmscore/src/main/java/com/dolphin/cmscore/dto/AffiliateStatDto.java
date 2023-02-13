package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.entity.BaseEntity;

public class AffiliateStatDto extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = -4176636768303069685L;

	private String shvId;
	
	private Long totalPoint;

	public String getShvId() {
		return shvId;
	}

	public void setShvId(String shvId) {
		this.shvId = shvId;
	}

	public Long getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(Long totalPoint) {
		this.totalPoint = totalPoint;
	}
}
