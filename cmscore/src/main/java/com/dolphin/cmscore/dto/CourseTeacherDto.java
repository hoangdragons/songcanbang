package com.dolphin.cmscore.dto;

import java.io.Serializable;


public class CourseTeacherDto implements Serializable{
	private static final long serialVersionUID = 3939940245882372411L;
	private Long id;
	
	private Long teacherId;

	private Long courseId;

	
	@Override
	public String toString() {
		return "{"+id+","+teacherId + ","+courseId+"}";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Long teacherId) {
		this.teacherId = teacherId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
}
