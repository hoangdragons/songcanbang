package com.dolphin.persistence.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;  
 
/** 
* Base Entity 
* 
* @author nghia.n.v2007@gmail.com
*/  
@MappedSuperclass  
public abstract class BaseEntity implements Serializable {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7906724825151580125L;
	
	@Column(name = "delete_flg")  
    private Integer deleteFlg;
	
	@Column(name = "created_at")  
    @Temporal(TemporalType.TIMESTAMP)  
    private Date createdAt;  
  
    @Size(max = 20)  
    @Column(name = "created_by", length = 20)  
    private String createdBy;  
  
    @Column(name = "updated_at")  
    @Temporal(TemporalType.TIMESTAMP)  
    private Date updatedAt;  
  
    @Size(max = 20)  
    @Column(name = "updated_by", length = 20)  
    private String updatedBy;
    
    @Column(name = "display_order")  
    private Integer displayOrder;
  
    public Date getCreatedAt() {  
            return createdAt;  
    }  
  
    public void setCreatedAt(Date createdAt) {  
            this.createdAt = createdAt;  
    }  
  
    public String getCreatedBy() {  
            return createdBy;  
    }  
  
    public void setCreatedBy(String createdBy) {  
            this.createdBy = createdBy;  
    }  
  
    public Date getUpdatedAt() {  
            return updatedAt;  
    }  
  
    public void setUpdatedAt(Date updatedAt) {  
            this.updatedAt = updatedAt;  
    }  
  
    public String getUpdatedBy() {  
            return updatedBy;  
    }  
  
    public void setUpdatedBy(String updatedBy) {  
            this.updatedBy = updatedBy;  
    }  
  
    /** 
     * Sets createdAt before insert 
     */  
    @PrePersist  
    public void setCreationDate() {  
        this.createdAt = new Date();  
    }  
  
    /** 
     * Sets updatedAt before update 
     */  
    @PreUpdate  
    public void setChangeDate() {  
        this.updatedAt = new Date();  
    }

	public Integer getDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(Integer deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}  
	
	/*
	 * 
	@Id  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    @Basic(optional = false)  
    @Column(name = "id", nullable = false, columnDefinition = "BIGINT UNSIGNED")  
    protected Long id;  
  
    @Column(name = "version")  
    @Version  
    private Long version;  
  
    public Long getId() {  
        return id;  
    }  
  
    public Long getVersion() {  
        return version;  
    }  
  
    @Override  
    public int hashCode() {  
        int hash = 0;  
        hash += (this.getId() != null ? this.getId().hashCode() : 0);  
  
        return hash;  
    }  
  
    @Override  
    public boolean equals(Object object) {  
    if (this == object)  
            return true;  
        if (object == null)  
            return false;  
        if (getClass() != object.getClass())  
            return false;  
  
        BaseEntity other = (BaseEntity) object;  
        if (this.getId() != other.getId() && (this.getId() == null || !this.id.equals(other.id))) {  
            return false;  
        }  
        return true;  
    }  
  
    @Override  
    public String toString() {  
        return this.getClass().getName() + " [ID=" + id + "]";  
    }   
	 * 
	 */
	
	
}
