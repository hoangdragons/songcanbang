package com.dolphin.cmscore.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.dolphin.cmscore.entity.LearningInformation;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class LearningInformationDao extends AbstractBaseJpaDao<LearningInformation> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public LearningInformationDao() {
		super(LearningInformation.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	/**
	 * Get specific info object if exist in database.
	 * @param courseId
	 * @param userId
	 * @param materialId
	 * @return
	 */
	public LearningInformation getCompletedMaterial(Long courseId, Long userId, Long materialId){
		LearningInformation ret = null;
		try{
			TypedQuery<LearningInformation> q = getEntityManager().createNamedQuery("LearningInformation.getCompletedMat", LearningInformation.class);
			q.setParameter("userId", userId);
			q.setParameter("courseId", courseId);
			q.setParameter("materialId", materialId);
			q.setMaxResults(1);
			ret = q.getSingleResult();
		}catch(NoResultException ne){
			System.out.println("No reult for query" + ne.getMessage());
		}
		
		return ret;
	}
}
