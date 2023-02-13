package com.dolphin.idm.dao;

import java.lang.reflect.Method;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.annotation.SqlTemplateInfo;
import com.dolphin.idm.entity.TblUser;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;
import com.dolphin.sqltemplate.TemplateUtil;

@Stateless
public class UserDao extends AbstractBaseJpaDao<TblUser> {	
	
	public UserDao() {
        super(TblUser.class);
    }
	
	@PersistenceContext(unitName="dolphin.idm")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    @SuppressWarnings("unchecked")
	public TblUser getUserByEmail(String email)
    {
    	if(email == null || "".equals(email))
    	{
    		return null;
    	}
        Query createNamedQuery = getEntityManager().createNamedQuery("TblUser.findByEmail");        
        createNamedQuery.setParameter("email", email);
        List<TblUser> retList = createNamedQuery.getResultList();        
        return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    
    @SuppressWarnings("unchecked")
	public TblUser getUserByFacebookId(String facebookId)
    {
        Query createNamedQuery = getEntityManager().createNamedQuery("TblUser.findByFacebookId");        
        createNamedQuery.setParameter("facebookId", facebookId);
        createNamedQuery.setMaxResults(1);
        List<TblUser> retList = createNamedQuery.getResultList();        
        return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    
    @SuppressWarnings("unchecked")
   	public TblUser getUserByGoogleId(String googleId)
    {
       Query createNamedQuery = getEntityManager().createNamedQuery("TblUser.findByGoogleId");        
       createNamedQuery.setParameter("googleId", googleId);
       createNamedQuery.setMaxResults(1);
       List<TblUser> retList = createNamedQuery.getResultList();        
       return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    
    @SuppressWarnings("unchecked")
	public List<TblUser> search(String keyword)
    {
        Query createNamedQuery = getEntityManager().createNativeQuery(
        		"SELECT t.avata_url, t.birthday, t.user_Id, t.email, t.full_Name, t.sex, t.occupation, t.PASSWORD_TOKEN "
        	+ " , t.created_at, t.delete_flg, t.created_by, t.updated_at, t.updated_by, t.display_order, t.cover "
        	+ " , 0 AS cccd,0 AS cmtnd,  '' AS facebook_Id,0 AS telephone, 1 AS group_id "
        	+ " ,'' AS MAIN_ADDRESS, 0 AS mobile"
        	+ " ,'' AS lang_id, '' AS password,'' as login_name, '' AS  google_Id, '' AS twitter_Id"
			+ " FROM Tbl_User t WHERE t.delete_Flg <> 1 AND ("
			+ " UPPER(t.email) LIKE UPPER(:keyword) "
			+ " OR to_char(t.mobile,'999999999') LIKE :keyword "
			+ " OR UPPER(t.telephone) LIKE UPPER(:keyword) "
			+ " OR UPPER(t.google_Id) LIKE UPPER(:keyword) "
			+ " OR UPPER(t.facebook_Id) LIKE UPPER(:keyword) "
			+ " OR UPPER(t.twitter_Id) LIKE UPPER(:keyword) "
			+ " OR UPPER(t.MAIN_ADDRESS) LIKE UPPER(:keyword) "
			+ " OR UPPER(t.full_Name) LIKE :keyword "
			+ " OR UPPER(t.login_Name) LIKE :keyword )"
			, TblUser.class);        
        createNamedQuery.setParameter("keyword", "%"+keyword.toUpperCase()+"%");
        return createNamedQuery.getResultList();        
    }
    /**
     * @param loginName
     * @return
     */    
    @SuppressWarnings("unchecked")
	@SqlTemplateInfo(folder="user", file="getUserByLoginName")
    public TblUser getUserByLoginName(String loginName)
    {	
    	if(loginName == null || "".equals(loginName))
    	{
    		return null;
    	}
    	Method m = null;
		try {
			m = getClass().getMethod("getUserByLoginName", String.class);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
    	String templateFilePath = getSQLTemplateFilePath(m);
		String sql = TemplateUtil.fromTemplate(templateFilePath);
		Query createNamedQuery = getEntityManager().createQuery(sql);
		createNamedQuery.setParameter("loginName", loginName);
		List<TblUser> retList = createNamedQuery.getResultList();        
	    return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    @SuppressWarnings("unchecked")
   	public TblUser findByPasswordToken(String email, String passwordToken)
   {
       Query createNamedQuery = getEntityManager().createNamedQuery("TblUser.findByPasswordToken");        
       createNamedQuery.setParameter("email", email);
       createNamedQuery.setParameter("passwordToken", passwordToken);
       
       List<TblUser> retList = createNamedQuery.getResultList();        
       return (retList != null && retList.size() > 0)?retList.get(0):null;
   }
//    
//    /**
//     * 
//     * <PRE>
//     * 。Search user by fullName
//     * </PRE>
//     * @param fullName a part of user full name use to search.
//     * @return {@link List<User>}
//     */
//    public List<TblUser> findUserByFullName(String fullName) {
//        fullName = "%" + escapeWildCard(fullName) + "%";
//        return tblUserRepository.findUserByFullName(fullName);
//    }
//    
//    /**
//     * 
//     * <PRE>
//     * 。TODO
//     * </PRE>
//     * @param fullName
//     * @return
//     */
//	private String escapeWildCard(String fullName) {
//        // TODO Auto-generated method stub
//        return fullName;
//    }
}