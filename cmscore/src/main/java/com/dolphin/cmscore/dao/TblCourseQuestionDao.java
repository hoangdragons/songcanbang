package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.TblCourseQuestion;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCourseQuestionDao extends AbstractBaseJpaDao<TblCourseQuestion> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCourseQuestionDao() {
		super(TblCourseQuestion.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	@SuppressWarnings("unchecked")
	public List<TblCourseQuestion> getListQuestionByCourseId(Long courseId) {
		// separate answer from question 
		Query q = em.createQuery("SELECT t FROM TblCourseQuestion t WHERE t.deleteFlg <> 1 AND t.courseId = :courseId AND t.answer IS NOT NULL ORDER BY t.questionDate DESC");
		q.setParameter("courseId", courseId);
		return q.getResultList();
	}
	
	/**
	 * Find all question by course id (not filter by answer)
	 * @param courseId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TblCourseQuestion> findByCourse(Long courseId) {
		// separate answer from question 
		Query q = em.createQuery("SELECT t FROM TblCourseQuestion t WHERE t.deleteFlg <> 1 AND t.courseId = :courseId ORDER BY t.questionDate DESC");
		q.setParameter("courseId", courseId);
		return q.getResultList();
	}
}
