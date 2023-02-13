package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblCourseChapterDao;
import com.dolphin.cmscore.dao.TblCourseLessonDao;
import com.dolphin.cmscore.dao.TblMaterialUploadDao;
import com.dolphin.cmscore.dao.TblMaterialUploadDao.RESOURCE_TYPE;
import com.dolphin.cmscore.dto.TblCourseChapterDto;
import com.dolphin.cmscore.dto.TblCourseLessonDto;
import com.dolphin.cmscore.dto.TblMaterialUploadDto;
import com.dolphin.cmscore.entity.TblCourseChapter;
import com.dolphin.cmscore.entity.TblCourseLesson;
import com.dolphin.cmscore.entity.TblMaterialUpload;

@RequestScoped
public class CourseChapterLogic implements Serializable {
	private static final long serialVersionUID = -8411979704891823521L;
	
	@EJB
	private TblCourseChapterDao tblCourseChapterDao;
	
	@EJB
	private TblCourseLessonDao tblCourseLessonDao;
	
	@EJB
	private TblMaterialUploadDao tblMaterialUploadDao;

	public List<TblCourseChapterDto> getListChapterByCourseId(Long courseId) {
		List<TblCourseChapter> listCourseChapter = tblCourseChapterDao.getListChapterByCourseId(courseId);
		List<TblCourseChapterDto> listChaperDto = new ArrayList<>();
		
		for (TblCourseChapter chapter : listCourseChapter) {
			TblCourseChapterDto chapterDto = new TblCourseChapterDto();
			List<TblCourseLessonDto> listLessionDto = new ArrayList<>();
			
			try {
				//copy chapter
				BeanUtils.copyProperties(chapterDto, chapter);
				//copy lession
				for (TblCourseLesson lession : chapter.getTblCourseLessons()) {
//					
//					List<TblMaterialUploadDto> lsMaterialDto = new ArrayList<>();
//					List<TblMaterialUpload> entList =  tblMaterialUploadDao.findLessonResource(lession.getCourseLessonId());
//					for (TblMaterialUpload material : entList) {
//						lsMaterialDto.add((TblMaterialUploadDto) tblMaterialUploadDao.convertEntity2Dto(material, TblMaterialUploadDto.class));
//					}
					
					TblCourseLessonDto lessionDto = new TblCourseLessonDto();
					BeanUtils.copyProperties(lessionDto, lession);
					
					// unsecure
					//lessionDto.setMaterials(lsMaterialDto);
					listLessionDto.add(lessionDto);
				}
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			chapterDto.setLessons(listLessionDto);
			listChaperDto.add(chapterDto);
		}
		
		return listChaperDto;
	}
	
	public List<TblCourseChapterDto> findAll(){
		return createDtoList(tblCourseChapterDao.findAll());
	}
	
	public TblCourseChapterDto get(Long id){
		return (TblCourseChapterDto)tblCourseChapterDao.convertEntity2Dto(tblCourseChapterDao.get(id), TblCourseChapterDto.class);
	}
	
	public TblCourseChapterDto create(TblCourseChapterDto entity){
		TblCourseChapter ent = new TblCourseChapter();
		try {
			BeanUtils.copyProperties(ent, entity);		
			ent = tblCourseChapterDao.create(ent);
			BeanUtils.copyProperties(entity, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@Transactional(value=TxType.REQUIRED, rollbackOn=Throwable.class)
	public TblCourseChapterDto update(TblCourseChapterDto entity){
		TblCourseChapter dbEnt = tblCourseChapterDao.get(entity.getCourseChapterId());
		try {
			BeanUtils.copyProperties(dbEnt, entity);
			dbEnt = tblCourseChapterDao.edit(dbEnt);
			BeanUtils.copyProperties(entity, dbEnt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	/**
	 * Just push and do not care UPDATE or CREATE
	 * @param entity
	 * @return
	 */
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblCourseChapterDto push(TblCourseChapterDto entity){
		if(entity.getCourseChapterId() != null){
			update(entity);			
		}else{
			create(entity);
		}
		return entity;
	}
	
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void remove(TblCourseChapterDto entity){
		TblCourseChapter dbEnt = new TblCourseChapter();
		try {
			BeanUtils.copyProperties(dbEnt, entity);
			tblCourseChapterDao.remove(dbEnt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void remove(Long id){
		TblCourseChapter dbEnt = tblCourseChapterDao.get(id);
		tblCourseChapterDao.remove(dbEnt);
	}
	
	private List<TblCourseChapterDto> createDtoList(List<TblCourseChapter> entList){
		List<TblCourseChapterDto> dtoList = new ArrayList<TblCourseChapterDto>();
		for(TblCourseChapter c: entList){
			TblCourseChapterDto dto = new TblCourseChapterDto();
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
