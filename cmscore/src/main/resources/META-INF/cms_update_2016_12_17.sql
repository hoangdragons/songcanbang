-- tbl_bought_course	
alter table tbl_bought_course add column delete_flg integer;
alter table tbl_bought_course add column created_at timestamp without time zone;
alter table tbl_bought_course add column created_by character varying(255);
alter table tbl_bought_course add column updated_at timestamp without time zone;
alter table tbl_bought_course add column updated_by character varying(255);
-- tbl_category
alter table tbl_category add column delete_flg integer;
alter table  tbl_category   add column created_at timestamp without time zone;
alter table   tbl_category  add column created_by character varying(255);
alter table  tbl_category   add column updated_at timestamp without time zone;
alter table  tbl_category   add column updated_by character varying(255);
-- tbl_course
alter table tbl_course add column delete_flg integer;
alter table  tbl_course   add column created_at timestamp without time zone;
alter table  tbl_course   add column created_by character varying(255);
alter table  tbl_course   add column updated_at timestamp without time zone;
alter table  tbl_course   add column updated_by character varying(255);
-- tbl_course_chapter
alter table tbl_course_chapter add column delete_flg integer;
alter table  tbl_course_chapter   add column created_at timestamp without time zone;
alter table  tbl_course_chapter   add column created_by character varying(255);
alter table  tbl_course_chapter   add column updated_at timestamp without time zone;
alter table  tbl_course_chapter   add column updated_by character varying(255);
-- tbl_course_comment
alter table tbl_course_comment add column delete_flg integer;
alter table  tbl_course_comment   add column created_at timestamp without time zone;
alter table  tbl_course_comment   add column created_by character varying(255);
alter table  tbl_course_comment   add column updated_at timestamp without time zone;
alter table  tbl_course_comment   add column updated_by character varying(255);
-- tbl_course_lesson
alter table tbl_course_lesson add column delete_flg integer;
alter table  tbl_course_lesson   add column created_at timestamp without time zone;
alter table  tbl_course_lesson   add column created_by character varying(255);
alter table  tbl_course_lesson   add column updated_at timestamp without time zone;
alter table  tbl_course_lesson   add column updated_by character varying(255);
-- tbl_course_question
alter table tbl_course_question add column delete_flg integer;
alter table   tbl_course_question  add column created_at timestamp without time zone;
alter table   tbl_course_question  add column created_by character varying(255);
alter table  tbl_course_question   add column updated_at timestamp without time zone;
alter table  tbl_course_question   add column updated_by character varying(255);
-- tbl_course_sub_comment
alter table tbl_course_sub_comment add column delete_flg integer;
alter table  tbl_course_sub_comment   add column created_at timestamp without time zone;
alter table   tbl_course_sub_comment  add column created_by character varying(255);
alter table  tbl_course_sub_comment   add column updated_at timestamp without time zone;
alter table  tbl_course_sub_comment   add column updated_by character varying(255);
-- tbl_material_upload
alter table tbl_material_upload add column delete_flg integer;
alter table  tbl_material_upload   add column created_at timestamp without time zone;
alter table  tbl_material_upload   add column created_by character varying(255);
alter table  tbl_material_upload   add column updated_at timestamp without time zone;
alter table  tbl_material_upload   add column updated_by character varying(255);
-- tbl_teacher
alter table tbl_teacher add column delete_flg integer;
alter table   tbl_teacher  add column created_at timestamp without time zone;
alter table   tbl_teacher  add column created_by character varying(255);
alter table   tbl_teacher  add column updated_at timestamp without time zone;
alter table  tbl_teacher   add column updated_by character varying(255);