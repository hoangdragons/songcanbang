package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblCourseQuestionDao;
import com.dolphin.cmscore.dto.TblCourseQuestionDto;
import com.dolphin.cmscore.entity.TblCourseQuestion;

public class CourseQuestionLogic implements Serializable {
	
	@EJB
	private TblCourseQuestionDao courseQuestionDao;

	private static final long serialVersionUID = 7966925385625967262L;

	public int createCourseQuestion(TblCourseQuestionDto question) {
		TblCourseQuestion entity = new TblCourseQuestion();
		try {
			BeanUtils.copyProperties(entity, question);
			entity.setQuestionDate(new Date());
			courseQuestionDao.create(entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return 1;
	}


	public int update(TblCourseQuestionDto question) {
		TblCourseQuestion entity = new TblCourseQuestion();
		try {
			BeanUtils.copyProperties(entity, question);
			entity.setAnswerDate(new Date());
			courseQuestionDao.edit(entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return 1;
	}

	
	public List<TblCourseQuestionDto> getListQuestionByCourseId(Long courseId) {
		List<TblCourseQuestionDto> listDto = new ArrayList<>();
		List<TblCourseQuestion> listQuestion = courseQuestionDao.getListQuestionByCourseId(courseId);
		
		for (TblCourseQuestion question : listQuestion) {
			try {
				TblCourseQuestionDto dto = new TblCourseQuestionDto();
				BeanUtils.copyProperties(dto, question);
				listDto.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return listDto;
	}
	
	/**
	 * Find all question by course id (not filter by answer)
	 * @param courseId
	 * @return
	 */
	public List<TblCourseQuestionDto> findByCourse(Long courseId) {
		List<TblCourseQuestionDto> listDto = new ArrayList<>();
		List<TblCourseQuestion> listQuestion = courseQuestionDao.findByCourse(courseId);
		
		for (TblCourseQuestion question : listQuestion) {
			try {
				TblCourseQuestionDto dto = new TblCourseQuestionDto();
				BeanUtils.copyProperties(dto, question);
				listDto.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return listDto;
	}

}
