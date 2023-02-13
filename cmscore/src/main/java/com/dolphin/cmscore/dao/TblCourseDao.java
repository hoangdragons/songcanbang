package com.dolphin.cmscore.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.common.CommonConstants;
import com.dolphin.cmscore.entity.TblCourse;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblCourseDao extends AbstractBaseJpaDao<TblCourse>{

	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblCourseDao() {
		super(TblCourse.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@SuppressWarnings("unchecked")
	public List<TblCourse> findTeachingCourses(Long loginId) {
		// Search courses which login user could be:
		// - Teacher
		// - Owner		
		StringBuffer sb = new StringBuffer();
		sb.append(" SELECT t1.* FROM tbl_course t1 WHERE t1.created_by = '" + loginId +"' AND delete_flg <>1 and helper_course <>1");
		sb.append(" UNION ");
		sb.append(" SELECT t3.* FROM tbl_teacher t1 INNER JOIN course_teacher t2 ON t2.teacher_id = t1.teacher_id ");
		sb.append(" INNER JOIN tbl_course t3 ON t3.course_id = t2.course_id WHERE t1.login_id =" + loginId + " AND t1.delete_flg <> 1");
		
//		System.out.println("--------- " + sb.toString());
		Query query = getEntityManager().createNativeQuery(sb.toString(), TblCourse.class);
		return query.getResultList();
	}

	/**
	 * Get list course without pagination.
	 * 
	 * @param sortType
	 * @param categoryId 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TblCourse> getListCourseBySortType(String sortType, Long categoryId) {
		String order = "rating";
		if ("new".equals(sortType)) {
			order = "puslishDate";
		} else if ("most".equals(sortType)) {
			order = "totalView";
		}
		
		Query createNamedQuery = getEntityManager().createQuery("SELECT t FROM TblCourse t "
//				+ "JOIN FETCH t.tblTeacher t2 "
				+ "JOIN FETCH t.tblCategory t3 "
				+ "WHERE t.deleteFlg <> 1 AND t.helperCourse <> 1 AND t3.categoryId = :categoryId AND t.puslishDate IS NOT NULL ORDER BY " + order, TblCourse.class);
		createNamedQuery.setParameter("categoryId", categoryId);
//		createNamedQuery.setMaxResults(5);
        return createNamedQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TblCourse> searchAll(String keyword){
		Query createNamedQuery = getEntityManager().createNamedQuery("TblCourse.search");        
		createNamedQuery.setParameter("keyword", "%"+keyword+"%");
        return createNamedQuery.getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<TblCourse> findAllHelperCourse(){
		Query createNamedQuery = getEntityManager().createNamedQuery("TblCourse.findAllHelper");        
        return createNamedQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TblCourse> searchCourse(String keyword, Integer page, String orderBy, Integer...recordPerPages){
		StringBuilder q = new StringBuilder();
		q.append("SELECT t FROM TblCourse t ");
		q.append("JOIN FETCH t.tblCategory t2 ");
//		q.append("JOIN FETCH t.tblTeacher t3 ");
		q.append("WHERE t.deleteFlg <> 1 AND t.helperCourse <> 1 AND t.puslishDate IS NOT NULL");
		q.append(" AND (t.content LIKE :keyword OR t.title LIKE :keyword OR t.videoUrl LIKE :keyword)");
		if (orderBy != null) {
			q.append(" ORDER BY t.displayOrder, t.").append(orderBy);
		}
		
		Query createNamedQuery = getEntityManager().createQuery(q.toString(), TblCourse.class);
		createNamedQuery.setParameter("keyword", "%"+keyword+"%");
		Integer recordPerPage = (recordPerPages != null && recordPerPages.length > 0 && recordPerPages[0] != null)
				?recordPerPages[0]:CommonConstants.MAX_RECORD_PER_PAGE;
				
		if (page != null) {
			createNamedQuery.setFirstResult((page - 1) * recordPerPage);
			createNamedQuery.setMaxResults(recordPerPage);
		}
        return createNamedQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TblCourse> searchByCat(Long catId){
		Query createNamedQuery = getEntityManager().createQuery("SELECT t FROM TblCourse t JOIN FETCH t.tblCategory t2 WHERE t.deleteFlg <> 1 AND t2.deleteFlg <> 1 AND t.helperCourse <> 1 AND t2.categoryId = :catId", TblCourse.class);		
		createNamedQuery.setParameter("catId", catId);
        return createNamedQuery.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TblCourse> getListCourseByCategory(Long categoryId) {
		StringBuilder q = new StringBuilder();
		q.append("SELECT t FROM TblCourse t JOIN FETCH t.tblCategory");
		if (categoryId != null && categoryId.intValue() != 0) {
			q.append(" WHERE t.tblCategory.categoryId = :categoryId AND t.deleteFlg <> 1 AND t.helperCourse <> 1");
		}
		
		Query query = em.createQuery(q.toString(), TblCourse.class);
		if (categoryId != null && categoryId.intValue() != 0) {
			query.setParameter("categoryId", categoryId);
		}
		return query.getResultList();
	}

	/**
	 * Lay ra danh sach cac khoa hoc co xu ly phan trang.
	 * @param page
	 * @param categoryId
	 * @param orderBy
	 * @param recordPerPages
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TblCourse> getListCourse(Integer page, Long categoryId, String orderBy, Integer... recordPerPages) {
		StringBuilder q = new StringBuilder();
		q.append("Select t FROM TblCourse t ");
		q.append("JOIN FETCH t.tblCategory t2 ");
		q.append("WHERE t.deleteFlg <> 1 AND t2.deleteFlg <> 1 AND t.helperCourse <> 1 AND t.puslishDate IS NOT NULL");
		if (categoryId != null && categoryId.intValue() != 0) {
			q.append(" AND t2.categoryId = :catId");
		}
		if (orderBy != null) {
			q.append(" ORDER BY t.displayOrder, t.").append(orderBy);
		}
		
		Query createNamedQuery = getEntityManager().createQuery(q.toString(), TblCourse.class);
		if (categoryId != null && categoryId.intValue() != 0) {
			createNamedQuery.setParameter("catId", categoryId);
		}
		
		if (page != null) {
			Integer recordPerPage = (recordPerPages != null && recordPerPages.length > 0 && recordPerPages[0] != null)
					?recordPerPages[0]:CommonConstants.MAX_RECORD_PER_PAGE;
			createNamedQuery.setFirstResult((page - 1) * recordPerPage);
			createNamedQuery.setMaxResults(recordPerPage);
		}
		return createNamedQuery.getResultList();
	}
	
	/**
	 * Get all courses without pagination.
	 * @param categoryId
	 * @param orderBy
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TblCourse> getListCourseByCat(Long categoryId, String orderBy) {
		StringBuilder q = new StringBuilder();
		q.append("Select t FROM TblCourse t ");
		q.append("JOIN FETCH t.tblCategory t2 ");
		q.append("WHERE t.deleteFlg <> 1 AND t2.deleteFlg <> 1 AND t.helperCourse <> 1 AND t.puslishDate IS NOT NULL");
		if (categoryId != null && categoryId.intValue() != 0) {
			q.append(" AND t2.categoryId = :catId");
		}
		if (orderBy != null) {
			q.append(" ORDER BY t.displayOrder, t.").append(orderBy);
		}
		
		Query createNamedQuery = getEntityManager().createQuery(q.toString(), TblCourse.class);
		if (categoryId != null && categoryId.intValue() != 0) {
			createNamedQuery.setParameter("catId", categoryId);
		}
		return createNamedQuery.getResultList();
	}

	/**
	 * TODO re-implements to fit business logic
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TblCourse> searchTopTen(){
		StringBuilder q = new StringBuilder();
		q.append("SELECT * FROM Tbl_Course t ");
		q.append(" WHERE t.delete_Flg <> 1 AND t.helper_Course <> 1 AND t.puslish_Date IS NOT NULL ");
		q.append(" ORDER BY t.display_Order LIMIT 10");
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), TblCourse.class);
		
        return createNamedQuery.getResultList();
	}
	
	public Long countLessons(Long courseId){
		StringBuilder q = new StringBuilder();
		q.append("select count(*) from tbl_course_lesson t1");
		q.append(" inner join tbl_course_chapter t2 on t1.course_chapter_id = t2.course_chapter_id ");
		q.append(" inner join tbl_course t3 on t3.course_id = t2.course_id where t3.course_id = " + String.valueOf(courseId));
		Query createNamedQuery = getEntityManager().createNativeQuery(q.toString(), Long.class);
		return new Long(createNamedQuery.getFirstResult());
	}
}
