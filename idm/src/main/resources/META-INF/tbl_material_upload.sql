DROP TABLE IF EXISTS tbl_material_upload CASCADE;
DROP SEQUENCE IF EXISTS material_upload_id_seq CASCADE;

CREATE SEQUENCE material_upload_id_seq START 1;
ALTER TABLE public.material_upload_id_seq OWNER TO dolphin;

CREATE TABLE tbl_material_upload (
		id INT8 NOT NULL PRIMARY KEY DEFAULT nextval('material_upload_id_seq'),
		owner_id INT8,
		title VARCHAR(255) NOT NULL,
		type INT4 NOT NULL,
		url VARCHAR(255) NOT NULL
	);

ALTER TABLE tbl_material_upload OWNER TO "dolphin";