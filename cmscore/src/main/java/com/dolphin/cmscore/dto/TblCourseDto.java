package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dolphin.persistence.dto.BaseDto;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


/**
 * The Dto class for the tbl_course database table.
 * 
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class TblCourseDto extends BaseDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private String content;
	
	private String contentSummary;

	private Long courseId;

	private String imageUrl;

	private double price;
	
	private double discountPrice;

	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy", timezone="CET")
	private Date puslishDate;

	private double rating;

	private String title;

	private int totalView;

	private String videoUrl;
	
	private String currency;
	
	private Long lessonCount;
	
	private Long completedMaterials;
	
	private Long totalMaterials;
	
	private Double totalVideoTime;
	
	private Integer helperCourse;
	
	private boolean helper;
	
	private Long totalRating;

	public Long getTotalRating() {
		return totalRating;
	}

	public void setTotalRating(Long totalRating) {
		this.totalRating = totalRating;
	}

	public boolean isHelper() {
		return helper;
	}

	public void setHelper(boolean helper) {
		this.helper = helper;
	}

	public Integer getHelperCourse() {
		return helperCourse;
	}

	public void setHelperCourse(Integer helperCourse) {
		this.helperCourse = helperCourse;
	}

	public Double getTotalVideoTime() {
		return totalVideoTime;
	}

	public void setTotalVideoTime(Double totalVideoTime) {
		this.totalVideoTime = totalVideoTime;
	}

	public Long getCompletedMaterials() {
		return completedMaterials;
	}

	public void setCompletedMaterials(Long completedMaterials) {
		this.completedMaterials = completedMaterials;
	}

	public Long getTotalMaterials() {
		return totalMaterials;
	}

	public void setTotalMaterials(Long totalMaterials) {
		this.totalMaterials = totalMaterials;
	}

	public Long getLessonCount() {
		return lessonCount;
	}

	public void setLessonCount(Long lessonCount) {
		this.lessonCount = lessonCount;
	}

	private TblCategoryDto tblCategoryDto;
	
	private List<TblCourseChapterDto> chapters = new ArrayList<TblCourseChapterDto>();
	
	private List<TblTeacherDto> teachers = new ArrayList<TblTeacherDto>();
	
	private List<TblCourseQuestionDto> questions = new ArrayList<TblCourseQuestionDto>();
	
	List<Long> deleteChapterIdList = new ArrayList<Long>();
	
	public List<Long> getDeleteChapterIdList() {
		return deleteChapterIdList;
	}

	public void setDeleteChapterIdList(List<Long> deleteChapterIdList) {
		this.deleteChapterIdList = deleteChapterIdList;
	}

	public TblCourseDto() {
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getImageUrl() {
		return this.imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getPuslishDate() {
		return this.puslishDate;
	}

	public void setPuslishDate(Date puslishDate) {
		this.puslishDate = puslishDate;
	}

	public double getRating() {
		return this.rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTotalView() {
		return this.totalView;
	}

	public void setTotalView(int totalView) {
		this.totalView = totalView;
	}

	public String getVideoUrl() {
		return this.videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public TblCategoryDto getTblCategoryDto() {
		return tblCategoryDto;
	}

	public void setTblCategoryDto(TblCategoryDto tblCategoryDto) {
		this.tblCategoryDto = tblCategoryDto;
	}

	public List<TblCourseChapterDto> getChapters() {
		return chapters;
	}

	public void setChapters(List<TblCourseChapterDto> chapters) {
		this.chapters = chapters;
	}

	public List<TblTeacherDto> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<TblTeacherDto> teachers) {
		this.teachers = teachers;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public List<TblCourseQuestionDto> getQuestions() {
		return questions;
	}

	public void setQuestions(List<TblCourseQuestionDto> questions) {
		this.questions = questions;
	}

	public String getContentSummary() {
		return contentSummary;
	}

	public void setContentSummary(String contentSummary) {
		this.contentSummary = contentSummary;
	}

	public double getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(double discountPrice) {
		this.discountPrice = discountPrice;
	}
	
}