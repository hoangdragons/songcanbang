package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;

public class TblTeacherDto  extends BaseDto implements Serializable {
	private static final long serialVersionUID = -6935574927151709670L;
	private Long teacherId;
	private String teacherCompany;
	private String teacherContent;
	private String teacherImage;
	private String teacherName;
	
	private Integer phone;
	private String email;
	private String loginName;
	
	private Boolean choosen;
	
	private Long loginId;
	
	
	@Override
	public String toString() {
		
		return "{"+teacherName + "," + teacherCompany +"}";
	}

	public Long getTeacherId() {
		return teacherId;
	}
	
	public void setTeacherId(Long teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherCompany() {
		return teacherCompany;
	}

	public void setTeacherCompany(String teacherCompany) {
		this.teacherCompany = teacherCompany;
	}

	public String getTeacherContent() {
		return teacherContent;
	}

	public void setTeacherContent(String teacherContent) {
		this.teacherContent = teacherContent;
	}

	public String getTeacherImage() {
		return teacherImage;
	}

	public void setTeacherImage(String teacherImage) {
		this.teacherImage = teacherImage;
	}

	public String getTeacherName() {
		return teacherName;
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

	public Boolean getChoosen() {
		return choosen;
	}

	public void setChoosen(Boolean choosen) {
		this.choosen = choosen;
	}

	public Long getLoginId() {
		return loginId;
	}

	public void setLoginId(Long loginId) {
		this.loginId = loginId;
	}
}
