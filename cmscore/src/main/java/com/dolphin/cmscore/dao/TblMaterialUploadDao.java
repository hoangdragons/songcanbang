package com.dolphin.cmscore.dao;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.dolphin.cmscore.entity.TblMaterialUpload;
import com.dolphin.persistence.dao.AbstractBaseJpaDao;

@Stateless
public class TblMaterialUploadDao extends AbstractBaseJpaDao<TblMaterialUpload>{
	
	@PersistenceContext(unitName = "cmscore")
	private EntityManager em;
	
	public TblMaterialUploadDao() {
		super(TblMaterialUpload.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	@SuppressWarnings("unchecked")
	public List<TblMaterialUpload> findLessonResource(Long lessonId, RESOURCE_TYPE type){
		List<TblMaterialUpload> ret = new ArrayList<TblMaterialUpload>();
		
		Query createNamedQuery = null;
		if(type.equals(RESOURCE_TYPE.LESSON_VIDEO)){
			createNamedQuery = getEntityManager().createNamedQuery("TblMaterialUpload.findLessonVideoURL");
			createNamedQuery.setParameter("lessonId", lessonId);
		} else if(type.equals(RESOURCE_TYPE.LESSON_VOICE)){
			createNamedQuery = getEntityManager().createNamedQuery("TblMaterialUpload.findLessonVoiceURL");
			createNamedQuery.setParameter("lessonId", lessonId);
		} else if(type.equals(RESOURCE_TYPE.LESSON_PICTURE)){
			createNamedQuery = getEntityManager().createNamedQuery("TblMaterialUpload.findLessonPictureURL");
			createNamedQuery.setParameter("lessonId", lessonId);
		} else if(type.equals(RESOURCE_TYPE.LESSON_DOCUMENT)){
			createNamedQuery = getEntityManager().createNamedQuery("TblMaterialUpload.findLessonDocumentURL");
			createNamedQuery.setParameter("lessonId", lessonId);		
		}
		ret.addAll(createNamedQuery.getResultList());
        return ret;
	}
	@SuppressWarnings("unchecked")
	public List<TblMaterialUpload> findLessonResource(Long lessonId){
		List<TblMaterialUpload> ret = new ArrayList<TblMaterialUpload>();		
		Query createNamedQuery = getEntityManager().createNamedQuery("TblMaterialUpload.findAllLessonMaterials");
		createNamedQuery.setParameter("lessonId", lessonId);
		
		ret.addAll(createNamedQuery.getResultList());
        return ret;
	}
	
	public TblMaterialUpload getCourseIntroResource(Long courseId, RESOURCE_TYPE type){
		Query createNamedQuery = null;
		if(type.equals(RESOURCE_TYPE.INTRO_PICTURE)){
			createNamedQuery = getEntityManager().createNamedQuery("TblMaterialUpload.findCourseIntroPictureURL");
			createNamedQuery.setParameter("courseId", courseId);
		} else if(type.equals(RESOURCE_TYPE.INTRO_VIDEO)){
			createNamedQuery = getEntityManager().createNamedQuery("TblMaterialUpload.findCourseIntroVideoURL");
			createNamedQuery.setParameter("courseId", courseId);
		}
		return (TblMaterialUpload)createNamedQuery.getResultList().get(0);
	}
	public static enum RESOURCE_TYPE{
		LESSON_VIDEO, LESSON_VOICE, LESSON_PICTURE, LESSON_DOCUMENT, INTRO_PICTURE, INTRO_VIDEO
	}
}
