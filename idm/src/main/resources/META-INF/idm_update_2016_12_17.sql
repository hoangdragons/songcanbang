alter table role ALTER COLUMN role_id SET DEFAULT nextval('role_id_seq'::regclass);
alter table function ALTER COLUMN func_id SET DEFAULT nextval('func_id_seq'::regclass);
 
alter table role_function ALTER COLUMN rf_id SET DEFAULT nextval('rf_id_seq'::regclass);
alter table user_role ALTER COLUMN ur_id SET DEFAULT nextval('ur_id_seq'::regclass);



--- ADD COLUMN
-- function
alter table function add column delete_flg integer;
alter table function add column created_at timestamp without time zone;
alter table function add column created_by character varying(255);
alter table function add column updated_at timestamp without time zone;
alter table function add column updated_by character varying(255);

-- role
alter table role add column delete_flg integer;
alter table role add column created_at timestamp without time zone;
alter table role add column created_by character varying(255);
alter table role add column updated_at timestamp without time zone;
alter table role add column updated_by character varying(255);

-- role_function
alter table role_function add column delete_flg integer;
alter table role_function add column created_at timestamp without time zone;
alter table role_function add column created_by character varying(255);
alter table role_function add column updated_at timestamp without time zone;
alter table role_function add column updated_by character varying(255);
-- tbl_user
alter table tbl_user add column delete_flg integer;
alter table tbl_user add column created_at timestamp without time zone;
alter table tbl_user add column created_by character varying(255);
alter table tbl_user add column updated_at timestamp without time zone;
alter table tbl_user add column updated_by character varying(255);
-- user_role
alter table user_role add column delete_flg integer;
alter table user_role add column created_at timestamp without time zone;
alter table user_role add column created_by character varying(255);
alter table user_role add column updated_at timestamp without time zone;
alter table user_role add column updated_by character varying(255);