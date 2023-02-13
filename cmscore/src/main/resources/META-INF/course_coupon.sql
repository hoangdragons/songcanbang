DROP TABLE IF EXISTS course_coupon CASCADE;
DROP SEQUENCE IF EXISTS course_coupon_id_seq CASCADE;

CREATE SEQUENCE course_coupon_id_seq START 1;
ALTER TABLE public.course_coupon_id_seq OWNER TO dolphin;

CREATE TABLE course_coupon (
		id INT4 NOT NULL PRIMARY KEY DEFAULT nextval('course_coupon_id_seq'),
		coupon_type CHARACTER VARYING(255) NOT NULL,
		course_id NUMERIC(19 , 2) NOT NULL,
		delete_flg integer,
	    created_at timestamp without time zone,
	    created_by character varying(255) COLLATE pg_catalog."default",
	    updated_at timestamp without time zone,
	    updated_by character varying(255) COLLATE pg_catalog."default",
	    display_order integer
	);

ALTER TABLE course_coupon OWNER TO "dolphin";