package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.dolphin.persistence.dto.BaseDto;

public class TblCourseLessonDto  extends BaseDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4808748369253936634L;
	private Long courseLessonId;
	private String lessionName;
	private int order;
	private String videoUrl;	
	private Long courseChapterId;
	private Double totalVideoDuration;
	
	private String lessonDesc;
	
	List<TblMaterialUploadDto> materials = new ArrayList<TblMaterialUploadDto>();
	List<Long> deleteMatIdList = new ArrayList<Long>();

	public List<Long> getDeleteMatIdList() {
		return deleteMatIdList;
	}

	public void setDeleteMatIdList(List<Long> deleteMatIdList) {
		this.deleteMatIdList = deleteMatIdList;
	}

	public Long getCourseLessonId() {
		return courseLessonId;
	}

	public void setCourseLessonId(Long courseLessonId) {
		this.courseLessonId = courseLessonId;
	}

	public String getLessionName() {
		return lessionName;
	}

	public void setLessionName(String lessionName) {
		this.lessionName = lessionName;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public Long getCourseChapterId() {
		return courseChapterId;
	}

	public void setCourseChapterId(Long courseChapterId) {
		this.courseChapterId = courseChapterId;
	}

	public List<TblMaterialUploadDto> getMaterials() {
		return materials;
	}

	public void setMaterials(List<TblMaterialUploadDto> materials) {
		this.materials = materials;
	}

	public Double getTotalVideoDuration() {
		return totalVideoDuration;
	}

	public void setTotalVideoDuration(Double totalVideoDuration) {
		this.totalVideoDuration = totalVideoDuration;
	}

	public String getLessonDesc() {
		return lessonDesc;
	}

	public void setLessonDesc(String lessonDesc) {
		this.lessonDesc = lessonDesc;
	}
	
	
}
