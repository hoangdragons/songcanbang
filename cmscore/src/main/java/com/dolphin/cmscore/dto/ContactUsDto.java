package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.entity.BaseEntity;

public class ContactUsDto extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = -8280037235541308439L;
	
	private Long contactUsId;
	
	private String contactName;
	
	private String contactEmail;
	
	private String contactMessage;
	
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactMessage() {
		return contactMessage;
	}
	public void setContactMessage(String contactMessage) {
		this.contactMessage = contactMessage;
	}
	public Long getContactUsId() {
		return contactUsId;
	}
	public void setContactUsId(Long contactUsId) {
		this.contactUsId = contactUsId;
	}
}
