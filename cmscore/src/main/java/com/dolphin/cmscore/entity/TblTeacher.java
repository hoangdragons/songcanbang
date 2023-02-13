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


/**
 * The persistent class for the tbl_teacher database table.
 * 
 */
@Entity
@Table(name="tbl_teacher")
@NamedQuery(name="TblTeacher.findAll", query="SELECT t FROM TblTeacher t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class TblTeacher extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "teacher_id_seq")
	@SequenceGenerator(name = "teacher_id_seq", sequenceName = "teacher_id_seq", allocationSize= 1)
	@Column(name="TEACHER_ID")
	private Long teacherId;

	@Column(name="TEACHER_COMPANY")
	private String teacherCompany;

	@Column(name="TEACHER_CONTENT")
	private String teacherContent;

	@Column(name="TEACHER_IMAGE")
	private String teacherImage;

	@Column(name="TEACHER_NAME")
	private String teacherName;
	
	@Column(name="PHONE")
	private Integer phone;
	
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="LOGIN_NAME")
	private String loginName;
	
	@Column(name="LOGIN_ID")
	private Long loginId;

	public TblTeacher() {
	}

	public Long getTeacherId() {
		return this.teacherId;
	}


	public void setTeacherId(Long teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherCompany() {
		return this.teacherCompany;
	}

	public void setTeacherCompany(String teacherCompany) {
		this.teacherCompany = teacherCompany;
	}

	public String getTeacherContent() {
		return this.teacherContent;
	}

	public void setTeacherContent(String teacherContent) {
		this.teacherContent = teacherContent;
	}

	public String getTeacherImage() {
		return this.teacherImage;
	}

	public void setTeacherImage(String teacherImage) {
		this.teacherImage = teacherImage;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	
	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public Long getLoginId() {
		return loginId;
	}

	public void setLoginId(Long loginId) {
		this.loginId = loginId;
	}
}