package com.dolphin.cmscore.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;

@Entity
@Table(name="course_teacher")
@NamedQueries({
	@NamedQuery(name="CourseTeacher.findAll", query="SELECT t FROM CourseTeacher t"),
	@NamedQuery(name="CourseTeacher.findByCourse", query="SELECT t FROM CourseTeacher t WHERE t.courseId = :courseId"),
	@NamedQuery(name="CourseTeacher.findByTeacher", query="SELECT t FROM CourseTeacher t WHERE t.teacherId = :teacherId"),
	@NamedQuery(name="CourseTeacher.deleteByCourse", query="DELETE FROM CourseTeacher t WHERE t.courseId = :courseId"),
	@NamedQuery(name="CourseTeacher.deleteByTeacher", query="DELETE FROM CourseTeacher t WHERE t.teacherId = :teacherId")
})
public class CourseTeacher  extends BaseEntity implements Serializable{
	private static final long serialVersionUID = 3939940245882372411L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "course_teacher_id_seq")
	@SequenceGenerator(name = "course_teacher_id_seq", sequenceName = "course_teacher_id_seq", allocationSize= 1)
	@Column(name="ID")
	private Long id;
	
	@Column(name="TEACHER_ID")
	private Long teacherId;
	
	@Column(name="COURSE_ID")
	private Long courseId;

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
