package com.dolphin.security.filter;

import java.util.Date;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

public class JwtTokenHelper {
	protected String secreteKey = "jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=";//admin

	public Claims parseJWT(String jwt)
	{
		Claims claims = null;
		try {
			//		jws = Jwts.parser().setSigningKey(DatatypeConverter.parseBase64Binary(secreteKey))
			claims = Jwts.parser().setSigningKey(secreteKey.getBytes("UTF-8")).parseClaimsJws(jwt).getBody();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return claims;
	}
	
	public Boolean isTokenExpired(String token){
		Claims claims = parseJWT(token);
		Date now = new Date();
		Date expDate = claims.getExpiration();
		return now.getTime() > expDate.getTime();
	}

	
}
