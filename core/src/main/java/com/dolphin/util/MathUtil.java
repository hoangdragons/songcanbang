package com.dolphin.util;

import java.security.SecureRandom;
import java.util.Random;

public class MathUtil {
	public static final char[] CHAR_SET_ALPHA_NUM_UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
	public static final char[] CHAR_SET_ALPHA_NUM_LOWER = "abcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
	
	
	/**
	 * Generate random alpha_numeric string with length specified by <code>length</code> from source string specified by <code>characterSet</code>
	 * @param characterSet
	 * @param length
	 * @return
	 */
	public static String randomString(char[] characterSet, int length) {
		if(characterSet == null || characterSet.length ==0){
			characterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890123456789".toCharArray();
		}
	    Random random = new SecureRandom();
	    char[] result = new char[length];
	    for (int i = 0; i < result.length; i++) {
	        // picks a random index out of character set > random character
	        int randomCharIndex = random.nextInt(characterSet.length);
	        result[i] = characterSet[randomCharIndex];
	    }
	    return new String(result);
	}
	
	public static void main(String args[]) throws Exception{
		System.out.println(MathUtil.randomString(null, 6));
	}

}
