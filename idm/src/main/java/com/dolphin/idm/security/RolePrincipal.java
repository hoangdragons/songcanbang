package com.dolphin.idm.security;

import java.security.Principal;

public class RolePrincipal implements Principal {

	private String name;
	
	
	public RolePrincipal(String name) {
		super();
		this.name = name;
	}
	@Override
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
