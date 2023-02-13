package com.dolphin.idm.security;

import java.util.Date;
import java.util.Map;

import com.dolphin.persistence.dto.UserDto;
import com.dolphin.security.filter.JwtTokenHelper;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class IDMJwtTokenHelper extends JwtTokenHelper {
	private static IDMJwtTokenHelper instance = null;

	private IDMJwtTokenHelper() {
	}

	public static IDMJwtTokenHelper getInstance() {
		if (instance == null) {
			instance = new IDMJwtTokenHelper();
		}
		return instance;
	}

	public String createJWT(String host, UserDto u, Map<String, Object> uRoles, long ttlMillis) {
		// The JWT signature algorithm we will be using to sign the token
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

		long nowMillis = System.currentTimeMillis();
		Date now = new Date(nowMillis);

		// We will sign our JWT with our ApiKey secret
//		byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(secreteKey);
		byte[] apiKeySecretBytes = null;
		try {
			apiKeySecretBytes = secreteKey.getBytes("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
		
		// Let's set the JWT Claims
		JwtBuilder builder = Jwts.builder()
				.setClaims(uRoles)
				.setId(u.getUserId().toString())
				.setIssuedAt(now)
				.setSubject(u.getFullName())
				.setIssuer(host)
				.setAudience(u.getLoginName())				
				.signWith(signatureAlgorithm, apiKeySecretBytes /*signingKey*/);

		// if it has been specified, let's add the expiration
		if (ttlMillis >= 0) {
			long expMillis = nowMillis + ttlMillis;
			Date exp = new Date(expMillis);
			builder.setExpiration(exp);
		}

		// Builds the JWT and serializes it to a compact, URL-safe string
		return builder.compact();
	}
}
