package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.common.CommonUtil;
import com.dolphin.cmscore.dao.TblMagazinesDao;
import com.dolphin.cmscore.dao.TblTeacherDao;
import com.dolphin.cmscore.dto.TblMagazinesDto;
import com.dolphin.cmscore.dto.TblTeacherDto;
import com.dolphin.cmscore.entity.TblMagazines;

public class MagazinesLogic implements Serializable {
	
	private static final long serialVersionUID = 8153652676392274866L;
	
	@EJB
	private TblMagazinesDao tblMagazinesDao;
	
	@EJB
	private TblTeacherDao tblTeacherDao;

	public List<TblMagazinesDto> getListManazines(int page) {
		List<TblMagazinesDto> lsDto = new ArrayList<>();
		List<TblMagazines> lsMagazines = tblMagazinesDao.getListManazines(page);
		
		for (TblMagazines magazine : lsMagazines) {
			TblMagazinesDto dto = (TblMagazinesDto) tblMagazinesDao.convertEntity2Dto(magazine, TblMagazinesDto.class);
//			dto.setTblTeacherDto((TblTeacherDto) tblTeacherDao.convertEntity2Dto(magazine.getTblTeacher(), TblTeacherDto.class));
			lsDto.add(dto);
		}	
		
		return lsDto;
	}

	public HashMap<String, Object> getTotalPageMagazines() {
		List<TblMagazines> lsMagazines = tblMagazinesDao.getListManazines(0);
		return CommonUtil.getTotalRecordAndListPage(lsMagazines.size());
	}

	public TblMagazinesDto get(Integer magazineId) {
		TblMagazines ent = tblMagazinesDao.get(magazineId);
		TblMagazinesDto dto = (TblMagazinesDto) tblMagazinesDao.convertEntity2Dto(ent, TblMagazinesDto.class);
//		dto.setTblTeacherDto((TblTeacherDto) tblTeacherDao.convertEntity2Dto(ent.getTblTeacher(), TblTeacherDto.class));
		return dto;
	}
	
	// Create
	public TblMagazinesDto create(TblMagazinesDto dto) {
		try {
			TblMagazines ent = new TblMagazines();
			BeanUtils.copyProperties(ent, dto);
			ent = tblMagazinesDao.create(ent);
			BeanUtils.copyProperties(dto, ent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
	// edit
	public TblMagazinesDto edit(TblMagazinesDto dto) {
		try {
			TblMagazines ent = new TblMagazines();
			BeanUtils.copyProperties(ent, dto);
			ent = tblMagazinesDao.edit(ent);
			BeanUtils.copyProperties(dto, ent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	//remove (delete logic)
	public void remove(TblMagazinesDto dto) {
		try {
			TblMagazines ent = new TblMagazines();
			BeanUtils.copyProperties(ent, dto);
			tblMagazinesDao.remove(ent);
			BeanUtils.copyProperties(dto, ent);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// delete
	public void delete(TblMagazinesDto dto) {
		try {
			TblMagazines ent = new TblMagazines();
			BeanUtils.copyProperties(ent, dto);
			tblMagazinesDao.delete(ent);
			BeanUtils.copyProperties(dto, ent);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<TblMagazinesDto> findAll(){
		List<TblMagazines> ret = tblMagazinesDao.findAll();
		List<TblMagazinesDto> dtoList = new ArrayList<TblMagazinesDto>();
		for(TblMagazines e: ret){
			TblMagazinesDto dto = new TblMagazinesDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	public List<TblMagazinesDto> searchTopTen(){
		List<TblMagazines> ret = tblMagazinesDao.searchTopTen();
		List<TblMagazinesDto> dtoList = new ArrayList<TblMagazinesDto>();
		for(TblMagazines e: ret){
			TblMagazinesDto dto = new TblMagazinesDto();
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
