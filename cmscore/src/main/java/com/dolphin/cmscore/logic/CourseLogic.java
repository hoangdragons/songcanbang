package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ejb.EJB;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.common.CommonUtil;
import com.dolphin.cmscore.dao.TblCategoryDao;
import com.dolphin.cmscore.dao.TblCourseDao;
import com.dolphin.cmscore.dao.TblCourseLessonDao;
import com.dolphin.cmscore.dao.TblCourseRatingDao;
import com.dolphin.cmscore.dao.TblTeacherDao;
import com.dolphin.cmscore.dto.CouseInformationForPaymentDto;
import com.dolphin.cmscore.dto.TblCategoryDto;
import com.dolphin.cmscore.dto.TblCourseDto;
import com.dolphin.cmscore.entity.TblCategory;
import com.dolphin.cmscore.entity.TblCourse;

public class CourseLogic implements Serializable {
	
	private static final long serialVersionUID = -9057779980212060972L;
	
	@EJB
	private TblCourseDao courseDao;
	
	@EJB
	private TblCategoryDao categoryDao;
	
	@EJB
	private TblCourseLessonDao courseLessonDao;
	
	@EJB
	private TblTeacherDao tblTeacherDao;
	
	@EJB
	private TblCourseRatingDao tblCourseRatingDao;
	
