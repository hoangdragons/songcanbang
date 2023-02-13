package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_course_chapter database table.
 * 
 */
@Entity
@Table(name="tbl_course_chapter")
@NamedQuery(name="TblCourseChapter.findAll", query="SELECT t FROM TblCourseChapter t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class TblCourseChapter extends BaseEntity implements Serializable {	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "course_chapter_id_seq")
	@SequenceGenerator(name = "course_chapter_id_seq", sequenceName = "course_chapter_id_seq", allocationSize= 1)
	@Column(name="COURSE_CHAPTER_ID")
	private Long courseChapterId;

	@Column(name="CHAPTER_NAME")
	private String chapterName;
	
	@Column(name="COURSE_ID")
	private Long courseId;

	@Column(name="`ORDER`")
	private int order;
	
	@OneToMany(mappedBy="tblCourseChapter")
	private List<TblCourseLesson> tblCourseLessons;

	public TblCourseChapter() {
	}

	public Long getCourseChapterId() {
		return this.courseChapterId;
	}

	public void setCourseChapterId(Long courseChapterId) {
		this.courseChapterId = courseChapterId;
	}

	public String getChapterName() {
		return this.chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public int getOrder() {
		return this.order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public List<TblCourseLesson> getTblCourseLessons() {
		return tblCourseLessons;
	}

	public void setTblCourseLessons(List<TblCourseLesson> tblCourseLessons) {
		this.tblCourseLessons = tblCourseLessons;
	}


}