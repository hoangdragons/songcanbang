package com.dolphin.cmscore.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.dolphin.cmscore.entity.TblCourseSubComment;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCourseSubCommentDao extends AbstractBaseJpaDao<TblCourseSubComment> {

	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCourseSubCommentDao() {
		super(TblCourseSubComment.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
}
