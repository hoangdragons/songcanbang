package com.dolphin.idm.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_user database table.
 * 
 */
@Entity
@Table(name="register_user")
@NamedQueries({
	@NamedQuery(name = "RegisterUser.findAll", query = "SELECT t FROM RegisterUser t WHERE t.deleteFlg <> 1"),
	@NamedQuery(name = "RegisterUser.findByEmail", query = "SELECT t FROM RegisterUser t WHERE t.email = :email AND t.deleteFlg <> 1"),
	@NamedQuery(name = "RegisterUser.findByFacebookId", query = "SELECT t FROM RegisterUser t WHERE t.facebookId = :facebookId AND (t.password IS NULL OR t.password = '' ) AND t.deleteFlg <> 1"),
	@NamedQuery(name = "RegisterUser.findByGoogleId", query = "SELECT t FROM RegisterUser t WHERE t.googleId = :googleId AND (t.password IS NULL OR t.password = '' ) AND t.deleteFlg <> 1"),
	@NamedQuery(name = "RegisterUser.findByRegisterToken", query = "SELECT t FROM RegisterUser t WHERE t.registerToken = :registerToken "
			+ " AND t.email = :email AND t.deleteFlg <> 1"),
})
public class RegisterUser extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "user_id_seq")
	@SequenceGenerator(name = "user_id_seq", sequenceName = "user_id_seq", allocationSize= 1)
	@Column(name="USER_ID")
	private Long userId;
	
	@Temporal(TemporalType.DATE)
	@Column(name="BIRTHDAY")
	private Date birthday;

	private String email;

	@Column(name="FULL_NAME")
	private String fullName;

	@Column(name="GROUP_ID")
	private Long groupId;

	@Column(name="LANG_ID")
	private String langId;

	@Column(name="LOGIN_NAME")
	@Size(min = 1, max = 50, message = "{loginName}: {validation.message.user.loginName}")
	@NotNull(message = "{loginName}: {validation.message.required.field}")
	private String loginName;

	private String password;

	private String telephone; 
	
	@Column(name="MAIN_ADDRESS")
	private String mainAddress;
	
	@Column(name="FACEBOOK_ID")
	private String facebookId;
	
	@Column(name="GOOGLE_ID")
	private String googleId;
	
	@Column(name="TWITTER_ID")
	private String twitterId;
	
	@Column(name="CMTND")
	private Integer cmtnd;
	
	@Column(name="CCCD")
	private Integer cccd;
	
	@Column(name="MOBILE")
	private Integer mobile;
	
	@Column(name="AVATA_URL")
	private String avataUrl;
	
	@Column(name="SEX")
	private Integer sex;
	
	
	private String occupation;
	
	private String cover;
	
	@Column(name="REGISTER_TOKEN")
	private String registerToken;
	
	public RegisterUser() {
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Long getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public String getLangId() {
		return this.langId;
	}

	public void setLangId(String langId) {
		this.langId = langId;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}

	public String getFacebookId() {
		return facebookId;
	}

	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}

	public String getGoogleId() {
		return googleId;
	}

	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}

	public String getTwitterId() {
		return twitterId;
	}

	public void setTwitterId(String twitterId) {
		this.twitterId = twitterId;
	}

	public Integer getCmtnd() {
		return cmtnd;
	}

	public void setCmtnd(Integer cmtnd) {
		this.cmtnd = cmtnd;
	}

	public Integer getCccd() {
		return cccd;
	}

	public void setCccd(Integer cccd) {
		this.cccd = cccd;
	}

	public Integer getMobile() {
		return mobile;
	}

	public void setMobile(Integer mobile) {
		this.mobile = mobile;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getAvataUrl() {
		return avataUrl;
	}

	public void setAvataUrl(String avataUrl) {
		this.avataUrl = avataUrl;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getRegisterToken() {
		return registerToken;
	}

	public void setRegisterToken(String registerToken) {
		this.registerToken = registerToken;
	}
}