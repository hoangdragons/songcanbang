package com.dolphin.persistence.dto;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.annotation.JsonFormat;  
 
/** 
* Base Entity 
* 
* @author nghia.n.v2007@gmail.com
*/  
@MappedSuperclass  
public abstract class BaseDto implements Serializable {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7906724825151580125L;
	
    private String createdBy;  
  
    private String updatedBy;  
    
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy", timezone="CET")
    private Date createdAt;  
    
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy", timezone="CET")
    private Date updatedAt;  
    
    private Integer displayOrder;
    
    private Integer deleteFlg;
    
    private String jqyouiDirection;
  
    
    public Integer getDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(Integer deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	public String getJqyouiDirection() {
		return jqyouiDirection;
	}

	public void setJqyouiDirection(String jqyouiDirection) {
		this.jqyouiDirection = jqyouiDirection;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getCreatedBy() {  
            return createdBy;  
    }  
  
    public void setCreatedBy(String createdBy) {  
            this.createdBy = createdBy;  
    }  

    public String getUpdatedBy() {  
            return updatedBy;  
    }  
  
    public void setUpdatedBy(String updatedBy) {  
            this.updatedBy = updatedBy;  
    }

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}  
}
