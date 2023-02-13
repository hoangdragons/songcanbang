package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_course_sub_comment database table.
 * 
 */
@Entity
@Table(name="tbl_course_sub_comment")
@NamedQuery(name="TblCourseSubComment.findAll", query="SELECT t FROM TblCourseSubComment t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class TblCourseSubComment extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "sub_comment_id_seq")
	@SequenceGenerator(name = "sub_comment_id_seq", sequenceName = "sub_comment_id_seq", allocationSize= 1)
	@Column(name="SUB_COMMENT_ID")
	private Long subCommentId;

	@Column(name="AVATAR_URL")
	private String avatarUrl;

	@Lob
	@Column(name="COMMENT")
	private String comment;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="COMMENT_DATE")
	private Date commentDate;

	@ManyToOne
	@JoinColumn(name="COMMENT_ID", referencedColumnName="COMMENT_ID")
	private TblCourseComment tblCourseComment;

	@Column(name="USER_FULL_NAME")
	private String userFullName;

	public TblCourseSubComment() {
	}

	public Long getSubCommentId() {
		return this.subCommentId;
	}

	public void setSubCommentId(Long subCommentId) {
		this.subCommentId = subCommentId;
	}

	public String getAvatarUrl() {
		return this.avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCommentDate() {
		return this.commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public TblCourseComment getTblCourseComment() {
		return tblCourseComment;
	}

	public void setTblCourseComment(TblCourseComment tblCourseComment) {
		this.tblCourseComment = tblCourseComment;
	}

	public String getUserFullName() {
		return this.userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

}