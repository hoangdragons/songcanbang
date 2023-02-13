package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.CouponMasterDao;
import com.dolphin.cmscore.dto.CouponMasterDto;
import com.dolphin.cmscore.entity.CouponMaster;

public class CouponMasterLogic implements Serializable {
	private static final long serialVersionUID = -6852656436900889980L;
	@EJB
	private CouponMasterDao dao;
	
	public Integer createDetailList(List<CouponMasterDto> teacherList){
		int count = 0;
		for(CouponMasterDto dto:teacherList){
			dto = create(dto);
			count++;
		}
		return count;
	}
	
	public CouponMasterDto get(Long id){
		CouponMaster e = dao.get(id);
		CouponMasterDto dto = new CouponMasterDto();
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	public CouponMasterDto create(CouponMasterDto dto){
		if(existType(dto.getCouponType())){
			return null;
		}
		CouponMaster e = new CouponMaster();
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
	
	public CouponMasterDto update(CouponMasterDto dto){
		CouponMaster e = new CouponMaster();
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
	
	
	public void remove(CouponMasterDto dto){
		CouponMaster e = new CouponMaster();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.remove(e);
	}
	
	public List<CouponMasterDto> findAll(){
		List<CouponMaster> ret = dao.findAll();
		List<CouponMasterDto> dtoList = new ArrayList<CouponMasterDto>();
		for(CouponMaster e: ret){
			CouponMasterDto dto = new CouponMasterDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	public List<CouponMasterDto> searchTopTen(){
		List<CouponMaster> ret = dao.searchTopTen();
		List<CouponMasterDto> dtoList = new ArrayList<CouponMasterDto>();
		for(CouponMaster e: ret){
			CouponMasterDto dto = new CouponMasterDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	public Boolean existType(String couponType){
		return dao.existType(couponType);
	}
	
	/**
	 * Get one record with specified coupon code 
	 * @param ccode
	 * @return
	 */
	public CouponMasterDto getByCouponType(String ctype){
		CouponMaster ent = dao.getByCouponType(ctype);
		CouponMasterDto dto = new CouponMasterDto();
		try {
			BeanUtils.copyProperties(dto, ent);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
}
