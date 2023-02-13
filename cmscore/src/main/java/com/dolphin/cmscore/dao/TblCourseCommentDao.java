package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.TblCourseComment;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCourseCommentDao extends AbstractBaseJpaDao<TblCourseComment> {
	
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCourseCommentDao() {
		super(TblCourseComment.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	@SuppressWarnings("unchecked")
	public List<TblCourseComment> getListCommentByCourseId(Long courseId) {
		Query q = em.createQuery("SELECT DISTINCT (t) FROM TblCourseComment t "
				+ "LEFT JOIN FETCH t.tblCourseSubComments t2 "
				+ "WHERE t.courseId = :courseId AND t.deleteFlg <> 1 ORDER BY t.commentDate DESC, t2.commentDate DESC");
		q.setParameter("courseId", courseId);
		return q.getResultList();
	}

}
