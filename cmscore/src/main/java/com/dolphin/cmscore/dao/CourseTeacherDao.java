package com.dolphin.cmscore.dao;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.entity.CourseTeacher;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class CourseTeacherDao extends AbstractBaseJpaDao<CourseTeacher> {
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public CourseTeacherDao() {
		super(CourseTeacher.class);
	}
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	public void deleteByCourse(Long courseId){
		Query createNamedQuery = getEntityManager().createNamedQuery("CourseTeacher.deleteByCourse");        
		createNamedQuery.setParameter("courseId", courseId);
		createNamedQuery.executeUpdate();        
	}
	
	public void deleteByTeacher(Long teacherId){
		Query createNamedQuery = getEntityManager().createNamedQuery("CourseTeacher.deleteByTeacher");        
		createNamedQuery.setParameter("teacherId", teacherId);
		createNamedQuery.executeUpdate();        
	}
	
	public List<CourseTeacher> find(String namedQuery, Map<String, Object> paramMap){
		List<CourseTeacher> ret = new ArrayList<CourseTeacher>();
		Query createNamedQuery = getEntityManager().createNamedQuery(namedQuery);
		for(String o: paramMap.keySet()){
			createNamedQuery.setParameter(o, paramMap.get(o));
		}		
		List l = createNamedQuery.getResultList();
		
		for(Object o:l){
			CourseTeacher ct = new CourseTeacher();
			try {
				BeanUtils.copyProperties(ct, o);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
			ret.add(ct);
		}
        return ret;
	}
	
	
}
