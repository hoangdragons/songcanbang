DROP TABLE IF EXISTS tbl_course_rating CASCADE;
DROP SEQUENCE IF EXISTS rating_id_seq CASCADE;

CREATE SEQUENCE rating_id_seq START 1;
ALTER TABLE public.rating_id_seq OWNER TO dolphin;

CREATE TABLE tbl_course_rating (
		rating_id int4 NOT NULL PRIMARY KEY DEFAULT nextval('rating_id_seq'),
		course_id NUMERIC(19 , 2),
		rating_star int4,
		rating_comment text,
		rating_time TIMESTAMP,
		avatar_url VARCHAR(255),
		user_full_name VARCHAR(255)
	);
ALTER TABLE tbl_course_rating OWNER TO "dolphin";

alter table tbl_course_rating add column delete_flg integer;
alter table tbl_course_rating add column created_at timestamp without time zone;
alter table tbl_course_rating add column created_by character varying(255);
alter table tbl_course_rating add column updated_at timestamp without time zone;
alter table tbl_course_rating add column updated_by character varying(255);

alter table tbl_course_rating add column rating_emation character varying;