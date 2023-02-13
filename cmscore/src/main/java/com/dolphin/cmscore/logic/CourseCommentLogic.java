package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblCourseCommentDao;
import com.dolphin.cmscore.dto.TblCourseCommentDto;
import com.dolphin.cmscore.dto.TblCourseSubCommentDto;
import com.dolphin.cmscore.entity.TblCourseComment;
import com.dolphin.cmscore.entity.TblCourseSubComment;

public class CourseCommentLogic implements Serializable {
	
	@EJB
	private TblCourseCommentDao tblCourseCommentDao;

	private static final long serialVersionUID = -6345287003881082845L;

	public int createCourseComment(TblCourseCommentDto comment) {
		TblCourseComment entity = new TblCourseComment();
		try {
			BeanUtils.copyProperties(entity, comment);
			entity.setCommentDate(new Date());
			tblCourseCommentDao.create(entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return 1;
	}

	public List<TblCourseCommentDto> getListCommentByCourseId(Long courseId) {
		List<TblCourseCommentDto> listDto = new ArrayList<>();
		List<TblCourseComment> listComment = tblCourseCommentDao.getListCommentByCourseId(courseId);
		
		for (TblCourseComment comment : listComment) {
			try {
				TblCourseCommentDto dto = new TblCourseCommentDto();
				BeanUtils.copyProperties(dto, comment);
				List<TblCourseSubCommentDto> lsSubCommentDto = new ArrayList<>();
				for (TblCourseSubComment subComment : comment.getTblCourseSubComments()) {
					TblCourseSubCommentDto subDto = new TblCourseSubCommentDto();
					BeanUtils.copyProperties(subDto, subComment);
					lsSubCommentDto.add(subDto);
				}
				dto.setTblCourseSubComments(lsSubCommentDto);
				listDto.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return listDto;
	}

}
