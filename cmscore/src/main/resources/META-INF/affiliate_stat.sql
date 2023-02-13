DROP TABLE IF EXISTS affiliate_stat CASCADE;
DROP SEQUENCE IF EXISTS affiliate_stat_id_seq CASCADE;

CREATE SEQUENCE affiliate_stat_id_seq START 1;
ALTER TABLE public.affiliate_stat_id_seq OWNER TO dolphin;

CREATE TABLE affiliate_stat (
		shv_id CHARACTER VARYING(255)  NOT NULL PRIMARY KEY ,
		total_point NUMERIC(19 , 2),
		delete_flg integer,
	    created_at timestamp without time zone,
	    created_by character varying(255) COLLATE pg_catalog."default",
	    updated_at timestamp without time zone,
	    updated_by character varying(255) COLLATE pg_catalog."default",
	    display_order integer
	);

ALTER TABLE affiliate_stat OWNER TO "dolphin";
