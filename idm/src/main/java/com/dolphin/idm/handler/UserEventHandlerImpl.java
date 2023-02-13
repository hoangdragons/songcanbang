package com.dolphin.idm.handler;

import java.io.Serializable;

import javax.ejb.Asynchronous;
import javax.ejb.Stateless;
import javax.enterprise.event.Observes;
import javax.enterprise.inject.New;

import com.dolphin.annotation.interceptor.Logged;
import com.dolphin.annotation.qualifier.Delete;
import com.dolphin.annotation.qualifier.Update;
import com.dolphin.idm.event.UserEvent;

/**
 * implement handler user event
 * 
 * @author nghianv
 *
 */
@Stateless
public class UserEventHandlerImpl implements IUserEventHandler, Serializable {
	private static final long serialVersionUID = 2273740665431794608L;
	
	@Override
    @Asynchronous
    @Logged
	public void onNewUser(@Observes @New UserEvent event) {
		// This method will be intercepted to write log.
	}

	@Override
    @Asynchronous
    @Logged
	public void onUpdateUser(@Observes @Update UserEvent event) {
		// This method will be intercepted to write log.
	}

	@Override
    @Asynchronous
    @Logged
	public void onDeleteUser(@Observes @Delete UserEvent event) {
		// This method will be intercepted to write log.
	}
}
