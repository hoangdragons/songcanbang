package com.dolphin.idm.dao;

import java.lang.reflect.Method;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.annotation.SqlTemplateInfo;
import com.dolphin.idm.entity.RoleFunction;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;
import com.dolphin.sqltemplate.TemplateUtil;

@Stateless
public class RoleFunctionDao extends AbstractBaseJpaDao<RoleFunction> {
	
	public RoleFunctionDao() {
		super(RoleFunction.class);
	}

	@PersistenceContext(unitName="dolphin.idm")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
	@SuppressWarnings("unchecked")
	@SqlTemplateInfo(folder="user", file="getRoleFunctionByRoleId")
    public List<RoleFunction> getRoleFunctionByRoleId(Long roleId)
    {	
    	Method m = null;
		try {
			m = getClass().getMethod("getRoleFunctionByRoleId", Long.class);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
    	String templateFilePath = getSQLTemplateFilePath(m);
		String sql = TemplateUtil.fromTemplate(templateFilePath);
		Query createNamedQuery = getEntityManager().createQuery(sql);
		createNamedQuery.setParameter("roleId", roleId);		
		return (List<RoleFunction>)createNamedQuery.getResultList();
    }
	
	@SuppressWarnings("unchecked")
	@SqlTemplateInfo(folder="user", file="getRoleFunctionByFunctionId")
    public List<RoleFunction> getRoleFunctionByFunctionId(Long functionId)
    {	
    	Method m = null;
		try {
			m = getClass().getMethod("getRoleFunctionByFunctionId", Long.class);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
    	String templateFilePath = getSQLTemplateFilePath(m);
		String sql = TemplateUtil.fromTemplate(templateFilePath);
		Query createNamedQuery = getEntityManager().createQuery(sql);
		createNamedQuery.setParameter("functionId", functionId);		
		return (List<RoleFunction>)createNamedQuery.getResultList();
    }
	
	public int deleteByRole(Long roleId)
    {	
        Query q = getEntityManager().createNamedQuery("RoleFunction.deleteByRole");        
        q.setParameter("roleId", roleId);
        return q.executeUpdate();
    }
}
