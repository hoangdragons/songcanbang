package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.Date;

import com.dolphin.cmscore.common.CommonUtil;
import com.dolphin.persistence.dto.BaseDto;

public class TblCourseSubCommentDto extends BaseDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5481186995063839567L;
	private Long subCommentId;
	private Long commentId;
	private String avatarUrl;
	private String comment;
	private Date commentDate;
	private String userFullName;
	
	public Long getSubCommentId() {
		return subCommentId;
	}
	
	public void setSubCommentId(Long subCommentId) {
		this.subCommentId = subCommentId;
	}

	public Long getCommentId() {
		return commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
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
	
	public String getCommentDateStr() {
		if (commentDate != null) {
			return CommonUtil.getStringFromDate(commentDate);
		}
		return "";
	}
}
