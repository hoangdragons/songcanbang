package com.dolphin.cmscore.dto;

import java.io.Serializable;
import java.util.Date;

import com.dolphin.persistence.dto.BaseDto;
import com.fasterxml.jackson.annotation.JsonFormat;

public class TblCourseQuestionDto extends BaseDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7798109877514798090L;
	private Long questionId;
	private String answer;
	private Long courseId;
	private String question;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy hh:mm:ss", timezone="CET")
	private Date questionDate;
	
	private Long userId;
	private String description;
	
	private String userAvataUrl;	
	private String userName;
	
	/*Teacher (answer man) info */
	private Long answerUserId;
	private String answerUserAvataUrl;
	private String answerUserName;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy hh:mm:ss", timezone="CET")
	private Date answerDate;
	
	public Long getQuestionId() {
		return questionId;
	}
	
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
//	public String getQuestionDateStr() {
//		if (questionDate != null) {
//			return CommonUtil.getStringFromDate(questionDate);
//		}
//		return "";
//	}

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
