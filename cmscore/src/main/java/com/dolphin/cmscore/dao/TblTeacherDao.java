package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.TblCourse;
import com.dolphin.cmscore.entity.TblTeacher;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblTeacherDao extends AbstractBaseJpaDao<TblTeacher> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblTeacherDao() {
		super(TblTeacher.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@SuppressWarnings("unchecked")
	public List<TblTeacher> searchTopTen(){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM Tbl_Teacher t ");
		q.append(" WHERE t.delete_Flg <> 1 LIMIT 10 ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), TblTeacher.class);
        return createNamedQuery.getResultList();
	}
	
	
	public List<TblTeacher> searchTeacherByCourseId(Long courseId){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM Tbl_Teacher t ");
		q.append(" WHERE t.delete_Flg <> 1 AND  LIMIT 10 ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), TblTeacher.class);
        return createNamedQuery.getResultList();
	}
	
}
