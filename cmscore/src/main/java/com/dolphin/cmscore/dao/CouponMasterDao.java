package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.CouponMaster;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class CouponMasterDao extends AbstractBaseJpaDao<CouponMaster> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public CouponMasterDao() {
		super(CouponMaster.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@SuppressWarnings("unchecked")
	public List<CouponMaster> searchTopTen(){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM coupon_master t ");
		q.append(" WHERE t.delete_Flg <> 1 LIMIT 10 ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CouponMaster.class);
        return createNamedQuery.getResultList();
	}
	
	public Boolean existType(String couponType){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM coupon_master t ");
		q.append(" WHERE t.delete_Flg <> 1 AND coupon_type = :couponType ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CouponMaster.class);
		createNamedQuery.setParameter("couponType", couponType);
        List<CouponMaster> ret = createNamedQuery.getResultList();
        return ret != null && ret.size() > 0;
	}
	
	/**
	 * Get CouponMaster by specific coupon type.
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public CouponMaster getByCouponType(String ctype){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM coupon_master t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.coupon_type=:ctype");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), CouponMaster.class);
		createNamedQuery.setParameter("ctype", ctype);
        List<CouponMaster> ret =  createNamedQuery.getResultList();
        return ret != null && ret.size() >0 ? ret.get(0):null;
	}
	
}
