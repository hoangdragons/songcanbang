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

@Entity
@Table(name="role_function")
@NamedQueries({
	@NamedQuery(name="RoleFunction.findAll", query="SELECT rf FROM RoleFunction rf WHERE rf.deleteFlg <> 1"),
	@NamedQuery(name = "RoleFunction.deleteByRole", query = "DELETE FROM RoleFunction rf WHERE rf.roleId = :roleId AND rf.deleteFlg <> 1")
})
public class RoleFunction extends BaseEntity  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2003978433848764220L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "rf_id_seq")
	@SequenceGenerator(name = "rf_id_seq", sequenceName = "rf_id_seq", allocationSize= 1)
	@Column(name="RF_ID")
	private Long roleFunctionId;
	
	@Column(name="ROLE_ID")
	private Long roleId;
	
	@Column(name="FUNCTION_ID")
	private Long functionId;

	public Long getRoleFunctionId() {
		return roleFunctionId;
	}

	public void setRoleFunctionId(Long roleFunctionId) {
		this.roleFunctionId = roleFunctionId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getFunctionId() {
		return functionId;
	}

	public void setFunctionId(Long functionId) {
		this.functionId = functionId;
	}
	
	
	
}
