DROP TABLE IF EXISTS affiliate_info CASCADE;
DROP SEQUENCE IF EXISTS affiliate_info_id_seq CASCADE;

CREATE SEQUENCE affiliate_info_id_seq START 1;
ALTER TABLE public.affiliate_info_id_seq OWNER TO dolphin;

CREATE TABLE affiliate_info (
	    affiliate_info_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('affiliate_info_id_seq'),
		course_id NUMERIC(19 , 2) NOT NULL,
		shv_id CHARACTER VARYING(255),
		opener_id CHARACTER VARYING(255),
		delete_flg integer,
	    created_at timestamp without time zone,
	    created_by character varying(255) COLLATE pg_catalog."default",
	    updated_at timestamp without time zone,
	    updated_by character varying(255) COLLATE pg_catalog."default",
	    display_order integer
	);

ALTER TABLE affiliate_info OWNER TO "dolphin";