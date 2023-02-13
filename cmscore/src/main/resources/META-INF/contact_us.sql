DROP TABLE IF EXISTS contact_us CASCADE;
DROP SEQUENCE IF EXISTS contact_us_id_seq CASCADE;

CREATE SEQUENCE contact_us_id_seq START 1;
ALTER TABLE public.contact_us_id_seq OWNER TO dolphin;

CREATE TABLE contact_us (
		contact_us_id INT4 NOT NULL PRIMARY KEY DEFAULT nextval('contact_us_id_seq'),
		contact_name CHARACTER VARYING(255),
		contact_email CHARACTER VARYING(50),
		contact_message CHARACTER VARYING(1024),
		delete_flg integer,
	    created_at timestamp without time zone,
	    created_by character varying(255) COLLATE pg_catalog."default",
	    updated_at timestamp without time zone,
	    updated_by character varying(255) COLLATE pg_catalog."default",
	    display_order integer
	);

ALTER TABLE contact_us OWNER TO "dolphin";