-- Table: public.learning_information

-- DROP TABLE public.learning_information;

CREATE TABLE public.learning_information
(
    id integer NOT NULL DEFAULT nextval('learning_information_id_seq'::regclass),
    material_id integer NOT NULL,
    lesson_id integer,
    chapter_id integer,
    course_id integer NOT NULL,
    user_id integer NOT NULL,
    completed integer,
    delete_flg integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    updated_by character varying(255) COLLATE pg_catalog."default",
    created_by character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT learning_information_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.learning_information
    OWNER to dolphin;

CREATE SEQUENCE public.learning_information_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.learning_information_id_seq
    OWNER TO dolphin;