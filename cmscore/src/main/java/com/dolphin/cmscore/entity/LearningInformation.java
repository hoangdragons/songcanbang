package com.dolphin.cmscore.entity;

import java.io.Serializable;

import javax.enterprise.inject.Typed;
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
import com.fasterxml.jackson.annotation.JsonSubTypes.Type;

@Entity
@Table(name="learning_information")
@NamedQueries({
	@NamedQuery(name="LearningInformation.findAll", query="SELECT t FROM LearningInformation t WHERE t.deleteFlg <> 1  ORDER BY t.displayOrder"),
	@NamedQuery(name="LearningInformation.getCompletedMat", 
		query="SELECT t FROM LearningInformation t WHERE t.deleteFlg <> 1 AND t.courseId = :courseId AND t.userId = :userId AND t.materialId = :materialId  ORDER BY t.displayOrder")
})
public class LearningInformation extends BaseEntity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1545652521815156732L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "learning_information_id_seq")
	@SequenceGenerator(name = "learning_information_id_seq", sequenceName = "learning_information_id_seq", allocationSize= 1)
	@Column(name="ID")
	private Long id;
	
	@Column(name="MATERIAL_ID")
	private Long materialId;
	
	@Column(name="LESSON_ID")
	private Long lessonId;
	
	@Column(name="CHAPTER_ID")
	private Long chapterId;

	@Column(name="COURSE_ID")
	private Long courseId;
	
	@Column(name="USER_ID")
	private Long userId;

	
	@Column(name="COMPLETED")
	private Integer completed;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMaterialId() {
		return materialId;
	}

	public void setMaterialId(Long materialId) {
		this.materialId = materialId;
	}

	public Long getLessonId() {
		return lessonId;
	}

	public void setLessonId(Long lessonId) {
		this.lessonId = lessonId;
	}

	public Long getChapterId() {
		return chapterId;
	}

	public void setChapterId(Long chapterId) {
		this.chapterId = chapterId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getCompleted() {
		return completed;
	}

	public void setCompleted(Integer completed) {
		this.completed = completed;
	}
	
}
