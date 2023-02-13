package com.dolphin.persistence.entity;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.dolphin.persistence.entity.BaseEntity;

@Entity
@Table(name="audit")
@NamedQuery(name="Audit.findAll", query="SELECT t FROM Audit t WHERE t.deleteFlg <> 1")
public class Audit  extends BaseEntity implements Serializable {	
	private static final long serialVersionUID = -5966964460677315750L;
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "audit_id_seq")
	@SequenceGenerator(name = "audit_id_seq", sequenceName = "audit_id_seq", allocationSize= 1)
	@Column(name="AUDIT_ID")
	private Long auditId;
	
	@Column(name="LOGIN_ID")
	private Long loginId;
	
	@Column(name="LOGIN_NAME")
	private String loginName;
	
	private String email;
	
	@Column(name="CLIENT_IP")
	private String clientIp;
	
	@Column(name="SERVICE_CLAZZ")
	private String serviceClazz;
	
	@Column(name="SERVICE_METHOD")
	private String serviceMethod;
	
	@Column(name="ACCESS_TIME")
	@Temporal(TemporalType.TIMESTAMP) 
	private Date accessTime;

	public Long getAuditId() {
		return auditId;
	}

	public void setAuditId(Long auditId) {
		this.auditId = auditId;
	}

	public Long getLoginId() {
		return loginId;
	}

	public void setLoginId(Long loginId) {
		this.loginId = loginId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getServiceClazz() {
		return serviceClazz;
	}

	public void setServiceClazz(String serviceClazz) {
		this.serviceClazz = serviceClazz;
	}

	public String getServiceMethod() {
		return serviceMethod;
	}

	public void setServiceMethod(String serviceMethod) {
		this.serviceMethod = serviceMethod;
	}

	public Date getAccessTime() {
		return accessTime;
	}

	public void setAccessTime(Date accessTime) {
		this.accessTime = accessTime;
	}
	
	
}
