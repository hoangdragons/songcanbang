package com.dolphin.security.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.jsonwebtoken.Claims;

/**
 * Chu y: CORS se can co prelight request, do vay trong cac truong hop la 
 * CORS request luu y la se co 2 request duoc send lan luot thay vi 01
 * security chi duoc check trong truong hop request co header hop le (Authorization).
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	private static final String ENCODING = "UTF-8";

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		//Set request/response encoding
		request.setCharacterEncoding(ENCODING);
        response.setCharacterEncoding(ENCODING);        
        //init
        HttpServletRequest httpRequest = ((HttpServletRequest) request);
        
        String requestURI = httpRequest.getRequestURI();
        String token = httpRequest.getHeader("Authorization");
        String reqMethod = httpRequest.getMethod();
        
        boolean isNotAuthorizeReq = false;
        isNotAuthorizeReq |= reqMethod.equals("OPTIONS");
        Enumeration<String> headerNames = httpRequest.getHeaderNames();
        while(headerNames.hasMoreElements()){
        	String hName = headerNames.nextElement();
        	isNotAuthorizeReq |= hName.equals("Access-Control-Request-Method");
        	isNotAuthorizeReq |= hName.equals("Origin");
        }
		HttpServletResponse res = (HttpServletResponse) response;
        // SUPPORT CORS
        /*res.addHeader("Access-Control-Allow-Origin", "admin.songcanbang.org, songcanbang.org, accounts.songcanbang.org, rc.songcanbang.org");*/
        res.addHeader("Access-Control-Allow-Origin", "*");
        res.setHeader("Access-Control-Allow-Credentials", "true");
        res.addHeader("Access-Control-Allow-Methods", "POST, PUT, GET, OPTIONS, DELETE");
        res.addHeader("Access-Control-Max-Age", "36000");
        // Avoid bug Request header field Authorization is not allowed by Access-Control-Allow-Headers in preflight response
        res.setHeader("Access-Control-Allow-Headers", 
        		"Access-Control-Allow-Headers,Authorization,Access-Control-Allow-Origin,Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
        // If it is not a login URL then check JWT token
		if (				
				requestURI.indexOf("/login") == -1 
				&& requestURI.indexOf("/logout") == -1
				&& !requestURI.equals(httpRequest.getContextPath()+"/")
				&& requestURI.indexOf(".js") == -1
				&& requestURI.indexOf(".css") == -1
				&& requestURI.indexOf("/images/") == -1
				&& requestURI.indexOf("/videos/") == -1
				&& requestURI.indexOf("/materials/") == -1
				&& requestURI.indexOf("/common/") == -1
				&& requestURI.indexOf("fonts") == -1
				&& requestURI.indexOf("favicon") == -1
				&& !requestURI.endsWith("user-register.html")
				&& requestURI.indexOf("public") == -1
				&& requestURI.indexOf("/category") == -1
				&& requestURI.indexOf("/rest-api/magazines") == -1
				&& requestURI.indexOf("/rest-api/learning-info") == -1
				&& requestURI.indexOf("/course/get-list-course") == -1
				&& requestURI.indexOf("/course/course-count") == -1
				&& requestURI.indexOf("/course-chapter/get-list-chapter") == -1
				&& requestURI.indexOf("/course/id") == -1
				&& requestURI.indexOf("/course/get-list-course-with-rcp") == -1
				&& requestURI.indexOf("/course-rating/get-list-rating") == -1
				&& requestURI.indexOf("/rest-api/category") == -1
				&& !requestURI.endsWith("layouts/views/template.html")
				&& requestURI.indexOf("/app/modules/layouts") == -1
				&& requestURI.indexOf("/app/forms/css") == -1
				&& requestURI.indexOf("/app/forms/js") == -1
				&& !requestURI.endsWith("/app/shared/leftSideBar.html")
				&& !requestURI.endsWith("/app/shared/rightSideBar.html")
				&& !requestURI.endsWith("/app/shared/topNavBar.html")
				&& !requestURI.endsWith("/app/shared/footer.html")
				&& requestURI.indexOf("/rest-api/user/register-confirm") == -1
				&& requestURI.indexOf("reset-password-confirm") == -1
				&& requestURI.indexOf("reset-passwd") == -1
				&& requestURI.indexOf("/rest-api/user/register") == -1
				&& requestURI.indexOf("/rest-api/user/search-email") == -1
				&& requestURI.indexOf("/rest-api/user/search-login-nam") == -1
				&& requestURI.indexOf("app/modules/user/views/register-confirm.html") == -1
				&& requestURI.indexOf("/cmscore/rest-api/course/free-load/") == -1
				&& requestURI.indexOf("/rest-api/coupon/load-definition/") == -1
				&& requestURI.indexOf("/ehealth-services/") == -1
//				&& requestURI.indexOf("/upload/materials") == -1
//				&& requestURI.indexOf("/upload/images") == -1
//				&& requestURI.indexOf("/upload/videos") == -1
//				&& requestURI.indexOf("/upload/voices") == -1
				
				)
		{	
			JwtTokenHelper tokenHelper = new JwtTokenHelper();
			if (token == null || token.equals("")){
				if(!isNotAuthorizeReq){
					throw new ServletException("Token is null!");
				}
			
			}else if(tokenHelper.isTokenExpired(token)) {
				if(isNotAuthorizeReq){
					throw new ServletException("Token is expired!");
				}
			}else{
				Claims claims;
				claims = tokenHelper.parseJWT(token);
				if (claims == null) {
					throw new ServletException("Claim not set!!!");
				}
			}			
		}
		
        chain.doFilter(request, response);
	}

	public static boolean checkRole(final Claims claims, final String servletPath) throws IOException, ServletException {
//		Map<String, List<String>> role = (Map<String, List<String>>)claims.get("roles");
		return false;
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}
}
