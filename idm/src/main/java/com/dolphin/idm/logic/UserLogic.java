package com.dolphin.idm.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.inject.Named;
import javax.transaction.Transactional;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.jboss.logging.Logger;

import com.dolphin.annotation.qualifier.Delete;
import com.dolphin.annotation.qualifier.New;
import com.dolphin.annotation.qualifier.Update;
import com.dolphin.idm.dao.DAOHelper;
import com.dolphin.idm.dao.RegisterUserDao;
import com.dolphin.idm.dao.UserDao;
import com.dolphin.idm.dao.UserRoleDao;
import com.dolphin.idm.entity.RegisterUser;
import com.dolphin.idm.entity.TblUser;
import com.dolphin.idm.event.UserEvent;
import com.dolphin.persistence.dto.UserDto;
import com.dolphin.security.digest.SHA256PasswordEncoder;
import com.dolphin.util.MailSenderUtil;
import com.dolphin.util.PropertyUtil;

@Named("userLogic")
@RequestScoped
public class UserLogic implements Serializable {
	private static final long serialVersionUID = 9125324796843304495L;
	public static final String USER_ROLE_ID_HARD_CODE = "USER";
	
	private static final Logger logger = Logger.getLogger(UserLogic.class);

	@Inject
	@Update
	Event<UserEvent> userUpdateEventManager;

	@Inject
	@New
	Event<UserEvent> userCreationEventManager;
	
	@Inject
	@Delete
	Event<UserEvent> userDeleteEventManager;

	@EJB
	UserDao userDao;
	
	@EJB
	private RegisterUserDao registerUserDao;
	
	
	@EJB
	UserRoleDao userRoleDao;
	
	String encPasswd = null;
	SHA256PasswordEncoder enc = new SHA256PasswordEncoder(true);
	
	DAOHelper<UserDto, TblUser> helper = new DAOHelper<UserDto, TblUser>();
	
	DAOHelper<UserDto, RegisterUser> regHelper = new DAOHelper<UserDto, RegisterUser>();
	
	public UserDto getUserByEmail(String email) {
		TblUser u = userDao.getUserByEmail(email);
		return u == null? null:helper.copyEntity2Dto(new UserDto(), u);
	}

	public UserDto getUserByLoginName(String loginName) {
		TblUser u = userDao.getUserByLoginName(loginName);
		return  u == null? null:helper.copyEntity2Dto(new UserDto(), u);
	}
	
