package com.dolphin.idm.dao;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

public class DAOHelper<D,E> {
	public E copyDto2Entity(E ent, D dto){
		try {
			BeanUtils.copyProperties(ent, dto);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return ent;
	}
	
	public D copyEntity2Dto(D dto, E ent){
		try {
			BeanUtils.copyProperties(dto, ent);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
