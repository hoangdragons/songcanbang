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
@Table(name="course_coupon")
@NamedQuery(name="CourseCoupon.findAll", query="SELECT t FROM CourseCoupon t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class CourseCoupon extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 5275363174946927758L;
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "course_coupon_id_seq")
	@SequenceGenerator(name = "course_coupon_id_seq", sequenceName = "course_coupon_id_seq", allocationSize= 1)
	@Column(name="ID")
	private Long id;
	
	@Column(name="COURSE_ID")
	private Long courseId;
	
	@Column(name="COUPON_TYPE")
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
