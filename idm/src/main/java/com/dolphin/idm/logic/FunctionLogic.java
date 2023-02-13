package com.dolphin.idm.logic;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import javax.transaction.Transactional;

import com.dolphin.idm.dao.DAOHelper;
import com.dolphin.idm.dao.FunctionDao;
import com.dolphin.idm.entity.Function;
import com.dolphin.persistence.dto.FunctionDto;

@Named("functionLogic")
@RequestScoped
public class FunctionLogic implements Serializable  {
	private static final long serialVersionUID = -6606183157133836952L;

	@EJB
	FunctionDao functionDao;
	
	DAOHelper<FunctionDto, Function> helper = new DAOHelper<FunctionDto, Function>();
	
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public FunctionDto create(FunctionDto dto) {		
		if(functionDao.checkFunctionName(dto.getFunctionName())){
			throw new RuntimeException("Function name already existed!");
		}
		return helper.copyEntity2Dto(new FunctionDto(), functionDao.create(helper.copyDto2Entity(new Function(), dto)));
	}

	/**
	 * Edit entity
	 * 
	 * @param entity
	 * @throws Exception
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public FunctionDto edit(FunctionDto dto) {
		Function editFunc = functionDao.edit(helper.copyDto2Entity(new Function(), dto));
		return helper.copyEntity2Dto(new FunctionDto(), editFunc);
	}

	/**
	 * Remove entity
	 * 
	 * @param entity
	 */
	public void remove(FunctionDto dto) {
		functionDao.remove(helper.copyDto2Entity(new Function(), dto));
	}

	/**
	 * Get an entity
	 * 
	 * @param id
	 * @return
	 */
	public FunctionDto get(Object id) {
		return helper.copyEntity2Dto(new FunctionDto(), functionDao.get(id));
	}
	
	/**
	 * Find all user return a list of user dto
	 * @return
	 */
	public List<FunctionDto> findAll() {		
		List<Function> listFunc = functionDao.findAll();
		List<FunctionDto> listFuncDto = new ArrayList<FunctionDto>();
		for(Function f:listFunc){
			FunctionDto dto = helper.copyEntity2Dto(new FunctionDto(), f);
			listFuncDto.add(dto);
		}
		return listFuncDto;
	}
	
	public Boolean checkFunctionName(String functionName){
		return functionDao.checkFunctionName(functionName);
	}
	
	public List<FunctionDto> search(String keyword) {		
		List<Function> listFunc = functionDao.search(keyword);
		List<FunctionDto> listFuncDto = new ArrayList<FunctionDto>();
		for(Function f:listFunc){
			FunctionDto dto = helper.copyEntity2Dto(new FunctionDto(), f);
			listFuncDto.add(dto);
		}
		return listFuncDto;
	}
}

