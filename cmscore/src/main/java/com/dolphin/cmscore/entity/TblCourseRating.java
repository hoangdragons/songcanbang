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

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_course_rating database table.
 * 
 */
@Entity
@Table(name="tbl_course_rating")
@NamedQuery(name="TblCourseRating.findAll", query="SELECT t FROM TblCourseRating t")
public class TblCourseRating extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "rating_id_seq")
	@SequenceGenerator(name = "rating_id_seq", sequenceName = "rating_id_seq", allocationSize= 1)
	@Column(name="rating_id")
	private Integer ratingId;
	
	@Column(name="COURSE_ID")
	private Long courseId;

	@Column(name="rating_comment")
	private String ratingComment;

	@Column(name="rating_star")
	private Integer ratingStar;

	@Column(name="rating_time")
	private Date ratingTime;
	
	@Column(name="AVATAR_URL")
	private String avatarUrl;
	
	@Column(name="USER_FULL_NAME")
	private String userFullName;

	@Column(name="RATING_EMOTION")
	private String ratingEmotion;
	
	public TblCourseRating() {
	}

	public Integer getRatingId() {
		return this.ratingId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public void setRatingId(Integer ratingId) {
		this.ratingId = ratingId;
	}

	public String getRatingComment() {
		return this.ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	public Integer getRatingStar() {
		return this.ratingStar;
	}

	public void setRatingStar(Integer ratingStar) {
		this.ratingStar = ratingStar;
	}

	public Date getRatingTime() {
		return this.ratingTime;
	}

	public void setRatingTime(Date ratingTime) {
		this.ratingTime = ratingTime;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public String getUserFullName() {
		return userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	public String getRatingEmotion() {
		return ratingEmotion;
	}

	public void setRatingEmotion(String ratingEmotion) {
		this.ratingEmotion = ratingEmotion;
	}
}