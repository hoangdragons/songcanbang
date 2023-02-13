package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.dolphin.persistence.dto.BaseDto;

public class TblCourseChapterDto extends BaseDto implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long courseChapterId;
	private String chapterName;
	private int order;
	
	private Long courseId;
	private List<TblCourseLessonDto> lessons;
	
	private Double totalVideoDuration;
	
	List<Long> deleteLessonIdList = new ArrayList<Long>();
	
	private Long lessonCount;
	
	
	public Double getTotalVideoDuration() {
		return totalVideoDuration;
	}

	public void setTotalVideoDuration(Double totalVideoDuration) {
		this.totalVideoDuration = totalVideoDuration;
	}

	public Long getLessonCount() {
		return lessonCount;
	}

	public void setLessonCount(Long lessonCount) {
		this.lessonCount = lessonCount;
	}

	public List<Long> getDeleteLessonIdList() {
		return deleteLessonIdList;
	}

	public void setDeleteLessonIdList(List<Long> deleteLessonIdList) {
		this.deleteLessonIdList = deleteLessonIdList;
	}

	public Long getCourseChapterId() {
		return courseChapterId;
	}

	public void setCourseChapterId(Long courseChapterId) {
		this.courseChapterId = courseChapterId;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public List<TblCourseLessonDto> getLessons() {
		return lessons;
	}

	public void setLessons(List<TblCourseLessonDto> lessons) {
		this.lessons = lessons;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
	
	
}
