package com.dolphin.idm.logic;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.transaction.Transactional;

import com.dolphin.idm.dao.DAOHelper;
import com.dolphin.idm.dao.RoleDao;
import com.dolphin.idm.entity.Role;
import com.dolphin.persistence.dto.RoleDto;

public class RoleLogic  implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 109859513722123805L;

	@EJB
	RoleDao roleDao;
	
	DAOHelper<RoleDto, Role> helper = new DAOHelper<RoleDto, Role>();
	
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public RoleDto create(RoleDto dto) {
		if(roleDao.checkRoleName(dto.getRoleName())){
			throw new RuntimeException("Role name already existed!");
		}
		return helper.copyEntity2Dto(new RoleDto(), roleDao.create(helper.copyDto2Entity(new Role(),dto)));
	}

	/**
	 * Edit entity
	 * 
	 * @param entity
	 * @throws Exception
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public RoleDto edit(RoleDto dto) {
		return helper.copyEntity2Dto(new RoleDto(), roleDao.edit(
				helper.copyDto2Entity(new Role(),dto)));
	}

	/**
	 * Remove entity
	 * 
	 * @param entity
	 */
	public void remove(RoleDto dto) {
		roleDao.remove(helper.copyDto2Entity(new Role(),dto));
	}

	/**
	 * Get an entity
	 * 
	 * @param id
	 * @return
	 */
	public RoleDto get(Object id) {
		return helper.copyEntity2Dto(new RoleDto(), roleDao.get(id));
	}
	
	/**
	 * Find all user return a list of user dto
	 * @return
	 */
	public List<RoleDto> findAll() {		
		List<Role> listRole = roleDao.findAll();
		List<RoleDto> listRoleDto = new ArrayList<RoleDto>();
		for(Role r:listRole){
			RoleDto dto = helper.copyEntity2Dto(new RoleDto(), r);
			listRoleDto.add(dto);
		}
		return listRoleDto;
	}
	
	public int count(){
    	return roleDao.count();
    }
	
	
	public Boolean checkRoleName(String roleName){
		return roleDao.checkRoleName(roleName);
	}
	
	/**
	 * Search role by name or description
	 * @param keyword
	 * @return
	 */
	public List<RoleDto> search(String keyword) {		
		List<Role> listRole = roleDao.search(keyword);
		List<RoleDto> listRoleDto = new ArrayList<RoleDto>();
		for(Role f:listRole){
			RoleDto dto = helper.copyEntity2Dto(new RoleDto(), f);
			listRoleDto.add(dto);
		}
		return listRoleDto;
	}
}
