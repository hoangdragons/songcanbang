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

import com.dolphin.cmscore.dao.TblMaterialUploadDao;
import com.dolphin.cmscore.dao.TblMaterialUploadDao.RESOURCE_TYPE;
import com.dolphin.cmscore.dto.TblMaterialUploadDto;
import com.dolphin.cmscore.entity.TblMaterialUpload;


@RequestScoped
public class MaterialUploadLogic implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2674611298460958979L;
	
	@EJB
	private TblMaterialUploadDao materialUploadDao;
	
	/**
	 * Find category
	 * 
	 * @return
	 */
	public List<TblMaterialUploadDto> findAll() {
		List<TblMaterialUpload> listEntites = materialUploadDao.findAll();
		List<TblMaterialUploadDto> listDto = new ArrayList<TblMaterialUploadDto>();
		for(TblMaterialUpload e: listEntites){
			TblMaterialUploadDto dto = new TblMaterialUploadDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			listDto.add(dto);
		}
		return listDto;
	}

	public TblMaterialUploadDto get(Long id){
		TblMaterialUploadDto dto = new TblMaterialUploadDto();
		if (id.intValue() != 0) {
			TblMaterialUpload ent = materialUploadDao.get(id);
			try {
				BeanUtils.copyProperties(dto, ent);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public TblMaterialUploadDto create(TblMaterialUploadDto dto) {
		TblMaterialUpload ent = new TblMaterialUpload();
		try {
			BeanUtils.copyProperties(ent, dto);
			ent = materialUploadDao.create(ent);
			BeanUtils.copyProperties(dto, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblMaterialUploadDto update(TblMaterialUploadDto dto){
		TblMaterialUpload ent = new TblMaterialUpload();		
		try {
			BeanUtils.copyProperties(ent, dto);
			ent = materialUploadDao.edit(ent);
			BeanUtils.copyProperties(dto, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblMaterialUploadDto push(TblMaterialUploadDto dto){
		if(dto.getId() != null){
			dto = update(dto);
		}else{
			dto = create(dto);
		}
		return dto;
	}

	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void remove(Long id){
		TblMaterialUpload ent = materialUploadDao.get(id);
		materialUploadDao.remove(ent);
	}
	
	public List<TblMaterialUploadDto> findLessonResource(Long lessonId, RESOURCE_TYPE type){
		List<TblMaterialUpload> entList =  materialUploadDao.findLessonResource(lessonId, type);
		List<TblMaterialUploadDto> dtoList = new ArrayList<TblMaterialUploadDto>();
		for(TblMaterialUpload ent: entList){
			dtoList.add((TblMaterialUploadDto)materialUploadDao.convertEntity2Dto(ent, TblMaterialUploadDto.class));
		}
		return dtoList;
	}
	
	public List<TblMaterialUploadDto> findLessonResource(Long lessonId){
		List<TblMaterialUpload> entList =  materialUploadDao.findLessonResource(lessonId);
		List<TblMaterialUploadDto> dtoList = new ArrayList<TblMaterialUploadDto>();
		for(TblMaterialUpload ent: entList){
			dtoList.add((TblMaterialUploadDto)materialUploadDao.convertEntity2Dto(ent, TblMaterialUploadDto.class));
		}
		return dtoList;
	}
	
	public TblMaterialUploadDto getCourseIntroResource(Long courseId, RESOURCE_TYPE type){
		return (TblMaterialUploadDto)materialUploadDao.convertEntity2Dto(
				materialUploadDao.getCourseIntroResource(courseId, type), TblMaterialUploadDto.class);
	}
}
