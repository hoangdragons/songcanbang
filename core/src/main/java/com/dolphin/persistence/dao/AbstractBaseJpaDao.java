package com.dolphin.persistence.dao;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.annotation.SqlTemplateInfo;
import com.dolphin.persistence.entity.BaseEntity;

/**
 * Data access class to create, update. delete, get, list, load page of users.
 */
public abstract class AbstractBaseJpaDao<T extends BaseEntity> {
	
	protected static final String SQL_TEMPLATE_FILE_PATH = "com/dolphin/sqltemplate/";
	
	protected static final String SQL_TEMPLATE_FILE_SUFFIX = ".template";
	
    private Class<T> entityClass;
    
    public AbstractBaseJpaDao() {
        
    }

    public AbstractBaseJpaDao(final Class<T> entityClass) {
        this.entityClass = entityClass;
    }

	protected abstract EntityManager getEntityManager();

    /**
     * Create entity
     * @param entity
     */
    public T create(T entity) {
    	entity.setDeleteFlg(new Integer(0));
		getEntityManager().persist(entity);
		return entity;
    }

    /**
     * Edit entity
     * @param entity
     */
    public T edit(T entity) {
    	entity.setDeleteFlg(new Integer(0));
        return getEntityManager().merge(entity);
    }

    /**
     * Remove entity
     * @param entity
     */
    public void remove(T entity) {
    	entity.setDeleteFlg(new Integer(1));
    	getEntityManager().merge(entity);
    }

    /**
     * Get an entity
     * @param id
     * @return
     */
    public T get(Object id) {
        return getEntityManager().find(entityClass, id);
    }

    /**
     * Find all entities
     * @return
     */
	public List<T> findAll() {
    	TypedQuery<T> query =
    			 getEntityManager().createQuery("SELECT t FROM " + entityClass.getSimpleName()+" t WHERE t.deleteFlg <> 1", entityClass);
    	List<T> ret = query.getResultList();       
        return ret;
    }

    /**
     * Find all entities in range (row number)
     * @param range Contain 02 int values for start and end range
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<T> findRange(int[] range) {
      CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
	  CriteriaQuery<T> cq = cb.createQuery(entityClass);
	  
	  Root<T> r = cq.from(entityClass);
	  ParameterExpression<Integer> p = cb.parameter(Integer.class);
	  
	  cq.select(r).where(cb.lt(r.get("deleteFlg"), p));

      Query q = getEntityManager().createQuery(cq);
      q.setParameter(p, 1);
      q.setMaxResults(range[1] - range[0]);
      q.setFirstResult(range[0]);
    	
      return q.getResultList();
    }
    
    /**
     * Find entity in range with specific query.
     * @param range Contain 02 int values for start and end range
     * @param query predefined query
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<T> findRangeByCriteria(int[] range, CriteriaQuery<T> query) {
        Query q = getEntityManager().createQuery(query);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }
    
    @SuppressWarnings("unchecked")
	public List<T> findRangeByNativeQuery(int[] range, String query) {
        Query q = getEntityManager().createQuery(query);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }
    
    /**
     * Get CriteriaBuilder
     * @return
     */
    public CriteriaBuilder getCriteriaBuilder() {
        return getEntityManager().getCriteriaBuilder();
    }
    
    /**
     * Count number of row
     * @return
     */
    public int count() {
        CriteriaQuery<Object> cq = getEntityManager().getCriteriaBuilder().createQuery();
        javax.persistence.criteria.Root<T> rt = cq.from(entityClass);
        Expression<Long> exp = getEntityManager().getCriteriaBuilder().count(rt);
        cq.select(exp);
        TypedQuery<Object> q = getEntityManager().createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }
    
    
    /**
     * @param method
     * @return
     */
    public String getSQLTemplateFilePath(Method m){
    	String ret = new String();
    	try {
			SqlTemplateInfo a = m.getAnnotation(SqlTemplateInfo.class);			
			ret = SQL_TEMPLATE_FILE_PATH + a.folder() + File.separator + a.file() + SQL_TEMPLATE_FILE_SUFFIX;		
		} catch (SecurityException e) {
			e.printStackTrace();
		}
    	return ret;
    }
    
	public Object convertEntity2Dto(T ent, Class<?> dtoClass) {
		Object dObj = null;
		try{
	    	dObj = dtoClass.newInstance();
			BeanUtils.copyProperties(dObj, ent);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
    	
		return dObj;
    }
  
    @SuppressWarnings("unchecked")
	public T convertDto2Entity(Object dto){
    	T eObj = null;
    	try{
	    	String dtoClassName = dto.getClass().getCanonicalName();
	    	String entClassName =  dtoClassName.substring(0, dtoClassName.length() - 3);
	    	Class<T> entClass = (Class<T>)Class.forName(entClassName);	    	
	    	eObj = entClass.newInstance();
			BeanUtils.copyProperties(eObj, dto);
    	}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return eObj;
    }
    
    /**
     * Physically delete
     * @param entity
     */
    public void delete(T entity) {
    	getEntityManager().remove(entity);
    }	
}