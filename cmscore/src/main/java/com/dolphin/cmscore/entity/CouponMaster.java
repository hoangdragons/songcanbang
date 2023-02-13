package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.dolphin.persistence.entity.BaseEntity;

@Entity
@Table(name="coupon_master")
@NamedQuery(name="CouponMaster.findAll", query="SELECT t FROM CouponMaster t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class CouponMaster extends BaseEntity implements Serializable {
	private static final long serialVersionUID = -5727333058500443901L;
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "coupon_master_id_seq")
	@SequenceGenerator(name = "coupon_master_id_seq", sequenceName = "coupon_master_id_seq", allocationSize= 1)
	@Column(name="COUPON_MASTER_ID")
	private Long couponMasterId;
	
	@Column(name="COUPON_TYPE")
	private String couponType;

	@Column(name = "START_AT")  
    @Temporal(TemporalType.TIMESTAMP)  
    private Date startAt;
	
	@Column(name = "END_AT")  
    @Temporal(TemporalType.TIMESTAMP)  
    private Date endAt;
	
	@Column(name = "DISCOUNT")  
	private Double discount;


	@Column(name = "DESCRIPTION")  
	private String description;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="LOGO")
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
