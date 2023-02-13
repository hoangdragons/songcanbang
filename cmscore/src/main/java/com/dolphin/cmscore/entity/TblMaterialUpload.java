package com.dolphin.cmscore.entity;

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
import javax.validation.constraints.NotNull;

import com.dolphin.persistence.entity.BaseEntity;

@Entity
@Table(name="tbl_material_upload")
@NamedQueries({
	@NamedQuery(name="TblMaterialUpload.findAll", query="SELECT t FROM TblMaterialUpload t WHERE t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblMaterialUpload.findAllLessonMaterials", 
	query="SELECT t FROM TblMaterialUpload t WHERE t.ownerId = :lessonId AND t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblMaterialUpload.findLessonVideoURL", 
		query="SELECT t FROM TblMaterialUpload t WHERE t.ownerId = :lessonId AND t.type = 1 AND t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblMaterialUpload.findLessonVoiceURL", 
		query="SELECT t FROM TblMaterialUpload t WHERE t.ownerId = :lessonId AND t.type = 2 AND t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblMaterialUpload.findLessonPictureURL", 
		query="SELECT t FROM TblMaterialUpload t WHERE t.ownerId = :lessonId AND t.type = 3  AND t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblMaterialUpload.findLessonDocumentURL", 
		query="SELECT t FROM TblMaterialUpload t WHERE t.ownerId = :lessonId AND t.type = 4 AND t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblMaterialUpload.findCourseIntroPictureURL", 
		query="SELECT t FROM TblMaterialUpload t WHERE t.ownerId = :courseId AND t.type = 5 AND t.deleteFlg <> 1 ORDER BY t.displayOrder"),
	@NamedQuery(name="TblMaterialUpload.findCourseIntroVideoURL", 
		query="SELECT t FROM TblMaterialUpload t WHERE t.ownerId = :courseId AND t.type = 6 AND t.deleteFlg <> 1 ORDER BY t.displayOrder")
})
public class TblMaterialUpload extends BaseEntity  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "material_upload_id_seq")
	@SequenceGenerator(name = "material_upload_id_seq", sequenceName = "material_upload_id_seq", allocationSize= 1)
	@Column(name="ID")
	private Long id;
	
	@Column(name="OWNER_ID")
	private Long ownerId;
	
	@NotNull(message = "{url}: {validation.message.required.field}")
	@Column(name="URL")
	private String url;
	
	@NotNull(message = "{type}: {validation.message.required.field}")
	@Column(name="TYPE")
	private Integer type;
	
	@NotNull(message = "{title}: {validation.message.required.field}")
	@Column(name="TITLE")
	private String title;
	
	@Column(name="DURATION")
	private Double duration;
	

	public Double getDuration() {
		return duration;
	}

	public void setDuration(Double duration) {
		this.duration = duration;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Long ownerId) {
		this.ownerId = ownerId;
	}
}
