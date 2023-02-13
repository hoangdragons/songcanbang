package com.dolphin.cmscore.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;

@Entity
@Table(name="AFFILIATE_INFO")
@NamedQuery(name="AffiliateInfo.findAll", query="SELECT t FROM AffiliateInfo t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class AffiliateInfo extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 7708071495646260454L;
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "affiliate_info_id_seq")
	@SequenceGenerator(name = "affiliate_info_id_seq", sequenceName = "affiliate_info_id_seq", allocationSize= 1)
	@Column(name="AFFILIATE_INFO_ID")
	private Long affiliateInfoId;
	
	@Column(name="COURSE_ID")
	private Long courseId;
	
	@Column(name="SHV_ID")
	private String shvId;
	
	// Login id of opener
	@Column(name="OPENER_ID")
	private String openerId;

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
}
