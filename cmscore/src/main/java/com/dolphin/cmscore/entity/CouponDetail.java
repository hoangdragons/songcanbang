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
@Table(name="coupon_detail")
@NamedQuery(name="CouponDetail.findAll", query="SELECT t FROM CouponDetail t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class CouponDetail extends BaseEntity implements Serializable {
	private static final long serialVersionUID = -9106521785767781350L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "coupon_detail_id_seq")
	@SequenceGenerator(name = "coupon_detail_id_seq", sequenceName = "coupon_detail_id_seq", allocationSize= 1)
	@Column(name="ID")
	private Long id;
	
	@Column(name="coupon_type")
	private String couponType;
	
	@Column(name="CODE")
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
