package com.dolphin.cmscore.logic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.beanutils.BeanUtils;

import com.dolphin.cmscore.dao.ContactUsDao;
import com.dolphin.cmscore.dto.ContactUsDto;
import com.dolphin.cmscore.entity.ContactUs;
import com.dolphin.util.MailSenderUtil;
import com.dolphin.util.PropertyUtil;

public class ContactUsLogic implements Serializable {
	private static final long serialVersionUID = 2176466102082133820L;
	
	@EJB
	private ContactUsDao dao;
	
	public Integer createList(List<ContactUsDto> teacherList){
		int count = 0;
		for(ContactUsDto dto:teacherList){
			dto = create(dto);
			count++;
		}
		return count;
	}
	
	public Integer updateList(List<ContactUsDto> teacherList){
		int count = 0;
		for(ContactUsDto dto:teacherList){
			dto = update(dto);
			count++;
		}
		return count;
	}
	
	public ContactUsDto get(Long id){
		ContactUs e = dao.get(id);
		ContactUsDto dto = new ContactUsDto();
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		return dto;
	}
	
	public ContactUsDto create(ContactUsDto dto){
		ContactUs e = new ContactUs();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		e = dao.create(e);
		try {
			BeanUtils.copyProperties(dto, e);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		String name = dto.getContactName() != null && !dto.getContactName().equals("")?dto.getContactName():dto.getContactEmail();
		String mailContent = "Dear " + name + ","
				+ "<br>This email was sent to you beacause you would like to contact Songcanbang.org<br>"
				+ "<br>We already have got your message and will inform you soon in several working days."
				+ "<br>Please wait for our helpdesk team examine and answer your message!\n\n"
				+"<br><br> On behalf of SONGCANBANG.ORG team, <br>Best Regards.";
		String mailSubject = "Receipt contact message - SONGCANBANG.ORG";
		try {
			MailSenderUtil.sendMail(dto.getContactEmail(), mailSubject, mailContent);
		} catch (Throwable e1) {
			e1.printStackTrace();
		}
		
		return dto;
	}
	
	public ContactUsDto update(ContactUsDto dto){
		ContactUs e = new ContactUs();
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
	
	
	public void remove(ContactUsDto dto){
		ContactUs e = new ContactUs();
		try {
			BeanUtils.copyProperties(e, dto);
		} catch (IllegalAccessException | InvocationTargetException e1) {
			e1.printStackTrace();
		}
		dao.remove(e);
	}
	
	public List<ContactUsDto> findAll(){
		List<ContactUs> ret = dao.findAll();
		List<ContactUsDto> dtoList = new ArrayList<ContactUsDto>();
		for(ContactUs e: ret){
			ContactUsDto dto = new ContactUsDto();
			try {
				BeanUtils.copyProperties(dto, e);
			} catch (IllegalAccessException | InvocationTargetException e1) {
				e1.printStackTrace();
			}
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	public List<ContactUsDto> searchTopTen(){
		List<ContactUs> ret = dao.searchTopTen();
		List<ContactUsDto> dtoList = new ArrayList<ContactUsDto>();
		for(ContactUs e: ret){
			ContactUsDto dto = new ContactUsDto();
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
