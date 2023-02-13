/*
 * TemplateUtil.java
 *
 * Copyright (c) 2009 Chip One Stop, Inc. All right reserved. 
 * This software is the confidential and proprietary information of Chip One Stop, Inc.
 *
 */
package com.dolphin.sqltemplate;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.junit.Test;

/**
 * <PRE>
 * 縲�<BR>
 *
 * Jun 23, 2016 nguyenvannghia 譁ｰ隕丈ｽ懈��
 * </PRE>
 * @author nguyenvannghia
 */
public class TemplateUtil {
    static VelocityEngine ve;
    static VelocityContext context;
//    private static final String PROPERTIES_EXT = ".properties";
    
    static {
    	ve = new VelocityEngine();
    	Properties p = new Properties();
    	p.put("runtime.log.logsystem.class", "org.apache.velocity.runtime.log.SimpleLog4JLogSystem");
    	p.put("runtime.log.logsystem.log4j.category", "velocity");
    	p.put("runtime.log.logsystem.log4j.logger", "velocity");
    	// NOTICE: below line used for absolute template path
    	// p.setProperty("file.resource.loader.path", "d:/tmp/templates");  
    	
    	// below line used for templates on class path    	
    	ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath"); 
    	ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
    	ve.init(p);
    	context = new VelocityContext();
    }
    
    /**
     * Render content from template file path (relative path on classpath)
     * in combined with map instance.
     * @param templateFilePath Path to template file in classpath (relative path with back-slash at beginning)
     * @param map properties for velocity context
     * @return
     */
    public static String fromTemplate(String templateFilePath, Map<String, Object> map){
    	Template template = ve.getTemplate(templateFilePath);
    	StringWriter writer = new StringWriter();
    	for(String k:map.keySet()){
    	  context.put(k,map.get(k));
    	}
    	template.merge(context, writer);
    	return writer.toString();
    }
    
    /**
     * Render content from template file path (relative path on classpath)
     * in combined with properties instance.
     * @param templateFilePath Path to template file in classpath (relative path with back-slash at beginning)
     * @param properties properties for velocity context
     * @return
     */
    public static String fromTemplate(String templateFilePath, Properties properties){
    	Template template = ve.getTemplate(templateFilePath);
    	StringWriter writer = new StringWriter();
    	for(Object o:properties.keySet()){
    		context.put(String.valueOf(o), properties.getProperty(String.valueOf(o)));
    	}    	
    	template.merge(context, writer);
    	return writer.toString();
    }
    
	/**
	 * Render content from template relative class path.
	 * Loading default properties file from the same location and render content with these properties.
	 * @param templateFilePath Path to template file in classpath (relative path with back-slash at beginning)
	 * @return
	 * @throws IOException
	 */
	public static String fromTemplate(String templateFilePath) {
		return fromTemplate(templateFilePath, new HashMap<>());

	}
    
    /**
     * Test method
     * @throws IOException
     */
    @Test
    public void test() throws IOException{
    	String templateContent = fromTemplate("com/c1s/sqltemplate/userweb/user.template");    	
    	System.out.println("Template content: " + templateContent);
    }
}
