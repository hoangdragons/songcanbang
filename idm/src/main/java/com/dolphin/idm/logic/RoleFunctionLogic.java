package com.dolphin.idm.logic;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.transaction.Transactional;

import com.dolphin.idm.dao.DAOHelper;
import com.dolphin.idm.dao.RoleFunctionDao;
import com.dolphin.idm.entity.Role;
import com.dolphin.idm.entity.RoleFunction;
import com.dolphin.persistence.dto.RoleFunctionDto;

public class RoleFunctionLogic  implements Serializable {
	private static final long serialVersionUID = -7209249948807936293L;

	@EJB
	RoleFunctionDao roleFunctionDao;
	
	DAOHelper<RoleFunctionDto, RoleFunction> helper = new DAOHelper<RoleFunctionDto, RoleFunction>();
	
	
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public RoleFunctionDto create(RoleFunctionDto dto) {
		return helper.copyEntity2Dto(new RoleFunctionDto(), roleFunctionDao.create(helper.copyDto2Entity(new RoleFunction(),dto)));
	}

	/**
	 * Edit entity
	 * 
	 * @param entity
	 * @throws Exception
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public RoleFunctionDto edit(RoleFunctionDto dto) {
		return helper.copyEntity2Dto(new RoleFunctionDto(), roleFunctionDao.edit(
				helper.copyDto2Entity(new RoleFunction(),dto)));
	}

	/**
	 * Remove entity
	 * 
	 * @param entity
	 */
	public void remove(RoleFunctionDto dto) {
		roleFunctionDao.remove(helper.copyDto2Entity(new RoleFunction(),dto));
	}

	/**
	 * Get an entity
	 * 
	 * @param id
	 * @return
	 */
	public RoleFunctionDto get(Object id) {
		return helper.copyEntity2Dto(new RoleFunctionDto(), roleFunctionDao.get(id));
	}
	
	/**
	 * Find all user return a list of user dto
	 * @return
	 */
	public List<RoleFunctionDto> findAll() {		
		List<RoleFunction> listRoleFunction = roleFunctionDao.findAll();
		List<RoleFunctionDto> listRoleFunctionDto = new ArrayList<RoleFunctionDto>();
		for(RoleFunction r : listRoleFunction){
			RoleFunctionDto dto = helper.copyEntity2Dto(new RoleFunctionDto(), r);
			listRoleFunctionDto.add(dto);
		}
		return listRoleFunctionDto;
	}
	
	public int count(){
    	return roleFunctionDao.count();
    }
	
	/**
	 * Get user role by specific userId.
	 * @param userId
	 * @return
	 */
	public List<RoleFunctionDto> getFunctionByRoleId(Long roleId){
		List<RoleFunction> listRFunc = roleFunctionDao.getRoleFunctionByRoleId(roleId);
		List<RoleFunctionDto> listRFuncDto = new ArrayList<RoleFunctionDto>();
		for(RoleFunction f:listRFunc){
			RoleFunctionDto dto = helper.copyEntity2Dto(new RoleFunctionDto(),f);
			listRFuncDto.add(dto);
		}
		return listRFuncDto;
	}
	
	/**
	 * Get user role by specific userId.
	 * @param userId
	 * @return
	 */
	public List<RoleFunctionDto> getRoleFunctionByFunctionId(Long functionId){
		List<RoleFunction> listRFunc = roleFunctionDao.getRoleFunctionByFunctionId(functionId);
		List<RoleFunctionDto> listRFuncDto = new ArrayList<RoleFunctionDto>();
		for(RoleFunction f:listRFunc){
			RoleFunctionDto dto = helper.copyEntity2Dto(new RoleFunctionDto(),f);
			listRFuncDto.add(dto);
		}
		return listRFuncDto;
	}
	
	
	public int deleteByRole(Long roleId)
    {	
        return roleFunctionDao.deleteByRole(roleId);
    }
	
	public int updateByRole(Role role, List<Map<String,Object>> listRoleFunction)
    {	
		int delCount = roleFunctionDao.deleteByRole(role.getRoleId());		
		for(int i=0;i<listRoleFunction.size();i++){
			Map<String,Object> rfMap = (Map<String,Object>)listRoleFunction.get(i);
			RoleFunction rf = new RoleFunction();
			rf.setRoleId(role.getRoleId());
			rf.setFunctionId(new Long(rfMap.get("functionId").toString()));
			roleFunctionDao.create(rf);
		}
        return delCount;
    }
}
