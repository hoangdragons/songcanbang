package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.AffiliateInfo;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class AffiliateInfoDao extends AbstractBaseJpaDao<AffiliateInfo> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public AffiliateInfoDao() {
		super(AffiliateInfo.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	public Boolean checkExist(AffiliateInfo ent){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM affiliate_info t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.opener_Id = :openerId AND t.course_Id = :courseId AND t.shv_Id = :shvId ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), AffiliateInfo.class);
		createNamedQuery.setParameter("openerId", ent.getOpenerId());
		createNamedQuery.setParameter("courseId", ent.getCourseId());
		createNamedQuery.setParameter("shvId", ent.getShvId());
		List<AffiliateInfo> ret = createNamedQuery.getResultList();
        return ret != null && ret.size() > 0;
	}
	
	@SuppressWarnings("unchecked")
	public List<AffiliateInfo> search(String shvId, Long numDelete){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM affiliate_info t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.shv_id=:shvId  LIMIT :numDelete ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), AffiliateInfo.class);
		createNamedQuery.setParameter("numDelete", numDelete);
		createNamedQuery.setParameter("shvId", shvId);
        return createNamedQuery.getResultList();
	}
	
	
}
