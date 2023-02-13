package com.dolphin.cmscore.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.dolphin.persistence.entity.BaseEntity;


/**
 * The persistent class for the tbl_category database table.
 * 
 */
@Entity
@Table(name="tbl_category")
@NamedQueries({
	@NamedQuery(name="TblCategory.findAll", query="SELECT t FROM TblCategory t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblCategory.search", query = "SELECT t FROM TblCategory t WHERE t.description LIKE :keyword OR t.categoryName LIKE :keyword AND t.deleteFlg <> 1 ORDER BY t.displayOrder")
})

public class TblCategory extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "category_id_seq")
	@SequenceGenerator(name = "category_id_seq", sequenceName = "category_id_seq", allocationSize= 1)
	@Column(name="CATEGORY_ID")
	private Long categoryId;
	
	@Column(name="CATEGORY_NAME")
	private String categoryName;

	private String description;
	
	private String image;
	
	@Column(name = "display_order")  
    private Integer displayOrder;

	//bi-directional many-to-one association to TblCourse
	@OneToMany(mappedBy="tblCategory")
	private List<TblCourse> tblCourses;

	public TblCategory() {
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<TblCourse> getTblCourses() {
		return this.tblCourses;
	}

	public void setTblCourses(List<TblCourse> tblCourses) {
		this.tblCourses = tblCourses;
	}

	public TblCourse addTblCours(TblCourse tblCours) {
		getTblCourses().add(tblCours);
		tblCours.setTblCategory(this);

		return tblCours;
	}

	public TblCourse removeTblCours(TblCourse tblCours) {
		getTblCourses().remove(tblCours);
		tblCours.setTblCategory(null);

		return tblCours;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

}