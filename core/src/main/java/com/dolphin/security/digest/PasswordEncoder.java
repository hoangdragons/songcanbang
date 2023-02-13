package com.dolphin.security.digest;

public interface PasswordEncoder {
	String encodePassword(String rawPass, Object salt);
	boolean isPasswordValid(String encPass, String rawPass, Object salt);
}
