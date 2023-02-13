-- Table: public.tbl_material_upload

-- DROP TABLE public.tbl_material_upload;

CREATE TABLE public.tbl_material_upload
(
  id bigint NOT NULL,
  owner_id bigint,
  title character varying(255) NOT NULL,
  type integer NOT NULL,
  url character varying(255) NOT NULL,
  CONSTRAINT tbl_material_upload_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tbl_material_upload
  OWNER TO dolphin;
  
  
  -- Sequence: public.material_upload_id_seq

-- DROP SEQUENCE public.material_upload_id_seq;

CREATE SEQUENCE public.material_upload_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.material_upload_id_seq
  OWNER TO dolphin;
alter table tbl_material_upload add column duration bigint;