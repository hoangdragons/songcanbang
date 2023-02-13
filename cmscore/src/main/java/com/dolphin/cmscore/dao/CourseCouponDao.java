package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.CourseCoupon;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class CourseCouponDao extends AbstractBaseJpaDao<CourseCoupon> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public CourseCouponDao() {
		super(CourseCoupon.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@SuppressWarnings("unchecked")
	public List<CourseCoupon> searchTopTen(){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM course_coupon t ");
		q.append(" WHERE t.delete_Flg <> 1 LIMIT 10 ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CourseCoupon.class);
        return createNamedQuery.getResultList();
	}
	
	/**
	 * Get list of applied coupon by coupon type
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CourseCoupon> getByCoupon(String ctype){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM course_coupon t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.coupon_type=:ctype");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CourseCoupon.class);
		createNamedQuery.setParameter("ctype", ctype);
		
        return createNamedQuery.getResultList();
	}
	
	/**
	 * Get list of applied coupon for a course
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CourseCoupon> getByCourse(Long courseId){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM course_coupon t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.course_Id=:courseId");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CourseCoupon.class);
		createNamedQuery.setParameter("courseId", courseId);
		
        return createNamedQuery.getResultList();
	}
	
	/**
	 * Check if coupon code is exist with specific coupon type
	 * @param couponType
	 * @param code
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CourseCoupon> checkExist(String couponType, Long courseId){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM course_coupon t ");
		q.append(" WHERE t.delete_Flg <> 1 AND coupon_type = :couponType AND course_Id = :courseId");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CourseCoupon.class);
		createNamedQuery.setParameter("couponType", couponType);
		createNamedQuery.setParameter("courseId", courseId);
        return createNamedQuery.getResultList();
	}	
}
