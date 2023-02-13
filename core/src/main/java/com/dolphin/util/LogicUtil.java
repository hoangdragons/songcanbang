package com.dolphin.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.internal.LinkedTreeMap;

public class LogicUtil<D, E> {
	public List<D> convertEntityListToDto(List<E> entList, Class<D> clazz){
		List<D> ret = new ArrayList<D>();
		
		for(E e: entList){
	    	try {
				ret.add(entity2Dto(e, clazz));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
		return ret;
	}
	
	public List<E> convertDtoListToEntity(List<D> dtoList, Class<E> clazz){
		List<E> ret = new ArrayList<E>();
		
		for(D d: dtoList){
			Object obj = new Object();
	    	try {
				BeanUtils.copyProperties(obj, d);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
	    	try {
				ret.add(dto2Entity(d, clazz));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ret;
	}
	
	public D entity2Dto(E e, Class<D> clazz){
		D d = null;
		try {
			d = clazz.newInstance();
		} catch (InstantiationException e2) {
			e2.printStackTrace();
		} catch (IllegalAccessException e2) {
			e2.printStackTrace();
		}
    	try {
			BeanUtils.copyProperties(d, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
    	return d;
	}
	
	public E dto2Entity(D d, Class<E> clazz){
		E e = null;
		try {
			e = clazz.newInstance();
		} catch (InstantiationException e2) {
			e2.printStackTrace();
		} catch (IllegalAccessException e2) {
			e2.printStackTrace();
		}
    	try {
			BeanUtils.copyProperties(e, d);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
    	return e;
	}
	
//	public D convertMap2Dto(LinkedTreeMap m, Class<D> d){
//		//{"docno": 16200909,"patientname": "Nguyễn Thị Hồng","receptno": 24}
//		D dto = d.newInstance();
//		for (Field f: d.getFields()){
//			if(m.containsKey(f.getName()))
//			{
//				
//			}
//		}
//		dto.setDocno(String.valueOf(m.get("docno")));
//		dto.setPatientname(String.valueOf(m.get("patientname")));
//		Long receptno = -1L;
//		try{
//			receptno = Long.parseLong(String.valueOf(m.get("receptno")));
//		}catch(Exception e){
//			
//		}
//		dto.setReceptno(receptno);
//		return dto;
//	}
}
