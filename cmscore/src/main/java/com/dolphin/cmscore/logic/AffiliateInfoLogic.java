package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.AffiliateInfoDao;
import com.dolphin.cmscore.dao.AffiliateStatDao;
import com.dolphin.cmscore.dto.AffiliateInfoDto;
import com.dolphin.cmscore.entity.AffiliateInfo;
import com.dolphin.cmscore.entity.AffiliateStat;
import com.dolphin.util.MailSenderUtil;

public class AffiliateInfoLogic implements Serializable {
	private static final long serialVersionUID = 2176466102082133820L;
	
	@EJB
	private AffiliateInfoDao dao;
	
	@EJB
	private AffiliateStatDao statDao;
	
	/**
	 * Get sharer total score 
	 * @param shvId
	 * @return
	 */
	public AffiliateStat getSharerPoint(String shvId){
		return statDao.get(shvId);
	}
	
	/**
	 * When sharer use his score to buy something from app.
	 * @param shvId
	 * @param pointSpent
	 * @return
	 */
	public AffiliateStat usePoint(String shvId, Long pointSpent){
		// Reduce score in affiliate_stat
		AffiliateStat s = statDao.get(shvId);
		if(s == null){
			return s;
		}
		Long realScore = s.getTotalPoint();
		Long scoreAvailable = realScore < pointSpent? realScore : pointSpent;
		Long remainScore = realScore > pointSpent ? realScore - pointSpent : 0;
		s.setTotalPoint(remainScore);
		statDao.edit(s);
		
		// Select rows with scoreSpent number then delete from Affiliate_Info
		// (clear transaction only, take no meaning in calculation) 
		List<AffiliateInfo> infoList = dao.search(shvId, scoreAvailable);
		for(AffiliateInfo e:infoList){
			dao.delete(e);
		}
		return s;
	}
	
	public AffiliateInfoDto get(Long id){
		AffiliateInfo e = dao.get(id);
		AffiliateInfoDto dto = new AffiliateInfoDto();
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	/**
	 * Send email to inform both opener and sharer
	 * @param dto
	 * @return
	 */
	public AffiliateInfoDto create(AffiliateInfoDto dto){
		AffiliateInfo e = new AffiliateInfo();
		AffiliateStat statEnt = statDao.get(dto.getShvId());
		
		try {
			// Check if score is already counted.
			BeanUtils.copyProperties(e, dto);
			Boolean exist = dao.checkExist(e);
			if(exist) {
				return null;
			}
			e = dao.create(e);
			
			// Update total point for sharer
			if(statEnt == null){
				statEnt = new AffiliateStat();
				BeanUtils.copyProperties(statEnt, dto);
				statEnt.setTotalPoint(1L);
				statDao.create(statEnt);
				
			}else{
				Long newScore = statEnt.getTotalPoint() + 1;
				statEnt.setTotalPoint(newScore);
				statDao.edit(statEnt);
			}
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		
		// Update DTO then return 
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		//Implement send mail
		if(dto.getOpenerEmail() != null && !dto.getOpenerEmail().equals("")){
			String openerName = dto.getOpenerName() != null && !dto.getOpenerName().equals("")?dto.getOpenerName():dto.getOpenerEmail();
			String mailContent = "Dear " + openerName + ","
					+ "<br>This email is from Songcanbang.org<br>"
					+ "<br>Thank you for caring our course on songcanbang.org."
					+"<br><br> On behalf of SONGCANBANG.ORG team, <br>Best Regards.";
			String mailSubject = "Thanks message form SONGCANBANG.ORG";
			try {
				MailSenderUtil.sendMail(dto.getOpenerEmail(), mailSubject, mailContent);
			} catch (Throwable e1) {
				e1.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public AffiliateInfoDto update(AffiliateInfoDto dto){
		AffiliateInfo e = new AffiliateInfo();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		e = dao.edit(e);
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	
	public void remove(AffiliateInfoDto dto){
		AffiliateInfo e = new AffiliateInfo();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.remove(e);
	}
	
	public List<AffiliateInfoDto> findAll(){
		List<AffiliateInfo> ret = dao.findAll();
		List<AffiliateInfoDto> dtoList = new ArrayList<AffiliateInfoDto>();
		for(AffiliateInfo e: ret){
			AffiliateInfoDto dto = new AffiliateInfoDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
}
