package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.dolphin.cmscore.entity.TblCourseRating;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCourseRatingDao extends AbstractBaseJpaDao<TblCourseRating> {

	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCourseRatingDao() {
		super(TblCourseRating.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	@SuppressWarnings("unchecked")
	public List<TblCourseRating> getListRatingByCourseId(Long courseId) {
		Query q = em.createQuery("SELECT t FROM TblCourseRating t "
				+ "WHERE t.deleteFlg <> 1 AND t.courseId = :courseId ORDER BY t.ratingTime DESC");
		q.setParameter("courseId", courseId);
		return q.getResultList();
	}
	
	public Long countRatingByCourseId(Long courseId) {
		Query q = em.createQuery("SELECT COUNT(t.courseId) FROM TblCourseRating t "
				+ "WHERE t.deleteFlg <> 1 AND t.courseId = :courseId");
		q.setParameter("courseId", courseId);
		return new Long(q.getSingleResult().toString());
	}
	
	public TblCourseRating getUserRating(Long userId, Long courseId){
		System.out.println("---------- UserId: " + userId + ", -------------- course id:"+ courseId);
		TypedQuery<TblCourseRating> q = em.createQuery("SELECT t FROM TblCourseRating t WHERE t.deleteFlg <> 1 "
				+ " AND t.courseId = :courseId AND t.createdBy = :userId ORDER BY t.ratingTime DESC", 
				TblCourseRating.class);
		q.setParameter("courseId", courseId);
		q.setParameter("userId", userId.toString());
		List<TblCourseRating> r1 = q.getResultList();
		return r1 != null && r1.size() > 0 ? r1.get(0) : null;
	}
}
