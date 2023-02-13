package com.dolphin.cmscore.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;

@Entity
@Table(name="AFFILIATE_STAT")
@NamedQuery(name="AffiliateStat.findAll", query="SELECT t FROM AffiliateStat t WHERE t.deleteFlg <> 1  ORDER BY t.displayOrder")
public class AffiliateStat extends BaseEntity implements Serializable {
	private static final long serialVersionUID = -421795795899730020L;

	@Id
	@Column(name="SHV_ID")
	private String shvId;
	
	// Login id of opener
	@Column(name="TOTAL_POINT")
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
