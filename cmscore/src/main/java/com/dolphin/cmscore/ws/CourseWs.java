package com.dolphin.cmscore.ws;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.dolphin.cmscore.dto.CouponMasterDto;
import com.dolphin.cmscore.dto.CourseCouponDto;
import com.dolphin.cmscore.dto.CourseTeacherDto;
import com.dolphin.cmscore.dto.CouseInformationForPaymentDto;
import com.dolphin.cmscore.dto.LearningInformationDto;
import com.dolphin.cmscore.dto.TblCourseChapterDto;
import com.dolphin.cmscore.dto.TblCourseDto;
import com.dolphin.cmscore.dto.TblCourseLessonDto;
import com.dolphin.cmscore.dto.TblMaterialUploadDto;
import com.dolphin.cmscore.dto.TblTeacherDto;
import com.dolphin.cmscore.logic.BoughtCourseLogic;
import com.dolphin.cmscore.logic.CategoryLogic;
import com.dolphin.cmscore.logic.CouponMasterLogic;
import com.dolphin.cmscore.logic.CourseChapterLogic;
import com.dolphin.cmscore.logic.CourseCouponLogic;
import com.dolphin.cmscore.logic.CourseLessonLogic;
import com.dolphin.cmscore.logic.CourseLogic;
import com.dolphin.cmscore.logic.CourseRatingLogic;
import com.dolphin.cmscore.logic.CourseTeacherLogic;
import com.dolphin.cmscore.logic.LearningInformationLogic;
import com.dolphin.cmscore.logic.MaterialUploadLogic;
import com.dolphin.cmscore.logic.TeacherLogic;
import com.dolphin.security.filter.JwtTokenHelper;
import com.dolphin.ws.WSHelper;

/**
 *
 */
@Path("/course")
@Stateless
public class CourseWs {
	private final Logger logger = Logger.getLogger(CourseWs.class.getName());

	@Inject
	private CourseRatingLogic courseRatingLogic;
	
	@Inject
	CategoryLogic categoryLogic;

	@Inject
	CourseLogic courseLogic;

	@Inject
	CourseChapterLogic courseChapterLogic;

	@Inject
	CourseLessonLogic courseLessonLogic;

	@Inject
	MaterialUploadLogic materialUploadLogic;

	@Inject
	private TeacherLogic teacherLogic;
	
	@Inject
	private CourseTeacherLogic courseTeacherLogic;
	
	@Inject
	private BoughtCourseLogic boughtCourseLogic; 
	
	@Context
	private HttpServletRequest httpRequest;
	
	JwtTokenHelper tokenHelper = new JwtTokenHelper();
	
	@Inject
	private LearningInformationLogic infoLogic;
	
	@Inject
	private CourseCouponLogic courseCouponLogic;
	
	@Inject
	private CouponMasterLogic couponMasterLogic;
	
