package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ejb.EJB;
import javax.inject.Inject;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.common.CommonUtil;
import com.dolphin.cmscore.dao.TblBoughtCourseDao;
import com.dolphin.cmscore.dto.CouponMasterDto;
import com.dolphin.cmscore.dto.CourseCouponDto;
import com.dolphin.cmscore.dto.TblBoughtCourseDto;
import com.dolphin.cmscore.dto.TblCourseDto;
import com.dolphin.cmscore.entity.TblBoughtCourse;
import com.dolphin.cmscore.entity.TblCourse;

public class BoughtCourseLogic implements Serializable {

	private static final long serialVersionUID = 8184603464085066704L;
	
	@EJB
	private TblBoughtCourseDao tblBoughtCourseDao;	
	

	public List<TblCourseDto> getListCourseByUserId(Long userId, int page) {
		List<TblCourseDto> listCourse = new ArrayList<>();		
		List<TblBoughtCourse> listBoughtCourse = tblBoughtCourseDao.getListBoughtCourseByUserId(userId, page);
		
		for (TblBoughtCourse boughtCourse : listBoughtCourse) {
			try {
				if (boughtCourse.getTblCourse() != null) {
					TblCourseDto course = new TblCourseDto();
					BeanUtils.copyProperties(course, boughtCourse.getTblCourse());
					listCourse.add(course);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return listCourse;
	}

	public HashMap<String, Object> getTotalPageSeachCourse(Long userId) {
		List<TblBoughtCourse> listBoughtCourse = tblBoughtCourseDao.getAllBoughtCourseByUserId(userId);
		return CommonUtil.getTotalRecordAndListPage(listBoughtCourse.size());
	}

	public int createBoughtCourse(TblBoughtCourseDto boughtCourse) {
		TblBoughtCourse entity = new TblBoughtCourse();
		try {
			BeanUtils.copyProperties(entity, boughtCourse);
			
			TblCourse course = new TblCourse();
			course.setCourseId(boughtCourse.getCourseId());
			entity.setTblCourse(course);
			
			tblBoughtCourseDao.create(entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return 1;
	}

	public Boolean checkBoughtCourse(Long userId, Long courseId) {
		if (tblBoughtCourseDao.getBoughtCourseByCondition(userId, courseId).size() > 0) {
			return true;
		} else {
			return false;
		}
	}

}
