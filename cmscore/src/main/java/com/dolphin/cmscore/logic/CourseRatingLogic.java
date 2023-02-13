package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblCourseRatingDao;
import com.dolphin.cmscore.dto.TblCourseRatingDto;
import com.dolphin.cmscore.entity.TblCourseRating;

public class CourseRatingLogic implements Serializable{
	
	private static final long serialVersionUID = -4694722308441974240L;
	
	@EJB
	private TblCourseRatingDao tblCourseRatingDao;

	public TblCourseRatingDto createCourseRating(TblCourseRatingDto ratingDto) {
		TblCourseRating entity = new TblCourseRating();
		try {
			BeanUtils.copyProperties(entity, ratingDto);
			entity.setRatingTime(new Date());
			entity = tblCourseRatingDao.create(entity);
			BeanUtils.copyProperties(ratingDto, entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return ratingDto;
	}
	
	public TblCourseRatingDto updateUserRating(TblCourseRatingDto ratingDto) {
		TblCourseRating entity = new TblCourseRating();
		try {
			BeanUtils.copyProperties(entity, ratingDto);
			entity.setRatingTime(new Date());
			entity = tblCourseRatingDao.edit(entity);
			BeanUtils.copyProperties(ratingDto, entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return ratingDto;
	}
	
	public TblCourseRatingDto getUserRating(Long userId, Long courseId){
		TblCourseRatingDto ratingDto = new TblCourseRatingDto();
		TblCourseRating entity = tblCourseRatingDao.getUserRating(userId, courseId);
		if(entity == null) 
			return ratingDto;
		try {
			BeanUtils.copyProperties(ratingDto, entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return ratingDto;
	}

	public List<TblCourseRatingDto> getListRatingByCourseId(Long courseId) {
		List<TblCourseRatingDto> listDto = new ArrayList<>();
		List<TblCourseRating> listRating = tblCourseRatingDao.getListRatingByCourseId(courseId);
		
		for (TblCourseRating ratingDto : listRating) {
			try {
				TblCourseRatingDto dto = new TblCourseRatingDto();
				BeanUtils.copyProperties(dto, ratingDto);
				listDto.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return listDto;
	}
	
	public Long countRatingByCourseId(Long courseId) {
		return  tblCourseRatingDao.countRatingByCourseId(courseId);
	}

}
