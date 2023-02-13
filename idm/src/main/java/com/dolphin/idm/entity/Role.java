package com.dolphin.idm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;

@Entity
@Table(name="role")
@NamedQueries({
	@NamedQuery(name="Role.findAll", query="SELECT r FROM Role r WHERE r.deleteFlg <> 1"),
	@NamedQuery(name="Role.search", 
	query = "SELECT t FROM Role t WHERE (UPPER(t.roleName) LIKE UPPER(:keyword) OR UPPER(t.description) LIKE UPPER(:keyword)) AND t.deleteFlg <> 1"),
	@NamedQuery(name="Role.checkRoleName", query="SELECT r FROM Role r WHERE r.roleName = :roleName AND r.deleteFlg <> 1")
})
public class Role extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 4604555584141425980L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ROLE_ID")
	private Long roleId;

	@Column(name="ROLE_NAME")
	private String roleName;

	// Consider for values: 0 (System), 1
	@Column(name="ROLE_TYPE")
	private Integer roleType;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getRoleType() {
		return roleType;
	}

	public void setRoleType(Integer roleType) {
		this.roleType = roleType;
	}
	
}
