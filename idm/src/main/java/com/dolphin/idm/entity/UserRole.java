package com.dolphin.idm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the user_role database table.
 * 
 */
@Entity
@Table(name="user_role")
@NamedQueries({
	@NamedQuery(name="UserRole.findAll", query="SELECT ur FROM UserRole ur WHERE ur.deleteFlg <> 1"),
	@NamedQuery(name="UserRole.deleteByUser", query="DELETE FROM UserRole ur WHERE ur.userId = :userId AND ur.deleteFlg <> 1")
})
public class UserRole  extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "ur_id_seq")
	@SequenceGenerator(name = "ur_id_seq", sequenceName = "ur_id_seq", allocationSize= 1)
	@Column(name="UR_ID")
	private Long userRoleId;
	
	@Column(name="ROLE_ID")
	private Long roleId;
	
	@Column(name="USER_ID")
	private Long userId;

	public Long getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(Long userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
}