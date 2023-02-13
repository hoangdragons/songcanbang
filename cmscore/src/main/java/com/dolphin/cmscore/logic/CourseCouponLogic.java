package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.CourseCouponDao;
import com.dolphin.cmscore.dto.CourseCouponDto;
import com.dolphin.cmscore.entity.CourseCoupon;

public class CourseCouponLogic implements Serializable {
	private static final long serialVersionUID = 3750568799156283678L;
	@EJB
	private CourseCouponDao dao;
	
	public Integer createByList(List<CourseCouponDto> teacherList){
		int count = 0;
		for(CourseCouponDto dto:teacherList){
			dto = create(dto);
			count++;
		}
		return count;
	}
	
	public CourseCouponDto get(Long id){
		CourseCoupon e = dao.get(id);
		CourseCouponDto dto = new CourseCouponDto();
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	public CourseCouponDto create(CourseCouponDto dto){
		Boolean ret = exist(dto.getCouponType(), dto.getCourseId());
		if(ret){
			return null;
		}
		CourseCoupon e = new CourseCoupon();
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
	
	public CourseCouponDto update(CourseCouponDto dto){
		CourseCoupon e = new CourseCoupon();
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
	
	
	public void remove(CourseCouponDto dto){
		CourseCoupon e = new CourseCoupon();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.remove(e);
	}
	
	public List<CourseCouponDto> findAll(){
		List<CourseCoupon> ret = dao.findAll();
		List<CourseCouponDto> dtoList = new ArrayList<CourseCouponDto>();
		for(CourseCoupon e: ret){
			CourseCouponDto dto = new CourseCouponDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	public List<CourseCouponDto> searchTopTen(){
		List<CourseCoupon> ret = dao.searchTopTen();
		List<CourseCouponDto> dtoList = new ArrayList<CourseCouponDto>();
		for(CourseCoupon e: ret)
		{
			CourseCouponDto dto = new CourseCouponDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	public Boolean exist(String couponType, Long code){
		List<CourseCoupon> ret = dao.checkExist(couponType, code);
		return ret != null && ret.size()>0;
	}
	
	/**
	 * Get list of data by specific coupon code type
	 * @param ccode
	 * @return
	 */
	public List<CourseCouponDto> getByCoupon(String ctype){
		List<CourseCoupon> ents = dao.getByCoupon(ctype);
		List<CourseCouponDto> dtos = new ArrayList<CourseCouponDto>();
		try {
			for(CourseCoupon ent:ents){
				CourseCouponDto dto = new CourseCouponDto();
				BeanUtils.copyProperties(dto, ent);
				dtos.add(dto);
			}
			
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dtos;
	}
	
	/**
	 * Get list of data for a course 
	 * @param ccode
	 * @return
	 */
	public List<CourseCouponDto> getByCourse(Long courseId){
		List<CourseCoupon> ents = dao.getByCourse(courseId);
		List<CourseCouponDto> dtos = new ArrayList<CourseCouponDto>();
		
		try {
			
			for(CourseCoupon ent: ents){
				CourseCouponDto dto = new CourseCouponDto();
				BeanUtils.copyProperties(dto, ent);
				dtos.add(dto);
			}
			
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dtos;
	}
}
