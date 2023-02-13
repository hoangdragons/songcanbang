package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.dolphin.cmscore.common.CommonConstants;
import com.dolphin.cmscore.entity.TblCourse;
import com.dolphin.cmscore.entity.TblMagazines;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblMagazinesDao extends AbstractBaseJpaDao<TblMagazines> {
	
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblMagazinesDao() {
		super(TblMagazines.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	@SuppressWarnings("unchecked")
	public List<TblMagazines> getListManazines(int page) {
		StringBuilder q = new StringBuilder();
		q.append("Select t FROM TblMagazines t ");
		q.append("WHERE t.deleteFlg <> 1 AND t.publishDate IS NOT NULL ORDER BY t.displayOrder");
		
		Query createNamedQuery = getEntityManager().createQuery(q.toString());
		
		if (page != 0) {
			createNamedQuery.setFirstResult((page - 1) * CommonConstants.MAX_RECORD_PER_PAGE);
			createNamedQuery.setMaxResults(CommonConstants.MAX_RECORD_PER_PAGE);
		}
		
		return createNamedQuery.getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<TblMagazines> searchTopTen(){		
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM Tbl_Magazines t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.publish_Date IS NOT NULL ");
		q.append(" ORDER BY t.display_Order LIMIT 10");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), TblMagazines.class);		
        return createNamedQuery.getResultList();
	}
}
