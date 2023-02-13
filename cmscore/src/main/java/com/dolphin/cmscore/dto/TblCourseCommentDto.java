package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.dolphin.cmscore.common.CommonUtil;
import com.dolphin.persistence.dto.BaseDto;

public class TblCourseCommentDto extends BaseDto implements Serializable {
	
	private Long commentId;
	private Long courseId;
	private String avatarUrl;
	private String comment;
	private Date commentDate;
	private String userFullName;
	private List<TblCourseSubCommentDto> tblCourseSubComments;
	
	public Long getCommentId() {
		return commentId;
	}
	
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getUserFullName() {
		return userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	public List<TblCourseSubCommentDto> getTblCourseSubComments() {
		return tblCourseSubComments;
	}

	public void setTblCourseSubComments(List<TblCourseSubCommentDto> tblCourseSubComments) {
		this.tblCourseSubComments = tblCourseSubComments;
	}
	
	public String getCommentDateStr() {
		if (commentDate != null) {
			return CommonUtil.getStringFromDate(commentDate);
		}
		return "";
	}
}
