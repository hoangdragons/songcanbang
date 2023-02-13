
--Postgresql
DROP TABLE IF EXISTS helper_course CASCADE;
DROP SEQUENCE IF EXISTS helper_course_id_seq CASCADE;

CREATE SEQUENCE helper_course_id_seq START 1;
ALTER TABLE public.helper_course_id_seq OWNER TO dolphin;
-- Table: public.helper_course

-- DROP TABLE public.helper_course;

CREATE TABLE public.helper_course
(
    course_id integer NOT NULL DEFAULT nextval('helper_course_id_seq'::regclass),
    content text COLLATE pg_catalog."default",
    image_url character varying(255) COLLATE pg_catalog."default",
    price double precision NOT NULL,
    puslish_date timestamp without time zone,
    rating double precision NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    total_view integer,
    video_url character varying(255) COLLATE pg_catalog."default",
    category_id integer,
    teacher_id integer,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255) COLLATE pg_catalog."default",
    updated_at timestamp without time zone,
    updated_by character varying(255) COLLATE pg_catalog."default",
    display_order integer,
    currency character varying(3) COLLATE pg_catalog."default",
    CONSTRAINT helper_course_pkey PRIMARY KEY (course_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.helper_course
    OWNER to dolphin;