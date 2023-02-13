package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.TblCourseLesson;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCourseLessonDao extends AbstractBaseJpaDao<TblCourseLesson> {

	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCourseLessonDao() {
		super(TblCourseLesson.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	public Long countLessonByCourseId(Long courseId) {
		Query createNamedQuery = em.createQuery
				("SELECT count(t) FROM TblCourseLesson t "
						+ "INNER JOIN t.tblCourseChapter t2 "
						+ "WHERE t.deleteFlg <> 1 AND t2.deleteFlg <> 1 AND t2.courseId = :courseId");
		createNamedQuery.setParameter("courseId", courseId);
        return (Long) createNamedQuery.getSingleResult();
	}
	

	@SuppressWarnings("unchecked")
	public List<TblCourseLesson> findByChapter(Long chapterId){
		Query createNamedQuery = getEntityManager().createNamedQuery("TblCourseLesson.findByChapter");        
		createNamedQuery.setParameter("chapterId", chapterId);
        return createNamedQuery.getResultList();
	}
	

}
