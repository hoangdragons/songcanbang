CREATE SEQUENCE course_teacher_id_seq START 1;
ALTER TABLE public.course_teacher_id_seq OWNER TO dolphin;

CREATE TABLE course_teacher (
		id integer NOT NULL PRIMARY KEY DEFAULT nextval('course_teacher_id_seq'),
		teacher_id integer NOT NULL,
		course_id integer NOT NULL
	);

ALTER TABLE course_teacher OWNER TO "dolphin";
 

alter table course_teacher add column delete_flg integer;
alter table course_teacher add column created_at timestamp without time zone;
alter table course_teacher add column updated_at timestamp without time zone;
alter table course_teacher add column updated_by character varying(255);
alter table course_teacher add column created_by character varying(255);
