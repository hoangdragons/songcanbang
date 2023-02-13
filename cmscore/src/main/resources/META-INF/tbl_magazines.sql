DROP TABLE IF EXISTS tbl_magazines CASCADE;
DROP SEQUENCE IF EXISTS magazines_id_seq CASCADE;

CREATE SEQUENCE magazines_id_seq START 1;
ALTER TABLE public.magazines_id_seq OWNER TO dolphin;

CREATE TABLE tbl_magazines (
    magazine_id integer NOT NULL PRIMARY KEY DEFAULT nextval('magazines_id_seq'),
    image character varying(255) COLLATE "default",
    title character varying(255) COLLATE "default",
    summary_content character varying(512) COLLATE "default",
    content text COLLATE pg_catalog."default",
    publish_date timestamp without time zone,
    teacher_id integer,
    display_order integer,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255) COLLATE "default",
    updated_at timestamp without time zone,
    updated_by character varying(255) COLLATE "default"
);

ALTER TABLE tbl_magazines add column publish_by character varying(255);
ALTER TABLE tbl_magazines add column author character varying(255);
ALTER TABLE tbl_magazines add column camera_man character varying(255);
ALTER TABLE tbl_magazines add column category character varying(255);

ALTER TABLE tbl_magazines OWNER to dolphin;
