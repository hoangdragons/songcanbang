package com.dolphin.idm.ws;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Path;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.apache.commons.lang.StringUtils;
import org.hibernate.validator.internal.engine.path.PathImpl;

@Provider
public class ConstraintViolationExceptionMapper implements ExceptionMapper<ConstraintViolationException> {

	@Override
	public Response toResponse(ConstraintViolationException exception) {
		Set<ConstraintViolation<?>> set = exception.getConstraintViolations();
		
		List<String> errList = new ArrayList<String>();
		for(ConstraintViolation<?> c:set){
			Path p = c.getPropertyPath();
			String prop = ((PathImpl)p).getLeafNode().asString();
			// Replace all colon character to avoid JSON.parse() error. 
			errList.add("{\"field\":\"" + prop +"\",\"message\":\"" + c.getMessage().replaceAll(":", ";") + "\"}");
		}
		String ret = StringUtils.join(errList, ",");
		return Response
                .status(400)
                .entity("[" + ret +"]")
                .build();
	}

}
