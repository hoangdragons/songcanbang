package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.CouponDetail;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class CouponDetailDao extends AbstractBaseJpaDao<CouponDetail> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public CouponDetailDao() {
		super(CouponDetail.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@SuppressWarnings("unchecked")
	public List<CouponDetail> searchTopTen(){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM coupon_detail t ");
		q.append(" WHERE t.delete_Flg <> 1 LIMIT 10 ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CouponDetail.class);
        return createNamedQuery.getResultList();
	}
	
	/**
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public CouponDetail getByCouponCode(String ccode){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM coupon_detail t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.code=:ccode");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CouponDetail.class);
		createNamedQuery.setParameter("ccode", ccode);
        List<CouponDetail> ret =  createNamedQuery.getResultList();
        return ret != null && ret.size() >0 ? ret.get(0):null;
	}
	
	/**
	 * Check if coupon code is exist with specific coupon type
	 * @param couponType
	 * @param code
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CouponDetail> checkExist(String couponType, String code){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM coupon_detail t ");
		q.append(" WHERE t.delete_Flg <> 1 AND coupon_type = :couponType AND code = :code");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CouponDetail.class);
		createNamedQuery.setParameter("couponType", couponType);
		createNamedQuery.setParameter("code", code);
        return createNamedQuery.getResultList();
	}	
}
