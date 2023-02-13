package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;

import com.dolphin.persistence.dto.BaseDto;
import com.fasterxml.jackson.annotation.JsonFormat;

public class TblMagazinesDto extends BaseDto implements Serializable {

	private static final long serialVersionUID = 5844828611223192264L;
	
	private Integer magazineId;
	private String content;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy", timezone="CET")
	private Date publishDate;
	
	private String summaryContent;
	private Integer displayOrder;
	private String title;
	private String image;
	
	private String publishBy;	
	private String author;	
	private String cameraMan;	
	private String category;
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public Integer getMagazineId() {
		return magazineId;
	}

	public void setMagazineId(Integer magazineId) {
		this.magazineId = magazineId;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getSummaryContent() {
		return summaryContent;
	}

	public void setSummaryContent(String summaryContent) {
		this.summaryContent = summaryContent;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
