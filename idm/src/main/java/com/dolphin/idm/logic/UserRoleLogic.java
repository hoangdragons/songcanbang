package com.dolphin.idm.logic;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import javax.transaction.Transactional;

import com.dolphin.idm.dao.DAOHelper;
import com.dolphin.idm.dao.UserDao;
import com.dolphin.idm.dao.UserRoleDao;
import com.dolphin.idm.entity.TblUser;
import com.dolphin.idm.entity.UserRole;
import com.dolphin.persistence.dto.UserRoleDto;

@Named("userRoleLogic")
@RequestScoped
public class UserRoleLogic implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3563910046235378611L;

	@EJB
	UserRoleDao userRoleDao;
	
	@EJB
	UserDao userDao;
	
	DAOHelper<UserRoleDto, UserRole> helper = new DAOHelper<UserRoleDto, UserRole>();
	
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserRoleDto create(UserRoleDto dto) {
		return helper.copyEntity2Dto(dto, userRoleDao.create(helper.copyDto2Entity(new UserRole(),dto)));
	}

	/**
	 * Edit entity
	 * 
	 * @param entity
	 * @throws Exception
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserRoleDto edit(UserRoleDto dto) {
		return helper.copyEntity2Dto(new UserRoleDto(), userRoleDao.edit(
				helper.copyDto2Entity(new UserRole(),dto)));
	}

	/**
	 * Remove entity
	 * 
	 * @param entity
	 */
	public void remove(UserRoleDto dto) {
		userRoleDao.remove(helper.copyDto2Entity(new UserRole(),dto));
	}

	/**
	 * Get an entity
	 * 
	 * @param id
	 * @return
	 */
	public UserRoleDto get(Object id) {
		return helper.copyEntity2Dto(new UserRoleDto(), userRoleDao.get(id));
	}
	
	/**
	 * Find all user return a list of user dto
	 * @return
	 */
	public List<UserRoleDto> findAll() {		
		List<UserRole> listRole = userRoleDao.findAll();
		List<UserRoleDto> listRoleDto = new ArrayList<UserRoleDto>();
		for(UserRole r:listRole){
			UserRoleDto dto = helper.copyEntity2Dto(new UserRoleDto(), r);
			listRoleDto.add(dto);
		}
		return listRoleDto;
	}
	
	/**
	 * Get user role by specific userId.
	 * @param userId
	 * @return
	 */
	public List<UserRoleDto> getUserRoleByUserId(Long userId){
		List<UserRole> listRole = userRoleDao.getUserRoleByUserId(userId);
		List<UserRoleDto> listRoleDto = new ArrayList<UserRoleDto>();
		for(UserRole r:listRole){
			UserRoleDto dto = helper.copyEntity2Dto(new UserRoleDto(),r);
			listRoleDto.add(dto);
		}
		return listRoleDto;
	}
	
	public int deleteByUser(Long userId)
    {	
        return userRoleDao.deleteByUser(userId);
    }
	
	public int updateByUser(TblUser user, List<UserRoleDto> listRoles)
    {	
		int delCount = userRoleDao.deleteByUser(user.getUserId());		
		for(int i=0;i<listRoles.size();i++){
			@SuppressWarnings("unchecked")
			Map<String,Object> role = (Map<String,Object>)listRoles.get(i);
			UserRole ur = new UserRole();
			ur.setRoleId(new Long(role.get("roleId").toString()));
			ur.setUserId(user.getUserId());
			
			userRoleDao.create(ur);
		}
        return delCount;
    }
	
	public int count(){
    	return userRoleDao.count();
    }
}
