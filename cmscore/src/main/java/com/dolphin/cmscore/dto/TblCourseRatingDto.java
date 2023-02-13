package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.Date;

import com.dolphin.persistence.dto.BaseDto;

public class TblCourseRatingDto  extends BaseDto implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4114319133013826372L;
	private Integer ratingId;
	private Long courseId;
	private String ratingComment;
	private Integer ratingStar;
	private Date ratingTime;
	private String avatarUrl;
	private String userFullName;
	
	private String ratingEmotion;
	
	public Integer getRatingId() {
		return ratingId;
	}
	
	public void setRatingId(Integer ratingId) {
		this.ratingId = ratingId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	public Integer getRatingStar() {
		return ratingStar;
	}

	public void setRatingStar(Integer ratingStar) {
		this.ratingStar = ratingStar;
	}

	public Date getRatingTime() {
		return ratingTime;
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
