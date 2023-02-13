package com.dolphin.idm.handler;

import com.dolphin.idm.event.UserEvent;

/**
 * User handler implement for observer pattern.
 * @author nguyenvannghia
 *
 */
public interface IUserEventHandler {
	/**
	 * On create new user.
	 * @param event
	 */
	public void onNewUser(UserEvent event);
	
	public void onUpdateUser(UserEvent event);
	
	public void onDeleteUser(UserEvent event);
}
