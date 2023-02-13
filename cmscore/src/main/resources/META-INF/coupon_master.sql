DROP TABLE IF EXISTS coupon_master CASCADE;
DROP SEQUENCE IF EXISTS coupon_master_id_seq CASCADE;

CREATE SEQUENCE coupon_master_id_seq START 1;
ALTER TABLE public.coupon_master_id_seq OWNER TO dolphin;

CREATE TABLE coupon_master (
		coupon_master_id INT4 NOT NULL PRIMARY KEY DEFAULT nextval('coupon_master_id_seq'),
		coupon_type CHARACTER VARYING(255) NOT NULL,
		start_at timestamp without time zone  NOT NULL,
		end_at timestamp without time zone  NOT NULL,
		discount FLOAT8 NOT NULL,
		description CHARACTER VARYING(1024),
		name CHARACTER VARYING(255),
		logo CHARACTER VARYING(1024),
		delete_flg integer,
	    created_at timestamp without time zone,
	    created_by character varying(255) COLLATE pg_catalog."default",
	    updated_at timestamp without time zone,
	    updated_by character varying(255) COLLATE pg_catalog."default",
	    display_order integer
	);

ALTER TABLE coupon_master OWNER TO "dolphin";