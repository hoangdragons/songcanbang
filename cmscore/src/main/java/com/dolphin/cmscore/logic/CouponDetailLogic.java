package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.CouponDetailDao;
import com.dolphin.cmscore.dto.CouponDetailDto;
import com.dolphin.cmscore.entity.CouponDetail;

public class CouponDetailLogic implements Serializable {
	private static final long serialVersionUID = 2506277310271781807L;
	@EJB
	private CouponDetailDao dao;
	
	public Integer createDetailList(List<CouponDetailDto> teacherList){
		int count = 0;
		for(CouponDetailDto dto:teacherList){
			dto = create(dto);
			count++;
		}
		return count;
	}
	
	public CouponDetailDto get(Long id){
		CouponDetail e = dao.get(id);
		CouponDetailDto dto = new CouponDetailDto();
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	public CouponDetailDto create(CouponDetailDto dto){
		CouponDetail e = new CouponDetail();
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
	
	public CouponDetailDto update(CouponDetailDto dto){
		CouponDetail e = new CouponDetail();
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
	
	
	public void remove(CouponDetailDto dto){
		CouponDetail e = new CouponDetail();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.remove(e);
	}
	
	public List<CouponDetailDto> findAll(){
		List<CouponDetail> ret = dao.findAll();
		List<CouponDetailDto> dtoList = new ArrayList<CouponDetailDto>();
		for(CouponDetail e: ret){
			CouponDetailDto dto = new CouponDetailDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	public List<CouponDetailDto> searchTopTen(){
		List<CouponDetail> ret = dao.searchTopTen();
		List<CouponDetailDto> dtoList = new ArrayList<CouponDetailDto>();
		for(CouponDetail e: ret){
			CouponDetailDto dto = new CouponDetailDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	public Boolean exist(String couponType, String code){
		List<CouponDetail> ret = dao.checkExist(couponType, code);
		return ret != null && ret.size()>0;
	}
	
	/**
	 * Get one record with specified coupon code 
	 * @param ccode
	 * @return
	 */
	public CouponDetailDto getByCouponCode(String ccode){
		CouponDetail ent = dao.getByCouponCode(ccode);
		CouponDetailDto dto = new CouponDetailDto();
		try {
			BeanUtils.copyProperties(dto, ent);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	
}
