package com.dolphin.idm.security;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.logging.ConsoleHandler;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;
import javax.sql.DataSource;

import com.dolphin.security.digest.SHA256PasswordEncoder;

public class DolphinLoginModule implements LoginModule {
	private CallbackHandler handler;
	private Subject subject;
	private UserPrincipal userPrincipal;
	private RolePrincipal rolePrincipal;
	private List<String> userGroups;
	private Map options;
	private Map sharedState;
	
	// Datasource infor 
	private String dataSourceJndiName;
	
	private String selectPassSql;
	// Not use
	private String selectRoleSql;
	private DataSource ds;
	// Configurable option
	private boolean debug = false;

	// Logger used to output debug information
	private static final Logger logger = Logger.getLogger(DolphinLoginModule.class.getName());

	// User credentials
	private String username = null;
	private String password = null;

	private boolean isAuthenticated = false;
	private boolean commitSucceeded = false;

	@Override
	public void initialize(Subject subject, CallbackHandler callbackHandler, Map<String, ?> sharedState,
			Map<String, ?> options) {

        // Store the handler
        this.handler = callbackHandler;
 
        // Subject reference holds the principals
        this.subject = subject;
 
        this.options = options;
        this.sharedState = sharedState;
		if (ds == null) {
			try {

				
				dataSourceJndiName =  (String) options.get("dataSourceJndiName");
				selectPassSql =  (String) options.get("selectPassSql");
				selectRoleSql =  (String) options.get("selectRoleSql");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// Setup a logging class / state
        if ("true".equalsIgnoreCase((String) options.get("debug"))) {
            ConsoleHandler consoleHandler = new ConsoleHandler();
            logger.addHandler(consoleHandler);
            debug = true;
        }

	}

	@Override
	public boolean login() throws LoginException {
		if(isAuthenticated){
			throw new LoginException("Already authenticated!");
		}
		// If no handler is specified throw a error
        if (handler == null) {
            throw new LoginException("Error: no CallbackHandler available to recieve authentication information from the user");
        }
 
        // Declare the callbacks based on the JAAS spec
        Callback[] callbacks = new Callback[2];
        callbacks[0] = new NameCallback("login");
        callbacks[1] = new PasswordCallback("password", true);
        Connection conn = null;
        try {
            //Handle the callback and recieve the sent inforamation
            handler.handle(callbacks);
            username = ((NameCallback) callbacks[0]).getName();
            password = String.valueOf(((PasswordCallback) callbacks[1]).getPassword());
 
            // Debug the username / password
            if (debug) {
                logger.log(Level.INFO, "Username: {0}", username);
                logger.log(Level.INFO, "Password: {0}", password);
            }

            Context initCtx = new InitialContext();
			ds = (DataSource) initCtx.lookup(dataSourceJndiName);
//			ds = (DataSource) initCtx.lookup("java:jboss/datasources/MariaDBDS");
        	conn = ds.getConnection();
        	PreparedStatement stmt = conn.prepareStatement(selectPassSql);
        	stmt.setString(1, username);
        	ResultSet rs = stmt.executeQuery();
        	String dbPassword = null;
        	while(rs.next()){
        		dbPassword = rs.getString(1); 
        	}
        	String encPasswd = null;
        	SHA256PasswordEncoder enc = new SHA256PasswordEncoder(true);
        	if(password != null){
        		encPasswd = enc.encodePassword(password, null);
        	} 
            // We should never allow empty strings to be passed
            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                throw new LoginException("Data specified had null values");
            } 
            // Validate against our database or any other options (this check is a example only)
            else if(encPasswd != null && !encPasswd.isEmpty() && dbPassword.equals(encPasswd))  { 
                // Assign the user roles
            	stmt = conn.prepareStatement(selectRoleSql);
            	rs = stmt.executeQuery();
            	String role = null;
            	while(rs.next()){
            		role = rs.getString(1); 
            	}
                userGroups = Arrays.asList(role);
                isAuthenticated = true; 
                return true;
            }
            
            throw new LoginException("Authentication failed!");
 
        } catch (IOException | UnsupportedCallbackException
        		| SQLException | NamingException e) {
            throw new LoginException(e.getMessage());
        }finally{
        	if(conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
					//ignore
				}
			}
        }
	}

	@Override
	public boolean commit() throws LoginException {
        if (!isAuthenticated) {
            return false;
        } else {
 
            userPrincipal = new UserPrincipal(username);
            subject.getPrincipals().add(userPrincipal);
 
            if (userGroups != null && userGroups.size() > 0) {
                for (String groupName : userGroups) {
                    rolePrincipal = new RolePrincipal(groupName);
                    subject.getPrincipals().add(rolePrincipal);
                }
            }
 
            commitSucceeded = true;
 
            return true;
        }
	}

	@Override
	public boolean abort() throws LoginException {
	    if (!isAuthenticated) {
            return false;
        } else if (isAuthenticated && !commitSucceeded) {
            isAuthenticated = false;
            username = null;
            password = null;
            userPrincipal = null;
        } else {
            logout();
        }
        return true;
	}

	@Override
	public boolean logout() throws LoginException {
		 isAuthenticated = false;
	        isAuthenticated = commitSucceeded;
	        subject.getPrincipals().clear();
	        return true;
	}
	private List<String> getRoles() {
		 
        List<String> roleList = new ArrayList<>();
        roleList.add("admin");
 
        return roleList;
    }

	public String getDataSourceJndiName() {
		return dataSourceJndiName;
	}

	public void setDataSourceJndiName(String dataSourceJndiName) {
		this.dataSourceJndiName = dataSourceJndiName;
	}

	public String getSelectPassSql() {
		return selectPassSql;
	}

	public void setSelectPassSql(String selectPassSql) {
		this.selectPassSql = selectPassSql;
	}

	public String getSelectRoleSql() {
		return selectRoleSql;
	}

	public void setSelectRoleSql(String selectRoleSql) {
		this.selectRoleSql = selectRoleSql;
	}
	
	
}
