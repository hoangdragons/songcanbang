package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.common.CommonConstants;
import com.dolphin.cmscore.entity.TblBoughtCourse;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblBoughtCourseDao extends AbstractBaseJpaDao<TblBoughtCourse> {

	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblBoughtCourseDao() {
		super(TblBoughtCourse.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	@SuppressWarnings("unchecked")
	public List<TblBoughtCourse> getListBoughtCourseByUserId(Long userId, int page) {
		Query query = em.createNamedQuery("TblBoughtCourse.getBoughtCourseByUserId");
		query.setParameter("userId", userId);
		query.setFirstResult((page - 1) * CommonConstants.MAX_RECORD_PER_PAGE);
		query.setMaxResults(CommonConstants.MAX_RECORD_PER_PAGE);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TblBoughtCourse> getAllBoughtCourseByUserId(Long userId) {
		Query query = em.createNamedQuery("TblBoughtCourse.getBoughtCourseByUserId");
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<TblBoughtCourse> getBoughtCourseByCondition(Long userId, Long courseId) {
		Query createNamedQuery = getEntityManager().
				createQuery("SELECT t FROM TblBoughtCourse t WHERE t.userId = :userId AND t.tblCourse.courseId = :courseId AND t.deleteFlg <> 1");
		createNamedQuery.setParameter("userId", userId);
		createNamedQuery.setParameter("courseId", courseId);
		return createNamedQuery.getResultList();
		
	}

}
