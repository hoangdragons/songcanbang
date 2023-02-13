package com.dolphin.idm.dao;

import java.lang.reflect.Method;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.annotation.SqlTemplateInfo;
import com.dolphin.idm.entity.UserRole;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;
import com.dolphin.sqltemplate.TemplateUtil;

@Stateless
public class UserRoleDao extends AbstractBaseJpaDao<UserRole>{
	
	public UserRoleDao() {
        super(UserRole.class);
    }
	
	@PersistenceContext(unitName="dolphin.idm")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
     
    @SuppressWarnings("unchecked")
	@SqlTemplateInfo(folder="user", file="getUserRoleByUserId")
    public List<UserRole> getUserRoleByUserId(Long userId)
    {	
    	Method m = null;
		try {
			m = getClass().getMethod("getUserRoleByUserId", Long.class);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
    	String templateFilePath = getSQLTemplateFilePath(m);
		String sql = TemplateUtil.fromTemplate(templateFilePath);
		Query createNamedQuery = getEntityManager().createQuery(sql);
		createNamedQuery.setParameter("userId", userId);
		return  createNamedQuery.getResultList();
    }
    
    @SuppressWarnings("unchecked")
	@SqlTemplateInfo(folder="user", file="getUserRoleByRoleId")
    public List<UserRole> getUserRoleByRoleId(Long roleId)
    {	
    	Method m = null;
		try {
			m = getClass().getMethod("getUserRoleByRoleId", Long.class);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
    	String templateFilePath = getSQLTemplateFilePath(m);
		String sql = TemplateUtil.fromTemplate(templateFilePath);
		Query createNamedQuery = getEntityManager().createQuery(sql);
		createNamedQuery.setParameter("roleId", roleId);
		return  createNamedQuery.getResultList();
    }
    
	public int deleteByUser(Long userId)
    {	
        Query q = getEntityManager().createNamedQuery("UserRole.deleteByUser");        
        q.setParameter("userId", userId);
        return q.executeUpdate();
    }
}
