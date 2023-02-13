package com.dolphin.cmscore.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.dolphin.cmscore.entity.AffiliateStat;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class AffiliateStatDao extends AbstractBaseJpaDao<AffiliateStat> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public AffiliateStatDao() {
		super(AffiliateStat.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
}
