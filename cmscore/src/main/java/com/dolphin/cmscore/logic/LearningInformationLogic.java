package com.dolphin.cmscore.logic;

import java.lang.reflect.InvocationTargetException;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.LearningInformationDao;
import com.dolphin.cmscore.dto.LearningInformationDto;
import com.dolphin.cmscore.entity.LearningInformation;

public class LearningInformationLogic {
	
	@EJB
	private LearningInformationDao dao;
	
	public LearningInformationDto getCompletedMaterial(Long courseId, Long userId, Long materialId){
		LearningInformation ent = dao.getCompletedMaterial(courseId, userId, materialId);
		if(ent == null){
			return null;
		}
		LearningInformationDto dto = new LearningInformationDto();
		try {
			BeanUtils.copyProperties(dto, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public LearningInformationDto push(LearningInformationDto dto){
		LearningInformation completedInfo = dao.getCompletedMaterial(dto.getCourseId(), dto.getUserId(), dto.getMaterialId());
		LearningInformation entity = new LearningInformation();
		try {
			BeanUtils.copyProperties(entity, dto);
			if(completedInfo != null && completedInfo.getId() != null){
				entity = dao.edit(entity);
			}else{
				entity = dao.create(entity);
			}
			BeanUtils.copyProperties(dto, entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public LearningInformationDto update(LearningInformationDto dto){
		LearningInformation entity = new LearningInformation();
		try {
			BeanUtils.copyProperties(entity, dto);
			entity = dao.edit(entity);
			BeanUtils.copyProperties(dto, entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public LearningInformationDto delete(LearningInformationDto dto){
		LearningInformation entity = new LearningInformation();
		try {
			BeanUtils.copyProperties(entity, dto);
			entity.setDeleteFlg(1);
			entity = dao.edit(entity);
			BeanUtils.copyProperties(dto, entity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
