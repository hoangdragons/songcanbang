package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_course_comment database table.
 * 
 */
@Entity
@Table(name="tbl_course_comment")
@NamedQuery(name="TblCourseComment.findAll", query="SELECT t FROM TblCourseComment t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class TblCourseComment extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "comment_id_seq")
	@SequenceGenerator(name = "comment_id_seq", sequenceName = "comment_id_seq", allocationSize= 1)
	@Column(name="COMMENT_ID")
	private Long commentId;
	
	@Column(name="COURSE_ID")
	private Long courseId;

	@Column(name="AVATAR_URL")
	private String avatarUrl;

	@Lob
	@Column(name="COMMENT")
	private String comment;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="COMMENT_DATE")
	private Date commentDate;

	@Column(name="USER_FULL_NAME")
	private String userFullName;
	
	@OneToMany(mappedBy="tblCourseComment")
	private List<TblCourseSubComment> tblCourseSubComments;

	public TblCourseComment() {
	}

	public Long getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
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

	public String getUserFullName() {
		return this.userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	public List<TblCourseSubComment> getTblCourseSubComments() {
		return tblCourseSubComments;
	}

	public void setTblCourseSubComments(List<TblCourseSubComment> tblCourseSubComments) {
		this.tblCourseSubComments = tblCourseSubComments;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
}