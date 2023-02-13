package com.dolphin.idm.event;

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * managed user event 
 * 
 * @author dovietanh
 *
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class UserEvent implements Serializable {
	private static final long serialVersionUID = 9066461618538555690L;
	
	private Long userId;
	private Date birthday;
	private String email;
	private String fullName;
	private String fullNameKana;
	private String loginName;
	private String password;
	private String telephone;
	private String langCd;
	private String tanRoleCd;
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getFullNameKana() {
		return fullNameKana;
	}
	public void setFullNameKana(String fullNameKana) {
		this.fullNameKana = fullNameKana;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getLangCd() {
		return langCd;
	}
	public void setLangCd(String langCd) {
		this.langCd = langCd;
	}
	public String getTanRoleCd() {
		return tanRoleCd;
	}
	public void setTanRoleCd(String tanRoleCd) {
		this.tanRoleCd = tanRoleCd;
	}
}
