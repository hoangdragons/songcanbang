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

@Entity
@Table(name="contact_us")
@NamedQuery(name="ContactUs.findAll", query="SELECT t FROM ContactUs t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class ContactUs extends BaseEntity implements Serializable {

	private static final long serialVersionUID = -8280037235541308439L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "contact_us_id_seq")
	@SequenceGenerator(name = "contact_us_id_seq", sequenceName = "contact_us_id_seq", allocationSize= 1)
	@Column(name="CONTACT_US_ID")
	private Long contactUsId;
	
	@Column(name="CONTACT_NAME")
	private String contactName;
	
	@Column(name="CONTACT_EMAIL")
	private String contactEmail;
	
	@Column(name="CONTACT_MESSAGE")
	private String contactMessage;
	
	public Long getContactUsId() {
		return contactUsId;
	}
	public void setContactUsId(Long contactUsId) {
		this.contactUsId = contactUsId;
	}
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
}
