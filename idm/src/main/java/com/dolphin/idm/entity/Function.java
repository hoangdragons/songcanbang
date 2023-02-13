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

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the function database table.
 * 
 */
@Entity
@NamedQueries({
	@NamedQuery(name="Function.findAll", 
		query="SELECT f FROM Function f WHERE f.deleteFlg <> 1"),
	@NamedQuery(name="Function.search", 
		query = "SELECT t FROM Function t WHERE (UPPER(t.functionName) LIKE UPPER(:keyword) OR UPPER(t.description) LIKE UPPER(:keyword)) AND t.deleteFlg <> 1"),
	@NamedQuery(name="Function.checkFunctionName", 
		query="SELECT f FROM Function f WHERE f.functionName = :functionName AND f.deleteFlg <> 1")
})

public class Function extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "func_id_seq")
	@SequenceGenerator(name = "func_id_seq", sequenceName = "func_id_seq", allocationSize= 1)
	@Column(name="FUNC_ID")
	private Long functionId;

	@Column(name="FUNC_NAME")
	private String functionName;
	
	
	// 0 = System, 1 = manual
	@Column(name="FUNC_TYPE")
	private Integer functionType;
	
	@Column(name="DESCRIPTION")
	private String description;

	public Function() {
	}
	
	public Long getFunctionId() {
		return functionId;
	}


	public void setFunctionId(Long functionId) {
		this.functionId = functionId;
	}


	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getFunctionType() {
		return functionType;
	}

	public void setFunctionType(Integer functionType) {
		this.functionType = functionType;
	}
	
	
}