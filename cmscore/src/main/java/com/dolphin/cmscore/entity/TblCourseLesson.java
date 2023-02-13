package com.dolphin.cmscore.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_course_lession database table.
 * 
 */
@Entity
@Table(name="tbl_course_lesson")
@NamedQueries({
	@NamedQuery(name="TblCourseLesson.findAll", query="SELECT t FROM TblCourseLesson t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblCourseLesson.findByChapter", 
		query="SELECT t FROM TblCourseLesson t WHERE t.tblCourseChapter.courseChapterId = :chapterId AND  t.deleteFlg <> 1 ORDER BY t.displayOrder")
})

public class TblCourseLesson extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "course_lesson_id_seq")
	@SequenceGenerator(name = "course_lesson_id_seq", sequenceName = "course_lesson_id_seq", allocationSize= 1)
	@Column(name="COURSE_LESSON_ID")
	private Long courseLessonId;

	@ManyToOne
	@JoinColumn(name="COURSE_CHAPTER_ID", referencedColumnName="COURSE_CHAPTER_ID")
	private TblCourseChapter tblCourseChapter;
	
	@Column(name="LESSION_NAME")
	private String lessionName;

	@Column(name="`ORDER`")
	private int order;

	@Column(name="VIDEO_URL")
	private String videoUrl;
	
	@Column(name="LESSON_DESC")
	private String lessonDesc;
	
	public TblCourseLesson() {
	}

	public Long getCourseLessonId() {
		return this.courseLessonId;
	}

	public void setCourseLessonId(Long courseLessonId) {
		this.courseLessonId = courseLessonId;
	}

	public TblCourseChapter getTblCourseChapter() {
		return tblCourseChapter;
	}

	public void setTblCourseChapter(TblCourseChapter tblCourseChapter) {
		this.tblCourseChapter = tblCourseChapter;
	}

	public String getLessionName() {
		return this.lessionName;
	}

	public void setLessionName(String lessionName) {
		this.lessionName = lessionName;
	}

	public int getOrder() {
		return this.order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getVideoUrl() {
		return this.videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public String getLessonDesc() {
		return lessonDesc;
	}

	public void setLessonDesc(String lessonDesc) {
		this.lessonDesc = lessonDesc;
	}

}