	@PostConstruct
	public void init() {
		logger.info("Dolphin JAX-RS service started!");
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> findAll() {
		return courseLogic.findAll();
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public TblCourseDto create(TblCourseDto course) {
		List<TblCourseChapterDto> chapters = course.getChapters();	
		WSHelper.setCreateBy(course, httpRequest);
		course = courseLogic.create(course);
		if(chapters != null && chapters.size() >0){
			for(TblCourseChapterDto chapter:chapters){
				// Create chapter
				chapter.setCourseId(course.getCourseId());
				chapter = courseChapterLogic.push(chapter);
				List<TblCourseLessonDto> lessons = chapter.getLessons();
				if(lessons != null && lessons.size() > 0)
				{
					for(TblCourseLessonDto lesson:lessons){
						//Create lesson
						lesson.setCourseChapterId(chapter.getCourseChapterId());
						lesson = courseLessonLogic.push(chapter, lesson);
						List<TblMaterialUploadDto> resources = lesson.getMaterials();
						for(TblMaterialUploadDto r:resources){
							//Create material
							r.setOwnerId(lesson.getCourseLessonId());
							r = materialUploadLogic.push(r);
						}
					}
				}
				
			}
		}
		// Create teacher
		List<TblTeacherDto> teachers = createTeachers(course.getTeachers());
		
		// associate Teacher to course
		updateCourseTeacherAssociation(teachers, course);
		return course;
	}
	private List<TblTeacherDto> createTeachers(List<TblTeacherDto> list){
		for(TblTeacherDto dto:list){
			if(dto.getTeacherId() == null){
				dto = teacherLogic.create(dto);
			}
		}
		return list;
	}
	
	private void updateCourseTeacherAssociation(List<TblTeacherDto> teachers, TblCourseDto dto){
		courseTeacherLogic.deleteByCourse(dto.getCourseId().longValue());
		for(TblTeacherDto teacher:teachers){
			CourseTeacherDto ctd = new CourseTeacherDto();
			ctd.setCourseId(dto.getCourseId().longValue());
			ctd.setTeacherId(teacher.getTeacherId());
			courseTeacherLogic.create(ctd);
		}
	}
	
	@Path("/id/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblCourseDto get(@PathParam("id") Long courseId) {
		return loadCourseForFree(courseLogic.get(courseId));
	}
	
	@Path("/find-teaching-courses")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> findTeachingCourses() {
		Long loginId = WSHelper.getLoginId(httpRequest);
		List<TblCourseDto> teachingCourses = courseLogic.findTeachingCourses(loginId);
		List<TblCourseDto> ret = new ArrayList<TblCourseDto>();
		for(TblCourseDto dto:teachingCourses){
			dto.setDiscountPrice(dto.getPrice());
			ret.add(loadCourseForFree(dto));
		}
		return ret;
	}
	
	private TblCourseDto loadWithDto(TblCourseDto fullDto){
		Long courseId = fullDto.getCourseId();
		Long loginId = WSHelper.getLoginId(httpRequest);
		Long courseOwnerId = new Long(fullDto.getCreatedBy());
		boolean loginIsCourseOwner = (loginId.intValue() == courseOwnerId.intValue());
		
		List<Long> teacherLoginIds = new ArrayList<Long>();		
		List<CourseTeacherDto> ctds = courseTeacherLogic.findByCourse(courseId.longValue());
		List<TblTeacherDto> teachers = new ArrayList<TblTeacherDto>();
		for(CourseTeacherDto d:ctds){
			TblTeacherDto t = teacherLogic.get(d.getTeacherId());
			teachers.add(t);
			teacherLoginIds.add(t.getLoginId());
		}
		fullDto.setTeachers(teachers);
		boolean loginIsCourseTeacher = teacherLoginIds.contains(loginId);
		
		boolean loginIsAdmin = WSHelper.loginIsAdmin(httpRequest);
		boolean isBoughtCourse = boughtCourseLogic.checkBoughtCourse(loginId, courseId);
		double totalVideoTimeInMinute = 0d;
		long totalMat = 0l;
		long totalMatCompleted = 0l;
		
		List<TblCourseChapterDto> chapters = courseChapterLogic.getListChapterByCourseId(fullDto.getCourseId());
		Long lessonCount = 0L;
		if(chapters != null && chapters.size() >0){
			for (TblCourseChapterDto c : chapters) {
				double chapterTotalVideoDuration = 0d;
				List<TblCourseLessonDto> lessons = courseLessonLogic
						.findByChapter(c.getCourseChapterId());
				if(lessons != null && lessons.size() > 0){
					// Secure sensitive data, allow load resource by following rules
					// 1. Login is owner of course	
					// 2. Login has 'ADMIN' role
					// 3. Login is teacher of the course
					// 4. The course is in Login BoughtCourse list 
					if(loginIsCourseOwner || loginIsCourseTeacher || loginIsAdmin || isBoughtCourse || fullDto.getHelperCourse().intValue() == 1){
						for (TblCourseLessonDto lesson : lessons) {
							double lessonTotalVideoDuration = 0d;
							List<TblMaterialUploadDto> listMat = materialUploadLogic.findLessonResource(lesson.getCourseLessonId());
							totalMat += listMat.size();
							List<TblMaterialUploadDto> updateListMat = new ArrayList<TblMaterialUploadDto>();
							for(TblMaterialUploadDto dto: listMat){
								if(dto != null && dto.getType() <=2){
									totalVideoTimeInMinute += dto.getDuration() != null ? dto.getDuration():0;
									lessonTotalVideoDuration += dto.getDuration() != null ? dto.getDuration():0;
								}
								// Check if course is complete
								LearningInformationDto learningInfoDto = infoLogic.getCompletedMaterial(courseId, loginId, dto.getId());
								if(learningInfoDto != null && learningInfoDto.getCompleted() == 1){
									totalMatCompleted += 1;
									dto.setIsCompleted(true);
								}
								updateListMat.add(dto);
							}
							lesson.setTotalVideoDuration(lessonTotalVideoDuration);
							chapterTotalVideoDuration += lessonTotalVideoDuration;
							lesson.setMaterials(updateListMat);
						}
					}
					c.setLessons(lessons);
					c.setLessonCount(new Long(lessons.size()));
					lessonCount += lessons.size();
				}else{
					c.setLessonCount(0l);
				}
				c.setTotalVideoDuration(chapterTotalVideoDuration);
			}
			fullDto.setChapters(chapters);
		}
		fullDto.setLessonCount(lessonCount);
		
		double totalVideoTime = totalVideoTimeInMinute > 0? Math.round((totalVideoTimeInMinute/60)*100.0)/100.0:0;
		fullDto.setTotalMaterials(totalMat);
		fullDto.setTotalVideoTime(totalVideoTime);
		fullDto.setCompletedMaterials(totalMatCompleted);
		return fullDto;
	}
	
	/**
	 * Load all course information (include resource with checking security)
	 * @param courseId
	 * @return
	 */
	@Path("/load/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblCourseDto load(@PathParam("id") Long courseId) {
		TblCourseDto fullDto = courseLogic.get(courseId);
		return loadWithDto(fullDto);
		
	}
	
	
	@Path("/load-helper-course")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> loadHelperCourse() {
		List<TblCourseDto> helpCourseList = courseLogic.findAllHelperCourse();
		List<TblCourseDto> ret = new ArrayList<TblCourseDto>();
		Long loginId = WSHelper.getLoginId(httpRequest);
		Iterator<TblCourseDto> courseItr = helpCourseList.iterator();
		while(courseItr.hasNext()){
			TblCourseDto fullDto = courseItr.next();
			Long courseId = fullDto.getCourseId();
			double totalVideoTimeInMinute = 0d;
			long totalMat = 0l;
			long totalMatCompleted = 0l;
			
			List<TblCourseChapterDto> chapters = courseChapterLogic.getListChapterByCourseId(fullDto.getCourseId());
			Long lessonCount = 0L;
			if(chapters != null && chapters.size() >0){
				for (TblCourseChapterDto c : chapters) {
					double chapterTotalVideoDuration = 0d;
					List<TblCourseLessonDto> lessons = courseLessonLogic
							.findByChapter(c.getCourseChapterId());
					if(lessons != null && lessons.size() > 0){
							for (TblCourseLessonDto lesson : lessons) {
								double lessonTotalVideoDuration = 0d;
								List<TblMaterialUploadDto> listMat = materialUploadLogic.findLessonResource(lesson.getCourseLessonId());
								totalMat += listMat.size();
								List<TblMaterialUploadDto> updateListMat = new ArrayList<TblMaterialUploadDto>();
								for(TblMaterialUploadDto dto: listMat){
									if(dto != null && dto.getType() <=2){
										totalVideoTimeInMinute += dto.getDuration() != null ? dto.getDuration():0;
										lessonTotalVideoDuration += dto.getDuration() != null ? dto.getDuration():0;
									}
									// Check if course is complete
									LearningInformationDto learningInfoDto = infoLogic.getCompletedMaterial(courseId, loginId, dto.getId());
									if(learningInfoDto != null && learningInfoDto.getCompleted() == 1){
										totalMatCompleted += 1;
										dto.setIsCompleted(true);
									}
									updateListMat.add(dto);
								}
								lesson.setTotalVideoDuration(lessonTotalVideoDuration);
								chapterTotalVideoDuration += lessonTotalVideoDuration;
								lesson.setMaterials(updateListMat);
							}
						c.setLessons(lessons);
						c.setLessonCount(new Long(lessons.size()));
						lessonCount += lessons.size();
					}else{
						c.setLessonCount(0l);
					}
					c.setTotalVideoDuration(chapterTotalVideoDuration);
				}
				fullDto.setChapters(chapters);
			}
			fullDto.setLessonCount(lessonCount);
			
			double totalVideoTime = totalVideoTimeInMinute > 0? Math.round((totalVideoTimeInMinute/60)*100.0)/100.0:0;
			fullDto.setTotalMaterials(totalMat);
			fullDto.setTotalVideoTime(totalVideoTime);
			fullDto.setCompletedMaterials(totalMatCompleted);
			ret.add(fullDto);
		}
		return ret;
	}
	
	/**
	 * Load course information for free (not include materials)
	 * @param courseId
	 * @return
	 */
	@Path("/free-load/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public TblCourseDto freeLoadService(@PathParam("id") Long courseId) {
		TblCourseDto fullDto = courseLogic.get(courseId);
		return loadCourseForFree(fullDto);
	}
	
	private TblCourseDto loadCourseForFree(TblCourseDto fullDto) {
		Long courseId = fullDto.getCourseId();
		// Update discount info
		List<CourseCouponDto> listAppliedCoupon = courseCouponLogic.getByCourse(courseId);
		double discountPrice = fullDto.getPrice();
		double totalDiscount = 0d;
		for(CourseCouponDto coupon:listAppliedCoupon){
			CouponMasterDto couponMasterDto = couponMasterLogic.getByCouponType(coupon.getCouponType());
			totalDiscount += couponMasterDto.getDiscount();
		}
		if(totalDiscount > 0d && fullDto.getPrice() >0){
			discountPrice = fullDto.getPrice() * (1 - totalDiscount /100);
		}
		fullDto.setDiscountPrice(discountPrice);
		
		// Update rating
		fullDto.setTotalRating(courseRatingLogic.countRatingByCourseId(courseId));
		
		List<Long> teacherLoginIds = new ArrayList<Long>();		
		List<CourseTeacherDto> ctds = courseTeacherLogic.findByCourse(courseId.longValue());
		List<TblTeacherDto> teachers = new ArrayList<TblTeacherDto>();
		for(CourseTeacherDto d:ctds){
			TblTeacherDto t = teacherLogic.get(d.getTeacherId());
			teachers.add(t);
			teacherLoginIds.add(t.getLoginId());
		}
		fullDto.setTeachers(teachers);
		
		List<TblCourseChapterDto> chapters = courseChapterLogic.getListChapterByCourseId(fullDto.getCourseId());
		Long lessonCount = 0L;
		double totalVideoTimeInMinute = 0d;
		long totalMat = 0l;
		
		if(chapters != null && chapters.size() >0){
			for (TblCourseChapterDto c : chapters) {
				double chapterTotalVideoDuration = 0d;
				List<TblCourseLessonDto> lessons = courseLessonLogic
						.findByChapter(c.getCourseChapterId());
				if(lessons != null && lessons.size() > 0){
					c.setLessons(lessons);
					c.setLessonCount(new Long(lessons.size()));
					lessonCount += lessons.size();
					// Calculate statistic info
					for(TblCourseLessonDto lesson: lessons){
						List<TblMaterialUploadDto> listMat = materialUploadLogic.findLessonResource(lesson.getCourseLessonId());
						totalMat += listMat.size();
						double lessonTotalVideoDuration = 0d;
						for(TblMaterialUploadDto dto: listMat){
							if(dto != null && dto.getType() <=2){
								totalVideoTimeInMinute += dto.getDuration() != null ? dto.getDuration():0;
								lessonTotalVideoDuration += dto.getDuration() != null ? dto.getDuration():0;
							}
						}
						lesson.setTotalVideoDuration(lessonTotalVideoDuration);
						chapterTotalVideoDuration += lessonTotalVideoDuration;
					}
					// END calculate statistic info
					
				}else{
					c.setLessonCount(0l);
				}
				c.setTotalVideoDuration(chapterTotalVideoDuration);
			}
			fullDto.setChapters(chapters);
		}
		fullDto.setLessonCount(lessonCount);
		
		double totalVideoTime = totalVideoTimeInMinute > 0? Math.round((totalVideoTimeInMinute/60)*100.0)/100.0:0;
		fullDto.setTotalMaterials(totalMat);
		fullDto.setTotalVideoTime(totalVideoTime);
		return fullDto;
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRES_NEW, rollbackOn=Throwable.class)
	public TblCourseDto update(TblCourseDto course) {
		WSHelper.setUpdateBy(course, httpRequest);
		TblCourseDto ret = courseLogic.push(course);
		List<TblCourseChapterDto> chapters = course.getChapters();
		List<TblMaterialUploadDto> matList = new ArrayList<TblMaterialUploadDto>();
		List<Long> matDelIds = new ArrayList<Long>();
		List<Long> lessonDelIds = new ArrayList<Long>();
		if(chapters != null && chapters.size() >0){
			// Push each chapter
			for(TblCourseChapterDto c: chapters){
				c.setCourseId(course.getCourseId());
				courseChapterLogic.push(c);
				List<TblCourseLessonDto> lessons = c.getLessons();
				if(lessons != null && lessons.size() > 0){
					// Push each lesson
					for(TblCourseLessonDto lesson:lessons){
						lesson.setCourseChapterId(c.getCourseChapterId());
						courseLessonLogic.push(c, lesson);
						// Push materials
						for(TblMaterialUploadDto dto:lesson.getMaterials()){
							dto.setOwnerId(lesson.getCourseLessonId());
							matList.add(dto);
							//materialUploadLogic.push(dto);
						}
						// Delete deleted materials
						matDelIds.addAll(lesson.getDeleteMatIdList());
						//materialUploadLogic.remove(id);
					}
				}
					
				// Delete deleted lesson
				lessonDelIds.addAll(c.getDeleteLessonIdList());
//				for(Long id:lessonDelIds){
//					courseLessonLogic.remove(id);
//				}				
			}
			// Push matList
			for(TblMaterialUploadDto dto:matList){
				materialUploadLogic.push(dto);
			}
			// Remove matDelIds
			for(Long id: matDelIds){
				materialUploadLogic.remove(id);
			}
			// Remove lessonDelIds
			for(Long id: lessonDelIds){
				courseLessonLogic.remove(id);
			}
		}
		// Create teacher
		List<TblTeacherDto> teachers = createTeachers(course.getTeachers());
		
		// associate Teacher to course
		updateCourseTeacherAssociation(teachers, course);
		
		//Delete deleted chapters
		List<Long> chapterDeleteIds = course.getDeleteChapterIdList();
		for(Long id:chapterDeleteIds){
			courseChapterLogic.remove(id);
		}
		return ret;
	}

	@Path("/id/{id}")
	@DELETE
	@Produces(MediaType.APPLICATION_JSON)
	@Transactional(value=TxType.REQUIRED,rollbackOn=Throwable.class)
	public void delete(@PathParam("id") Long courseId) {
		TblCourseDto course = load(courseId);
		List<TblCourseChapterDto> chapters = course.getChapters();
		if(chapters != null && chapters.size() >0){
			for(TblCourseChapterDto chapter:chapters){
				List<TblCourseLessonDto> lessons = chapter.getLessons();
				if(lessons != null && lessons.size() > 0){
					for(TblCourseLessonDto lesson:lessons){
						List<TblMaterialUploadDto> resources = lesson.getMaterials();
						for(TblMaterialUploadDto r:resources){
							//Delete material
							materialUploadLogic.remove(r.getId());
						}
						//Delete lesson
						courseLessonLogic.remove(lesson.getCourseLessonId());
					}
				}
				// Delete chapter
				courseChapterLogic.remove(chapter.getCourseChapterId());
			}
		}
		//Delete course
		courseLogic.remove(course);
		courseTeacherLogic.deleteByCourse(course.getCourseId().longValue());
	}

	@GET
	@Path("/search/{keyword}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> search(@PathParam("keyword") String keyword) {
		return courseLogic.search(keyword);
	}

	@GET
	@Path("/search-by-cat/{keyword}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> searchByCat(@PathParam("keyword") Long keyword) {
		return courseLogic.searchByCategory(keyword);
	}

	@GET
	@Path("/get-list-course/{sortType}/{categoryId}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> getListCourseByCondition(@PathParam("sortType") String sortType, @PathParam("categoryId") Long categoryId) {
		List<TblCourseDto> r1 = courseLogic.getListCourseByCondition(sortType, categoryId);
		//TODO Optimize performance
		List<TblCourseDto> fullDtoList = new ArrayList<TblCourseDto>();
		for(TblCourseDto dto: r1){
			TblCourseDto fullDto = load(dto.getCourseId());
			fullDtoList.add(fullDto);
		}
		return fullDtoList;
	}

	@GET
	@Path("/get-list-course/{page}/{categoryId}/{orderBy}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> getListCourse(
			@PathParam("page") Integer page,
			@PathParam("categoryId") Long categoryId,			
			@PathParam("orderBy") String orderBy
	) {
		List<TblCourseDto> r1 = courseLogic.getListCourseByCat(categoryId, orderBy);
		// Optimize performance
		List<TblCourseDto> fullDtoList = new ArrayList<TblCourseDto>();
		for(TblCourseDto dto: r1){
			TblCourseDto fullDto = loadCourseForFree(dto);
			fullDtoList.add(fullDto);
		}
		return fullDtoList;
	}
	

	@GET
	@Path("/get-list-course-with-rcp/{page}/{categoryId}/{orderBy}/{rcp}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> getListCourseWithRcp(
			@PathParam("page") Integer page,
			@PathParam("categoryId") Long categoryId,			
			@PathParam("orderBy") String orderBy, 
			@PathParam("rcp") Integer rcp
	) {
		List<TblCourseDto> r1 = null;
		if(rcp != null ){
			r1 = courseLogic.getListCourse(page, categoryId, orderBy, rcp);
		}else{
			r1 = courseLogic.getListCourse(page, categoryId, orderBy);
		}
		//TODO Optimize performance
		List<TblCourseDto> fullDtoList = new ArrayList<TblCourseDto>();
		for(TblCourseDto dto: r1){
			TblCourseDto fullDto = loadCourseForFree(dto);
			fullDtoList.add(fullDto);
			
		}
		return fullDtoList;
	}

	@GET
	@Path("/get-total-page-course/{categoryId}")
	@Produces(MediaType.APPLICATION_JSON)
	public HashMap<String, Object> getTotalPageCourseByCategoryId(@PathParam("categoryId") Long categoryId) {
		return courseLogic.getPagingCourseByCategoryId(categoryId);
	}

	@GET
	@Path("/search-list-course/{page}/{searchText}/{orderBy}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> searchListCourse(@PathParam("page") Integer page,
			@PathParam("searchText") String searchText, @PathParam("orderBy") String orderBy) {
		return courseLogic.getListCourseSearch(page, searchText, orderBy);
	}

	@GET
	@Path("/get-total-page-search-course/{searchText}")
	@Produces(MediaType.APPLICATION_JSON)
	public HashMap<String, Object> getTotalPageSeachCourse(@PathParam("searchText") String searchText) {
		// TODO update all sub info
		return courseLogic.getPagingCourseSearch(searchText);
	}

	@GET
	@Path("/get-course-information-payment/{courseId}")
	@Produces(MediaType.APPLICATION_JSON)
	public CouseInformationForPaymentDto getCourseInformationForPayment(@PathParam("courseId") Long courseId) {
		return courseLogic.getCourseInformationForPayment(courseId);
	}

	@GET
	@Path("/public/topten")
	@Produces(MediaType.APPLICATION_JSON)
	public List<TblCourseDto> search() {
		List<TblCourseDto> ret = courseLogic.searchTopTen();
		//TODO Optimize performance
		List<TblCourseDto> fullDtoList = new ArrayList<TblCourseDto>();
		for(TblCourseDto dto: ret){
			fullDtoList.add(loadCourseForFree(dto));
		}
		return fullDtoList;
	}
	
	
	@GET
	@Path("/course-count/{categoryId}")
	@Produces(MediaType.APPLICATION_JSON)
	public Map<String, Integer> courseCountByCat(@PathParam("categoryId")Long categoryId){
		Map<String, Integer> ret = new HashMap<>();
		ret.put("count", courseLogic.courseCountByCat(categoryId));
		return ret;
	}
	
	
}
