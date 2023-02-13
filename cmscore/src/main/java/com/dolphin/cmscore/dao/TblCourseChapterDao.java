package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.TblCourseChapter;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCourseChapterDao extends AbstractBaseJpaDao<TblCourseChapter>{

	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCourseChapterDao() {
		super(TblCourseChapter.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	@SuppressWarnings("unchecked")
	public List<TblCourseChapter> getListChapterByCourseId(Long courseId) {
		Query createNamedQuery = getEntityManager().createQuery
				("SELECT DISTINCT t FROM TblCourseChapter t "
						+ "JOIN FETCH t.tblCourseLessons t2 "
						+ "WHERE t.courseId = :courseId AND t.deleteFlg <> 1 AND t2.deleteFlg <> 1 ORDER BY t.order, t2.order", TblCourseChapter.class);
		createNamedQuery.setParameter("courseId", courseId);
        return createNamedQuery.getResultList();
	}

}
