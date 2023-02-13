package com.dolphin.cmscore.ws;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.CouponDetailDto;
import com.dolphin.cmscore.dto.CouponMasterDto;
import com.dolphin.cmscore.logic.CouponDetailLogic;
import com.dolphin.cmscore.logic.CouponMasterLogic;
import com.dolphin.security.filter.JwtTokenHelper;
import com.dolphin.ws.WSHelper;

@Path("/coupon")
@Stateless
public class CouponWs {
	@Context
	private HttpServletRequest httpRequest;
	
	JwtTokenHelper tokenHelper = new JwtTokenHelper();
	
	@Inject
	private CouponMasterLogic logic;
	
	@Inject
	private CouponDetailLogic detailLogic;
	
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public CouponMasterDto get(@PathParam("id") Long id){
		return logic.get(id);
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public CouponMasterDto create(CouponMasterDto dto){
		Long loginId = WSHelper.getLoginId(httpRequest);
		if(loginId == null || loginId.longValue() <=0){
			return null;
		}
		WSHelper.setCreateBy(dto, httpRequest);
		return logic.create(dto);
	}
	
	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRES_NEW,rollbackOn=Throwable.class)
	public CouponMasterDto update(CouponMasterDto dto){
		Long loginId = WSHelper.getLoginId(httpRequest);
		if(loginId == null || loginId.longValue() <=0){
			return null;
		}
		WSHelper.setUpdateBy(dto, httpRequest);
		return logic.update(dto);
	}
	
	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void delete(@PathParam("id") Long id){
		CouponMasterDto dto = logic.get(id);
		logic.remove(dto);
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<CouponMasterDto> findAll(){
		return logic.findAll();
	}
	
	@Path("/import-csv")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public List<CouponDetailDto> importCSV(List<CouponDetailDto> dtoList){
		List<CouponDetailDto> ret = new ArrayList<CouponDetailDto>();
		Long loginId = WSHelper.getLoginId(httpRequest);
		
		if(loginId == null || loginId.longValue() <=0){
			return null;
		}
		
		for(CouponDetailDto dto:dtoList){
			if(logic.existType(dto.getCouponType()) 
					&& !detailLogic.exist(dto.getCouponType(), dto.getCode())){
				WSHelper.setCreateBy(dto, httpRequest);
				ret.add(detailLogic.create(dto));
			}
		}
		
		return ret;
	}
	
	@Path("/load-definition/{ccode}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public CouponMasterDto loadCouponDefinition(@PathParam("ccode")String ccode){
		CouponDetailDto detailDto = detailLogic.getByCouponCode(ccode);
		CouponMasterDto dto = logic.getByCouponType(detailDto.getCouponType());
		return dto;
	}
	
}