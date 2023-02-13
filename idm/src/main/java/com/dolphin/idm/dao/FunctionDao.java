package com.dolphin.idm.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.idm.entity.Function;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;
@Stateless
public class FunctionDao  extends AbstractBaseJpaDao<Function>{
	public FunctionDao() {
        super(Function.class);
    }
	
	@PersistenceContext(unitName="dolphin.idm")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public Boolean checkFunctionName(String functionName){
    	Query q = em.createNamedQuery("Function.checkFunctionName");
    	q.setFirstResult(0);
    	q.setMaxResults(1);
    	q.setParameter("functionName", functionName);    	
    	return q.getResultList().size() > 0;
    }
    
    @SuppressWarnings("unchecked")
	public List<Function> search(String keyword){
		Query q = getEntityManager().createNamedQuery("Function.search");        
		q.setParameter("keyword", "%"+keyword+"%");
        return q.getResultList();
	}
    
}
