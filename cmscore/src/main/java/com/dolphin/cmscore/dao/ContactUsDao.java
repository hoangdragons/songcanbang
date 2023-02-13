package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.ContactUs;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class ContactUsDao extends AbstractBaseJpaDao<ContactUs> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public ContactUsDao() {
		super(ContactUs.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@SuppressWarnings("unchecked")
	public List<ContactUs> searchTopTen(){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM Contact_us t ");
		q.append(" WHERE t.delete_Flg <> 1 LIMIT 10 ");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), ContactUs.class);
        return createNamedQuery.getResultList();
	}
	
	
}