	public UserDto getRegUserByEmail(String email) {
		RegisterUser u = registerUserDao.getUserByEmail(email);
		
		if(u != null){
			UserDto dto = null;
			try {
				dto = new UserDto();
				BeanUtils.copyProperties(dto, u);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			return dto;
		}else{
			return null;
		}
		
	}

	public UserDto getRegUserByLoginName(String loginName) {
		RegisterUser u = registerUserDao.getRegUserByLoginName(loginName);
		if(u != null){
			UserDto dto = null;
			try {
				dto = new UserDto();
				BeanUtils.copyProperties(dto, u);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			return dto;
		}else{
			return null;
		}
	}

	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserDto create(UserDto dto) {
		UserDto ret = null;
		if(!StringUtils.isEmpty(dto.getPassword())){
			encPasswd = enc.encodePassword(dto.getPassword(), null);
			dto.setPassword(encPasswd);
		}
		// Validate date from screen to get input value
//		Date d = new Date();
//		dto.setBirthday(d);
		TblUser u1 = null;
		TblUser u2 = null;
		try {
			u1 = userDao.getUserByEmail(dto.getEmail());
			u2 = userDao.getUserByLoginName(dto.getLoginName());
		} catch (Exception e) {
			// Ignore
		}
		if(u1 != null || u2!=null)
		{
			System.out.println("User with email: "+dto.getEmail()+" or loginName: "+dto.getLoginName()+" already registered.");
			return ret;
		}else{
			TblUser u = userDao.create(helper.copyDto2Entity(new TblUser(), dto));
			
			// fire event for demo 
			UserEvent evt = new UserEvent();
			try {
				BeanUtils.copyProperties(evt, u);
				BeanUtils.copyProperties(ret, u);
				userCreationEventManager.fire(evt);
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
			return ret;
		}
	}
	
	public Boolean isExists(UserDto dto){
		TblUser u1 = null;
		TblUser u2 = null;
		try {
			u1 = userDao.getUserByEmail(dto.getEmail());
			u2 = userDao.getUserByLoginName(dto.getLoginName());
		} catch (Exception e) {
			// Ignore
		}
		if(u1 != null || u2!=null)
		{
			System.out.println("User with email: "+dto.getEmail()+" or loginName: "+dto.getLoginName()+" already registered.");
			return true;
		} else{
			return false;
		}
		
	}
	
	public Boolean isRegisterExists(UserDto dto){
		RegisterUser u1 = null;
		RegisterUser u2 = null;
		try {
			u1 = registerUserDao.getUserByEmail(dto.getEmail());
			u2 = registerUserDao.getRegUserByLoginName(dto.getLoginName());
		} catch (Exception e) {
			// Ignore
		}
		if(u1 != null || u2!=null)
		{
			System.out.println("User with email: "+dto.getEmail()+" or loginName: "+dto.getLoginName()+" already registered.");
			return true;
		} else{
			return false;
		}
		
	}
	
	
	
	
	
	public UserDto syncFacebookAccount(UserDto dto) {
		logger.info("Start synchronizing facebook account ");
		// 1. Check if account exist 
		System.out.println("-------------------- Sync Facebook Account: lookup account " + dto.getFacebookId());
		TblUser u = userDao.getUserByFacebookId(dto.getFacebookId());
		// 2. Update if exist
		if(u != null && u.getUserId() != null && u.getUserId().longValue() >0){
			System.out.println("-------------------- Sync Facebook Account: User exist " + u);
			dto.setUserId(u.getUserId());
			dto = edit(dto);
		}else{
			System.out.println("-------------------- Sync Facebook Account: User not exist " + u);
			// 3. Create new if not exist
			dto = create(dto);
		}
		logger.info("End synchronizing facebook account ");
		return dto;
	}

	public UserDto syncGoogleAccount(UserDto dto) {
		logger.info("Start synchronizing google account ");
		// 1. Check if account exist 
		TblUser u = userDao.getUserByGoogleId(dto.getGoogleId());
		// 2. Update if exist
		if(u != null && u.getUserId() != null && u.getUserId().longValue() >0){
			dto.setUserId(u.getUserId());
			dto = edit(dto);
		}else{
			// 3. Create new if not exist
			dto = create(dto);
		}
		logger.info("End synchronizing google account ");
		return dto;
	}
	/**
	 * Edit entity
	 * 
	 * @param entity
	 * @throws Exception
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserDto edit(UserDto dto) {
		if(!StringUtils.isEmpty(dto.getPassword())){
			encPasswd = enc.encodePassword(dto.getPassword(), null);
			dto.setPassword(encPasswd);
		}
		// update user
		TblUser ret = userDao.edit(helper.copyDto2Entity(new TblUser(), dto));
		// fire event for demo 
		UserEvent evt = new UserEvent();
		try {
			BeanUtils.copyProperties(evt, ret);
			BeanUtils.copyProperties(dto, ret);
			userUpdateEventManager.fire(evt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserDto updateProfile(UserDto dto) {
		TblUser u = userDao.getUserByLoginName(dto.getLoginName());
		if(u== null){
			return null;
		}
		u.setFullName(dto.getFullName());
		u.setTelephone(dto.getTelephone());
		try {
			BeanUtils.copyProperties(dto,u);
			dto = edit(dto);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	/**
	 * Edit entity
	 * 
	 * @param entity
	 * @throws Exception
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserDto updatePassword(UserDto dto) {
		String newPass = enc.encodePassword(dto.getPassword(), null);
		try {
			UserDto u  = getUserByLoginName(dto.getLoginName());
			if(u == null){
				return u;
			}
			BeanUtils.copyProperties(dto, u);
			dto.setPassword(newPass);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		dto = edit(dto);
		return dto;
	}
	
	/**
	 * Remove entity
	 * 
	 * @param entity
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public void remove(UserDto dto) {
		
		// remove entity
		userDao.remove(helper.copyDto2Entity(new TblUser(), dto));
		
		// fire event for demo 
		UserEvent evt = new UserEvent();
		try {
			BeanUtils.copyProperties(evt, dto);
			userDeleteEventManager.fire(evt);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Get an entity
	 * 
	 * @param id
	 * @return
	 */
	public UserDto get(Object id) {
		return helper.copyEntity2Dto(new UserDto(), userDao.get(id)) ;
	}

	
	/**
	 * Find all user return a list of user dto
	 * @return
	 */
	public List<UserDto> findAll() {		
		List<TblUser> listUser = userDao.findAll();
		List<UserDto> listDto = new ArrayList<UserDto>();
		for(TblUser u:listUser){
			UserDto dto = helper.copyEntity2Dto(new UserDto(), u);
			listDto.add(dto);
		}
		return listDto;
	}
	
	public List<UserDto> search(String keyword) {		
		List<TblUser> listUser = userDao.search(keyword);
		List<UserDto> listDto = new ArrayList<UserDto>();
		for(TblUser u:listUser){
			UserDto dto = helper.copyEntity2Dto(new UserDto(), u);
			listDto.add(dto);
		}
		return listDto;
	}
	
	 /**
     * 
     * <PRE>
     * ???get total user by limit and offset
     * </PRE>
     * @param limit record per page
     * @param offset first record
     * @return List({@link TblUserDto}
     */
    public List<UserDto> loadUserWithPagination(int limit, int offset) {
        int[] range = {offset, limit + offset};
        List<UserDto> listDto = new ArrayList<UserDto>();
        List<TblUser> listUser = userDao.findRange(range);
        for (TblUser u : listUser) {
            UserDto dto = helper.copyEntity2Dto(new UserDto(), u);
            listDto.add(dto);
        }
        return listDto;
    }
    
    public int count(){
    	return userDao.count();
    }
    
    /**
	 * Register new user.
	 * @param dto
	 * @return
	 */
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserDto register(UserDto dto) {
		dto.setRegisterToken(UUID.randomUUID().toString());
		RegisterUser u = registerUserDao.create(regHelper.copyDto2Entity(new RegisterUser(), dto));
		PropertyUtil prop = new PropertyUtil();
		String mailContent =  "K??nh g???i:" + dto.getFullName() + ","
				+ "<br> B???n nh???n ???????c th?? n??y v?? b??n ???? ????ng k?? ng?????i d??ng tr??n website: <br>"
				+"<a href=\"http://dkonline.ehealth.gov.vn\">http://dkonline.ehealth.gov.vn</a>"
				+ "<br>"
				+ " H??y k??ch chu???t v??o li??n k???t sau ????? k??ch ho???t t??i kho???n v?? b???t ?????u s??? d???ng d???ch v??? ????ng k?? kh??m b???nh tr???c tuy???n!\n\n"
				+ "<a href='" + prop.get("user.register.confirm.service.url") + dto.getEmail() + "/" + dto.getRegisterToken() + "' target='_BLANK'>"
				+ prop.get("user.register.confirm.service.url") + dto.getEmail() + "/" + dto.getRegisterToken()
				+ "</a>"
				+ "<br>N???u c?? v???n ????? v???i li??n k???t h??y copy li??n k???t tr??n v?? d??n v??o thanh ??i???u h?????ng c???a tr??nh duy???t:\n<br/>"
				+"<br><br>Ban qu???n l?? h??? th???ng xin ch??n th??nh c???m ??n b???n ???? tham gia.";
		String mailSubject = "????ng k?? th??nh vi??n dkonline.ehealth.gov.vn - Email k??ch ho???t t??i kho???n ng?????i d??ng";
		// Fire event for demo 
		UserEvent evt = new UserEvent();
		try {
			MailSenderUtil.sendMail(dto.getEmail(), mailSubject, mailContent);
			BeanUtils.copyProperties(evt, u);
			BeanUtils.copyProperties(dto, u);
			userCreationEventManager.fire(evt);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Transactional(value = Transactional.TxType.REQUIRED)
	public void deleteRegUser(RegisterUser regUser){
		RegisterUser u = registerUserDao.getRegUserByLoginName(regUser.getLoginName());
		registerUserDao.delete(u);
	}
	
	@Transactional(value = Transactional.TxType.REQUIRED)
	public UserDto validate(String email, String token) {
		// Check exist register user with email and token
		RegisterUser regUser = registerUserDao.findByRegisterToken(email, token);
		UserDto dto = new UserDto();
		if(regUser != null){
			// Copy register user to production area.
			try {
				//
				BeanUtils.copyProperties(dto, regUser);	
				dto.setUserId(null);
				dto = create(dto);
				System.out.println("===========================  ---  ==================================");
				//registerUserDao.delete(regUser);
				String mailContent =  "K??nh g???i:" + dto.getFullName() + ","
						+ "<br> B???n ???? k??ch ho???t th??nh c??ng t??i kho???n "+dto.getLoginName()+" tr??n website: <br>"
						+"<a href=\"http://dkonline.ehealth.gov.vn\">http://dkonline.ehealth.gov.vn</a>"
						+ "<br>"
						+ " T??? b??y gi??? b???n ???? c?? th??? s??? d???ng d???ch v??? ????ng k?? kh??m b???nh tr???c tuy???n t??? b???nh vi???n K!\n\n"
						+ "<br> <a href='http://dkonline.ehealth.gov.vn' target='_BLANK'>"
						+"http://dkonline.ehealth.gov.vn"
						+ "</a>"
						+"<br><br>Ban qu???n l?? h??? th???ng xin ch??n th??nh c???m ??n b???n.";
				String mailSubject = "????ng k?? th??nh vi??n dkonline.ehealth.gov.vn - Email k??ch ho???t t??i kho???n ng?????i d??ng";
				// Fire event for demo 
				MailSenderUtil.sendMail(dto.getEmail(), mailSubject, mailContent);
			} catch (Throwable e) {
				e.printStackTrace();
			}
			
		}
		return dto;
	}
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
    public UserDto requestResetPasswd(UserDto d) {
		TblUser u = userDao.getUserByEmail(d.getEmail());
		if(u == null){
			return null;
		}
		u.setPasswordToken(UUID.randomUUID().toString());
		u = userDao.edit(u);
		
		PropertyUtil prop = new PropertyUtil();
		String mailContent =  "K??nh g???i:" + u.getEmail() + ","
				+ "<br> B???n nh???n ???????c th?? n??y v?? b??n ???? x??c nh???n qu??n m???t kh???u tr??n trang: <br>"
				+"<a href=\"http://dkonline.ehealth.gov.vn\">http://dkonline.ehealth.gov.vn</a>"
				+ "<br><br>"
				+ " H??y k??ch chu???t v??o li??n k???t sau ????? l???y l???i m???t kh???u\n\n <br>"
				+ "<a href='" + prop.get("user.reset.password.service.url") + u.getEmail() + "/" + u.getPasswordToken() + "' target='_BLANK'>"
				+ prop.get("user.reset.password.service.url") + u.getEmail() + "/" + u.getPasswordToken()
				+ "</a>"
				+ "<br>N???u c?? v???n ????? v???i li??n k???t h??y copy li??n k???t tr??n v?? d??n v??o thanh ??i???u h?????ng c???a tr??nh duy???t:\n<br/>"
				+"<br><br>Ban qu???n l?? h??? th???ng xin ch??n th??nh c???m ??n b???n ???? tham gia.";
		String mailSubject = "B???NH VI???N K - Th??ng b??o y??u c???u thay ?????i m???t kh???u";
		try {
			MailSenderUtil.sendMail(u.getEmail(), mailSubject, mailContent);
			BeanUtils.copyProperties(d, u);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return d;
	}
	
	@Transactional(value = Transactional.TxType.REQUIRES_NEW)
	public UserDto resetPassword(String email, String token) {
		// Check exist register user with email and token
		TblUser user = userDao.findByPasswordToken(email, token);
		UserDto dto = new UserDto();
		if(user != null){
			// Copy register user to production area.
			try {
				BeanUtils.copyProperties(dto, user);		
				dto.setPassword(enc.encodePassword("123456789@0", null));
				dto = edit(dto);
				String mailContent =  "K??nh g???i:" + dto.getFullName() + ","
						+ "<br> M???t kh???u c???a account "+dto.getLoginName()+" tr??n website: <br>"
						+"<a href=\"http://dkonline.ehealth.gov.vn\">http://dkonline.ehealth.gov.vn</a>"
						+ "<br>"
						+" ???? ???????c thi???t l???p v??? m???c ?????nh l??: '123456789@0'."
						+" H??y truy c???p trang ch??? v?? ?????i m???t kh???u theo ?? b???n c??ng s???m c??ng t???t. \n\n"
						+ "<br> <a href='http://dkonline.ehealth.gov.vn' target='_BLANK'>"
						+"http://dkonline.ehealth.gov.vn"
						+ "</a>"
						+"<br><br>Ban qu???n l?? h??? th???ng xin ch??n th??nh c???m ??n b???n.";
				String mailSubject = "B???NH VI???N K - Thi???t l???p l???i m???t kh???u m???c ?????nh th??nh c??ng";
				// Fire event for demo 
				MailSenderUtil.sendMail(dto.getEmail(), mailSubject, mailContent);
			} catch (Throwable e) {
				e.printStackTrace();
			}
			
		}
		return dto;
	}
}