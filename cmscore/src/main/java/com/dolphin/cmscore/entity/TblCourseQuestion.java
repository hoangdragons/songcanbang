package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_course_question database table.
 * 
 */
@Entity
@Table(name="tbl_course_question")
@NamedQuery(name="TblCourseQuestion.findAll", query="SELECT t FROM TblCourseQuestion t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder")
public class TblCourseQuestion extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "question_id_seq")
	@SequenceGenerator(name = "question_id_seq", sequenceName = "question_id_seq", allocationSize= 1)
	@Column(name="QUESTION_ID")
	private Long questionId;

	@Lob
	private String answer;

	@Column(name="COURSE_ID")
	private Long courseId;

	@Lob
	private String question;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="QUESTION_DATE")
	private Date questionDate;

	@Column(name="USER_ID")
	private Long userId;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="USER_AVATA_URL")
	private String userAvataUrl;
	
	@Column(name="USER_NAME")
	private String userName;
	
	/*Teacher (answer man) info */
	// ALTER TABLE TBL_COURSE_QUESTION ADD COLUMN ANSWER_USER_ID INTEGER;
	@Column(name="ANSWER_USER_ID")
	private Long answerUserId;
	
	//ALTER TABLE TBL_COURSE_QUESTION ADD COLUMN ANSWER_USER_AVATA_URL CHARACTER VARYING(512);
	@Column(name="ANSWER_USER_AVATA_URL")
	private String answerUserAvataUrl;
	
	//ALTER TABLE TBL_COURSE_QUESTION ADD COLUMN ANSWER_USER_NAME CHARACTER VARYING(255);
	@Column(name="ANSWER_USER_NAME")
	private String answerUserName;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ANSWER_DATE")
	private Date answerDate;

	public TblCourseQuestion() {
	}

	public Long getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Long getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getQuestionDate() {
		return this.questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUserAvataUrl() {
		return userAvataUrl;
	}

	public void setUserAvataUrl(String userAvataUrl) {
		this.userAvataUrl = userAvataUrl;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getAnswerUserId() {
		return answerUserId;
	}

	public void setAnswerUserId(Long answerUserId) {
		this.answerUserId = answerUserId;
	}

	public String getAnswerUserAvataUrl() {
		return answerUserAvataUrl;
	}

	public void setAnswerUserAvataUrl(String answerUserAvataUrl) {
		this.answerUserAvataUrl = answerUserAvataUrl;
	}

	public String getAnswerUserName() {
		return answerUserName;
	}

	public void setAnswerUserName(String answerUserName) {
		this.answerUserName = answerUserName;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}
}