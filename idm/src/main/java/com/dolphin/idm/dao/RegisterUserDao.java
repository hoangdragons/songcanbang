package com.dolphin.idm.dao;

import java.lang.reflect.Method;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.annotation.SqlTemplateInfo;
import com.dolphin.idm.entity.RegisterUser;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;
import com.dolphin.sqltemplate.TemplateUtil;

@Stateless
public class RegisterUserDao extends AbstractBaseJpaDao<RegisterUser> {	
	
	public RegisterUserDao() {
        super(RegisterUser.class);
    }
	
	@PersistenceContext(unitName="dolphin.idm")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    @SuppressWarnings("unchecked")
	public RegisterUser getUserByEmail(String email)
    {
        Query createNamedQuery = getEntityManager().createNamedQuery("RegisterUser.findByEmail");        
        createNamedQuery.setParameter("email", email);
        List<RegisterUser> retList = createNamedQuery.getResultList();        
        return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    
    @SuppressWarnings("unchecked")
	public RegisterUser findByRegisterToken(String email, String registerToken)
    {
        Query createNamedQuery = getEntityManager().createNamedQuery("RegisterUser.findByRegisterToken");        
        createNamedQuery.setParameter("email", email);
        createNamedQuery.setParameter("registerToken", registerToken);
        
        List<RegisterUser> retList = createNamedQuery.getResultList();        
        return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    @SuppressWarnings("unchecked")
	public RegisterUser getUserByFacebookId(String facebookId)
    {
        Query createNamedQuery = getEntityManager().createNamedQuery("RegisterUser.findByFacebookId");        
        createNamedQuery.setParameter("facebookId", facebookId);
        createNamedQuery.setMaxResults(1);
        List<RegisterUser> retList = createNamedQuery.getResultList();        
        return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    
    @SuppressWarnings("unchecked")
   	public RegisterUser getUserByGoogleId(String googleId)
    {
       Query createNamedQuery = getEntityManager().createNamedQuery("RegisterUser.findByGoogleId");        
       createNamedQuery.setParameter("googleId", googleId);
       createNamedQuery.setMaxResults(1);
       List<RegisterUser> retList = createNamedQuery.getResultList();        
       return (retList != null && retList.size() > 0)?retList.get(0):null;
    }
    
    @SuppressWarnings("unchecked")
	public List<RegisterUser> search(String keyword)
    {
        Query createNamedQuery = getEntityManager().createNativeQuery(
        		"SELECT t.avata_url, t.birthday, t.user_Id, t.email, t.full_Name, t.sex, t.occupation "
        	+ " , t.created_at, t.delete_flg, t.created_by, t.updated_at, t.updated_by, t.cover "
        	+ " , 0 AS cccd,0 AS cmtnd,  '' AS facebook_Id,0 AS telephone, 1 AS group_id "
        	+ " ,'' AS MAIN_ADDRESS, 0 AS mobile"
        	+ " ,'' AS lang_id, '' AS password,'' as login_name, '' AS  google_Id, '' AS twitter_Id"
			+ " FROM Tbl_User t WHERE UPPER(t.email) LIKE :keyword "
			+ " OR UPPER(t.full_Name) LIKE :keyword OR UPPER(t.login_Name) LIKE :keyword AND t.delete_Flg <> 1", RegisterUser.class);        
        createNamedQuery.setParameter("keyword", "%"+keyword.toUpperCase()+"%");
        return createNamedQuery.getResultList();        
    }
    /**
     * @param loginName
     * @return
     */    
    @SuppressWarnings("unchecked")
	@SqlTemplateInfo(folder="user", file="getRegUserByLoginName")
    public RegisterUser getRegUserByLoginName(String loginName)
    {	
    	Method m = null;
		try {
			m = getClass().getMethod("getRegUserByLoginName", String.class);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
    	String templateFilePath = getSQLTemplateFilePath(m);
		String sql = TemplateUtil.fromTemplate(templateFilePath);
		Query createNamedQuery = getEntityManager().createQuery(sql);
		createNamedQuery.setParameter("loginName", loginName);
		List<RegisterUser> retList = createNamedQuery.getResultList();
		if(retList != null && retList.size() > 0){
			return retList.get(0);
		}else{
			return null;
		}
    }
}