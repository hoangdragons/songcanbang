package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.dolphin.cmscore.entity.TblCategory;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCategoryDao extends AbstractBaseJpaDao<TblCategory>{
	
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCategoryDao() {
		super(TblCategory.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@SuppressWarnings("unchecked")
	public List<TblCategory> search(String keyword){
		Query createNamedQuery = getEntityManager().createNamedQuery("TblCategory.search");        
		createNamedQuery.setParameter("keyword", "%"+keyword+"%");
        return createNamedQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TblCategory> getAllCategoryWithDisplayOrder() {
		Query query = getEntityManager().createQuery("SELECT t FROM TblCategory t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder");
		return query.getResultList();
	}
	
	public TblCategory getHelperCategory(){
		TypedQuery<TblCategory> query = getEntityManager().createQuery("SELECT t FROM TblCategory t WHERE t.categoryId = -1 AND t.deleteFlg = 1",TblCategory.class);
		List<TblCategory> ret = query.getResultList(); 
		return  ret != null && ret.size() >0 ?ret.get(0):null;
	}
}
