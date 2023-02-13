package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.TblTeacherDao;
import com.dolphin.cmscore.dto.TblTeacherDto;
import com.dolphin.cmscore.entity.TblTeacher;

public class TeacherLogic implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2176466102082133820L;
	
	@EJB
	private TblTeacherDao dao;
	
	public Integer createList(List<TblTeacherDto> teacherList){
		int count = 0;
		for(TblTeacherDto dto:teacherList){
			dto = create(dto);
			count++;
		}
		return count;
	}
	
	public Integer updateList(List<TblTeacherDto> teacherList){
		int count = 0;
		for(TblTeacherDto dto:teacherList){
			dto = update(dto);
			count++;
		}
		return count;
	}
	
	public TblTeacherDto get(Long id){
		TblTeacher e = dao.get(id);
		TblTeacherDto dto = new TblTeacherDto();
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	public TblTeacherDto create(TblTeacherDto dto){
		TblTeacher e = new TblTeacher();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		e = dao.create(e);
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	public TblTeacherDto update(TblTeacherDto dto){
		TblTeacher e = new TblTeacher();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		e = dao.edit(e);
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	
	public void remove(TblTeacherDto dto){
		TblTeacher e = new TblTeacher();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.remove(e);
	}
	
	public List<TblTeacherDto> findAll(){
		List<TblTeacher> ret = dao.findAll();
		List<TblTeacherDto> dtoList = new ArrayList<TblTeacherDto>();
		for(TblTeacher e: ret){
			TblTeacherDto dto = new TblTeacherDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	public List<TblTeacherDto> searchTopTen(){
		List<TblTeacher> ret = dao.searchTopTen();
		List<TblTeacherDto> dtoList = new ArrayList<TblTeacherDto>();
		for(TblTeacher e: ret){
			TblTeacherDto dto = new TblTeacherDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	
}
