package com.dolphin.idm.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.idm.entity.Role;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class RoleDao extends AbstractBaseJpaDao<Role> {
	public RoleDao() {
		super(Role.class);
	}

	@PersistenceContext(unitName="dolphin.idm")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public Boolean checkRoleName(String roleName){
    	Query q = em.createNamedQuery("Role.checkRoleName");
    	q.setFirstResult(0);
    	q.setMaxResults(1);
    	q.setParameter("roleName", roleName);    	
    	return q.getResultList().size() > 0;
    }
    
    @SuppressWarnings("unchecked")
   	public List<Role> search(String keyword){
   		Query q = getEntityManager().createNamedQuery("Role.search");        
   		q.setParameter("keyword", "%"+keyword+"%");
           return q.getResultList();
   	}
}
