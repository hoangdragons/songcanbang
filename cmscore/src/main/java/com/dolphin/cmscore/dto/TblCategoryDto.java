package com.dolphin.cmscore.dto;

import java.io.Serializable;

import com.dolphin.persistence.dto.BaseDto;


/**
 * The Dto class for the tbl_category database table.
 * 
 */
public class TblCategoryDto extends BaseDto implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long categoryId;
	
	private String categoryName;

	private String description;
	
	private String image;

	private Long courseCount;

	public TblCategoryDto() {
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Long getCourseCount() {
		return courseCount;
	}

	public void setCourseCount(Long courseCount) {
		this.courseCount = courseCount;
	}
	
	

}