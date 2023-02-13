package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblCourseSubCommentDao;
import com.dolphin.cmscore.dto.TblCourseSubCommentDto;
import com.dolphin.cmscore.entity.TblCourseComment;
import com.dolphin.cmscore.entity.TblCourseSubComment;

public class CourseSubCommentLogic implements Serializable {

	private static final long serialVersionUID = -3712185011819264047L;
	
	@EJB
	private TblCourseSubCommentDao tblCourseSubCommentDao;

	public int createCourseSubComment(TblCourseSubCommentDto subComment) {
		TblCourseSubComment entity = new TblCourseSubComment();
		try {
			BeanUtils.copyProperties(entity, subComment);
			TblCourseComment comment = new TblCourseComment();
			comment.setCommentId(subComment.getCommentId());
			entity.setTblCourseComment(comment);
			entity.setCommentDate(new Date());
			tblCourseSubCommentDao.create(entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return 1;
	}

}
