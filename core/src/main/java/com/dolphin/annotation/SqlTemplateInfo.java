package com.dolphin.annotation;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

/**
 * Specifies SQL template file information .
 *If no <code>file</code> specified the default file 
 * <blockquote><pre>
 *    
 *    Example:
 *
 *    &#064;SqlTemplateInfo(foler="com/c1s/user/TblUser", file="getUserByLoginName")
 *    &#064;Lob
 *    public String getUserByLoginNameFromTemplate() { 
 *    	... 
 *    }
 * </pre></blockquote>
 */ 
@Retention(RUNTIME)
@Target({ METHOD, FIELD })
public @interface SqlTemplateInfo {
	/**
	 * Absolute folder path for template file (this file must be on CLASSPATH   
	 */
	String folder() default "";

	/**
	 *  Template file name.
	 */
	String file() default "";
}
