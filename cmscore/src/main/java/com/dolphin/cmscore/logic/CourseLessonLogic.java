package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblCourseLessonDao;
import com.dolphin.cmscore.dao.TblMaterialUploadDao;
import com.dolphin.cmscore.dao.TblMaterialUploadDao.RESOURCE_TYPE;
import com.dolphin.cmscore.dto.TblCourseChapterDto;
import com.dolphin.cmscore.dto.TblCourseLessonDto;
import com.dolphin.cmscore.dto.TblMaterialUploadDto;
import com.dolphin.cmscore.entity.TblCourseChapter;
import com.dolphin.cmscore.entity.TblCourseLesson;
import com.dolphin.cmscore.entity.TblMaterialUpload;

public class CourseLessonLogic implements Serializable{
	
	@EJB
	private TblCourseLessonDao tblCourseLessonDao;
	
	@EJB
	private TblMaterialUploadDao tblMaterialUploadDao;
	
	private static final long serialVersionUID = -5574647086255462617L;

	public TblCourseLessonDto getCourseLessonById(Long lessonId) {
		TblCourseLesson lession = tblCourseLessonDao.get(lessonId);
		
//		List<TblMaterialUploadDto> lsMaterialDto = new ArrayList<>();
//		List<TblMaterialUpload> entList =  tblMaterialUploadDao.findLessonResource(lession.getCourseLessonId(), RESOURCE_TYPE.LESSON_VIDEO);
//		for (TblMaterialUpload material : entList) {
//			lsMaterialDto.add((TblMaterialUploadDto) tblMaterialUploadDao.convertEntity2Dto(material, TblMaterialUploadDto.class));
//		}
		
		TblCourseLessonDto lessionDto = new TblCourseLessonDto();
		try {
			BeanUtils.copyProperties(lessionDto, lession);
			
//			lessionDto.setMaterials(lsMaterialDto);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return lessionDto;
	}
	
	public List<TblCourseLessonDto> findAll(){
		return createDtoList(tblCourseLessonDao.findAll());
	}
	
	public TblCourseLessonDto get(Long id){
		return (TblCourseLessonDto)tblCourseLessonDao.convertEntity2Dto(tblCourseLessonDao.get(id), TblCourseLessonDto.class);
	}
	
	@Transactional(value=TxType.REQUIRED, rollbackOn=Throwable.class)
	public TblCourseLessonDto create(TblCourseChapterDto chapter, TblCourseLessonDto entity){
		TblCourseLesson ent = new TblCourseLesson();
		try {
			BeanUtils.copyProperties(ent, entity);
			
			TblCourseChapter chapterEnt = new TblCourseChapter();
			BeanUtils.copyProperties(chapterEnt, chapter);
			ent.setTblCourseChapter(chapterEnt);
			
			ent = tblCourseLessonDao.create(ent);
			BeanUtils.copyProperties(entity, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return entity;
	}

	public TblCourseLessonDto update(TblCourseChapterDto chapter, TblCourseLessonDto entity){
		TblCourseLesson dbEnt = tblCourseLessonDao.get(entity.getCourseLessonId());
		try {
			BeanUtils.copyProperties(dbEnt, entity);
			
			TblCourseChapter chapterEnt = new TblCourseChapter();
			BeanUtils.copyProperties(chapterEnt, chapter);
			dbEnt.setTblCourseChapter(chapterEnt);
			
			dbEnt = tblCourseLessonDao.edit(dbEnt);
			BeanUtils.copyProperties(entity, dbEnt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return entity;
	}
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblCourseLessonDto push(TblCourseChapterDto chapter, TblCourseLessonDto entity){
		if(entity.getCourseLessonId() != null){
			entity = update(chapter, entity);
		}else{
			entity = create(chapter, entity);
		}
		return entity;
	}
	
	public void remove(TblCourseLessonDto entity){
		TblCourseLesson dbEnt = new TblCourseLesson();
		try {
			BeanUtils.copyProperties(dbEnt, entity);
			tblCourseLessonDao.remove(dbEnt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void remove(Long id){
		TblCourseLesson dbEnt = tblCourseLessonDao.get(id);
		tblCourseLessonDao.remove(dbEnt);
	}
	
	public List<TblCourseLessonDto> findByChapter(Long chapterId) {
		List<TblCourseLessonDto> ret = new ArrayList<TblCourseLessonDto>();
		List<TblCourseLesson> entities = tblCourseLessonDao.findByChapter(chapterId);
		for(TblCourseLesson ent:entities){
			TblCourseLessonDto dto = (TblCourseLessonDto)tblCourseLessonDao.convertEntity2Dto(ent, TblCourseLessonDto.class);
			if(dto != null){
				ret.add(dto);
			}
		}
		return ret;
	}
	
	private List<TblCourseLessonDto> createDtoList(List<TblCourseLesson> entList){
		List<TblCourseLessonDto> dtoList = new ArrayList<TblCourseLessonDto>();
		for(TblCourseLesson c: entList){
			TblCourseLessonDto dto = new TblCourseLessonDto();
			try {
				BeanUtils.copyProperties(dto, c);
				dtoList.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return dtoList;
	}
	

}
