package com.dolphin.security.digest;

public abstract class BasePasswordEncoder implements PasswordEncoder {
	protected String[] demergePasswordAndSalt(String mergedPasswordSalt) {
        if ((mergedPasswordSalt == null) || "".equals(mergedPasswordSalt)) {
            throw new IllegalArgumentException("Cannot pass a null or empty String");
        }

        String password = mergedPasswordSalt;
        String salt = "";

        int saltBegins = mergedPasswordSalt.lastIndexOf("{");

        if ((saltBegins != -1) && ((saltBegins + 1) < mergedPasswordSalt.length())) {
            salt = mergedPasswordSalt.substring(saltBegins + 1, mergedPasswordSalt.length() - 1);
            password = mergedPasswordSalt.substring(0, saltBegins);
        }

        return new String[] {password, salt};
    }
	
	protected String mergePasswordAndSalt(String password, Object salt, boolean strict) {
        if (password == null) {
            password = "";
        }

        if (strict && (salt != null)) {
            if ((salt.toString().lastIndexOf("{") != -1) || (salt.toString().lastIndexOf("}") != -1)) {
                throw new IllegalArgumentException("Cannot use { or } in salt.toString()");
            }
        }

        if ((salt == null) || "".equals(salt)) {
            return password;
        } else {
            return password + "{" + salt.toString() + "}";
        }
    }

}
