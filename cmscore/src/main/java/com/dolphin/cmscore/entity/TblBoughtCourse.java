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
 * The persistent class for the tbl_bought_course database table.
 * 
 */
@Entity
@Table(name="tbl_bought_course")
@NamedQueries({
	@NamedQuery(name="TblBoughtCourse.findAll", query="SELECT t FROM TblBoughtCourse t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblBoughtCourse.getBoughtCourseByUserId", query="SELECT t FROM TblBoughtCourse t "
			+ " JOIN FETCH t.tblCourse t2 WHERE t.userId = :userId AND t.deleteFlg <> 1  ORDER BY t.displayOrder")
})
public class TblBoughtCourse extends BaseEntity implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "bought_course_id_seq")
	@SequenceGenerator(name = "bought_course_id_seq", sequenceName = "bought_course_id_seq", allocationSize= 1)
	private Long id;

	/*@Column(name="COURSE_ID")
	private Long courseId;*/

	@Column(name="USER_ID")
	private Long userId;
	
	@ManyToOne
	@JoinColumn(name="COURSE_ID", referencedColumnName="COURSE_ID")
	private TblCourse tblCourse;

	public TblBoughtCourse() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/*public Long getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}*/

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public TblCourse getTblCourse() {
		return tblCourse;
	}

	public void setTblCourse(TblCourse tblCourse) {
		this.tblCourse = tblCourse;
	}

}