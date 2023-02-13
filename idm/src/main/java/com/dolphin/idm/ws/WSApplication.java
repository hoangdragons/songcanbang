package com.dolphin.idm.ws;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import com.dolphin.ws.FileUploadService;

@ApplicationPath("/rest-api")
public class WSApplication extends Application{

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        resources.add(LoginWs.class);
        resources.add(UserWs.class);
        resources.add(RoleWs.class);
        resources.add(FunctionWs.class);
        resources.add(ConstraintViolationExceptionMapper.class);
        resources.add(FileUploadService.class);
        return resources;
    }
    
    @Override
    public Set<Object> getSingletons() {
        final Set<Object> instances = new HashSet<Object>();
        return instances;
    }
}
