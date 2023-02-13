package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblCategoryDao;
import com.dolphin.cmscore.dao.TblCourseDao;
import com.dolphin.cmscore.dto.TblCategoryDto;
import com.dolphin.cmscore.entity.TblCategory;
import com.dolphin.cmscore.entity.TblCourse;


@RequestScoped
public class CategoryLogic implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2674611298460958979L;

	@EJB
	private TblCategoryDao categoryDao;
	
	@EJB
	private TblCourseDao courseDao;
	
	/**
	 * find category
	 * 
	 * @return
	 */
	public List<TblCategoryDto> findAllCategory() {
		List<TblCategory> listEntites = categoryDao.getAllCategoryWithDisplayOrder();
		List<TblCategoryDto> listDto = new ArrayList<>();
		for(TblCategory e: listEntites){
			TblCategoryDto dto = new TblCategoryDto();
			try {
				BeanUtils.copyProperties(dto, e);
				dto.setCourseCount(new Long(e.getTblCourses().size()));
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			listDto.add(dto);
		}
		return listDto;
	}

	public TblCategoryDto getCategory(Long id){
		TblCategoryDto dto = new TblCategoryDto();
		if (id.intValue() != 0) {
			TblCategory ent = categoryDao.get(id);
			try {
				BeanUtils.copyProperties(dto, ent);
				dto.setCourseCount(new Long(ent.getTblCourses().size()));
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public TblCategoryDto createCategory(TblCategoryDto cat) {
		TblCategory ent = new TblCategory();
		try {
			BeanUtils.copyProperties(ent, cat);
			ent = categoryDao.create(ent);
			BeanUtils.copyProperties(cat, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return cat;
	}
	
	public TblCategoryDto updateCategory(TblCategoryDto cat){
		TblCategory ent = categoryDao.get(cat.getCategoryId());		
		try {
			BeanUtils.copyProperties(ent, cat);
			ent = categoryDao.edit(ent);
			BeanUtils.copyProperties(cat, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return cat;
	}
	
	public void removeCategory(TblCategoryDto cat){
		TblCategory ent = categoryDao.get(cat.getCategoryId());
		List<TblCourse> lsCourse = courseDao.getListCourseByCategory(cat.getCategoryId());
		for (TblCourse course : lsCourse) {
			courseDao.remove(course);
		}
		categoryDao.remove(ent);
	}
	
	public List<TblCategoryDto> searchCategory(String keyword) {
		List<TblCategory> entList = categoryDao.search(keyword);
		List<TblCategoryDto> dtoList = new ArrayList<>();
		for(TblCategory c: entList){
			TblCategoryDto dto = new TblCategoryDto();
			try {
				BeanUtils.copyProperties(dto, c);
				dto.setCourseCount(new Long(c.getTblCourses().size()));
				dtoList.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return dtoList;
	}
}
