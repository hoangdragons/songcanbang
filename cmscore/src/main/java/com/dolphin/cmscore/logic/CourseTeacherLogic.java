package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.CourseTeacherDao;
import com.dolphin.cmscore.dto.CourseTeacherDto;
import com.dolphin.cmscore.entity.CourseTeacher;

public class CourseTeacherLogic implements Serializable {	
	private static final long serialVersionUID = 2176466102082133820L;
	
	@EJB
	private CourseTeacherDao dao;
	
	public List<CourseTeacherDto> findByCourse(Long courseId){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("courseId", courseId);
		List<CourseTeacher> ents = dao.find("CourseTeacher.findByCourse", paramMap);
		List<CourseTeacherDto> dtos = new ArrayList<CourseTeacherDto>();
		for(CourseTeacher e:ents ){
			CourseTeacherDto dto = new CourseTeacherDto();
			try {
				BeanUtils.copyProperties(dto, e);
				dtos.add(dto);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			
		}
		return dtos;
	}
	
	public List<CourseTeacherDto> findByTeacher(String namedQuery, Map<String,Object> paramMap){
		List<CourseTeacher> ents = dao.find("CourseTeacher.findByTeacher", paramMap);
		List<CourseTeacherDto> dtos = new ArrayList<CourseTeacherDto>();
		for(CourseTeacher e:ents ){
			CourseTeacherDto dto = new CourseTeacherDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			
		}
		return dtos;
	}

	public void deleteByCourse(Long courseId){
		dao.deleteByCourse(courseId);
	}
	
	public void deleteByTeacher(Long teacherId){
		dao.deleteByTeacher(teacherId);
	}
	
	public Integer createList(List<CourseTeacherDto> teacherList){
		int count = 0;
		for(CourseTeacherDto dto:teacherList){
			dto = create(dto);
			count++;
		}
		return count;
	}
	
	public Integer updateList(List<CourseTeacherDto> teacherList){
		int count = 0;
		for(CourseTeacherDto dto:teacherList){
			dto = update(dto);
			count++;
		}
		return count;
	}
	
	public Integer deleteList(List<CourseTeacherDto> teachers){
		int count = 0;
		for(CourseTeacherDto dto:teachers){
			delete(dto);
			count++;
		}
		return count;
	}
	
	public void delete(CourseTeacherDto dto){
		CourseTeacher e = new CourseTeacher();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.delete(e);
	}
	
	public CourseTeacherDto get(Long id){
		CourseTeacher e = dao.get(id);
		CourseTeacherDto dto = new CourseTeacherDto();
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	public CourseTeacherDto create(CourseTeacherDto dto){
		CourseTeacher e = new CourseTeacher();
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
	
	public CourseTeacherDto update(CourseTeacherDto dto){
		CourseTeacher e = new CourseTeacher();
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
	
	
	public void remove(CourseTeacherDto dto){
		CourseTeacher e = new CourseTeacher();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.remove(e);
	}
	
	public List<CourseTeacherDto> findAll(){
		List<CourseTeacher> ret = dao.findAll();
		List<CourseTeacherDto> dtoList = new ArrayList<CourseTeacherDto>();
		for(CourseTeacher e: ret){
			CourseTeacherDto dto = new CourseTeacherDto();
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
