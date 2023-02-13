-- Table: public.register_user

-- DROP TABLE public.register_user;

CREATE TABLE public.register_user
(
    user_id bigint NOT NULL DEFAULT nextval('user_id_seq'::regclass),
    password character varying(50) COLLATE pg_catalog."default" NOT NULL,
    login_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    group_id numeric(19, 2),
    full_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    telephone character varying(15) COLLATE pg_catalog."default",
    birthday date,
    lang_id character varying(2) COLLATE pg_catalog."default",
    main_address character varying(2048) COLLATE pg_catalog."default",
    facebook_id character varying(512) COLLATE pg_catalog."default",
    google_id character varying(512) COLLATE pg_catalog."default",
    twitter_id character varying(512) COLLATE pg_catalog."default",
    cmtnd integer,
    cccd integer,
    mobile integer,
    add_user bigint,
    upd_user bigint,
    add_time timestamp without time zone,
    upd_time timestamp without time zone,
    avata bytea,
    sex integer,
    occupation character varying(512) COLLATE pg_catalog."default",
    avata_url character varying(512) COLLATE pg_catalog."default",
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255) COLLATE pg_catalog."default",
    updated_at timestamp without time zone,
    updated_by character varying(255) COLLATE pg_catalog."default",
    cover character varying(512) COLLATE pg_catalog."default",
    register_token character varying(1024) COLLATE pg_catalog."default",
    CONSTRAINT register_user_pkey PRIMARY KEY (user_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.register_user
    OWNER to dolphin;