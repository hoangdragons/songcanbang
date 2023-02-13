package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_course database table.
 * 
 */
@Entity
@Table(name="tbl_course")
@NamedQueries({
	@NamedQuery(name="TblCourse.findAll", query="SELECT t FROM TblCourse t WHERE t.deleteFlg <> 1 AND t.helperCourse <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblCourse.findAllHelper", query="SELECT t FROM TblCourse t WHERE t.deleteFlg <> 1 AND t.helperCourse = 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblCourse.search", 
		query = "SELECT t FROM TblCourse t WHERE t.content LIKE :keyword"
				+ " OR t.title LIKE :keyword OR t.videoUrl LIKE :keyword AND t.deleteFlg <> 1 AND t.helperCourse <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblCourse.findByCategoryId", 
		query = "SELECT t FROM TblCourse t JOIN FETCH t.tblCategory WHERE t.tblCategory.categoryId = :categoryId AND t.deleteFlg <> 1 AND t.helperCourse <> 1 ORDER BY t.displayOrder"),
})
//@SqlResultSetMapping(
//        name = "CourseTeacherResultMapping",
//        entities = {
//            @EntityResult(
//                    entityClass = TblCourse.class,
//                    fields = {
//                        @FieldResult(name = "content", column = "content"),
//                        @FieldResult(name = "title", column = "title"),
//                        @FieldResult(name = "category_id", column = "category_id"),
//                        @FieldResult(name = "course_id", column = "course_id")}),
//            @EntityResult(
//                    entityClass = TblTeacher.class,
//                    fields = {
//                        @FieldResult(name = "teacher_id", column = "teacher_id"),
//                        @FieldResult(name = "teacher_name", column = "teacher_name"),
//                        @FieldResult(name = "teacher_content", column = "teacher_content")
//                        })
//        }
//)

/*
 select t1.course_id, t1.category_id, t1.content, t1.title, 
 t3.teacher_id, t3.teacher_name, t3.teacher_content 
 from tbl_course t1 inner join course_teacher t2 on t1.course_id = t2.course_id
 inner join tbl_teacher t3 on t2.teacher_id = t3.teacher_id
 **/
//@SqlResultSetMapping(
//        name = "FullCourseInfoMapping",
//        classes = @ConstructorResult(
//                targetClass = MappingCourseInfo.class,
//                columns = {
//                    @ColumnResult(name = "id", type = Long.class),
//                    @ColumnResult(name = "title"),
//                    @ColumnResult(name = "version", type = Long.class),
//                    @ColumnResult(name = "authorName")}))
public class TblCourse extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "course_id_seq")
	@SequenceGenerator(name = "course_id_seq", sequenceName = "course_id_seq", allocationSize= 1)
	@Column(name="COURSE_ID")
	private Long courseId;
	
	private String content;
	
	@Column(name="CONTENT_SUMMARY")
	private String contentSummary;

	@Column(name="IMAGE_URL")
	private String imageUrl;

	private double price;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="PUSLISH_DATE")
	private Date puslishDate;

	private double rating;

	private String title;

	@Column(name="TOTAL_VIEW")
	private int totalView;

	@Column(name="VIDEO_URL")
	private String videoUrl;
	
	@Column(name = "display_order")  
    private Integer displayOrder;
	
	@Size(min = 3, max = 45, message = "{mail}: {validation.message.user.email.size}")
	@Column(name="CURRENCY")
	private String currency;
	
	@Column(name="HELPER_COURSE")
	private Integer helperCourse;
	
	public Integer getHelperCourse() {
		return helperCourse;
	}

	public void setHelperCourse(Integer helperCourse) {
		this.helperCourse = helperCourse;
	}

	//bi-directional many-to-one association to TblCategory
	@ManyToOne
	@JoinColumn(name="CATEGORY_ID", referencedColumnName="CATEGORY_ID")
	private TblCategory tblCategory;
	
	@OneToMany(mappedBy="tblCourse")
	private List<TblBoughtCourse> tblBoughtCourses;
	
	public TblCourse() {
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

	public TblCategory getTblCategory() {
		return this.tblCategory;
	}

	public void setTblCategory(TblCategory tblCategory) {
		this.tblCategory = tblCategory;
	}

	public List<TblBoughtCourse> getTblBoughtCourses() {
		return tblBoughtCourses;
	}

	public void setTblBoughtCourses(List<TblBoughtCourse> tblBoughtCourses) {
		this.tblBoughtCourses = tblBoughtCourses;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getContentSummary() {
		return contentSummary;
	}

	public void setContentSummary(String contentSummary) {
		this.contentSummary = contentSummary;
	}
}