	public List<TblCourseDto> findAllHelperCourse(){
		List<TblCourseDto> ret = new ArrayList<TblCourseDto>();
		List<TblCourse> listEnts = courseDao.findAllHelperCourse();
		for(TblCourse ent:listEnts){
			TblCourseDto dto = new TblCourseDto();
			try {
				BeanUtils.copyProperties(dto, ent);
				ret.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
	
	public List<TblCourseDto> getListCourseByCategory(Long categoryId) {
		return convertListEntityToDto(courseDao.getListCourse(null, categoryId, null));
	}

	public List<TblCourseDto> getListCourseByCondition(String sortType, Long categoryId) {
		return convertListEntityToDto(courseDao.getListCourseBySortType(sortType, categoryId));
	}

	public List<TblCourseDto> getListCourse(Integer page, Long categoryId, String orderBy, Integer...recordPerPage) {
		return convertListEntityToDto(courseDao.getListCourse(page, categoryId, orderBy, recordPerPage));
	}
	
	public List<TblCourseDto> getListCourseByCat(Long categoryId, String orderBy) {
		return convertListEntityToDto(courseDao.getListCourseByCat(categoryId, orderBy));
	}
	
	public List<TblCourseDto> getListCourseSearch(Integer page, String searchText, String orderBy) {
		return convertListEntityToDto(courseDao.searchCourse(searchText, page, orderBy));
	}
	
	public HashMap<String, Object> getPagingCourseSearch(String searchText) {
		List<TblCourse> lsCourse = courseDao.searchCourse(searchText, null, null);
		return CommonUtil.getTotalRecordAndListPage(lsCourse.size());
	}
	
	public HashMap<String, Object> getPagingCourseByCategoryId(Long categoryId) {
		List<TblCourseDto> lsCourse = getListCourseByCategory(categoryId);
		return CommonUtil.getTotalRecordAndListPage(lsCourse.size());
	}
	
	public CouseInformationForPaymentDto getCourseInformationForPayment(Long courseId) {
		CouseInformationForPaymentDto courseDto = new CouseInformationForPaymentDto();
		TblCourse ent = courseDao.get(courseId);
		courseDto.setTitle(ent.getTitle());
		courseDto.setPrice(ent.getPrice());
		courseDto.setTotalLesson(courseLessonDao.countLessonByCourseId(courseId));
		return courseDto;
	}
	
	private List<TblCourseDto> convertListEntityToDto(List<TblCourse> lsCourse) {
		List<TblCourseDto> lsResult = new ArrayList<>();
		for (TblCourse course : lsCourse) {
			TblCourseDto dto = new TblCourseDto();
			try {
				BeanUtils.copyProperties(dto, course);
				if (course.getTblCategory() != null) {
					TblCategoryDto cat = new TblCategoryDto();
					BeanUtils.copyProperties(cat, course.getTblCategory());
					dto.setTblCategoryDto(cat);
				}
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
			
			lsResult.add(dto);
		}
		return lsResult;
	}
	// Move from CategoryLogic
	public List<TblCourseDto> findAll(){
		return createDtoList(courseDao.findAll());
	}
	
	public TblCourseDto get(Long id){
		TblCourse ent = courseDao.get(id);
		TblCourseDto dto = new TblCourseDto();
		try {
			BeanUtils.copyProperties(dto, ent);
			//category
			TblCategoryDto cDto = new TblCategoryDto();
			BeanUtils.copyProperties(cDto, ent.getTblCategory());
			dto.setTblCategoryDto(cDto);
			//TODO Apply coupon here 
			dto.setDiscountPrice(dto.getPrice());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto; 
	}
	
	public TblCourseDto create(TblCourseDto dto){
		TblCourse ent = new TblCourse();
		try {
			BeanUtils.copyProperties(ent, dto);
			TblCategory cat = null;
			if(dto.getHelperCourse() == 1){
				cat = categoryDao.getHelperCategory();
				ent.setHelperCourse(1);
			}else{
				cat = categoryDao.get(dto.getTblCategoryDto().getCategoryId());
				ent.setHelperCourse(0);
			}
			ent.setTblCategory(cat);
			ent = courseDao.create(ent);
			BeanUtils.copyProperties(dto, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Transactional(value=TxType.REQUIRED, rollbackOn=Throwable.class)
	public TblCourseDto update(TblCourseDto entity){
		TblCourse dbEnt = courseDao.get(entity.getCourseId());
		try {
			BeanUtils.copyProperties(dbEnt, entity);
			// In case user change category
			// For some reason if categoryId is null, keep original one.
			if(entity.getTblCategoryDto() != null){
				TblCategory cat = categoryDao.get(entity.getTblCategoryDto().getCategoryId());
				dbEnt.setTblCategory(cat);
			}
			dbEnt = courseDao.edit(dbEnt);
			BeanUtils.copyProperties(entity, dbEnt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return entity;
	}
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblCourseDto push(TblCourseDto entity){
		if(entity.getCourseId() == null){
			entity = create(entity);
		}else{
			entity = update(entity);
		}
		return entity;
	}
	
	public void remove(TblCourseDto entity){
		TblCourse dbEnt = new TblCourse();
		try {
			BeanUtils.copyProperties(dbEnt, entity);
			courseDao.remove(dbEnt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	/*public List<TblCourseDto> findBySortType(String sortType) {
		return createDtoList(courseDao.getListCourseBySortType(sortType));
	}*/
	
	public List<TblCourseDto> search(String keyword) {
		return createDtoList(courseDao.searchAll(keyword));		
	}
	
	public List<TblCourseDto> searchByCategory(Long categoryId) {
		return createDtoList(courseDao.searchByCat(categoryId));
	}
	private List<TblCourseDto> createDtoList(List<TblCourse> entList){
		List<TblCourseDto> dtoList = new ArrayList<>();
		for(TblCourse c: entList){
			TblCourseDto dto = new TblCourseDto();
			try {
				BeanUtils.copyProperties(dto, c);
				TblCategoryDto cDto = new TblCategoryDto();
				BeanUtils.copyProperties(cDto, c.getTblCategory());
				dto.setTblCategoryDto(cDto);				
				dtoList.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return dtoList;
	}
	
	public List<TblCourseDto> searchTopTen() {
		List<TblCourseDto> list = createDtoList(courseDao.searchTopTen()); 
		return list;		
	}
	public Long countLessons(Long courseId){
		return courseDao.countLessons(courseId);
	}
	
	public Integer courseCountByCat(Long categoryId){
		List<TblCourse> ret = courseDao.searchByCat(categoryId);
		return ret.size();
	}
	
	/**
	 * Find courses which have owner id or teacher id the same with login id.
	 * @param loginId
	 * @return
	 */
	public List<TblCourseDto> findTeachingCourses(Long loginId) {
		List<TblCourseDto> list = createDtoList(courseDao.findTeachingCourses(loginId)); 
		return list;
	}
}
