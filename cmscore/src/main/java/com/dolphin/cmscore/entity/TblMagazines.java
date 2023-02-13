package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_magazines database table.
 * 
 */
@Entity
@Table(name="tbl_magazines")
@NamedQuery(name="TblMagazines.findAll", query="SELECT t FROM TblMagazines t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class TblMagazines extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "magazines_id_seq")
	@SequenceGenerator(name = "magazines_id_seq", sequenceName = "magazines_id_seq", allocationSize= 1)
	@Column(name="magazine_id")
	private Integer magazineId;
	
	private String image;
	
	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="publish_date")
	private Date publishDate;
	
	@Column(name="publish_by")
	private String publishBy;
	
	private String author;
	
	@Column(name="camera_man")
	private String cameraMan;
	
	private String category;
	

	@Column(name="summary_content")
	private String summaryContent;
	
	@Column(name="display_order")
	private Integer displayOrder;
	
	private String title;

	public TblMagazines() {
	}

	public Integer getMagazineId() {
		return this.magazineId;
	}

	public void setMagazineId(Integer magazineId) {
		this.magazineId = magazineId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getSummaryContent() {
		return this.summaryContent;
	}

	public void setSummaryContent(String summaryContent) {
		this.summaryContent = summaryContent;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPublishBy() {
		return publishBy;
	}

	public void setPublishBy(String publishBy) {
		this.publishBy = publishBy;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCameraMan() {
		return cameraMan;
	}

	public void setCameraMan(String cameraMan) {
		this.cameraMan = cameraMan;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}