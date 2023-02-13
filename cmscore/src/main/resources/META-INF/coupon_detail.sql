DROP TABLE IF EXISTS coupon_detail CASCADE;
DROP SEQUENCE IF EXISTS coupon_detail_id_seq CASCADE;

CREATE SEQUENCE coupon_detail_id_seq START 1;
ALTER TABLE public.coupon_detail_id_seq OWNER TO dolphin;

CREATE TABLE coupon_detail (
		id INT4 NOT NULL PRIMARY KEY DEFAULT nextval('coupon_detail_id_seq'),
		coupon_type CHARACTER VARYING(255) NOT NULL,
		code CHARACTER VARYING(50),
		delete_flg integer,
	    created_at timestamp without time zone,
	    created_by character varying(255) COLLATE pg_catalog."default",
	    updated_at timestamp without time zone,
	    updated_by character varying(255) COLLATE pg_catalog."default",
	    display_order integer
	);

ALTER TABLE coupon_detail OWNER TO "dolphin";