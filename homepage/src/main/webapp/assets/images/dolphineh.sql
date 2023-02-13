--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: clinic_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE clinic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clinic_id_seq OWNER TO dolphin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clinic; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE clinic (
    clinic_id integer DEFAULT nextval('clinic_id_seq'::regclass) NOT NULL,
    clinic_name character varying(512),
    clinic_mng character varying(512),
    clinic_address character varying(512),
    clinic_phone character varying(512),
    clinic_email character varying(512),
    clinic_specialist character varying(512),
    clinic_note character varying(512),
    clinic_avatar character varying(512),
    clinic_open_hour integer,
    clinic_open_minute integer,
    clinic_date_open timestamp without time zone,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer,
    clinic_close_hour integer,
    clinic_close_minute integer,
    clinic_tel_no character varying
);


ALTER TABLE clinic OWNER TO dolphin;

--
-- Name: commune_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE commune_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE commune_id_seq OWNER TO dolphin;

--
-- Name: commune; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE commune (
    commune_id integer DEFAULT nextval('commune_id_seq'::regclass) NOT NULL,
    commune_name character varying(512),
    district_id integer,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer,
    short_brief character varying,
    province_id integer
);


ALTER TABLE commune OWNER TO dolphin;

--
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE district_id_seq OWNER TO dolphin;

--
-- Name: district; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE district (
    district_id integer DEFAULT nextval('district_id_seq'::regclass) NOT NULL,
    district_name character varying(512),
    province_id integer,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer,
    short_brief character varying
);


ALTER TABLE district OWNER TO dolphin;

--
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctor_id_seq OWNER TO dolphin;

--
-- Name: doctor; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE doctor (
    doctor_id integer DEFAULT nextval('doctor_id_seq'::regclass) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    department character varying(255),
    mobile character varying(255),
    graduated_from character varying(255),
    avatar character varying(255),
    major character varying(255),
    age integer,
    years_of_experience integer,
    date_of_birth timestamp without time zone,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer,
    sex integer,
    address character varying,
    email character varying
);


ALTER TABLE doctor OWNER TO dolphin;

--
-- Name: doctor_calendar_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE doctor_calendar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctor_calendar_id_seq OWNER TO dolphin;

--
-- Name: doctor_calendar; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE doctor_calendar (
    calendar_id integer DEFAULT nextval('doctor_calendar_id_seq'::regclass) NOT NULL,
    working_day timestamp without time zone,
    morningexam integer,
    year integer,
    month integer,
    week integer,
    weekday integer,
    doctors character varying,
    clinic_id integer,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer
);


ALTER TABLE doctor_calendar OWNER TO dolphin;

--
-- Name: medical_test_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE medical_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medical_test_id_seq OWNER TO dolphin;

--
-- Name: medical_test; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE medical_test (
    test_id integer DEFAULT nextval('medical_test_id_seq'::regclass) NOT NULL,
    test_name character varying,
    test_desc character varying,
    test_type character varying,
    test_index character varying,
    test_avatar character varying,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer
);


ALTER TABLE medical_test OWNER TO dolphin;

--
-- Name: pathological_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE pathological_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pathological_id_seq OWNER TO dolphin;

--
-- Name: pathological; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE pathological (
    payment_id integer DEFAULT nextval('pathological_id_seq'::regclass) NOT NULL,
    pathological_id integer,
    pathological_name character varying,
    pathological_specialist character varying,
    pathological_define character varying,
    pathological_reason character varying,
    pathological_formation character varying,
    pathological_cell_biology character varying,
    pathological_clinical character varying,
    pathological_treatment character varying,
    pathological_avatar character varying,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer
);


ALTER TABLE pathological OWNER TO dolphin;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patient_id_seq OWNER TO dolphin;

--
-- Name: patient; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE patient (
    patient_id integer DEFAULT nextval('patient_id_seq'::regclass) NOT NULL,
    first_name character varying,
    last_name character varying,
    patient_code character varying,
    register_date timestamp without time zone,
    address character varying,
    phone character varying,
    email character varying,
    date_of_birth timestamp without time zone,
    cmnd numeric(12,0),
    sex integer,
    morning_exam integer,
    avatar character varying,
    email_notification integer,
    sms_notification integer,
    examination_reason character varying,
    examination_id character varying,
    examination_ids character varying,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer,
    province_id integer,
    district_id integer,
    commune_id integer,
    firstname character varying,
    surname character varying,
    midname character varying,
    occupation integer,
    ethnic integer,
    deptid character varying,
    roomid character varying,
    examtype character varying,
    objectid integer,
    examdate timestamp without time zone
);


ALTER TABLE patient OWNER TO dolphin;

--
-- Name: province_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE province_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE province_id_seq OWNER TO dolphin;

--
-- Name: province; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE province (
    province_id integer DEFAULT nextval('province_id_seq'::regclass) NOT NULL,
    province_name character varying(512),
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer,
    short_brief character varying
);


ALTER TABLE province OWNER TO dolphin;

--
-- Name: queue_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE queue_id_seq OWNER TO dolphin;

--
-- Name: queue; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE queue (
    queue_id integer DEFAULT nextval('queue_id_seq'::regclass) NOT NULL,
    patient_id integer,
    first_name character varying,
    last_name character varying,
    patient_code character varying,
    register_date timestamp without time zone,
    address character varying,
    phone character varying,
    email character varying,
    date_of_birth timestamp without time zone,
    province_code character varying,
    cmnd numeric(12,0),
    sexuality integer,
    morning_exam integer,
    avatar character varying,
    email_notification integer,
    sms_notification integer,
    examination_reason character varying,
    examination_id character varying,
    examination_ids character varying,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer
);


ALTER TABLE queue OWNER TO dolphin;

--
-- Name: reminder_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE reminder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reminder_id_seq OWNER TO dolphin;

--
-- Name: reminder; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE reminder (
    payment_id integer DEFAULT nextval('reminder_id_seq'::regclass) NOT NULL,
    reminder_id integer,
    reminder_email character varying,
    reminder_mobile character varying,
    patient_id integer,
    queue_id integer,
    clinic_id integer,
    examination_id integer,
    examination_note character varying,
    exam_date timestamp without time zone,
    morning_exam integer,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer
);


ALTER TABLE reminder OWNER TO dolphin;

--
-- Name: slip_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE slip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE slip_id_seq OWNER TO dolphin;

--
-- Name: slip; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE slip (
    slip_id integer DEFAULT nextval('slip_id_seq'::regclass) NOT NULL,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer
);


ALTER TABLE slip OWNER TO dolphin;

--
-- Name: specialist_id_seq; Type: SEQUENCE; Schema: public; Owner: dolphin
--

CREATE SEQUENCE specialist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialist_id_seq OWNER TO dolphin;

--
-- Name: specialist; Type: TABLE; Schema: public; Owner: dolphin
--

CREATE TABLE specialist (
    specialist_id integer DEFAULT nextval('specialist_id_seq'::regclass) NOT NULL,
    specialist_name character varying,
    specialist_func character varying,
    specialist_doctors character varying,
    specialist_avatar character varying,
    delete_flg integer,
    created_at timestamp without time zone,
    created_by character varying(255),
    updated_at timestamp without time zone,
    updated_by character varying(255),
    display_order integer
);


ALTER TABLE specialist OWNER TO dolphin;

--
-- Name: 16609; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16609');


ALTER LARGE OBJECT 16609 OWNER TO dolphin;

--
-- Name: 16610; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16610');


ALTER LARGE OBJECT 16610 OWNER TO dolphin;

--
-- Name: 16611; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16611');


ALTER LARGE OBJECT 16611 OWNER TO dolphin;

--
-- Name: 16612; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16612');


ALTER LARGE OBJECT 16612 OWNER TO dolphin;

--
-- Name: 16613; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16613');


ALTER LARGE OBJECT 16613 OWNER TO dolphin;

--
-- Name: 16665; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16665');


ALTER LARGE OBJECT 16665 OWNER TO dolphin;

--
-- Name: 16666; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16666');


ALTER LARGE OBJECT 16666 OWNER TO dolphin;

--
-- Name: 16667; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16667');


ALTER LARGE OBJECT 16667 OWNER TO dolphin;

--
-- Name: 16679; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16679');


ALTER LARGE OBJECT 16679 OWNER TO dolphin;

--
-- Name: 16680; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16680');


ALTER LARGE OBJECT 16680 OWNER TO dolphin;

--
-- Name: 16681; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16681');


ALTER LARGE OBJECT 16681 OWNER TO dolphin;

--
-- Name: 16738; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16738');


ALTER LARGE OBJECT 16738 OWNER TO dolphin;

--
-- Name: 16739; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16739');


ALTER LARGE OBJECT 16739 OWNER TO dolphin;

--
-- Name: 16740; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16740');


ALTER LARGE OBJECT 16740 OWNER TO dolphin;

--
-- Name: 16741; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16741');


ALTER LARGE OBJECT 16741 OWNER TO dolphin;

--
-- Name: 16742; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16742');


ALTER LARGE OBJECT 16742 OWNER TO dolphin;

--
-- Name: 16743; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16743');


ALTER LARGE OBJECT 16743 OWNER TO dolphin;

--
-- Name: 16744; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16744');


ALTER LARGE OBJECT 16744 OWNER TO dolphin;

--
-- Name: 16745; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16745');


ALTER LARGE OBJECT 16745 OWNER TO dolphin;

--
-- Name: 16746; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16746');


ALTER LARGE OBJECT 16746 OWNER TO dolphin;

--
-- Name: 16747; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16747');


ALTER LARGE OBJECT 16747 OWNER TO dolphin;

--
-- Name: 16748; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16748');


ALTER LARGE OBJECT 16748 OWNER TO dolphin;

--
-- Name: 16749; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16749');


ALTER LARGE OBJECT 16749 OWNER TO dolphin;

--
-- Name: 16750; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16750');


ALTER LARGE OBJECT 16750 OWNER TO dolphin;

--
-- Name: 16751; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16751');


ALTER LARGE OBJECT 16751 OWNER TO dolphin;

--
-- Name: 16752; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16752');


ALTER LARGE OBJECT 16752 OWNER TO dolphin;

--
-- Name: 16753; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16753');


ALTER LARGE OBJECT 16753 OWNER TO dolphin;

--
-- Name: 16754; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16754');


ALTER LARGE OBJECT 16754 OWNER TO dolphin;

--
-- Name: 16755; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16755');


ALTER LARGE OBJECT 16755 OWNER TO dolphin;

--
-- Name: 16756; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16756');


ALTER LARGE OBJECT 16756 OWNER TO dolphin;

--
-- Name: 16757; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16757');


ALTER LARGE OBJECT 16757 OWNER TO dolphin;

--
-- Name: 16758; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16758');


ALTER LARGE OBJECT 16758 OWNER TO dolphin;

--
-- Name: 16759; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16759');


ALTER LARGE OBJECT 16759 OWNER TO dolphin;

--
-- Name: 16760; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16760');


ALTER LARGE OBJECT 16760 OWNER TO dolphin;

--
-- Name: 16761; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16761');


ALTER LARGE OBJECT 16761 OWNER TO dolphin;

--
-- Name: 16762; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16762');


ALTER LARGE OBJECT 16762 OWNER TO dolphin;

--
-- Name: 16763; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16763');


ALTER LARGE OBJECT 16763 OWNER TO dolphin;

--
-- Name: 16764; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16764');


ALTER LARGE OBJECT 16764 OWNER TO dolphin;

--
-- Name: 16765; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16765');


ALTER LARGE OBJECT 16765 OWNER TO dolphin;

--
-- Name: 16766; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16766');


ALTER LARGE OBJECT 16766 OWNER TO dolphin;

--
-- Name: 16767; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16767');


ALTER LARGE OBJECT 16767 OWNER TO dolphin;

--
-- Name: 16768; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16768');


ALTER LARGE OBJECT 16768 OWNER TO dolphin;

--
-- Name: 16769; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16769');


ALTER LARGE OBJECT 16769 OWNER TO dolphin;

--
-- Name: 16770; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16770');


ALTER LARGE OBJECT 16770 OWNER TO dolphin;

--
-- Name: 16771; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16771');


ALTER LARGE OBJECT 16771 OWNER TO dolphin;

--
-- Name: 16772; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16772');


ALTER LARGE OBJECT 16772 OWNER TO dolphin;

--
-- Name: 16773; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16773');


ALTER LARGE OBJECT 16773 OWNER TO dolphin;

--
-- Name: 16774; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16774');


ALTER LARGE OBJECT 16774 OWNER TO dolphin;

--
-- Name: 16775; Type: BLOB; Schema: -; Owner: dolphin
--

SELECT pg_catalog.lo_create('16775');


ALTER LARGE OBJECT 16775 OWNER TO dolphin;

--
-- Data for Name: clinic; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY clinic (clinic_id, clinic_name, clinic_mng, clinic_address, clinic_phone, clinic_email, clinic_specialist, clinic_note, clinic_avatar, clinic_open_hour, clinic_open_minute, clinic_date_open, delete_flg, created_at, created_by, updated_at, updated_by, display_order, clinic_close_hour, clinic_close_minute, clinic_tel_no) FROM stdin;
1	Ngoại tổng hợp	Nguyễn Văn An	Tân Triều - Hà đông	\N	abc@gmail.com	Ung bướu	Tất cả các ngày trong tuần	\N	8	0	2017-10-21 05:00:00	0	2017-08-28 08:13:45.884	1	\N	\N	\N	21	0	\N
\.


--
-- Name: clinic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('clinic_id_seq', 1, true);


--
-- Data for Name: commune; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY commune (commune_id, commune_name, district_id, delete_flg, created_at, created_by, updated_at, updated_by, display_order, short_brief, province_id) FROM stdin;
2250309	Phường Cẩm Sơn	22503	0	\N	\N	\N	\N	\N	cs	225
2250311	Phường Cẩm Đông	22503	0	\N	\N	\N	\N	\N	cd	225
2250313	Phường Cẩm Tây	22503	0	\N	\N	\N	\N	\N	ct	225
2250315	Phường Cẩm Thành	22503	0	\N	\N	\N	\N	\N	ct	225
2250317	Phường Cẩm Trung	22503	0	\N	\N	\N	\N	\N	ct	225
2250319	Phường Cẩm Thủy	22503	0	\N	\N	\N	\N	\N	ct	225
2250321	Phường Cẩm Thạch	22503	0	\N	\N	\N	\N	\N	ct	225
2250323	Xã Cộng Hòa	22503	0	\N	\N	\N	\N	\N	ch	225
2250325	Xã Dương Huy	22503	0	\N	\N	\N	\N	\N	dh	225
2250327	Xã Cẩm Bình	22503	0	\N	\N	\N	\N	\N	cb	225
2251929	Xã Đại Yên	22519	0	\N	\N	\N	\N	\N	dy	225
2252100	Không xác định	22521	0	\N	\N	\N	\N	\N	kx	225
2252101	Thị trấn Đông Triều	22521	0	\N	\N	\N	\N	\N	dt	225
2252105	Xã Bình Dương	22521	0	\N	\N	\N	\N	\N	bd	225
2252107	Xã Nguyễn Huệ	22521	0	\N	\N	\N	\N	\N	nh	225
2252109	Xã Thủy An	22521	0	\N	\N	\N	\N	\N	ta	225
2252111	Xã Việt Dân	22521	0	\N	\N	\N	\N	\N	vd	225
2252113	Xã An Sinh	22521	0	\N	\N	\N	\N	\N	as	225
2252115	Xã Tân Việt	22521	0	\N	\N	\N	\N	\N	tv	225
2252117	Xã Hồng Phong	22521	0	\N	\N	\N	\N	\N	hp	225
2252119	Xã Đức Chính	22521	0	\N	\N	\N	\N	\N	dc	225
2252121	Xã Tràng An	22521	0	\N	\N	\N	\N	\N	ta	225
2252125	Xã Xuân Sơn	22521	0	\N	\N	\N	\N	\N	xs	225
2252127	Xã Kim Sơn	22521	0	\N	\N	\N	\N	\N	ks	225
2252129	Xã Yên Thọ	22521	0	\N	\N	\N	\N	\N	yt	225
2252131	Xã Yên Đức	22521	0	\N	\N	\N	\N	\N	yd	225
2252133	Xã Hoàng Quế	22521	0	\N	\N	\N	\N	\N	hq	225
2252135	Xã Hồng Thái Tây	22521	0	\N	\N	\N	\N	\N	htt	225
2252137	Xã Hồng Thái Đông	22521	0	\N	\N	\N	\N	\N	htd	225
2252139	Xã Bình Khê	22521	0	\N	\N	\N	\N	\N	bk	225
2252141	Xã Tràng Lương	22521	0	\N	\N	\N	\N	\N	tl	225
2252300	Không xác định	22523	0	\N	\N	\N	\N	\N	kx	225
2252301	Xã Cô Tô	22523	0	\N	\N	\N	\N	\N	ct	225
2252303	Xã Thanh Lân	22523	0	\N	\N	\N	\N	\N	tl	225
2252500	Không xác định	22525	0	\N	\N	\N	\N	\N	kx	225
2252501	Thị trấn Quảng Yên	22525	0	\N	\N	\N	\N	\N	qy	225
2252503	Xã Minh Thành	22525	0	\N	\N	\N	\N	\N	mt	225
2252505	Xã Đông Mai	22525	0	\N	\N	\N	\N	\N	dm	225
2252507	Xã Sông Khoai	22525	0	\N	\N	\N	\N	\N	sk	225
2252509	Xã Cộng Hòa	22525	0	\N	\N	\N	\N	\N	ch	225
2252511	Xã Tiền An	22525	0	\N	\N	\N	\N	\N	ta	225
2252513	Xã Tân An	22525	0	\N	\N	\N	\N	\N	ta	225
2252515	Xã Hoàng Tân	22525	0	\N	\N	\N	\N	\N	ht	225
2252517	Xã Hà An	22525	0	\N	\N	\N	\N	\N	ha	225
2252519	Xã Điền Công	22525	0	\N	\N	\N	\N	\N	dc	225
2252521	Xã Hiệp Hòa	22525	0	\N	\N	\N	\N	\N	hh	225
2252523	Xã Yên Giang	22525	0	\N	\N	\N	\N	\N	yg	225
2252525	Xã Nam Hòa	22525	0	\N	\N	\N	\N	\N	nh	225
2252527	Xã Yên Hải	22525	0	\N	\N	\N	\N	\N	yh	225
2252529	Xã Cẩm La	22525	0	\N	\N	\N	\N	\N	cl	225
2252531	Xã Phong Cốc	22525	0	\N	\N	\N	\N	\N	pc	225
2252533	Xã Phong Hải	22525	0	\N	\N	\N	\N	\N	ph	225
2252535	Xã Liên Hòa	22525	0	\N	\N	\N	\N	\N	lh	225
2252537	Xã Liên Vị	22525	0	\N	\N	\N	\N	\N	lv	225
2252539	Xã Tiền Phong	22525	0	\N	\N	\N	\N	\N	tp	225
3010000	Không xác định	30100	0	\N	\N	\N	\N	\N	kx	301
3010100	Không xác định	30101	0	\N	\N	\N	\N	\N	kx	301
3010101	Phường Mường Thanh	30101	0	\N	\N	\N	\N	\N	mt	301
3010103	Phường Thanh Bình	30101	0	\N	\N	\N	\N	\N	tb	301
3010105	Phường Him Lam	30101	0	\N	\N	\N	\N	\N	hl	301
3010107	Xã Thanh Minh	30101	0	\N	\N	\N	\N	\N	tm	301
3010109	Xã Noong Bua	30101	0	\N	\N	\N	\N	\N	nb	301
3010300	Không xác định	30103	0	\N	\N	\N	\N	\N	kx	301
3010301	Phường Na Lay	30103	0	\N	\N	\N	\N	\N	nl	301
3010303	Phường Lê Lợi	30103	0	\N	\N	\N	\N	\N	ll	301
3010305	Phường Sông Đà	30103	0	\N	\N	\N	\N	\N	sd	301
3010500	Không xác định	30105	0	\N	\N	\N	\N	\N	kx	301
3010501	Thị trấn Mường Tè	30105	0	\N	\N	\N	\N	\N	mt	301
3010503	Xã Thu Lũm	30105	0	\N	\N	\N	\N	\N	tl	301
3010505	Xã Ka Lăng	30105	0	\N	\N	\N	\N	\N	kl	301
3010507	Xã Pa Vệ Sử	30105	0	\N	\N	\N	\N	\N	pvs	301
3010509	Xã Hua Bun	30105	0	\N	\N	\N	\N	\N	hb	301
3010511	Xã Mường Tè	30105	0	\N	\N	\N	\N	\N	mt	301
3010513	Xã Bun Nưa	30105	0	\N	\N	\N	\N	\N	bn	301
3010515	Xã Bun Tở	30105	0	\N	\N	\N	\N	\N	bt	301
3010517	Xã Mường Mô	30105	0	\N	\N	\N	\N	\N	mm	301
3010519	Xã Sín Thầu	30105	0	\N	\N	\N	\N	\N	st	301
3010521	Xã Chung Chải	30105	0	\N	\N	\N	\N	\N	cc	301
3010523	Xã Mường Nhé	30105	0	\N	\N	\N	\N	\N	mn	301
3010525	Xã Mường Toong	30105	0	\N	\N	\N	\N	\N	mt	301
3010527	Xã Mù Cả	30105	0	\N	\N	\N	\N	\N	mc	301
3010529	Xã Pa ủ	30105	0	\N	\N	\N	\N	\N	pu	301
2252103	Phường Mạo Khê	22521	0	\N	\N	\N	\N	\N	mk	225
3010531	Xã Tà Tổng	30105	0	\N	\N	\N	\N	\N	tt	301
3010533	Xã Nậm Khao	30105	0	\N	\N	\N	\N	\N	nk	301
3010535	Xã Kan Hồ	30105	0	\N	\N	\N	\N	\N	kh	301
3010700	Không xác định	30107	0	\N	\N	\N	\N	\N	kx	301
3010701	Thị trấn Phong Thổ	30107	0	\N	\N	\N	\N	\N	pt	301
3010703	Xã Sì Lờ Lầu	30107	0	\N	\N	\N	\N	\N	sll	301
3010705	Xã Mồ Sì San	30107	0	\N	\N	\N	\N	\N	mss	301
3010707	Xã Ma Li Chải	30107	0	\N	\N	\N	\N	\N	mlc	301
3010709	Xã Pa Vây Sử	30107	0	\N	\N	\N	\N	\N	pvs	301
3010711	Xã Vàng Ma Chải	30107	0	\N	\N	\N	\N	\N	vmc	301
3010713	Xã Tông Qua Lìn	30107	0	\N	\N	\N	\N	\N	tql	301
1010000	Không xác định	10100	0	\N	\N	\N	\N	\N	kx	101
1010100	Không xác định	10101	0	\N	\N	\N	\N	\N	kx	101
1010101	Phường Phúc Xá	10101	0	\N	\N	\N	\N	\N	px	101
1010105	Phường Quán Thánh	10101	0	\N	\N	\N	\N	\N	qt	101
1010107	Phường Trúc Bạch	10101	0	\N	\N	\N	\N	\N	tb	101
1010109	Phường Điện Biên	10101	0	\N	\N	\N	\N	\N	db	101
1010111	Phường Kim Mã	10101	0	\N	\N	\N	\N	\N	km	101
1010113	Phường Đội Cấn	10101	0	\N	\N	\N	\N	\N	dc	101
1010115	Phường Cống Vị	10101	0	\N	\N	\N	\N	\N	cv	101
1010117	Phường Ngọc Khánh	10101	0	\N	\N	\N	\N	\N	nk	101
1010119	Phường Giảng Võ	10101	0	\N	\N	\N	\N	\N	gv	101
1010121	Phường Ngọc Hà	10101	0	\N	\N	\N	\N	\N	nh	101
1010123	Phường Thành Công	10101	0	\N	\N	\N	\N	\N	tc	101
3010715	Xã Dào San	30107	0	\N	\N	\N	\N	\N	ds	301
3010717	Xã Mù Sang	30107	0	\N	\N	\N	\N	\N	ms	301
3010719	Xã Ma Ly Pho	30107	0	\N	\N	\N	\N	\N	mlp	301
3010721	Xã Hoang Thèn	30107	0	\N	\N	\N	\N	\N	ht	301
3010723	Xã Bản Lang	30107	0	\N	\N	\N	\N	\N	bl	301
1010300	Không xác định	10103	0	\N	\N	\N	\N	\N	kx	101
1010305	Phường Yên Phụ	10103	0	\N	\N	\N	\N	\N	yp	101
1010307	Phường Tứ Liên	10103	0	\N	\N	\N	\N	\N	tl	101
1010309	Phường Nhật Tân	10103	0	\N	\N	\N	\N	\N	nt	101
1010311	Phường Quảng An	10103	0	\N	\N	\N	\N	\N	qa	101
1010313	Phường Xuân La	10103	0	\N	\N	\N	\N	\N	xl	101
1010315	Phường Phú Thượng	10103	0	\N	\N	\N	\N	\N	pt	101
1010500	Không xác định	10105	0	\N	\N	\N	\N	\N	kx	101
1010501	Phường Cửa Nam	10105	0	\N	\N	\N	\N	\N	cn	101
1010505	Phường Hàng Bài	10105	0	\N	\N	\N	\N	\N	hb	101
1010303	Phường Thuỵ Khuê	10103	0	\N	\N	\N	\N	\N	tk	101
1010509	Phường Tràng Tiền	10105	0	\N	\N	\N	\N	\N	tt	101
1010511	Phường Hàng Bạc	10105	0	\N	\N	\N	\N	\N	hb	101
1010515	Phường Hàng Buồm	10105	0	\N	\N	\N	\N	\N	hb	101
1010517	Phường Đồng Xuân	10105	0	\N	\N	\N	\N	\N	dx	101
1010519	Phường Hàng Đào	10105	0	\N	\N	\N	\N	\N	hd	101
1010521	Phường Hàng Mã	10105	0	\N	\N	\N	\N	\N	hm	101
1010523	Phường Hàng Bồ	10105	0	\N	\N	\N	\N	\N	hb	101
1010525	Phường Cửa Đông	10105	0	\N	\N	\N	\N	\N	cd	101
1010527	Phường Hàng Bông	10105	0	\N	\N	\N	\N	\N	hb	101
1010529	Phường Hàng Gai	10105	0	\N	\N	\N	\N	\N	hg	101
1010531	Phường Hàng Trống	10105	0	\N	\N	\N	\N	\N	ht	101
1010533	Phường Phúc Tân	10105	0	\N	\N	\N	\N	\N	pt	101
1010513	Phường Lý Thái Tổ	10105	0	\N	\N	\N	\N	\N	tt	101
1010700	Không xác định	10107	0	\N	\N	\N	\N	\N	kx	101
1010701	Phường Nguyễn Du	10107	0	\N	\N	\N	\N	\N	nd	101
1010301	Phường Bưởi	10103	0	\N	\N	\N	\N	\N	pb	101
1010707	Phường Phố Huế	10107	0	\N	\N	\N	\N	\N	ph	101
1011111	Phường Thanh Xuân Trung	10111	0	\N	\N	\N	\N	\N	xt	101
1010705	Phường Bùi Thị Xuân	10107	0	\N	\N	\N	\N	\N	btx	101
1010713	Phường Đồng Nhân	10107	0	\N	\N	\N	\N	\N	dn	101
1010715	Phường Đông Mác	10107	0	\N	\N	\N	\N	\N	dm	101
1010717	Phường Bạch Đằng	10107	0	\N	\N	\N	\N	\N	bd	101
1010719	Phường Thanh Lương	10107	0	\N	\N	\N	\N	\N	tl	101
1010721	Phường Thanh Nhàn	10107	0	\N	\N	\N	\N	\N	tn	101
1010723	Phường Cầu Dền	10107	0	\N	\N	\N	\N	\N	cd	101
1010725	Phường Bách Khoa	10107	0	\N	\N	\N	\N	\N	bk	101
1010727	Phường Bạch Mai	10107	0	\N	\N	\N	\N	\N	bm	101
1010729	Phường Quỳnh Lôi	10107	0	\N	\N	\N	\N	\N	ql	101
1010731	Phường Quỳnh Mai	10107	0	\N	\N	\N	\N	\N	qm	101
1010733	Phường Vĩnh Tuy	10107	0	\N	\N	\N	\N	\N	vt	101
1010735	Phường Minh Khai	10107	0	\N	\N	\N	\N	\N	mk	101
1010737	Phường Trương Định	10107	0	\N	\N	\N	\N	\N	td	101
1010739	Phường Đồng Tâm	10107	0	\N	\N	\N	\N	\N	dt	101
1010741	Phường Tương Mai	10107	0	\N	\N	\N	\N	\N	tm	101
1010743	Phường Giáp Bát	10107	0	\N	\N	\N	\N	\N	gb	101
1010745	Phường Mai Động	10107	0	\N	\N	\N	\N	\N	md	101
1010747	Phường Tân Mai	10107	0	\N	\N	\N	\N	\N	tm	101
1011100	Không xác định	10111	0	\N	\N	\N	\N	\N	kx	101
1011101	Phường Nhân Chính	10111	0	\N	\N	\N	\N	\N	nc	101
1011103	Phường Khương Trung	10111	0	\N	\N	\N	\N	\N	kt	101
1011105	Phường Khương Mai	10111	0	\N	\N	\N	\N	\N	km	101
1011107	Phường Phương Liệt	10111	0	\N	\N	\N	\N	\N	pl	101
1011109	Phường Thượng Đình	10111	0	\N	\N	\N	\N	\N	td	101
1011113	Phường Khương Đình	10111	0	\N	\N	\N	\N	\N	kd	101
1011115	Phường Hạ Đình	10111	0	\N	\N	\N	\N	\N	hd	101
1011121	Phường Kim Giang	10111	0	\N	\N	\N	\N	\N	kg	101
1011300	Không xác định	10113	0	\N	\N	\N	\N	\N	kx	101
1011301	Phường Nghĩa Đô	10113	0	\N	\N	\N	\N	\N	nd	101
1011303	Phường Nghĩa Tân	10113	0	\N	\N	\N	\N	\N	nt	101
1011305	Phường Quan Hoa	10113	0	\N	\N	\N	\N	\N	qh	101
1011307	Phường Mai Dịch	10113	0	\N	\N	\N	\N	\N	md	101
1011309	Phường Dịch Vọng	10113	0	\N	\N	\N	\N	\N	dv	101
1011311	Phường Yên Hoà	10113	0	\N	\N	\N	\N	\N	yh	101
2250329	Xã Cẩm Hải	22503	0	\N	\N	\N	\N	\N	ch	225
2250331	Xã Quang Hanh	22503	0	\N	\N	\N	\N	\N	qh	225
2250500	Không xác định	22505	0	\N	\N	\N	\N	\N	kx	225
1011313	Phường Trung Hoà	10113	0	\N	\N	\N	\N	\N	th	101
1011500	Không xác định	10115	0	\N	\N	\N	\N	\N	kx	101
1011501	Thị trấn Sóc Sơn	10115	0	\N	\N	\N	\N	\N	ss	101
2250501	Phường Vàng Danh	22505	0	\N	\N	\N	\N	\N	vd	225
2250503	Phường Bắc Sơn	22505	0	\N	\N	\N	\N	\N	bs	225
2250505	Phường Trương Vương	22505	0	\N	\N	\N	\N	\N	tv	225
2250507	Phường Quang Trung	22505	0	\N	\N	\N	\N	\N	qt	225
2250509	Phường Thanh Sơn	22505	0	\N	\N	\N	\N	\N	ts	225
2250511	Xã Thượng Yên Công	22505	0	\N	\N	\N	\N	\N	tyc	225
2250513	Xã Nam Khê	22505	0	\N	\N	\N	\N	\N	nk	225
2250517	Xã Phương Nam	22505	0	\N	\N	\N	\N	\N	pn	225
2250700	Không xác định	22507	0	\N	\N	\N	\N	\N	kx	225
2250701	Thị trấn Bình Liêu	22507	0	\N	\N	\N	\N	\N	bl	225
2250703	Xã Đồng Văn	22507	0	\N	\N	\N	\N	\N	dv	225
2250705	Xã Hoành Mô	22507	0	\N	\N	\N	\N	\N	hm	225
1011503	Xã Tân Dân	10115	0	\N	\N	\N	\N	\N	td	101
1011505	Xã Thanh Xuân	10115	0	\N	\N	\N	\N	\N	tx	101
1011507	Xã Minh Trí	10115	0	\N	\N	\N	\N	\N	mt	101
1011509	Xã Minh Phú	10115	0	\N	\N	\N	\N	\N	mp	101
2250707	Xã Đồng Tâm	22507	0	\N	\N	\N	\N	\N	dt	225
2250709	Xã Lục Hồn	22507	0	\N	\N	\N	\N	\N	lh	225
2250711	Xã Tĩnh Húc	22507	0	\N	\N	\N	\N	\N	th	225
2250713	Xã Húc Động	22507	0	\N	\N	\N	\N	\N	hd	225
1011511	Xã Hiền Ninh	10115	0	\N	\N	\N	\N	\N	hn	101
1011513	Xã Quang Tiến	10115	0	\N	\N	\N	\N	\N	qt	101
1011515	Xã Phú Cường	10115	0	\N	\N	\N	\N	\N	pc	101
1011517	Xã Phú Minh	10115	0	\N	\N	\N	\N	\N	pm	101
1011519	Xã Mai Đình	10115	0	\N	\N	\N	\N	\N	md	101
1011521	Xã Phù Lỗ	10115	0	\N	\N	\N	\N	\N	pl	101
1011523	Xã Đông Xuân	10115	0	\N	\N	\N	\N	\N	dx	101
1011525	Xã Nam Sơn	10115	0	\N	\N	\N	\N	\N	ns	101
1011527	Xã Bắc Sơn	10115	0	\N	\N	\N	\N	\N	bs	101
1011529	Xã Hồng Kỳ	10115	0	\N	\N	\N	\N	\N	hk	101
2250715	Xã Vô Ngại	22507	0	\N	\N	\N	\N	\N	vn	225
2250900	Không xác định	22509	0	\N	\N	\N	\N	\N	kx	225
2250901	Phường Ca Long	22509	0	\N	\N	\N	\N	\N	cl	225
2250903	Phường Trần Phú	22509	0	\N	\N	\N	\N	\N	tp	225
2250905	Phường Hòa Lạc	22509	0	\N	\N	\N	\N	\N	hl	225
2250907	Phường Ninh Dương	22509	0	\N	\N	\N	\N	\N	nd	225
2250909	Phường Trà Cổ	22509	0	\N	\N	\N	\N	\N	tc	225
2250911	Xã Hải Sơn	22509	0	\N	\N	\N	\N	\N	hs	225
2250913	Xã Bình Ngọc	22509	0	\N	\N	\N	\N	\N	bn	225
2250915	Xã Hải Xuân	22509	0	\N	\N	\N	\N	\N	hx	225
2250917	Xã Hải Hòa	22509	0	\N	\N	\N	\N	\N	hh	225
2250919	Xã Vạn Ninh	22509	0	\N	\N	\N	\N	\N	vn	225
2250921	Xã Hải Yến	22509	0	\N	\N	\N	\N	\N	hy	225
2250923	Xã Hải Đông	22509	0	\N	\N	\N	\N	\N	hd	225
2250925	Xã Hải Tiến	22509	0	\N	\N	\N	\N	\N	ht	225
2250927	Xã Quảng Nghĩa	22509	0	\N	\N	\N	\N	\N	qn	225
2250929	Xã Vĩnh Thực	22509	0	\N	\N	\N	\N	\N	vt	225
2250931	Xã Vĩnh Trung	22509	0	\N	\N	\N	\N	\N	vt	225
2251100	Không xác định	22511	0	\N	\N	\N	\N	\N	kx	225
2251101	Thị trấn Quảng Hà	22511	0	\N	\N	\N	\N	\N	qh	225
2251103	Thị trấn Đầm Hà	22511	0	\N	\N	\N	\N	\N	dh	225
2251105	Xã Quảng Đức	22511	0	\N	\N	\N	\N	\N	qd	225
2251107	Xã Quảng Sơn	22511	0	\N	\N	\N	\N	\N	qs	225
2251109	Xã Quảng Thành	22511	0	\N	\N	\N	\N	\N	qt	225
2251111	Xã Quảng Thịnh	22511	0	\N	\N	\N	\N	\N	qt	225
2251113	Xã Quảng Minh	22511	0	\N	\N	\N	\N	\N	qm	225
2251115	Xã Quảng Thắng	22511	0	\N	\N	\N	\N	\N	qt	225
1060921	Xã Trạm Lộ	10609	0	\N	\N	\N	\N	\N	tl	106
2251117	Xã Quảng Chính	22511	0	\N	\N	\N	\N	\N	qc	225
2251119	Xã Quảng Trung	22511	0	\N	\N	\N	\N	\N	qt	225
2251121	Xã Quảng Long	22511	0	\N	\N	\N	\N	\N	ql	225
2251123	Xã Quảng Điền	22511	0	\N	\N	\N	\N	\N	qd	225
2251125	Xã Quảng Phong	22511	0	\N	\N	\N	\N	\N	qp	225
2251127	Xã Phú Hải	22511	0	\N	\N	\N	\N	\N	ph	225
2251129	Xã Đường Hoa	22511	0	\N	\N	\N	\N	\N	dh	225
2251131	Xã Tiến Tới	22511	0	\N	\N	\N	\N	\N	tt	225
2251133	Xã Tân Bình	22511	0	\N	\N	\N	\N	\N	tb	225
2251135	Xã Đầm Hà	22511	0	\N	\N	\N	\N	\N	dh	225
2251137	Xã Quảng Lợi	22511	0	\N	\N	\N	\N	\N	ql	225
2251139	Xã Quảng Tân	22511	0	\N	\N	\N	\N	\N	qt	225
2251141	Xã Dực Yên	22511	0	\N	\N	\N	\N	\N	dy	225
2251143	Xã Đại Bình	22511	0	\N	\N	\N	\N	\N	db	225
2251145	Xã Quảng Lâm	22511	0	\N	\N	\N	\N	\N	ql	225
1011949	Xã Trâu Quỳ	10119	0	\N	\N	\N	\N	\N	tq	101
1011951	Xã Đa Tốn	10119	0	\N	\N	\N	\N	\N	dt	101
1011953	Xã Dương Xá	10119	0	\N	\N	\N	\N	\N	dx	101
1011957	Xã Văn Đức	10119	0	\N	\N	\N	\N	\N	vd	101
1011959	Xã Đông Dư	10119	0	\N	\N	\N	\N	\N	dd	101
1011961	Xã Cự Khối	10119	0	\N	\N	\N	\N	\N	ck	101
1011963	Xã Dương Quang	10119	0	\N	\N	\N	\N	\N	dq	101
1011965	Xã Phú Thị	10119	0	\N	\N	\N	\N	\N	pt	101
1011967	Xã Đặng Xá	10119	0	\N	\N	\N	\N	\N	dx	101
1011969	Xã Kim Sơn	10119	0	\N	\N	\N	\N	\N	ks	101
1012100	Không xác định	10121	0	\N	\N	\N	\N	\N	kx	101
1012101	Thị trấn Cầu Diễn	10121	0	\N	\N	\N	\N	\N	cd	101
1012103	Xã Mỹ Đình	10121	0	\N	\N	\N	\N	\N	md	101
1012105	Xã Tây Tựu	10121	0	\N	\N	\N	\N	\N	tt	101
1012107	Xã Phú Diễn	10121	0	\N	\N	\N	\N	\N	pd	101
1012109	Xã Minh Khai	10121	0	\N	\N	\N	\N	\N	mk	101
1012111	Xã Thượng Cát	10121	0	\N	\N	\N	\N	\N	tc	101
1012113	Xã Liên Mạc	10121	0	\N	\N	\N	\N	\N	lm	101
1012115	Xã Thuỵ Phương	10121	0	\N	\N	\N	\N	\N	tp	101
1012117	Xã Đông Ngạc	10121	0	\N	\N	\N	\N	\N	dn	101
1012119	Xã Xuân Đỉnh	10121	0	\N	\N	\N	\N	\N	xd	101
1012121	Xã Cổ Nhuế	10121	0	\N	\N	\N	\N	\N	cn	101
1012123	Xã Trung Văn	10121	0	\N	\N	\N	\N	\N	tv	101
1012125	Xã Mễ Trì	10121	0	\N	\N	\N	\N	\N	mt	101
1012127	Xã Tây Mỗ	10121	0	\N	\N	\N	\N	\N	tm	101
1012129	Xã Đại Mỗ	10121	0	\N	\N	\N	\N	\N	dm	101
1012131	Xã Xuân Phương	10121	0	\N	\N	\N	\N	\N	xp	101
1012300	Không xác định	10123	0	\N	\N	\N	\N	\N	kx	101
1012301	Thị trấn Văn Điển	10123	0	\N	\N	\N	\N	\N	vd	101
1012303	Xã Định Công	10123	0	\N	\N	\N	\N	\N	dc	101
1012305	Xã Vĩnh Tuy	10123	0	\N	\N	\N	\N	\N	vt	101
1012307	Xã Thanh Trì	10123	0	\N	\N	\N	\N	\N	tt	101
1012309	Xã Trần Phú	10123	0	\N	\N	\N	\N	\N	tp	101
1012311	Xã Yên Sở	10123	0	\N	\N	\N	\N	\N	ys	101
1012313	Xã Ngũ Hiệp	10123	0	\N	\N	\N	\N	\N	nh	101
1012315	Xã Đông Mỹ	10123	0	\N	\N	\N	\N	\N	dm	101
1012317	Xã Yên Mỹ	10123	0	\N	\N	\N	\N	\N	ym	101
1012319	Xã Duyên Hà	10123	0	\N	\N	\N	\N	\N	dh	101
1012321	Xã Vạn Phúc	10123	0	\N	\N	\N	\N	\N	vp	101
1012323	Xã Tứ Hiệp	10123	0	\N	\N	\N	\N	\N	th	101
1012325	Xã Thịnh Liệt	10123	0	\N	\N	\N	\N	\N	tl	101
1012327	Xã Thanh Liệt	10123	0	\N	\N	\N	\N	\N	tl	101
1012329	Xã Đại Kim	10123	0	\N	\N	\N	\N	\N	dk	101
1012331	Xã Lĩnh Nam	10123	0	\N	\N	\N	\N	\N	ln	101
1012333	Xã Tam Hiệp	10123	0	\N	\N	\N	\N	\N	th	101
1012335	Xã Tân Triều	10123	0	\N	\N	\N	\N	\N	tt	101
1012337	Xã Hoàng Liệt	10123	0	\N	\N	\N	\N	\N	hl	101
1012339	Xã Vĩnh Quỳnh	10123	0	\N	\N	\N	\N	\N	vq	101
1012341	Xã Liên Ninh	10123	0	\N	\N	\N	\N	\N	ln	101
1012343	Xã Ngọc Hồi	10123	0	\N	\N	\N	\N	\N	nh	101
1012345	Xã Đại áng	10123	0	\N	\N	\N	\N	\N	da	101
1012347	Xã Hữu Hoà	10123	0	\N	\N	\N	\N	\N	hh	101
1030000	Không xác định	10300	0	\N	\N	\N	\N	\N	kx	103
1030100	Không xác định	10301	0	\N	\N	\N	\N	\N	kx	103
1030101	Phường Quán Toan	10301	0	\N	\N	\N	\N	\N	qt	103
1030103	Phường Hùng Vương	10301	0	\N	\N	\N	\N	\N	hv	103
1030105	Phường Sở Dầu	10301	0	\N	\N	\N	\N	\N	sd	103
1030107	Phường Thượng Lý	10301	0	\N	\N	\N	\N	\N	tl	103
1030109	Phường Trại Chuối	10301	0	\N	\N	\N	\N	\N	tc	103
1030111	Phường Hạ Lý	10301	0	\N	\N	\N	\N	\N	hl	103
1030113	Phường Minh Khai	10301	0	\N	\N	\N	\N	\N	mk	103
1030115	Phường Quang Trung	10301	0	\N	\N	\N	\N	\N	qt	103
1030117	Phường Hoàng Văn Thụ	10301	0	\N	\N	\N	\N	\N	hvt	103
1030119	Phường Phan Bội Châu	10301	0	\N	\N	\N	\N	\N	pbc	103
1030121	Phường Phạm Hồng Thái	10301	0	\N	\N	\N	\N	\N	pht	103
1030300	Không xác định	10303	0	\N	\N	\N	\N	\N	kx	103
1030301	Phường Máy Tơ	10303	0	\N	\N	\N	\N	\N	mt	103
1030303	Phường Máy Chai	10303	0	\N	\N	\N	\N	\N	mc	103
1030305	Phường Vạn Mỹ	10303	0	\N	\N	\N	\N	\N	vm	103
1030307	Phường Lạc Viên	10303	0	\N	\N	\N	\N	\N	lv	103
1030309	Phường Cầu Tre	10303	0	\N	\N	\N	\N	\N	ct	103
1030311	Phường Lương Khánh Thiện	10303	0	\N	\N	\N	\N	\N	lkt	103
1030313	Phường Gia Viên	10303	0	\N	\N	\N	\N	\N	gv	103
1030315	Phường Cầu Đất	10303	0	\N	\N	\N	\N	\N	cd	103
1030317	Phường Lê Lợi	10303	0	\N	\N	\N	\N	\N	ll	103
1030319	Phường Lạch Tray	10303	0	\N	\N	\N	\N	\N	lt	103
1030321	Phường Đằng Giang	10303	0	\N	\N	\N	\N	\N	dg	103
1030323	Phường Đông Khê	10303	0	\N	\N	\N	\N	\N	dk	103
1030325	Phường Đổng Quốc Bình	10303	0	\N	\N	\N	\N	\N	dqb	103
1030327	Phường Cát Bi	10303	0	\N	\N	\N	\N	\N	cb	103
1030500	Không xác định	10305	0	\N	\N	\N	\N	\N	kx	103
1030501	Phường Cát Dài	10305	0	\N	\N	\N	\N	\N	cd	103
1030503	Phường An Biên	10305	0	\N	\N	\N	\N	\N	ab	103
1030505	Phường Mê Linh	10305	0	\N	\N	\N	\N	\N	ml	103
1030507	Phường Lam Sơn	10305	0	\N	\N	\N	\N	\N	ls	103
1030509	Phường An Dương	10305	0	\N	\N	\N	\N	\N	ad	103
1030511	Phường Trần Nguyên Hãn	10305	0	\N	\N	\N	\N	\N	tnh	103
1030513	Phường Hồ Nam	10305	0	\N	\N	\N	\N	\N	hn	103
1030515	Phường Trại Cau	10305	0	\N	\N	\N	\N	\N	tc	103
1030517	Phường Dư Hàng	10305	0	\N	\N	\N	\N	\N	dh	103
1030519	Phường Hàng Kênh	10305	0	\N	\N	\N	\N	\N	hk	103
1030521	Phường Đông Hải	10305	0	\N	\N	\N	\N	\N	dh	103
1030523	Phường Niệm Nghĩa	10305	0	\N	\N	\N	\N	\N	nn	103
1030700	Không xác định	10307	0	\N	\N	\N	\N	\N	kx	103
1030701	Phường Quán Trữ	10307	0	\N	\N	\N	\N	\N	qt	103
1030703	Phường Đồng Hoà	10307	0	\N	\N	\N	\N	\N	dh	103
1030705	Phường Bắc Sơn	10307	0	\N	\N	\N	\N	\N	bs	103
1030707	Phường Nam Sơn	10307	0	\N	\N	\N	\N	\N	ns	103
1030709	Phường Ngọc Sơn	10307	0	\N	\N	\N	\N	\N	ns	103
1030711	Phường Trần Thành Ngọ	10307	0	\N	\N	\N	\N	\N	ttn	103
1030713	Phường Văn Đẩu	10307	0	\N	\N	\N	\N	\N	vd	103
1030715	Phường Phù Liễn	10307	0	\N	\N	\N	\N	\N	pl	103
1030717	Phường Tràng Minh	10307	0	\N	\N	\N	\N	\N	tm	103
1030900	Không xác định	10309	0	\N	\N	\N	\N	\N	kx	103
1030901	Phường Ngọc Xuyên	10309	0	\N	\N	\N	\N	\N	nx	103
1030903	Phường Ngọc Hải	10309	0	\N	\N	\N	\N	\N	nh	103
1030905	Phường Vạn Hương	10309	0	\N	\N	\N	\N	\N	vh	103
1030907	Phường Vạn Sơn	10309	0	\N	\N	\N	\N	\N	vs	103
1030909	Xã Bàng La	10309	0	\N	\N	\N	\N	\N	bl	103
1031100	Không xác định	10311	0	\N	\N	\N	\N	\N	kx	103
1031101	Thị trấn Núi Đèo	10311	0	\N	\N	\N	\N	\N	nd	103
1031103	Thị trấn Minh Đức	10311	0	\N	\N	\N	\N	\N	md	103
1031105	Xã Lại Xuân	10311	0	\N	\N	\N	\N	\N	lx	103
1031107	Xã An Sơn	10311	0	\N	\N	\N	\N	\N	as	103
1031109	Xã Kỳ Sơn	10311	0	\N	\N	\N	\N	\N	ks	103
1031111	Xã Liên Khê	10311	0	\N	\N	\N	\N	\N	lk	103
1031113	Xã Lưu Kiếm	10311	0	\N	\N	\N	\N	\N	lk	103
1031115	Xã Gia Minh	10311	0	\N	\N	\N	\N	\N	gm	103
1031117	Xã Gia Đức	10311	0	\N	\N	\N	\N	\N	gd	103
1031119	Xã Minh Tân	10311	0	\N	\N	\N	\N	\N	mt	103
1031121	Xã Phù Ninh	10311	0	\N	\N	\N	\N	\N	pn	103
1031123	Xã Quảng Thanh	10311	0	\N	\N	\N	\N	\N	qt	103
1031125	Xã Chính Mỹ	10311	0	\N	\N	\N	\N	\N	cm	103
1031127	Xã Kênh Giang	10311	0	\N	\N	\N	\N	\N	kg	103
1031129	Xã Hợp Thành	10311	0	\N	\N	\N	\N	\N	ht	103
1031131	Xã Cao Nhân	10311	0	\N	\N	\N	\N	\N	cn	103
1031133	Xã Mỹ Đồng	10311	0	\N	\N	\N	\N	\N	md	103
1031135	Xã Đông Sơn	10311	0	\N	\N	\N	\N	\N	ds	103
1031137	Xã Hoà Bình	10311	0	\N	\N	\N	\N	\N	hb	103
1031139	Xã Trung Hà	10311	0	\N	\N	\N	\N	\N	th	103
1031141	Xã An Lư	10311	0	\N	\N	\N	\N	\N	al	103
1031143	Xã Thuỷ Triều	10311	0	\N	\N	\N	\N	\N	tt	103
1031145	Xã Ngũ Lão	10311	0	\N	\N	\N	\N	\N	nl	103
1031147	Xã Phục Lễ	10311	0	\N	\N	\N	\N	\N	pl	103
1031149	Xã Tam Hưng	10311	0	\N	\N	\N	\N	\N	th	103
1031151	Xã Phả Lễ	10311	0	\N	\N	\N	\N	\N	pl	103
1031153	Xã Lập Lễ	10311	0	\N	\N	\N	\N	\N	ll	103
1031155	Xã Kiền Bái	10311	0	\N	\N	\N	\N	\N	kb	103
1031157	Xã Thiên Hương	10311	0	\N	\N	\N	\N	\N	th	103
1031159	Xã Thuỷ Sơn	10311	0	\N	\N	\N	\N	\N	ts	103
1031161	Xã Thuỷ Đường	10311	0	\N	\N	\N	\N	\N	td	103
1031163	Xã Hoàng Động	10311	0	\N	\N	\N	\N	\N	hd	103
1031165	Xã Lâm Động	10311	0	\N	\N	\N	\N	\N	ld	103
1031167	Xã Hoa Động	10311	0	\N	\N	\N	\N	\N	hd	103
1031169	Xã Tân Dương	10311	0	\N	\N	\N	\N	\N	td	103
1031171	Xã Dương Quan	10311	0	\N	\N	\N	\N	\N	dq	103
1031300	Không xác định	10313	0	\N	\N	\N	\N	\N	kx	103
1031301	Thị trấn An Dương	10313	0	\N	\N	\N	\N	\N	ad	103
1031303	Xã Lê Thiện	10313	0	\N	\N	\N	\N	\N	lt	103
1031305	Xã Đại Bản	10313	0	\N	\N	\N	\N	\N	db	103
1031309	Xã Hồng Phong	10313	0	\N	\N	\N	\N	\N	hp	103
1031311	Xã Tân Tiến	10313	0	\N	\N	\N	\N	\N	tt	103
1031313	Xã An Hưng	10313	0	\N	\N	\N	\N	\N	ah	103
1031315	Xã An Hồng	10313	0	\N	\N	\N	\N	\N	ah	103
1031317	Xã Bắc Sơn	10313	0	\N	\N	\N	\N	\N	bs	103
1031319	Xã Nam Sơn	10313	0	\N	\N	\N	\N	\N	ns	103
1031321	Xã Lê Lợi	10313	0	\N	\N	\N	\N	\N	ll	103
1031323	Xã Đặng Cương	10313	0	\N	\N	\N	\N	\N	dc	103
1031325	Xã Đồng Thái	10313	0	\N	\N	\N	\N	\N	dt	103
1031327	Xã Quốc Tuấn	10313	0	\N	\N	\N	\N	\N	qt	103
1031331	Xã Hồng Thái	10313	0	\N	\N	\N	\N	\N	ht	103
1031333	Xã Dư Hàng Kênh	10313	0	\N	\N	\N	\N	\N	dhk	103
1031335	Xã Vĩnh Niệm	10313	0	\N	\N	\N	\N	\N	vn	103
1031337	Xã Đông Hải	10313	0	\N	\N	\N	\N	\N	dh	103
1031339	Xã Đằng Lâm	10313	0	\N	\N	\N	\N	\N	dl	103
1031341	Xã Đằng Hải	10313	0	\N	\N	\N	\N	\N	dh	103
1031343	Xã Nam Hải	10313	0	\N	\N	\N	\N	\N	nh	103
1031345	Xã Tràng Cát	10313	0	\N	\N	\N	\N	\N	tc	103
1031500	Không xác định	10315	0	\N	\N	\N	\N	\N	kx	103
1031501	Thị trấn An Lão	10315	0	\N	\N	\N	\N	\N	al	103
1031503	Xã Bát Trang	10315	0	\N	\N	\N	\N	\N	bt	103
1031505	Xã Trường Thọ	10315	0	\N	\N	\N	\N	\N	tt	103
1031507	Xã Trường Thành	10315	0	\N	\N	\N	\N	\N	tt	103
1031509	Xã An Tiến	10315	0	\N	\N	\N	\N	\N	at	103
1031511	Xã Quang Hưng	10315	0	\N	\N	\N	\N	\N	qh	103
1031513	Xã Quang Trung	10315	0	\N	\N	\N	\N	\N	qt	103
1031515	Xã Quốc Tuấn	10315	0	\N	\N	\N	\N	\N	qt	103
1031517	Xã An Thắng	10315	0	\N	\N	\N	\N	\N	at	103
1031519	Xã Trường Sơn	10315	0	\N	\N	\N	\N	\N	ts	103
1031521	Xã Tân Dân	10315	0	\N	\N	\N	\N	\N	td	103
1031523	Xã Thái Sơn	10315	0	\N	\N	\N	\N	\N	ts	103
1031525	Xã Tân Viên	10315	0	\N	\N	\N	\N	\N	tv	103
1031527	Xã Mỹ Đức	10315	0	\N	\N	\N	\N	\N	md	103
1031529	Xã Chiến Thắng	10315	0	\N	\N	\N	\N	\N	ct	103
1031531	Xã An Thọ	10315	0	\N	\N	\N	\N	\N	at	103
1031533	Xã An Thái	10315	0	\N	\N	\N	\N	\N	at	103
1031700	Không xác định	10317	0	\N	\N	\N	\N	\N	kx	103
1031701	Thị trấn Núi Đối	10317	0	\N	\N	\N	\N	\N	nd	103
1031703	Xã Đa Phúc	10317	0	\N	\N	\N	\N	\N	dp	103
1031705	Xã Hưng Đạo	10317	0	\N	\N	\N	\N	\N	hd	103
1031707	Xã Anh Dũng	10317	0	\N	\N	\N	\N	\N	ad	103
1031709	Xã Hải Thành	10317	0	\N	\N	\N	\N	\N	ht	103
1031711	Xã Đông Phương	10317	0	\N	\N	\N	\N	\N	dp	103
1031713	Xã Thuận Thiên	10317	0	\N	\N	\N	\N	\N	tt	103
1031715	Xã Hữu Bằng	10317	0	\N	\N	\N	\N	\N	hb	103
1031717	Xã Đại Đồng	10317	0	\N	\N	\N	\N	\N	dd	103
1031719	Xã Hoà Nghĩa	10317	0	\N	\N	\N	\N	\N	hn	103
1031721	Xã Ngũ Phúc	10317	0	\N	\N	\N	\N	\N	np	103
1031723	Xã Kiến Quốc	10317	0	\N	\N	\N	\N	\N	kq	103
1031725	Xã Thuỵ Hương	10317	0	\N	\N	\N	\N	\N	th	103
1031727	Xã Thanh Sơn	10317	0	\N	\N	\N	\N	\N	ts	103
1031729	Xã Minh Tân	10317	0	\N	\N	\N	\N	\N	mt	103
1031731	Xã Đại Hà	10317	0	\N	\N	\N	\N	\N	dh	103
1031733	Xã Ngũ Đoan	10317	0	\N	\N	\N	\N	\N	nd	103
1031735	Xã Tân Phong	10317	0	\N	\N	\N	\N	\N	tp	103
1031737	Xã Hợp Đức	10317	0	\N	\N	\N	\N	\N	hd	103
1031739	Xã Tân Thành	10317	0	\N	\N	\N	\N	\N	tt	103
1031741	Xã Tân Trào	10317	0	\N	\N	\N	\N	\N	tt	103
1031743	Xã Đoàn Xá	10317	0	\N	\N	\N	\N	\N	dx	103
1031745	Xã Tú Sơn	10317	0	\N	\N	\N	\N	\N	ts	103
1031747	Xã Đại Hợp	10317	0	\N	\N	\N	\N	\N	dh	103
1031900	Không xác định	10319	0	\N	\N	\N	\N	\N	kx	103
1031901	Thị trấn Tiên Lãng	10319	0	\N	\N	\N	\N	\N	tl	103
1031903	Xã Đại Thắng	10319	0	\N	\N	\N	\N	\N	dt	103
1031905	Xã Tiên Cường	10319	0	\N	\N	\N	\N	\N	tc	103
1031907	Xã Tự Cường	10319	0	\N	\N	\N	\N	\N	tc	103
1031909	Xã Tiên Tiến	10319	0	\N	\N	\N	\N	\N	tt	103
1031911	Xã Quyết Tiến	10319	0	\N	\N	\N	\N	\N	qt	103
1031913	Xã Khởi Nghĩa	10319	0	\N	\N	\N	\N	\N	kn	103
1031915	Xã Tiên Thanh	10319	0	\N	\N	\N	\N	\N	tt	103
1031917	Xã Cấp Tiến	10319	0	\N	\N	\N	\N	\N	ct	103
1031919	Xã Kiến Thiết	10319	0	\N	\N	\N	\N	\N	kt	103
1031921	Xã Đoàn Lập	10319	0	\N	\N	\N	\N	\N	dl	103
1031923	Xã Bạch Đằng	10319	0	\N	\N	\N	\N	\N	bd	103
1031925	Xã Quang Phục	10319	0	\N	\N	\N	\N	\N	qp	103
1031927	Xã Toàn Thắng	10319	0	\N	\N	\N	\N	\N	tt	103
1031929	Xã Tiên Thắng	10319	0	\N	\N	\N	\N	\N	tt	103
1031931	Xã Tiên Minh	10319	0	\N	\N	\N	\N	\N	tm	103
1031933	Xã Bắc Hưng	10319	0	\N	\N	\N	\N	\N	bh	103
1031935	Xã Nam Hưng	10319	0	\N	\N	\N	\N	\N	nh	103
1031937	Xã Hùng Thắng	10319	0	\N	\N	\N	\N	\N	ht	103
1031939	Xã Tây Hưng	10319	0	\N	\N	\N	\N	\N	th	103
1031941	Xã Đông Hưng	10319	0	\N	\N	\N	\N	\N	dh	103
1031943	Xã Tiên Hưng	10319	0	\N	\N	\N	\N	\N	th	103
1031945	Xã Vinh Quang	10319	0	\N	\N	\N	\N	\N	vq	103
1032100	Không xác định	10321	0	\N	\N	\N	\N	\N	kx	103
1032101	Thị trấn Vĩnh Bảo	10321	0	\N	\N	\N	\N	\N	vb	103
1032103	Xã Dũng Tiến	10321	0	\N	\N	\N	\N	\N	dt	103
1032105	Xã Giang Biên	10321	0	\N	\N	\N	\N	\N	gb	103
1032107	Xã Thắng Thuỷ	10321	0	\N	\N	\N	\N	\N	tt	103
1032109	Xã Trung Lập	10321	0	\N	\N	\N	\N	\N	tl	103
1032111	Xã Việt Tiến	10321	0	\N	\N	\N	\N	\N	vt	103
1032113	Xã Vĩnh An	10321	0	\N	\N	\N	\N	\N	va	103
1032115	Xã Vĩnh Long	10321	0	\N	\N	\N	\N	\N	vl	103
1032117	Xã Hiệp Hoà	10321	0	\N	\N	\N	\N	\N	hh	103
1032119	Xã Hùng Tiến	10321	0	\N	\N	\N	\N	\N	ht	103
1032121	Xã An Hoà	10321	0	\N	\N	\N	\N	\N	ah	103
1032123	Xã Tân Hưng	10321	0	\N	\N	\N	\N	\N	th	103
1032125	Xã Tân Liên	10321	0	\N	\N	\N	\N	\N	tl	103
1032127	Xã Nhân Hoà	10321	0	\N	\N	\N	\N	\N	nh	103
1032129	Xã Tam Đa	10321	0	\N	\N	\N	\N	\N	td	103
1032131	Xã Hưng Nhân	10321	0	\N	\N	\N	\N	\N	hn	103
1032133	Xã Vinh Quang	10321	0	\N	\N	\N	\N	\N	vq	103
1032135	Xã Đồng Minh	10321	0	\N	\N	\N	\N	\N	dm	103
1032137	Xã Thanh Lương	10321	0	\N	\N	\N	\N	\N	tl	103
1032139	Xã Liên Am	10321	0	\N	\N	\N	\N	\N	la	103
1032141	Xã Lý Học	10321	0	\N	\N	\N	\N	\N	lh	103
1032143	Xã Tam Cường	10321	0	\N	\N	\N	\N	\N	tc	103
1032145	Xã Hoà Bình	10321	0	\N	\N	\N	\N	\N	hb	103
1032147	Xã Tiền Phong	10321	0	\N	\N	\N	\N	\N	tp	103
1032149	Xã Vĩnh Phong	10321	0	\N	\N	\N	\N	\N	vp	103
1032151	Xã Cộng Hiền	10321	0	\N	\N	\N	\N	\N	ch	103
1032153	Xã Cao Minh	10321	0	\N	\N	\N	\N	\N	cm	103
1032155	Xã Cổ Am	10321	0	\N	\N	\N	\N	\N	ca	103
1032157	Xã Vĩnh Tiến	10321	0	\N	\N	\N	\N	\N	vt	103
1032159	Xã Trấn Dương	10321	0	\N	\N	\N	\N	\N	td	103
1032300	Không xác định	10323	0	\N	\N	\N	\N	\N	kx	103
1032301	Thị trấn Cát Bà	10323	0	\N	\N	\N	\N	\N	cb	103
1032303	Thị trấn Cát Hải	10323	0	\N	\N	\N	\N	\N	ch	103
1032305	Xã Nghĩa Lộ	10323	0	\N	\N	\N	\N	\N	nl	103
1032307	Xã Đồng Bài	10323	0	\N	\N	\N	\N	\N	db	103
1032309	Xã Hoàng Châu	10323	0	\N	\N	\N	\N	\N	hc	103
1032311	Xã Văn Phong	10323	0	\N	\N	\N	\N	\N	vp	103
1032313	Xã Phù Long	10323	0	\N	\N	\N	\N	\N	pl	103
1032315	Xã Gia Luận	10323	0	\N	\N	\N	\N	\N	gl	103
1032317	Xã Hiền Hào	10323	0	\N	\N	\N	\N	\N	hh	103
1032319	Xã Trân Châu	10323	0	\N	\N	\N	\N	\N	tc	103
1032321	Xã Việt Hải	10323	0	\N	\N	\N	\N	\N	vh	103
1032323	Xã Xuân Đám	10323	0	\N	\N	\N	\N	\N	xd	103
1032500	Không xác định	10325	0	\N	\N	\N	\N	\N	kx	103
1040000	Không xác định	10400	0	\N	\N	\N	\N	\N	kx	104
1040100	Không xác định	10401	0	\N	\N	\N	\N	\N	kx	104
1040101	Phường Tích Sơn	10401	0	\N	\N	\N	\N	\N	ts	104
1040103	Phường Liên Bảo	10401	0	\N	\N	\N	\N	\N	lb	104
1040105	Phường Đống Đa	10401	0	\N	\N	\N	\N	\N	dd	104
1040107	Phường Ngô Quyền	10401	0	\N	\N	\N	\N	\N	nq	104
1040109	Thị trấn Tam Đảo	10401	0	\N	\N	\N	\N	\N	td	104
1040111	Xã Định Trung	10401	0	\N	\N	\N	\N	\N	dt	104
1040115	Phường Hội Hợp	10401	0	\N	\N	\N	\N	\N	hh	104
1040117	Phường Đồng Tâm	10401	0	\N	\N	\N	\N	\N	dt	104
1040119	Xã Thanh Trù	10401	0	\N	\N	\N	\N	\N	tt	104
1040300	Không xác định	10403	0	\N	\N	\N	\N	\N	kx	104
1040301	Thị trấn Lập Thạch	10403	0	\N	\N	\N	\N	\N	lt	104
1040303	Xã Đạo Trù	10403	0	\N	\N	\N	\N	\N	dt	104
1040305	Xã Yên Dương	10403	0	\N	\N	\N	\N	\N	yd	104
1040307	Xã Quang Sơn	10403	0	\N	\N	\N	\N	\N	qs	104
1040309	Xã Ngọc Mỹ	10403	0	\N	\N	\N	\N	\N	nm	104
1040311	Xã Hợp Lý	10403	0	\N	\N	\N	\N	\N	hl	104
1040313	Xã Lãng Công	10403	0	\N	\N	\N	\N	\N	lc	104
1040315	Xã Quang Yên	10403	0	\N	\N	\N	\N	\N	qy	104
1040317	Xã Bạch Lưu	10403	0	\N	\N	\N	\N	\N	bl	104
1040319	Xã Hải Lựu	10403	0	\N	\N	\N	\N	\N	hl	104
1040321	Xã Bồ Lý	10403	0	\N	\N	\N	\N	\N	bl	104
1040323	Xã Bắc Bình	10403	0	\N	\N	\N	\N	\N	bb	104
1040325	Xã Thái Hòa	10403	0	\N	\N	\N	\N	\N	th	104
1040327	Xã Liễn Sơn	10403	0	\N	\N	\N	\N	\N	ls	104
1040329	Xã Xuân Hòa	10403	0	\N	\N	\N	\N	\N	xh	104
1040331	Xã Vân Trục	10403	0	\N	\N	\N	\N	\N	vt	104
1040333	Xã Đồng Quế	10403	0	\N	\N	\N	\N	\N	dq	104
1040335	Xã Nhân Đạo	10403	0	\N	\N	\N	\N	\N	nd	104
1040337	Xã Đôn Nhân	10403	0	\N	\N	\N	\N	\N	dn	104
1040339	Xã Phương Khoan	10403	0	\N	\N	\N	\N	\N	pk	104
1040341	Xã Liên Hòa	10403	0	\N	\N	\N	\N	\N	lh	104
1040343	Xã Tử Du	10403	0	\N	\N	\N	\N	\N	td	104
1040345	Xã Tân Lập	10403	0	\N	\N	\N	\N	\N	tl	104
1040347	Xã Nhạo Sơn	10403	0	\N	\N	\N	\N	\N	ns	104
1040349	Xã Tam Sơn	10403	0	\N	\N	\N	\N	\N	ts	104
1040351	Xã Như Thụy	10403	0	\N	\N	\N	\N	\N	nt	104
1040353	Xã Yên Thạch	10403	0	\N	\N	\N	\N	\N	yt	104
1040355	Xã Bàn Giản	10403	0	\N	\N	\N	\N	\N	bg	104
1040357	Xã Xuân Lôi	10403	0	\N	\N	\N	\N	\N	xl	104
1040359	Xã Đồng ích	10403	0	\N	\N	\N	\N	\N	di	104
1040361	Xã Tiên Lữ	10403	0	\N	\N	\N	\N	\N	tl	104
1040363	Xã Văn Quán	10403	0	\N	\N	\N	\N	\N	vq	104
1040365	Xã Đồng Thịnh	10403	0	\N	\N	\N	\N	\N	dt	104
1040367	Xã Tứ Yên	10403	0	\N	\N	\N	\N	\N	ty	104
1040369	Xã Đức Bác	10403	0	\N	\N	\N	\N	\N	db	104
1040371	Xã Đình Chu	10403	0	\N	\N	\N	\N	\N	dc	104
1040373	Xã Cao Phong	10403	0	\N	\N	\N	\N	\N	cp	104
1040375	Xã Triệu Đề	10403	0	\N	\N	\N	\N	\N	td	104
1040377	Xã Sơn Đông	10403	0	\N	\N	\N	\N	\N	sd	104
1040500	Không xác định	10405	0	\N	\N	\N	\N	\N	kx	104
1040505	Xã Đại Đình	10405	0	\N	\N	\N	\N	\N	dd	104
1040507	Xã Tam Quan	10405	0	\N	\N	\N	\N	\N	tq	104
1040513	Xã Hồ Sơn	10405	0	\N	\N	\N	\N	\N	hs	104
1040515	Xã Hợp Châu	10405	0	\N	\N	\N	\N	\N	hc	104
1011531	Xã Trung Giã	10115	0	\N	\N	\N	\N	\N	tg	101
1011533	Xã Tân Hưng	10115	0	\N	\N	\N	\N	\N	th	101
1011535	Xã Bắc Phú	10115	0	\N	\N	\N	\N	\N	bp	101
1011537	Xã Việt Long	10115	0	\N	\N	\N	\N	\N	vl	101
1011539	Xã Xuân Giang	10115	0	\N	\N	\N	\N	\N	xg	101
1011541	Xã Đức Hoà	10115	0	\N	\N	\N	\N	\N	dh	101
1011543	Xã Xuân Thu	10115	0	\N	\N	\N	\N	\N	xt	101
1011545	Xã Kim Lũ	10115	0	\N	\N	\N	\N	\N	kl	101
1011547	Xã Phù Linh	10115	0	\N	\N	\N	\N	\N	pl	101
7170127	Phước cơ	71701	0	\N	\N	\N	\N	\N	zpc	717
1011549	Xã Tân Minh	10115	0	\N	\N	\N	\N	\N	tm	101
1011551	Xã Tiên Dược	10115	0	\N	\N	\N	\N	\N	td	101
1011700	Không xác định	10117	0	\N	\N	\N	\N	\N	kx	101
1011701	Thị trấn Đông Anh	10117	0	\N	\N	\N	\N	\N	da	101
1011703	Xã Xuân Nộn	10117	0	\N	\N	\N	\N	\N	xn	101
1011705	Xã Nguyên Khê	10117	0	\N	\N	\N	\N	\N	nk	101
1011707	Xã Uy Nỗ	10117	0	\N	\N	\N	\N	\N	un	101
1011709	Xã Cổ Loa	10117	0	\N	\N	\N	\N	\N	cl	101
1011711	Xã Tiên Dương	10117	0	\N	\N	\N	\N	\N	td	101
1011713	Xã Nam Hồng	10117	0	\N	\N	\N	\N	\N	nh	101
1011715	Xã Bắc Hồng	10117	0	\N	\N	\N	\N	\N	bh	101
1011717	Xã Vân Nội	10117	0	\N	\N	\N	\N	\N	vn	101
1011719	Xã Kim Nỗ	10117	0	\N	\N	\N	\N	\N	kn	101
1011721	Xã Kim Chung	10117	0	\N	\N	\N	\N	\N	kc	101
1011723	Xã Đại Mạch	10117	0	\N	\N	\N	\N	\N	dm	101
1011725	Xã Võng La	10117	0	\N	\N	\N	\N	\N	vl	101
1011727	Xã Hải Bối	10117	0	\N	\N	\N	\N	\N	hb	101
1011729	Xã Liên Hà	10117	0	\N	\N	\N	\N	\N	lh	101
3031903	Thị trấn NT Mộc Châu	30319	0	\N	\N	\N	\N	\N	ntmc	303
1011731	Xã Vân Hà	10117	0	\N	\N	\N	\N	\N	vh	101
1011733	Xã Dục Tú	10117	0	\N	\N	\N	\N	\N	dt	101
1011735	Xã Thuỵ Lâm	10117	0	\N	\N	\N	\N	\N	tl	101
1011737	Xã Việt Hùng	10117	0	\N	\N	\N	\N	\N	vh	101
1011739	Xã Mai Lâm	10117	0	\N	\N	\N	\N	\N	ml	101
1011741	Xã Đông Hội	10117	0	\N	\N	\N	\N	\N	dh	101
1011743	Xã Xuân Canh	10117	0	\N	\N	\N	\N	\N	xc	101
1011745	Xã Tầm Xá	10117	0	\N	\N	\N	\N	\N	tx	101
1011747	Xã Vĩnh Ngọc	10117	0	\N	\N	\N	\N	\N	vn	101
1011900	Không xác định	10119	0	\N	\N	\N	\N	\N	kx	101
1011901	Thị trấn Gia Lâm	10119	0	\N	\N	\N	\N	\N	gl	101
1011903	Thị trấn Đức Giang	10119	0	\N	\N	\N	\N	\N	dg	101
1011905	Thị trấn Yên Viên	10119	0	\N	\N	\N	\N	\N	yv	101
1011907	Thị trấn Sài Đồng	10119	0	\N	\N	\N	\N	\N	sd	101
1011909	Xã Thạch Bàn	10119	0	\N	\N	\N	\N	\N	tb	101
1011911	Xã Bát Tràng	10119	0	\N	\N	\N	\N	\N	bt	101
1011913	Xã Lệ Chi	10119	0	\N	\N	\N	\N	\N	lc	101
1011915	Xã Đình Xuyên	10119	0	\N	\N	\N	\N	\N	dx	101
1011917	Xã Ninh Hiệp	10119	0	\N	\N	\N	\N	\N	nh	101
1011919	Xã Phù Đổng	10119	0	\N	\N	\N	\N	\N	pd	101
1011921	Xã Trung Màu	10119	0	\N	\N	\N	\N	\N	tm	101
1011923	Xã Dương Hà	10119	0	\N	\N	\N	\N	\N	dh	101
1011925	Xã Yên Thường	10119	0	\N	\N	\N	\N	\N	yt	101
1011927	Xã Yên Viên	10119	0	\N	\N	\N	\N	\N	yv	101
1011929	Xã Giang Biên	10119	0	\N	\N	\N	\N	\N	gb	101
1011931	Xã Thượng Thanh	10119	0	\N	\N	\N	\N	\N	tt	101
1011933	Xã Kim Lan	10119	0	\N	\N	\N	\N	\N	kl	101
1011935	Xã Việt Hưng	10119	0	\N	\N	\N	\N	\N	vh	101
1011937	Xã Ngọc Thuỵ	10119	0	\N	\N	\N	\N	\N	nt	101
1011939	Xã Gia Thuỵ	10119	0	\N	\N	\N	\N	\N	gt	101
1011941	Xã Bồ Đề	10119	0	\N	\N	\N	\N	\N	bd	101
1011943	Xã Long Biên	10119	0	\N	\N	\N	\N	\N	lb	101
1011945	Xã Hội Xá	10119	0	\N	\N	\N	\N	\N	hx	101
1011947	Xã Cổ Bi	10119	0	\N	\N	\N	\N	\N	cb	101
1011955	Xã Kiêu Kỵ	10119	0	\N	\N	\N	\N	\N	kk	101
1040517	Xã Hoàng Hoa	10405	0	\N	\N	\N	\N	\N	hh	104
1040519	Xã Đồng Tĩnh	10405	0	\N	\N	\N	\N	\N	dt	104
1040521	Xã Hợp Hòa	10405	0	\N	\N	\N	\N	\N	hh	104
1040523	Xã Kim Long	10405	0	\N	\N	\N	\N	\N	kl	104
1040525	Xã Hướng Đạo	10405	0	\N	\N	\N	\N	\N	hd	104
1040527	Xã Đạo Tú	10405	0	\N	\N	\N	\N	\N	dt	104
1040529	Xã An Hòa	10405	0	\N	\N	\N	\N	\N	ah	104
1040539	Xã Thanh Vân	10405	0	\N	\N	\N	\N	\N	tv	104
1040541	Xã Duy Phiên	10405	0	\N	\N	\N	\N	\N	dp	104
1040543	Xã Hoàng Đan	10405	0	\N	\N	\N	\N	\N	hd	104
1040545	Xã Hoàng Lâu	10405	0	\N	\N	\N	\N	\N	hl	104
1040547	Xã Vân Hội	10405	0	\N	\N	\N	\N	\N	vh	104
1040549	Xã Hợp Thịnh	10405	0	\N	\N	\N	\N	\N	ht	104
1040700	Không xác định	10407	0	\N	\N	\N	\N	\N	kx	104
1040701	Thị trấn Vĩnh Tường	10407	0	\N	\N	\N	\N	\N	vt	104
1040703	Xã Kim Xá	10407	0	\N	\N	\N	\N	\N	kx	104
1040705	Xã Yên Bình	10407	0	\N	\N	\N	\N	\N	yb	104
1040707	Xã Chấn Hưng	10407	0	\N	\N	\N	\N	\N	ch	104
1040709	Xã Nghĩa Hưng	10407	0	\N	\N	\N	\N	\N	nh	104
1040711	Xã Yên Lập	10407	0	\N	\N	\N	\N	\N	yl	104
1040713	Xã Việt Xuân	10407	0	\N	\N	\N	\N	\N	vx	104
1040715	Xã Bồ Sao	10407	0	\N	\N	\N	\N	\N	bs	104
1040717	Xã Đại Đồng	10407	0	\N	\N	\N	\N	\N	dd	104
1040719	Xã Tân Tiến	10407	0	\N	\N	\N	\N	\N	tt	104
1040721	Xã Lũng Hoà	10407	0	\N	\N	\N	\N	\N	lh	104
1040723	Xã Cao Đại	10407	0	\N	\N	\N	\N	\N	cd	104
1040725	Xã Thổ Tang	10407	0	\N	\N	\N	\N	\N	tt	104
1040727	Xã Vĩnh Sơn	10407	0	\N	\N	\N	\N	\N	vs	104
1040729	Xã Bình Dương	10407	0	\N	\N	\N	\N	\N	bd	104
1040731	Xã Tân Cương	10407	0	\N	\N	\N	\N	\N	tc	104
1040733	Xã Phú Thịnh	10407	0	\N	\N	\N	\N	\N	pt	104
1040735	Xã Thượng Trưng	10407	0	\N	\N	\N	\N	\N	tt	104
1040737	Xã Vũ Di	10407	0	\N	\N	\N	\N	\N	vd	104
1040739	Xã Lý Nhân	10407	0	\N	\N	\N	\N	\N	ln	104
1040741	Xã Tuân Chính	10407	0	\N	\N	\N	\N	\N	tc	104
1040743	Xã Vân Xuân	10407	0	\N	\N	\N	\N	\N	vx	104
1040745	Xã Tam Phúc	10407	0	\N	\N	\N	\N	\N	tp	104
1040747	Xã Tứ Trưng	10407	0	\N	\N	\N	\N	\N	tt	104
1040749	Xã Ngũ Kiên	10407	0	\N	\N	\N	\N	\N	nk	104
1040751	Xã An Tường	10407	0	\N	\N	\N	\N	\N	at	104
1040753	Xã Vĩnh Thịnh	10407	0	\N	\N	\N	\N	\N	vt	104
1040755	Xã Phú Đa	10407	0	\N	\N	\N	\N	\N	pd	104
1040757	Xã Vĩnh Ninh	10407	0	\N	\N	\N	\N	\N	vn	104
1040900	Không xác định	10409	0	\N	\N	\N	\N	\N	kx	104
1040901	Thị trấn Yên Lạc	10409	0	\N	\N	\N	\N	\N	yl	104
1040903	Xã Đồng Cương	10409	0	\N	\N	\N	\N	\N	dc	104
1040905	Xã Đồng Văn	10409	0	\N	\N	\N	\N	\N	dv	104
1040907	Xã Bình Định	10409	0	\N	\N	\N	\N	\N	bd	104
1040909	Xã Trung Nguyên	10409	0	\N	\N	\N	\N	\N	tn	104
1040911	Xã Tề Lỗ	10409	0	\N	\N	\N	\N	\N	tl	104
1040913	Xã Tam Hồng	10409	0	\N	\N	\N	\N	\N	th	104
1040915	Xã Yên Đồng	10409	0	\N	\N	\N	\N	\N	yd	104
1040917	Xã Văn Tiến	10409	0	\N	\N	\N	\N	\N	vt	104
1040919	Xã Nguyệt Đức	10409	0	\N	\N	\N	\N	\N	nd	104
1040921	Xã Yên Phương	10409	0	\N	\N	\N	\N	\N	yp	104
1040923	Xã Hồng Phương	10409	0	\N	\N	\N	\N	\N	hp	104
1040925	Xã Trung Kiên	10409	0	\N	\N	\N	\N	\N	tk	104
1040927	Xã Liên Châu	10409	0	\N	\N	\N	\N	\N	lc	104
1040929	Xã Đại Tự	10409	0	\N	\N	\N	\N	\N	dt	104
1040931	Xã Hồng Châu	10409	0	\N	\N	\N	\N	\N	hc	104
1040933	Xã Trung Hà	10409	0	\N	\N	\N	\N	\N	th	104
1041100	Không xác định	10411	0	\N	\N	\N	\N	\N	kx	104
1041101	Thị trấn Phúc Yên	10411	0	\N	\N	\N	\N	\N	py	104
1041103	Thị trấn Xuân Hòa	10411	0	\N	\N	\N	\N	\N	xh	104
1041107	Xã Cao Minh	10411	0	\N	\N	\N	\N	\N	cm	104
1041109	Xã Nam Viêm	10411	0	\N	\N	\N	\N	\N	nv	104
1041111	Xã Tiền Châu	10411	0	\N	\N	\N	\N	\N	tc	104
1041113	Xã Phúc Thắng	10411	0	\N	\N	\N	\N	\N	pt	104
1041115	Xã Kim Hoa	10411	0	\N	\N	\N	\N	\N	kh	104
1041117	Xã Thạch Đà	10411	0	\N	\N	\N	\N	\N	td	104
1041119	Xã Tiến Thắng	10411	0	\N	\N	\N	\N	\N	tt	104
1041121	Xã Tự Lập	10411	0	\N	\N	\N	\N	\N	tl	104
1041123	Xã Quang Minh	10411	0	\N	\N	\N	\N	\N	qm	104
1041125	Xã Thanh Lâm	10411	0	\N	\N	\N	\N	\N	tl	104
1041127	Xã Tam Đồng	10411	0	\N	\N	\N	\N	\N	td	104
1041129	Xã Liên Mạc	10411	0	\N	\N	\N	\N	\N	lm	104
1041131	Xã Vạn Yên	10411	0	\N	\N	\N	\N	\N	vy	104
1041133	Xã Đại Thịnh	10411	0	\N	\N	\N	\N	\N	dt	104
1041135	Xã Chu Phan	10411	0	\N	\N	\N	\N	\N	cp	104
1041137	Xã Tiến Thịnh	10411	0	\N	\N	\N	\N	\N	tt	104
1041139	Xã Mê Linh	10411	0	\N	\N	\N	\N	\N	ml	104
1041141	Xã Văn Khê	10411	0	\N	\N	\N	\N	\N	vk	104
1041143	Xã Hoàng Kim	10411	0	\N	\N	\N	\N	\N	hk	104
1041145	Xã Tiền Phong	10411	0	\N	\N	\N	\N	\N	tp	104
1041147	Xã Tráng Việt	10411	0	\N	\N	\N	\N	\N	tv	104
1041300	Không xác định	10413	0	\N	\N	\N	\N	\N	kx	104
1041301	Thị trấn Hương Canh	10413	0	\N	\N	\N	\N	\N	hc	104
1041303	Xã Trung Mỹ	10413	0	\N	\N	\N	\N	\N	tm	104
1041305	Xã Minh Quang	10413	0	\N	\N	\N	\N	\N	mq	104
1041307	Xã Gia Khánh	10413	0	\N	\N	\N	\N	\N	gk	104
1041309	Xã Bá Hiến	10413	0	\N	\N	\N	\N	\N	bh	104
1041311	Xã Thiện Kế	10413	0	\N	\N	\N	\N	\N	tk	104
1041313	Xã Hương Sơn	10413	0	\N	\N	\N	\N	\N	hs	104
1041315	Xã Tam Hợp	10413	0	\N	\N	\N	\N	\N	th	104
1041317	Xã Quất Lưu	10413	0	\N	\N	\N	\N	\N	ql	104
1041319	Xã Sơn Lôi	10413	0	\N	\N	\N	\N	\N	sl	104
1041321	Xã Đạo Đức	10413	0	\N	\N	\N	\N	\N	dd	104
1041323	Xã Tân Phong	10413	0	\N	\N	\N	\N	\N	tp	104
1041325	Xã Thanh Lãng	10413	0	\N	\N	\N	\N	\N	tl	104
1041327	Xã Phú Xuân	10413	0	\N	\N	\N	\N	\N	px	104
1050000	Không xác định	10500	0	\N	\N	\N	\N	\N	kx	105
1050300	Không xác định	10503	0	\N	\N	\N	\N	\N	kx	105
1050301	Phường Lê Lợi	10503	0	\N	\N	\N	\N	\N	ll	105
1050303	Phường Ngô Quyền	10503	0	\N	\N	\N	\N	\N	nq	105
1050305	Phường Quang Trung	10503	0	\N	\N	\N	\N	\N	qt	105
1050307	Phường Sơn Lộc	10503	0	\N	\N	\N	\N	\N	sl	105
1050309	Phường Xuân Khanh	10503	0	\N	\N	\N	\N	\N	xk	105
1050311	Xã Xuân Sơn	10503	0	\N	\N	\N	\N	\N	xs	105
1050313	Xã Kim Sơn	10503	0	\N	\N	\N	\N	\N	ks	105
1050315	Xã Đường Lâm	10503	0	\N	\N	\N	\N	\N	dl	105
1050317	Xã Thanh Mỹ	10503	0	\N	\N	\N	\N	\N	tm	105
1050319	Xã Trung Sơn Trầm	10503	0	\N	\N	\N	\N	\N	tst	105
1050321	Xã Sơn Đông	10503	0	\N	\N	\N	\N	\N	sd	105
1050323	Xã Cổ Đông	10503	0	\N	\N	\N	\N	\N	cd	105
1050325	Xã Trung Hưng	10503	0	\N	\N	\N	\N	\N	th	105
1050327	Xã Viên Sơn	10503	0	\N	\N	\N	\N	\N	vs	105
1050500	Không xác định	10505	0	\N	\N	\N	\N	\N	kx	105
1050501	Thị trấn Tây Đằng	10505	0	\N	\N	\N	\N	\N	td	105
1050503	Xã Thuần Mỹ	10505	0	\N	\N	\N	\N	\N	tm	105
1050505	Xã Sơn Đà	10505	0	\N	\N	\N	\N	\N	sd	105
1050507	Xã Tòng Bạt	10505	0	\N	\N	\N	\N	\N	tb	105
1050509	Xã Phong Vân	10505	0	\N	\N	\N	\N	\N	pv	105
1050511	Xã Cổ Đô	10505	0	\N	\N	\N	\N	\N	cd	105
1050513	Xã Tân Đức	10505	0	\N	\N	\N	\N	\N	td	105
1050515	Xã Phú Cường	10505	0	\N	\N	\N	\N	\N	pc	105
1050517	Xã Tản Hồng	10505	0	\N	\N	\N	\N	\N	th	105
1050519	Xã Châu Sơn	10505	0	\N	\N	\N	\N	\N	cs	105
1050521	Xã Phú Phương	10505	0	\N	\N	\N	\N	\N	pp	105
1050523	Xã Phú Châu	10505	0	\N	\N	\N	\N	\N	pc	105
1050525	Xã Minh Châu	10505	0	\N	\N	\N	\N	\N	mc	105
1050527	Xã Chu Minh	10505	0	\N	\N	\N	\N	\N	cm	105
1050529	Xã Đông Quang	10505	0	\N	\N	\N	\N	\N	dq	105
1050531	Xã Thái Hòa	10505	0	\N	\N	\N	\N	\N	th	105
1050533	Xã Phú Sơn	10505	0	\N	\N	\N	\N	\N	ps	105
1050535	Xã Phú Đông	10505	0	\N	\N	\N	\N	\N	pd	105
1050537	Xã Vạn Thắng	10505	0	\N	\N	\N	\N	\N	vt	105
1050539	Xã Đồng Thái	10505	0	\N	\N	\N	\N	\N	dt	105
1050541	Xã Vật Lại	10505	0	\N	\N	\N	\N	\N	vl	105
1050543	Xã Cẩm Lĩnh	10505	0	\N	\N	\N	\N	\N	cl	105
1050545	Xã Thụy An	10505	0	\N	\N	\N	\N	\N	ta	105
1050547	Xã Tiên Phong	10505	0	\N	\N	\N	\N	\N	tp	105
1050549	Xã Cam Thượng	10505	0	\N	\N	\N	\N	\N	ct	105
1050551	Xã Ba Vì	10505	0	\N	\N	\N	\N	\N	bv	105
1050553	Xã Khánh Thượng	10505	0	\N	\N	\N	\N	\N	kt	105
1050555	Xã Minh Quang	10505	0	\N	\N	\N	\N	\N	mq	105
1050557	Xã Ba Trại	10505	0	\N	\N	\N	\N	\N	bt	105
1050559	Xã Tản Lĩnh	10505	0	\N	\N	\N	\N	\N	tl	105
1050561	Xã Vân Hòa	10505	0	\N	\N	\N	\N	\N	vh	105
1050563	Xã Yên Bài	10505	0	\N	\N	\N	\N	\N	yb	105
1050700	Không xác định	10507	0	\N	\N	\N	\N	\N	kx	105
1050701	Thị trấn Phúc Thọ	10507	0	\N	\N	\N	\N	\N	pt	105
1050703	Xã Vân Hà	10507	0	\N	\N	\N	\N	\N	vh	105
1050705	Xã Vân Nam	10507	0	\N	\N	\N	\N	\N	vn	105
1050707	Xã Vân Phúc	10507	0	\N	\N	\N	\N	\N	vp	105
1050709	Xã Xuân Phú	10507	0	\N	\N	\N	\N	\N	xp	105
1050711	Xã Cẩm Đình	10507	0	\N	\N	\N	\N	\N	cd	105
1050713	Xã Phương Độ	10507	0	\N	\N	\N	\N	\N	pd	105
1050715	Xã Sen Chiểu	10507	0	\N	\N	\N	\N	\N	sc	105
1050717	Xã Võng Xuyên	10507	0	\N	\N	\N	\N	\N	vx	105
1050719	Xã Long Xuyên	10507	0	\N	\N	\N	\N	\N	lx	105
1050721	Xã Thượng Cốc	10507	0	\N	\N	\N	\N	\N	tc	105
1050723	Xã Hát Môn	10507	0	\N	\N	\N	\N	\N	hm	105
1050725	Xã Thọ Lộc	10507	0	\N	\N	\N	\N	\N	tl	105
1050727	Xã Tích Giang	10507	0	\N	\N	\N	\N	\N	tg	105
1050729	Xã Phúc Hòa	10507	0	\N	\N	\N	\N	\N	ph	105
1050731	Xã Ngọc Tảo	10507	0	\N	\N	\N	\N	\N	nt	105
1050733	Xã Thanh Đa	10507	0	\N	\N	\N	\N	\N	td	105
1050735	Xã Trạch Mỹ Lộc	10507	0	\N	\N	\N	\N	\N	tml	105
1050737	Xã Tam Thuấn	10507	0	\N	\N	\N	\N	\N	tt	105
1050739	Xã Phụng Thượng	10507	0	\N	\N	\N	\N	\N	pt	105
1050741	Xã Tam Hiệp	10507	0	\N	\N	\N	\N	\N	th	105
1050743	Xã Hiệp Thuận	10507	0	\N	\N	\N	\N	\N	ht	105
1050745	Xã Liên Hiệp	10507	0	\N	\N	\N	\N	\N	lh	105
1050900	Không xác định	10509	0	\N	\N	\N	\N	\N	kx	105
1050901	Thị trấn Phùng	10509	0	\N	\N	\N	\N	\N	p	105
1050903	Xã Trung Châu	10509	0	\N	\N	\N	\N	\N	tc	105
1050905	Xã Thọ An	10509	0	\N	\N	\N	\N	\N	ta	105
1050907	Xã Thọ Xuân	10509	0	\N	\N	\N	\N	\N	tx	105
1050909	Xã Hồng Hà	10509	0	\N	\N	\N	\N	\N	hh	105
1050911	Xã Liên Hồng	10509	0	\N	\N	\N	\N	\N	lh	105
1050913	Xã Liên Hà	10509	0	\N	\N	\N	\N	\N	lh	105
1050915	Xã Hạ Mỗ	10509	0	\N	\N	\N	\N	\N	hm	105
1050917	Xã Liên Trung	10509	0	\N	\N	\N	\N	\N	lt	105
1050919	Xã Phương Đình	10509	0	\N	\N	\N	\N	\N	pd	105
1050921	Xã Thượng Mỗ	10509	0	\N	\N	\N	\N	\N	tm	105
1050923	Xã Đan Phượng	10509	0	\N	\N	\N	\N	\N	dp	105
1050925	Xã Tân Hội	10509	0	\N	\N	\N	\N	\N	th	105
1050927	Xã Tân Lập	10509	0	\N	\N	\N	\N	\N	tl	105
1050929	Xã Đồng Tháp	10509	0	\N	\N	\N	\N	\N	dt	105
1050931	Xã Song Phượng	10509	0	\N	\N	\N	\N	\N	sp	105
1051100	Không xác định	10511	0	\N	\N	\N	\N	\N	kx	105
1051101	Thị trấn Liên Quan	10511	0	\N	\N	\N	\N	\N	lq	105
1051103	Xã Đại Đồng	10511	0	\N	\N	\N	\N	\N	dd	105
1051105	Xã Cẩm Yên	10511	0	\N	\N	\N	\N	\N	cy	105
1051107	Xã Lại Thượng	10511	0	\N	\N	\N	\N	\N	lt	105
1051109	Xã Phú Kim	10511	0	\N	\N	\N	\N	\N	pk	105
1051111	Xã Hương Ngải	10511	0	\N	\N	\N	\N	\N	hn	105
1051113	Xã Canh Nậu	10511	0	\N	\N	\N	\N	\N	cn	105
1051115	Xã Dị Nậu	10511	0	\N	\N	\N	\N	\N	dn	105
1051117	Xã Bình Yên	10511	0	\N	\N	\N	\N	\N	by	105
1051119	Xã Kim Quan	10511	0	\N	\N	\N	\N	\N	kq	105
1051121	Xã Chàng Sơn	10511	0	\N	\N	\N	\N	\N	cs	105
1051123	Xã Thạch Xá	10511	0	\N	\N	\N	\N	\N	tx	105
1051125	Xã Hữu Bằng	10511	0	\N	\N	\N	\N	\N	hb	105
1051127	Xã Phùng Xá	10511	0	\N	\N	\N	\N	\N	px	105
1051129	Xã Tân Xã	10511	0	\N	\N	\N	\N	\N	tx	105
1051131	Xã Cần Kiệm	10511	0	\N	\N	\N	\N	\N	ck	105
1051133	Xã Bình Phú	10511	0	\N	\N	\N	\N	\N	bp	105
1051135	Xã Hạ Bằng	10511	0	\N	\N	\N	\N	\N	hb	105
1051137	Xã Đồng Trúc	10511	0	\N	\N	\N	\N	\N	dt	105
1051139	Xã Thạch Hoà	10511	0	\N	\N	\N	\N	\N	th	105
1051300	Không xác định	10513	0	\N	\N	\N	\N	\N	kx	105
1051301	Thị trấn Trạm Trôi	10513	0	\N	\N	\N	\N	\N	tt	105
1051303	Xã Đức Thượng	10513	0	\N	\N	\N	\N	\N	dt	105
1051305	Xã Minh Khai	10513	0	\N	\N	\N	\N	\N	mk	105
1051307	Xã Dương Liễu	10513	0	\N	\N	\N	\N	\N	dl	105
1051309	Xã Đức Giang	10513	0	\N	\N	\N	\N	\N	dg	105
1051311	Xã Kim Chung	10513	0	\N	\N	\N	\N	\N	kc	105
1051313	Xã Di Trạch	10513	0	\N	\N	\N	\N	\N	dt	105
1051315	Xã Cát Quế	10513	0	\N	\N	\N	\N	\N	cq	105
1051317	Xã Sơn Đồng	10513	0	\N	\N	\N	\N	\N	sd	105
1051319	Xã Yên Sở	10513	0	\N	\N	\N	\N	\N	ys	105
1051321	Xã Đắc Sở	10513	0	\N	\N	\N	\N	\N	ds	105
1051323	Xã Vân Canh	10513	0	\N	\N	\N	\N	\N	vc	105
1051325	Xã Tiền Yên	10513	0	\N	\N	\N	\N	\N	ty	105
1051327	Xã Song Phương	10513	0	\N	\N	\N	\N	\N	sp	105
1051329	Xã Lại Yên	10513	0	\N	\N	\N	\N	\N	ly	105
1051331	Xã An Khánh	10513	0	\N	\N	\N	\N	\N	ak	105
1051333	Xã Vân Côn	10513	0	\N	\N	\N	\N	\N	vc	105
1051335	Xã An Thượng	10513	0	\N	\N	\N	\N	\N	at	105
1012520	Không xác định	10125	0	\N	\N	\N	\N	\N	kx	101
1051339	Xã La Phù	10513	0	\N	\N	\N	\N	\N	lp	105
1051341	Xã Đông La	10513	0	\N	\N	\N	\N	\N	dl	105
2252720	Không xác định	22527	0	\N	\N	\N	\N	\N	kx	225
1051500	Không xác định	10515	0	\N	\N	\N	\N	\N	kx	105
1051501	Thị trấn Quốc Oai	10515	0	\N	\N	\N	\N	\N	qo	105
1051503	Xã Phú Mãn	10515	0	\N	\N	\N	\N	\N	pm	105
1051505	Xã Phú Cát	10515	0	\N	\N	\N	\N	\N	pc	105
1051507	Xã Hòa Thạch	10515	0	\N	\N	\N	\N	\N	ht	105
1051509	Xã Tuyết Nghĩa	10515	0	\N	\N	\N	\N	\N	tn	105
1051511	Xã Đông Yên	10515	0	\N	\N	\N	\N	\N	dy	105
1051513	Xã Liệp Tuyết	10515	0	\N	\N	\N	\N	\N	lt	105
1051515	Xã Ngọc Liệp	10515	0	\N	\N	\N	\N	\N	nl	105
1051517	Xã Ngọc Mỹ	10515	0	\N	\N	\N	\N	\N	nm	105
1051519	Xã Cấn Hữu	10515	0	\N	\N	\N	\N	\N	ch	105
1051521	Xã Nghĩa Hương	10515	0	\N	\N	\N	\N	\N	nh	105
1051523	Xã Thạch Thán	10515	0	\N	\N	\N	\N	\N	tt	105
1051525	Xã Đồng Quang	10515	0	\N	\N	\N	\N	\N	dq	105
1051527	Xã Sài Sơn	10515	0	\N	\N	\N	\N	\N	ss	105
1051529	Xã Yên Sơn	10515	0	\N	\N	\N	\N	\N	ys	105
1051531	Xã Phượng Cách	10515	0	\N	\N	\N	\N	\N	pc	105
1051533	Xã Tân Phú	10515	0	\N	\N	\N	\N	\N	tp	105
1051535	Xã Đại Thành	10515	0	\N	\N	\N	\N	\N	dt	105
1051537	Xã Tân Hòa	10515	0	\N	\N	\N	\N	\N	th	105
1051539	Xã Cộng Hòa	10515	0	\N	\N	\N	\N	\N	ch	105
1051700	Không xác định	10517	0	\N	\N	\N	\N	\N	kx	105
1051701	Thị trấn Chúc Sơn	10517	0	\N	\N	\N	\N	\N	cs	105
1051703	Thị trấn Xuân Mai	10517	0	\N	\N	\N	\N	\N	xm	105
1051705	Xã Phụng Châu	10517	0	\N	\N	\N	\N	\N	pc	105
1051707	Xã Đông Sơn	10517	0	\N	\N	\N	\N	\N	ds	105
1051709	Xã Đông Phương Yên	10517	0	\N	\N	\N	\N	\N	dpy	105
1051711	Xã Phú Nghĩa	10517	0	\N	\N	\N	\N	\N	pn	105
1051713	Xã Tiên Phương	10517	0	\N	\N	\N	\N	\N	tp	105
1051715	Xã Ngọc Sơn	10517	0	\N	\N	\N	\N	\N	ns	105
1051717	Xã Ngọc Hòa	10517	0	\N	\N	\N	\N	\N	nh	105
1051719	Xã Trường Yên	10517	0	\N	\N	\N	\N	\N	ty	105
1051721	Xã Thủy Xuân Tiên	10517	0	\N	\N	\N	\N	\N	txt	105
1051723	Xã Thanh Bình	10517	0	\N	\N	\N	\N	\N	tb	105
1051725	Xã Trung Hòa	10517	0	\N	\N	\N	\N	\N	th	105
1051727	Xã Thụy Hương	10517	0	\N	\N	\N	\N	\N	th	105
1051729	Xã Đại Yên	10517	0	\N	\N	\N	\N	\N	dy	105
1051731	Xã Tân Tiến	10517	0	\N	\N	\N	\N	\N	tt	105
1051733	Xã Nam Phương Tiến	10517	0	\N	\N	\N	\N	\N	npt	105
1051735	Xã Lam Điền	10517	0	\N	\N	\N	\N	\N	ld	105
1051737	Xã Tốt Động	10517	0	\N	\N	\N	\N	\N	td	105
1051739	Xã Hợp Đồng	10517	0	\N	\N	\N	\N	\N	hd	105
1051741	Xã Hoàng Văn Thụ	10517	0	\N	\N	\N	\N	\N	hvt	105
1051743	Xã Hoàng Diệu	10517	0	\N	\N	\N	\N	\N	hd	105
1051745	Xã Hữu Văn	10517	0	\N	\N	\N	\N	\N	hv	105
1051747	Xã Quảng Bị	10517	0	\N	\N	\N	\N	\N	qb	105
1051749	Xã Mỹ Lương	10517	0	\N	\N	\N	\N	\N	ml	105
1051751	Xã Thượng Vực	10517	0	\N	\N	\N	\N	\N	tv	105
1051753	Xã Trần Phú	10517	0	\N	\N	\N	\N	\N	tp	105
1051755	Xã Hồng Phong	10517	0	\N	\N	\N	\N	\N	hp	105
1051757	Xã Đồng Phú	10517	0	\N	\N	\N	\N	\N	dp	105
1051759	Xã Văn Võ	10517	0	\N	\N	\N	\N	\N	vv	105
1051761	Xã Đồng Lạc	10517	0	\N	\N	\N	\N	\N	dl	105
1051763	Xã Hòa Chính	10517	0	\N	\N	\N	\N	\N	hc	105
1051765	Xã Phú Nam An	10517	0	\N	\N	\N	\N	\N	pna	105
1051900	Không xác định	10519	0	\N	\N	\N	\N	\N	kx	105
1051901	Thị trấn Kim Bài	10519	0	\N	\N	\N	\N	\N	kb	105
1051903	Xã Phú Lãm	10519	0	\N	\N	\N	\N	\N	pl	105
1051905	Xã Phú Lương	10519	0	\N	\N	\N	\N	\N	pl	105
1051907	Xã Biên Giang	10519	0	\N	\N	\N	\N	\N	bg	105
1051909	Xã Đồng Mai	10519	0	\N	\N	\N	\N	\N	dm	105
1051911	Xã Cự Khê	10519	0	\N	\N	\N	\N	\N	ck	105
1051913	Xã Bích Hòa	10519	0	\N	\N	\N	\N	\N	bh	105
1051915	Xã Cao Viên	10519	0	\N	\N	\N	\N	\N	cv	105
1051917	Xã Mỹ Hưng	10519	0	\N	\N	\N	\N	\N	mh	105
1051919	Xã Bình Minh	10519	0	\N	\N	\N	\N	\N	bm	105
1051921	Xã Tam Hưng	10519	0	\N	\N	\N	\N	\N	th	105
1051923	Xã Thanh Cao	10519	0	\N	\N	\N	\N	\N	tc	105
1051925	Xã Thanh Thùy	10519	0	\N	\N	\N	\N	\N	tt	105
1051927	Xã Thanh Mai	10519	0	\N	\N	\N	\N	\N	tm	105
1051929	Xã Kim An	10519	0	\N	\N	\N	\N	\N	ka	105
1051931	Xã Kim Thư	10519	0	\N	\N	\N	\N	\N	kt	105
1051933	Xã Thanh Văn	10519	0	\N	\N	\N	\N	\N	tv	105
1051935	Xã Đỗ Động	10519	0	\N	\N	\N	\N	\N	dd	105
1051937	Xã Tân Ước	10519	0	\N	\N	\N	\N	\N	tu	105
1051939	Xã Phương Trung	10519	0	\N	\N	\N	\N	\N	pt	105
1051941	Xã Liên Châu	10519	0	\N	\N	\N	\N	\N	lc	105
1051943	Xã Dân Hòa	10519	0	\N	\N	\N	\N	\N	dh	105
1051945	Xã Cao Dương	10519	0	\N	\N	\N	\N	\N	cd	105
1051947	Xã Xuân Dương	10519	0	\N	\N	\N	\N	\N	xd	105
1051949	Xã Hồng Dương	10519	0	\N	\N	\N	\N	\N	hd	105
1052100	Không xác định	10521	0	\N	\N	\N	\N	\N	kx	105
1052101	Thị trấn Thường Tín	10521	0	\N	\N	\N	\N	\N	tt	105
1052103	Xã Khánh Hà	10521	0	\N	\N	\N	\N	\N	kh	105
1052105	Xã Ninh Sở	10521	0	\N	\N	\N	\N	\N	ns	105
1052107	Xã Duyên Thái	10521	0	\N	\N	\N	\N	\N	dt	105
1052109	Xã Nhị Khê	10521	0	\N	\N	\N	\N	\N	nk	105
1052111	Xã Hòa Bình	10521	0	\N	\N	\N	\N	\N	hb	105
1052113	Xã Văn Bình	10521	0	\N	\N	\N	\N	\N	vb	105
1052115	Xã Vân Tảo	10521	0	\N	\N	\N	\N	\N	vt	105
1052117	Xã Hồng Vân	10521	0	\N	\N	\N	\N	\N	hv	105
1052119	Xã Hiền Giang	10521	0	\N	\N	\N	\N	\N	hg	105
1052121	Xã Liên Phương	10521	0	\N	\N	\N	\N	\N	lp	105
1052123	Xã Văn Phú	10521	0	\N	\N	\N	\N	\N	vp	105
1052125	Xã Tự Nhiên	10521	0	\N	\N	\N	\N	\N	tn	105
1052127	Xã Thư Phú	10521	0	\N	\N	\N	\N	\N	tp	105
1052129	Xã Tiền Phong	10521	0	\N	\N	\N	\N	\N	tp	105
1052131	Xã Hà Hồi	10521	0	\N	\N	\N	\N	\N	hh	105
1052133	Xã Nguyễn Trãi	10521	0	\N	\N	\N	\N	\N	nt	105
1052135	Xã Chương Dương	10521	0	\N	\N	\N	\N	\N	cd	105
1052137	Xã Tân Minh	10521	0	\N	\N	\N	\N	\N	tm	105
1052139	Xã Quất Động	10521	0	\N	\N	\N	\N	\N	qd	105
1052141	Xã Thắng Lợi	10521	0	\N	\N	\N	\N	\N	tl	105
1052143	Xã Lê Lợi	10521	0	\N	\N	\N	\N	\N	ll	105
1052145	Xã Dũng Tiến	10521	0	\N	\N	\N	\N	\N	dt	105
1052147	Xã Nghiêm Xuyên	10521	0	\N	\N	\N	\N	\N	nx	105
1052149	Xã Tô Hiệu	10521	0	\N	\N	\N	\N	\N	th	105
1052151	Xã Thống Nhất	10521	0	\N	\N	\N	\N	\N	tn	105
1052153	Xã Văn Tự	10521	0	\N	\N	\N	\N	\N	vt	105
1052155	Xã Vạn Điểm	10521	0	\N	\N	\N	\N	\N	vd	105
1052157	Xã Minh Cường	10521	0	\N	\N	\N	\N	\N	mc	105
1052300	Không xác định	10523	0	\N	\N	\N	\N	\N	kx	105
1052301	Thị trấn Tế Tiêu	10523	0	\N	\N	\N	\N	\N	tt	105
1052303	Xã Đồng Tâm	10523	0	\N	\N	\N	\N	\N	dt	105
1052305	Xã Thượng Lâm	10523	0	\N	\N	\N	\N	\N	tl	105
1052307	Xã Tuy Lai	10523	0	\N	\N	\N	\N	\N	tl	105
1052309	Xã Phúc Lâm	10523	0	\N	\N	\N	\N	\N	pl	105
1052311	Xã Mỹ Thành	10523	0	\N	\N	\N	\N	\N	mt	105
1052313	Xã Bột Xuyên	10523	0	\N	\N	\N	\N	\N	bx	105
1052315	Xã An Mỹ	10523	0	\N	\N	\N	\N	\N	am	105
1052317	Xã Hồng Sơn	10523	0	\N	\N	\N	\N	\N	hs	105
1052319	Xã Lê Thanh	10523	0	\N	\N	\N	\N	\N	lt	105
1052321	Xã Xuy Xá	10523	0	\N	\N	\N	\N	\N	xx	105
1052323	Xã Phùng Xá	10523	0	\N	\N	\N	\N	\N	px	105
1052325	Xã Phù Lưu Tế	10523	0	\N	\N	\N	\N	\N	plt	105
1052327	Xã Đại Nghĩa	10523	0	\N	\N	\N	\N	\N	dn	105
1052329	Xã Đại Hưng	10523	0	\N	\N	\N	\N	\N	dh	105
1052331	Xã Vạn Kim	10523	0	\N	\N	\N	\N	\N	vk	105
1052333	Xã Đốc Tín	10523	0	\N	\N	\N	\N	\N	dt	105
1052335	Xã Hương Sơn	10523	0	\N	\N	\N	\N	\N	hs	105
1052337	Xã Hùng Tiến	10523	0	\N	\N	\N	\N	\N	ht	105
1052339	Xã An Tiến	10523	0	\N	\N	\N	\N	\N	at	105
1052341	Xã Hợp Tiến	10523	0	\N	\N	\N	\N	\N	ht	105
1052343	Xã Hợp Thanh	10523	0	\N	\N	\N	\N	\N	ht	105
1052345	Xã An Phú	10523	0	\N	\N	\N	\N	\N	ap	105
1052500	Không xác định	10525	0	\N	\N	\N	\N	\N	kx	105
1052501	Thị trấn Vân Đình	10525	0	\N	\N	\N	\N	\N	vd	105
1052503	Xã Viên An	10525	0	\N	\N	\N	\N	\N	va	105
1052505	Xã Viên Nội	10525	0	\N	\N	\N	\N	\N	vn	105
1052507	Xã Sơn Công	10525	0	\N	\N	\N	\N	\N	sc	105
1052509	Xã Đồng Tiến	10525	0	\N	\N	\N	\N	\N	dt	105
1052511	Xã Vạn Thái	10525	0	\N	\N	\N	\N	\N	vt	105
1052513	Xã Hòa Xá	10525	0	\N	\N	\N	\N	\N	hx	105
1052515	Xã Hòa Nam	10525	0	\N	\N	\N	\N	\N	hn	105
1052517	Xã Hòa Phú	10525	0	\N	\N	\N	\N	\N	hp	105
1052519	Xã Phù Lưu	10525	0	\N	\N	\N	\N	\N	pl	105
1052521	Xã Lưu Hoàng	10525	0	\N	\N	\N	\N	\N	lh	105
1052523	Xã Hồng Quang	10525	0	\N	\N	\N	\N	\N	hq	105
1052525	Xã Cao Thành	10525	0	\N	\N	\N	\N	\N	ct	105
1052527	Xã Tân Phương	10525	0	\N	\N	\N	\N	\N	tp	105
1052529	Xã Hoa Sơn	10525	0	\N	\N	\N	\N	\N	hs	105
1052531	Xã Trường Thịnh	10525	0	\N	\N	\N	\N	\N	tt	105
1052533	Xã Quảng Phú Cầu	10525	0	\N	\N	\N	\N	\N	qpc	105
1052535	Xã Liên Bạt	10525	0	\N	\N	\N	\N	\N	lb	105
1052537	Xã Phương Tú	10525	0	\N	\N	\N	\N	\N	pt	105
1052539	Xã Tảo Dương Văn	10525	0	\N	\N	\N	\N	\N	tdv	105
1052541	Xã Đội Bình	10525	0	\N	\N	\N	\N	\N	db	105
1052543	Xã Đại Hùng	10525	0	\N	\N	\N	\N	\N	dh	105
1052545	Xã Đại Cường	10525	0	\N	\N	\N	\N	\N	dc	105
1052547	Xã Đông Lỗ	10525	0	\N	\N	\N	\N	\N	dl	105
1052549	Xã Trung Tú	10525	0	\N	\N	\N	\N	\N	tt	105
1052551	Xã Đồng Tân	10525	0	\N	\N	\N	\N	\N	dt	105
1052553	Xã Minh Đức	10525	0	\N	\N	\N	\N	\N	md	105
1052555	Xã Kim Đường	10525	0	\N	\N	\N	\N	\N	kd	105
1052557	Xã Hòa Lâm	10525	0	\N	\N	\N	\N	\N	hl	105
1052559	Xã Trầm Lộng	10525	0	\N	\N	\N	\N	\N	tl	105
1052700	Không xác định	10527	0	\N	\N	\N	\N	\N	kx	105
1052701	Thị trấn Phú Xuyên	10527	0	\N	\N	\N	\N	\N	px	105
1052703	Thị trấn Phú Minh	10527	0	\N	\N	\N	\N	\N	pm	105
1052705	Xã Hồng Minh	10527	0	\N	\N	\N	\N	\N	hm	105
1052707	Xã Phượng Dực	10527	0	\N	\N	\N	\N	\N	pd	105
1052709	Xã Đại Thắng	10527	0	\N	\N	\N	\N	\N	dt	105
1052711	Xã Tri Trung	10527	0	\N	\N	\N	\N	\N	tt	105
1052713	Xã Văn Hoàng	10527	0	\N	\N	\N	\N	\N	vh	105
1052715	Xã Phú Túc	10527	0	\N	\N	\N	\N	\N	pt	105
1052717	Xã Hoàng Long	10527	0	\N	\N	\N	\N	\N	hl	105
1052719	Xã Quang Trung	10527	0	\N	\N	\N	\N	\N	qt	105
1052721	Xã Nam Triều	10527	0	\N	\N	\N	\N	\N	nt	105
1052723	Xã Tân Dân	10527	0	\N	\N	\N	\N	\N	td	105
1052725	Xã Sơn Hà	10527	0	\N	\N	\N	\N	\N	sh	105
1052727	Xã Chuyên Mỹ	10527	0	\N	\N	\N	\N	\N	cm	105
1052729	Xã Phúc Tiến	10527	0	\N	\N	\N	\N	\N	pt	105
1052731	Xã Vân Từ	10527	0	\N	\N	\N	\N	\N	vt	105
1052733	Xã Đại Xuyên	10527	0	\N	\N	\N	\N	\N	dx	105
1052735	Xã Phú Yên	10527	0	\N	\N	\N	\N	\N	py	105
1052737	Xã Châu Can	10527	0	\N	\N	\N	\N	\N	cc	105
1052739	Xã Văn Nhân	10527	0	\N	\N	\N	\N	\N	vn	105
1052741	Xã Thụy Phú	10527	0	\N	\N	\N	\N	\N	tp	105
1052743	Xã Hồng Thái	10527	0	\N	\N	\N	\N	\N	ht	105
1052745	Xã Nam Phong	10527	0	\N	\N	\N	\N	\N	np	105
1052747	Xã Khai Thái	10527	0	\N	\N	\N	\N	\N	kt	105
1052749	Xã Tri Thủy	10527	0	\N	\N	\N	\N	\N	tt	105
1052751	Xã Bạch Hạ	10527	0	\N	\N	\N	\N	\N	bh	105
1052753	Xã Quang Lãng	10527	0	\N	\N	\N	\N	\N	ql	105
1052755	Xã Minh Tân	10527	0	\N	\N	\N	\N	\N	mt	105
1070000	Không xác định	10700	0	\N	\N	\N	\N	\N	kx	107
1070100	Không xác định	10701	0	\N	\N	\N	\N	\N	kx	107
1070101	Phường Phạm Ngũ Lão	10701	0	\N	\N	\N	\N	\N	pnl	107
1070103	Phường Nguyễn Trãi	10701	0	\N	\N	\N	\N	\N	nt	107
1070105	Phường Lê Thanh Nghị	10701	0	\N	\N	\N	\N	\N	ltn	107
1070107	Phường Trần Phú	10701	0	\N	\N	\N	\N	\N	tp	107
1070109	Phường Quang Trung	10701	0	\N	\N	\N	\N	\N	qt	107
1070111	Phường Trần Hưng Đạo	10701	0	\N	\N	\N	\N	\N	thd	107
1070113	Phường Cẩm Thượng	10701	0	\N	\N	\N	\N	\N	ct	107
1070115	Phường Bình Hàn	10701	0	\N	\N	\N	\N	\N	bh	107
1070117	Phường Ngọc Châu	10701	0	\N	\N	\N	\N	\N	nc	107
1070119	Phường Thanh Bình	10701	0	\N	\N	\N	\N	\N	tb	107
1070121	Phường Hải Tân	10701	0	\N	\N	\N	\N	\N	ht	107
1070123	Xã Việt Hòa	10701	0	\N	\N	\N	\N	\N	vh	107
1070125	Xã Tứ Minh	10701	0	\N	\N	\N	\N	\N	tm	107
1070300	Không xác định	10703	0	\N	\N	\N	\N	\N	kx	107
1070301	Thị trấn Sao Đỏ	10703	0	\N	\N	\N	\N	\N	sd	107
1070303	Thị trấn NT Trường	10703	0	\N	\N	\N	\N	\N	nt	107
1070307	Xã Hưng Đạo	10703	0	\N	\N	\N	\N	\N	hd	107
1070309	Xã Lê Lợi	10703	0	\N	\N	\N	\N	\N	ll	107
1070311	Xã Bắc An	10703	0	\N	\N	\N	\N	\N	ba	107
1070313	Xã Hoàng Hoa Thám	10703	0	\N	\N	\N	\N	\N	hht	107
1070315	Xã Cổ Thành	10703	0	\N	\N	\N	\N	\N	ct	107
1070317	Xã Cộng Hòa	10703	0	\N	\N	\N	\N	\N	ch	107
1070319	Xã Hoàng Tân	10703	0	\N	\N	\N	\N	\N	ht	107
1070321	Xã Hoàng Tiến	10703	0	\N	\N	\N	\N	\N	ht	107
1070323	Xã Nhân Huệ	10703	0	\N	\N	\N	\N	\N	nh	107
1070325	Xã Văn An	10703	0	\N	\N	\N	\N	\N	va	107
1070327	Xã Chí Minh	10703	0	\N	\N	\N	\N	\N	cm	107
1070329	Xã Thái Học	10703	0	\N	\N	\N	\N	\N	th	107
1070331	Xã Văn Đức	10703	0	\N	\N	\N	\N	\N	vd	107
1070333	Xã Tân Dân	10703	0	\N	\N	\N	\N	\N	td	107
1070335	Xã An Lạc	10703	0	\N	\N	\N	\N	\N	al	107
1070337	Xã Kênh Giang	10703	0	\N	\N	\N	\N	\N	kg	107
1070339	Xã Đồng Lạc	10703	0	\N	\N	\N	\N	\N	dl	107
1070500	Không xác định	10705	0	\N	\N	\N	\N	\N	kx	107
1070501	Thị trấn Nam Sách	10705	0	\N	\N	\N	\N	\N	ns	107
1070503	Xã Nam Hưng	10705	0	\N	\N	\N	\N	\N	nh	107
1070505	Xã Nam Tân	10705	0	\N	\N	\N	\N	\N	nt	107
1070507	Xã Thanh Quang	10705	0	\N	\N	\N	\N	\N	tq	107
1070509	Xã Quốc Tuấn	10705	0	\N	\N	\N	\N	\N	qt	107
1070511	Xã Hợp Tiến	10705	0	\N	\N	\N	\N	\N	ht	107
1070513	Xã Hiệp Cát	10705	0	\N	\N	\N	\N	\N	hc	107
1070515	Xã Nam Chính	10705	0	\N	\N	\N	\N	\N	nc	107
1070517	Xã Nam Trung	10705	0	\N	\N	\N	\N	\N	nt	107
1070519	Xã An Sơn	10705	0	\N	\N	\N	\N	\N	as	107
1070521	Xã Thái Tân	10705	0	\N	\N	\N	\N	\N	tt	107
1070523	Xã Minh Tân	10705	0	\N	\N	\N	\N	\N	mt	107
1070525	Xã Hồng Phong	10705	0	\N	\N	\N	\N	\N	hp	107
1070527	Xã Nam Hồng	10705	0	\N	\N	\N	\N	\N	nh	107
1070529	Xã Thượng Đạt	10705	0	\N	\N	\N	\N	\N	td	107
1070531	Xã An Lâm	10705	0	\N	\N	\N	\N	\N	al	107
1070533	Xã Nam Đồng	10705	0	\N	\N	\N	\N	\N	nd	107
1070535	Xã ái Quốc	10705	0	\N	\N	\N	\N	\N	aq	107
1070537	Xã Đồng Lạc	10705	0	\N	\N	\N	\N	\N	dl	107
1070539	Xã An Châu	10705	0	\N	\N	\N	\N	\N	ac	107
1070541	Xã Phú Điền	10705	0	\N	\N	\N	\N	\N	pd	107
1070543	Xã An Bình	10705	0	\N	\N	\N	\N	\N	ab	107
1070545	Xã Cộng Hòa	10705	0	\N	\N	\N	\N	\N	ch	107
1070700	Không xác định	10707	0	\N	\N	\N	\N	\N	kx	107
1070701	Thị trấn Thanh Hà	10707	0	\N	\N	\N	\N	\N	th	107
1070703	Xã Hồng Lạc	10707	0	\N	\N	\N	\N	\N	hl	107
1070705	Xã Việt Hồng	10707	0	\N	\N	\N	\N	\N	vh	107
1070707	Xã Thanh An	10707	0	\N	\N	\N	\N	\N	ta	107
1070709	Xã Thanh Lang	10707	0	\N	\N	\N	\N	\N	tl	107
1070711	Xã Liên Mạc	10707	0	\N	\N	\N	\N	\N	lm	107
1070713	Xã Cẩm Chế	10707	0	\N	\N	\N	\N	\N	cc	107
1070715	Xã Tân Việt	10707	0	\N	\N	\N	\N	\N	tv	107
1070717	Xã Quyết Thắng	10707	0	\N	\N	\N	\N	\N	qt	107
1070719	Xã Tiền Tiến	10707	0	\N	\N	\N	\N	\N	tt	107
1070721	Xã Tân An	10707	0	\N	\N	\N	\N	\N	ta	107
1070723	Xã Thanh Hải	10707	0	\N	\N	\N	\N	\N	th	107
1070725	Xã An Lương	10707	0	\N	\N	\N	\N	\N	al	107
1070727	Xã Phượng Hoàng	10707	0	\N	\N	\N	\N	\N	ph	107
1070729	Xã Thanh Khê	10707	0	\N	\N	\N	\N	\N	tk	107
1070731	Xã Thanh Xá	10707	0	\N	\N	\N	\N	\N	tx	107
1070733	Xã Thanh Xuân	10707	0	\N	\N	\N	\N	\N	tx	107
1070735	Xã Thanh Thủy	10707	0	\N	\N	\N	\N	\N	tt	107
1070737	Xã Thanh Sơn	10707	0	\N	\N	\N	\N	\N	ts	107
1070739	Xã Hợp Đức	10707	0	\N	\N	\N	\N	\N	hd	107
1070741	Xã Trường Thành	10707	0	\N	\N	\N	\N	\N	tt	107
1070743	Xã Thanh Bính	10707	0	\N	\N	\N	\N	\N	tb	107
1070745	Xã Thanh Cường	10707	0	\N	\N	\N	\N	\N	tc	107
1070747	Xã Thanh Hồng	10707	0	\N	\N	\N	\N	\N	th	107
1070749	Xã Vĩnh Lập	10707	0	\N	\N	\N	\N	\N	vl	107
1070900	Không xác định	10709	0	\N	\N	\N	\N	\N	kx	107
1070901	Thị trấn An Lưu	10709	0	\N	\N	\N	\N	\N	al	107
1070903	Xã Minh Hòa	10709	0	\N	\N	\N	\N	\N	mh	107
1070905	Xã Hiến Thành	10709	0	\N	\N	\N	\N	\N	ht	107
1070907	Xã Thái Thịnh	10709	0	\N	\N	\N	\N	\N	tt	107
1070909	Xã Long Xuyên	10709	0	\N	\N	\N	\N	\N	lx	107
1070911	Xã Hiệp An	10709	0	\N	\N	\N	\N	\N	ha	107
1070913	Xã An Phụ	10709	0	\N	\N	\N	\N	\N	ap	107
1070915	Xã Thượng Quận	10709	0	\N	\N	\N	\N	\N	tq	107
1070917	Xã Hiệp Hòa	10709	0	\N	\N	\N	\N	\N	hh	107
1070919	Xã Thăng Long	10709	0	\N	\N	\N	\N	\N	tl	107
1070921	Xã Lạc Long	10709	0	\N	\N	\N	\N	\N	ll	107
1070923	Xã Quang Trung	10709	0	\N	\N	\N	\N	\N	qt	107
1070925	Xã Phúc Thành B	10709	0	\N	\N	\N	\N	\N	ptb	107
1070927	Xã Lê Ninh	10709	0	\N	\N	\N	\N	\N	ln	107
1070929	Xã Bạch Đằng	10709	0	\N	\N	\N	\N	\N	bd	107
1070931	Xã Thất Hùng	10709	0	\N	\N	\N	\N	\N	th	107
1070933	Xã Thái Sơn	10709	0	\N	\N	\N	\N	\N	ts	107
1070935	Xã An Sinh	10709	0	\N	\N	\N	\N	\N	as	107
1070937	Xã Phạm Mệnh	10709	0	\N	\N	\N	\N	\N	pm	107
1070939	Xã Hiệp Sơn	10709	0	\N	\N	\N	\N	\N	hs	107
1070941	Xã Hoành Sơn	10709	0	\N	\N	\N	\N	\N	hs	107
1070943	Xã Duy Tân	10709	0	\N	\N	\N	\N	\N	dt	107
1070945	Xã Phú Thứ	10709	0	\N	\N	\N	\N	\N	pt	107
1070947	Xã Minh Tân	10709	0	\N	\N	\N	\N	\N	mt	107
1070949	Xã Tân Dân	10709	0	\N	\N	\N	\N	\N	td	107
1071100	Không xác định	10711	0	\N	\N	\N	\N	\N	kx	107
1071101	Thị trấn Phú Thái	10711	0	\N	\N	\N	\N	\N	pt	107
1071103	Xã Lai Vu	10711	0	\N	\N	\N	\N	\N	lv	107
1071105	Xã Cộng Hòa	10711	0	\N	\N	\N	\N	\N	ch	107
1071107	Xã Thượng Vũ	10711	0	\N	\N	\N	\N	\N	tv	107
1071109	Xã Cổ Dũng	10711	0	\N	\N	\N	\N	\N	cd	107
1071111	Xã Việt Hưng	10711	0	\N	\N	\N	\N	\N	vh	107
1071113	Xã Tuấn Hưng	10711	0	\N	\N	\N	\N	\N	th	107
1071115	Xã Kim Xuyên	10711	0	\N	\N	\N	\N	\N	kx	107
1071117	Xã Phúc Thành A	10711	0	\N	\N	\N	\N	\N	pta	107
1071119	Xã Kim Lương	10711	0	\N	\N	\N	\N	\N	kl	107
1071121	Xã Kim Khê	10711	0	\N	\N	\N	\N	\N	kk	107
1071123	Xã Kim Anh	10711	0	\N	\N	\N	\N	\N	ka	107
1071125	Xã Ngũ Phúc	10711	0	\N	\N	\N	\N	\N	np	107
1071127	Xã Kim Đính	10711	0	\N	\N	\N	\N	\N	kd	107
1071129	Xã Kim Tân	10711	0	\N	\N	\N	\N	\N	kt	107
1071131	Xã Bình Dân	10711	0	\N	\N	\N	\N	\N	bd	107
1071133	Xã Cẩm La	10711	0	\N	\N	\N	\N	\N	cl	107
1071135	Xã Liên Hòa	10711	0	\N	\N	\N	\N	\N	lh	107
1071137	Xã Đồng Gia	10711	0	\N	\N	\N	\N	\N	dg	107
1071139	Xã Đại Đức	10711	0	\N	\N	\N	\N	\N	dd	107
1071141	Xã Tam Kỳ	10711	0	\N	\N	\N	\N	\N	tk	107
1071300	Không xác định	10713	0	\N	\N	\N	\N	\N	kx	107
1071301	Thị trấn Gia Lộc	10713	0	\N	\N	\N	\N	\N	gl	107
1071303	Xã Thạch Khôi	10713	0	\N	\N	\N	\N	\N	tk	107
1071305	Xã Liên Hồng	10713	0	\N	\N	\N	\N	\N	lh	107
1071307	Xã Thống Nhất	10713	0	\N	\N	\N	\N	\N	tn	107
1071309	Xã Trùng Khánh	10713	0	\N	\N	\N	\N	\N	tk	107
1071311	Xã Yết Kiêu	10713	0	\N	\N	\N	\N	\N	yk	107
1071313	Xã Gia Hòa	10713	0	\N	\N	\N	\N	\N	gh	107
1071315	Xã Lê Lợi	10713	0	\N	\N	\N	\N	\N	ll	107
1071317	Xã Đoàn Thượng	10713	0	\N	\N	\N	\N	\N	dt	107
1071319	Xã Toàn Thắng	10713	0	\N	\N	\N	\N	\N	tt	107
1071321	Xã Hồng Hưng	10713	0	\N	\N	\N	\N	\N	hh	107
1071323	Xã Hoàng Diệu	10713	0	\N	\N	\N	\N	\N	hd	107
1071325	Xã Tân Tiến	10713	0	\N	\N	\N	\N	\N	tt	107
1071327	Xã Tân Hưng	10713	0	\N	\N	\N	\N	\N	th	107
1071329	Xã Gia Xuyên	10713	0	\N	\N	\N	\N	\N	gx	107
1071331	Xã Gia Tân	10713	0	\N	\N	\N	\N	\N	gt	107
1071333	Xã Gia Lương	10713	0	\N	\N	\N	\N	\N	gl	107
1071335	Xã Gia Khánh	10713	0	\N	\N	\N	\N	\N	gk	107
1071337	Xã Thống Kênh	10713	0	\N	\N	\N	\N	\N	tk	107
1071339	Xã Đồng Quang	10713	0	\N	\N	\N	\N	\N	dq	107
1071341	Xã Đức Xương	10713	0	\N	\N	\N	\N	\N	dx	107
1071343	Xã Quang Minh	10713	0	\N	\N	\N	\N	\N	qm	107
1071345	Xã Nhật Tân	10713	0	\N	\N	\N	\N	\N	nt	107
1071347	Xã Phạm Trấn	10713	0	\N	\N	\N	\N	\N	pt	107
1071349	Xã Phương Hưng	10713	0	\N	\N	\N	\N	\N	ph	107
1071500	Không xác định	10715	0	\N	\N	\N	\N	\N	kx	107
1071501	Thị trấn Tứ Kỳ	10715	0	\N	\N	\N	\N	\N	tk	107
1071503	Xã Ngọc Sơn	10715	0	\N	\N	\N	\N	\N	ns	107
1071505	Xã Kỳ Sơn	10715	0	\N	\N	\N	\N	\N	ks	107
1071507	Xã Đại Đồng	10715	0	\N	\N	\N	\N	\N	dd	107
1071509	Xã Hưng Đạo	10715	0	\N	\N	\N	\N	\N	hd	107
1071511	Xã Tái Sơn	10715	0	\N	\N	\N	\N	\N	ts	107
1071513	Xã Quang Phục	10715	0	\N	\N	\N	\N	\N	qp	107
1071515	Xã Bình Lăng	10715	0	\N	\N	\N	\N	\N	bl	107
1071517	Xã Ngọc Kỳ	10715	0	\N	\N	\N	\N	\N	nk	107
1071519	Xã Đông Kỳ	10715	0	\N	\N	\N	\N	\N	dk	107
1071521	Xã Tây Kỳ	10715	0	\N	\N	\N	\N	\N	tk	107
1071523	Xã Tứ Xuyên	10715	0	\N	\N	\N	\N	\N	tx	107
1071525	Xã Văn Tố	10715	0	\N	\N	\N	\N	\N	vt	107
1071527	Xã Phượng Kỳ	10715	0	\N	\N	\N	\N	\N	pk	107
1071529	Xã Cộng Lạc	10715	0	\N	\N	\N	\N	\N	cl	107
1071531	Xã An Thanh	10715	0	\N	\N	\N	\N	\N	at	107
1071533	Xã Tiên Động	10715	0	\N	\N	\N	\N	\N	td	107
1071535	Xã Quang Trung	10715	0	\N	\N	\N	\N	\N	qt	107
1071537	Xã Nguyên Giáp	10715	0	\N	\N	\N	\N	\N	ng	107
1071539	Xã Hà Thanh	10715	0	\N	\N	\N	\N	\N	ht	107
1071541	Xã Hà Kỳ	10715	0	\N	\N	\N	\N	\N	hk	107
1071543	Xã Tân Kỳ	10715	0	\N	\N	\N	\N	\N	tk	107
1071545	Xã Đại Hợp	10715	0	\N	\N	\N	\N	\N	dh	107
1071547	Xã Quảng Nghiệp	10715	0	\N	\N	\N	\N	\N	qn	107
1071549	Xã Dân Chủ	10715	0	\N	\N	\N	\N	\N	dc	107
1071551	Xã Minh Đức	10715	0	\N	\N	\N	\N	\N	md	107
1071553	Xã Quang Khải	10715	0	\N	\N	\N	\N	\N	qk	107
1071700	Không xác định	10717	0	\N	\N	\N	\N	\N	kx	107
1071701	Thị trấn Cẩm Giàng	10717	0	\N	\N	\N	\N	\N	cg	107
1071703	Xã Cẩm Hưng	10717	0	\N	\N	\N	\N	\N	ch	107
1071705	Xã Ngọc Liên	10717	0	\N	\N	\N	\N	\N	nl	107
1071707	Xã Kim Giang	10717	0	\N	\N	\N	\N	\N	kg	107
1071709	Xã Thạch Lỗi	10717	0	\N	\N	\N	\N	\N	tl	107
1071711	Xã Cẩm Sơn	10717	0	\N	\N	\N	\N	\N	cs	107
1071713	Xã Cẩm Định	10717	0	\N	\N	\N	\N	\N	cd	107
1071715	Xã Cẩm Hoàng	10717	0	\N	\N	\N	\N	\N	ch	107
1071717	Xã Cẩm Vũ	10717	0	\N	\N	\N	\N	\N	cv	107
1071719	Xã Cẩm Văn	10717	0	\N	\N	\N	\N	\N	cv	107
1071721	Xã Đức Chính	10717	0	\N	\N	\N	\N	\N	dc	107
1071723	Xã Cao An	10717	0	\N	\N	\N	\N	\N	ca	107
1071725	Thị trấn Lai Cách	10717	0	\N	\N	\N	\N	\N	lc	107
1071727	Xã Cẩm Đoài	10717	0	\N	\N	\N	\N	\N	cd	107
1071729	Xã Cẩm Đông	10717	0	\N	\N	\N	\N	\N	cd	107
1071731	Xã Tân Trường	10717	0	\N	\N	\N	\N	\N	tt	107
1071733	Xã Cẩm Phúc	10717	0	\N	\N	\N	\N	\N	cp	107
1071735	Xã Cẩm Điền	10717	0	\N	\N	\N	\N	\N	cd	107
1071737	Xã Lương Điền	10717	0	\N	\N	\N	\N	\N	ld	107
1071900	Không xác định	10719	0	\N	\N	\N	\N	\N	kx	107
1071901	Thị trấn Kẻ Sặt	10719	0	\N	\N	\N	\N	\N	ks	107
1071903	Xã Hưng Thịnh	10719	0	\N	\N	\N	\N	\N	ht	107
1071905	Xã Tráng Liệt	10719	0	\N	\N	\N	\N	\N	tl	107
1071907	Xã Vĩnh Tuy	10719	0	\N	\N	\N	\N	\N	vt	107
1071909	Xã Vĩnh Hồng	10719	0	\N	\N	\N	\N	\N	vh	107
1071911	Xã Hùng Thắng	10719	0	\N	\N	\N	\N	\N	ht	107
1071913	Xã Long Xuyên	10719	0	\N	\N	\N	\N	\N	lx	107
1071915	Xã Tân Việt	10719	0	\N	\N	\N	\N	\N	tv	107
1071917	Xã Hồng Khê	10719	0	\N	\N	\N	\N	\N	hk	107
1071919	Xã Cổ Bi	10719	0	\N	\N	\N	\N	\N	cb	107
1071921	Xã Nhân Quyền	10719	0	\N	\N	\N	\N	\N	nq	107
1071923	Xã Bình Xuyên	10719	0	\N	\N	\N	\N	\N	bx	107
1071925	Xã Thái Học	10719	0	\N	\N	\N	\N	\N	th	107
1071927	Xã Bình Minh	10719	0	\N	\N	\N	\N	\N	bm	107
1071929	Xã Tân Hồng	10719	0	\N	\N	\N	\N	\N	th	107
1071931	Xã Thái Hòa	10719	0	\N	\N	\N	\N	\N	th	107
1071933	Xã Thái Dương	10719	0	\N	\N	\N	\N	\N	td	107
1071935	Xã Thúc Kháng	10719	0	\N	\N	\N	\N	\N	tk	107
1072100	Không xác định	10721	0	\N	\N	\N	\N	\N	kx	107
1072101	Thị trấn Thanh Miện	10721	0	\N	\N	\N	\N	\N	tm	107
1072103	Xã Thanh Giang	10721	0	\N	\N	\N	\N	\N	tg	107
1072105	Xã Diên Hồng	10721	0	\N	\N	\N	\N	\N	dh	107
1072107	Xã Tiền Phong	10721	0	\N	\N	\N	\N	\N	tp	107
1072109	Xã Chi Lăng Nam	10721	0	\N	\N	\N	\N	\N	cln	107
1072111	Xã Chi Lăng Bắc	10721	0	\N	\N	\N	\N	\N	clb	107
1072113	Xã Ngũ Hùng	10721	0	\N	\N	\N	\N	\N	nh	107
1072115	Xã Tứ Cường	10721	0	\N	\N	\N	\N	\N	tc	107
1072117	Xã Cao Thắng	10721	0	\N	\N	\N	\N	\N	ct	107
1072119	Xã Phạm Kha	10721	0	\N	\N	\N	\N	\N	pk	107
1072121	Xã Hùng Sơn	10721	0	\N	\N	\N	\N	\N	hs	107
1072123	Xã Đoàn Tùng	10721	0	\N	\N	\N	\N	\N	dt	107
1072125	Xã Lam Sơn	10721	0	\N	\N	\N	\N	\N	ls	107
1072127	Xã Thanh Tùng	10721	0	\N	\N	\N	\N	\N	tt	107
1072129	Xã Lê Hồng	10721	0	\N	\N	\N	\N	\N	lh	107
1072131	Xã Đoàn Kết	10721	0	\N	\N	\N	\N	\N	dk	107
1072133	Xã Ngô Quyền	10721	0	\N	\N	\N	\N	\N	nq	107
1072135	Xã Tân Trào	10721	0	\N	\N	\N	\N	\N	tt	107
1072137	Xã Hồng Quang	10721	0	\N	\N	\N	\N	\N	hq	107
1072300	Không xác định	10723	0	\N	\N	\N	\N	\N	kx	107
1072301	Thị trấn Ninh Giang	10723	0	\N	\N	\N	\N	\N	ng	107
1072303	Xã Hiệp Lực	10723	0	\N	\N	\N	\N	\N	hl	107
1072305	Xã Hồng Dụ	10723	0	\N	\N	\N	\N	\N	hd	107
1072307	Xã Đồng Tâm	10723	0	\N	\N	\N	\N	\N	dt	107
1072309	Xã Vĩnh Hòa	10723	0	\N	\N	\N	\N	\N	vh	107
1072311	Xã Ninh Thành	10723	0	\N	\N	\N	\N	\N	nt	107
1072313	Xã Tân Hương	10723	0	\N	\N	\N	\N	\N	th	107
1072315	Xã Nghĩa An	10723	0	\N	\N	\N	\N	\N	na	107
1072317	Xã Quyết Thắng	10723	0	\N	\N	\N	\N	\N	qt	107
1072319	Xã ứng Hoè	10723	0	\N	\N	\N	\N	\N	uh	107
1072321	Xã Ninh Hòa	10723	0	\N	\N	\N	\N	\N	nh	107
1072323	Xã Vạn Phúc	10723	0	\N	\N	\N	\N	\N	vp	107
1072325	Xã Hồng Đức	10723	0	\N	\N	\N	\N	\N	hd	107
1072327	Xã An Đức	10723	0	\N	\N	\N	\N	\N	ad	107
1072329	Xã Đông Xuyên	10723	0	\N	\N	\N	\N	\N	dx	107
1072331	Xã Ninh Hải	10723	0	\N	\N	\N	\N	\N	nh	107
1072333	Xã Ninh Thọ	10723	0	\N	\N	\N	\N	\N	nt	107
1072335	Xã Kiến Quốc	10723	0	\N	\N	\N	\N	\N	kq	107
1072337	Xã Tân Phong	10723	0	\N	\N	\N	\N	\N	tp	107
1072339	Xã Hồng Phúc	10723	0	\N	\N	\N	\N	\N	hp	107
1072341	Xã Hưng Long	10723	0	\N	\N	\N	\N	\N	hl	107
1072343	Xã Hưng Thái	10723	0	\N	\N	\N	\N	\N	ht	107
1072345	Xã Văn Hội	10723	0	\N	\N	\N	\N	\N	vh	107
1072347	Xã Tân Quang	10723	0	\N	\N	\N	\N	\N	tq	107
1072349	Xã Quang Hưng	10723	0	\N	\N	\N	\N	\N	qh	107
1072351	Xã Hoàng Hanh	10723	0	\N	\N	\N	\N	\N	hh	107
1072353	Xã Hồng Thái	10723	0	\N	\N	\N	\N	\N	ht	107
1072355	Xã Văn Giang	10723	0	\N	\N	\N	\N	\N	vg	107
1090000	Không xác định	10900	0	\N	\N	\N	\N	\N	kx	109
1090100	Không xác định	10901	0	\N	\N	\N	\N	\N	kx	109
1090101	Phường Lam Sơn	10901	0	\N	\N	\N	\N	\N	ls	109
1090103	Phường Hiến Nam	10901	0	\N	\N	\N	\N	\N	hn	109
1090105	Phường Lê Lợi	10901	0	\N	\N	\N	\N	\N	ll	109
1090107	Phường Minh Khai	10901	0	\N	\N	\N	\N	\N	mk	109
1090109	Phường Quang Trung	10901	0	\N	\N	\N	\N	\N	qt	109
1090111	Phường Hồng Châu	10901	0	\N	\N	\N	\N	\N	hc	109
1090201	Thị trấn Như Quỳnh	10902	0	\N	\N	\N	\N	\N	nq	109
1090203	Xã Lạc Đạo	10902	0	\N	\N	\N	\N	\N	ld	109
1090205	Xã Chỉ Đạo	10902	0	\N	\N	\N	\N	\N	cd	109
1090207	Xã Đại Đồng	10902	0	\N	\N	\N	\N	\N	dd	109
1090209	Xã Việt Hưng	10902	0	\N	\N	\N	\N	\N	vh	109
1090211	Xã Tân Quang	10902	0	\N	\N	\N	\N	\N	tq	109
1090213	Xã Đình Dù	10902	0	\N	\N	\N	\N	\N	dd	109
1090215	Xã Minh Hải	10902	0	\N	\N	\N	\N	\N	mh	109
1090217	Xã Lương Tài	10902	0	\N	\N	\N	\N	\N	lt	109
1090219	Xã Trưng Trắc	10902	0	\N	\N	\N	\N	\N	tt	109
1090221	Xã Lạc Hồng	10902	0	\N	\N	\N	\N	\N	lh	109
1090300	Không xác định	10903	0	\N	\N	\N	\N	\N	kx	109
1090301	Thị trấn Bần Yên Nhân	10903	0	\N	\N	\N	\N	\N	byn	109
1090321	Xã Phan Đình Phùng	10903	0	\N	\N	\N	\N	\N	pdp	109
1090329	Xã Cẩm Xá	10903	0	\N	\N	\N	\N	\N	cx	109
1090331	Xã Dương Quang	10903	0	\N	\N	\N	\N	\N	dq	109
1090333	Xã Hòa Phong	10903	0	\N	\N	\N	\N	\N	hp	109
1090337	Xã Nhân Hòa	10903	0	\N	\N	\N	\N	\N	nh	109
1090345	Xã Dị Sử	10903	0	\N	\N	\N	\N	\N	ds	109
1090347	Xã Bạch Sam	10903	0	\N	\N	\N	\N	\N	bs	109
1090349	Xã Minh Đức	10903	0	\N	\N	\N	\N	\N	md	109
1090357	Xã Phùng Chí Kiên	10903	0	\N	\N	\N	\N	\N	pck	109
1090359	Xã Xuân Dục	10903	0	\N	\N	\N	\N	\N	xd	109
1090361	Xã Ngọc Lâm	10903	0	\N	\N	\N	\N	\N	nl	109
1090367	Xã Hưng Long	10903	0	\N	\N	\N	\N	\N	hl	109
1090401	Thị trấn Yên Mỹ	10904	0	\N	\N	\N	\N	\N	ym	109
1090403	Xã Giai Phạm	10904	0	\N	\N	\N	\N	\N	gp	109
1090405	Xã Nghĩa Hiệp	10904	0	\N	\N	\N	\N	\N	nh	109
1090407	Xã Đồng Than	10904	0	\N	\N	\N	\N	\N	dt	109
1090409	Xã Ngọc Long	10904	0	\N	\N	\N	\N	\N	nl	109
1090411	Xã Liêu Xá	10904	0	\N	\N	\N	\N	\N	lx	109
1090413	Xã Hoàn Long	10904	0	\N	\N	\N	\N	\N	hl	109
1090415	Xã Tân Lập	10904	0	\N	\N	\N	\N	\N	tl	109
1090417	Xã Thanh Long	10904	0	\N	\N	\N	\N	\N	tl	109
1090419	Xã Yên Phú	10904	0	\N	\N	\N	\N	\N	yp	109
1090421	Xã Việt Cường	10904	0	\N	\N	\N	\N	\N	vc	109
1090423	Xã Trung Hòa	10904	0	\N	\N	\N	\N	\N	th	109
1090425	Xã Yên Hòa	10904	0	\N	\N	\N	\N	\N	yh	109
1090427	Xã Minh Châu	10904	0	\N	\N	\N	\N	\N	mc	109
1090429	Xã Trung Hưng	10904	0	\N	\N	\N	\N	\N	th	109
1090431	Xã Lý Thường Kiệt	10904	0	\N	\N	\N	\N	\N	ltk	109
1090433	Xã Tân Việt	10904	0	\N	\N	\N	\N	\N	tv	109
1090500	Không xác định	10905	0	\N	\N	\N	\N	\N	kx	109
1090501	Thị trấn Văn Giang	10905	0	\N	\N	\N	\N	\N	vg	109
1090503	Xã Xuân Quan	10905	0	\N	\N	\N	\N	\N	xq	109
1090505	Xã Cửu Cao	10905	0	\N	\N	\N	\N	\N	cc	109
1090507	Xã Phụng Công	10905	0	\N	\N	\N	\N	\N	pc	109
1090509	Xã Long Hưng	10905	0	\N	\N	\N	\N	\N	lh	109
1090511	Xã Vĩnh Khúc	10905	0	\N	\N	\N	\N	\N	vk	109
1090513	Xã Liên Nghĩa	10905	0	\N	\N	\N	\N	\N	ln	109
1090515	Xã Tân Tiến	10905	0	\N	\N	\N	\N	\N	tt	109
1090517	Xã Thắng Lợi	10905	0	\N	\N	\N	\N	\N	tl	109
1090519	Xã Mễ Sở	10905	0	\N	\N	\N	\N	\N	ms	109
1090521	Xã Nghĩa Trụ	10905	0	\N	\N	\N	\N	\N	nt	109
1090601	Thị trấn Khoái Châu	10906	0	\N	\N	\N	\N	\N	kc	109
1090603	Xã Đông Tảo	10906	0	\N	\N	\N	\N	\N	dt	109
1090605	Xã Bình Minh	10906	0	\N	\N	\N	\N	\N	bm	109
1090607	Xã Dạ Trạch	10906	0	\N	\N	\N	\N	\N	dt	109
1090609	Xã Hàm Tử	10906	0	\N	\N	\N	\N	\N	ht	109
1090611	Xã Ông Đình	10906	0	\N	\N	\N	\N	\N	od	109
1090613	Xã Tân Dân	10906	0	\N	\N	\N	\N	\N	td	109
1090615	Xã Tứ Dân	10906	0	\N	\N	\N	\N	\N	td	109
1090619	Xã Đông Kết	10906	0	\N	\N	\N	\N	\N	dk	109
1090621	Xã Bình Kiều	10906	0	\N	\N	\N	\N	\N	bk	109
1090623	Xã Dân Tiến	10906	0	\N	\N	\N	\N	\N	dt	109
1090625	Xã Đồng Tiến	10906	0	\N	\N	\N	\N	\N	dt	109
1090627	Xã Hồng Tiến	10906	0	\N	\N	\N	\N	\N	ht	109
1090629	Xã Tân Châu	10906	0	\N	\N	\N	\N	\N	tc	109
1090631	Xã Liên Khê	10906	0	\N	\N	\N	\N	\N	lk	109
1090633	Xã Phùng Hưng	10906	0	\N	\N	\N	\N	\N	ph	109
1090635	Xã Việt Hòa	10906	0	\N	\N	\N	\N	\N	vh	109
1090637	Xã Đông Ninh	10906	0	\N	\N	\N	\N	\N	dn	109
1090639	Xã Đại Tập	10906	0	\N	\N	\N	\N	\N	dt	109
1090641	Xã Chí Tân	10906	0	\N	\N	\N	\N	\N	ct	109
1090643	Xã Đại Hưng	10906	0	\N	\N	\N	\N	\N	dh	109
1090645	Xã Thuần Hưng	10906	0	\N	\N	\N	\N	\N	th	109
1090647	Xã Thành Công	10906	0	\N	\N	\N	\N	\N	tc	109
1090649	Xã Nhuế Dương	10906	0	\N	\N	\N	\N	\N	nd	109
1090700	Không xác định	10907	0	\N	\N	\N	\N	\N	kx	109
1090701	Thị trấn Ân Thi	10907	0	\N	\N	\N	\N	\N	at	109
1090703	Xã Phù ủng	10907	0	\N	\N	\N	\N	\N	pu	109
1090705	Xã Bắc Sơn	10907	0	\N	\N	\N	\N	\N	bs	109
1090707	Xã Bãi Sậy	10907	0	\N	\N	\N	\N	\N	bs	109
1090709	Xã Đào Dương	10907	0	\N	\N	\N	\N	\N	dd	109
1090711	Xã Tân Phúc	10907	0	\N	\N	\N	\N	\N	tp	109
1090713	Xã Vân Du	10907	0	\N	\N	\N	\N	\N	vd	109
1090715	Xã Quang Vinh	10907	0	\N	\N	\N	\N	\N	qv	109
1090717	Xã Xuân Trúc	10907	0	\N	\N	\N	\N	\N	xt	109
1090719	Xã Hoàng Hoa Thám	10907	0	\N	\N	\N	\N	\N	hht	109
1090721	Xã Quảng Lãng	10907	0	\N	\N	\N	\N	\N	ql	109
1090723	Xã Văn Nhuệ	10907	0	\N	\N	\N	\N	\N	vn	109
1090725	Xã Đặng Lễ	10907	0	\N	\N	\N	\N	\N	dl	109
1090727	Xã Cẩm Ninh	10907	0	\N	\N	\N	\N	\N	cn	109
1090729	Xã Nguyễn Trãi	10907	0	\N	\N	\N	\N	\N	nt	109
1090731	Xã Đa Lộc	10907	0	\N	\N	\N	\N	\N	dl	109
1090733	Xã Hồ Tùng Mậu	10907	0	\N	\N	\N	\N	\N	htm	109
1090735	Xã Tiền Phong	10907	0	\N	\N	\N	\N	\N	tp	109
1090737	Xã Hồng Vân	10907	0	\N	\N	\N	\N	\N	hv	109
1090739	Xã Hồng Quang	10907	0	\N	\N	\N	\N	\N	hq	109
1090741	Xã Hạ Lễ	10907	0	\N	\N	\N	\N	\N	hl	109
1090900	Không xác định	10909	0	\N	\N	\N	\N	\N	kx	109
1090901	Xã Nghĩa Dân	10909	0	\N	\N	\N	\N	\N	nd	109
1090903	Xã Toàn Thắng	10909	0	\N	\N	\N	\N	\N	tt	109
1090905	Xã Vĩnh Xá	10909	0	\N	\N	\N	\N	\N	vx	109
1090907	Xã Ngũ Lão	10909	0	\N	\N	\N	\N	\N	nl	109
1090909	Xã Thọ Vinh	10909	0	\N	\N	\N	\N	\N	tv	109
1090911	Xã Đồng Thanh	10909	0	\N	\N	\N	\N	\N	dt	109
1090913	Xã Song Mai	10909	0	\N	\N	\N	\N	\N	sm	109
1090915	Xã Chính Nghĩa	10909	0	\N	\N	\N	\N	\N	cn	109
1090917	Xã Nhân La	10909	0	\N	\N	\N	\N	\N	nl	109
1090919	Xã Phú Thịnh	10909	0	\N	\N	\N	\N	\N	pt	109
1090921	Xã Mai Động	10909	0	\N	\N	\N	\N	\N	md	109
1090923	Xã Đức Hợp	10909	0	\N	\N	\N	\N	\N	dh	109
1090925	Xã Hùng An	10909	0	\N	\N	\N	\N	\N	ha	109
1090927	Xã Ngọc Thanh	10909	0	\N	\N	\N	\N	\N	nt	109
1090929	Xã Lương Bằng	10909	0	\N	\N	\N	\N	\N	lb	109
1090931	Xã Vũ Xá	10909	0	\N	\N	\N	\N	\N	vx	109
1090933	Xã Hiệp Cường	10909	0	\N	\N	\N	\N	\N	hc	109
1090935	Xã Phú Cường	10909	0	\N	\N	\N	\N	\N	pc	109
1090937	Xã Hùng Cường	10909	0	\N	\N	\N	\N	\N	hc	109
1090939	Xã Bảo Khê	10909	0	\N	\N	\N	\N	\N	bk	109
1091100	Không xác định	10911	0	\N	\N	\N	\N	\N	kx	109
1091101	Xã Minh Tân	10911	0	\N	\N	\N	\N	\N	mt	109
1091103	Xã Phan Sào Nam	10911	0	\N	\N	\N	\N	\N	psn	109
1091105	Xã Trần Cao	10911	0	\N	\N	\N	\N	\N	tc	109
1091107	Xã Quang Hưng	10911	0	\N	\N	\N	\N	\N	qh	109
1091109	Xã Minh Hoàng	10911	0	\N	\N	\N	\N	\N	mh	109
1091111	Xã Đoàn Đào	10911	0	\N	\N	\N	\N	\N	dd	109
1091113	Xã Tống Phan	10911	0	\N	\N	\N	\N	\N	tp	109
1091115	Xã Đình Cao	10911	0	\N	\N	\N	\N	\N	dc	109
1091117	Xã Nhật Quang	10911	0	\N	\N	\N	\N	\N	nq	109
1091119	Xã Tiền Tiến	10911	0	\N	\N	\N	\N	\N	tt	109
1091121	Xã Tam Đa	10911	0	\N	\N	\N	\N	\N	td	109
1091123	Xã Minh Tiến	10911	0	\N	\N	\N	\N	\N	mt	109
1091125	Xã Nguyên Hòa	10911	0	\N	\N	\N	\N	\N	nh	109
1091300	Không xác định	10913	0	\N	\N	\N	\N	\N	kx	109
1091301	Thị trấn Vương	10913	0	\N	\N	\N	\N	\N	v	109
1091303	Xã Hưng Đạo	10913	0	\N	\N	\N	\N	\N	hd	109
1091305	Xã Ngô Quyền	10913	0	\N	\N	\N	\N	\N	nq	109
1091307	Xã Nhật Tân	10913	0	\N	\N	\N	\N	\N	nt	109
1091309	Xã Dị Chế	10913	0	\N	\N	\N	\N	\N	dc	109
1091311	Xã Lệ Xá	10913	0	\N	\N	\N	\N	\N	lx	109
1091313	Xã Trung Nghĩa	10913	0	\N	\N	\N	\N	\N	tn	109
1091315	Xã An Viên	10913	0	\N	\N	\N	\N	\N	av	109
1091317	Xã Đức Thắng	10913	0	\N	\N	\N	\N	\N	dt	109
1091319	Xã Trung Dũng	10913	0	\N	\N	\N	\N	\N	td	109
1091321	Xã Hải Triều	10913	0	\N	\N	\N	\N	\N	ht	109
1091323	Xã Liên Phương	10913	0	\N	\N	\N	\N	\N	lp	109
1091325	Xã Thủ Sỹ	10913	0	\N	\N	\N	\N	\N	ts	109
1091327	Xã Thiện Phiến	10913	0	\N	\N	\N	\N	\N	tp	109
1091329	Xã Thụy Lôi	10913	0	\N	\N	\N	\N	\N	tl	109
1091331	Xã Cương Chính	10913	0	\N	\N	\N	\N	\N	cc	109
1091333	Xã Minh Phương	10913	0	\N	\N	\N	\N	\N	mp	109
1091335	Xã Phương Chiểu	10913	0	\N	\N	\N	\N	\N	pc	109
1091337	Xã Quảng Châu	10913	0	\N	\N	\N	\N	\N	qc	109
1091339	Xã Hồng Nam	10913	0	\N	\N	\N	\N	\N	hn	109
1091341	Xã Tân Hưng	10913	0	\N	\N	\N	\N	\N	th	109
1091343	Xã Hoàng Hanh	10913	0	\N	\N	\N	\N	\N	hh	109
1110000	Không xác định	11100	0	\N	\N	\N	\N	\N	kx	111
1110100	Không xác định	11101	0	\N	\N	\N	\N	\N	kx	111
1111117	Xã An Mỹ	11111	0	\N	\N	\N	\N	\N	am	111
1110101	Phường Trần Hưng Đạo	11101	0	\N	\N	\N	\N	\N	thd	111
1110103	Phường Minh Khai	11101	0	\N	\N	\N	\N	\N	mk	111
1110105	Phường Hai Bà Trưng	11101	0	\N	\N	\N	\N	\N	hbt	111
1110107	Phường Lương Khánh Thiện	11101	0	\N	\N	\N	\N	\N	lkt	111
1110109	Xã Thanh Châu	11101	0	\N	\N	\N	\N	\N	tc	111
1110111	Xã Liêm Chính	11101	0	\N	\N	\N	\N	\N	lc	111
1110300	Không xác định	11103	0	\N	\N	\N	\N	\N	kx	111
1110301	Thị trấn Hòa Mạc	11103	0	\N	\N	\N	\N	\N	hm	111
1110303	Thị trấn Đồng Văn	11103	0	\N	\N	\N	\N	\N	dv	111
1110305	Xã Duy Minh	11103	0	\N	\N	\N	\N	\N	dm	111
1110307	Xã Duy Hải	11103	0	\N	\N	\N	\N	\N	dh	111
1110309	Xã Bạch Thượng	11103	0	\N	\N	\N	\N	\N	bt	111
1110311	Xã Mộc Bắc	11103	0	\N	\N	\N	\N	\N	mb	111
1110313	Xã Mộc Nam	11103	0	\N	\N	\N	\N	\N	mn	111
1110315	Xã Châu Giang	11103	0	\N	\N	\N	\N	\N	cg	111
1110317	Xã Chuyên Ngoại	11103	0	\N	\N	\N	\N	\N	cn	111
1110319	Xã Trác Văn	11103	0	\N	\N	\N	\N	\N	tv	111
1110321	Xã Yên Bắc	11103	0	\N	\N	\N	\N	\N	yb	111
1110323	Xã Yên Nam	11103	0	\N	\N	\N	\N	\N	yn	111
1110325	Xã Hoàng Đông	11103	0	\N	\N	\N	\N	\N	hd	111
1110327	Xã Tiên Nội	11103	0	\N	\N	\N	\N	\N	tn	111
1110329	Xã Tiên Ngoại	11103	0	\N	\N	\N	\N	\N	tn	111
1110331	Xã Tiên Tân	11103	0	\N	\N	\N	\N	\N	tt	111
1110333	Xã Tiên Hiệp	11103	0	\N	\N	\N	\N	\N	th	111
1110335	Xã Đọi Sơn	11103	0	\N	\N	\N	\N	\N	ds	111
1110337	Xã Tiền Phong	11103	0	\N	\N	\N	\N	\N	tp	111
1110339	Xã Châu Sơn	11103	0	\N	\N	\N	\N	\N	cs	111
1110341	Xã Tiên Hải	11103	0	\N	\N	\N	\N	\N	th	111
1110343	Xã Lam Hạ	11103	0	\N	\N	\N	\N	\N	lh	111
1110500	Không xác định	11105	0	\N	\N	\N	\N	\N	kx	111
1110501	Thị trấn Quế	11105	0	\N	\N	\N	\N	\N	q	111
1110503	Xã Nguyễn úy	11105	0	\N	\N	\N	\N	\N	nú	111
1110505	Xã Tượng Lĩnh	11105	0	\N	\N	\N	\N	\N	tl	111
1110507	Xã Lê Hồ	11105	0	\N	\N	\N	\N	\N	lh	111
1110509	Xã Đại Cương	11105	0	\N	\N	\N	\N	\N	dc	111
1110511	Xã Nhật Tựu	11105	0	\N	\N	\N	\N	\N	nt	111
1110513	Xã Hoàng Tây	11105	0	\N	\N	\N	\N	\N	ht	111
1110515	Xã Văn Xá	11105	0	\N	\N	\N	\N	\N	vx	111
1110517	Xã Kim Bình	11105	0	\N	\N	\N	\N	\N	kb	111
1110519	Xã Phù Vân	11105	0	\N	\N	\N	\N	\N	pv	111
1110521	Xã Thanh Sơn	11105	0	\N	\N	\N	\N	\N	ts	111
1110523	Xã Ngọc Sơn	11105	0	\N	\N	\N	\N	\N	ns	111
1110525	Xã Ba Sao	11105	0	\N	\N	\N	\N	\N	bs	111
1110527	Xã Khả Phong	11105	0	\N	\N	\N	\N	\N	kp	111
1110529	Xã Tân Sơn	11105	0	\N	\N	\N	\N	\N	ts	111
1110531	Xã Châu Sơn	11105	0	\N	\N	\N	\N	\N	cs	111
1110533	Xã Liên Sơn	11105	0	\N	\N	\N	\N	\N	ls	111
1110535	Xã Thụy Lôi	11105	0	\N	\N	\N	\N	\N	tl	111
1110537	Xã Thi Sơn	11105	0	\N	\N	\N	\N	\N	ts	111
1110539	Xã Nhật Tân	11105	0	\N	\N	\N	\N	\N	nt	111
1110541	Xã Đồng Hóa	11105	0	\N	\N	\N	\N	\N	dh	111
1110700	Không xác định	11107	0	\N	\N	\N	\N	\N	kx	111
1110701	Thị trấn Vĩnh Trụ	11107	0	\N	\N	\N	\N	\N	vt	111
1110703	Xã Hợp Lý	11107	0	\N	\N	\N	\N	\N	hl	111
1110705	Xã Văn Lý	11107	0	\N	\N	\N	\N	\N	vl	111
1110707	Xã Chính Lý	11107	0	\N	\N	\N	\N	\N	cl	111
1110709	Xã Nguyên Lý	11107	0	\N	\N	\N	\N	\N	nl	111
1110711	Xã Công Lý	11107	0	\N	\N	\N	\N	\N	cl	111
1110713	Xã Đức Lý	11107	0	\N	\N	\N	\N	\N	dl	111
1110715	Xã Đạo Lý	11107	0	\N	\N	\N	\N	\N	dl	111
1110717	Xã Chân Lý	11107	0	\N	\N	\N	\N	\N	cl	111
1110719	Xã Bắc Lý	11107	0	\N	\N	\N	\N	\N	bl	111
1110721	Xã Nhân Đạo	11107	0	\N	\N	\N	\N	\N	nd	111
1110723	Xã Đồng Lý	11107	0	\N	\N	\N	\N	\N	dl	111
1110725	Xã Nhân Hưng	11107	0	\N	\N	\N	\N	\N	nh	111
1110727	Xã Nhân Thịnh	11107	0	\N	\N	\N	\N	\N	nt	111
1110729	Xã Nhân Khang	11107	0	\N	\N	\N	\N	\N	nk	111
1110731	Xã Nhân Chính	11107	0	\N	\N	\N	\N	\N	nc	111
1110733	Xã Nhân Nghĩa	11107	0	\N	\N	\N	\N	\N	nn	111
1110735	Xã Nhân Bình	11107	0	\N	\N	\N	\N	\N	nb	111
1110737	Xã Xuân Khê	11107	0	\N	\N	\N	\N	\N	xk	111
1110739	Xã Nhân Mỹ	11107	0	\N	\N	\N	\N	\N	nm	111
1110741	Xã Phú Phúc	11107	0	\N	\N	\N	\N	\N	pp	111
1110743	Xã Tiến Thắng	11107	0	\N	\N	\N	\N	\N	tt	111
1110745	Xã Hòa Hậu	11107	0	\N	\N	\N	\N	\N	hh	111
1110900	Không xác định	11109	0	\N	\N	\N	\N	\N	kx	111
1110901	Thị trấn Kiện Khê	11109	0	\N	\N	\N	\N	\N	kk	111
1110903	Xã Liêm Chung	11109	0	\N	\N	\N	\N	\N	lc	111
1110905	Xã Liêm Tuyền	11109	0	\N	\N	\N	\N	\N	lt	111
1110907	Xã Liêm Cần	11109	0	\N	\N	\N	\N	\N	lc	111
1110909	Xã Liêm Tiết	11109	0	\N	\N	\N	\N	\N	lt	111
1110911	Xã Liêm Phong	11109	0	\N	\N	\N	\N	\N	lp	111
1110913	Xã Thanh Hà	11109	0	\N	\N	\N	\N	\N	th	111
1110915	Xã Thanh Bình	11109	0	\N	\N	\N	\N	\N	tb	111
1110917	Xã Thanh Tuyền	11109	0	\N	\N	\N	\N	\N	tt	111
1110919	Xã Thanh Thủy	11109	0	\N	\N	\N	\N	\N	tt	111
1110921	Xã Thanh Tân	11109	0	\N	\N	\N	\N	\N	tt	111
1110923	Xã Thanh Nghị	11109	0	\N	\N	\N	\N	\N	tn	111
1110925	Xã Thanh Hải	11109	0	\N	\N	\N	\N	\N	th	111
1110927	Xã Thanh Hương	11109	0	\N	\N	\N	\N	\N	th	111
1110929	Xã Thanh Tâm	11109	0	\N	\N	\N	\N	\N	tt	111
1110931	Xã Thanh Nguyên	11109	0	\N	\N	\N	\N	\N	tn	111
1110933	Xã Thanh Phong	11109	0	\N	\N	\N	\N	\N	tp	111
1110935	Xã Thanh Lưu	11109	0	\N	\N	\N	\N	\N	tl	111
1110937	Xã Liêm Thuận	11109	0	\N	\N	\N	\N	\N	lt	111
1110939	Xã Liêm Túc	11109	0	\N	\N	\N	\N	\N	lt	111
1110941	Xã Liêm Sơn	11109	0	\N	\N	\N	\N	\N	ls	111
1111100	Không xác định	11111	0	\N	\N	\N	\N	\N	kx	111
1111101	Thị trấn Bình Mỹ	11111	0	\N	\N	\N	\N	\N	bm	111
1111103	Xã Bình Nghĩa	11111	0	\N	\N	\N	\N	\N	bn	111
1111105	Xã Đinh Xá	11111	0	\N	\N	\N	\N	\N	dx	111
1111107	Xã Tràng An	11111	0	\N	\N	\N	\N	\N	ta	111
1111109	Xã Đồng Du	11111	0	\N	\N	\N	\N	\N	dd	111
1111111	Xã Trịnh Xá	11111	0	\N	\N	\N	\N	\N	tx	111
1111113	Xã Đồn Xá	11111	0	\N	\N	\N	\N	\N	dx	111
1111115	Xã Mỹ Thọ	11111	0	\N	\N	\N	\N	\N	mt	111
1111119	Xã La Sơn	11111	0	\N	\N	\N	\N	\N	ls	111
1111121	Xã An Đổ	11111	0	\N	\N	\N	\N	\N	ad	111
1111123	Xã Tiêu Động	11111	0	\N	\N	\N	\N	\N	td	111
1111125	Xã Trung Lương	11111	0	\N	\N	\N	\N	\N	tl	111
1111127	Xã Bối Cầu	11111	0	\N	\N	\N	\N	\N	bc	111
1111129	Xã An Nội	11111	0	\N	\N	\N	\N	\N	an	111
1111131	Xã Bồ Đề	11111	0	\N	\N	\N	\N	\N	bd	111
1111133	Xã An Ninh	11111	0	\N	\N	\N	\N	\N	an	111
1111135	Xã Hưng Công	11111	0	\N	\N	\N	\N	\N	hc	111
1111137	Xã Ngọc Lũ	11111	0	\N	\N	\N	\N	\N	nl	111
1111139	Xã Vụ Bản	11111	0	\N	\N	\N	\N	\N	vb	111
1111141	Xã An Lão	11111	0	\N	\N	\N	\N	\N	al	111
1130000	Không xác định	11300	0	\N	\N	\N	\N	\N	kx	113
1130100	Không xác định	11301	0	\N	\N	\N	\N	\N	kx	113
1130101	Phường Trần Tế Xương	11301	0	\N	\N	\N	\N	\N	ttx	113
1130103	Phường Hạ Long	11301	0	\N	\N	\N	\N	\N	hl	113
1130105	Phường Vị Xuyên	11301	0	\N	\N	\N	\N	\N	vx	113
1130107	Phường Vị Hoàng	11301	0	\N	\N	\N	\N	\N	vh	113
1130109	Phường Nguyễn Du	11301	0	\N	\N	\N	\N	\N	nd	113
1130111	Phường Bà Triệu	11301	0	\N	\N	\N	\N	\N	bt	113
1130113	Phường Cửa Bắc	11301	0	\N	\N	\N	\N	\N	cb	113
1130115	Phường Trần Hưng Đạo	11301	0	\N	\N	\N	\N	\N	thd	113
1130117	Phường Phan Đình Phùng	11301	0	\N	\N	\N	\N	\N	pdp	113
1130119	Phường Ngô Quyền	11301	0	\N	\N	\N	\N	\N	nq	113
1130121	Phường Năng Tĩnh	11301	0	\N	\N	\N	\N	\N	nt	113
1130123	Phường Trần Đăng Ninh	11301	0	\N	\N	\N	\N	\N	tdn	113
1130125	Phường Trường Thi	11301	0	\N	\N	\N	\N	\N	tt	113
1130127	Phường Văn Miếu	11301	0	\N	\N	\N	\N	\N	vm	113
1130129	Phường Quang Trung	11301	0	\N	\N	\N	\N	\N	qt	113
1130131	Xã Mỹ Xá	11301	0	\N	\N	\N	\N	\N	mx	113
1130135	Xã Lộc Vượng	11301	0	\N	\N	\N	\N	\N	lv	113
1130137	Xã Lộc An	11301	0	\N	\N	\N	\N	\N	la	113
1130139	Xã Lộc Hoà	11301	0	\N	\N	\N	\N	\N	lh	113
1130141	Xã Nam Phong	11301	0	\N	\N	\N	\N	\N	np	113
1130143	Xã Nam Vân	11301	0	\N	\N	\N	\N	\N	nv	113
1130300	Không xác định	11303	0	\N	\N	\N	\N	\N	kx	113
1130301	Thị trấn Gôi	11303	0	\N	\N	\N	\N	\N	g	113
1130303	Xã Đại Thắng	11303	0	\N	\N	\N	\N	\N	dt	113
1130305	Xã Hợp Hưng	11303	0	\N	\N	\N	\N	\N	hh	113
1130307	Xã Trung Thành	11303	0	\N	\N	\N	\N	\N	tt	113
1130309	Xã Vĩnh Hào	11303	0	\N	\N	\N	\N	\N	vh	113
1130311	Xã Minh Tân	11303	0	\N	\N	\N	\N	\N	mt	113
1130313	Xã Cộng Hòa	11303	0	\N	\N	\N	\N	\N	ch	113
1130315	Xã Quang Trung	11303	0	\N	\N	\N	\N	\N	qt	113
1130317	Xã Đại An	11303	0	\N	\N	\N	\N	\N	da	113
1130319	Xã Tân Khánh	11303	0	\N	\N	\N	\N	\N	tk	113
1130321	Xã Hiển Khánh	11303	0	\N	\N	\N	\N	\N	hk	113
1130323	Xã Liên Bảo	11303	0	\N	\N	\N	\N	\N	lb	113
1130325	Xã Liên Minh	11303	0	\N	\N	\N	\N	\N	lm	113
1130327	Xã Minh Thuận	11303	0	\N	\N	\N	\N	\N	mt	113
1130329	Xã Kim Thái	11303	0	\N	\N	\N	\N	\N	kt	113
1130331	Xã Tam Thanh	11303	0	\N	\N	\N	\N	\N	tt	113
1130333	Xã Thành Lợi	11303	0	\N	\N	\N	\N	\N	tl	113
1130335	Xã Tân Thành	11303	0	\N	\N	\N	\N	\N	tt	113
1130500	Không xác định	11305	0	\N	\N	\N	\N	\N	kx	113
1130501	Xã Mỹ Trung	11305	0	\N	\N	\N	\N	\N	mt	113
1130503	Xã Mỹ Phúc	11305	0	\N	\N	\N	\N	\N	mp	113
1130505	Xã Mỹ Hưng	11305	0	\N	\N	\N	\N	\N	mh	113
1130507	Xã Mỹ Hà	11305	0	\N	\N	\N	\N	\N	mh	113
1130509	Xã Mỹ Thắng	11305	0	\N	\N	\N	\N	\N	mt	113
1130511	Xã Mỹ Thịnh	11305	0	\N	\N	\N	\N	\N	mt	113
1130513	Xã Mỹ Tiến	11305	0	\N	\N	\N	\N	\N	mt	113
1130515	Xã Mỹ Thuận	11305	0	\N	\N	\N	\N	\N	mt	113
1130517	Xã Mỹ Thành	11305	0	\N	\N	\N	\N	\N	mt	113
1130519	Xã Mỹ Tân	11305	0	\N	\N	\N	\N	\N	mt	113
1130700	Không xác định	11307	0	\N	\N	\N	\N	\N	kx	113
1130701	Thị trấn Lâm	11307	0	\N	\N	\N	\N	\N	l	113
1130703	Xã Yên Trung	11307	0	\N	\N	\N	\N	\N	yt	113
1130705	Xã Yên Thành	11307	0	\N	\N	\N	\N	\N	yt	113
1130707	Xã Yên Thọ	11307	0	\N	\N	\N	\N	\N	yt	113
1130709	Xã Yên Phương	11307	0	\N	\N	\N	\N	\N	yp	113
1130711	Xã Yên Nghĩa	11307	0	\N	\N	\N	\N	\N	yn	113
1130713	Xã Yên Tân	11307	0	\N	\N	\N	\N	\N	yt	113
1130715	Xã Yên Lợi	11307	0	\N	\N	\N	\N	\N	yl	113
1130717	Xã Yên Minh	11307	0	\N	\N	\N	\N	\N	ym	113
1130719	Xã Yên Bình	11307	0	\N	\N	\N	\N	\N	yb	113
1130721	Xã Yên Dương	11307	0	\N	\N	\N	\N	\N	yd	113
1130723	Xã Yên Mỹ	11307	0	\N	\N	\N	\N	\N	ym	113
1130725	Xã Yên Ninh	11307	0	\N	\N	\N	\N	\N	yn	113
1130727	Xã Yên Xá	11307	0	\N	\N	\N	\N	\N	yx	113
1130729	Xã Yên Chính	11307	0	\N	\N	\N	\N	\N	yc	113
1130731	Xã Yên Phú	11307	0	\N	\N	\N	\N	\N	yp	113
1130733	Xã Yên Hưng	11307	0	\N	\N	\N	\N	\N	yh	113
1130735	Xã Yên Phong	11307	0	\N	\N	\N	\N	\N	yp	113
1130737	Xã Yên Khánh	11307	0	\N	\N	\N	\N	\N	yk	113
1130739	Xã Yên Hồng	11307	0	\N	\N	\N	\N	\N	yh	113
1130741	Xã Yên Quang	11307	0	\N	\N	\N	\N	\N	yq	113
1130743	Xã Yên Tiến	11307	0	\N	\N	\N	\N	\N	yt	113
1130745	Xã Yên Bằng	11307	0	\N	\N	\N	\N	\N	yb	113
1130747	Xã Yên Khang	11307	0	\N	\N	\N	\N	\N	yk	113
1130749	Xã Yên Thắng	11307	0	\N	\N	\N	\N	\N	yt	113
1130751	Xã Yên Đồng	11307	0	\N	\N	\N	\N	\N	yd	113
1130753	Xã Yên Trị	11307	0	\N	\N	\N	\N	\N	yt	113
1130755	Xã Yên Nhân	11307	0	\N	\N	\N	\N	\N	yn	113
1130757	Xã Yên Lương	11307	0	\N	\N	\N	\N	\N	yl	113
1130759	Xã Yên Cường	11307	0	\N	\N	\N	\N	\N	yc	113
1130761	Xã Yên Lộc	11307	0	\N	\N	\N	\N	\N	yl	113
1130763	Xã Yên Phúc	11307	0	\N	\N	\N	\N	\N	yp	113
1130900	Không xác định	11309	0	\N	\N	\N	\N	\N	kx	113
1130901	Xã Điền Xá	11309	0	\N	\N	\N	\N	\N	dx	113
1130903	Xã Nam Mỹ	11309	0	\N	\N	\N	\N	\N	nm	113
1130905	Xã Nam Thắng	11309	0	\N	\N	\N	\N	\N	nt	113
1130907	Xã Nam Tiến	11309	0	\N	\N	\N	\N	\N	nt	113
1130909	Xã Tân Thịnh	11309	0	\N	\N	\N	\N	\N	tt	113
1130911	Xã Nghĩa An	11309	0	\N	\N	\N	\N	\N	na	113
6011107	Xã Đak Ui	60111	0	\N	\N	\N	\N	\N	du	601
1130913	Xã Nam Toàn	11309	0	\N	\N	\N	\N	\N	nt	113
1130915	Xã Hồng Quang	11309	0	\N	\N	\N	\N	\N	hq	113
1130917	Xã Nam Cường	11309	0	\N	\N	\N	\N	\N	nc	113
1130919	Xã Nam Hồng	11309	0	\N	\N	\N	\N	\N	nh	113
1130921	Xã Nam Hùng	11309	0	\N	\N	\N	\N	\N	nh	113
1130923	Xã Nam Giang	11309	0	\N	\N	\N	\N	\N	ng	113
1130925	Xã Nam Hoa	11309	0	\N	\N	\N	\N	\N	nh	113
1130927	Xã Nam Dương	11309	0	\N	\N	\N	\N	\N	nd	113
1130929	Xã Đồng Sơn	11309	0	\N	\N	\N	\N	\N	ds	113
1130931	Xã Bình Minh	11309	0	\N	\N	\N	\N	\N	bm	113
1130933	Xã Nam Thái	11309	0	\N	\N	\N	\N	\N	nt	113
1130935	Xã Nam Lợi	11309	0	\N	\N	\N	\N	\N	nl	113
1130937	Xã Nam Thanh	11309	0	\N	\N	\N	\N	\N	nt	113
1130939	Xã Nam Hải	11309	0	\N	\N	\N	\N	\N	nh	113
1131100	Không xác định	11311	0	\N	\N	\N	\N	\N	kx	113
1131101	Thị trấn Cổ Lễ	11311	0	\N	\N	\N	\N	\N	cl	113
1131103	Xã Phương Định	11311	0	\N	\N	\N	\N	\N	pd	113
1131105	Xã Trung Đông	11311	0	\N	\N	\N	\N	\N	td	113
1131107	Xã Trực Chính	11311	0	\N	\N	\N	\N	\N	tc	113
1131109	Xã Liêm Hải	11311	0	\N	\N	\N	\N	\N	lh	113
1131111	Xã Trực Thuận	11311	0	\N	\N	\N	\N	\N	tt	113
1131113	Xã Trực Đạo	11311	0	\N	\N	\N	\N	\N	td	113
1131115	Xã Cát Thành	11311	0	\N	\N	\N	\N	\N	ct	113
1131117	Xã Việt Hùng	11311	0	\N	\N	\N	\N	\N	vh	113
1131119	Xã Trực Hưng	11311	0	\N	\N	\N	\N	\N	th	113
1131121	Xã Trực Khang	11311	0	\N	\N	\N	\N	\N	tk	113
1131123	Xã Trực Thanh	11311	0	\N	\N	\N	\N	\N	tt	113
1131125	Xã Trực Nội	11311	0	\N	\N	\N	\N	\N	tn	113
1131127	Xã Trực Mỹ	11311	0	\N	\N	\N	\N	\N	tm	113
1131129	Xã Trực Tuấn	11311	0	\N	\N	\N	\N	\N	tt	113
1131131	Xã Trực Thắng	11311	0	\N	\N	\N	\N	\N	tt	113
1131133	Xã Trực Đại	11311	0	\N	\N	\N	\N	\N	td	113
1131135	Xã Trực Thái	11311	0	\N	\N	\N	\N	\N	tt	113
1131137	Xã Trực Cường	11311	0	\N	\N	\N	\N	\N	tc	113
1131139	Xã Trực Phú	11311	0	\N	\N	\N	\N	\N	tp	113
1131141	Xã Trực Hùng	11311	0	\N	\N	\N	\N	\N	th	113
1131300	Không xác định	11313	0	\N	\N	\N	\N	\N	kx	113
1131301	Xã Xuân Thượng	11313	0	\N	\N	\N	\N	\N	xt	113
1131303	Xã Xuân Châu	11313	0	\N	\N	\N	\N	\N	xc	113
1131305	Xã Xuân Hồng	11313	0	\N	\N	\N	\N	\N	xh	113
1131307	Xã Xuân Thủy	11313	0	\N	\N	\N	\N	\N	xt	113
1131309	Xã Xuân Ngọc	11313	0	\N	\N	\N	\N	\N	xn	113
1131311	Xã Xuân Hùng	11313	0	\N	\N	\N	\N	\N	xh	113
7171111	Xã PLThọ	71711	0	\N	\N	\N	\N	\N	pl	717
1131313	Xã Xuân Tiến	11313	0	\N	\N	\N	\N	\N	xt	113
1131315	Xã Xuân Kiên	11313	0	\N	\N	\N	\N	\N	xk	113
1131317	Xã Xuân Ninh	11313	0	\N	\N	\N	\N	\N	xn	113
1131319	Xã Xuân Hòa	11313	0	\N	\N	\N	\N	\N	xh	113
1131321	Xã Xuân Vinh	11313	0	\N	\N	\N	\N	\N	xv	113
1131323	Xã Xuân Thành	11313	0	\N	\N	\N	\N	\N	xt	113
1131325	Xã Xuân Bắc	11313	0	\N	\N	\N	\N	\N	xb	113
1131327	Xã Xuân Phương	11313	0	\N	\N	\N	\N	\N	xp	113
1131329	Xã Xuân Trung	11313	0	\N	\N	\N	\N	\N	xt	113
1131331	Xã Xuân Đài	11313	0	\N	\N	\N	\N	\N	xd	113
1131333	Xã Xuân Tân	11313	0	\N	\N	\N	\N	\N	xt	113
1131335	Xã Xuân Phong	11313	0	\N	\N	\N	\N	\N	xp	113
1131337	Xã Xuân Phú	11313	0	\N	\N	\N	\N	\N	xp	113
1131339	Xã Thọ Nghiệp	11313	0	\N	\N	\N	\N	\N	tn	113
1131500	Không xác định	11315	0	\N	\N	\N	\N	\N	kx	113
1131501	Thị trấn Ngô Đồng	11315	0	\N	\N	\N	\N	\N	nd	113
1131503	Xã Hoành Sơn	11315	0	\N	\N	\N	\N	\N	hs	113
1131505	Xã Giao Nhân	11315	0	\N	\N	\N	\N	\N	gn	113
1131507	Xã Giao Châu	11315	0	\N	\N	\N	\N	\N	gc	113
1131509	Xã Giao Hải	11315	0	\N	\N	\N	\N	\N	gh	113
1131511	Xã Giao Long	11315	0	\N	\N	\N	\N	\N	gl	113
1131513	Xã Bình Hòa	11315	0	\N	\N	\N	\N	\N	bh	113
1131515	Xã Giao Hà	11315	0	\N	\N	\N	\N	\N	gh	113
1131517	Xã Giao Tân	11315	0	\N	\N	\N	\N	\N	gt	113
1131519	Xã Giao Tiến	11315	0	\N	\N	\N	\N	\N	gt	113
1131521	Xã Giao Yến	11315	0	\N	\N	\N	\N	\N	gy	113
1131523	Xã Giao Thịnh	11315	0	\N	\N	\N	\N	\N	gt	113
1131525	Xã Giao Lâm	11315	0	\N	\N	\N	\N	\N	gl	113
1131527	Xã Giao Phong	11315	0	\N	\N	\N	\N	\N	gp	113
1131529	Xã Bạch Long	11315	0	\N	\N	\N	\N	\N	bl	113
1131531	Xã Giao Thiện	11315	0	\N	\N	\N	\N	\N	gt	113
1131533	Xã Giao An	11315	0	\N	\N	\N	\N	\N	ga	113
1131535	Xã Giao Thanh	11315	0	\N	\N	\N	\N	\N	gt	113
1131537	Xã Giao Hương	11315	0	\N	\N	\N	\N	\N	gh	113
1131539	Xã Hồng Thuận	11315	0	\N	\N	\N	\N	\N	ht	113
1131541	Xã Giao Lạc	11315	0	\N	\N	\N	\N	\N	gl	113
1131543	Xã Giao Xuân	11315	0	\N	\N	\N	\N	\N	gx	113
1131545	Xã Giao Hưng	11315	0	\N	\N	\N	\N	\N	gh	113
1131700	Không xác định	11317	0	\N	\N	\N	\N	\N	kx	113
1060917	Xã Gia Đông	10609	0	\N	\N	\N	\N	\N	gd	106
1131701	Thị trấn Liễu Đề	11317	0	\N	\N	\N	\N	\N	ld	113
1131703	Thị trấn Rạng Đông	11317	0	\N	\N	\N	\N	\N	rd	113
1131705	Xã Nghĩa Đồng	11317	0	\N	\N	\N	\N	\N	nd	113
1131707	Xã Nghĩa Thịnh	11317	0	\N	\N	\N	\N	\N	nt	113
1131709	Xã Nghĩa Minh	11317	0	\N	\N	\N	\N	\N	nm	113
1131711	Xã Hoàng Nam	11317	0	\N	\N	\N	\N	\N	hn	113
1131713	Xã Nghĩa Châu	11317	0	\N	\N	\N	\N	\N	nc	113
1131715	Xã Nghĩa Thái	11317	0	\N	\N	\N	\N	\N	nt	113
1131717	Xã Nghĩa Trung	11317	0	\N	\N	\N	\N	\N	nt	113
1131719	Xã Nghĩa Sơn	11317	0	\N	\N	\N	\N	\N	ns	113
1131721	Xã Nghĩa Lạc	11317	0	\N	\N	\N	\N	\N	nl	113
1131723	Xã Nghĩa Hồng	11317	0	\N	\N	\N	\N	\N	nh	113
1131725	Xã Nghĩa Phong	11317	0	\N	\N	\N	\N	\N	np	113
1131727	Xã Nghĩa Phú	11317	0	\N	\N	\N	\N	\N	np	113
1131729	Xã Nghĩa Bình	11317	0	\N	\N	\N	\N	\N	nb	113
1131731	Xã Nghĩa Tân	11317	0	\N	\N	\N	\N	\N	nt	113
1131733	Xã Nghĩa Hòa	11317	0	\N	\N	\N	\N	\N	nh	113
1131735	Xã Nghĩa Thành	11317	0	\N	\N	\N	\N	\N	nt	113
1131737	Xã Nghĩa Lâm	11317	0	\N	\N	\N	\N	\N	nl	113
1131739	Xã Nghĩa Hùng	11317	0	\N	\N	\N	\N	\N	nh	113
1131741	Xã Nghĩa Hải	11317	0	\N	\N	\N	\N	\N	nh	113
1131743	Xã Nghĩa Thắng	11317	0	\N	\N	\N	\N	\N	nt	113
1131745	Xã Nghĩa Lợi	11317	0	\N	\N	\N	\N	\N	nl	113
1131747	Xã Nghĩa Phúc	11317	0	\N	\N	\N	\N	\N	np	113
1131749	Xã Nam Điền	11317	0	\N	\N	\N	\N	\N	nd	113
1131900	Không xác định	11319	0	\N	\N	\N	\N	\N	kx	113
1131901	Thị trấn Yên Định	11319	0	\N	\N	\N	\N	\N	yd	113
1131903	Thị trấn Cồn	11319	0	\N	\N	\N	\N	\N	c	113
1131905	Thị trấn Thịnh Long	11319	0	\N	\N	\N	\N	\N	tl	113
1131907	Xã Hải Vân	11319	0	\N	\N	\N	\N	\N	hv	113
1131909	Xã Hải Nam	11319	0	\N	\N	\N	\N	\N	hn	113
1131911	Xã Hải Hà	11319	0	\N	\N	\N	\N	\N	hh	113
1131913	Xã Hải Phúc	11319	0	\N	\N	\N	\N	\N	hp	113
1131915	Xã Hải Lộc	11319	0	\N	\N	\N	\N	\N	hl	113
1131917	Xã Hải Thanh	11319	0	\N	\N	\N	\N	\N	ht	113
1131919	Xã Hải Hưng	11319	0	\N	\N	\N	\N	\N	hh	113
1131921	Xã Hải Quang	11319	0	\N	\N	\N	\N	\N	hq	113
1131923	Xã Hải Đông	11319	0	\N	\N	\N	\N	\N	hd	113
1131925	Xã Hải Tây	11319	0	\N	\N	\N	\N	\N	ht	113
1131927	Xã Hải Lý	11319	0	\N	\N	\N	\N	\N	hl	113
1131929	Xã Hải Minh	11319	0	\N	\N	\N	\N	\N	hm	113
1131931	Xã Hải Anh	11319	0	\N	\N	\N	\N	\N	ha	113
1131933	Xã Hải Trung	11319	0	\N	\N	\N	\N	\N	ht	113
1131935	Xã Hải Bắc	11319	0	\N	\N	\N	\N	\N	hb	113
1131937	Xã Hải Phương	11319	0	\N	\N	\N	\N	\N	hp	113
1131939	Xã Hải Tân	11319	0	\N	\N	\N	\N	\N	ht	113
1131941	Xã Hải Sơn	11319	0	\N	\N	\N	\N	\N	hs	113
1131943	Xã Hải Long	11319	0	\N	\N	\N	\N	\N	hl	113
1131945	Xã Hải Đường	11319	0	\N	\N	\N	\N	\N	hd	113
1131947	Xã Hải Xuân	11319	0	\N	\N	\N	\N	\N	hx	113
1131949	Xã Hải Hòa	11319	0	\N	\N	\N	\N	\N	hh	113
1131951	Xã Hải Châu	11319	0	\N	\N	\N	\N	\N	hc	113
1131953	Xã Hải Phú	11319	0	\N	\N	\N	\N	\N	hp	113
1131955	Xã Hải Cường	11319	0	\N	\N	\N	\N	\N	hc	113
1131957	Xã Hải Ninh	11319	0	\N	\N	\N	\N	\N	hn	113
1131959	Xã Hải An	11319	0	\N	\N	\N	\N	\N	ha	113
1131961	Xã Hải Toàn	11319	0	\N	\N	\N	\N	\N	ht	113
1131963	Xã Hải Phong	11319	0	\N	\N	\N	\N	\N	hp	113
1131965	Xã Hải Giang	11319	0	\N	\N	\N	\N	\N	hg	113
1131967	Xã Hải Triều	11319	0	\N	\N	\N	\N	\N	ht	113
1131969	Xã Hải Chính	11319	0	\N	\N	\N	\N	\N	hc	113
1150000	Không xác định	11500	0	\N	\N	\N	\N	\N	kx	115
1150100	Không xác định	11501	0	\N	\N	\N	\N	\N	kx	115
1150101	Phường Lê Hồng Phong	11501	0	\N	\N	\N	\N	\N	lhp	115
1150103	Phường Bồ Xuyên	11501	0	\N	\N	\N	\N	\N	bx	115
1150105	Phường Đề Thám	11501	0	\N	\N	\N	\N	\N	dt	115
1150107	Phường Kỳ Bá	11501	0	\N	\N	\N	\N	\N	kb	115
1150109	Phường Quang Trung	11501	0	\N	\N	\N	\N	\N	qt	115
1150111	Phường Phú Khánh	11501	0	\N	\N	\N	\N	\N	pk	115
1150113	Xã Đông Hòa	11501	0	\N	\N	\N	\N	\N	dh	115
1150115	Xã Hoàng Diệu	11501	0	\N	\N	\N	\N	\N	hd	115
1150117	Xã Tiền Phong	11501	0	\N	\N	\N	\N	\N	tp	115
1150119	Xã Phú Xuân	11501	0	\N	\N	\N	\N	\N	px	115
1150121	Xã Trần Lãm	11501	0	\N	\N	\N	\N	\N	tl	115
1150123	Xã Vũ Chính	11501	0	\N	\N	\N	\N	\N	vc	115
1150125	Xã Vũ Phúc	11501	0	\N	\N	\N	\N	\N	vp	115
1150300	Không xác định	11503	0	\N	\N	\N	\N	\N	kx	115
1150301	Thị trấn Quỳnh Côi	11503	0	\N	\N	\N	\N	\N	qc	115
1150303	Xã Quỳnh Lâm	11503	0	\N	\N	\N	\N	\N	ql	115
1150305	Xã Quỳnh Hoàng	11503	0	\N	\N	\N	\N	\N	qh	115
1150307	Xã Quỳnh Khê	11503	0	\N	\N	\N	\N	\N	qk	115
1150309	Xã Quỳnh Ngọc	11503	0	\N	\N	\N	\N	\N	qn	115
1150311	Xã Quỳnh Giao	11503	0	\N	\N	\N	\N	\N	qg	115
1150313	Xã Quỳnh Hoa	11503	0	\N	\N	\N	\N	\N	qh	115
1150315	Xã Quỳnh Thọ	11503	0	\N	\N	\N	\N	\N	qt	115
1150317	Xã An Hiệp	11503	0	\N	\N	\N	\N	\N	ah	115
1150319	Xã An Đồng	11503	0	\N	\N	\N	\N	\N	ad	115
1150321	Xã An Khê	11503	0	\N	\N	\N	\N	\N	ak	115
1150323	Xã An Thái	11503	0	\N	\N	\N	\N	\N	at	115
1150325	Xã An Cầu	11503	0	\N	\N	\N	\N	\N	ac	115
1150327	Xã Quỳnh Minh	11503	0	\N	\N	\N	\N	\N	qm	115
1150329	Xã An ấp	11503	0	\N	\N	\N	\N	\N	aờ	115
1150331	Xã Quỳnh Hội	11503	0	\N	\N	\N	\N	\N	qh	115
1150333	Xã Quỳnh Hải	11503	0	\N	\N	\N	\N	\N	qh	115
1150335	Xã Quỳnh Hồng	11503	0	\N	\N	\N	\N	\N	qh	115
1150337	Xã Quỳnh Mỹ	11503	0	\N	\N	\N	\N	\N	qm	115
1150339	Xã Quỳnh Sơn	11503	0	\N	\N	\N	\N	\N	qs	115
1150341	Xã Quỳnh Nguyên	11503	0	\N	\N	\N	\N	\N	qn	115
1150343	Xã Quỳnh Châu	11503	0	\N	\N	\N	\N	\N	qc	115
1150345	Xã Quỳnh Bảo	11503	0	\N	\N	\N	\N	\N	qb	115
1150347	Xã Quỳnh Hưng	11503	0	\N	\N	\N	\N	\N	qh	115
1150349	Xã Quỳnh Trang	11503	0	\N	\N	\N	\N	\N	qt	115
1150351	Xã Quỳnh Xá	11503	0	\N	\N	\N	\N	\N	qx	115
1150353	Xã An Ninh	11503	0	\N	\N	\N	\N	\N	an	115
1150355	Xã Đông Hải	11503	0	\N	\N	\N	\N	\N	dh	115
1150357	Xã An Quí	11503	0	\N	\N	\N	\N	\N	aq	115
1150359	Xã An Vinh	11503	0	\N	\N	\N	\N	\N	av	115
1150361	Xã An Bài	11503	0	\N	\N	\N	\N	\N	ab	115
1150363	Xã An Thanh	11503	0	\N	\N	\N	\N	\N	at	115
1150365	Xã An Mỹ	11503	0	\N	\N	\N	\N	\N	am	115
1150367	Xã An Lễ	11503	0	\N	\N	\N	\N	\N	al	115
1150369	Xã An Vũ	11503	0	\N	\N	\N	\N	\N	av	115
1150371	Xã An Dục	11503	0	\N	\N	\N	\N	\N	ad	115
1150373	Xã An Tràng	11503	0	\N	\N	\N	\N	\N	at	115
1150375	Xã Đồng Tiến	11503	0	\N	\N	\N	\N	\N	dt	115
1150500	Không xác định	11505	0	\N	\N	\N	\N	\N	kx	115
1150501	Thị trấn Hưng Hà	11505	0	\N	\N	\N	\N	\N	hh	115
1150503	Xã Tân Lễ	11505	0	\N	\N	\N	\N	\N	tl	115
1150505	Xã Phú Sơn	11505	0	\N	\N	\N	\N	\N	ps	115
1150507	Xã Tiến Đức	11505	0	\N	\N	\N	\N	\N	td	115
1150509	Xã Hồng An	11505	0	\N	\N	\N	\N	\N	ha	115
1150511	Xã Canh Tân	11505	0	\N	\N	\N	\N	\N	ct	115
1150513	Xã Tân Hòa	11505	0	\N	\N	\N	\N	\N	th	115
1150515	Xã Cộng Hòa	11505	0	\N	\N	\N	\N	\N	ch	115
1150517	Xã Hòa Tiến	11505	0	\N	\N	\N	\N	\N	ht	115
1150519	Xã Tân Tiến	11505	0	\N	\N	\N	\N	\N	tt	115
1150521	Xã Phúc Khánh	11505	0	\N	\N	\N	\N	\N	pk	115
1150523	Xã Liên Hiệp	11505	0	\N	\N	\N	\N	\N	lh	115
1150525	Xã Thái Hưng	11505	0	\N	\N	\N	\N	\N	th	115
1150527	Xã Thái Phương	11505	0	\N	\N	\N	\N	\N	tp	115
1150529	Xã Minh Tân	11505	0	\N	\N	\N	\N	\N	mt	115
1150531	Xã Điệp Nông	11505	0	\N	\N	\N	\N	\N	dn	115
1150533	Xã Đoan Hùng	11505	0	\N	\N	\N	\N	\N	dh	115
1150535	Xã Dân Chủ	11505	0	\N	\N	\N	\N	\N	dc	115
1150537	Xã Duyên Hải	11505	0	\N	\N	\N	\N	\N	dh	115
1150539	Xã Hùng Dũng	11505	0	\N	\N	\N	\N	\N	hd	115
1150541	Xã Văn Cẩm	11505	0	\N	\N	\N	\N	\N	vc	115
1150543	Xã Thống Nhất	11505	0	\N	\N	\N	\N	\N	tn	115
1150545	Xã Minh Khai	11505	0	\N	\N	\N	\N	\N	mk	115
1150547	Xã Hồng Lĩnh	11505	0	\N	\N	\N	\N	\N	hl	115
1150549	Xã Kim Chung	11505	0	\N	\N	\N	\N	\N	kc	115
1150551	Xã Chí Hòa	11505	0	\N	\N	\N	\N	\N	ch	115
1150553	Xã Minh Hòa	11505	0	\N	\N	\N	\N	\N	mh	115
1150555	Xã Văn Lang	11505	0	\N	\N	\N	\N	\N	vl	115
1150557	Xã Độc Lập	11505	0	\N	\N	\N	\N	\N	dl	115
1150559	Xã Hồng Minh	11505	0	\N	\N	\N	\N	\N	hm	115
1150561	Xã Bình Lăng	11505	0	\N	\N	\N	\N	\N	bl	115
1150563	Xã Tây Đô	11505	0	\N	\N	\N	\N	\N	td	115
1150565	Xã Đông Đô	11505	0	\N	\N	\N	\N	\N	dd	115
1150567	Xã Bắc Sơn	11505	0	\N	\N	\N	\N	\N	bs	115
1150700	Không xác định	11507	0	\N	\N	\N	\N	\N	kx	115
1150701	Thị trấn Diêm Điền	11507	0	\N	\N	\N	\N	\N	dd	115
1150703	Xã Thụy Ninh	11507	0	\N	\N	\N	\N	\N	tn	115
1150705	Xã Thụy Chính	11507	0	\N	\N	\N	\N	\N	tc	115
1150707	Xã Thụy Dân	11507	0	\N	\N	\N	\N	\N	td	115
1150709	Xã Thụy Duyên	11507	0	\N	\N	\N	\N	\N	td	115
1150711	Xã Thụy Thanh	11507	0	\N	\N	\N	\N	\N	tt	115
1150713	Xã Thụy Phong	11507	0	\N	\N	\N	\N	\N	tp	115
1150715	Xã Thụy Sơn	11507	0	\N	\N	\N	\N	\N	ts	115
1150717	Xã Thụy Phúc	11507	0	\N	\N	\N	\N	\N	tp	115
1150719	Xã Thụy Hưng	11507	0	\N	\N	\N	\N	\N	th	115
1150721	Xã Thụy Việt	11507	0	\N	\N	\N	\N	\N	tv	115
1150723	Xã Thụy Dương	11507	0	\N	\N	\N	\N	\N	td	115
1150725	Xã Thụy Văn	11507	0	\N	\N	\N	\N	\N	tv	115
1150727	Xã Thụy Bình	11507	0	\N	\N	\N	\N	\N	tb	115
1150729	Xã Thụy Liên	11507	0	\N	\N	\N	\N	\N	tl	115
1150731	Xã Thụy Hà	11507	0	\N	\N	\N	\N	\N	th	115
1150733	Xã Thụy Lương	11507	0	\N	\N	\N	\N	\N	tl	115
1150735	Xã Thụy Quỳnh	11507	0	\N	\N	\N	\N	\N	tq	115
1150737	Xã Thụy Trình	11507	0	\N	\N	\N	\N	\N	tt	115
1150739	Xã Hồng Quỳnh	11507	0	\N	\N	\N	\N	\N	hq	115
1150741	Xã Thụy Hồng	11507	0	\N	\N	\N	\N	\N	th	115
1150743	Xã Thụy Dũng	11507	0	\N	\N	\N	\N	\N	td	115
1150745	Xã Thụy Tân	11507	0	\N	\N	\N	\N	\N	tt	115
1150747	Xã Thụy An	11507	0	\N	\N	\N	\N	\N	ta	115
1150749	Xã Thụy Hải	11507	0	\N	\N	\N	\N	\N	th	115
1150751	Xã Thụy Xuân	11507	0	\N	\N	\N	\N	\N	tx	115
1150753	Xã Thụy Trường	11507	0	\N	\N	\N	\N	\N	tt	115
1150755	Xã Thái Giang	11507	0	\N	\N	\N	\N	\N	tg	115
1150757	Xã Thái Sơn	11507	0	\N	\N	\N	\N	\N	ts	115
1150759	Xã Thái Hà	11507	0	\N	\N	\N	\N	\N	th	115
1150761	Xã Thái Phúc	11507	0	\N	\N	\N	\N	\N	tp	115
1150763	Xã Thái Dương	11507	0	\N	\N	\N	\N	\N	td	115
1150765	Xã Thái Hồng	11507	0	\N	\N	\N	\N	\N	th	115
1150767	Xã Thái Thuần	11507	0	\N	\N	\N	\N	\N	tt	115
1150769	Xã Thái Thành	11507	0	\N	\N	\N	\N	\N	tt	115
1150771	Xã Thái Thịnh	11507	0	\N	\N	\N	\N	\N	tt	115
1150773	Xã Thái Thọ	11507	0	\N	\N	\N	\N	\N	tt	115
1150775	Xã Thái Học	11507	0	\N	\N	\N	\N	\N	th	115
1150777	Xã  Mỹ Lộc	11507	0	\N	\N	\N	\N	\N	ml	115
1150779	Xã Thái Tân	11507	0	\N	\N	\N	\N	\N	tt	115
1150781	Xã Thái Đô	11507	0	\N	\N	\N	\N	\N	td	115
1150783	Xã Thái Hưng	11507	0	\N	\N	\N	\N	\N	th	115
1150785	Xã Thái An	11507	0	\N	\N	\N	\N	\N	ta	115
1150787	Xã Thái Nguyên	11507	0	\N	\N	\N	\N	\N	tn	115
1150789	Xã Thái Thuỷ	11507	0	\N	\N	\N	\N	\N	tt	115
1150791	Xã Thái Xuyên	11507	0	\N	\N	\N	\N	\N	tx	115
1150793	Xã Thái Thượng	11507	0	\N	\N	\N	\N	\N	tt	115
1150795	Xã Thái Hoà	11507	0	\N	\N	\N	\N	\N	th	115
1150900	Không xác định	11509	0	\N	\N	\N	\N	\N	kx	115
1150901	Thị trấn Đông Hưng	11509	0	\N	\N	\N	\N	\N	dh	115
1150903	Xã An Châu	11509	0	\N	\N	\N	\N	\N	ac	115
1150905	Xã Đô Lương	11509	0	\N	\N	\N	\N	\N	dl	115
1150907	Xã Liên Giang	11509	0	\N	\N	\N	\N	\N	lg	115
1150909	Xã Đông Phương	11509	0	\N	\N	\N	\N	\N	dp	115
1150911	Xã Đông Sơn	11509	0	\N	\N	\N	\N	\N	ds	115
1150913	Xã Lô Giang	11509	0	\N	\N	\N	\N	\N	lg	115
1150915	Xã Minh Tân	11509	0	\N	\N	\N	\N	\N	mt	115
1150917	Xã Mê Linh	11509	0	\N	\N	\N	\N	\N	ml	115
1150919	Xã Phú Lương	11509	0	\N	\N	\N	\N	\N	pl	115
1150921	Xã Đông La	11509	0	\N	\N	\N	\N	\N	dl	115
1150923	Xã Đông Cường	11509	0	\N	\N	\N	\N	\N	dc	115
1150925	Xã Đông Xá	11509	0	\N	\N	\N	\N	\N	dx	115
1150927	Xã Hợp Tiến	11509	0	\N	\N	\N	\N	\N	ht	115
1150929	Xã Phong Châu	11509	0	\N	\N	\N	\N	\N	pc	115
1150931	Xã Nguyên Xá	11509	0	\N	\N	\N	\N	\N	nx	115
1150933	Xã Hồng Việt	11509	0	\N	\N	\N	\N	\N	hv	115
1150935	Xã Thăng Long	11509	0	\N	\N	\N	\N	\N	tl	115
1150937	Xã Chương Dương	11509	0	\N	\N	\N	\N	\N	cd	115
1150939	Xã Đông Hợp	11509	0	\N	\N	\N	\N	\N	dh	115
1150941	Xã Đông Hà	11509	0	\N	\N	\N	\N	\N	dh	115
1150943	Xã Đông Giang	11509	0	\N	\N	\N	\N	\N	dg	115
1150945	Xã Đông Kinh	11509	0	\N	\N	\N	\N	\N	dk	115
1150947	Xã Hồng Châu	11509	0	\N	\N	\N	\N	\N	hc	115
1150949	Xã Hoa Lư	11509	0	\N	\N	\N	\N	\N	hl	115
1150951	Xã Minh Châu	11509	0	\N	\N	\N	\N	\N	mc	115
1150953	Xã Phú Châu	11509	0	\N	\N	\N	\N	\N	pc	115
1150955	Xã Đông Các	11509	0	\N	\N	\N	\N	\N	dc	115
1150957	Xã Bạch Đằng	11509	0	\N	\N	\N	\N	\N	bd	115
1150959	Xã Hoa Nam	11509	0	\N	\N	\N	\N	\N	hn	115
1150961	Xã Đồng Phú	11509	0	\N	\N	\N	\N	\N	dp	115
1150963	Xã Trọng Quan	11509	0	\N	\N	\N	\N	\N	tq	115
1150965	Xã Đông Động	11509	0	\N	\N	\N	\N	\N	dd	115
1150967	Xã Đông Vinh	11509	0	\N	\N	\N	\N	\N	dv	115
1150969	Xã Đông Tân	11509	0	\N	\N	\N	\N	\N	dt	115
1150971	Xã Đông Xuân	11509	0	\N	\N	\N	\N	\N	dx	115
1150973	Xã Đông Quang	11509	0	\N	\N	\N	\N	\N	dq	115
1150975	Xã Hồng Giang	11509	0	\N	\N	\N	\N	\N	hg	115
1150977	Xã Đông Dương	11509	0	\N	\N	\N	\N	\N	dd	115
1150979	Xã Đông Phong	11509	0	\N	\N	\N	\N	\N	dp	115
1150981	Xã Đông á	11509	0	\N	\N	\N	\N	\N	da	115
1150983	Xã Đông Lĩnh	11509	0	\N	\N	\N	\N	\N	dl	115
1150985	Xã Đông Hoàng	11509	0	\N	\N	\N	\N	\N	dh	115
1150987	Xã Đông Thọ	11509	0	\N	\N	\N	\N	\N	dt	115
1150989	Xã Đông Mỹ	11509	0	\N	\N	\N	\N	\N	dm	115
1150991	Xã Đông Huy	11509	0	\N	\N	\N	\N	\N	dh	115
1151100	Không xác định	11511	0	\N	\N	\N	\N	\N	kx	115
1151101	Thị trấn Vũ Thư	11511	0	\N	\N	\N	\N	\N	vt	115
1151103	Xã Hồng Lý	11511	0	\N	\N	\N	\N	\N	hl	115
1151105	Xã Đồng Thanh	11511	0	\N	\N	\N	\N	\N	dt	115
1151107	Xã Xuân Hòa	11511	0	\N	\N	\N	\N	\N	xh	115
1151109	Xã Hiệp Hòa	11511	0	\N	\N	\N	\N	\N	hh	115
1151111	Xã Phúc Thành	11511	0	\N	\N	\N	\N	\N	pt	115
1151113	Xã Tân Phong	11511	0	\N	\N	\N	\N	\N	tp	115
1151115	Xã Song Lãng	11511	0	\N	\N	\N	\N	\N	sl	115
1151117	Xã Tân Hòa	11511	0	\N	\N	\N	\N	\N	th	115
1151119	Xã Việt Hùng	11511	0	\N	\N	\N	\N	\N	vh	115
1151121	Xã Minh Lãng	11511	0	\N	\N	\N	\N	\N	ml	115
1151123	Xã Tân Bình	11511	0	\N	\N	\N	\N	\N	tb	115
1151125	Xã Minh Khai	11511	0	\N	\N	\N	\N	\N	mk	115
1151127	Xã Dũng Nghĩa	11511	0	\N	\N	\N	\N	\N	dn	115
1151129	Xã Minh Quang	11511	0	\N	\N	\N	\N	\N	mq	115
1151131	Xã Tam Quang	11511	0	\N	\N	\N	\N	\N	tq	115
1151133	Xã Tân Lập	11511	0	\N	\N	\N	\N	\N	tl	115
1151135	Xã Tự Tân	11511	0	\N	\N	\N	\N	\N	tt	115
1151137	Xã Bách Thuận	11511	0	\N	\N	\N	\N	\N	bt	115
1151139	Xã Song An	11511	0	\N	\N	\N	\N	\N	sa	115
1151141	Xã Hòa Bình	11511	0	\N	\N	\N	\N	\N	hb	115
1151143	Xã Trung An	11511	0	\N	\N	\N	\N	\N	ta	115
1151145	Xã Vũ Hội	11511	0	\N	\N	\N	\N	\N	vh	115
1151147	Xã Nguyên Xá	11511	0	\N	\N	\N	\N	\N	nx	115
1151149	Xã Việt Thuận	11511	0	\N	\N	\N	\N	\N	vt	115
1151151	Xã Vũ Vinh	11511	0	\N	\N	\N	\N	\N	vv	115
1151153	Xã Vũ Đoài	11511	0	\N	\N	\N	\N	\N	vd	115
1151155	Xã Vũ Tiến	11511	0	\N	\N	\N	\N	\N	vt	115
1151157	Xã Vũ Vân	11511	0	\N	\N	\N	\N	\N	vv	115
1151159	Xã Duy Nhất	11511	0	\N	\N	\N	\N	\N	dn	115
1151161	Xã Hồng Phong	11511	0	\N	\N	\N	\N	\N	hp	115
1151300	Không xác định	11513	0	\N	\N	\N	\N	\N	kx	115
1151301	Thị trấn Kiến Xương	11513	0	\N	\N	\N	\N	\N	kx	115
1151303	Xã Vũ Đông	11513	0	\N	\N	\N	\N	\N	vd	115
1151305	Xã Vũ Tây	11513	0	\N	\N	\N	\N	\N	vt	115
1151307	Xã An Bình	11513	0	\N	\N	\N	\N	\N	ab	115
1151309	Xã Vũ Lạc	11513	0	\N	\N	\N	\N	\N	vl	115
1151311	Xã Vũ Sơn	11513	0	\N	\N	\N	\N	\N	vs	115
1151313	Xã Vũ Lễ	11513	0	\N	\N	\N	\N	\N	vl	115
1151315	Xã Vũ An	11513	0	\N	\N	\N	\N	\N	va	115
1151317	Xã Trà Giang	11513	0	\N	\N	\N	\N	\N	tg	115
1151319	Xã Hồng Thái	11513	0	\N	\N	\N	\N	\N	ht	115
1151321	Xã Quốc Tuấn	11513	0	\N	\N	\N	\N	\N	qt	115
1151323	Xã Bình Nguyên	11513	0	\N	\N	\N	\N	\N	bn	115
1151325	Xã Quyết Tiến	11513	0	\N	\N	\N	\N	\N	qt	115
1151327	Xã Lê Lợi	11513	0	\N	\N	\N	\N	\N	ll	115
1151329	Xã Nam Cao	11513	0	\N	\N	\N	\N	\N	nc	115
1151331	Xã Thanh Tân	11513	0	\N	\N	\N	\N	\N	tt	115
1151333	Xã Đình Phùng	11513	0	\N	\N	\N	\N	\N	dp	115
1151335	Xã Vũ Ninh	11513	0	\N	\N	\N	\N	\N	vn	115
1151337	Xã Vũ Quí	11513	0	\N	\N	\N	\N	\N	vq	115
1151339	Xã Vũ Trung	11513	0	\N	\N	\N	\N	\N	vt	115
1151341	Xã Vũ Thắng	11513	0	\N	\N	\N	\N	\N	vt	115
1151343	Xã Vũ Hòa	11513	0	\N	\N	\N	\N	\N	vh	115
1151345	Xã Vũ Công	11513	0	\N	\N	\N	\N	\N	vc	115
1151347	Xã Vũ Bình	11513	0	\N	\N	\N	\N	\N	vb	115
1151349	Xã Quang Bình	11513	0	\N	\N	\N	\N	\N	qb	115
1151351	Xã Quang Lịch	11513	0	\N	\N	\N	\N	\N	ql	115
1151353	Xã Bình Minh	11513	0	\N	\N	\N	\N	\N	bm	115
1151355	Xã Thượng Hiền	11513	0	\N	\N	\N	\N	\N	th	115
1151357	Xã An Bồi	11513	0	\N	\N	\N	\N	\N	ab	115
1151359	Xã Hòa Bình	11513	0	\N	\N	\N	\N	\N	hb	115
1151361	Xã Tán Thuật	11513	0	\N	\N	\N	\N	\N	tt	115
1151363	Xã Quang Minh	11513	0	\N	\N	\N	\N	\N	qm	115
1151365	Xã Quang Trung	11513	0	\N	\N	\N	\N	\N	qt	115
1151367	Xã Quang Hưng	11513	0	\N	\N	\N	\N	\N	qh	115
1151369	Xã Minh Hưng	11513	0	\N	\N	\N	\N	\N	mh	115
1151371	Xã Bình Thanh	11513	0	\N	\N	\N	\N	\N	bt	115
1151373	Xã Nam Bình	11513	0	\N	\N	\N	\N	\N	nb	115
1151375	Xã Minh Tân	11513	0	\N	\N	\N	\N	\N	mt	115
1151377	Xã Bình Định	11513	0	\N	\N	\N	\N	\N	bd	115
1151379	Xã Hồng Tiến	11513	0	\N	\N	\N	\N	\N	ht	115
1151500	Không xác định	11515	0	\N	\N	\N	\N	\N	kx	115
1151501	Thị trấn Tiền Hải	11515	0	\N	\N	\N	\N	\N	th	115
1151503	Xã Đông Hải	11515	0	\N	\N	\N	\N	\N	dh	115
1151505	Xã Đông Trà	11515	0	\N	\N	\N	\N	\N	dt	115
1151507	Xã Đông Long	11515	0	\N	\N	\N	\N	\N	dl	115
1151509	Xã Đông Quí	11515	0	\N	\N	\N	\N	\N	dq	115
1151511	Xã Vũ Lăng	11515	0	\N	\N	\N	\N	\N	vl	115
1151513	Xã Đông Xuyên	11515	0	\N	\N	\N	\N	\N	dx	115
1151515	Xã Tây Lương	11515	0	\N	\N	\N	\N	\N	tl	115
1151517	Xã Tây Ninh	11515	0	\N	\N	\N	\N	\N	tn	115
1151519	Xã Đông Trung	11515	0	\N	\N	\N	\N	\N	dt	115
1151521	Xã Đông Hoàng	11515	0	\N	\N	\N	\N	\N	dh	115
1151523	Xã Đông Minh	11515	0	\N	\N	\N	\N	\N	dm	115
1151525	Xã Tây An	11515	0	\N	\N	\N	\N	\N	ta	115
1151527	Xã Đông Phong	11515	0	\N	\N	\N	\N	\N	dp	115
1151529	Xã An Ninh	11515	0	\N	\N	\N	\N	\N	an	115
1151531	Xã Tây Sơn	11515	0	\N	\N	\N	\N	\N	ts	115
1151533	Xã Đông Cơ	11515	0	\N	\N	\N	\N	\N	dc	115
1151535	Xã Tây Giang	11515	0	\N	\N	\N	\N	\N	tg	115
1151537	Xã Đông Lâm	11515	0	\N	\N	\N	\N	\N	dl	115
1151539	Xã Phương Công	11515	0	\N	\N	\N	\N	\N	pc	115
1151541	Xã Tây Phong	11515	0	\N	\N	\N	\N	\N	tp	115
1151543	Xã Tây Tiến	11515	0	\N	\N	\N	\N	\N	tt	115
1151545	Xã Nam Cường	11515	0	\N	\N	\N	\N	\N	nc	115
1151547	Xã Vân Trường	11515	0	\N	\N	\N	\N	\N	vt	115
1151549	Xã Nam Chính	11515	0	\N	\N	\N	\N	\N	nc	115
1151551	Xã Nam Thắng	11515	0	\N	\N	\N	\N	\N	nt	115
1151553	Xã Nam Thịnh	11515	0	\N	\N	\N	\N	\N	nt	115
1151555	Xã Bắc Hải	11515	0	\N	\N	\N	\N	\N	bh	115
1151557	Xã Nam Hà	11515	0	\N	\N	\N	\N	\N	nh	115
1151559	Xã Nam Thanh	11515	0	\N	\N	\N	\N	\N	nt	115
1151561	Xã Nam Trung	11515	0	\N	\N	\N	\N	\N	nt	115
1151563	Xã Nam Hồng	11515	0	\N	\N	\N	\N	\N	nh	115
1151565	Xã Nam Hưng	11515	0	\N	\N	\N	\N	\N	nh	115
1151567	Xã Nam Hải	11515	0	\N	\N	\N	\N	\N	nh	115
1151569	Xã Nam Phú	11515	0	\N	\N	\N	\N	\N	np	115
1170000	Không xác định	11700	0	\N	\N	\N	\N	\N	kx	117
1170100	Không xác định	11701	0	\N	\N	\N	\N	\N	kx	117
1170101	Phường Tân Thành	11701	0	\N	\N	\N	\N	\N	tt	117
1170103	Phường Đông Thành	11701	0	\N	\N	\N	\N	\N	dt	117
1170105	Phường Vân Giang	11701	0	\N	\N	\N	\N	\N	vg	117
1170107	Phường Thanh Bình	11701	0	\N	\N	\N	\N	\N	tb	117
1170109	Phường Phúc Thành	11701	0	\N	\N	\N	\N	\N	pt	117
1170111	Phường Nam Thành	11701	0	\N	\N	\N	\N	\N	nt	117
1170113	Phường Nam Bình	11701	0	\N	\N	\N	\N	\N	nb	117
1170115	Phường Bích Đào	11701	0	\N	\N	\N	\N	\N	bd	117
1170300	Không xác định	11703	0	\N	\N	\N	\N	\N	kx	117
1170301	Phường Bắc Sơn	11703	0	\N	\N	\N	\N	\N	bs	117
1170303	Phường Trung Sơn	11703	0	\N	\N	\N	\N	\N	ts	117
1170305	Phường Nam Sơn	11703	0	\N	\N	\N	\N	\N	ns	117
1170307	Xã Yên Sơn	11703	0	\N	\N	\N	\N	\N	ys	117
1170309	Xã Yên Bình	11703	0	\N	\N	\N	\N	\N	yb	117
1170311	Xã Đông Sơn	11703	0	\N	\N	\N	\N	\N	ds	117
1170313	Xã Quang Sơn	11703	0	\N	\N	\N	\N	\N	qs	117
1170500	Không xác định	11705	0	\N	\N	\N	\N	\N	kx	117
1170501	Thị trấn Nho Quan	11705	0	\N	\N	\N	\N	\N	nq	117
1170503	Xã Xích Thổ	11705	0	\N	\N	\N	\N	\N	xt	117
1170505	Xã Gia Lâm	11705	0	\N	\N	\N	\N	\N	gl	117
1170507	Xã Thạch Bình	11705	0	\N	\N	\N	\N	\N	tb	117
1170509	Xã Gia Sơn	11705	0	\N	\N	\N	\N	\N	gs	117
1170511	Xã Gia Thủy	11705	0	\N	\N	\N	\N	\N	gt	117
1170513	Xã Gia Tường	11705	0	\N	\N	\N	\N	\N	gt	117
1170515	Xã Đức Long	11705	0	\N	\N	\N	\N	\N	dl	117
1170517	Xã Phú Sơn	11705	0	\N	\N	\N	\N	\N	ps	117
1170519	Xã Lạc Vân	11705	0	\N	\N	\N	\N	\N	lv	117
1170521	Xã Đồng Phong	11705	0	\N	\N	\N	\N	\N	dp	117
1170523	Xã Lạng Phong	11705	0	\N	\N	\N	\N	\N	lp	117
1170525	Xã Cúc Phương	11705	0	\N	\N	\N	\N	\N	cp	117
1170527	Xã Yên Quang	11705	0	\N	\N	\N	\N	\N	yq	117
1170529	Xã Văn Phong	11705	0	\N	\N	\N	\N	\N	vp	117
1170531	Xã Thượng Hòa	11705	0	\N	\N	\N	\N	\N	th	117
1170533	Xã Văn Phương	11705	0	\N	\N	\N	\N	\N	vp	117
1170535	Xã Văn Phú	11705	0	\N	\N	\N	\N	\N	vp	117
1170537	Xã Thanh Lạc	11705	0	\N	\N	\N	\N	\N	tl	117
1170539	Xã Sơn Thành	11705	0	\N	\N	\N	\N	\N	st	117
1170541	Xã Sơn Lai	11705	0	\N	\N	\N	\N	\N	sl	117
1170543	Xã Kỳ Phú	11705	0	\N	\N	\N	\N	\N	kp	117
1170545	Xã Phú Lộc	11705	0	\N	\N	\N	\N	\N	pl	117
1170547	Xã Quỳnh Lưu	11705	0	\N	\N	\N	\N	\N	ql	117
1170549	Xã Sơn Hà	11705	0	\N	\N	\N	\N	\N	sh	117
1170551	Xã Quảng Lạc	11705	0	\N	\N	\N	\N	\N	ql	117
1170553	Xã Phú Long	11705	0	\N	\N	\N	\N	\N	pl	117
1170700	Không xác định	11707	0	\N	\N	\N	\N	\N	kx	117
1170701	Thị trấn Me	11707	0	\N	\N	\N	\N	\N	m	117
1170703	Xã Gia Hưng	11707	0	\N	\N	\N	\N	\N	gh	117
1170705	Xã Gia Hòa	11707	0	\N	\N	\N	\N	\N	gh	117
1170707	Xã Liên Sơn	11707	0	\N	\N	\N	\N	\N	ls	117
1170709	Xã Gia Thanh	11707	0	\N	\N	\N	\N	\N	gt	117
1170711	Xã Gia Vân	11707	0	\N	\N	\N	\N	\N	gv	117
1170713	Xã Gia Xuân	11707	0	\N	\N	\N	\N	\N	gx	117
1170715	Xã Gia Phú	11707	0	\N	\N	\N	\N	\N	gp	117
1170717	Xã Gia Vượng	11707	0	\N	\N	\N	\N	\N	gv	117
1170719	Xã Gia Thịnh	11707	0	\N	\N	\N	\N	\N	gt	117
1170721	Xã Gia Phương	11707	0	\N	\N	\N	\N	\N	gp	117
1170723	Xã Gia Lập	11707	0	\N	\N	\N	\N	\N	gl	117
1170725	Xã Gia Tân	11707	0	\N	\N	\N	\N	\N	gt	117
1170727	Xã Gia Trấn	11707	0	\N	\N	\N	\N	\N	gt	117
1170729	Xã Gia Thắng	11707	0	\N	\N	\N	\N	\N	gt	117
1170731	Xã Gia Trung	11707	0	\N	\N	\N	\N	\N	gt	117
1170733	Xã Gia Minh	11707	0	\N	\N	\N	\N	\N	gm	117
1170735	Xã Gia Lạc	11707	0	\N	\N	\N	\N	\N	gl	117
1170737	Xã Gia Tiến	11707	0	\N	\N	\N	\N	\N	gt	117
1170739	Xã Gia Sinh	11707	0	\N	\N	\N	\N	\N	gs	117
1170741	Xã Gia Phong	11707	0	\N	\N	\N	\N	\N	gp	117
1170900	Không xác định	11709	0	\N	\N	\N	\N	\N	kx	117
1171135	Xã Mai Sơn	11711	0	\N	\N	\N	\N	\N	ms	117
1170903	Xã Ninh Giang	11709	0	\N	\N	\N	\N	\N	ng	117
1170905	Xã Trường Yên	11709	0	\N	\N	\N	\N	\N	ty	117
1170907	Xã Ninh Khang	11709	0	\N	\N	\N	\N	\N	nk	117
1170909	Xã Ninh Mỹ	11709	0	\N	\N	\N	\N	\N	nm	117
1170911	Xã Ninh Hòa	11709	0	\N	\N	\N	\N	\N	nh	117
1170915	Xã Ninh Xuân	11709	0	\N	\N	\N	\N	\N	nx	117
1170917	Xã Ninh Hải	11709	0	\N	\N	\N	\N	\N	nh	117
1060919	Xã Thanh Khương	10609	0	\N	\N	\N	\N	\N	tk	106
2010523	Xã Tát Ngà	20105	0	\N	\N	\N	\N	\N	tn	201
1170927	Xã Ninh Thắng	11709	0	\N	\N	\N	\N	\N	nt	117
1170929	Xã Ninh Vân	11709	0	\N	\N	\N	\N	\N	nv	117
1170931	Xã Ninh An	11709	0	\N	\N	\N	\N	\N	na	117
1171100	Không xác định	11711	0	\N	\N	\N	\N	\N	kx	117
1171101	Thị trấn Yên Thịnh	11711	0	\N	\N	\N	\N	\N	yt	117
1171103	Xã Khánh Thượng	11711	0	\N	\N	\N	\N	\N	kt	117
1171105	Xã Khánh Dương	11711	0	\N	\N	\N	\N	\N	kd	117
1171107	Xã Khánh Thịnh	11711	0	\N	\N	\N	\N	\N	kt	117
1171109	Xã Yên Phong	11711	0	\N	\N	\N	\N	\N	yp	117
1171111	Xã Yên Phú	11711	0	\N	\N	\N	\N	\N	yp	117
1171113	Xã Yên Hòa	11711	0	\N	\N	\N	\N	\N	yh	117
1171115	Xã Yên Thắng	11711	0	\N	\N	\N	\N	\N	yt	117
1171117	Xã Yên Từ	11711	0	\N	\N	\N	\N	\N	yt	117
1171119	Xã Yên Mỹ	11711	0	\N	\N	\N	\N	\N	ym	117
1171121	Xã Yên Nhân	11711	0	\N	\N	\N	\N	\N	yn	117
1171123	Xã Yên Thành	11711	0	\N	\N	\N	\N	\N	yt	117
1171125	Xã Yên Mạc	11711	0	\N	\N	\N	\N	\N	ym	117
1171127	Xã Yên Đồng	11711	0	\N	\N	\N	\N	\N	yd	117
1171129	Xã Yên Thái	11711	0	\N	\N	\N	\N	\N	yt	117
1171131	Xã Yên Lâm	11711	0	\N	\N	\N	\N	\N	yl	117
1171300	Không xác định	11713	0	\N	\N	\N	\N	\N	kx	117
1171301	Thị trấn Yên Ninh	11713	0	\N	\N	\N	\N	\N	yn	117
1171303	Xã Khánh Tiên	11713	0	\N	\N	\N	\N	\N	kt	117
1171305	Xã Khánh Phú	11713	0	\N	\N	\N	\N	\N	kp	117
1171307	Xã Khánh Hòa	11713	0	\N	\N	\N	\N	\N	kh	117
1171309	Xã Khánh An	11713	0	\N	\N	\N	\N	\N	ka	117
1171311	Xã Khánh Lợi	11713	0	\N	\N	\N	\N	\N	kl	117
1171313	Xã Khánh Thiện	11713	0	\N	\N	\N	\N	\N	kt	117
1171315	Xã Khánh Cường	11713	0	\N	\N	\N	\N	\N	kc	117
1171317	Xã Khánh Trung	11713	0	\N	\N	\N	\N	\N	kt	117
1171319	Xã Khánh Cư	11713	0	\N	\N	\N	\N	\N	kc	117
1171321	Xã Khánh Hải	11713	0	\N	\N	\N	\N	\N	kh	117
1171323	Xã Khánh Mậu	11713	0	\N	\N	\N	\N	\N	km	117
1171325	Xã Khánh Vân	11713	0	\N	\N	\N	\N	\N	kv	117
1171327	Xã Khánh Ninh	11713	0	\N	\N	\N	\N	\N	kn	117
1171329	Xã Khánh Hội	11713	0	\N	\N	\N	\N	\N	kh	117
1171331	Xã Khánh Nhạc	11713	0	\N	\N	\N	\N	\N	kn	117
1171333	Xã Khánh Công	11713	0	\N	\N	\N	\N	\N	kc	117
1171335	Xã Khánh Thành	11713	0	\N	\N	\N	\N	\N	kt	117
1171337	Xã Khánh Thủy	11713	0	\N	\N	\N	\N	\N	kt	117
1171339	Xã Khánh Hồng	11713	0	\N	\N	\N	\N	\N	kh	117
1171500	Không xác định	11715	0	\N	\N	\N	\N	\N	kx	117
1171501	Thị trấn Phát Diệm	11715	0	\N	\N	\N	\N	\N	pd	117
1171503	Thị trấn Bình Minh	11715	0	\N	\N	\N	\N	\N	bm	117
1171505	Xã Xuân Thiện	11715	0	\N	\N	\N	\N	\N	xt	117
1171507	Xã Chính Tâm	11715	0	\N	\N	\N	\N	\N	ct	117
1171509	Xã Hồi Ninh	11715	0	\N	\N	\N	\N	\N	hn	117
1171511	Xã Chất Bình	11715	0	\N	\N	\N	\N	\N	cb	117
1171513	Xã Kim Định	11715	0	\N	\N	\N	\N	\N	kd	117
1171515	Xã Ân Hòa	11715	0	\N	\N	\N	\N	\N	ah	117
1171517	Xã Hùng Tiến	11715	0	\N	\N	\N	\N	\N	ht	117
1171519	Xã Như Hòa	11715	0	\N	\N	\N	\N	\N	nh	117
1171521	Xã Quang Thiện	11715	0	\N	\N	\N	\N	\N	qt	117
1171523	Xã Yên Mật	11715	0	\N	\N	\N	\N	\N	ym	117
1171525	Xã Đồng Hướng	11715	0	\N	\N	\N	\N	\N	dh	117
1171527	Xã Kim Chính	11715	0	\N	\N	\N	\N	\N	kc	117
1171529	Xã Thượng Kiệm	11715	0	\N	\N	\N	\N	\N	tk	117
1171531	Xã Lưu Phương	11715	0	\N	\N	\N	\N	\N	lp	117
1171533	Xã Tân Thành	11715	0	\N	\N	\N	\N	\N	tt	117
1171535	Xã Yên Lộc	11715	0	\N	\N	\N	\N	\N	yl	117
1171537	Xã Lai Thành	11715	0	\N	\N	\N	\N	\N	lt	117
1171539	Xã Định Hóa	11715	0	\N	\N	\N	\N	\N	dh	117
1171541	Xã Văn Hải	11715	0	\N	\N	\N	\N	\N	vh	117
1171543	Xã Kim Tân	11715	0	\N	\N	\N	\N	\N	kt	117
1171545	Xã Kim Mỹ	11715	0	\N	\N	\N	\N	\N	km	117
1171547	Xã Cồn Thoi	11715	0	\N	\N	\N	\N	\N	ct	117
1171549	Xã Kim Hải	11715	0	\N	\N	\N	\N	\N	kh	117
1171551	Xã Kim Trung	11715	0	\N	\N	\N	\N	\N	kt	117
1171553	Xã Kim Đông	11715	0	\N	\N	\N	\N	\N	kd	117
2010000	Không xác định	20100	0	\N	\N	\N	\N	\N	kx	201
2010100	Không xác định	20101	0	\N	\N	\N	\N	\N	kx	201
2010101	Phường Trần Phú	20101	0	\N	\N	\N	\N	\N	tp	201
2010103	Phường Quang Trung	20101	0	\N	\N	\N	\N	\N	qt	201
2010105	Phường Nguyễn Trãi	20101	0	\N	\N	\N	\N	\N	nt	201
2010107	Phường Minh Khai	20101	0	\N	\N	\N	\N	\N	mk	201
2010109	Xã Ngọc Đường	20101	0	\N	\N	\N	\N	\N	nd	201
2010111	Xã Kim Thạch	20101	0	\N	\N	\N	\N	\N	kt	201
2010113	Xã Phú Linh	20101	0	\N	\N	\N	\N	\N	pl	201
2010115	Xã Kim Linh	20101	0	\N	\N	\N	\N	\N	kl	201
2010133	Thị trấn Yên Minh	20101	0	\N	\N	\N	\N	\N	ym	201
2010300	Không xác định	20103	0	\N	\N	\N	\N	\N	kx	201
2010301	Thị trấn Phó Bảng	20103	0	\N	\N	\N	\N	\N	pb	201
2010303	Xã Đồng Văn	20103	0	\N	\N	\N	\N	\N	dv	201
2010305	Xã Lũng Cú	20103	0	\N	\N	\N	\N	\N	lc	201
2010307	Xã Má Lé	20103	0	\N	\N	\N	\N	\N	ml	201
2010309	Xã Lũng Táo	20103	0	\N	\N	\N	\N	\N	lt	201
2010311	Xã Thài Phìn Tủng	20103	0	\N	\N	\N	\N	\N	tpt	201
2010313	Xã Phố Là	20103	0	\N	\N	\N	\N	\N	pl	201
2010315	Xã Xà Phìn	20103	0	\N	\N	\N	\N	\N	xp	201
2010317	Xã Sủng Là	20103	0	\N	\N	\N	\N	\N	sl	201
2010319	Xã Tả Phìn	20103	0	\N	\N	\N	\N	\N	tp	201
2010321	Xã Sính Lủng	20103	0	\N	\N	\N	\N	\N	sl	201
2010323	Xã Tả Lủng	20103	0	\N	\N	\N	\N	\N	tl	201
2010325	Xã Phố Cáo	20103	0	\N	\N	\N	\N	\N	pc	201
2010327	Xã Sảng Tủng	20103	0	\N	\N	\N	\N	\N	st	201
2010329	Xã Lũng Thầu	20103	0	\N	\N	\N	\N	\N	lt	201
2010331	Xã Hố Quáng Phìn	20103	0	\N	\N	\N	\N	\N	hqp	201
2010333	Xã Vần Chải	20103	0	\N	\N	\N	\N	\N	vc	201
2010335	Xã Lũng Phìn	20103	0	\N	\N	\N	\N	\N	lp	201
2010337	Xã Sủng Trái	20103	0	\N	\N	\N	\N	\N	st	201
2010500	Không xác định	20105	0	\N	\N	\N	\N	\N	kx	201
2010501	Xã Mèo Vạc	20105	0	\N	\N	\N	\N	\N	mv	201
2010503	Xã Thượng Phùng	20105	0	\N	\N	\N	\N	\N	tp	201
2010505	Xã Pải Lủng	20105	0	\N	\N	\N	\N	\N	pl	201
2010507	Xã Pả Vi	20105	0	\N	\N	\N	\N	\N	pv	201
2010509	Xã Xín Cái	20105	0	\N	\N	\N	\N	\N	xc	201
2010511	Xã Sủng Chà	20105	0	\N	\N	\N	\N	\N	sc	201
2010513	Xã Giàng Chu Phìn	20105	0	\N	\N	\N	\N	\N	gcp	201
2010515	Xã Sủng Máng	20105	0	\N	\N	\N	\N	\N	sm	201
2010517	Xã Cán Chu Phìn	20105	0	\N	\N	\N	\N	\N	ccp	201
2010519	Xã Sơn Vĩ	20105	0	\N	\N	\N	\N	\N	sv	201
2010521	Xã Lũng Chinh	20105	0	\N	\N	\N	\N	\N	lc	201
2010525	Xã Lũng Pù	20105	0	\N	\N	\N	\N	\N	lp	201
2010527	Xã Nậm Ban	20105	0	\N	\N	\N	\N	\N	nb	201
2010529	Xã Khâu Vai	20105	0	\N	\N	\N	\N	\N	kv	201
2010531	Xã Niêm Sơn	20105	0	\N	\N	\N	\N	\N	ns	201
2010700	Không xác định	20107	0	\N	\N	\N	\N	\N	kx	201
2010701	Xã Yên Minh	20107	0	\N	\N	\N	\N	\N	ym	201
2010703	Xã Phú Lũng	20107	0	\N	\N	\N	\N	\N	pl	201
2010705	Xã Thắng Mố	20107	0	\N	\N	\N	\N	\N	tm	201
2010707	Xã Bạch Đích	20107	0	\N	\N	\N	\N	\N	bd	201
2010709	Xã Sủng Tráng	20107	0	\N	\N	\N	\N	\N	st	201
2010711	Xã Sủng Thài	20107	0	\N	\N	\N	\N	\N	st	201
2010713	Xã Na Khê	20107	0	\N	\N	\N	\N	\N	nk	201
2010715	Xã Lao Và Chải	20107	0	\N	\N	\N	\N	\N	lvc	201
2010717	Xã Mậu Duệ	20107	0	\N	\N	\N	\N	\N	md	201
2010719	Xã Ngam La	20107	0	\N	\N	\N	\N	\N	nl	201
2010721	Xã Mậu Long	20107	0	\N	\N	\N	\N	\N	ml	201
2010723	Xã Ngọc Long	20107	0	\N	\N	\N	\N	\N	nl	201
2010725	Xã Đường Thượng	20107	0	\N	\N	\N	\N	\N	dt	201
2010727	Xã Lũng Hồ	20107	0	\N	\N	\N	\N	\N	lh	201
2010729	Xã Du Tiến	20107	0	\N	\N	\N	\N	\N	dt	201
2010731	Xã Du Già	20107	0	\N	\N	\N	\N	\N	dg	201
2010735	Xã Hữu Vinh	20107	0	\N	\N	\N	\N	\N	hv	201
2010900	Không xác định	20109	0	\N	\N	\N	\N	\N	kx	201
2010901	Xã Quản Bạ	20109	0	\N	\N	\N	\N	\N	qb	201
2010903	Xã Bát Đại Sơn	20109	0	\N	\N	\N	\N	\N	bds	201
2010905	Xã Nghĩa Thuận	20109	0	\N	\N	\N	\N	\N	nt	201
2010907	Xã Cán Tỷ	20109	0	\N	\N	\N	\N	\N	ct	201
2010909	Xã Cao Mã Pờ	20109	0	\N	\N	\N	\N	\N	cmp	201
2010911	Xã Thanh Vân	20109	0	\N	\N	\N	\N	\N	tv	201
2010913	Xã Tùng Vài	20109	0	\N	\N	\N	\N	\N	tv	201
2010915	Xã Đông Hà	20109	0	\N	\N	\N	\N	\N	dh	201
2010917	Xã Lùng Tám	20109	0	\N	\N	\N	\N	\N	lt	201
2010919	Xã Quyết Tiến	20109	0	\N	\N	\N	\N	\N	qt	201
2010921	Xã Tả Ván	20109	0	\N	\N	\N	\N	\N	tv	201
2010923	Xã Thái An	20109	0	\N	\N	\N	\N	\N	ta	201
2010925	Thị trấn Tam Sơn	20109	0	\N	\N	\N	\N	\N	ts	201
2011100	Không xác định	20111	0	\N	\N	\N	\N	\N	kx	201
2011101	Xã Yên Phú	20111	0	\N	\N	\N	\N	\N	yp	201
2011103	Xã Minh Sơn	20111	0	\N	\N	\N	\N	\N	ms	201
2011105	Xã Giáp Trung	20111	0	\N	\N	\N	\N	\N	gt	201
2011107	Xã Yên Phong	20111	0	\N	\N	\N	\N	\N	yp	201
2011109	Xã Yên Định	20111	0	\N	\N	\N	\N	\N	yd	201
2011111	Xã Lạc Nông	20111	0	\N	\N	\N	\N	\N	ln	201
2011113	Xã Phú Nam	20111	0	\N	\N	\N	\N	\N	pn	201
2011115	Xã Minh Ngọc	20111	0	\N	\N	\N	\N	\N	mn	201
2011117	Xã Thượng Tân	20111	0	\N	\N	\N	\N	\N	tt	201
2011119	Xã Yên Cường	20111	0	\N	\N	\N	\N	\N	yc	201
2011121	Xã Đường Hồng	20111	0	\N	\N	\N	\N	\N	dh	201
2011123	Xã Đường Âm	20111	0	\N	\N	\N	\N	\N	da	201
2011125	Xã Phiêng Luông	20111	0	\N	\N	\N	\N	\N	pl	201
2011300	Không xác định	20113	0	\N	\N	\N	\N	\N	kx	201
2011301	Xã Vinh Quang	20113	0	\N	\N	\N	\N	\N	vq	201
2011303	Xã Bản Máy	20113	0	\N	\N	\N	\N	\N	bm	201
2011305	Xã Thàng Tín	20113	0	\N	\N	\N	\N	\N	tt	201
2011307	Xã Thèn Chu Phìn	20113	0	\N	\N	\N	\N	\N	tcp	201
2011309	Xã Bản Phùng	20113	0	\N	\N	\N	\N	\N	bp	201
2011311	Xã Chiến Phố	20113	0	\N	\N	\N	\N	\N	cp	201
2011313	Xã Đản Ván	20113	0	\N	\N	\N	\N	\N	dv	201
2011315	Xã Pố Lồ	20113	0	\N	\N	\N	\N	\N	pl	201
2011317	Xã Túng Sán	20113	0	\N	\N	\N	\N	\N	ts	201
2011319	Xã Tụ Nhân	20113	0	\N	\N	\N	\N	\N	tn	201
2011321	Xã Tân Tiến	20113	0	\N	\N	\N	\N	\N	tt	201
2011323	Xã Pờ Ly Ngài	20113	0	\N	\N	\N	\N	\N	pln	201
2011325	Xã Ngàm Đăng Vài	20113	0	\N	\N	\N	\N	\N	ndv	201
2011327	Xã Bản Nhùng	20113	0	\N	\N	\N	\N	\N	bn	201
2011329	Xã Nàng Đôn	20113	0	\N	\N	\N	\N	\N	nd	201
2011331	Xã Sán Xả Hồ	20113	0	\N	\N	\N	\N	\N	sxh	201
2011333	Xã Bản Luốc	20113	0	\N	\N	\N	\N	\N	bl	201
2011335	Xã Tả Sử Choóng	20113	0	\N	\N	\N	\N	\N	tsc	201
2011337	Xã Bản Péo	20113	0	\N	\N	\N	\N	\N	bp	201
2011339	Xã Nậm Dịch	20113	0	\N	\N	\N	\N	\N	nd	201
2011341	Xã Hồ Thầu	20113	0	\N	\N	\N	\N	\N	ht	201
2011343	Xã Nam Sơn	20113	0	\N	\N	\N	\N	\N	ns	201
2011345	Xã Thông Nguyên	20113	0	\N	\N	\N	\N	\N	tn	201
2011347	Xã Nậm Tỵ	20113	0	\N	\N	\N	\N	\N	nt	201
2011349	Xã Nậm Khòa	20113	0	\N	\N	\N	\N	\N	nk	201
2011351	Xã Tiên Nguyên	20113	0	\N	\N	\N	\N	\N	tn	201
2011353	Xã Xuân Minh	20113	0	\N	\N	\N	\N	\N	xm	201
2011500	Không xác định	20115	0	\N	\N	\N	\N	\N	kx	201
2011501	Thị trấn Vị Xuyên	20115	0	\N	\N	\N	\N	\N	vx	201
2011503	Thị trấn NT Việt Lâm	20115	0	\N	\N	\N	\N	\N	nvl	201
2011505	Xã Minh Tân	20115	0	\N	\N	\N	\N	\N	mt	201
2011507	Xã Thuận Hoà	20115	0	\N	\N	\N	\N	\N	th	201
2011509	Xã Thanh Thủy	20115	0	\N	\N	\N	\N	\N	tt	201
2011511	Xã Thanh Đức	20115	0	\N	\N	\N	\N	\N	td	201
2011513	Xã Tùng Bá	20115	0	\N	\N	\N	\N	\N	tb	201
2011515	Xã Phong Quang	20115	0	\N	\N	\N	\N	\N	pq	201
2011517	Xã Xín Chải	20115	0	\N	\N	\N	\N	\N	xc	201
2011519	Xã Phương Tiến	20115	0	\N	\N	\N	\N	\N	pt	201
2011521	Xã Lao Chải	20115	0	\N	\N	\N	\N	\N	lc	201
2011523	Xã Phương Độ	20115	0	\N	\N	\N	\N	\N	pd	201
2011525	Xã Phương Thiện	20115	0	\N	\N	\N	\N	\N	pt	201
2011527	Xã Cao Bồ	20115	0	\N	\N	\N	\N	\N	cb	201
2011529	Xã Đạo Đức	20115	0	\N	\N	\N	\N	\N	dd	201
2011531	Xã Linh Hồ	20115	0	\N	\N	\N	\N	\N	lh	201
2011533	Xã Thượng Sơn	20115	0	\N	\N	\N	\N	\N	ts	201
2011535	Xã Ngọc Linh	20115	0	\N	\N	\N	\N	\N	nl	201
2011537	Xã Việt Lâm	20115	0	\N	\N	\N	\N	\N	vl	201
2011539	Xã Ngọc Minh	20115	0	\N	\N	\N	\N	\N	nm	201
2011541	Xã Trung Thành	20115	0	\N	\N	\N	\N	\N	tt	201
2011543	Xã Quảng Ngần	20115	0	\N	\N	\N	\N	\N	qn	201
2011545	Xã Bạch Ngọc	20115	0	\N	\N	\N	\N	\N	bn	201
2011700	Không xác định	20117	0	\N	\N	\N	\N	\N	kx	201
2011701	Xã Cốc Pài	20117	0	\N	\N	\N	\N	\N	cp	201
2011703	Xã Nàn Xỉn	20117	0	\N	\N	\N	\N	\N	nx	201
2011705	Xã Bản Díu	20117	0	\N	\N	\N	\N	\N	bd	201
2011707	Xã Chí Cà	20117	0	\N	\N	\N	\N	\N	cc	201
2011709	Xã Xín Mần	20117	0	\N	\N	\N	\N	\N	xm	201
2011711	Xã Trung Thịnh	20117	0	\N	\N	\N	\N	\N	tt	201
2011713	Xã Thèn Phàng	20117	0	\N	\N	\N	\N	\N	tp	201
2011715	Xã Ngán Chiên	20117	0	\N	\N	\N	\N	\N	nc	201
2011717	Xã Pà Vầy Sủ	20117	0	\N	\N	\N	\N	\N	pvs	201
2011719	Xã Cốc Rế	20117	0	\N	\N	\N	\N	\N	cr	201
2011721	Xã Thu Tà	20117	0	\N	\N	\N	\N	\N	tt	201
2011723	Xã Nàn Ma	20117	0	\N	\N	\N	\N	\N	nm	201
2011725	Xã Tả Nhìu	20117	0	\N	\N	\N	\N	\N	tn	201
2011727	Xã Bản Ngò	20117	0	\N	\N	\N	\N	\N	bn	201
2011729	Xã Chế Là	20117	0	\N	\N	\N	\N	\N	cl	201
2011731	Xã Nấm Dẩn	20117	0	\N	\N	\N	\N	\N	nd	201
2011733	Xã Quảng Nguyên	20117	0	\N	\N	\N	\N	\N	qn	201
2011735	Xã Nà Chì	20117	0	\N	\N	\N	\N	\N	nc	201
2011737	Xã Khuôn Lùng	20117	0	\N	\N	\N	\N	\N	kl	201
2011739	Xã Tân Nam	20117	0	\N	\N	\N	\N	\N	tn	201
2011900	Không xác định	20119	0	\N	\N	\N	\N	\N	kx	201
2011901	Thị trấn Việt Quang	20119	0	\N	\N	\N	\N	\N	vq	201
2011903	Thị trấn Vĩnh Tuy	20119	0	\N	\N	\N	\N	\N	vt	201
2011905	Xã Tân Lập	20119	0	\N	\N	\N	\N	\N	tl	201
2011907	Xã Tân Thành	20119	0	\N	\N	\N	\N	\N	tt	201
2011909	Xã Đồng Tâm	20119	0	\N	\N	\N	\N	\N	dt	201
2011911	Xã Thượng Bình	20119	0	\N	\N	\N	\N	\N	tb	201
2011913	Xã Tân Quang	20119	0	\N	\N	\N	\N	\N	tq	201
2011915	Xã Việt Vinh	20119	0	\N	\N	\N	\N	\N	vv	201
2011917	Xã Bằng Hành	20119	0	\N	\N	\N	\N	\N	bh	201
2011919	Xã Kim Ngọc	20119	0	\N	\N	\N	\N	\N	kn	201
2011921	Xã Bản Rịa	20119	0	\N	\N	\N	\N	\N	br	201
2011923	Xã Yên Bình	20119	0	\N	\N	\N	\N	\N	yb	201
2011925	Xã Hữu Sản	20119	0	\N	\N	\N	\N	\N	hs	201
2011927	Xã Tân Trịnh	20119	0	\N	\N	\N	\N	\N	tt	201
2011929	Xã Quang Minh	20119	0	\N	\N	\N	\N	\N	qm	201
2011931	Xã Liên Hiệp	20119	0	\N	\N	\N	\N	\N	lh	201
2011933	Xã Vô Điếm	20119	0	\N	\N	\N	\N	\N	vd	201
2011935	Xã Việt Hồng	20119	0	\N	\N	\N	\N	\N	vh	201
2011937	Xã Bằng Lang	20119	0	\N	\N	\N	\N	\N	bl	201
2011939	Xã Yên Hà	20119	0	\N	\N	\N	\N	\N	yh	201
2011941	Xã Hùng An	20119	0	\N	\N	\N	\N	\N	ha	201
2011943	Xã Đức Xuân	20119	0	\N	\N	\N	\N	\N	dx	201
2011945	Xã Hương Sơn	20119	0	\N	\N	\N	\N	\N	hs	201
2011947	Xã Xuân Giang	20119	0	\N	\N	\N	\N	\N	xg	201
2011949	Xã Tiên Kiều	20119	0	\N	\N	\N	\N	\N	tk	201
2011951	Xã Tiên Yên	20119	0	\N	\N	\N	\N	\N	ty	201
2011953	Xã Vĩnh Hảo	20119	0	\N	\N	\N	\N	\N	vh	201
2011955	Xã Nà Khương	20119	0	\N	\N	\N	\N	\N	nk	201
2011957	Xã Vĩnh Phúc	20119	0	\N	\N	\N	\N	\N	vp	201
2011959	Xã Vĩ Thượng	20119	0	\N	\N	\N	\N	\N	vt	201
2011961	Xã Đồng Yên	20119	0	\N	\N	\N	\N	\N	dy	201
2011963	Xã Đồng Tiến	20119	0	\N	\N	\N	\N	\N	dt	201
2011965	Xã Yên Thành	20119	0	\N	\N	\N	\N	\N	yt	201
2030000	Không xác định	20300	0	\N	\N	\N	\N	\N	kx	203
2030100	Không xác định	20301	0	\N	\N	\N	\N	\N	kx	203
2030101	Phường Hợp Giang	20301	0	\N	\N	\N	\N	\N	hg	203
2030103	Phường Tân Giang	20301	0	\N	\N	\N	\N	\N	tg	203
2030105	Phường Sông Hiến	20301	0	\N	\N	\N	\N	\N	sh	203
2030107	Phường Sông Bằng	20301	0	\N	\N	\N	\N	\N	sb	203
2030109	Xã Ngọc Xuân	20301	0	\N	\N	\N	\N	\N	nx	203
2030111	Xã Hoà Chung	20301	0	\N	\N	\N	\N	\N	hc	203
2030113	Xã Duyệt Trung	20301	0	\N	\N	\N	\N	\N	dt	203
2030300	Không xác định	20303	0	\N	\N	\N	\N	\N	kx	203
2030301	Thị trấn Bảo Lạc	20303	0	\N	\N	\N	\N	\N	bl	203
2030303	Xã Đức Hạnh	20303	0	\N	\N	\N	\N	\N	dh	203
2030305	Xã Cốc Pàng	20303	0	\N	\N	\N	\N	\N	cp	203
2030307	Xã Thượng Hà	20303	0	\N	\N	\N	\N	\N	th	203
2030309	Xã Cô Ba	20303	0	\N	\N	\N	\N	\N	cb	203
2030311	Xã Khánh Xuân	20303	0	\N	\N	\N	\N	\N	kx	203
2030313	Xã Xuân Trường	20303	0	\N	\N	\N	\N	\N	xt	203
2030315	Xã Lý Bôn	20303	0	\N	\N	\N	\N	\N	lb	203
2030317	Xã Bảo Toàn	20303	0	\N	\N	\N	\N	\N	bt	203
2030319	Xã Vĩnh Quang	20303	0	\N	\N	\N	\N	\N	vq	203
2030321	Xã Hồng Trị	20303	0	\N	\N	\N	\N	\N	ht	203
2030323	Xã Phan Thanh	20303	0	\N	\N	\N	\N	\N	pt	203
2030325	Xã Hồng An	20303	0	\N	\N	\N	\N	\N	ha	203
2030327	Xã Nam Quang	20303	0	\N	\N	\N	\N	\N	nq	203
2030329	Xã Quảng Lâm	20303	0	\N	\N	\N	\N	\N	ql	203
2030331	Xã Tân Việt	20303	0	\N	\N	\N	\N	\N	tv	203
2030333	Xã Mông Ân	20303	0	\N	\N	\N	\N	\N	ma	203
2030335	Xã Vĩnh Phong	20303	0	\N	\N	\N	\N	\N	vp	203
2030337	Xã Hưng Đạo	20303	0	\N	\N	\N	\N	\N	hd	203
2030339	Xã Huy Giáp	20303	0	\N	\N	\N	\N	\N	hg	203
2030341	Xã Thái Học	20303	0	\N	\N	\N	\N	\N	th	203
2030343	Xã Sơn Lộ	20303	0	\N	\N	\N	\N	\N	sl	203
2030345	Xã Đình Phùng	20303	0	\N	\N	\N	\N	\N	dp	203
2030347	Xã Yên Thổ	20303	0	\N	\N	\N	\N	\N	yt	203
2030500	Không xác định	20305	0	\N	\N	\N	\N	\N	kx	203
2030501	Xã Xuân Hoà	20305	0	\N	\N	\N	\N	\N	xh	203
2030503	Xã Trường Hà	20305	0	\N	\N	\N	\N	\N	th	203
2030505	Xã Kéo Yên	20305	0	\N	\N	\N	\N	\N	ky	203
2030507	Xã Lũng Nặm	20305	0	\N	\N	\N	\N	\N	ln	203
2030509	Xã Vân An	20305	0	\N	\N	\N	\N	\N	va	203
2030511	Xã Cải Viên	20305	0	\N	\N	\N	\N	\N	cv	203
2030513	Xã Nà Sác	20305	0	\N	\N	\N	\N	\N	ns	203
2030515	Xã Nội Thôn	20305	0	\N	\N	\N	\N	\N	nt	203
2030517	Xã Sóc Hà	20305	0	\N	\N	\N	\N	\N	sh	203
2030519	Xã Thượng Thôn	20305	0	\N	\N	\N	\N	\N	tt	203
2030521	Xã Tổng Cọt	20305	0	\N	\N	\N	\N	\N	tc	203
2030523	Xã Quý Quân	20305	0	\N	\N	\N	\N	\N	qq	203
2030525	Xã Hồng Sĩ	20305	0	\N	\N	\N	\N	\N	hs	203
2030527	Xã Sĩ Hai	20305	0	\N	\N	\N	\N	\N	sh	203
2030529	Xã Đào Ngạn	20305	0	\N	\N	\N	\N	\N	dn	203
2030531	Xã Phù Ngọc	20305	0	\N	\N	\N	\N	\N	pn	203
2030533	Xã Mã Ba	20305	0	\N	\N	\N	\N	\N	mb	203
2030535	Xã Hạ Thôn	20305	0	\N	\N	\N	\N	\N	ht	203
2030700	Không xác định	20307	0	\N	\N	\N	\N	\N	kx	203
2030701	Xã Đa Thông	20307	0	\N	\N	\N	\N	\N	dt	203
2030703	Xã Cần Yên	20307	0	\N	\N	\N	\N	\N	cy	203
2030705	Xã Vị Quang	20307	0	\N	\N	\N	\N	\N	vq	203
2030707	Xã Lương Thông	20307	0	\N	\N	\N	\N	\N	lt	203
2030709	Xã Ngọc Động	20307	0	\N	\N	\N	\N	\N	nd	203
2030711	Xã Yên Sơn	20307	0	\N	\N	\N	\N	\N	ys	203
2030713	Xã Lương Can	20307	0	\N	\N	\N	\N	\N	lc	203
2030715	Xã Thanh Long	20307	0	\N	\N	\N	\N	\N	tl	203
2030717	Xã Bình Lãng	20307	0	\N	\N	\N	\N	\N	bl	203
2030900	Không xác định	20309	0	\N	\N	\N	\N	\N	kx	203
2030901	Xã Hùng Quốc	20309	0	\N	\N	\N	\N	\N	hq	203
2030903	Xã Cô Mười	20309	0	\N	\N	\N	\N	\N	cm	203
2030905	Xã Tri Phương	20309	0	\N	\N	\N	\N	\N	tp	203
2030907	Xã Quang Hán	20309	0	\N	\N	\N	\N	\N	qh	203
2030909	Xã Quang Vinh	20309	0	\N	\N	\N	\N	\N	qv	203
2030911	Xã Quang Trung	20309	0	\N	\N	\N	\N	\N	qt	203
2030913	Xã Lưu Ngọc	20309	0	\N	\N	\N	\N	\N	ln	203
2030915	Xã Xuân Nội	20309	0	\N	\N	\N	\N	\N	xn	203
2030917	Xã Cao Chương	20309	0	\N	\N	\N	\N	\N	cc	203
2030919	Xã Quốc Toản	20309	0	\N	\N	\N	\N	\N	qt	203
2031100	Không xác định	20311	0	\N	\N	\N	\N	\N	kx	203
2031101	Thị trấn Trùng Khánh	20311	0	\N	\N	\N	\N	\N	tk	203
2031103	Xã Lăng Yên	20311	0	\N	\N	\N	\N	\N	ly	203
2031105	Xã Ngọc Chung	20311	0	\N	\N	\N	\N	\N	nc	203
2031107	Xã Phong Nậm	20311	0	\N	\N	\N	\N	\N	pn	203
2031109	Xã Ngọc Khê	20311	0	\N	\N	\N	\N	\N	nk	203
2031111	Xã Đình Phong	20311	0	\N	\N	\N	\N	\N	dp	203
2031113	Xã Chí Viễn	20311	0	\N	\N	\N	\N	\N	cv	203
2031115	Xã Đàm Thuỷ	20311	0	\N	\N	\N	\N	\N	dt	203
2031117	Xã Lăng Hiếu	20311	0	\N	\N	\N	\N	\N	lh	203
2031119	Xã Khâm Thành	20311	0	\N	\N	\N	\N	\N	kt	203
2031121	Xã Đình Minh	20311	0	\N	\N	\N	\N	\N	dm	203
2031123	Xã Phong Châu	20311	0	\N	\N	\N	\N	\N	pc	203
2031125	Xã Cảnh Tiên	20311	0	\N	\N	\N	\N	\N	ct	203
2031127	Xã Trung Phúc	20311	0	\N	\N	\N	\N	\N	tp	203
2031129	Xã Đức Hồng	20311	0	\N	\N	\N	\N	\N	dh	203
2031131	Xã Cao Thăng	20311	0	\N	\N	\N	\N	\N	ct	203
2031133	Xã Thông Hoè	20311	0	\N	\N	\N	\N	\N	th	203
2031135	Xã Đoài Côn	20311	0	\N	\N	\N	\N	\N	dc	203
2031137	Xã Thân Giáp	20311	0	\N	\N	\N	\N	\N	tg	203
2031300	Không xác định	20313	0	\N	\N	\N	\N	\N	kx	203
2031301	Thị trấn Nguyên Bình	20313	0	\N	\N	\N	\N	\N	nb	203
2031303	Thị trấn Tĩnh Túc	20313	0	\N	\N	\N	\N	\N	tt	203
2031305	Xã Yên Lạc	20313	0	\N	\N	\N	\N	\N	yl	203
2031307	Xã Ca Thành	20313	0	\N	\N	\N	\N	\N	ct	203
2031309	Xã Triệu Nguyên	20313	0	\N	\N	\N	\N	\N	tn	203
2031311	Xã Vũ Nông	20313	0	\N	\N	\N	\N	\N	vn	203
2031313	Xã Thái Học	20313	0	\N	\N	\N	\N	\N	th	203
2031315	Xã Thể Dục	20313	0	\N	\N	\N	\N	\N	td	203
2031317	Xã Bắc Hợp	20313	0	\N	\N	\N	\N	\N	bh	203
2031319	Xã Minh Tâm	20313	0	\N	\N	\N	\N	\N	mt	203
2031321	Xã Minh Thanh	20313	0	\N	\N	\N	\N	\N	mt	203
2031323	Xã Lang Môn	20313	0	\N	\N	\N	\N	\N	lm	203
2031325	Xã Mai Long	20313	0	\N	\N	\N	\N	\N	ml	203
2031327	Xã Phan Thanh	20313	0	\N	\N	\N	\N	\N	pt	203
2031329	Xã Quang Thành	20313	0	\N	\N	\N	\N	\N	qt	203
2031331	Xã Tam Kim	20313	0	\N	\N	\N	\N	\N	tk	203
2031333	Xã Hoa Thám	20313	0	\N	\N	\N	\N	\N	ht	203
2031335	Xã Thành Công	20313	0	\N	\N	\N	\N	\N	tc	203
2031337	Xã Hưng Đạo	20313	0	\N	\N	\N	\N	\N	hd	203
2031339	Xã Thịnh Vượng	20313	0	\N	\N	\N	\N	\N	tv	203
2031500	Không xác định	20315	0	\N	\N	\N	\N	\N	kx	203
2031501	Thị trấn Nước Hai	20315	0	\N	\N	\N	\N	\N	nh	203
2031503	Xã Dân Chủ	20315	0	\N	\N	\N	\N	\N	dc	203
2031505	Xã Nam Tuấn	20315	0	\N	\N	\N	\N	\N	nt	203
2031507	Xã Đại Tiến	20315	0	\N	\N	\N	\N	\N	dt	203
2031509	Xã Đức Xuân	20315	0	\N	\N	\N	\N	\N	dx	203
2031511	Xã Đức Long	20315	0	\N	\N	\N	\N	\N	dl	203
2031513	Xã Trương Lương	20315	0	\N	\N	\N	\N	\N	tl	203
2031515	Xã Bình Long	20315	0	\N	\N	\N	\N	\N	bl	203
2031517	Xã Bế Triều	20315	0	\N	\N	\N	\N	\N	bt	203
2031519	Xã Ngũ Lão	20315	0	\N	\N	\N	\N	\N	nl	203
2031521	Xã Công Trừng	20315	0	\N	\N	\N	\N	\N	ct	203
2031523	Xã Hồng Việt	20315	0	\N	\N	\N	\N	\N	hv	203
2031525	Xã Vĩnh Quang	20315	0	\N	\N	\N	\N	\N	vq	203
2031527	Xã Nguyễn Huệ	20315	0	\N	\N	\N	\N	\N	nh	203
2031529	Xã Hoàng Tung	20315	0	\N	\N	\N	\N	\N	ht	203
2031531	Xã Hưng Đạo	20315	0	\N	\N	\N	\N	\N	hd	203
2252722	Xã Sông Khoai	22527	0	\N	\N	\N	\N	\N	sk	225
2031535	Xã Quang Trung	20315	0	\N	\N	\N	\N	\N	qt	203
2031537	Xã Trương Vương	20315	0	\N	\N	\N	\N	\N	tv	203
2031539	Xã Bình Dương	20315	0	\N	\N	\N	\N	\N	bd	203
2031541	Xã Bạch Đằng	20315	0	\N	\N	\N	\N	\N	bd	203
2031543	Xã Lê Chung	20315	0	\N	\N	\N	\N	\N	lc	203
2031545	Xã Chu Trinh	20315	0	\N	\N	\N	\N	\N	ct	203
2031547	Xã Hà Trì	20315	0	\N	\N	\N	\N	\N	ht	203
2031549	Xã Hồng Nam	20315	0	\N	\N	\N	\N	\N	hn	203
2031700	Không xác định	20317	0	\N	\N	\N	\N	\N	kx	203
2031701	Thị trấn Quảng Uyên	20317	0	\N	\N	\N	\N	\N	qu	203
2031703	Xã Phi Hải	20317	0	\N	\N	\N	\N	\N	ph	203
2031705	Xã Quảng Hưng	20317	0	\N	\N	\N	\N	\N	qh	203
2031707	Xã Bình Lăng	20317	0	\N	\N	\N	\N	\N	bl	203
2031709	Xã Độc Lập	20317	0	\N	\N	\N	\N	\N	dl	203
2031711	Xã Quốc Phong	20317	0	\N	\N	\N	\N	\N	qp	203
2031713	Xã Quốc Dân	20317	0	\N	\N	\N	\N	\N	qd	203
2031715	Xã Đoài Khôn	20317	0	\N	\N	\N	\N	\N	dk	203
2031717	Xã Phúc Sen	20317	0	\N	\N	\N	\N	\N	ps	203
2031719	Xã Chí Thảo	20317	0	\N	\N	\N	\N	\N	ct	203
2031721	Xã Cai Bộ	20317	0	\N	\N	\N	\N	\N	cb	203
2031723	Xã Tự Do	20317	0	\N	\N	\N	\N	\N	td	203
2031725	Xã Ngọc Động	20317	0	\N	\N	\N	\N	\N	nd	203
2031727	Xã Hồng Định	20317	0	\N	\N	\N	\N	\N	hd	203
2031729	Xã Hồng Quang	20317	0	\N	\N	\N	\N	\N	hq	203
2031731	Xã Hồng Đại	20317	0	\N	\N	\N	\N	\N	hd	203
2031733	Xã Triệu Âủ	20317	0	\N	\N	\N	\N	\N	ta	203
2031735	Xã Hoàng Hải	20317	0	\N	\N	\N	\N	\N	hh	203
2031737	Xã Hạnh Phúc	20317	0	\N	\N	\N	\N	\N	hp	203
2031739	Xã Lương Thiện	20317	0	\N	\N	\N	\N	\N	lt	203
2031741	Xã Cách Linh	20317	0	\N	\N	\N	\N	\N	cl	203
2031743	Xã Đại Sơn	20317	0	\N	\N	\N	\N	\N	ds	203
2031745	Xã Tiên Thành	20317	0	\N	\N	\N	\N	\N	tt	203
2031747	Xã Mỹ Hưng	20317	0	\N	\N	\N	\N	\N	mh	203
2031749	Xã Tà Lùng	20317	0	\N	\N	\N	\N	\N	tl	203
2031900	Không xác định	20319	0	\N	\N	\N	\N	\N	kx	203
2031901	Xã Thanh Nhật	20319	0	\N	\N	\N	\N	\N	tn	203
2031903	Xã Minh Long	20319	0	\N	\N	\N	\N	\N	ml	203
2031905	Xã Thắng Lợi	20319	0	\N	\N	\N	\N	\N	tl	203
2031907	Xã Lý Quốc	20319	0	\N	\N	\N	\N	\N	lq	203
2031909	Xã Đồng Loan	20319	0	\N	\N	\N	\N	\N	dl	203
2031911	Xã Đức Quang	20319	0	\N	\N	\N	\N	\N	dq	203
2031913	Xã Kim Loan	20319	0	\N	\N	\N	\N	\N	kl	203
2031915	Xã An Lạc	20319	0	\N	\N	\N	\N	\N	al	203
2031917	Xã Quang Long	20319	0	\N	\N	\N	\N	\N	ql	203
2031919	Xã Vinh Quý	20319	0	\N	\N	\N	\N	\N	vq	203
2031921	Xã Việt Chu	20319	0	\N	\N	\N	\N	\N	vc	203
2031923	Xã Thái Đức	20319	0	\N	\N	\N	\N	\N	td	203
2031925	Xã Cô Ngân	20319	0	\N	\N	\N	\N	\N	cn	203
2031927	Xã Thị Hoa	20319	0	\N	\N	\N	\N	\N	th	203
2032100	Không xác định	20321	0	\N	\N	\N	\N	\N	kx	203
2032101	Xã Lê Lai	20321	0	\N	\N	\N	\N	\N	ll	203
2032103	Xã Canh Tân	20321	0	\N	\N	\N	\N	\N	ct	203
2032105	Xã Kim Đồng	20321	0	\N	\N	\N	\N	\N	kd	203
2032107	Xã Minh Khai	20321	0	\N	\N	\N	\N	\N	mk	203
2032109	Xã Đức Thông	20321	0	\N	\N	\N	\N	\N	dt	203
2032111	Xã Quang Trọng	20321	0	\N	\N	\N	\N	\N	qt	203
2032113	Xã Thái Cường	20321	0	\N	\N	\N	\N	\N	tc	203
2032115	Xã Vân Trình	20321	0	\N	\N	\N	\N	\N	vt	203
2032117	Xã Thị Ngân	20321	0	\N	\N	\N	\N	\N	tn	203
2032119	Xã Thuỵ Hùng	20321	0	\N	\N	\N	\N	\N	th	203
2032121	Xã Đức Long	20321	0	\N	\N	\N	\N	\N	dl	203
2032123	Xã Trọng Con	20321	0	\N	\N	\N	\N	\N	tc	203
2032125	Xã Thượng Pha	20321	0	\N	\N	\N	\N	\N	tp	203
2032127	Xã Danh Sỹ	20321	0	\N	\N	\N	\N	\N	ds	203
2032129	Xã Lê Lợi	20321	0	\N	\N	\N	\N	\N	ll	203
2032131	Xã Đức Xuân	20321	0	\N	\N	\N	\N	\N	dx	203
2032133	Thị trấn Đông Khê	20321	0	\N	\N	\N	\N	\N	dk	203
2050000	Không xác định	20500	0	\N	\N	\N	\N	\N	kx	205
2050100	Không xác định	20501	0	\N	\N	\N	\N	\N	kx	205
2050101	Phường Duyên Hải	20501	0	\N	\N	\N	\N	\N	dh	205
2050103	Phường Lào Cai	20501	0	\N	\N	\N	\N	\N	lc	205
2050105	Phường Cốc Lếu	20501	0	\N	\N	\N	\N	\N	cl	205
2050107	Phường Phố Mới	20501	0	\N	\N	\N	\N	\N	pm	205
2050109	Phường Kim Tân	20501	0	\N	\N	\N	\N	\N	kt	205
2050111	Xã Vạn Hoà	20501	0	\N	\N	\N	\N	\N	vh	205
2050113	Xã Đồng Tuyển	20501	0	\N	\N	\N	\N	\N	dt	205
2050115	Xã Bắc Cường	20501	0	\N	\N	\N	\N	\N	bc	205
2050300	Không xác định	20503	0	\N	\N	\N	\N	\N	kx	205
2050301	Phường Bắc Lệnh	20503	0	\N	\N	\N	\N	\N	bl	205
2050303	Phường Pom Hán	20503	0	\N	\N	\N	\N	\N	ph	205
2050305	Phường Xuân Tăng	20503	0	\N	\N	\N	\N	\N	xt	205
2050307	Phường Thống Nhất	20503	0	\N	\N	\N	\N	\N	tn	205
2050309	Xã Nam Cường	20503	0	\N	\N	\N	\N	\N	nc	205
2050311	Xã Cam Đường	20503	0	\N	\N	\N	\N	\N	cd	205
2050313	Xã Tả Phời	20503	0	\N	\N	\N	\N	\N	tp	205
2050315	Xã Hợp Thành	20503	0	\N	\N	\N	\N	\N	ht	205
2050500	Không xác định	20505	0	\N	\N	\N	\N	\N	kx	205
2050501	Xã Mường Khương	20505	0	\N	\N	\N	\N	\N	mk	205
2050503	Xã Pha Long	20505	0	\N	\N	\N	\N	\N	pl	205
2050505	Xã Tả Ngải Chồ	20505	0	\N	\N	\N	\N	\N	tnc	205
2050507	Xã Tung Chung Phố	20505	0	\N	\N	\N	\N	\N	tcp	205
2050509	Xã Dìn Chin	20505	0	\N	\N	\N	\N	\N	dc	205
2050511	Xã Tả Gia Khâu	20505	0	\N	\N	\N	\N	\N	tgk	205
2050513	Xã Nậm Chảy	20505	0	\N	\N	\N	\N	\N	nc	205
2050515	Xã Nấm Lư	20505	0	\N	\N	\N	\N	\N	nl	205
2050517	Xã Lùng Khấu Nhin	20505	0	\N	\N	\N	\N	\N	lkn	205
2050519	Xã Thanh Bình	20505	0	\N	\N	\N	\N	\N	tb	205
2050521	Xã Cao Sơn	20505	0	\N	\N	\N	\N	\N	cs	205
2050523	Xã Lùng Vai	20505	0	\N	\N	\N	\N	\N	lv	205
2050525	Xã Bản Lầu	20505	0	\N	\N	\N	\N	\N	bl	205
2050527	Xã La Pan Tẩn	20505	0	\N	\N	\N	\N	\N	lpt	205
2050529	Xã Tả Thàng	20505	0	\N	\N	\N	\N	\N	tt	205
2050531	Xã Bản Sen	20505	0	\N	\N	\N	\N	\N	bs	205
2050700	Không xác định	20507	0	\N	\N	\N	\N	\N	kx	205
2050701	Thị trấn Bát Xát	20507	0	\N	\N	\N	\N	\N	bx	205
2050703	Xã A Mú Sung	20507	0	\N	\N	\N	\N	\N	ams	205
2050705	Xã Nậm Chạc	20507	0	\N	\N	\N	\N	\N	nc	205
2050707	Xã A Lù	20507	0	\N	\N	\N	\N	\N	al	205
2050709	Xã Trịnh Tường	20507	0	\N	\N	\N	\N	\N	tt	205
2050711	Xã Ngải Thầu	20507	0	\N	\N	\N	\N	\N	nt	205
2050713	Xã Y Tý	20507	0	\N	\N	\N	\N	\N	yt	205
2050715	Xã Cốc Mỳ	20507	0	\N	\N	\N	\N	\N	cm	205
2050717	Xã Dền Sáng	20507	0	\N	\N	\N	\N	\N	ds	205
2050719	Xã Dền Thàng	20507	0	\N	\N	\N	\N	\N	dt	205
2050721	Xã Sàng Ma Sáo	20507	0	\N	\N	\N	\N	\N	sms	205
2050723	Xã Bản Vược	20507	0	\N	\N	\N	\N	\N	bv	205
2050725	Xã Mường Vi	20507	0	\N	\N	\N	\N	\N	mv	205
2050727	Xã Bản Xèo	20507	0	\N	\N	\N	\N	\N	bx	205
2050729	Xã Bản Qua	20507	0	\N	\N	\N	\N	\N	bq	205
2050731	Xã Mường Hum	20507	0	\N	\N	\N	\N	\N	mh	205
2050733	Xã Trung Lèng Hồ	20507	0	\N	\N	\N	\N	\N	tlh	205
2050735	Xã Pa Cheo	20507	0	\N	\N	\N	\N	\N	pc	205
2050737	Xã Nậm Pung	20507	0	\N	\N	\N	\N	\N	np	205
2050739	Xã Quang Kim	20507	0	\N	\N	\N	\N	\N	qk	205
2050741	Xã Phìn Ngan	20507	0	\N	\N	\N	\N	\N	pn	205
2050743	Xã Cốc San	20507	0	\N	\N	\N	\N	\N	cs	205
2050745	Xã Tòng Sành	20507	0	\N	\N	\N	\N	\N	ts	205
2050900	Không xác định	20509	0	\N	\N	\N	\N	\N	kx	205
2050901	Thị trấn Bắc Hà	20509	0	\N	\N	\N	\N	\N	bh	205
2050903	Xã Nàn Sán	20509	0	\N	\N	\N	\N	\N	ns	205
2050905	Xã Si Ma Cai	20509	0	\N	\N	\N	\N	\N	smc	205
2050907	Xã Thào Chư Phìn	20509	0	\N	\N	\N	\N	\N	tcp	205
2050909	Xã Bản Mế	20509	0	\N	\N	\N	\N	\N	bm	205
2050911	Xã Sán Chải	20509	0	\N	\N	\N	\N	\N	sc	205
2050913	Xã Lùng Sui	20509	0	\N	\N	\N	\N	\N	ls	205
2050915	Xã Mản Thẩn	20509	0	\N	\N	\N	\N	\N	mt	205
2050917	Xã Lùng Cải	20509	0	\N	\N	\N	\N	\N	lc	205
2050919	Xã Cán Hồ	20509	0	\N	\N	\N	\N	\N	ch	205
2050921	Xã Sín Chéng	20509	0	\N	\N	\N	\N	\N	sc	205
2050923	Xã Lử Thẩn	20509	0	\N	\N	\N	\N	\N	lt	205
2050925	Xã Quan Thần Sán	20509	0	\N	\N	\N	\N	\N	qts	205
2050927	Xã Cán Cấu	20509	0	\N	\N	\N	\N	\N	cc	205
2050929	Xã Nàn Xín	20509	0	\N	\N	\N	\N	\N	nx	205
2050931	Xã Lùng Phình	20509	0	\N	\N	\N	\N	\N	lp	205
2050933	Xã Bản Già	20509	0	\N	\N	\N	\N	\N	bg	205
2050935	Xã Tả Van Chư	20509	0	\N	\N	\N	\N	\N	tvc	205
2050937	Xã Tả Củ Tỷ	20509	0	\N	\N	\N	\N	\N	tct	205
2050939	Xã Hoàng Thu Phố	20509	0	\N	\N	\N	\N	\N	htp	205
2050941	Xã Bản Phố	20509	0	\N	\N	\N	\N	\N	bp	205
2050943	Xã Lầu Thí Ngài	20509	0	\N	\N	\N	\N	\N	ltn	205
2050945	Xã Thải Giàng Phố	20509	0	\N	\N	\N	\N	\N	tgp	205
2050947	Xã Na Hối	20509	0	\N	\N	\N	\N	\N	nh	205
2050949	Xã Tà Chải	20509	0	\N	\N	\N	\N	\N	tc	205
2050951	Xã Bản Liền	20509	0	\N	\N	\N	\N	\N	bl	205
2050953	Xã Cốc Ly	20509	0	\N	\N	\N	\N	\N	cl	205
2050955	Xã Nậm Mòn	20509	0	\N	\N	\N	\N	\N	nm	205
2050957	Xã Nậm Đét	20509	0	\N	\N	\N	\N	\N	nd	205
2050959	Xã Nậm Khánh	20509	0	\N	\N	\N	\N	\N	nk	205
2050961	Xã Bảo Nhai	20509	0	\N	\N	\N	\N	\N	bn	205
2050963	Xã Nậm Lúc	20509	0	\N	\N	\N	\N	\N	nl	205
2050965	Xã Cốc Lầu	20509	0	\N	\N	\N	\N	\N	cl	205
2050967	Xã Bản Cái	20509	0	\N	\N	\N	\N	\N	bc	205
2051100	Không xác định	20511	0	\N	\N	\N	\N	\N	kx	205
2051101	Thị trấn Phố Lu	20511	0	\N	\N	\N	\N	\N	pl	205
2051103	Thị trấn NT Phong Hải	20511	0	\N	\N	\N	\N	\N	nph	205
2051105	Thị trấn Tằng Loỏng	20511	0	\N	\N	\N	\N	\N	tl	205
2051107	Xã Bản Phiệt	20511	0	\N	\N	\N	\N	\N	bp	205
2051109	Xã Bản Cầm	20511	0	\N	\N	\N	\N	\N	bc	205
2051111	Xã Thái Niên	20511	0	\N	\N	\N	\N	\N	tn	205
2051113	Xã Phong Niên	20511	0	\N	\N	\N	\N	\N	pn	205
2051115	Xã Gia Phú	20511	0	\N	\N	\N	\N	\N	gp	205
2051117	Xã Xuân Quang	20511	0	\N	\N	\N	\N	\N	xq	205
2051119	Xã Xuân Giao	20511	0	\N	\N	\N	\N	\N	xg	205
2051121	Xã Sơn Hà	20511	0	\N	\N	\N	\N	\N	sh	205
2051123	Xã Trì Quang	20511	0	\N	\N	\N	\N	\N	tq	205
2051125	Xã Sơn Hải	20511	0	\N	\N	\N	\N	\N	sh	205
2051127	Xã Phố Lu	20511	0	\N	\N	\N	\N	\N	pl	205
2051129	Xã Phú Nhuận	20511	0	\N	\N	\N	\N	\N	pn	205
2051300	Không xác định	20513	0	\N	\N	\N	\N	\N	kx	205
2051301	Thị trấn Sa Pa	20513	0	\N	\N	\N	\N	\N	sp	205
2051303	Xã Bản Khoang	20513	0	\N	\N	\N	\N	\N	bk	205
2051305	Xã Tả Giàng Phình	20513	0	\N	\N	\N	\N	\N	tgp	205
2051307	Xã Trung Chải	20513	0	\N	\N	\N	\N	\N	tc	205
2051309	Xã Tả Phìn	20513	0	\N	\N	\N	\N	\N	tp	205
2051311	Xã Sa Pả	20513	0	\N	\N	\N	\N	\N	sp	205
2051313	Xã San Sả Hồ	20513	0	\N	\N	\N	\N	\N	ssh	205
2051315	Xã Bản Phùng	20513	0	\N	\N	\N	\N	\N	bp	205
2051317	Xã Lao Chải	20513	0	\N	\N	\N	\N	\N	lc	205
2051319	Xã Hầu Thào	20513	0	\N	\N	\N	\N	\N	ht	205
2051321	Xã Thanh Kim	20513	0	\N	\N	\N	\N	\N	tk	205
2051323	Xã Tả Van	20513	0	\N	\N	\N	\N	\N	tv	205
2051325	Xã Sử Pán	20513	0	\N	\N	\N	\N	\N	sp	205
2051327	Xã Suối Thầu	20513	0	\N	\N	\N	\N	\N	st	205
2051329	Xã Bản Hồ	20513	0	\N	\N	\N	\N	\N	bh	205
2051331	Xã Thanh Phú	20513	0	\N	\N	\N	\N	\N	tp	205
2051333	Xã Nậm Sài	20513	0	\N	\N	\N	\N	\N	ns	205
2051335	Xã Nậm Cang	20513	0	\N	\N	\N	\N	\N	nc	205
2051500	Không xác định	20515	0	\N	\N	\N	\N	\N	kx	205
2051501	Thị trấn Phố Ràng	20515	0	\N	\N	\N	\N	\N	pr	205
2051503	Xã Tân Tiến	20515	0	\N	\N	\N	\N	\N	tt	205
2051505	Xã Nghĩa Đô	20515	0	\N	\N	\N	\N	\N	nd	205
2051507	Xã Vĩnh Yên	20515	0	\N	\N	\N	\N	\N	vy	205
2051509	Xã Tân Dương	20515	0	\N	\N	\N	\N	\N	td	205
2051511	Xã Điện Quan	20515	0	\N	\N	\N	\N	\N	dq	205
2051513	Xã Thượng Hà	20515	0	\N	\N	\N	\N	\N	th	205
2051515	Xã Xuân Hoà	20515	0	\N	\N	\N	\N	\N	xh	205
2051517	Xã Kim Sơn	20515	0	\N	\N	\N	\N	\N	ks	205
2051519	Xã Minh Tân	20515	0	\N	\N	\N	\N	\N	mt	205
2051521	Xã Xuân Thượng	20515	0	\N	\N	\N	\N	\N	xt	205
2051523	Xã Cam Cọn	20515	0	\N	\N	\N	\N	\N	cc	205
2051525	Xã Việt Tiến	20515	0	\N	\N	\N	\N	\N	vt	205
2051527	Xã Bảo Hà	20515	0	\N	\N	\N	\N	\N	bh	205
2051529	Xã Yên Sơn	20515	0	\N	\N	\N	\N	\N	ys	205
2051531	Xã Lương Sơn	20515	0	\N	\N	\N	\N	\N	ls	205
2051533	Xã Long Phúc	20515	0	\N	\N	\N	\N	\N	lp	205
2051535	Xã Long Khánh	20515	0	\N	\N	\N	\N	\N	lk	205
2051700	Không xác định	20517	0	\N	\N	\N	\N	\N	kx	205
2051701	Thị trấn Than Uyên	20517	0	\N	\N	\N	\N	\N	tu	205
2051703	Thị trấn NT Than Uyên	20517	0	\N	\N	\N	\N	\N	ntu	205
2051705	Xã Thân Thuộc	20517	0	\N	\N	\N	\N	\N	tt	205
2051707	Xã Mường Khoa	20517	0	\N	\N	\N	\N	\N	mk	205
2051709	Xã Nậm Cần	20517	0	\N	\N	\N	\N	\N	nc	205
2051711	Xã Hố Mít	20517	0	\N	\N	\N	\N	\N	hm	205
2051713	Xã Nậm Sỏ	20517	0	\N	\N	\N	\N	\N	ns	205
2051715	Xã Pắc Ta	20517	0	\N	\N	\N	\N	\N	pt	205
2051717	Xã Mường Than	20517	0	\N	\N	\N	\N	\N	mt	205
2051719	Xã Tà Mít	20517	0	\N	\N	\N	\N	\N	tm	205
2051721	Xã Mường Mít	20517	0	\N	\N	\N	\N	\N	mm	205
2051723	Xã Pha Mu	20517	0	\N	\N	\N	\N	\N	pm	205
2051725	Xã Nà Cang	20517	0	\N	\N	\N	\N	\N	nc	205
2051727	Xã Tà Hừa	20517	0	\N	\N	\N	\N	\N	th	205
2051729	Xã Mường Kim	20517	0	\N	\N	\N	\N	\N	mk	205
2051731	Xã Tà Gia	20517	0	\N	\N	\N	\N	\N	tg	205
2051733	Xã Khoen On	20517	0	\N	\N	\N	\N	\N	ko	205
2051900	Không xác định	20519	0	\N	\N	\N	\N	\N	kx	205
2051901	Thị trấn Khánh Yên	20519	0	\N	\N	\N	\N	\N	ky	205
2051903	Xã Văn Sơn	20519	0	\N	\N	\N	\N	\N	vs	205
2051905	Xã Võ Lao	20519	0	\N	\N	\N	\N	\N	vl	205
2051907	Xã Nậm Mả	20519	0	\N	\N	\N	\N	\N	nm	205
2051909	Xã Nậm Rạng	20519	0	\N	\N	\N	\N	\N	nr	205
2051911	Xã Sơn Thuỷ	20519	0	\N	\N	\N	\N	\N	st	205
2051913	Xã Tân Thượng	20519	0	\N	\N	\N	\N	\N	tt	205
2051915	Xã Nậm Chầy	20519	0	\N	\N	\N	\N	\N	nc	205
2051917	Xã Khánh Yên Thượng	20519	0	\N	\N	\N	\N	\N	kyt	205
2051919	Xã Tân An	20519	0	\N	\N	\N	\N	\N	ta	205
2051921	Xã Nậm Xé	20519	0	\N	\N	\N	\N	\N	nx	205
2051923	Xã Hoà Mạc	20519	0	\N	\N	\N	\N	\N	hm	205
2051925	Xã Dần Thàng	20519	0	\N	\N	\N	\N	\N	dt	205
2051927	Xã Chiềng Ken	20519	0	\N	\N	\N	\N	\N	ck	205
2051929	Xã Làng Giàng	20519	0	\N	\N	\N	\N	\N	lg	205
2051931	Xã Khánh Yên Trung	20519	0	\N	\N	\N	\N	\N	kyt	205
2051933	Xã Khánh Yên Hạ	20519	0	\N	\N	\N	\N	\N	kyh	205
2051935	Xã Dương Quỳ	20519	0	\N	\N	\N	\N	\N	dq	205
2051937	Xã Nậm Tha	20519	0	\N	\N	\N	\N	\N	nt	205
2051939	Xã Minh Lương	20519	0	\N	\N	\N	\N	\N	ml	205
2051941	Xã Thẩm Dương	20519	0	\N	\N	\N	\N	\N	td	205
2051943	Xã Liêm Phú	20519	0	\N	\N	\N	\N	\N	lp	205
2051945	Xã Nậm Xây	20519	0	\N	\N	\N	\N	\N	nx	205
2070000	Không xác định	20700	0	\N	\N	\N	\N	\N	kx	207
2070100	Không xác định	20701	0	\N	\N	\N	\N	\N	kx	207
2070101	Phường Đức Xuân	20701	0	\N	\N	\N	\N	\N	dx	207
2070103	Phường Nguyễn Thị Minh Khai	20701	0	\N	\N	\N	\N	\N	ntmk	207
2070105	Phường Sông Cầu	20701	0	\N	\N	\N	\N	\N	sc	207
2070107	Phường Phùng Chí Kiên	20701	0	\N	\N	\N	\N	\N	pck	207
1010425	Vĩnh Hưng	10104	0	\N	\N	\N	\N	\N	vh	101
2070109	Xã Huyền Tụng	20701	0	\N	\N	\N	\N	\N	ht	207
2070111	Xã Nông Thượng	20701	0	\N	\N	\N	\N	\N	nt	207
2070113	Xã Xuất Hoá	20701	0	\N	\N	\N	\N	\N	xh	207
2070115	Xã Dương Quang	20701	0	\N	\N	\N	\N	\N	dq	207
2070300	Không xác định	20703	0	\N	\N	\N	\N	\N	kx	207
2070301	Thị trấn Chợ Rã	20703	0	\N	\N	\N	\N	\N	cr	207
2070303	Xã Bằng Thành	20703	0	\N	\N	\N	\N	\N	bt	207
2070305	Xã Nhạn Môn	20703	0	\N	\N	\N	\N	\N	nm	207
2070307	Xã Công Bằng	20703	0	\N	\N	\N	\N	\N	cb	207
2070309	Xã Giáo Hiệu	20703	0	\N	\N	\N	\N	\N	gh	207
2070311	Xã An Thắng	20703	0	\N	\N	\N	\N	\N	at	207
2070313	Xã Xuân La	20703	0	\N	\N	\N	\N	\N	xl	207
2070315	Xã Bộc Bố	20703	0	\N	\N	\N	\N	\N	bb	207
2070317	Xã Cổ Linh	20703	0	\N	\N	\N	\N	\N	cl	207
2070319	Xã Nghiên Loan	20703	0	\N	\N	\N	\N	\N	nl	207
2070321	Xã Bành Trạch	20703	0	\N	\N	\N	\N	\N	bt	207
2070323	Xã Cao Tân	20703	0	\N	\N	\N	\N	\N	ct	207
2070325	Xã Phúc Lộc	20703	0	\N	\N	\N	\N	\N	pl	207
2070327	Xã Cao Thượng	20703	0	\N	\N	\N	\N	\N	ct	207
2070329	Xã Cao Trĩ	20703	0	\N	\N	\N	\N	\N	ct	207
2070331	Xã Hà Hiệu	20703	0	\N	\N	\N	\N	\N	hh	207
2070333	Xã Đồng Phúc	20703	0	\N	\N	\N	\N	\N	dp	207
2070335	Xã Hoàng Trĩ	20703	0	\N	\N	\N	\N	\N	ht	207
2070337	Xã Mỹ Phương	20703	0	\N	\N	\N	\N	\N	mp	207
2070339	Xã Quảng Khê	20703	0	\N	\N	\N	\N	\N	qk	207
2070341	Xã Chu Hương	20703	0	\N	\N	\N	\N	\N	ch	207
2070343	Xã Yến Dương	20703	0	\N	\N	\N	\N	\N	yd	207
2070345	Xã Địa Linh	20703	0	\N	\N	\N	\N	\N	dl	207
2070347	Xã Nam Mẫu	20703	0	\N	\N	\N	\N	\N	nm	207
2070349	Xã Khang Ninh	20703	0	\N	\N	\N	\N	\N	kn	207
2070351	Xã Thượng Giáo	20703	0	\N	\N	\N	\N	\N	tg	207
2070500	Không xác định	20705	0	\N	\N	\N	\N	\N	kx	207
2070501	Thị trấn Nà Phặc	20705	0	\N	\N	\N	\N	\N	np	207
2070503	Xã Vân Tùng	20705	0	\N	\N	\N	\N	\N	vt	207
2070505	Xã Đức Vân	20705	0	\N	\N	\N	\N	\N	dv	207
2070507	Xã Bằng Vân	20705	0	\N	\N	\N	\N	\N	bv	207
2070509	Xã Thượng Ân	20705	0	\N	\N	\N	\N	\N	ta	207
2070511	Xã Cốc Đán	20705	0	\N	\N	\N	\N	\N	cd	207
2070513	Xã Trung Hoà	20705	0	\N	\N	\N	\N	\N	th	207
2070515	Xã Thượng Quan	20705	0	\N	\N	\N	\N	\N	tq	207
2070517	Xã Thuần Mang	20705	0	\N	\N	\N	\N	\N	tm	207
2070519	Xã Hương Nê	20705	0	\N	\N	\N	\N	\N	hn	207
2070521	Xã Lãng Ngâm	20705	0	\N	\N	\N	\N	\N	ln	207
2070700	Không xác định	20707	0	\N	\N	\N	\N	\N	kx	207
2070701	Thị trấn Bằng Lũng	20707	0	\N	\N	\N	\N	\N	bl	207
2070703	Xã Xuân Lạc	20707	0	\N	\N	\N	\N	\N	xl	207
2070705	Xã Nam Cường	20707	0	\N	\N	\N	\N	\N	nc	207
2070707	Xã Đồng Lạc	20707	0	\N	\N	\N	\N	\N	dl	207
2070709	Xã Bản Thi	20707	0	\N	\N	\N	\N	\N	bt	207
2070711	Xã Tân Lập	20707	0	\N	\N	\N	\N	\N	tl	207
2070713	Xã Quảng Bạch	20707	0	\N	\N	\N	\N	\N	qb	207
2070715	Xã Bằng Phúc	20707	0	\N	\N	\N	\N	\N	bp	207
2070717	Xã Ngọc Phái	20707	0	\N	\N	\N	\N	\N	np	207
2070719	Xã Yên Thịnh	20707	0	\N	\N	\N	\N	\N	yt	207
2070721	Xã Phương Viên	20707	0	\N	\N	\N	\N	\N	pv	207
2070723	Xã Yên Thượng	20707	0	\N	\N	\N	\N	\N	yt	207
2070725	Xã Rã Bản	20707	0	\N	\N	\N	\N	\N	rb	207
2070727	Xã Bằng Lãng	20707	0	\N	\N	\N	\N	\N	bl	207
2070729	Xã Lương Bằng	20707	0	\N	\N	\N	\N	\N	lb	207
2070731	Xã ĐôngViên	20707	0	\N	\N	\N	\N	\N	d	207
2070733	Xã Đại Xảo	20707	0	\N	\N	\N	\N	\N	dx	207
2070735	Xã Phong Huân	20707	0	\N	\N	\N	\N	\N	ph	207
2070737	Xã Nghĩa Tá	20707	0	\N	\N	\N	\N	\N	nt	207
2070739	Xã Yên Mỹ	20707	0	\N	\N	\N	\N	\N	ym	207
2070741	Xã Yên Nhuận	20707	0	\N	\N	\N	\N	\N	yn	207
2070743	Xã Bình Trung	20707	0	\N	\N	\N	\N	\N	bt	207
2070900	Không xác định	20709	0	\N	\N	\N	\N	\N	kx	207
2070901	Thị trấn Yến Lạc	20709	0	\N	\N	\N	\N	\N	yl	207
2070903	Xã Vũ Loan	20709	0	\N	\N	\N	\N	\N	vl	207
2070905	Xã Kim Hỷ	20709	0	\N	\N	\N	\N	\N	kh	207
2070907	Xã Văn Học	20709	0	\N	\N	\N	\N	\N	vh	207
2070909	Xã Cường Lợi	20709	0	\N	\N	\N	\N	\N	cl	207
2070911	Xã Lương Thượng	20709	0	\N	\N	\N	\N	\N	lt	207
2070913	Xã Lạng San	20709	0	\N	\N	\N	\N	\N	ls	207
2070915	Xã Lương Hạ	20709	0	\N	\N	\N	\N	\N	lh	207
2070917	Xã Ân Tình	20709	0	\N	\N	\N	\N	\N	at	207
2070919	Xã Lương Thành	20709	0	\N	\N	\N	\N	\N	lt	207
2070921	Xã Kim Lư	20709	0	\N	\N	\N	\N	\N	kl	207
2070923	Xã Lam Sơn	20709	0	\N	\N	\N	\N	\N	ls	207
2070925	Xã Văn Minh	20709	0	\N	\N	\N	\N	\N	vm	207
2070927	Xã Cư Lễ	20709	0	\N	\N	\N	\N	\N	cl	207
2070929	Xã Côn Minh	20709	0	\N	\N	\N	\N	\N	cm	207
2070931	Xã Hữu Thác	20709	0	\N	\N	\N	\N	\N	ht	207
2070933	Xã Quang Phong	20709	0	\N	\N	\N	\N	\N	qp	207
2070935	Xã Hảo Nghĩa	20709	0	\N	\N	\N	\N	\N	hn	207
2070937	Xã Dương Sơn	20709	0	\N	\N	\N	\N	\N	ds	207
2070939	Xã Đổng Xá	20709	0	\N	\N	\N	\N	\N	dx	207
2070941	Xã Xuân Dương	20709	0	\N	\N	\N	\N	\N	xd	207
2070943	Xã Liêm Thuỷ	20709	0	\N	\N	\N	\N	\N	lt	207
2071100	Không xác định	20711	0	\N	\N	\N	\N	\N	kx	207
2071101	Thị trấn Phủ Thông	20711	0	\N	\N	\N	\N	\N	pt	207
2071105	Xã Phương Linh	20711	0	\N	\N	\N	\N	\N	pl	207
2071107	Xã Vy Hương	20711	0	\N	\N	\N	\N	\N	vh	207
2071109	Xã Sỹ Bình	20711	0	\N	\N	\N	\N	\N	sb	207
2071111	Xã Vũ Muộn	20711	0	\N	\N	\N	\N	\N	vm	207
2071113	Xã Tú Trĩ	20711	0	\N	\N	\N	\N	\N	tt	207
2071115	Xã Tân Tiến	20711	0	\N	\N	\N	\N	\N	tt	207
2071117	Xã Lục Bình	20711	0	\N	\N	\N	\N	\N	lb	207
2071119	Xã Đôn Phong	20711	0	\N	\N	\N	\N	\N	dp	207
2071121	Xã Quân Bình	20711	0	\N	\N	\N	\N	\N	qb	207
2071123	Xã Nguyên Phúc	20711	0	\N	\N	\N	\N	\N	np	207
2071125	Xã Hà Vị	20711	0	\N	\N	\N	\N	\N	hv	207
2071127	Xã Cao Sơn	20711	0	\N	\N	\N	\N	\N	cs	207
2071129	Xã Cẩm Giàng	20711	0	\N	\N	\N	\N	\N	cg	207
2071131	Xã Mỹ Thanh	20711	0	\N	\N	\N	\N	\N	mt	207
2071133	Xã Quang Thuận	20711	0	\N	\N	\N	\N	\N	qt	207
2071135	Xã Dương Phong	20711	0	\N	\N	\N	\N	\N	dp	207
2071300	Không xác định	20713	0	\N	\N	\N	\N	\N	kx	207
2071301	Thị trấn Chợ Mới	20713	0	\N	\N	\N	\N	\N	cm	207
2071303	Xã Tân Sơn	20713	0	\N	\N	\N	\N	\N	ts	207
2071305	Xã Thanh Vân	20713	0	\N	\N	\N	\N	\N	tv	207
2071307	Xã Hoà Mục	20713	0	\N	\N	\N	\N	\N	hm	207
2071309	Xã Thanh Mai	20713	0	\N	\N	\N	\N	\N	tm	207
2071311	Xã Mai Lạp	20713	0	\N	\N	\N	\N	\N	ml	207
2071313	Xã Cao Kỳ	20713	0	\N	\N	\N	\N	\N	ck	207
2071315	Xã Nông Hạ	20713	0	\N	\N	\N	\N	\N	nh	207
2071317	Xã Nông Thịnh	20713	0	\N	\N	\N	\N	\N	nt	207
2071319	Xã Yên Hân	20713	0	\N	\N	\N	\N	\N	yh	207
2071321	Xã Yên Cư	20713	0	\N	\N	\N	\N	\N	yc	207
2071323	Xã Thanh Bình	20713	0	\N	\N	\N	\N	\N	tb	207
2071325	Xã Như Cố	20713	0	\N	\N	\N	\N	\N	nc	207
2071327	Xã Bình Văn	20713	0	\N	\N	\N	\N	\N	bv	207
2071329	Xã Yên Đĩnh	20713	0	\N	\N	\N	\N	\N	yd	207
2071331	Xã Quảng Chu	20713	0	\N	\N	\N	\N	\N	qc	207
2090000	Không xác định	20900	0	\N	\N	\N	\N	\N	kx	209
2090100	Không xác định	20901	0	\N	\N	\N	\N	\N	kx	209
2090101	Phường Hoàng Văn Thụ	20901	0	\N	\N	\N	\N	\N	hvt	209
2090103	Phường Tam Thanh	20901	0	\N	\N	\N	\N	\N	tt	209
2090105	Phường Vĩnh Trại	20901	0	\N	\N	\N	\N	\N	vt	209
2090107	Phường Đông Kinh	20901	0	\N	\N	\N	\N	\N	dk	209
2090109	Phường Chi Lăng	20901	0	\N	\N	\N	\N	\N	cl	209
2090111	Xã Hoàng Đồng	20901	0	\N	\N	\N	\N	\N	hd	209
2090113	Xã Mai Pha	20901	0	\N	\N	\N	\N	\N	mp	209
2090115	Xã Quảng Lạc	20901	0	\N	\N	\N	\N	\N	ql	209
2090300	Không xác định	20903	0	\N	\N	\N	\N	\N	kx	209
2090301	Thị trấn Thất Khê	20903	0	\N	\N	\N	\N	\N	tk	209
2090303	Xã Khánh Long	20903	0	\N	\N	\N	\N	\N	kl	209
2090305	Xã Đoàn Kết	20903	0	\N	\N	\N	\N	\N	dk	209
2090307	Xã Cao Minh	20903	0	\N	\N	\N	\N	\N	cm	209
2090309	Xã Vĩnh Tiến	20903	0	\N	\N	\N	\N	\N	vt	209
2090311	Xã Tân Yên	20903	0	\N	\N	\N	\N	\N	ty	209
2090313	Xã Tân Tiến	20903	0	\N	\N	\N	\N	\N	tt	209
2090315	Xã Chí Minh	20903	0	\N	\N	\N	\N	\N	cm	209
2090317	Xã Kim Đồng	20903	0	\N	\N	\N	\N	\N	kd	209
2090319	Xã Bắc ái	20903	0	\N	\N	\N	\N	\N	ba	209
2090321	Xã Quốc Khánh	20903	0	\N	\N	\N	\N	\N	qk	209
2090323	Xã Tri Phương	20903	0	\N	\N	\N	\N	\N	tp	209
2090325	Xã Đội Cấn	20903	0	\N	\N	\N	\N	\N	dc	209
2090327	Xã Chi Lăng	20903	0	\N	\N	\N	\N	\N	cl	209
2090329	Xã Đại Đồng	20903	0	\N	\N	\N	\N	\N	dd	209
2090331	Xã Đề Thám	20903	0	\N	\N	\N	\N	\N	dt	209
2090333	Xã Hùng Sơn	20903	0	\N	\N	\N	\N	\N	hs	209
2090335	Xã Tân Minh	20903	0	\N	\N	\N	\N	\N	tm	209
2090337	Xã Trung Thành	20903	0	\N	\N	\N	\N	\N	tt	209
2090339	Xã Đào Viên	20903	0	\N	\N	\N	\N	\N	dv	209
2090341	Xã Kháng Chiến	20903	0	\N	\N	\N	\N	\N	kc	209
2090343	Xã Quốc Việt	20903	0	\N	\N	\N	\N	\N	qv	209
2090345	Xã Hùng Việt	20903	0	\N	\N	\N	\N	\N	hv	209
2090500	Không xác định	20905	0	\N	\N	\N	\N	\N	kx	209
2090501	Thị trấn Na Sầm	20905	0	\N	\N	\N	\N	\N	ns	209
2090503	Xã Tân Việt	20905	0	\N	\N	\N	\N	\N	tv	209
2090505	Xã Trùng Khánh	20905	0	\N	\N	\N	\N	\N	tk	209
2090507	Xã Trùng Quán	20905	0	\N	\N	\N	\N	\N	tq	209
2090509	Xã Thụy Hùng	20905	0	\N	\N	\N	\N	\N	th	209
2090511	Xã An Hùng	20905	0	\N	\N	\N	\N	\N	ah	209
2090513	Xã Bắc La	20905	0	\N	\N	\N	\N	\N	bl	209
2090515	Xã Hội Hoan	20905	0	\N	\N	\N	\N	\N	hh	209
2090517	Xã Tân Tác	20905	0	\N	\N	\N	\N	\N	tt	209
2090519	Xã Nam La	20905	0	\N	\N	\N	\N	\N	nl	209
2090521	Xã Gia Miễn	20905	0	\N	\N	\N	\N	\N	gm	209
2090523	Xã Thành Hòa	20905	0	\N	\N	\N	\N	\N	th	209
2090525	Xã Tân Lang	20905	0	\N	\N	\N	\N	\N	tl	209
2090527	Xã Hoàng Việt	20905	0	\N	\N	\N	\N	\N	hv	209
2090529	Xã Thanh Long	20905	0	\N	\N	\N	\N	\N	tl	209
2090531	Xã Tân Thanh	20905	0	\N	\N	\N	\N	\N	tt	209
2090533	Xã Tân Mỹ	20905	0	\N	\N	\N	\N	\N	tm	209
2090535	Xã Hồng Thái	20905	0	\N	\N	\N	\N	\N	ht	209
2090537	Xã  Hoàng Văn Thụ	20905	0	\N	\N	\N	\N	\N	hvt	209
2090539	Xã Nhạc Kỳ	20905	0	\N	\N	\N	\N	\N	nk	209
2090700	Không xác định	20907	0	\N	\N	\N	\N	\N	kx	209
2090701	Thị trấn Bình Gia	20907	0	\N	\N	\N	\N	\N	bg	209
2090703	Xã Vĩnh Yên	20907	0	\N	\N	\N	\N	\N	vy	209
2090705	Xã Hưng Đạo	20907	0	\N	\N	\N	\N	\N	hd	209
2090707	Xã Hoa Thám	20907	0	\N	\N	\N	\N	\N	ht	209
2090709	Xã Quý Hòa	20907	0	\N	\N	\N	\N	\N	qh	209
2090711	Xã Yên Lỗ	20907	0	\N	\N	\N	\N	\N	yl	209
2090713	Xã Thiện Hòa	20907	0	\N	\N	\N	\N	\N	th	209
2090715	Xã Thiện Thuật	20907	0	\N	\N	\N	\N	\N	tt	209
2090717	Xã Thiện Long	20907	0	\N	\N	\N	\N	\N	tl	209
2090719	Xã Mông Ân	20907	0	\N	\N	\N	\N	\N	ma	209
2090721	Xã Tân Hòa	20907	0	\N	\N	\N	\N	\N	th	209
2090723	Xã Hòa Bình	20907	0	\N	\N	\N	\N	\N	hb	209
2090725	Xã Hồng Phong	20907	0	\N	\N	\N	\N	\N	hp	209
2090727	Xã Quang Trung	20907	0	\N	\N	\N	\N	\N	qt	209
2090729	Xã Minh Khai	20907	0	\N	\N	\N	\N	\N	mk	209
2090731	Xã Hoàng Văn Thụ	20907	0	\N	\N	\N	\N	\N	hvt	209
2090733	Xã Tô Hiệu	20907	0	\N	\N	\N	\N	\N	th	209
2090735	Xã Hồng Thái	20907	0	\N	\N	\N	\N	\N	ht	209
2090737	Xã Bình La	20907	0	\N	\N	\N	\N	\N	bl	209
2090739	Xã Tân Văn	20907	0	\N	\N	\N	\N	\N	tv	209
2090900	Không xác định	20909	0	\N	\N	\N	\N	\N	kx	209
2090901	Thị trấn Bắc Sơn	20909	0	\N	\N	\N	\N	\N	bs	209
2090903	Xã Vạn Thủy	20909	0	\N	\N	\N	\N	\N	vt	209
2090905	Xã Đồng ý	20909	0	\N	\N	\N	\N	\N	dy	209
2090907	Xã Vũ Sơn	20909	0	\N	\N	\N	\N	\N	vs	209
2090909	Xã Tân Tri	20909	0	\N	\N	\N	\N	\N	tt	209
2090911	Xã Chiến Thắng	20909	0	\N	\N	\N	\N	\N	ct	209
2090913	Xã Vũ Lễ	20909	0	\N	\N	\N	\N	\N	vl	209
2090915	Xã Long Đống	20909	0	\N	\N	\N	\N	\N	ld	209
2090917	Xã Hữu Vĩnh	20909	0	\N	\N	\N	\N	\N	hv	209
2090919	Xã Quỳnh Sơn	20909	0	\N	\N	\N	\N	\N	qs	209
2090921	Xã Bắc Sơn	20909	0	\N	\N	\N	\N	\N	bs	209
2090923	Xã Tân Lập	20909	0	\N	\N	\N	\N	\N	tl	209
2090925	Xã Tân Hương	20909	0	\N	\N	\N	\N	\N	th	209
2090927	Xã Vũ Lăng	20909	0	\N	\N	\N	\N	\N	vl	209
2090929	Xã Chiêu Vũ	20909	0	\N	\N	\N	\N	\N	cv	209
2090931	Xã Hưng Vũ	20909	0	\N	\N	\N	\N	\N	hv	209
2090933	Xã Trấn Yên	20909	0	\N	\N	\N	\N	\N	ty	209
2090935	Xã Nhất Hòa	20909	0	\N	\N	\N	\N	\N	nh	209
2090937	Xã Tân Thành	20909	0	\N	\N	\N	\N	\N	tt	209
2090939	Xã Nhất Tiến	20909	0	\N	\N	\N	\N	\N	nt	209
2091100	Không xác định	20911	0	\N	\N	\N	\N	\N	kx	209
2091101	Thị trấn Văn Quan	20911	0	\N	\N	\N	\N	\N	vq	209
2091103	Xã Trấn Ninh	20911	0	\N	\N	\N	\N	\N	tn	209
2091105	Xã Phú Mỹ	20911	0	\N	\N	\N	\N	\N	pm	209
2091107	Xã Việt Yên	20911	0	\N	\N	\N	\N	\N	vy	209
2091109	Xã Vân Mộng	20911	0	\N	\N	\N	\N	\N	vm	209
2091111	Xã Song Giang	20911	0	\N	\N	\N	\N	\N	sg	209
2091113	Xã Hòa Bình	20911	0	\N	\N	\N	\N	\N	hb	209
2091115	Xã Vĩnh Lại	20911	0	\N	\N	\N	\N	\N	vl	209
2091117	Xã Văn An	20911	0	\N	\N	\N	\N	\N	va	209
2091119	Xã Đại An	20911	0	\N	\N	\N	\N	\N	da	209
2091121	Xã Tú Xuyên	20911	0	\N	\N	\N	\N	\N	tx	209
2091123	Xã Lương Năng	20911	0	\N	\N	\N	\N	\N	ln	209
2091125	Xã Tri Lễ	20911	0	\N	\N	\N	\N	\N	tl	209
2091127	Xã Hữu Lễ	20911	0	\N	\N	\N	\N	\N	hl	209
2091129	Xã Xuân Mai	20911	0	\N	\N	\N	\N	\N	xm	209
2091131	Xã Bình Phúc	20911	0	\N	\N	\N	\N	\N	bp	209
2091133	Xã Yên Phúc	20911	0	\N	\N	\N	\N	\N	yp	209
2091135	Xã Chu Túc	20911	0	\N	\N	\N	\N	\N	ct	209
2091137	Xã Tân Đoàn	20911	0	\N	\N	\N	\N	\N	td	209
2091139	Xã Tràng Sơn	20911	0	\N	\N	\N	\N	\N	ts	209
2091141	Xã Tràng Phái	20911	0	\N	\N	\N	\N	\N	tp	209
2091143	Xã Khánh Khê	20911	0	\N	\N	\N	\N	\N	kk	209
2091145	Xã Đồng Giáp	20911	0	\N	\N	\N	\N	\N	dg	209
2091147	Xã Tràng Các	20911	0	\N	\N	\N	\N	\N	tc	209
2091300	Không xác định	20913	0	\N	\N	\N	\N	\N	kx	209
2091301	Thị trấn Cao Lộc	20913	0	\N	\N	\N	\N	\N	cl	209
2091303	Thị trấn Đồng Đăng	20913	0	\N	\N	\N	\N	\N	dd	209
2091305	Xã Bảo Lâm	20913	0	\N	\N	\N	\N	\N	bl	209
2091307	Xã Thạch Đạn	20913	0	\N	\N	\N	\N	\N	td	209
2091309	Xã Hồng Phong	20913	0	\N	\N	\N	\N	\N	hp	209
2091311	Xã Phú Xá	20913	0	\N	\N	\N	\N	\N	px	209
2091313	Xã Thụy Hùng	20913	0	\N	\N	\N	\N	\N	th	209
2091315	Xã Bình Trung	20913	0	\N	\N	\N	\N	\N	bt	209
2091317	Xã Song Giáp	20913	0	\N	\N	\N	\N	\N	sg	209
2091319	Xã Lộc Thanh	20913	0	\N	\N	\N	\N	\N	lt	209
2091321	Xã Hòa Cư	20913	0	\N	\N	\N	\N	\N	hc	209
2091323	Xã Hải Yến	20913	0	\N	\N	\N	\N	\N	hy	209
2091325	Xã Công Sơn	20913	0	\N	\N	\N	\N	\N	cs	209
2091327	Xã Cao Lâu	20913	0	\N	\N	\N	\N	\N	cl	209
2091329	Xã Xuất Lễ	20913	0	\N	\N	\N	\N	\N	xl	209
2091331	Xã Mẫu Sơn	20913	0	\N	\N	\N	\N	\N	ms	209
2091333	Xã Hợp Thành	20913	0	\N	\N	\N	\N	\N	ht	209
2091335	Xã Gia Cát	20913	0	\N	\N	\N	\N	\N	gc	209
2091337	Xã Tân Liên	20913	0	\N	\N	\N	\N	\N	tl	209
2091339	Xã Yên Trạch	20913	0	\N	\N	\N	\N	\N	yt	209
2091341	Xã Xuân Long	20913	0	\N	\N	\N	\N	\N	xl	209
2091343	Xã Tân Thành	20913	0	\N	\N	\N	\N	\N	tt	209
2091500	Không xác định	20915	0	\N	\N	\N	\N	\N	kx	209
2091501	Thị trấn Lộc Bình	20915	0	\N	\N	\N	\N	\N	lb	209
2091503	Thị trấn Na Dương	20915	0	\N	\N	\N	\N	\N	nd	209
2091505	Xã Xuân Lễ	20915	0	\N	\N	\N	\N	\N	xl	209
2091507	Xã Bằng Khánh	20915	0	\N	\N	\N	\N	\N	bk	209
2091509	Xã Xuân Mãn	20915	0	\N	\N	\N	\N	\N	xm	209
2091511	Xã Đồng Bục	20915	0	\N	\N	\N	\N	\N	db	209
2091513	Xã Vân Mộng	20915	0	\N	\N	\N	\N	\N	vm	209
2091515	Xã Như Khuê	20915	0	\N	\N	\N	\N	\N	nk	209
2091517	Xã Xuân Tình	20915	0	\N	\N	\N	\N	\N	xt	209
2091519	Xã Nhượng Bạn	20915	0	\N	\N	\N	\N	\N	nb	209
2091521	Xã Hiệp Hạ	20915	0	\N	\N	\N	\N	\N	hh	209
2091523	Xã Minh Phát	20915	0	\N	\N	\N	\N	\N	mp	209
2091525	Xã Hữu Lân	20915	0	\N	\N	\N	\N	\N	hl	209
2091527	Xã Hữu Khánh	20915	0	\N	\N	\N	\N	\N	hk	209
2091529	Xã Lục Thôn	20915	0	\N	\N	\N	\N	\N	lt	209
2091531	Xã Mẫu Sơn	20915	0	\N	\N	\N	\N	\N	ms	209
2091533	Xã Yên Khoái	20915	0	\N	\N	\N	\N	\N	yk	209
2091535	Xã Tú Mịch	20915	0	\N	\N	\N	\N	\N	tm	209
2091537	Xã Tam Gia	20915	0	\N	\N	\N	\N	\N	tg	209
2091539	Xã Tĩnh Bắc	20915	0	\N	\N	\N	\N	\N	tb	209
2091541	Xã Tú Đoạn	20915	0	\N	\N	\N	\N	\N	td	209
2091543	Xã Khuất Xá	20915	0	\N	\N	\N	\N	\N	kx	209
2091545	Xã Quan Bản	20915	0	\N	\N	\N	\N	\N	qb	209
2091547	Xã Đông Quan	20915	0	\N	\N	\N	\N	\N	dq	209
2091549	Xã Sàn Viên	20915	0	\N	\N	\N	\N	\N	sv	209
2091551	Xã Lợi Bác	20915	0	\N	\N	\N	\N	\N	lb	209
2091553	Xã Nam Quan	20915	0	\N	\N	\N	\N	\N	nq	209
2091555	Xã Xuân Dương	20915	0	\N	\N	\N	\N	\N	xd	209
2091557	Xã ái Quốc	20915	0	\N	\N	\N	\N	\N	aq	209
2091700	Không xác định	20917	0	\N	\N	\N	\N	\N	kx	209
2091701	Thị trấn Đồng Mỏ	20917	0	\N	\N	\N	\N	\N	dm	209
2091703	Thị trấn Chi Lăng	20917	0	\N	\N	\N	\N	\N	cl	209
2091705	Xã Bằng Hữu	20917	0	\N	\N	\N	\N	\N	bh	209
2091707	Xã Bằng Mạc	20917	0	\N	\N	\N	\N	\N	bm	209
2091709	Xã Gia Lộc	20917	0	\N	\N	\N	\N	\N	gl	209
2091711	Xã Thượng Cường	20917	0	\N	\N	\N	\N	\N	tc	209
2091713	Xã Hòa Bình	20917	0	\N	\N	\N	\N	\N	hb	209
2091715	Xã Vạn Linh	20917	0	\N	\N	\N	\N	\N	vl	209
2091717	Xã Y Tịch	20917	0	\N	\N	\N	\N	\N	yt	209
2091719	Xã Quang Lang	20917	0	\N	\N	\N	\N	\N	ql	209
2091721	Xã Chi Lăng	20917	0	\N	\N	\N	\N	\N	cl	209
2091723	Xã Mai Sao	20917	0	\N	\N	\N	\N	\N	ms	209
2091725	Xã Nhân Lý	20917	0	\N	\N	\N	\N	\N	nl	209
2091727	Xã Bắc Thủy	20917	0	\N	\N	\N	\N	\N	bt	209
2091729	Xã Vân Thủy	20917	0	\N	\N	\N	\N	\N	vt	209
2091731	Xã Vân An	20917	0	\N	\N	\N	\N	\N	va	209
2091733	Xã Chiến Thắng	20917	0	\N	\N	\N	\N	\N	ct	209
2091735	Xã Liên Sơn	20917	0	\N	\N	\N	\N	\N	ls	209
2091737	Xã Lâm Sơn	20917	0	\N	\N	\N	\N	\N	ls	209
2091739	Xã Quan Sơn	20917	0	\N	\N	\N	\N	\N	qs	209
2091741	Xã Hữu Kiên	20917	0	\N	\N	\N	\N	\N	hk	209
2091900	Không xác định	20919	0	\N	\N	\N	\N	\N	kx	209
2091901	Thị trấn Đình Lập	20919	0	\N	\N	\N	\N	\N	dl	209
2091903	Thị trấn NT Thái Bình	20919	0	\N	\N	\N	\N	\N	ntb	209
2091905	Xã Bính Xá	20919	0	\N	\N	\N	\N	\N	bx	209
2091907	Xã Bắc Xa	20919	0	\N	\N	\N	\N	\N	bx	209
2091909	Xã Kiên Mộc	20919	0	\N	\N	\N	\N	\N	km	209
2091911	Xã Đình Lập	20919	0	\N	\N	\N	\N	\N	dl	209
2091913	Xã Cường Lợi	20919	0	\N	\N	\N	\N	\N	cl	209
2091915	Xã Thái Bình	20919	0	\N	\N	\N	\N	\N	tb	209
2091917	Xã Lâm Ca	20919	0	\N	\N	\N	\N	\N	lc	209
2091919	Xã Châu Sơn	20919	0	\N	\N	\N	\N	\N	cs	209
2091921	Xã Đồng Thắng	20919	0	\N	\N	\N	\N	\N	dt	209
2091923	Xã Bắc Lãng	20919	0	\N	\N	\N	\N	\N	bl	209
2092100	Không xác định	20921	0	\N	\N	\N	\N	\N	kx	209
2092101	Thị trấn Hữu Lũng	20921	0	\N	\N	\N	\N	\N	hl	209
2092103	Xã Quyết Thắng	20921	0	\N	\N	\N	\N	\N	qt	209
2092105	Xã Yên Bình	20921	0	\N	\N	\N	\N	\N	yb	209
2092107	Xã Hòa Bình	20921	0	\N	\N	\N	\N	\N	hb	209
2092109	Xã Hữu Liên	20921	0	\N	\N	\N	\N	\N	hl	209
2092111	Xã Yên Thịnh	20921	0	\N	\N	\N	\N	\N	yt	209
2092113	Xã Yên Vượng	20921	0	\N	\N	\N	\N	\N	yv	209
2092115	Xã Yên Sơn	20921	0	\N	\N	\N	\N	\N	ys	209
2092117	Xã Thiện Kỵ	20921	0	\N	\N	\N	\N	\N	tk	209
2092119	Xã Tân Lập	20921	0	\N	\N	\N	\N	\N	tl	209
2092121	Xã Minh Tiến	20921	0	\N	\N	\N	\N	\N	mt	209
2092123	Xã Thanh Sơn	20921	0	\N	\N	\N	\N	\N	ts	209
2092125	Xã Vân Nham	20921	0	\N	\N	\N	\N	\N	vn	209
2092127	Xã Đồng Tiến	20921	0	\N	\N	\N	\N	\N	dt	209
2092129	Xã Đô Lương	20921	0	\N	\N	\N	\N	\N	dl	209
2092131	Xã Nhật Tiến	20921	0	\N	\N	\N	\N	\N	nt	209
2092133	Xã Đồng Tân	20921	0	\N	\N	\N	\N	\N	dt	209
2092135	Xã Cai Kinh	20921	0	\N	\N	\N	\N	\N	ck	209
2092137	Xã Hòa Lạc	20921	0	\N	\N	\N	\N	\N	hl	209
2092139	Xã Minh Sơn	20921	0	\N	\N	\N	\N	\N	ms	209
2092141	Xã Sơn Hà	20921	0	\N	\N	\N	\N	\N	sh	209
2092143	Xã Minh Hòa	20921	0	\N	\N	\N	\N	\N	mh	209
2092145	Xã Hòa Sơn	20921	0	\N	\N	\N	\N	\N	hs	209
2092147	Xã Tân Thành	20921	0	\N	\N	\N	\N	\N	tt	209
2092149	Xã Hồ Sơn	20921	0	\N	\N	\N	\N	\N	hs	209
2092151	Xã Hòa Thắng	20921	0	\N	\N	\N	\N	\N	ht	209
2110000	Không xác định	21100	0	\N	\N	\N	\N	\N	kx	211
2110100	Không xác định	21101	0	\N	\N	\N	\N	\N	kx	211
2110101	Phường Tân Quang	21101	0	\N	\N	\N	\N	\N	tq	211
2110103	Phường Phan Thiết	21101	0	\N	\N	\N	\N	\N	pt	211
2110105	Phường Minh Xuân	21101	0	\N	\N	\N	\N	\N	mx	211
2110107	Xã Tràng Đà	21101	0	\N	\N	\N	\N	\N	td	211
2110109	Xã ỷ La	21101	0	\N	\N	\N	\N	\N	yl	211
2110113	Xã Hưng Thành	21101	0	\N	\N	\N	\N	\N	ht	211
2110300	Không xác định	21103	0	\N	\N	\N	\N	\N	kx	211
2110301	Thị trấn Vĩnh Yên	21103	0	\N	\N	\N	\N	\N	vy	211
2110303	Xã Thúy Loa	21103	0	\N	\N	\N	\N	\N	tl	211
2110305	Xã Thượng Giáp	21103	0	\N	\N	\N	\N	\N	tg	211
2110307	Xã Sinh Long	21103	0	\N	\N	\N	\N	\N	sl	211
2110309	Xã Thượng Nông	21103	0	\N	\N	\N	\N	\N	tn	211
2110311	Xã Phúc Yên	21103	0	\N	\N	\N	\N	\N	py	211
2110313	Xã Xuân Lập	21103	0	\N	\N	\N	\N	\N	xl	211
2110315	Xã Hồng Thái	21103	0	\N	\N	\N	\N	\N	ht	211
2110317	Xã Đức Xuân	21103	0	\N	\N	\N	\N	\N	dx	211
2110319	Xã Yên Hoa	21103	0	\N	\N	\N	\N	\N	yh	211
2110321	Xã Côn Lôn	21103	0	\N	\N	\N	\N	\N	cl	211
2110323	Xã Khuôn Hà	21103	0	\N	\N	\N	\N	\N	kh	211
2110325	Xã Lăng Can	21103	0	\N	\N	\N	\N	\N	lc	211
2110327	Xã Khâu Tinh	21103	0	\N	\N	\N	\N	\N	kt	211
2110329	Xã Đà Vị	21103	0	\N	\N	\N	\N	\N	dv	211
2110331	Xã Thượng Lâm	21103	0	\N	\N	\N	\N	\N	tl	211
2110333	Xã Trùng Khánh	21103	0	\N	\N	\N	\N	\N	tk	211
2110335	Xã Sơn Phú	21103	0	\N	\N	\N	\N	\N	sp	211
2110337	Xã Năng Khả	21103	0	\N	\N	\N	\N	\N	nk	211
2110339	Xã Vĩnh Yên	21103	0	\N	\N	\N	\N	\N	vy	211
2110341	Xã Thanh Tương	21103	0	\N	\N	\N	\N	\N	tt	211
2110500	Không xác định	21105	0	\N	\N	\N	\N	\N	kx	211
2110501	Thị trấn Vĩnh Lộc	21105	0	\N	\N	\N	\N	\N	vl	211
2110503	Xã Bình An	21105	0	\N	\N	\N	\N	\N	ba	211
2110505	Xã Hồng Quang	21105	0	\N	\N	\N	\N	\N	hq	211
2110507	Xã Thổ Bình	21105	0	\N	\N	\N	\N	\N	tb	211
2110509	Xã Minh Quang	21105	0	\N	\N	\N	\N	\N	mq	211
2110511	Xã Trung Hà	21105	0	\N	\N	\N	\N	\N	th	211
2110513	Xã Phúc Sơn	21105	0	\N	\N	\N	\N	\N	ps	211
2110515	Xã Tân Mỹ	21105	0	\N	\N	\N	\N	\N	tm	211
2110517	Xã Hà Lang	21105	0	\N	\N	\N	\N	\N	hl	211
2110519	Xã Hùng Mỹ	21105	0	\N	\N	\N	\N	\N	hm	211
2110521	Xã Yên Lập	21105	0	\N	\N	\N	\N	\N	yl	211
2110523	Xã Tân An	21105	0	\N	\N	\N	\N	\N	ta	211
2110525	Xã Xuân Quang	21105	0	\N	\N	\N	\N	\N	xq	211
2110527	Xã Phúc Thịnh	21105	0	\N	\N	\N	\N	\N	pt	211
2110529	Xã Bình Phú	21105	0	\N	\N	\N	\N	\N	bp	211
2110531	Xã Phú Bình	21105	0	\N	\N	\N	\N	\N	pb	211
2110533	Xã Ngọc Hội	21105	0	\N	\N	\N	\N	\N	nh	211
2110535	Xã Tân Thịnh	21105	0	\N	\N	\N	\N	\N	tt	211
2110537	Xã Hòa Phú	21105	0	\N	\N	\N	\N	\N	hp	211
2110539	Xã Kiên Đài	21105	0	\N	\N	\N	\N	\N	kd	211
2110541	Xã Trung Hòa	21105	0	\N	\N	\N	\N	\N	th	211
2110543	Xã Kim Bình	21105	0	\N	\N	\N	\N	\N	kb	211
2110545	Xã Vinh Quang	21105	0	\N	\N	\N	\N	\N	vq	211
2110547	Xã Hòa An	21105	0	\N	\N	\N	\N	\N	ha	211
2110549	Xã Yên Nguyên	21105	0	\N	\N	\N	\N	\N	yn	211
2110551	Xã Nhân Lý	21105	0	\N	\N	\N	\N	\N	nl	211
2110553	Xã Tri Phú	21105	0	\N	\N	\N	\N	\N	tp	211
2110555	Xã Bình Nhân	21105	0	\N	\N	\N	\N	\N	bn	211
2110557	Xã Linh Phú	21105	0	\N	\N	\N	\N	\N	lp	211
2110700	Không xác định	21107	0	\N	\N	\N	\N	\N	kx	211
2110701	Thị trấn Tân Yên	21107	0	\N	\N	\N	\N	\N	ty	211
2110703	Xã Yên Thuận	21107	0	\N	\N	\N	\N	\N	yt	211
2110705	Xã Bạch Xa	21107	0	\N	\N	\N	\N	\N	bx	211
2110707	Xã Minh Khương	21107	0	\N	\N	\N	\N	\N	mk	211
2110709	Xã Phù Lưu	21107	0	\N	\N	\N	\N	\N	pl	211
2110711	Xã Minh Dân	21107	0	\N	\N	\N	\N	\N	md	211
2110713	Xã Minh Hương	21107	0	\N	\N	\N	\N	\N	mh	211
2110715	Xã Yên Hương	21107	0	\N	\N	\N	\N	\N	yh	211
2110717	Xã Tân Thành	21107	0	\N	\N	\N	\N	\N	tt	211
2110719	Xã Bình Xa	21107	0	\N	\N	\N	\N	\N	bx	211
2110721	Xã Nhân Mục	21107	0	\N	\N	\N	\N	\N	nm	211
2110723	Xã Thái Sơn	21107	0	\N	\N	\N	\N	\N	ts	211
2110725	Xã Thái Hòa	21107	0	\N	\N	\N	\N	\N	th	211
2110727	Xã Bằng Cốc	21107	0	\N	\N	\N	\N	\N	bc	211
2110729	Xã Thành Long	21107	0	\N	\N	\N	\N	\N	tl	211
2110731	Xã Đức Ninh	21107	0	\N	\N	\N	\N	\N	dn	211
2110733	Xã Hùng Đức	21107	0	\N	\N	\N	\N	\N	hd	211
2110900	Không xác định	21109	0	\N	\N	\N	\N	\N	kx	211
2110901	Thị trấn NT Sông Lô	21109	0	\N	\N	\N	\N	\N	nsl	211
2110903	Thị trấn NT Tháng 10	21109	0	\N	\N	\N	\N	\N	nt1	211
2110905	Thị trấn Tân Bình	21109	0	\N	\N	\N	\N	\N	tb	211
2110907	Xã An Tường	21109	0	\N	\N	\N	\N	\N	at	211
2110909	Xã Lực Hành	21109	0	\N	\N	\N	\N	\N	lh	211
2110911	Xã Chiêu Yên	21109	0	\N	\N	\N	\N	\N	cy	211
2110913	Xã Quí Quân	21109	0	\N	\N	\N	\N	\N	qq	211
2110915	Xã Kiến Thiết	21109	0	\N	\N	\N	\N	\N	kt	211
2110917	Xã Trung Minh	21109	0	\N	\N	\N	\N	\N	tm	211
2110919	Xã Trung Trực	21109	0	\N	\N	\N	\N	\N	tt	211
2110921	Xã Xuân Vân	21109	0	\N	\N	\N	\N	\N	xv	211
2110923	Xã Phúc Ninh	21109	0	\N	\N	\N	\N	\N	pn	211
2110925	Xã Hùng Lợi	21109	0	\N	\N	\N	\N	\N	hl	211
2110927	Xã Trung Sơn	21109	0	\N	\N	\N	\N	\N	ts	211
2110929	Xã Tứ Quận	21109	0	\N	\N	\N	\N	\N	tq	211
2110931	Xã Tân Tiến	21109	0	\N	\N	\N	\N	\N	tt	211
2110933	Xã Tân Long	21109	0	\N	\N	\N	\N	\N	tl	211
2110935	Xã Đạo Viện	21109	0	\N	\N	\N	\N	\N	dv	211
2110937	Xã Thắng Quân	21109	0	\N	\N	\N	\N	\N	tq	211
2110939	Xã Kim Quan	21109	0	\N	\N	\N	\N	\N	kq	211
2110941	Xã Lang Quán	21109	0	\N	\N	\N	\N	\N	lq	211
2110943	Xã Phú Thịnh	21109	0	\N	\N	\N	\N	\N	pt	211
2110945	Xã Trung Môn	21109	0	\N	\N	\N	\N	\N	tm	211
2110947	Xã Công Đa	21109	0	\N	\N	\N	\N	\N	cd	211
2110949	Xã Chân Sơn	21109	0	\N	\N	\N	\N	\N	cs	211
2110951	Xã Thái Bình	21109	0	\N	\N	\N	\N	\N	tb	211
2110953	Xã Kim Phú	21109	0	\N	\N	\N	\N	\N	kp	211
2110955	Xã Tiến Bộ	21109	0	\N	\N	\N	\N	\N	tb	211
2110957	Xã An Khang	21109	0	\N	\N	\N	\N	\N	ak	211
2110959	Xã Lưỡng Vượng	21109	0	\N	\N	\N	\N	\N	lv	211
2110961	Xã Hoàng Khai	21109	0	\N	\N	\N	\N	\N	hk	211
2110963	Xã Phú Lâm	21109	0	\N	\N	\N	\N	\N	pl	211
2110965	Xã Mỹ Bằng	21109	0	\N	\N	\N	\N	\N	mb	211
2110967	Xã Thái Long	21109	0	\N	\N	\N	\N	\N	tl	211
2110969	Xã Đội Cấn	21109	0	\N	\N	\N	\N	\N	dc	211
2110971	Xã An Khê	21109	0	\N	\N	\N	\N	\N	ak	211
2110973	Xã Đội Bình	21109	0	\N	\N	\N	\N	\N	db	211
2111100	Không xác định	21111	0	\N	\N	\N	\N	\N	kx	211
2111101	Thị trấn Sơn Dương	21111	0	\N	\N	\N	\N	\N	sd	211
2111103	Thị trấn NT Tân Trào	21111	0	\N	\N	\N	\N	\N	ntt	211
2111105	Xã Trung Yên	21111	0	\N	\N	\N	\N	\N	ty	211
2111107	Xã Minh Thanh	21111	0	\N	\N	\N	\N	\N	mt	211
2111109	Xã Tân Trào	21111	0	\N	\N	\N	\N	\N	tt	211
2111111	Xã Vĩnh Lợi	21111	0	\N	\N	\N	\N	\N	vl	211
2111113	Xã Bình Yên	21111	0	\N	\N	\N	\N	\N	by	211
2111115	Xã Thượng ấm	21111	0	\N	\N	\N	\N	\N	to	211
2111117	Xã Lương Thiện	21111	0	\N	\N	\N	\N	\N	lt	211
2111119	Xã Tú Thịnh	21111	0	\N	\N	\N	\N	\N	tt	211
2111121	Xã Hợp Thành	21111	0	\N	\N	\N	\N	\N	ht	211
2111123	Xã Cấp Tiến	21111	0	\N	\N	\N	\N	\N	ct	211
2111125	Xã Đông Thọ	21111	0	\N	\N	\N	\N	\N	dt	211
2111127	Xã Kháng Nhật	21111	0	\N	\N	\N	\N	\N	kn	211
2111129	Xã Phúc ứng	21111	0	\N	\N	\N	\N	\N	pu	211
2111131	Xã Quyết Thắng	21111	0	\N	\N	\N	\N	\N	qt	211
2111133	Xã Hợp Hòa	21111	0	\N	\N	\N	\N	\N	hh	211
2111135	Xã Đồng Quý	21111	0	\N	\N	\N	\N	\N	dq	211
2111137	Xã Thanh Phát	21111	0	\N	\N	\N	\N	\N	tp	211
2111139	Xã Văn Phú	21111	0	\N	\N	\N	\N	\N	vp	211
2111141	Xã Vân Sơn	21111	0	\N	\N	\N	\N	\N	vs	211
2111143	Xã Chi Thiết	21111	0	\N	\N	\N	\N	\N	ct	211
2111145	Xã Tuân Lộ	21111	0	\N	\N	\N	\N	\N	tl	211
2111147	Xã Thiện Kế	21111	0	\N	\N	\N	\N	\N	tk	211
2111149	Xã Hồng Lạc	21111	0	\N	\N	\N	\N	\N	hl	211
2111151	Xã Đông Lợi	21111	0	\N	\N	\N	\N	\N	dl	211
2111153	Xã Phú Lương	21111	0	\N	\N	\N	\N	\N	pl	211
2111155	Xã Ninh Lai	21111	0	\N	\N	\N	\N	\N	nl	211
2111157	Xã Sầm Dương	21111	0	\N	\N	\N	\N	\N	sd	211
2111159	Xã Hào Phú	21111	0	\N	\N	\N	\N	\N	hp	211
2111161	Xã Sơn Nam	21111	0	\N	\N	\N	\N	\N	sn	211
2111163	Xã Tam Đa	21111	0	\N	\N	\N	\N	\N	td	211
2111165	Xã Đại Phú	21111	0	\N	\N	\N	\N	\N	dp	211
2111167	Xã Lâm Xuyên	21111	0	\N	\N	\N	\N	\N	lx	211
2130000	Không xác định	21300	0	\N	\N	\N	\N	\N	kx	213
2130100	Không xác định	21301	0	\N	\N	\N	\N	\N	kx	213
2130101	Phường Nguyễn Thái Học	21301	0	\N	\N	\N	\N	\N	nth	213
2130103	Phường Hồng Hà	21301	0	\N	\N	\N	\N	\N	hh	213
2130105	Phường Nguyễn Phúc	21301	0	\N	\N	\N	\N	\N	np	213
2130107	Phường Minh Tân	21301	0	\N	\N	\N	\N	\N	mt	213
2130109	Phường Yên Ninh	21301	0	\N	\N	\N	\N	\N	yn	213
2130111	Phường Đồng Tâm	21301	0	\N	\N	\N	\N	\N	dt	213
2130113	Phường Yên Thịnh	21301	0	\N	\N	\N	\N	\N	yt	213
2130115	Xã Nam Cường	21301	0	\N	\N	\N	\N	\N	nc	213
2130117	Xã Tuy Lộc	21301	0	\N	\N	\N	\N	\N	tl	213
2130119	Xã Minh Bảo	21301	0	\N	\N	\N	\N	\N	mb	213
2130121	Xã Tân Thịnh	21301	0	\N	\N	\N	\N	\N	tt	213
2130300	Không xác định	21303	0	\N	\N	\N	\N	\N	kx	213
2130301	Phường Trung Tâm	21303	0	\N	\N	\N	\N	\N	tt	213
2130303	Phường Pú Trạng	21303	0	\N	\N	\N	\N	\N	pt	213
2130305	Phường Tân An	21303	0	\N	\N	\N	\N	\N	ta	213
2130307	Phường Cầu Thia	21303	0	\N	\N	\N	\N	\N	ct	213
2130500	Không xác định	21305	0	\N	\N	\N	\N	\N	kx	213
2130501	Thị trấn Yên Thế	21305	0	\N	\N	\N	\N	\N	yt	213
2130503	Xã Yên Thắng	21305	0	\N	\N	\N	\N	\N	yt	213
2130505	Xã Tân Phượng	21305	0	\N	\N	\N	\N	\N	tp	213
2130507	Xã Lâm Thượng	21305	0	\N	\N	\N	\N	\N	lt	213
2130509	Xã Khánh Thiện	21305	0	\N	\N	\N	\N	\N	kt	213
2130511	Xã Minh Chuẩn	21305	0	\N	\N	\N	\N	\N	mc	213
2130513	Xã Mai Sơn	21305	0	\N	\N	\N	\N	\N	ms	213
2130515	Xã An Lạc	21305	0	\N	\N	\N	\N	\N	al	213
2130517	Xã Khai Trung	21305	0	\N	\N	\N	\N	\N	kt	213
2130519	Xã Minh Xuân	21305	0	\N	\N	\N	\N	\N	mx	213
2130521	Xã Mường Lai	21305	0	\N	\N	\N	\N	\N	ml	213
2130523	Xã Khánh Hoà	21305	0	\N	\N	\N	\N	\N	kh	213
2130525	Xã Tô Mậu	21305	0	\N	\N	\N	\N	\N	tm	213
2130527	Xã Tân Lĩnh	21305	0	\N	\N	\N	\N	\N	tl	213
2130529	Xã Trúc Lâu	21305	0	\N	\N	\N	\N	\N	tl	213
2130531	Xã Động Quan	21305	0	\N	\N	\N	\N	\N	dq	213
2130533	Xã Liễu Đô	21305	0	\N	\N	\N	\N	\N	ld	213
2130535	Xã Vĩnh Lạc	21305	0	\N	\N	\N	\N	\N	vl	213
2130537	Xã Phúc Lợi	21305	0	\N	\N	\N	\N	\N	pl	213
2130539	Xã Tân Lập	21305	0	\N	\N	\N	\N	\N	tl	213
2130541	Xã Minh Tiến	21305	0	\N	\N	\N	\N	\N	mt	213
2130543	Xã Trung Tâm	21305	0	\N	\N	\N	\N	\N	tt	213
2130545	Xã Phan Thanh	21305	0	\N	\N	\N	\N	\N	pt	213
2130547	Xã An Phú	21305	0	\N	\N	\N	\N	\N	ap	213
2130700	Không xác định	21307	0	\N	\N	\N	\N	\N	kx	213
2130701	Thị trấn Mậu A	21307	0	\N	\N	\N	\N	\N	ma	213
2130703	Xã Lang Thíp	21307	0	\N	\N	\N	\N	\N	lt	213
2130705	Xã Châu Quế Thượng	21307	0	\N	\N	\N	\N	\N	cqt	213
2130707	Xã Lâm Giang	21307	0	\N	\N	\N	\N	\N	lg	213
2130709	Xã Châu Quế Hạ	21307	0	\N	\N	\N	\N	\N	cqh	213
2130711	Xã An Bình	21307	0	\N	\N	\N	\N	\N	ab	213
2130713	Xã Đông An	21307	0	\N	\N	\N	\N	\N	da	213
2130715	Xã Quang Minh	21307	0	\N	\N	\N	\N	\N	qm	213
2130717	Xã Phong Dụ Hạ	21307	0	\N	\N	\N	\N	\N	pdh	213
2130719	Xã Đông Cuông	21307	0	\N	\N	\N	\N	\N	dc	213
2130721	Xã Phong Dụ Thượng	21307	0	\N	\N	\N	\N	\N	pdt	213
2130723	Xã Xuân Tầm	21307	0	\N	\N	\N	\N	\N	xt	213
2130725	Xã Tân Hợp	21307	0	\N	\N	\N	\N	\N	th	213
2130727	Xã Mậu Đông	21307	0	\N	\N	\N	\N	\N	md	213
2130729	Xã Ngòi A	21307	0	\N	\N	\N	\N	\N	na	213
2130731	Xã An Thịnh	21307	0	\N	\N	\N	\N	\N	at	213
2130733	Xã Yên Thái	21307	0	\N	\N	\N	\N	\N	yt	213
2130735	Xã Đại Phác	21307	0	\N	\N	\N	\N	\N	dp	213
2130737	Xã Yên Hợp	21307	0	\N	\N	\N	\N	\N	yh	213
2130739	Xã Yên Hưng	21307	0	\N	\N	\N	\N	\N	yh	213
2130741	Xã Đại Sơn	21307	0	\N	\N	\N	\N	\N	ds	213
2130743	Xã Nà Hẩu	21307	0	\N	\N	\N	\N	\N	nh	213
2130745	Xã Yên Phú	21307	0	\N	\N	\N	\N	\N	yp	213
2130747	Xã Xuân ái	21307	0	\N	\N	\N	\N	\N	xa	213
2130749	Xã Mỏ Vàng	21307	0	\N	\N	\N	\N	\N	mv	213
2130751	Xã Viễn Sơn	21307	0	\N	\N	\N	\N	\N	vs	213
2130753	Xã Hoàng Thắng	21307	0	\N	\N	\N	\N	\N	ht	213
2130900	Không xác định	21309	0	\N	\N	\N	\N	\N	kx	213
2130901	Xã Mồ Dề	21309	0	\N	\N	\N	\N	\N	md	213
2130903	Xã Kim Nọi	21309	0	\N	\N	\N	\N	\N	kn	213
2130905	Xã Hồ Bốn	21309	0	\N	\N	\N	\N	\N	hb	213
2130907	Xã Khao Mang	21309	0	\N	\N	\N	\N	\N	km	213
2130909	Xã Chế Cu Nha	21309	0	\N	\N	\N	\N	\N	ccn	213
2130911	Xã Nậm Có	21309	0	\N	\N	\N	\N	\N	nc	213
2130913	Xã Lao Chải	21309	0	\N	\N	\N	\N	\N	lc	213
2130915	Xã Dế Su Phình	21309	0	\N	\N	\N	\N	\N	dsp	213
2130917	Xã La Pán Tẩn	21309	0	\N	\N	\N	\N	\N	lpt	213
2130919	Xã Cao Phạ	21309	0	\N	\N	\N	\N	\N	cp	213
2130921	Xã Chế Tạo	21309	0	\N	\N	\N	\N	\N	ct	213
2130923	Xã Púng Luông	21309	0	\N	\N	\N	\N	\N	pl	213
2130925	Xã Nậm Khắt	21309	0	\N	\N	\N	\N	\N	nk	213
2150143	Xã Thịnh Đức	21501	0	\N	\N	\N	\N	\N	td	215
2130927	Thị trấn Mù Cang Chải	21309	0	\N	\N	\N	\N	\N	mcc	213
2131100	Không xác định	21311	0	\N	\N	\N	\N	\N	kx	213
2131101	Thị trấn Cổ Phúc	21311	0	\N	\N	\N	\N	\N	cp	213
2131103	Xã Tân Đồng	21311	0	\N	\N	\N	\N	\N	td	213
2131105	Xã Báo Đáp	21311	0	\N	\N	\N	\N	\N	bd	213
2131107	Xã Đào Thịnh	21311	0	\N	\N	\N	\N	\N	dt	213
2131109	Xã Quy Mông	21311	0	\N	\N	\N	\N	\N	qm	213
2131111	Xã Việt Thành	21311	0	\N	\N	\N	\N	\N	vt	213
2131113	Xã Hòa Cuông	21311	0	\N	\N	\N	\N	\N	hc	213
2131115	Xã Kiên Thành	21311	0	\N	\N	\N	\N	\N	kt	213
2131117	Xã Y Can	21311	0	\N	\N	\N	\N	\N	yc	213
2131119	Xã Minh Tiến	21311	0	\N	\N	\N	\N	\N	mt	213
2131121	Xã Nga Quán	21311	0	\N	\N	\N	\N	\N	nq	213
2131123	Xã Minh Quán	21311	0	\N	\N	\N	\N	\N	mq	213
2131125	Xã Cường Thịnh	21311	0	\N	\N	\N	\N	\N	ct	213
2131127	Xã Âu Lâu	21311	0	\N	\N	\N	\N	\N	al	213
2131129	Xã Lương Thịnh	21311	0	\N	\N	\N	\N	\N	lt	213
2131131	Xã Hợp Minh	21311	0	\N	\N	\N	\N	\N	hm	213
2131133	Xã Giới Phiên	21311	0	\N	\N	\N	\N	\N	gp	213
2131135	Xã Hồng Ca	21311	0	\N	\N	\N	\N	\N	hc	213
2131137	Xã Hưng Khánh	21311	0	\N	\N	\N	\N	\N	hk	213
2131139	Xã Hưng Thịnh	21311	0	\N	\N	\N	\N	\N	ht	213
2131141	Xã Việt Cường	21311	0	\N	\N	\N	\N	\N	vc	213
2131143	Xã Minh Quân	21311	0	\N	\N	\N	\N	\N	mq	213
2131145	Xã Bảo Hưng	21311	0	\N	\N	\N	\N	\N	bh	213
2131147	Xã Phúc Lộc	21311	0	\N	\N	\N	\N	\N	pl	213
2131149	Xã Văn Phú	21311	0	\N	\N	\N	\N	\N	vp	213
2131151	Xã Văn Tiến	21311	0	\N	\N	\N	\N	\N	vt	213
2131153	Xã Văn Lãng	21311	0	\N	\N	\N	\N	\N	vl	213
2131155	Xã Việt Hồng	21311	0	\N	\N	\N	\N	\N	vh	213
2131157	Xã Vân Hội	21311	0	\N	\N	\N	\N	\N	vh	213
2131300	Không xác định	21313	0	\N	\N	\N	\N	\N	kx	213
2131301	Thị trấn Yên Bình	21313	0	\N	\N	\N	\N	\N	yb	213
2131303	Thị trấn Thác Bà	21313	0	\N	\N	\N	\N	\N	tb	213
2131305	Xã Xuân Long	21313	0	\N	\N	\N	\N	\N	xl	213
2131307	Xã Ngọc Chấn	21313	0	\N	\N	\N	\N	\N	nc	213
2131309	Xã Tích Cốc	21313	0	\N	\N	\N	\N	\N	tc	213
2131311	Xã Tân Nguyên	21313	0	\N	\N	\N	\N	\N	tn	213
2131313	Xã Phúc Ninh	21313	0	\N	\N	\N	\N	\N	pn	213
2131315	Xã Mỹ Gia	21313	0	\N	\N	\N	\N	\N	mg	213
2131317	Xã Cẩm Nhân	21313	0	\N	\N	\N	\N	\N	cn	213
2131319	Xã Bảo ái	21313	0	\N	\N	\N	\N	\N	ba	213
2131321	Xã Cẩm Ân	21313	0	\N	\N	\N	\N	\N	ca	213
2131323	Xã Xuân Lai	21313	0	\N	\N	\N	\N	\N	xl	213
2131325	Xã Tân Hương	21313	0	\N	\N	\N	\N	\N	th	213
2131327	Xã Mông Sơn	21313	0	\N	\N	\N	\N	\N	ms	213
2131329	Xã Yên Thành	21313	0	\N	\N	\N	\N	\N	yt	213
2131331	Xã Đại Đồng	21313	0	\N	\N	\N	\N	\N	dd	213
2131333	Xã Phúc An	21313	0	\N	\N	\N	\N	\N	pa	213
2131335	Xã Phú Thịnh	21313	0	\N	\N	\N	\N	\N	pt	213
2131337	Xã Vũ Linh	21313	0	\N	\N	\N	\N	\N	vl	213
2131339	Xã Bạch Hà	21313	0	\N	\N	\N	\N	\N	bh	213
2131341	Xã Thịnh Hưng	21313	0	\N	\N	\N	\N	\N	th	213
2131343	Xã Vĩnh Kiên	21313	0	\N	\N	\N	\N	\N	vk	213
2131345	Xã Yên Bình	21313	0	\N	\N	\N	\N	\N	yb	213
2131347	Xã Hán Đà	21313	0	\N	\N	\N	\N	\N	hd	213
2131349	Xã Đại Minh	21313	0	\N	\N	\N	\N	\N	dm	213
2131500	Không xác định	21315	0	\N	\N	\N	\N	\N	kx	213
2131501	Thị trấn NT Liên Sơn	21315	0	\N	\N	\N	\N	\N	nls	213
2131503	Thị trấn NT Nghĩa Lộ	21315	0	\N	\N	\N	\N	\N	nnl	213
2131505	Thị trấn NT Trần Phú	21315	0	\N	\N	\N	\N	\N	ntp	213
2131507	Xã Tú Lệ	21315	0	\N	\N	\N	\N	\N	tl	213
2131509	Xã Nậm Búng	21315	0	\N	\N	\N	\N	\N	nb	213
2131511	Xã Gia Hội	21315	0	\N	\N	\N	\N	\N	gh	213
2131513	Xã Nậm Mười	21315	0	\N	\N	\N	\N	\N	nm	213
2131515	Xã Sùng Đô	21315	0	\N	\N	\N	\N	\N	sd	213
2131517	Xã Nậm Lành	21315	0	\N	\N	\N	\N	\N	nl	213
2131519	Xã Sơn Lương	21315	0	\N	\N	\N	\N	\N	sl	213
2131521	Xã Suối Quyền	21315	0	\N	\N	\N	\N	\N	sq	213
2131523	Xã An Lương	21315	0	\N	\N	\N	\N	\N	al	213
2131525	Xã Sơn A	21315	0	\N	\N	\N	\N	\N	sa	213
2131527	Xã Nghĩa Lợi	21315	0	\N	\N	\N	\N	\N	nl	213
2131529	Xã Nghĩa Phúc	21315	0	\N	\N	\N	\N	\N	np	213
2131531	Xã Phù Nham	21315	0	\N	\N	\N	\N	\N	pn	213
2131533	Xã Suối Giàng	21315	0	\N	\N	\N	\N	\N	sg	213
2131535	Xã Nghĩa Sơn	21315	0	\N	\N	\N	\N	\N	ns	213
2131537	Xã Nghĩa An	21315	0	\N	\N	\N	\N	\N	na	213
2131539	Xã Thanh Lương	21315	0	\N	\N	\N	\N	\N	tl	213
2131541	Xã Sơn Thịnh	21315	0	\N	\N	\N	\N	\N	st	213
2131543	Xã Hạnh Sơn	21315	0	\N	\N	\N	\N	\N	hs	213
2131545	Xã Phúc Sơn	21315	0	\N	\N	\N	\N	\N	ps	213
2131547	Xã Thạch Lương	21315	0	\N	\N	\N	\N	\N	tl	213
2131549	Xã Suối Bu	21315	0	\N	\N	\N	\N	\N	sb	213
2131551	Xã Đồng Khê	21315	0	\N	\N	\N	\N	\N	dk	213
2131553	Xã Cát Thịnh	21315	0	\N	\N	\N	\N	\N	ct	213
2131555	Xã Tân Thịnh	21315	0	\N	\N	\N	\N	\N	tt	213
2131557	Xã Đại Lịch	21315	0	\N	\N	\N	\N	\N	dl	213
2131559	Xã Chấn Thịnh	21315	0	\N	\N	\N	\N	\N	ct	213
2131561	Xã Bình Thuận	21315	0	\N	\N	\N	\N	\N	bt	213
2131563	Xã Thượng Bằng La	21315	0	\N	\N	\N	\N	\N	tbl	213
2131565	Xã Nghĩa Tâm	21315	0	\N	\N	\N	\N	\N	nt	213
2131567	Xã Minh An	21315	0	\N	\N	\N	\N	\N	ma	213
2131700	Không xác định	21317	0	\N	\N	\N	\N	\N	kx	213
2131701	Xã Hát Lìu	21317	0	\N	\N	\N	\N	\N	hl	213
2131703	Xã Túc Đán	21317	0	\N	\N	\N	\N	\N	td	213
2131705	Xã Xà Hồ	21317	0	\N	\N	\N	\N	\N	xh	213
2131707	Xã Pá Lau	21317	0	\N	\N	\N	\N	\N	pl	213
2131709	Xã Bản Công	21317	0	\N	\N	\N	\N	\N	bc	213
2131711	Xã Trạm Tấu	21317	0	\N	\N	\N	\N	\N	tt	213
2131713	Xã Pá Hu	21317	0	\N	\N	\N	\N	\N	ph	213
2131715	Xã Làng Nhì	21317	0	\N	\N	\N	\N	\N	ln	213
2131717	Xã Phình Hồ	21317	0	\N	\N	\N	\N	\N	ph	213
2131719	Xã Bản Mù	21317	0	\N	\N	\N	\N	\N	bm	213
2131721	Xã Tà Si Láng	21317	0	\N	\N	\N	\N	\N	tsl	213
2131723	Thị trấn Trạm Tấu	21317	0	\N	\N	\N	\N	\N	tt	213
2150000	Không xác định	21500	0	\N	\N	\N	\N	\N	kx	215
2150100	Không xác định	21501	0	\N	\N	\N	\N	\N	kx	215
2150101	Phường Trưng Vương	21501	0	\N	\N	\N	\N	\N	tv	215
2150103	Phường Tân Long	21501	0	\N	\N	\N	\N	\N	tl	215
2150105	Phường Quán Triều	21501	0	\N	\N	\N	\N	\N	qt	215
2150107	Phường Quang Vinh	21501	0	\N	\N	\N	\N	\N	qv	215
2150109	Phường Quang Trung	21501	0	\N	\N	\N	\N	\N	qt	215
2150111	Phường Hoàng Văn Thụ	21501	0	\N	\N	\N	\N	\N	hvt	215
2150113	Phường Đồng Quang	21501	0	\N	\N	\N	\N	\N	dq	215
2150115	Phường Phan Đình Phùng	21501	0	\N	\N	\N	\N	\N	pdp	215
2150117	Phường Túc Duyên	21501	0	\N	\N	\N	\N	\N	td	215
2150119	Phường Tân Thịnh	21501	0	\N	\N	\N	\N	\N	tt	215
2150121	Phường Gia Sàng	21501	0	\N	\N	\N	\N	\N	gs	215
2150123	Phường Tân Lập	21501	0	\N	\N	\N	\N	\N	tl	215
2150125	Phường Phú Xá	21501	0	\N	\N	\N	\N	\N	px	215
2150127	Phường Cam Giá	21501	0	\N	\N	\N	\N	\N	cg	215
2150129	Phường Trung Thành	21501	0	\N	\N	\N	\N	\N	tt	215
2150131	Phường Hương Sơn	21501	0	\N	\N	\N	\N	\N	hs	215
2150133	Phường Tân Thành	21501	0	\N	\N	\N	\N	\N	tt	215
2150135	Xã Phúc Hà	21501	0	\N	\N	\N	\N	\N	ph	215
2150137	Xã Phúc Xuân	21501	0	\N	\N	\N	\N	\N	px	215
2150139	Xã Thịnh Đán	21501	0	\N	\N	\N	\N	\N	td	215
2150141	Xã Phúc Trìu	21501	0	\N	\N	\N	\N	\N	pt	215
2150145	Xã Tân Cương	21501	0	\N	\N	\N	\N	\N	tc	215
2150147	Xã Tích Lương	21501	0	\N	\N	\N	\N	\N	tl	215
2150149	Xã Lương Sơn	21501	0	\N	\N	\N	\N	\N	ls	215
2150300	Không xác định	21503	0	\N	\N	\N	\N	\N	kx	215
2150301	Phường Thắng Lợi	21503	0	\N	\N	\N	\N	\N	tl	215
2150303	Phường Lương Châu	21503	0	\N	\N	\N	\N	\N	lc	215
2150305	Phường Mỏ Chè	21503	0	\N	\N	\N	\N	\N	mc	215
2150307	Xã Tân Quang	21503	0	\N	\N	\N	\N	\N	tq	215
2150309	Xã Bá Xuyên	21503	0	\N	\N	\N	\N	\N	bx	215
2150311	Xã Vĩnh Sơn	21503	0	\N	\N	\N	\N	\N	vs	215
2150313	Phường Cải Đan	21503	0	\N	\N	\N	\N	\N	cd	215
2150315	Phường Phố Cò	21503	0	\N	\N	\N	\N	\N	pc	215
2150317	Xã Bình Sơn	21503	0	\N	\N	\N	\N	\N	bs	215
2150500	Không xác định	21505	0	\N	\N	\N	\N	\N	kx	215
2150501	Thị trấn Chợ Chu	21505	0	\N	\N	\N	\N	\N	cc	215
2150503	Xã Linh Thông	21505	0	\N	\N	\N	\N	\N	lt	215
2150505	Xã Lam Vỹ	21505	0	\N	\N	\N	\N	\N	lv	215
2150507	Xã Quy Kỳ	21505	0	\N	\N	\N	\N	\N	qk	215
2150509	Xã Tân Thịnh	21505	0	\N	\N	\N	\N	\N	tt	215
2150511	Xã Kim Phượng	21505	0	\N	\N	\N	\N	\N	kp	215
2150513	Xã Kim Sơn	21505	0	\N	\N	\N	\N	\N	ks	215
2150515	Xã Bảo Linh	21505	0	\N	\N	\N	\N	\N	bl	215
2150517	Xã Phúc Chu	21505	0	\N	\N	\N	\N	\N	pc	215
2150519	Xã Tân Dương	21505	0	\N	\N	\N	\N	\N	td	215
2150521	Xã Phượng Tiến	21505	0	\N	\N	\N	\N	\N	pt	215
2150523	Xã Bảo Cường	21505	0	\N	\N	\N	\N	\N	bc	215
2150525	Xã Đồng Thịnh	21505	0	\N	\N	\N	\N	\N	dt	215
2150527	Xã Định Biên	21505	0	\N	\N	\N	\N	\N	db	215
2150529	Xã Trung Hội	21505	0	\N	\N	\N	\N	\N	th	215
2150531	Xã Thanh Định	21505	0	\N	\N	\N	\N	\N	td	215
2150533	Xã Trung Lương	21505	0	\N	\N	\N	\N	\N	tl	215
2150535	Xã Bình Yên	21505	0	\N	\N	\N	\N	\N	by	215
2150537	Xã Điềm Mặc	21505	0	\N	\N	\N	\N	\N	dm	215
2150539	Xã Phú Tiến	21505	0	\N	\N	\N	\N	\N	pt	215
2150541	Xã Bộc Nhiêu	21505	0	\N	\N	\N	\N	\N	bn	215
2150543	Xã Sơn Phú	21505	0	\N	\N	\N	\N	\N	sp	215
2150545	Xã Phú Đình	21505	0	\N	\N	\N	\N	\N	pd	215
2150547	Xã Bình Thành	21505	0	\N	\N	\N	\N	\N	bt	215
2150700	Không xác định	21507	0	\N	\N	\N	\N	\N	kx	215
2150701	Thị trấn Đình Cả	21507	0	\N	\N	\N	\N	\N	dc	215
2150703	Xã Sảng Mộc	21507	0	\N	\N	\N	\N	\N	sm	215
2150705	Xã Nghinh Tường	21507	0	\N	\N	\N	\N	\N	nt	215
2150707	Xã Thần Xa	21507	0	\N	\N	\N	\N	\N	tx	215
2150709	Xã Vũ Chấn	21507	0	\N	\N	\N	\N	\N	vc	215
2150711	Xã Thượng Nung	21507	0	\N	\N	\N	\N	\N	tn	215
2150713	Xã Phú Thượng	21507	0	\N	\N	\N	\N	\N	pt	215
2150715	Xã Cúc Đường	21507	0	\N	\N	\N	\N	\N	cd	215
2150717	Xã Lâu Thượng	21507	0	\N	\N	\N	\N	\N	lt	215
2150719	Xã Tràng Xá	21507	0	\N	\N	\N	\N	\N	tx	215
2150721	Xã Phương Giao	21507	0	\N	\N	\N	\N	\N	pg	215
2150723	Xã La Hiên	21507	0	\N	\N	\N	\N	\N	lh	215
2150725	Xã Liên Minh	21507	0	\N	\N	\N	\N	\N	lm	215
2150727	Xã Dân Tiến	21507	0	\N	\N	\N	\N	\N	dt	215
2150729	Xã Bình Long	21507	0	\N	\N	\N	\N	\N	bl	215
2150900	Không xác định	21509	0	\N	\N	\N	\N	\N	kx	215
2150901	Thị trấn Đu	21509	0	\N	\N	\N	\N	\N	d	215
2150903	Thị trấn Giang Tiên	21509	0	\N	\N	\N	\N	\N	gt	215
2150905	Xã Yên Ninh	21509	0	\N	\N	\N	\N	\N	yn	215
2150907	Xã Yên Trạch	21509	0	\N	\N	\N	\N	\N	yt	215
2150909	Xã Yên Đổ	21509	0	\N	\N	\N	\N	\N	yd	215
2150911	Xã Yên Lạc	21509	0	\N	\N	\N	\N	\N	yl	215
2150913	Xã Ôn Lương	21509	0	\N	\N	\N	\N	\N	olv	215
2150915	Xã Động Đạt	21509	0	\N	\N	\N	\N	\N	dd	215
2150917	Xã Phủ Lý	21509	0	\N	\N	\N	\N	\N	pl	215
2150919	Xã Hợp Thành	21509	0	\N	\N	\N	\N	\N	ht	215
2150921	Xã Phú Đô	21509	0	\N	\N	\N	\N	\N	pd	215
2150923	Xã Tức Tranh	21509	0	\N	\N	\N	\N	\N	tt	215
2150925	Xã Phấn Mễ	21509	0	\N	\N	\N	\N	\N	pm	215
2150927	Xã Vô Tranh	21509	0	\N	\N	\N	\N	\N	vt	215
2150929	Xã Cổ Lũng	21509	0	\N	\N	\N	\N	\N	cl	215
2150931	Xã Sơn Cẩm	21509	0	\N	\N	\N	\N	\N	sc	215
2151100	Không xác định	21511	0	\N	\N	\N	\N	\N	kx	215
2151101	Thị trấn Chùa Hang	21511	0	\N	\N	\N	\N	\N	ch	215
2151103	Thị trấn Sông Cầu	21511	0	\N	\N	\N	\N	\N	sc	215
2151105	Thị trấn Trại Cau	21511	0	\N	\N	\N	\N	\N	tc	215
2151107	Xã Văn Lăng	21511	0	\N	\N	\N	\N	\N	vl	215
2151109	Xã Tân Long	21511	0	\N	\N	\N	\N	\N	tl	215
2151111	Xã Hòa Bình	21511	0	\N	\N	\N	\N	\N	hb	215
2151113	Xã Quang Sơn	21511	0	\N	\N	\N	\N	\N	qs	215
2151115	Xã Minh Lập	21511	0	\N	\N	\N	\N	\N	ml	215
2151117	Xã Văn Hán	21511	0	\N	\N	\N	\N	\N	vh	215
2151119	Xã Hóa Trung	21511	0	\N	\N	\N	\N	\N	ht	215
2151121	Xã Khe Mo	21511	0	\N	\N	\N	\N	\N	km	215
2151123	Xã Cây Thị	21511	0	\N	\N	\N	\N	\N	ct	215
2151125	Xã Hóa Thượng	21511	0	\N	\N	\N	\N	\N	ht	215
2151127	Xã Hợp Tiến	21511	0	\N	\N	\N	\N	\N	ht	215
2151129	Xã Cao Ngạn	21511	0	\N	\N	\N	\N	\N	cn	215
2151131	Xã Tân Lợi	21511	0	\N	\N	\N	\N	\N	tl	215
2151133	Xã Linh Sơn	21511	0	\N	\N	\N	\N	\N	ls	215
2151135	Xã Nam Hòa	21511	0	\N	\N	\N	\N	\N	nh	215
2151137	Xã Đồng Bẩm	21511	0	\N	\N	\N	\N	\N	db	215
2151139	Xã Huống Thượng	21511	0	\N	\N	\N	\N	\N	ht	215
2151300	Không xác định	21513	0	\N	\N	\N	\N	\N	kx	215
2151301	Thị trấn Đại Từ	21513	0	\N	\N	\N	\N	\N	dt	215
2151303	Thị trấn Quân Chu	21513	0	\N	\N	\N	\N	\N	qc	215
2151305	Xã Phúc Lương	21513	0	\N	\N	\N	\N	\N	pl	215
2151307	Xã Minh Tiến	21513	0	\N	\N	\N	\N	\N	mt	215
2151309	Xã Yên Lãng	21513	0	\N	\N	\N	\N	\N	yl	215
2151311	Xã Đức Lương	21513	0	\N	\N	\N	\N	\N	dl	215
2151313	Xã Phú Cường	21513	0	\N	\N	\N	\N	\N	pc	215
2151315	Xã Na Mao	21513	0	\N	\N	\N	\N	\N	nm	215
2151317	Xã Phú Lạc	21513	0	\N	\N	\N	\N	\N	pl	215
2151319	Xã Phục Linh	21513	0	\N	\N	\N	\N	\N	pl	215
2151321	Xã Phú Thịnh	21513	0	\N	\N	\N	\N	\N	pt	215
2151323	Xã Phú Xuyên	21513	0	\N	\N	\N	\N	\N	px	215
2151325	Xã Bản Ngoại	21513	0	\N	\N	\N	\N	\N	bn	215
2151327	Xã Tiên Hội	21513	0	\N	\N	\N	\N	\N	th	215
2151331	Xã Cù Vân	21513	0	\N	\N	\N	\N	\N	cv	215
2151333	Xã La Bằng	21513	0	\N	\N	\N	\N	\N	lb	215
2151335	Xã Hà Thượng	21513	0	\N	\N	\N	\N	\N	ht	215
2151337	Xã Hoàng Nông	21513	0	\N	\N	\N	\N	\N	hn	215
2151339	Xã Khôi Kỳ	21513	0	\N	\N	\N	\N	\N	kk	215
2151341	Xã An Khánh	21513	0	\N	\N	\N	\N	\N	ak	215
2151343	Xã Tân Thái	21513	0	\N	\N	\N	\N	\N	tt	215
2151345	Xã Bình Thuận	21513	0	\N	\N	\N	\N	\N	bt	215
2151347	Xã Lục Ba	21513	0	\N	\N	\N	\N	\N	lb	215
2151349	Xã Mỹ Yên	21513	0	\N	\N	\N	\N	\N	my	215
2151351	Xã Văn Yên	21513	0	\N	\N	\N	\N	\N	vy	215
2151353	Xã Ký Phú	21513	0	\N	\N	\N	\N	\N	kp	215
2151355	Xã Vạn Thọ	21513	0	\N	\N	\N	\N	\N	vt	215
2151357	Xã Cát Nê	21513	0	\N	\N	\N	\N	\N	cn	215
2151359	Xã Quân Chu	21513	0	\N	\N	\N	\N	\N	qc	215
2151361	Xã Tân Linh	21513	0	\N	\N	\N	\N	\N	tl	215
2151500	Không xác định	21515	0	\N	\N	\N	\N	\N	kx	215
2151501	Thị trấn úc Sơn	21515	0	\N	\N	\N	\N	\N	us	215
2151503	Xã Bàn Đạt	21515	0	\N	\N	\N	\N	\N	bd	215
2151505	Xã Đồng Liên	21515	0	\N	\N	\N	\N	\N	dl	215
2151507	Xã Tân Khánh	21515	0	\N	\N	\N	\N	\N	tk	215
2151509	Xã Tân Kim	21515	0	\N	\N	\N	\N	\N	tk	215
2151511	Xã Tân Thành	21515	0	\N	\N	\N	\N	\N	tt	215
2151513	Xã Đào Xá	21515	0	\N	\N	\N	\N	\N	dx	215
2151515	Xã Thượng Đình	21515	0	\N	\N	\N	\N	\N	td	215
2151517	Xã Bảo Lý	21515	0	\N	\N	\N	\N	\N	bl	215
2151519	Xã Tân Hòa	21515	0	\N	\N	\N	\N	\N	th	215
2151521	Xã Điềm Thụy	21515	0	\N	\N	\N	\N	\N	dt	215
2151523	Xã Hương Sơn	21515	0	\N	\N	\N	\N	\N	hs	215
2151525	Xã Nhã Lộng	21515	0	\N	\N	\N	\N	\N	nl	215
2151527	Xã Xuân Phương	21515	0	\N	\N	\N	\N	\N	xp	215
2151529	Xã Lương Phú	21515	0	\N	\N	\N	\N	\N	lp	215
2151531	Xã Tân Đức	21515	0	\N	\N	\N	\N	\N	td	215
2151533	Xã úc Kỳ	21515	0	\N	\N	\N	\N	\N	uk	215
2151535	Xã Nga My	21515	0	\N	\N	\N	\N	\N	nm	215
2151537	Xã Kha Sơn	21515	0	\N	\N	\N	\N	\N	ks	215
2151539	Xã Thanh Ninh	21515	0	\N	\N	\N	\N	\N	tn	215
2151541	Xã Dương Thành	21515	0	\N	\N	\N	\N	\N	dt	215
2151543	Xã Hà Châu	21515	0	\N	\N	\N	\N	\N	hc	215
2151700	Không xác định	21517	0	\N	\N	\N	\N	\N	kx	215
2151701	Thị trấn Ba Hàng	21517	0	\N	\N	\N	\N	\N	bh	215
2151705	Thị trấn Bắc Sơn	21517	0	\N	\N	\N	\N	\N	bs	215
2151707	Xã Phúc Tân	21517	0	\N	\N	\N	\N	\N	pt	215
2151711	Xã Phúc Thuận	21517	0	\N	\N	\N	\N	\N	pt	215
2151713	Xã Hồng Tiến	21517	0	\N	\N	\N	\N	\N	ht	215
2151715	Xã Minh Đức	21517	0	\N	\N	\N	\N	\N	md	215
2151717	Xã Đắc Sơn	21517	0	\N	\N	\N	\N	\N	ds	215
2151719	Xã Thành Công	21517	0	\N	\N	\N	\N	\N	tc	215
2151721	Xã Đồng Tiến	21517	0	\N	\N	\N	\N	\N	dt	215
2151723	Xã Tiên Phong	21517	0	\N	\N	\N	\N	\N	tp	215
2151725	Xã Vạn Phái	21517	0	\N	\N	\N	\N	\N	vp	215
2151727	Xã Nam Tiến	21517	0	\N	\N	\N	\N	\N	nt	215
2151729	Xã Tân Hương	21517	0	\N	\N	\N	\N	\N	th	215
2151731	Xã Đông Cao	21517	0	\N	\N	\N	\N	\N	dc	215
2151733	Xã Trung Thành	21517	0	\N	\N	\N	\N	\N	tt	215
2151735	Xã Tân Phú	21517	0	\N	\N	\N	\N	\N	tp	215
2151737	Xã Thuận Thành	21517	0	\N	\N	\N	\N	\N	tt	215
2170000	Không xác định	21700	0	\N	\N	\N	\N	\N	kx	217
2170100	Không xác định	21701	0	\N	\N	\N	\N	\N	kx	217
2170101	Phường Tiên Cát	21701	0	\N	\N	\N	\N	\N	tc	217
2170103	Phường Vân Cơ	21701	0	\N	\N	\N	\N	\N	vc	217
2170105	Phường Nông Trang	21701	0	\N	\N	\N	\N	\N	nt	217
2170107	Phường Gia Cẩm	21701	0	\N	\N	\N	\N	\N	gc	217
2170109	Phường Tân Dân	21701	0	\N	\N	\N	\N	\N	td	217
2170111	Phường Thọ Sơn	21701	0	\N	\N	\N	\N	\N	ts	217
2170113	Phường Thanh Miếu	21701	0	\N	\N	\N	\N	\N	tm	217
2170115	Phường Bạch Hạc	21701	0	\N	\N	\N	\N	\N	bh	217
2170117	Xã Phượng Lâu	21701	0	\N	\N	\N	\N	\N	pl	217
2170121	Xã Dữu Lâu	21701	0	\N	\N	\N	\N	\N	dl	217
2170123	Xã Thụy Vân	21701	0	\N	\N	\N	\N	\N	tv	217
2170125	Xã Minh Phương	21701	0	\N	\N	\N	\N	\N	mp	217
2170127	Xã Minh Nông	21701	0	\N	\N	\N	\N	\N	mn	217
2170129	Xã Trưng Vương	21701	0	\N	\N	\N	\N	\N	tv	217
2170131	Xã Sông Lô	21701	0	\N	\N	\N	\N	\N	sl	217
2170300	Không xác định	21703	0	\N	\N	\N	\N	\N	kx	217
2170301	Phường Âu Cơ	21703	0	\N	\N	\N	\N	\N	ac	217
2170303	Phường Phong Châu	21703	0	\N	\N	\N	\N	\N	pc	217
2170305	Phường Hùng Vương	21703	0	\N	\N	\N	\N	\N	hv	217
2170307	Xã Hà Lộc	21703	0	\N	\N	\N	\N	\N	hl	217
2170309	Xã Văn Lung	21703	0	\N	\N	\N	\N	\N	vl	217
2170311	Xã Trường Thịnh	21703	0	\N	\N	\N	\N	\N	tt	217
2170313	Xã Thanh Minh	21703	0	\N	\N	\N	\N	\N	tm	217
2170500	Không xác định	21705	0	\N	\N	\N	\N	\N	kx	217
2170501	Thị trấn Đoan Hùng	21705	0	\N	\N	\N	\N	\N	dh	217
2170503	Xã Đông Khê	21705	0	\N	\N	\N	\N	\N	dk	217
2170505	Xã Nghinh Xuyên	21705	0	\N	\N	\N	\N	\N	nx	217
2170507	Xã Hùng Quan	21705	0	\N	\N	\N	\N	\N	hq	217
2170509	Xã Bằng Luân	21705	0	\N	\N	\N	\N	\N	bl	217
2170511	Xã Vân Du	21705	0	\N	\N	\N	\N	\N	vd	217
2170513	Xã Phương Trung	21705	0	\N	\N	\N	\N	\N	pt	217
2170515	Xã Quế Lâm	21705	0	\N	\N	\N	\N	\N	ql	217
2170517	Xã Minh Lương	21705	0	\N	\N	\N	\N	\N	ml	217
2170519	Xã Bằng Doãn	21705	0	\N	\N	\N	\N	\N	bd	217
2170521	Xã Hữu Đô	21705	0	\N	\N	\N	\N	\N	hd	217
2170523	Xã Ngọc Quan	21705	0	\N	\N	\N	\N	\N	nq	217
2170525	Xã Tây Cốc	21705	0	\N	\N	\N	\N	\N	tc	217
2170527	Xã Phúc Lai	21705	0	\N	\N	\N	\N	\N	pl	217
2170529	Xã Đại Nghĩa	21705	0	\N	\N	\N	\N	\N	dn	217
2170531	Xã Phú Thứ	21705	0	\N	\N	\N	\N	\N	pt	217
2170533	Xã Sóc Đăng	21705	0	\N	\N	\N	\N	\N	sd	217
2170535	Xã Hùng Long	21705	0	\N	\N	\N	\N	\N	hl	217
2170537	Xã Yên Kiện	21705	0	\N	\N	\N	\N	\N	yk	217
2170539	Xã Vụ Quang	21705	0	\N	\N	\N	\N	\N	vq	217
2170541	Xã Vân Đồn	21705	0	\N	\N	\N	\N	\N	vd	217
2170543	Xã Tiêu Sơn	21705	0	\N	\N	\N	\N	\N	ts	217
2170545	Xã Minh Tiến	21705	0	\N	\N	\N	\N	\N	mt	217
2170547	Xã Chân Mộng	21705	0	\N	\N	\N	\N	\N	cm	217
2170549	Xã Minh Phú	21705	0	\N	\N	\N	\N	\N	mp	217
2170551	Xã Phong Phú	21705	0	\N	\N	\N	\N	\N	pp	217
2170553	Xã Chí Đám	21705	0	\N	\N	\N	\N	\N	cd	217
2170700	Không xác định	21707	0	\N	\N	\N	\N	\N	kx	217
2170701	Thị trấn Hạ Hoà	21707	0	\N	\N	\N	\N	\N	hh	217
2170703	Xã Đại Phạm	21707	0	\N	\N	\N	\N	\N	dp	217
2170705	Xã Hậu Bổng	21707	0	\N	\N	\N	\N	\N	hb	217
2170707	Xã Liên Phương	21707	0	\N	\N	\N	\N	\N	lp	217
2170709	Xã Đan Hà	21707	0	\N	\N	\N	\N	\N	dh	217
2170711	Xã Hà Lương	21707	0	\N	\N	\N	\N	\N	hl	217
2170713	Xã Lệnh Khanh	21707	0	\N	\N	\N	\N	\N	lk	217
2170715	Xã Đan Thượng	21707	0	\N	\N	\N	\N	\N	dt	217
2170717	Xã Hiền Lương	21707	0	\N	\N	\N	\N	\N	hl	217
2170719	Xã Quân Khê	21707	0	\N	\N	\N	\N	\N	qk	217
2170721	Xã Động Lâm	21707	0	\N	\N	\N	\N	\N	dl	217
2170723	Xã Phụ Khánh	21707	0	\N	\N	\N	\N	\N	pk	217
2170725	Xã Lâm Lợi	21707	0	\N	\N	\N	\N	\N	ll	217
2170727	Xã Gia Điền	21707	0	\N	\N	\N	\N	\N	gd	217
2170729	Xã Y Sơn	21707	0	\N	\N	\N	\N	\N	ys	217
2170731	Xã ấm Hạ	21707	0	\N	\N	\N	\N	\N	ah	217
2170733	Xã Phương Viên	21707	0	\N	\N	\N	\N	\N	pv	217
2170735	Xã Chuế Lưu	21707	0	\N	\N	\N	\N	\N	cl	217
2170737	Xã Xuân áng	21707	0	\N	\N	\N	\N	\N	xa	217
2170739	Xã Hương Xạ	21707	0	\N	\N	\N	\N	\N	hx	217
2170741	Xã Cáo Điền	21707	0	\N	\N	\N	\N	\N	cd	217
2170743	Xã Minh Hạc	21707	0	\N	\N	\N	\N	\N	mh	217
2170745	Xã Bằng Giã	21707	0	\N	\N	\N	\N	\N	bg	217
2170747	Xã Vô Tranh	21707	0	\N	\N	\N	\N	\N	vt	217
2170749	Xã Văn Lang	21707	0	\N	\N	\N	\N	\N	vl	217
2170751	Xã Yên Kỳ	21707	0	\N	\N	\N	\N	\N	yk	217
2170753	Xã Lang Sơn	21707	0	\N	\N	\N	\N	\N	ls	217
2170755	Xã Yên Luật	21707	0	\N	\N	\N	\N	\N	yl	217
2170757	Xã Chính Công	21707	0	\N	\N	\N	\N	\N	cc	217
2170759	Xã Mai Tùng	21707	0	\N	\N	\N	\N	\N	mt	217
2170761	Xã Minh Côi	21707	0	\N	\N	\N	\N	\N	mc	217
2170763	Xã Vĩnh Chân	21707	0	\N	\N	\N	\N	\N	vc	217
2170765	Xã Vụ Cầu	21707	0	\N	\N	\N	\N	\N	vc	217
2170900	Không xác định	21709	0	\N	\N	\N	\N	\N	kx	217
2170901	Thị trấn Thanh Ba	21709	0	\N	\N	\N	\N	\N	tb	217
2170903	Xã Thanh Vân	21709	0	\N	\N	\N	\N	\N	tv	217
2170905	Xã Hanh Cù	21709	0	\N	\N	\N	\N	\N	hc	217
2170907	Xã Đông Lĩnh	21709	0	\N	\N	\N	\N	\N	dl	217
2151703	Phường  Bãi Bông	21517	0	\N	\N	\N	\N	\N	bb	215
2170909	Xã Đồng Xuân	21709	0	\N	\N	\N	\N	\N	dx	217
2170911	Xã Yển Khê	21709	0	\N	\N	\N	\N	\N	yk	217
2170913	Xã Vũ Yển	21709	0	\N	\N	\N	\N	\N	vy	217
2170915	Xã Đại An	21709	0	\N	\N	\N	\N	\N	da	217
2170917	Xã Thái Ninh	21709	0	\N	\N	\N	\N	\N	tn	217
2170919	Xã Năng Yên	21709	0	\N	\N	\N	\N	\N	ny	217
2170921	Xã Quảng Nạp	21709	0	\N	\N	\N	\N	\N	qn	217
2170923	Xã Ninh Dân	21709	0	\N	\N	\N	\N	\N	nd	217
2170925	Xã Yên Nội	21709	0	\N	\N	\N	\N	\N	yn	217
2170927	Xã Phương Lĩnh	21709	0	\N	\N	\N	\N	\N	pl	217
2170929	Xã Mạn Lạn	21709	0	\N	\N	\N	\N	\N	ml	217
2170931	Xã Khải Xuân	21709	0	\N	\N	\N	\N	\N	kx	217
2170933	Xã Võ Lao	21709	0	\N	\N	\N	\N	\N	vl	217
2170935	Xã Thanh Xá	21709	0	\N	\N	\N	\N	\N	tx	217
2170937	Xã Hoàng Cương	21709	0	\N	\N	\N	\N	\N	hc	217
2170939	Xã Chí Tiên	21709	0	\N	\N	\N	\N	\N	ct	217
2170941	Xã Đông Thành	21709	0	\N	\N	\N	\N	\N	dt	217
2170943	Xã Sơn Cương	21709	0	\N	\N	\N	\N	\N	sc	217
2170945	Xã Thanh Hà	21709	0	\N	\N	\N	\N	\N	th	217
2170947	Xã Đỗ Sơn	21709	0	\N	\N	\N	\N	\N	ds	217
2170949	Xã Đỗ Xuyên	21709	0	\N	\N	\N	\N	\N	dx	217
2170951	Xã Lương Lỗ	21709	0	\N	\N	\N	\N	\N	ll	217
2171100	Không xác định	21711	0	\N	\N	\N	\N	\N	kx	217
2171101	Thị trấn Phong Châu	21711	0	\N	\N	\N	\N	\N	pc	217
2171105	Thị trấn Phú Hộ	21711	0	\N	\N	\N	\N	\N	ph	217
2171107	Xã Phú Mỹ	21711	0	\N	\N	\N	\N	\N	pm	217
2171109	Xã Liên Hoa	21711	0	\N	\N	\N	\N	\N	lh	217
2171111	Xã Trạm Thản	21711	0	\N	\N	\N	\N	\N	tt	217
2171113	Xã Trị Quận	21711	0	\N	\N	\N	\N	\N	tq	217
2171115	Xã Trung Giáp	21711	0	\N	\N	\N	\N	\N	tg	217
2171117	Xã Hạ Giáp	21711	0	\N	\N	\N	\N	\N	hg	217
2171119	Xã Bảo Thanh	21711	0	\N	\N	\N	\N	\N	bt	217
2171121	Xã Tiên Phú	21711	0	\N	\N	\N	\N	\N	tp	217
2171123	Xã Gia Thanh	21711	0	\N	\N	\N	\N	\N	gt	217
2171125	Xã Tiên Du	21711	0	\N	\N	\N	\N	\N	td	217
2171127	Xã Phú Nham	21711	0	\N	\N	\N	\N	\N	pn	217
2171129	Xã Phú Lộc	21711	0	\N	\N	\N	\N	\N	pl	217
2171133	Xã Bình Bộ	21711	0	\N	\N	\N	\N	\N	bb	217
2171135	Xã An Đạo	21711	0	\N	\N	\N	\N	\N	ad	217
2171137	Xã Tử Đà	21711	0	\N	\N	\N	\N	\N	td	217
2171139	Xã Phù Ninh	21711	0	\N	\N	\N	\N	\N	pn	217
2171147	Xã Vĩnh Phú	21711	0	\N	\N	\N	\N	\N	vp	217
2171149	Xã Kim Đức	21711	0	\N	\N	\N	\N	\N	kd	217
2171151	Xã Hùng Lô	21711	0	\N	\N	\N	\N	\N	hl	217
2171201	Thị trấn Lâm Thao	21712	0	\N	\N	\N	\N	\N	lt	217
2171203	Xã Tiên Kiên	21712	0	\N	\N	\N	\N	\N	tk	217
2171205	Xã Xuân Lũng	21712	0	\N	\N	\N	\N	\N	xl	217
2171207	Xã Xuân Huy	21712	0	\N	\N	\N	\N	\N	xh	217
2171209	Xã Hà Thạch	21712	0	\N	\N	\N	\N	\N	ht	217
2171211	Xã Hy Cương	21712	0	\N	\N	\N	\N	\N	hc	217
2171213	Xã Thạch Sơn	21712	0	\N	\N	\N	\N	\N	ts	217
2171215	Xã Chu Hóa	21712	0	\N	\N	\N	\N	\N	ch	217
3051729	Thị trấn Thanh Hà	30517	0	\N	\N	\N	\N	\N	th	305
2171219	Xã Sơn Vy	21712	0	\N	\N	\N	\N	\N	sv	217
2171221	Xã Sơn Dương	21712	0	\N	\N	\N	\N	\N	sd	217
2171223	Xã Hợp Hải	21712	0	\N	\N	\N	\N	\N	hh	217
2171225	Xã Cao Xá	21712	0	\N	\N	\N	\N	\N	cx	217
2171227	Xã Tứ Xã	21712	0	\N	\N	\N	\N	\N	tx	217
2171229	Xã Kinh Kệ	21712	0	\N	\N	\N	\N	\N	kk	217
2171231	Xã Vĩnh Lại	21712	0	\N	\N	\N	\N	\N	vl	217
2171233	Xã Bản Nguyên	21712	0	\N	\N	\N	\N	\N	bn	217
2171300	Không xác định	21713	0	\N	\N	\N	\N	\N	kx	217
2171301	Thị trấn Sông Thao	21713	0	\N	\N	\N	\N	\N	st	217
2171303	Xã Tiên Lương	21713	0	\N	\N	\N	\N	\N	tl	217
2171305	Xã Tuy Lộc	21713	0	\N	\N	\N	\N	\N	tl	217
2171307	Xã Ngô Xá	21713	0	\N	\N	\N	\N	\N	nx	217
2171309	Xã Phượng Vĩ	21713	0	\N	\N	\N	\N	\N	pv	217
2171311	Xã Phương Xá	21713	0	\N	\N	\N	\N	\N	px	217
2171313	Xã Phùng Xá	21713	0	\N	\N	\N	\N	\N	px	217
2171315	Xã Đồng Cam	21713	0	\N	\N	\N	\N	\N	dc	217
2171317	Xã Thụy Liễu	21713	0	\N	\N	\N	\N	\N	tl	217
2171319	Xã Tam Sơn	21713	0	\N	\N	\N	\N	\N	ts	217
2171321	Xã Tùng Khê	21713	0	\N	\N	\N	\N	\N	tk	217
2171323	Xã Văn Bán	21713	0	\N	\N	\N	\N	\N	vb	217
2171325	Xã Sơn Nga	21713	0	\N	\N	\N	\N	\N	sn	217
2171327	Xã Sai Nga	21713	0	\N	\N	\N	\N	\N	sn	217
2171329	Xã Cấp Dẫn	21713	0	\N	\N	\N	\N	\N	cd	217
2171331	Xã Thanh Nga	21713	0	\N	\N	\N	\N	\N	tn	217
2171333	Xã Xương Thịnh	21713	0	\N	\N	\N	\N	\N	xt	217
2171335	Xã Phú Khê	21713	0	\N	\N	\N	\N	\N	pk	217
2171337	Xã Sơn Tình	21713	0	\N	\N	\N	\N	\N	st	217
2171339	Xã Hương Lung	21713	0	\N	\N	\N	\N	\N	hl	217
2171341	Xã Yên Tập	21713	0	\N	\N	\N	\N	\N	yt	217
2171345	Xã Tình Cương	21713	0	\N	\N	\N	\N	\N	tc	217
2171347	Xã Phú Lạc	21713	0	\N	\N	\N	\N	\N	pl	217
2171349	Xã Chương Xá	21713	0	\N	\N	\N	\N	\N	cx	217
2171351	Xã Hiền Đa	21713	0	\N	\N	\N	\N	\N	hd	217
2171353	Xã Văn Khúc	21713	0	\N	\N	\N	\N	\N	vk	217
2171355	Xã Cát Trù	21713	0	\N	\N	\N	\N	\N	ct	217
2171357	Xã Điêu Lương	21713	0	\N	\N	\N	\N	\N	dl	217
2171359	Xã Yên Dưỡng	21713	0	\N	\N	\N	\N	\N	yd	217
2171361	Xã Đồng Lương	21713	0	\N	\N	\N	\N	\N	dl	217
2171500	Không xác định	21715	0	\N	\N	\N	\N	\N	kx	217
2171501	Thị trấn Yên Lập	21715	0	\N	\N	\N	\N	\N	yl	217
2171503	Xã Mỹ Lung	21715	0	\N	\N	\N	\N	\N	ml	217
2171505	Xã Mỹ Lương	21715	0	\N	\N	\N	\N	\N	ml	217
2171507	Xã Lương Sơn	21715	0	\N	\N	\N	\N	\N	ls	217
2171509	Xã Xuân An	21715	0	\N	\N	\N	\N	\N	xa	217
2171511	Xã Trung Sơn	21715	0	\N	\N	\N	\N	\N	ts	217
2171513	Xã Xuân Viên	21715	0	\N	\N	\N	\N	\N	xv	217
2171515	Xã Xuân Thủy	21715	0	\N	\N	\N	\N	\N	xt	217
2171517	Xã Hưng Long	21715	0	\N	\N	\N	\N	\N	hl	217
2171519	Xã Nga Hoàng	21715	0	\N	\N	\N	\N	\N	nh	217
2171521	Xã Thượng Long	21715	0	\N	\N	\N	\N	\N	tl	217
2171523	Xã Đồng Thịnh	21715	0	\N	\N	\N	\N	\N	dt	217
2171525	Xã Đồng Lạc	21715	0	\N	\N	\N	\N	\N	dl	217
2171527	Xã Phúc Khánh	21715	0	\N	\N	\N	\N	\N	pk	217
2171529	Xã Minh Hòa	21715	0	\N	\N	\N	\N	\N	mh	217
2171531	Xã Ngọc Lập	21715	0	\N	\N	\N	\N	\N	nl	217
2171533	Xã Ngọc Đồng	21715	0	\N	\N	\N	\N	\N	nd	217
2171700	Không xác định	21717	0	\N	\N	\N	\N	\N	kx	217
2171701	Thị trấn Hưng Hoá	21717	0	\N	\N	\N	\N	\N	hh	217
2171703	Xã Hiền Quan	21717	0	\N	\N	\N	\N	\N	hq	217
2171705	Xã Vực Trường	21717	0	\N	\N	\N	\N	\N	vt	217
2171707	Xã Thanh Uyên	21717	0	\N	\N	\N	\N	\N	tu	217
2171709	Xã Hương Nha	21717	0	\N	\N	\N	\N	\N	hn	217
2171711	Xã Xuân Quang	21717	0	\N	\N	\N	\N	\N	xq	217
2171713	Xã Tam Cường	21717	0	\N	\N	\N	\N	\N	tc	217
2171715	Xã Văn Lương	21717	0	\N	\N	\N	\N	\N	vl	217
2171717	Xã Tứ Mỹ	21717	0	\N	\N	\N	\N	\N	tm	217
2171719	Xã Hùng Đô	21717	0	\N	\N	\N	\N	\N	hd	217
2171721	Xã Phương Thịnh	21717	0	\N	\N	\N	\N	\N	pt	217
2171723	Xã Quang Húc	21717	0	\N	\N	\N	\N	\N	qh	217
2171725	Xã Tề Lễ	21717	0	\N	\N	\N	\N	\N	tl	217
2171727	Xã Cổ Tiết	21717	0	\N	\N	\N	\N	\N	ct	217
2171729	Xã Hương Nộn	21717	0	\N	\N	\N	\N	\N	hn	217
2171731	Xã Dị Nậu	21717	0	\N	\N	\N	\N	\N	dn	217
2171733	Xã Thọ Văn	21717	0	\N	\N	\N	\N	\N	tv	217
2171735	Xã Dậu Dương	21717	0	\N	\N	\N	\N	\N	dd	217
2171737	Xã Thượng Nông	21717	0	\N	\N	\N	\N	\N	tn	217
2171739	Xã Hồng Đà	21717	0	\N	\N	\N	\N	\N	hd	217
2171801	Xã Xuân Lộc	21718	0	\N	\N	\N	\N	\N	xl	217
2171803	Xã Đào Xá	21718	0	\N	\N	\N	\N	\N	dx	217
2171805	Xã Thạch Đồng	21718	0	\N	\N	\N	\N	\N	td	217
2171807	Xã Tân Phương	21718	0	\N	\N	\N	\N	\N	tp	217
2171809	Xã La Phù	21718	0	\N	\N	\N	\N	\N	lp	217
2171811	Xã Bảo Yên	21718	0	\N	\N	\N	\N	\N	by	217
2171813	Xã Sơn Thủy	21718	0	\N	\N	\N	\N	\N	st	217
2171815	Xã Đoan Hạ	21718	0	\N	\N	\N	\N	\N	dh	217
2171817	Xã Hoàng Xá	21718	0	\N	\N	\N	\N	\N	hx	217
2171819	Xã Đồng Luận	21718	0	\N	\N	\N	\N	\N	dl	217
2171821	Xã Trung Thịnh	21718	0	\N	\N	\N	\N	\N	tt	217
2171823	Xã Trung Nghĩa	21718	0	\N	\N	\N	\N	\N	tn	217
2171825	Xã Phượng Mao	21718	0	\N	\N	\N	\N	\N	pm	217
2171827	Xã Yến Mao	21718	0	\N	\N	\N	\N	\N	ym	217
2171829	Xã Tu Vũ	21718	0	\N	\N	\N	\N	\N	tv	217
2171900	Không xác định	21719	0	\N	\N	\N	\N	\N	kx	217
2171901	Thị trấn Thanh Sơn	21719	0	\N	\N	\N	\N	\N	ts	217
2171903	Xã Sơn Hùng	21719	0	\N	\N	\N	\N	\N	sh	217
2171905	Xã Thục Luyện	21719	0	\N	\N	\N	\N	\N	tl	217
2171907	Xã Giáp Lai	21719	0	\N	\N	\N	\N	\N	gl	217
2171909	Xã Thạch Khoán	21719	0	\N	\N	\N	\N	\N	tk	217
1010427	Yên Sở	10104	0	\N	\N	\N	\N	\N	ys	101
2171911	Xã Địch Quả	21719	0	\N	\N	\N	\N	\N	dq	217
2171913	Xã Cự Thắng	21719	0	\N	\N	\N	\N	\N	ct	217
2171915	Xã Tất Thắng	21719	0	\N	\N	\N	\N	\N	tt	217
2171917	Xã Cự Đồng	21719	0	\N	\N	\N	\N	\N	cd	217
2171919	Xã Thắng Sơn	21719	0	\N	\N	\N	\N	\N	ts	217
2171921	Xã Hương Cần	21719	0	\N	\N	\N	\N	\N	hc	217
2171923	Xã Tân Lập	21719	0	\N	\N	\N	\N	\N	tl	217
2171925	Xã Yên Lương	21719	0	\N	\N	\N	\N	\N	yl	217
2171927	Xã Yên Lãng	21719	0	\N	\N	\N	\N	\N	yl	217
2171929	Xã Yên Sơn	21719	0	\N	\N	\N	\N	\N	ys	217
2171931	Xã Lương Nha	21719	0	\N	\N	\N	\N	\N	ln	217
2171933	Xã Tinh Nhuệ	21719	0	\N	\N	\N	\N	\N	tn	217
2171935	Xã Tân Minh	21719	0	\N	\N	\N	\N	\N	tm	217
2171937	Xã Võ Miếu	21719	0	\N	\N	\N	\N	\N	vm	217
2171939	Xã Văn Miếu	21719	0	\N	\N	\N	\N	\N	vm	217
2171941	Xã Tam Thanh	21719	0	\N	\N	\N	\N	\N	tt	217
2171943	Xã Vinh Tiền	21719	0	\N	\N	\N	\N	\N	vt	217
2171945	Xã Văn Luông	21719	0	\N	\N	\N	\N	\N	vl	217
2171947	Xã Long Cốc	21719	0	\N	\N	\N	\N	\N	lc	217
2171949	Xã Khả Cửu	21719	0	\N	\N	\N	\N	\N	kc	217
2171951	Xã Đông Cửu	21719	0	\N	\N	\N	\N	\N	dc	217
2171953	Xã Thượng Cửu	21719	0	\N	\N	\N	\N	\N	tc	217
2171955	Xã Minh Đài	21719	0	\N	\N	\N	\N	\N	md	217
2171957	Xã Xuân Đài	21719	0	\N	\N	\N	\N	\N	xd	217
2171959	Xã Kim Thượng	21719	0	\N	\N	\N	\N	\N	kt	217
2171961	Xã Xuân Sơn	21719	0	\N	\N	\N	\N	\N	xs	217
2171963	Xã Mỹ Thuận	21719	0	\N	\N	\N	\N	\N	mt	217
2171965	Xã Thu Ngạc	21719	0	\N	\N	\N	\N	\N	tn	217
2171967	Xã Tân Phú	21719	0	\N	\N	\N	\N	\N	tp	217
2171969	Xã Thạch Kiệt	21719	0	\N	\N	\N	\N	\N	tk	217
2171971	Xã Kiệt Sơn	21719	0	\N	\N	\N	\N	\N	ks	217
2171973	Xã Tân Sơn	21719	0	\N	\N	\N	\N	\N	ts	217
2171975	Xã Lai Đồng	21719	0	\N	\N	\N	\N	\N	ld	217
2171977	Xã Đồng Sơn	21719	0	\N	\N	\N	\N	\N	ds	217
2171979	Xã Thu Cúc	21719	0	\N	\N	\N	\N	\N	tc	217
2210000	Không xác định	22100	0	\N	\N	\N	\N	\N	kx	221
2210100	Không xác định	22101	0	\N	\N	\N	\N	\N	kx	221
2210101	Phường Trần Phú	22101	0	\N	\N	\N	\N	\N	tp	221
2210103	Phường Trần Nguyên Hãn	22101	0	\N	\N	\N	\N	\N	tnh	221
2210105	Phường Ngô Quyền	22101	0	\N	\N	\N	\N	\N	nq	221
2210107	Phường Mỹ Độ	22101	0	\N	\N	\N	\N	\N	md	221
2210109	Phường Lê Lợi	22101	0	\N	\N	\N	\N	\N	ll	221
2210111	Xã Song Mai	22101	0	\N	\N	\N	\N	\N	sm	221
2210113	Xã Thọ Xương	22101	0	\N	\N	\N	\N	\N	tx	221
2210115	Xã Đa Mai	22101	0	\N	\N	\N	\N	\N	dm	221
2210117	Xã Dĩnh Kế	22101	0	\N	\N	\N	\N	\N	dk	221
2210119	Phường Thọ Xương	22101	0	\N	\N	\N	\N	\N	tx	221
2210121	Phường Hoàng Văn Thụ	22101	0	\N	\N	\N	\N	\N	hvt	221
2210300	Không xác định	22103	0	\N	\N	\N	\N	\N	kx	221
2210301	Thị trấn Câu Gồ	22103	0	\N	\N	\N	\N	\N	cg	221
2210303	Thị trấn Bố Hạ	22103	0	\N	\N	\N	\N	\N	bh	221
2210305	Thị trấn NT Yên Thế	22103	0	\N	\N	\N	\N	\N	nyt	221
2210307	Xã Phồn Xương	22103	0	\N	\N	\N	\N	\N	px	221
2210309	Xã Xuân Lương	22103	0	\N	\N	\N	\N	\N	xl	221
2210311	Xã Canh Nậu	22103	0	\N	\N	\N	\N	\N	cn	221
2210313	Xã Đồng Vương	22103	0	\N	\N	\N	\N	\N	dv	221
2210315	Xã Tam Tiến	22103	0	\N	\N	\N	\N	\N	tt	221
2210317	Xã Tam Hiệp	22103	0	\N	\N	\N	\N	\N	th	221
2210319	Xã Tiến Thắng	22103	0	\N	\N	\N	\N	\N	tt	221
2210321	Xã Tân Hiệp	22103	0	\N	\N	\N	\N	\N	th	221
2210323	Xã Đồng Kỳ	22103	0	\N	\N	\N	\N	\N	dk	221
2210325	Xã Hồng Kỳ	22103	0	\N	\N	\N	\N	\N	hk	221
2210327	Xã Đồng Hưu	22103	0	\N	\N	\N	\N	\N	dh	221
2210329	Xã An Thương	22103	0	\N	\N	\N	\N	\N	at	221
2210331	Xã Đồng Lạc	22103	0	\N	\N	\N	\N	\N	dl	221
2210333	Xã Hương Vĩ	22103	0	\N	\N	\N	\N	\N	hv	221
2210335	Xã Đông Sơn	22103	0	\N	\N	\N	\N	\N	ds	221
2210337	Xã Tân Sỏi	22103	0	\N	\N	\N	\N	\N	ts	221
2210339	Xã Bố Hạ	22103	0	\N	\N	\N	\N	\N	bh	221
2210341	Xã Đồng Tiến	22103	0	\N	\N	\N	\N	\N	dt	221
2210500	Không xác định	22105	0	\N	\N	\N	\N	\N	kx	221
2210501	Thị trấn Cao Thượng	22105	0	\N	\N	\N	\N	\N	ct	221
2210503	Xã Cao Thượng	22105	0	\N	\N	\N	\N	\N	ct	221
2210505	Xã Lan Giới	22105	0	\N	\N	\N	\N	\N	lg	221
2210507	Xã Nhã Nam	22105	0	\N	\N	\N	\N	\N	nn	221
2210509	Xã Phúc Sơn	22105	0	\N	\N	\N	\N	\N	ps	221
2210511	Xã Đại Hóa	22105	0	\N	\N	\N	\N	\N	dh	221
2210513	Xã Quang Tiến	22105	0	\N	\N	\N	\N	\N	qt	221
2210515	Xã Tân Trung	22105	0	\N	\N	\N	\N	\N	tt	221
2210517	Xã An Dương	22105	0	\N	\N	\N	\N	\N	ad	221
2210519	Xã Liên Sơn	22105	0	\N	\N	\N	\N	\N	ls	221
2210521	Xã Phúc Hòa	22105	0	\N	\N	\N	\N	\N	ph	221
2210523	Xã Lam Cốt	22105	0	\N	\N	\N	\N	\N	lc	221
2210525	Xã Hợp Đức	22105	0	\N	\N	\N	\N	\N	hd	221
2210527	Xã Song Vân	22105	0	\N	\N	\N	\N	\N	sv	221
2210529	Xã Ngọc Châu	22105	0	\N	\N	\N	\N	\N	nc	221
2210531	Xã Việt Ngọc	22105	0	\N	\N	\N	\N	\N	vn	221
2210533	Xã Cao Xá	22105	0	\N	\N	\N	\N	\N	cx	221
2210535	Xã Việt Lập	22105	0	\N	\N	\N	\N	\N	vl	221
2210537	Xã Liên Chung	22105	0	\N	\N	\N	\N	\N	lc	221
2210539	Xã Ngọc Vân	22105	0	\N	\N	\N	\N	\N	nv	221
2210541	Xã Ngọc Thiện	22105	0	\N	\N	\N	\N	\N	nt	221
2210543	Xã Ngọc Lý	22105	0	\N	\N	\N	\N	\N	nl	221
2210545	Xã Quế Nham	22105	0	\N	\N	\N	\N	\N	qn	221
2210700	Không xác định	22107	0	\N	\N	\N	\N	\N	kx	221
2210701	Thị trấn Chũ	22107	0	\N	\N	\N	\N	\N	c	221
2210703	Xã Cấm Sơn	22107	0	\N	\N	\N	\N	\N	cs	221
2210705	Xã Tân Sơn	22107	0	\N	\N	\N	\N	\N	ts	221
2210707	Xã Xa Lý	22107	0	\N	\N	\N	\N	\N	xl	221
2210709	Xã Sơn Hải	22107	0	\N	\N	\N	\N	\N	sh	221
2210711	Xã Hộ Đáp	22107	0	\N	\N	\N	\N	\N	hd	221
2210713	Xã Phong Minh	22107	0	\N	\N	\N	\N	\N	pm	221
2210715	Xã Phong Vân	22107	0	\N	\N	\N	\N	\N	pv	221
2210717	Xã Kiên Lao	22107	0	\N	\N	\N	\N	\N	kl	221
2210719	Xã Kiên Thành	22107	0	\N	\N	\N	\N	\N	kt	221
2210721	Xã Thanh Hải	22107	0	\N	\N	\N	\N	\N	th	221
2210723	Xã Biên Sơn	22107	0	\N	\N	\N	\N	\N	bs	221
2210725	Xã Tân Hoa	22107	0	\N	\N	\N	\N	\N	th	221
2210727	Xã Quý Sơn	22107	0	\N	\N	\N	\N	\N	qs	221
2210729	Xã Trù Hựu	22107	0	\N	\N	\N	\N	\N	th	221
2210731	Xã Hồng Giang	22107	0	\N	\N	\N	\N	\N	hg	221
2210733	Xã Giáp Sơn	22107	0	\N	\N	\N	\N	\N	gs	221
2210735	Xã Phì Điền	22107	0	\N	\N	\N	\N	\N	pd	221
2210737	Xã Biển Động	22107	0	\N	\N	\N	\N	\N	bd	221
2210739	Xã Nghĩa Hồ	22107	0	\N	\N	\N	\N	\N	nh	221
2210741	Xã Tân Quang	22107	0	\N	\N	\N	\N	\N	tq	221
2210743	Xã Đồng Cốc	22107	0	\N	\N	\N	\N	\N	dc	221
2210745	Xã Phượng Sơn	22107	0	\N	\N	\N	\N	\N	ps	221
2210747	Xã Nam Dương	22107	0	\N	\N	\N	\N	\N	nd	221
2210749	Xã Tân Lập	22107	0	\N	\N	\N	\N	\N	tl	221
2210751	Xã Phú Nhuận	22107	0	\N	\N	\N	\N	\N	pn	221
2210753	Xã Mỹ An	22107	0	\N	\N	\N	\N	\N	ma	221
2210755	Xã Đèo Gia	22107	0	\N	\N	\N	\N	\N	dg	221
2210757	Xã Tân Mộc	22107	0	\N	\N	\N	\N	\N	tm	221
2210759	Xã Kim Sơn	22107	0	\N	\N	\N	\N	\N	ks	221
2210900	Không xác định	22109	0	\N	\N	\N	\N	\N	kx	221
2210901	Thị trấn Thắng	22109	0	\N	\N	\N	\N	\N	t	221
2210903	Xã Đồng Tân	22109	0	\N	\N	\N	\N	\N	dt	221
2210905	Xã Thanh Vân	22109	0	\N	\N	\N	\N	\N	tv	221
2210907	Xã Hoàng Lương	22109	0	\N	\N	\N	\N	\N	hl	221
2210909	Xã Hoàng Vân	22109	0	\N	\N	\N	\N	\N	hv	221
2210911	Xã Hoàng An	22109	0	\N	\N	\N	\N	\N	ha	221
2210913	Xã Hoàng Thanh	22109	0	\N	\N	\N	\N	\N	ht	221
2210915	Xã Thái Sơn	22109	0	\N	\N	\N	\N	\N	ts	221
2210917	Xã Hòa Sơn	22109	0	\N	\N	\N	\N	\N	hs	221
2210919	Xã Đức Thắng	22109	0	\N	\N	\N	\N	\N	dt	221
2210921	Xã Ngọc Sơn	22109	0	\N	\N	\N	\N	\N	ns	221
2210923	Xã Quang Minh	22109	0	\N	\N	\N	\N	\N	qm	221
2210925	Xã Hùng Sơn	22109	0	\N	\N	\N	\N	\N	hs	221
2210927	Xã Lương Phong	22109	0	\N	\N	\N	\N	\N	lp	221
2210929	Xã Đại Thành	22109	0	\N	\N	\N	\N	\N	dt	221
2210931	Xã Thường Thắng	22109	0	\N	\N	\N	\N	\N	tt	221
2210933	Xã Hợp Thịnh	22109	0	\N	\N	\N	\N	\N	ht	221
2210935	Xã Mai Trung	22109	0	\N	\N	\N	\N	\N	mt	221
2210937	Xã Danh Thắng	22109	0	\N	\N	\N	\N	\N	dt	221
2210939	Xã Đoan Bái	22109	0	\N	\N	\N	\N	\N	db	221
2210941	Xã Bắc Lý	22109	0	\N	\N	\N	\N	\N	bl	221
2210943	Xã Xuân Cẩm	22109	0	\N	\N	\N	\N	\N	xc	221
2210945	Xã Đông Lỗ	22109	0	\N	\N	\N	\N	\N	dl	221
2210947	Xã Hương Lâm	22109	0	\N	\N	\N	\N	\N	hl	221
2210949	Xã Mai Đình	22109	0	\N	\N	\N	\N	\N	md	221
2210951	Xã Châu Minh	22109	0	\N	\N	\N	\N	\N	cm	221
2211100	Không xác định	22111	0	\N	\N	\N	\N	\N	kx	221
2211101	Thị trấn Vôi	22111	0	\N	\N	\N	\N	\N	v	221
2211103	Thị trấn Kép	22111	0	\N	\N	\N	\N	\N	k	221
2211105	Thị trấn NT Bố Hạ	22111	0	\N	\N	\N	\N	\N	nbh	221
2211107	Xã Yên Mỹ	22111	0	\N	\N	\N	\N	\N	ym	221
2211109	Xã Nghĩa Hưng	22111	0	\N	\N	\N	\N	\N	nh	221
2211111	Xã Quang Thịnh	22111	0	\N	\N	\N	\N	\N	qt	221
2211113	Xã Nghĩa Hòa	22111	0	\N	\N	\N	\N	\N	nh	221
2211115	Xã Đào Mỹ	22111	0	\N	\N	\N	\N	\N	dm	221
2211117	Xã An Hà	22111	0	\N	\N	\N	\N	\N	ah	221
2211119	Xã Tân Thịnh	22111	0	\N	\N	\N	\N	\N	tt	221
2211121	Xã Mỹ Hà	22111	0	\N	\N	\N	\N	\N	mh	221
2211123	Xã Tiên Lục	22111	0	\N	\N	\N	\N	\N	tl	221
2211125	Xã Hương Sơn	22111	0	\N	\N	\N	\N	\N	hs	221
2211127	Xã Dương Đức	22111	0	\N	\N	\N	\N	\N	dd	221
2211129	Xã Tân Thanh	22111	0	\N	\N	\N	\N	\N	tt	221
2211131	Xã Hương Lạc	22111	0	\N	\N	\N	\N	\N	hl	221
2211133	Xã Mỹ Thái	22111	0	\N	\N	\N	\N	\N	mt	221
2211135	Xã Xương Lâm	22111	0	\N	\N	\N	\N	\N	xl	221
2211137	Xã Tân Hưng	22111	0	\N	\N	\N	\N	\N	th	221
2211139	Xã Phi Mô	22111	0	\N	\N	\N	\N	\N	pm	221
2211141	Xã Xuân Hương	22111	0	\N	\N	\N	\N	\N	xh	221
2211143	Xã Tân Dĩnh	22111	0	\N	\N	\N	\N	\N	td	221
2211145	Xã Thái Đào	22111	0	\N	\N	\N	\N	\N	td	221
2211147	Xã Đại Lâm	22111	0	\N	\N	\N	\N	\N	dl	221
2211149	Xã Dĩnh Trì	22111	0	\N	\N	\N	\N	\N	dt	221
2211300	Không xác định	22113	0	\N	\N	\N	\N	\N	kx	221
2211301	Thị trấn An Châu	22113	0	\N	\N	\N	\N	\N	ac	221
2211303	Xã Quế Sơn	22113	0	\N	\N	\N	\N	\N	qs	221
2211305	Xã Chiên Sơn	22113	0	\N	\N	\N	\N	\N	cs	221
2211307	Xã Giáo Liêm	22113	0	\N	\N	\N	\N	\N	gl	221
2211309	Xã Vân Sơn	22113	0	\N	\N	\N	\N	\N	vs	221
2211311	Xã Hữu Sản	22113	0	\N	\N	\N	\N	\N	hs	221
2211313	Xã Cẩm Đàn	22113	0	\N	\N	\N	\N	\N	cd	221
2211315	Xã Vĩnh Khương	22113	0	\N	\N	\N	\N	\N	vk	221
2211317	Xã Yên Định	22113	0	\N	\N	\N	\N	\N	yd	221
2211319	Xã An Lập	22113	0	\N	\N	\N	\N	\N	al	221
2211321	Xã Lệ Viễn	22113	0	\N	\N	\N	\N	\N	lv	221
2211323	Xã An Lạc	22113	0	\N	\N	\N	\N	\N	al	221
2211325	Xã An Bá	22113	0	\N	\N	\N	\N	\N	ab	221
2211327	Xã An Châu	22113	0	\N	\N	\N	\N	\N	ac	221
2211329	Xã Tuấn Đạo	22113	0	\N	\N	\N	\N	\N	td	221
2211331	Xã Bồng Am	22113	0	\N	\N	\N	\N	\N	ba	221
2211333	Xã Dương Hưu	22113	0	\N	\N	\N	\N	\N	dh	221
2211335	Xã Thanh Luận	22113	0	\N	\N	\N	\N	\N	tl	221
2211337	Xã Long Sơn	22113	0	\N	\N	\N	\N	\N	ls	221
2211339	Xã Thanh Sơn	22113	0	\N	\N	\N	\N	\N	ts	221
2211341	Xã Thạch Sơn	22113	0	\N	\N	\N	\N	\N	ts	221
2211343	Xã Phúc Thắng	22113	0	\N	\N	\N	\N	\N	pt	221
2211500	Không xác định	22115	0	\N	\N	\N	\N	\N	kx	221
2211501	Thị trấn Lục Nam	22115	0	\N	\N	\N	\N	\N	ln	221
2211503	Thị trấn Đồi Ngô	22115	0	\N	\N	\N	\N	\N	dn	221
2211505	Xã Tiên Hưng	22115	0	\N	\N	\N	\N	\N	th	221
2211507	Xã Bảo Sơn	22115	0	\N	\N	\N	\N	\N	bs	221
2211509	Xã Tam Dị	22115	0	\N	\N	\N	\N	\N	td	221
2211511	Xã Đông Phú	22115	0	\N	\N	\N	\N	\N	dp	221
2211513	Xã Đông Hưng	22115	0	\N	\N	\N	\N	\N	dh	221
2211515	Xã Bảo Đài	22115	0	\N	\N	\N	\N	\N	bd	221
2211517	Xã Thanh Lâm	22115	0	\N	\N	\N	\N	\N	tl	221
2211519	Xã Phương Sơn	22115	0	\N	\N	\N	\N	\N	ps	221
2211521	Xã Tiên Nha	22115	0	\N	\N	\N	\N	\N	tn	221
2211523	Xã Trường Giang	22115	0	\N	\N	\N	\N	\N	tg	221
2211525	Xã Chu Điện	22115	0	\N	\N	\N	\N	\N	cd	221
2211527	Xã Cương Sơn	22115	0	\N	\N	\N	\N	\N	cs	221
2211529	Xã Lan Mẫu	22115	0	\N	\N	\N	\N	\N	lm	221
2211531	Xã Nghĩa Phương	22115	0	\N	\N	\N	\N	\N	np	221
2211533	Xã Vô Tranh	22115	0	\N	\N	\N	\N	\N	vt	221
2211535	Xã Khám Lạng	22115	0	\N	\N	\N	\N	\N	kl	221
2211537	Xã Huyền Sơn	22115	0	\N	\N	\N	\N	\N	hs	221
2211539	Xã Bình Sơn	22115	0	\N	\N	\N	\N	\N	bs	221
2211541	Xã Yên Sơn	22115	0	\N	\N	\N	\N	\N	ys	221
2211543	Xã Bắc Lũng	22115	0	\N	\N	\N	\N	\N	bl	221
2211545	Xã Vũ Xá	22115	0	\N	\N	\N	\N	\N	vx	221
2211547	Xã Trường Sơn	22115	0	\N	\N	\N	\N	\N	ts	221
2211549	Xã Lục Sơn	22115	0	\N	\N	\N	\N	\N	ls	221
2211551	Xã Cẩm Lý	22115	0	\N	\N	\N	\N	\N	cl	221
2211553	Xã Đan Hội	22115	0	\N	\N	\N	\N	\N	dh	221
2211700	Không xác định	22117	0	\N	\N	\N	\N	\N	kx	221
2211701	Thị trấn  Bích Động	22117	0	\N	\N	\N	\N	\N	bd	221
2211703	Xã Bích Sơn	22117	0	\N	\N	\N	\N	\N	bs	221
2211705	Xã Thượng Lan	22117	0	\N	\N	\N	\N	\N	tl	221
2211707	Xã Việt Tiến	22117	0	\N	\N	\N	\N	\N	vt	221
2211709	Xã Minh Đức	22117	0	\N	\N	\N	\N	\N	md	221
2211711	Xã Tự Lạn	22117	0	\N	\N	\N	\N	\N	tl	221
2211713	Xã Hương Mai	22117	0	\N	\N	\N	\N	\N	hm	221
2211715	Xã Nghĩa Trung	22117	0	\N	\N	\N	\N	\N	nt	221
2211717	Xã Trung Sơn	22117	0	\N	\N	\N	\N	\N	ts	221
2211719	Xã Hồng Thái	22117	0	\N	\N	\N	\N	\N	ht	221
2211721	Xã Quảng Minh	22117	0	\N	\N	\N	\N	\N	qm	221
2211723	Xã Hoàng Ninh	22117	0	\N	\N	\N	\N	\N	hn	221
2211725	Xã Tăng Tiến	22117	0	\N	\N	\N	\N	\N	tt	221
2211727	Xã Tiên Sơn	22117	0	\N	\N	\N	\N	\N	ts	221
2211729	Xã Ninh Sơn	22117	0	\N	\N	\N	\N	\N	ns	221
2211731	Xã Vân Trung	22117	0	\N	\N	\N	\N	\N	vt	221
2211733	Xã Vân Hà	22117	0	\N	\N	\N	\N	\N	vh	221
2211735	Xã Quang Châu	22117	0	\N	\N	\N	\N	\N	qc	221
2211900	Không xác định	22119	0	\N	\N	\N	\N	\N	kx	221
2211901	Thị trấn Neo	22119	0	\N	\N	\N	\N	\N	n	221
2211903	Xã Nham Sơn	22119	0	\N	\N	\N	\N	\N	ns	221
2211905	Xã Lão Hộ	22119	0	\N	\N	\N	\N	\N	lh	221
2211907	Xã Tân Mỹ	22119	0	\N	\N	\N	\N	\N	tm	221
2211909	Xã Đồng Sơn	22119	0	\N	\N	\N	\N	\N	ds	221
2211911	Xã Hương Gián	22119	0	\N	\N	\N	\N	\N	hg	221
2211913	Xã Tân An	22119	0	\N	\N	\N	\N	\N	ta	221
2211915	Xã Song Khê	22119	0	\N	\N	\N	\N	\N	sk	221
2211917	Xã Tân Tiến	22119	0	\N	\N	\N	\N	\N	tt	221
2211919	Xã Quỳnh Sơn	22119	0	\N	\N	\N	\N	\N	qs	221
2211921	Xã Nội Hoàng	22119	0	\N	\N	\N	\N	\N	nh	221
2211923	Xã Tân Liễu	22119	0	\N	\N	\N	\N	\N	tl	221
2211925	Xã Xuân Phú	22119	0	\N	\N	\N	\N	\N	xp	221
2211927	Xã Tiền Phong	22119	0	\N	\N	\N	\N	\N	tp	221
2211929	Xã Lãng Sơn	22119	0	\N	\N	\N	\N	\N	ls	221
2211931	Xã Trí Yên	22119	0	\N	\N	\N	\N	\N	ty	221
2211933	Xã Tiến Dũng	22119	0	\N	\N	\N	\N	\N	td	221
2211935	Xã Yên Lư	22119	0	\N	\N	\N	\N	\N	yl	221
2211937	Xã Cảnh Thụy	22119	0	\N	\N	\N	\N	\N	ct	221
2211939	Xã Tư Mại	22119	0	\N	\N	\N	\N	\N	tm	221
2211941	Xã Đức Giang	22119	0	\N	\N	\N	\N	\N	dg	221
2211943	Xã Thắng Cương	22119	0	\N	\N	\N	\N	\N	tc	221
2211945	Xã Đồng Phúc	22119	0	\N	\N	\N	\N	\N	dp	221
2211947	Xã Đồng Việt	22119	0	\N	\N	\N	\N	\N	dv	221
2250000	Không xác định	22500	0	\N	\N	\N	\N	\N	kx	225
2250100	Không xác định	22501	0	\N	\N	\N	\N	\N	kx	225
2250101	Phường Hà Khánh	22501	0	\N	\N	\N	\N	\N	hk	225
2250103	Phường Hà Lầm	22501	0	\N	\N	\N	\N	\N	hl	225
2250105	Phường Hà Trung	22501	0	\N	\N	\N	\N	\N	ht	225
2250107	Phường Hà Phong	22501	0	\N	\N	\N	\N	\N	hp	225
2250109	Phường Hà Tu	22501	0	\N	\N	\N	\N	\N	ht	225
2250111	Phường Hồng Hà	22501	0	\N	\N	\N	\N	\N	hh	225
2250113	Phường Hồng Hải	22501	0	\N	\N	\N	\N	\N	hh	225
2250115	Phường Cao Thắng	22501	0	\N	\N	\N	\N	\N	ct	225
2250117	Phường Cao Xanh	22501	0	\N	\N	\N	\N	\N	cx	225
2250119	Phường Yết Kiêu	22501	0	\N	\N	\N	\N	\N	yk	225
2250121	Phường Trần Hưng Đạo	22501	0	\N	\N	\N	\N	\N	thd	225
2250123	Phường Bạch Đằng	22501	0	\N	\N	\N	\N	\N	bd	225
2250125	Phường Hồng Gai	22501	0	\N	\N	\N	\N	\N	hg	225
2250127	Phường Bãi Cháy	22501	0	\N	\N	\N	\N	\N	bc	225
2250129	Phường Hà Khẩu	22501	0	\N	\N	\N	\N	\N	hk	225
2250131	Phường Giếng Đáy	22501	0	\N	\N	\N	\N	\N	gd	225
2250133	Xã Hùng Thắng	22501	0	\N	\N	\N	\N	\N	ht	225
2250135	Xã Tuần Châu	22501	0	\N	\N	\N	\N	\N	tc	225
2250300	Không xác định	22503	0	\N	\N	\N	\N	\N	kx	225
2250301	Phường Mông Dương	22503	0	\N	\N	\N	\N	\N	md	225
2250303	Phường Cửa Ông	22503	0	\N	\N	\N	\N	\N	co	225
2250305	Phường Cẩm Thịnh	22503	0	\N	\N	\N	\N	\N	ct	225
2250307	Phường Cẩm Phú	22503	0	\N	\N	\N	\N	\N	cp	225
2251147	Xã Quảng An	22511	0	\N	\N	\N	\N	\N	qa	225
2251149	Xã Cái Chiên	22511	0	\N	\N	\N	\N	\N	cc	225
2251300	Không xác định	22513	0	\N	\N	\N	\N	\N	kx	225
2251301	Thị trấn Tiên Yên	22513	0	\N	\N	\N	\N	\N	ty	225
2251303	Xã Đại Dực	22513	0	\N	\N	\N	\N	\N	dd	225
2251305	Xã Hà Lâu	22513	0	\N	\N	\N	\N	\N	hl	225
2251307	Xã Phong Dụ	22513	0	\N	\N	\N	\N	\N	pd	225
2251309	Xã Điền Xá	22513	0	\N	\N	\N	\N	\N	dx	225
2251311	Xã Yên Than	22513	0	\N	\N	\N	\N	\N	yt	225
2251313	Xã Hải Lạng	22513	0	\N	\N	\N	\N	\N	hl	225
2251315	Xã Tiên Lãng	22513	0	\N	\N	\N	\N	\N	tl	225
2251317	Xã Đông Ngũ	22513	0	\N	\N	\N	\N	\N	dn	225
2251319	Xã Đông Hải	22513	0	\N	\N	\N	\N	\N	dh	225
2251321	Xã Đồng Rui	22513	0	\N	\N	\N	\N	\N	dr	225
2251500	Không xác định	22515	0	\N	\N	\N	\N	\N	kx	225
2251501	Thị trấn Ba Chẽ	22515	0	\N	\N	\N	\N	\N	bc	225
2251503	Xã Minh Cầm	22515	0	\N	\N	\N	\N	\N	mc	225
2251505	Xã Lương Mông	22515	0	\N	\N	\N	\N	\N	lm	225
2251507	Xã Thanh Lâm	22515	0	\N	\N	\N	\N	\N	tl	225
2251509	Xã Thanh Sơn	22515	0	\N	\N	\N	\N	\N	ts	225
2251511	Xã Đạp Thanh	22515	0	\N	\N	\N	\N	\N	dt	225
2251513	Xã Đồn Đạc	22515	0	\N	\N	\N	\N	\N	dd	225
2251515	Xã Nam Sơn	22515	0	\N	\N	\N	\N	\N	ns	225
2251700	Không xác định	22517	0	\N	\N	\N	\N	\N	kx	225
2251701	Thị trấn Cái Rồng	22517	0	\N	\N	\N	\N	\N	cr	225
2251703	Xã Đài Xuyên	22517	0	\N	\N	\N	\N	\N	dx	225
2251705	Xã Bình Dân	22517	0	\N	\N	\N	\N	\N	bd	225
2251707	Xã Đoàn Kết	22517	0	\N	\N	\N	\N	\N	dk	225
2251709	Xã Vạn Yên	22517	0	\N	\N	\N	\N	\N	vy	225
2251711	Xã Hạ Long	22517	0	\N	\N	\N	\N	\N	hl	225
2251713	Xã Đông Xá	22517	0	\N	\N	\N	\N	\N	dx	225
2251715	Xã Minh Châu	22517	0	\N	\N	\N	\N	\N	mc	225
2251717	Xã Quan Lạn	22517	0	\N	\N	\N	\N	\N	ql	225
2251719	Xã Bản Sen	22517	0	\N	\N	\N	\N	\N	bs	225
2251721	Xã Ngọc Vừng	22517	0	\N	\N	\N	\N	\N	nv	225
2251723	Xã Thắng Lợi	22517	0	\N	\N	\N	\N	\N	tl	225
2251900	Không xác định	22519	0	\N	\N	\N	\N	\N	kx	225
2251901	Thị trấn Trới	22519	0	\N	\N	\N	\N	\N	t	225
2251903	Xã Kỳ Thượng	22519	0	\N	\N	\N	\N	\N	kt	225
2251905	Xã Hòa Bình	22519	0	\N	\N	\N	\N	\N	hb	225
2251907	Xã Đồng Lâm	22519	0	\N	\N	\N	\N	\N	dl	225
2251909	Xã Đồng Sơn	22519	0	\N	\N	\N	\N	\N	ds	225
2251911	Xã Vũ Oai	22519	0	\N	\N	\N	\N	\N	vo	225
2251913	Xã Thống Nhất	22519	0	\N	\N	\N	\N	\N	tn	225
2251915	Xã Lê Lợi	22519	0	\N	\N	\N	\N	\N	ll	225
2251917	Xã Quảng La	22519	0	\N	\N	\N	\N	\N	ql	225
2251919	Xã Sơn Dương	22519	0	\N	\N	\N	\N	\N	sd	225
2251921	Xã Dân Chủ	22519	0	\N	\N	\N	\N	\N	dc	225
2251923	Xã Bằng Cả	22519	0	\N	\N	\N	\N	\N	bc	225
2251925	Xã Tân Dân	22519	0	\N	\N	\N	\N	\N	td	225
2251927	Xã Việt Hưng	22519	0	\N	\N	\N	\N	\N	vh	225
3010725	Xã Khổng Lào	30107	0	\N	\N	\N	\N	\N	kl	301
3010727	Xã Mường So	30107	0	\N	\N	\N	\N	\N	ms	301
3010729	Xã Nậm Xe	30107	0	\N	\N	\N	\N	\N	nx	301
3010731	Xã Sin Suối Hồ	30107	0	\N	\N	\N	\N	\N	ssh	301
3010733	Xã Thèn Sin	30107	0	\N	\N	\N	\N	\N	ts	301
3010735	Xã Tam Đường	30107	0	\N	\N	\N	\N	\N	td	301
3010737	Xã Lả Nhì Thàng	30107	0	\N	\N	\N	\N	\N	lnt	301
3010739	Xã Sùng Phài	30107	0	\N	\N	\N	\N	\N	sp	301
3010741	Xã Nậm Loỏng	30107	0	\N	\N	\N	\N	\N	nl	301
3010743	Xã Nùng Nàng	30107	0	\N	\N	\N	\N	\N	nn	301
3010745	Xã Tả Lèng	30107	0	\N	\N	\N	\N	\N	tl	301
3010747	Xã Hồ Thầu	30107	0	\N	\N	\N	\N	\N	ht	301
3010749	Xã Bản Giang	30107	0	\N	\N	\N	\N	\N	bg	301
3010751	Xã Bản Hon	30107	0	\N	\N	\N	\N	\N	bh	301
3010753	Xã Bình Lư	30107	0	\N	\N	\N	\N	\N	bl	301
3010755	Xã Nà Tăm	30107	0	\N	\N	\N	\N	\N	nt	301
3010757	Xã Bản Bo	30107	0	\N	\N	\N	\N	\N	bb	301
3010759	Xã Khun Há	30107	0	\N	\N	\N	\N	\N	kh	301
3010900	Không xác định	30109	0	\N	\N	\N	\N	\N	kx	301
3010901	Thị trấn Sìn Hồ	30109	0	\N	\N	\N	\N	\N	sh	301
3010903	Xã Huổi Luông	30109	0	\N	\N	\N	\N	\N	hl	301
3010905	Xã Pa Tần	30109	0	\N	\N	\N	\N	\N	pt	301
3010907	Xã Phìn Hồ	30109	0	\N	\N	\N	\N	\N	ph	301
3010909	Xã Nậm Ban	30109	0	\N	\N	\N	\N	\N	nb	301
3010911	Xã Hồng Thu	30109	0	\N	\N	\N	\N	\N	ht	301
3010913	Xã Tả Phìn	30109	0	\N	\N	\N	\N	\N	tp	301
3010915	Xã Phăng Sô Lin	30109	0	\N	\N	\N	\N	\N	psl	301
3010917	Xã Ma Quai	30109	0	\N	\N	\N	\N	\N	mq	301
3010919	Xã Sà Dề Phìn	30109	0	\N	\N	\N	\N	\N	sdp	301
3010921	Xã Tả Ngảo	30109	0	\N	\N	\N	\N	\N	tn	301
3010923	Xã Nậm Tăm	30109	0	\N	\N	\N	\N	\N	nt	301
3010925	Xã Làng Mô	30109	0	\N	\N	\N	\N	\N	lm	301
3010927	Xã Nậm Cha	30109	0	\N	\N	\N	\N	\N	nc	301
3010929	Xã Noong Hẻo	30109	0	\N	\N	\N	\N	\N	nh	301
3010931	Xã Pu Sam Cáp	30109	0	\N	\N	\N	\N	\N	psc	301
3010933	Xã Tủa Sín Chải	30109	0	\N	\N	\N	\N	\N	tsc	301
3010935	Xã Nậm Mạ	30109	0	\N	\N	\N	\N	\N	nm	301
3010937	Xã Căn Co	30109	0	\N	\N	\N	\N	\N	cc	301
3010939	Xã Nậm Cuổi	30109	0	\N	\N	\N	\N	\N	nc	301
3010941	Xã Nậm Hăn	30109	0	\N	\N	\N	\N	\N	nh	301
3011100	Không xác định	30111	0	\N	\N	\N	\N	\N	kx	301
3011101	Thị trấn Mường Lay	30111	0	\N	\N	\N	\N	\N	ml	301
3011103	Xã Nậm Hàng	30111	0	\N	\N	\N	\N	\N	nh	301
3011105	Xã Pú Đao	30111	0	\N	\N	\N	\N	\N	pd	301
3011107	Xã Chăn Nưa	30111	0	\N	\N	\N	\N	\N	cn	301
3011109	Xã Lay Nưa	30111	0	\N	\N	\N	\N	\N	ln	301
3011111	Xã Mường Tùng	30111	0	\N	\N	\N	\N	\N	mt	301
3011113	Xã Huổi Lèng	30111	0	\N	\N	\N	\N	\N	hl	301
3011115	Xã Chà Nưa	30111	0	\N	\N	\N	\N	\N	cn	301
3011117	Xã Chà Cang	30111	0	\N	\N	\N	\N	\N	cc	301
3011119	Xã Chà Tở	30111	0	\N	\N	\N	\N	\N	ct	301
3011121	Xã Si Pa Phìn	30111	0	\N	\N	\N	\N	\N	spp	301
3011123	Xã Hừa Ngài	30111	0	\N	\N	\N	\N	\N	hn	301
3011125	Xã Pa Ham	30111	0	\N	\N	\N	\N	\N	ph	301
3011127	Xã Xá Tổng	30111	0	\N	\N	\N	\N	\N	xt	301
3011129	Xã Mường Mơn	30111	0	\N	\N	\N	\N	\N	mm	301
3011300	Không xác định	30113	0	\N	\N	\N	\N	\N	kx	301
3011301	Thị trấn Tủa Chùa	30113	0	\N	\N	\N	\N	\N	tc	301
3011303	Xã Xín Chải	30113	0	\N	\N	\N	\N	\N	xc	301
3011305	Xã Huổi Só	30113	0	\N	\N	\N	\N	\N	hs	301
3011307	Xã Tả Sìn Thàng	30113	0	\N	\N	\N	\N	\N	tst	301
3011309	Xã Lao Xả Phình	30113	0	\N	\N	\N	\N	\N	lxp	301
3011311	Xã Tả Phìn	30113	0	\N	\N	\N	\N	\N	tp	301
3011313	Xã Tủa Thàng	30113	0	\N	\N	\N	\N	\N	tt	301
3011315	Xã Trung Thu	30113	0	\N	\N	\N	\N	\N	tt	301
3011317	Xã Sính Phình	30113	0	\N	\N	\N	\N	\N	sp	301
3011319	Xã Mường Báng	30113	0	\N	\N	\N	\N	\N	mb	301
3011321	Xã Sáng Nhè	30113	0	\N	\N	\N	\N	\N	sn	301
3011323	Xã Mường Đun	30113	0	\N	\N	\N	\N	\N	md	301
3011500	Không xác định	30115	0	\N	\N	\N	\N	\N	kx	301
3011501	Thị trấn Tuần Giáo	30115	0	\N	\N	\N	\N	\N	tg	301
3011503	Thị trấn  Mường ẳng	30115	0	\N	\N	\N	\N	\N	ma	301
3011505	Xã Mường Mùn	30115	0	\N	\N	\N	\N	\N	mm	301
3011507	Xã Mường Chung	30115	0	\N	\N	\N	\N	\N	mc	301
3011509	Xã Phình Sáng	30115	0	\N	\N	\N	\N	\N	ps	301
3011511	Xã Ta Ma	30115	0	\N	\N	\N	\N	\N	tm	301
3011513	Xã Pú Nhung	30115	0	\N	\N	\N	\N	\N	pn	301
3011515	Xã Quài Nưa	30115	0	\N	\N	\N	\N	\N	qn	301
3011517	Xã Tỏa Tình	30115	0	\N	\N	\N	\N	\N	tt	301
3011519	Xã Quài Tở	30115	0	\N	\N	\N	\N	\N	qt	301
3011521	Xã Quài Cang	30115	0	\N	\N	\N	\N	\N	qc	301
3011523	Xã Tênh Phông	30115	0	\N	\N	\N	\N	\N	tp	301
3011525	Xã Chiềng Sinh	30115	0	\N	\N	\N	\N	\N	cs	301
3011527	Xã Búng Lao	30115	0	\N	\N	\N	\N	\N	bl	301
3011529	Xã Nà Sáy	30115	0	\N	\N	\N	\N	\N	ns	301
3011531	Xã Mường Thín	30115	0	\N	\N	\N	\N	\N	mt	301
3011533	Xã Mường Lạm	30115	0	\N	\N	\N	\N	\N	ml	301
3011535	Xã ẳng Tở	30115	0	\N	\N	\N	\N	\N	at	301
3011537	Xã ẳng Cang	30115	0	\N	\N	\N	\N	\N	ac	301
3011539	Xã ẳng Nưa	30115	0	\N	\N	\N	\N	\N	an	301
3011541	Xã Mường Đăng	30115	0	\N	\N	\N	\N	\N	md	301
3011700	Không xác định	30117	0	\N	\N	\N	\N	\N	kx	301
3011701	Thị trấn Mường Thanh	30117	0	\N	\N	\N	\N	\N	mt	301
3011703	Xã Mường Pồn	30117	0	\N	\N	\N	\N	\N	mp	301
6050307	Xã Ea Ral	60503	0	\N	\N	\N	\N	\N	er	605
3011705	Xã Nà Tấu	30117	0	\N	\N	\N	\N	\N	nt	301
3011707	Xã Thanh Nưa	30117	0	\N	\N	\N	\N	\N	tn	301
3011709	Xã Mường Phăng	30117	0	\N	\N	\N	\N	\N	mp	301
3011711	Xã Thanh Luông	30117	0	\N	\N	\N	\N	\N	tl	301
3011713	Xã Thanh Hưng	30117	0	\N	\N	\N	\N	\N	th	301
3011715	Xã Thanh Xương	30117	0	\N	\N	\N	\N	\N	tx	301
3011717	Xã Thanh Chăn	30117	0	\N	\N	\N	\N	\N	tc	301
3011719	Xã Thanh An	30117	0	\N	\N	\N	\N	\N	ta	301
3011721	Xã Thanh Yên	30117	0	\N	\N	\N	\N	\N	ty	301
3011723	Xã Nong Hẹt	30117	0	\N	\N	\N	\N	\N	nh	301
3011725	Xã Pa Thơm	30117	0	\N	\N	\N	\N	\N	pt	301
3011727	Xã Noong Luống	30117	0	\N	\N	\N	\N	\N	nl	301
3011729	Xã Sam Mứn	30117	0	\N	\N	\N	\N	\N	sm	301
3011731	Xã Núa Ngam	30117	0	\N	\N	\N	\N	\N	nn	301
3011733	Xã Na ư	30117	0	\N	\N	\N	\N	\N	nu	301
3011735	Xã Mường Nhà	30117	0	\N	\N	\N	\N	\N	mn	301
3011737	Xã Mường Lói	30117	0	\N	\N	\N	\N	\N	ml	301
3011900	Không xác định	30119	0	\N	\N	\N	\N	\N	kx	301
3011901	Xã Pú Nhi	30119	0	\N	\N	\N	\N	\N	pn	301
3011903	Xã Na Son	30119	0	\N	\N	\N	\N	\N	ns	301
3011905	Xã Xa Dung	30119	0	\N	\N	\N	\N	\N	xd	301
3011907	Xã Phì Nhừ	30119	0	\N	\N	\N	\N	\N	pn	301
3011909	Xã Keo Lôm	30119	0	\N	\N	\N	\N	\N	kl	301
3011911	Xã Phình Giàng	30119	0	\N	\N	\N	\N	\N	pg	301
3011913	Xã Chiềng Sơ	30119	0	\N	\N	\N	\N	\N	cs	301
3011915	Xã Mường Luân	30119	0	\N	\N	\N	\N	\N	ml	301
3011917	Xã Luân Giới	30119	0	\N	\N	\N	\N	\N	lg	301
3011919	Xã Háng Lìa	30119	0	\N	\N	\N	\N	\N	hl	301
3030000	Không xác định	30300	0	\N	\N	\N	\N	\N	kx	303
3030100	Không xác định	30301	0	\N	\N	\N	\N	\N	kx	303
3030101	Phường Chiềng Lề	30301	0	\N	\N	\N	\N	\N	cl	303
3030103	Phường Quyết Thắng	30301	0	\N	\N	\N	\N	\N	qt	303
3030105	Xã Chiềng Đen	30301	0	\N	\N	\N	\N	\N	cd	303
3030107	Xã Chiềng Xôm	30301	0	\N	\N	\N	\N	\N	cx	303
3030109	Xã Chiềng An	30301	0	\N	\N	\N	\N	\N	ca	303
3030111	Xã Chiềng Ngần	30301	0	\N	\N	\N	\N	\N	cn	303
3030113	Xã Chiềng Cọ	30301	0	\N	\N	\N	\N	\N	cc	303
3030115	Xã Chiềng Cơi	30301	0	\N	\N	\N	\N	\N	cc	303
3030117	Xã Hua La	30301	0	\N	\N	\N	\N	\N	hl	303
3030119	Xã Chiềng Sinh	30301	0	\N	\N	\N	\N	\N	cs	303
3030121	Phường Tô Hiệu	30301	0	\N	\N	\N	\N	\N	th	303
3030123	Phường Quyết Tâm	30301	0	\N	\N	\N	\N	\N	qt	303
3030300	Không xác định	30303	0	\N	\N	\N	\N	\N	kx	303
3030301	Xã Mường Chiên	30303	0	\N	\N	\N	\N	\N	mc	303
3030303	Xã Cà Nàng	30303	0	\N	\N	\N	\N	\N	cn	303
3030305	Xã Chiềng Khay	30303	0	\N	\N	\N	\N	\N	ck	303
3030307	Xã Pha Khinh	30303	0	\N	\N	\N	\N	\N	pk	303
3030309	Xã Mường Giôn	30303	0	\N	\N	\N	\N	\N	mg	303
3030311	Xã Pắc Ma	30303	0	\N	\N	\N	\N	\N	pm	303
3030313	Xã Chiềng Ơn	30303	0	\N	\N	\N	\N	\N	co	303
3030500	Không xác định	30305	0	\N	\N	\N	\N	\N	kx	303
3030501	Xã ít Ong	30305	0	\N	\N	\N	\N	\N	ýo	303
3030503	Xã Nậm Giôn	30305	0	\N	\N	\N	\N	\N	ng	303
3030505	Xã Chiềng Lao	30305	0	\N	\N	\N	\N	\N	cl	303
3030507	Xã Hua Trai	30305	0	\N	\N	\N	\N	\N	ht	303
3030509	Xã Ngọc Chiến	30305	0	\N	\N	\N	\N	\N	nc	303
3030511	Xã Mường Trai	30305	0	\N	\N	\N	\N	\N	mt	303
3030513	Xã Nậm Păm	30305	0	\N	\N	\N	\N	\N	np	303
3030515	Xã Chiềng Muôn	30305	0	\N	\N	\N	\N	\N	cm	303
3030517	Xã Chiềng Ân	30305	0	\N	\N	\N	\N	\N	ca	303
3030519	Xã Pi Toong	30305	0	\N	\N	\N	\N	\N	pt	303
3030521	Xã Chiềng Công	30305	0	\N	\N	\N	\N	\N	cc	303
3030523	Xã Tạ Bú	30305	0	\N	\N	\N	\N	\N	tb	303
3030525	Xã Chiềng San	30305	0	\N	\N	\N	\N	\N	cs	303
3030527	Xã Mường Bú	30305	0	\N	\N	\N	\N	\N	mb	303
3030529	Xã Chiềng Hoa	30305	0	\N	\N	\N	\N	\N	ch	303
3030531	Xã Mường Chùm	30305	0	\N	\N	\N	\N	\N	mc	303
3030700	Không xác định	30307	0	\N	\N	\N	\N	\N	kx	303
3030701	Thị trấn Thuận Châu	30307	0	\N	\N	\N	\N	\N	tc	303
3030703	Xã Mường Giàng	30307	0	\N	\N	\N	\N	\N	mg	303
3030705	Xã Chiềng Bằng	30307	0	\N	\N	\N	\N	\N	cb	303
3030707	Xã Mường Sại	30307	0	\N	\N	\N	\N	\N	ms	303
3030709	Xã Phỏng Lái	30307	0	\N	\N	\N	\N	\N	pl	303
3030711	Xã Chiềng Khoang	30307	0	\N	\N	\N	\N	\N	ck	303
3030713	Xã Liệp Muội	30307	0	\N	\N	\N	\N	\N	lm	303
3030715	Xã Nậm ét	30307	0	\N	\N	\N	\N	\N	ne	303
3030717	Xã Mường é	30307	0	\N	\N	\N	\N	\N	mð	303
3030719	Xã Chiềng Pha	30307	0	\N	\N	\N	\N	\N	cp	303
3030721	Xã Chiềng La	30307	0	\N	\N	\N	\N	\N	cl	303
3030723	Xã Chiềng Ngàm	30307	0	\N	\N	\N	\N	\N	cn	303
3030725	Xã Liệp Tè	30307	0	\N	\N	\N	\N	\N	lt	303
3030727	Xã é Tòng	30307	0	\N	\N	\N	\N	\N	et	303
3030729	Xã Phỏng Lập	30307	0	\N	\N	\N	\N	\N	pl	303
3030731	Xã Chiềng Sơ	30307	0	\N	\N	\N	\N	\N	cs	303
3030733	Xã Chiềng Ly	30307	0	\N	\N	\N	\N	\N	cl	303
3030735	Xã Nong Lay	30307	0	\N	\N	\N	\N	\N	nl	303
3030737	Xã Mường Khiêng	30307	0	\N	\N	\N	\N	\N	mk	303
3030739	Xã Mường Bám	30307	0	\N	\N	\N	\N	\N	mb	303
3030741	Xã Long Hẹ	30307	0	\N	\N	\N	\N	\N	lh	303
3030743	Xã Chiềng Bôm	30307	0	\N	\N	\N	\N	\N	cb	303
3030745	Xã Thôn Mòn	30307	0	\N	\N	\N	\N	\N	tm	303
3030747	Xã Tòng Lệnh	30307	0	\N	\N	\N	\N	\N	tl	303
3030749	Xã Tòng Cọ	30307	0	\N	\N	\N	\N	\N	tc	303
3030751	Xã Bó Mười	30307	0	\N	\N	\N	\N	\N	bm	303
3030753	Xã Co Mạ	30307	0	\N	\N	\N	\N	\N	cm	303
3030755	Xã Púng Tra	30307	0	\N	\N	\N	\N	\N	pt	303
3030757	Xã Chiềng Pấc	30307	0	\N	\N	\N	\N	\N	cp	303
3030759	Xã Nậm Lầu	30307	0	\N	\N	\N	\N	\N	nl	303
3030761	Xã Bon Phặng	30307	0	\N	\N	\N	\N	\N	bp	303
3030763	Xã Co Tòng	30307	0	\N	\N	\N	\N	\N	ct	303
3030765	Xã Muội Nọi	30307	0	\N	\N	\N	\N	\N	mn	303
3030767	Xã Pá Lông	30307	0	\N	\N	\N	\N	\N	pl	303
3030769	Xã Bản Lầm	30307	0	\N	\N	\N	\N	\N	bl	303
3030900	Không xác định	30309	0	\N	\N	\N	\N	\N	kx	303
3030901	Xã Phiêng Ban	30309	0	\N	\N	\N	\N	\N	pb	303
3030903	Xã Hang Chú	30309	0	\N	\N	\N	\N	\N	hc	303
3030905	Xã Xín Vàng	30309	0	\N	\N	\N	\N	\N	xv	303
3030907	Xã Tà Xùa	30309	0	\N	\N	\N	\N	\N	tx	303
3030909	Xã Bắc Ngà	30309	0	\N	\N	\N	\N	\N	bn	303
3030911	Xã Làng Chếu	30309	0	\N	\N	\N	\N	\N	lc	303
3030913	Xã Chim Vàn	30309	0	\N	\N	\N	\N	\N	cv	303
3030915	Xã Mường Khoa	30309	0	\N	\N	\N	\N	\N	mk	303
3030917	Xã Song Pe	30309	0	\N	\N	\N	\N	\N	sp	303
3030919	Xã Hồng Ngài	30309	0	\N	\N	\N	\N	\N	hn	303
3030921	Xã Tạ Khoa	30309	0	\N	\N	\N	\N	\N	tk	303
3030923	Xã Phiêng Kôn	30309	0	\N	\N	\N	\N	\N	pk	303
3030925	Xã Chiềng Sại	30309	0	\N	\N	\N	\N	\N	cs	303
3031100	Không xác định	30311	0	\N	\N	\N	\N	\N	kx	303
3031101	Thị trấn Phù Yên	30311	0	\N	\N	\N	\N	\N	py	303
3031103	Xã Suối Tọ	30311	0	\N	\N	\N	\N	\N	st	303
3031105	Xã Mường Thải	30311	0	\N	\N	\N	\N	\N	mt	303
3031107	Xã Mường Cơi	30311	0	\N	\N	\N	\N	\N	mc	303
3031109	Xã Quang Huy	30311	0	\N	\N	\N	\N	\N	qh	303
3031111	Xã Huy Bắc	30311	0	\N	\N	\N	\N	\N	hb	303
3031113	Xã Huy Thượng	30311	0	\N	\N	\N	\N	\N	ht	303
3031115	Xã Tân Lang	30311	0	\N	\N	\N	\N	\N	tl	303
3031117	Xã Gia Phù	30311	0	\N	\N	\N	\N	\N	gp	303
3031119	Xã Tường Phù	30311	0	\N	\N	\N	\N	\N	tp	303
3031121	Xã Huy Hạ	30311	0	\N	\N	\N	\N	\N	hh	303
3031123	Xã Huy Tân	30311	0	\N	\N	\N	\N	\N	ht	303
3031125	Xã Mường Lang	30311	0	\N	\N	\N	\N	\N	ml	303
3031127	Xã Suối Bau	30311	0	\N	\N	\N	\N	\N	sb	303
3031129	Xã Huy Tường	30311	0	\N	\N	\N	\N	\N	ht	303
3031131	Xã Mường Do	30311	0	\N	\N	\N	\N	\N	md	303
3031133	Xã Sập Xa	30311	0	\N	\N	\N	\N	\N	sx	303
3031135	Xã Tường Thượng	30311	0	\N	\N	\N	\N	\N	tt	303
3031137	Xã Tường Tiến	30311	0	\N	\N	\N	\N	\N	tt	303
3031139	Xã Tường Phong	30311	0	\N	\N	\N	\N	\N	tp	303
3031141	Xã Tường Hạ	30311	0	\N	\N	\N	\N	\N	th	303
3031143	Xã Kim Bon	30311	0	\N	\N	\N	\N	\N	kb	303
3031145	Xã Mường Bang	30311	0	\N	\N	\N	\N	\N	mb	303
3031147	Xã Đá Đỏ	30311	0	\N	\N	\N	\N	\N	dd	303
3031149	Xã Tân Phong	30311	0	\N	\N	\N	\N	\N	tp	303
3031151	Xã Nam Phong	30311	0	\N	\N	\N	\N	\N	np	303
3031153	Xã Bắc Phong	30311	0	\N	\N	\N	\N	\N	bp	303
3031300	Không xác định	30313	0	\N	\N	\N	\N	\N	kx	303
3031301	Thị trấn Hát Lót	30313	0	\N	\N	\N	\N	\N	hl	303
3031303	Thị trấn NT Tô Hiệu	30313	0	\N	\N	\N	\N	\N	nth	303
3031305	Thị trấn NT  Chiềng Sung	30313	0	\N	\N	\N	\N	\N	ncs	303
3031307	Xã Mường Bằng	30313	0	\N	\N	\N	\N	\N	mb	303
3031309	Xã Chiềng Chăn	30313	0	\N	\N	\N	\N	\N	cc	303
3031311	Xã Mương Tranh	30313	0	\N	\N	\N	\N	\N	mt	303
3031313	Xã Chiềng Ban	30313	0	\N	\N	\N	\N	\N	cb	303
3031315	Xã Chiềng Mung	30313	0	\N	\N	\N	\N	\N	cm	303
3031317	Xã Mường Bon	30313	0	\N	\N	\N	\N	\N	mb	303
3031319	Xã Chiềng Chung	30313	0	\N	\N	\N	\N	\N	cc	303
3031321	Xã Chiềng Mai	30313	0	\N	\N	\N	\N	\N	cm	303
3031323	Xã Hát Lót	30313	0	\N	\N	\N	\N	\N	hl	303
3031325	Xã Cò  Nòi	30313	0	\N	\N	\N	\N	\N	cn	303
3031327	Xã Chiềng Nơi	30313	0	\N	\N	\N	\N	\N	cn	303
3031329	Xã Chiềng Dong	30313	0	\N	\N	\N	\N	\N	cd	303
3031331	Xã Chiềng Kheo	30313	0	\N	\N	\N	\N	\N	ck	303
3031333	Xã Chiềng Ve	30313	0	\N	\N	\N	\N	\N	cv	303
3031335	Xã Chiềng Lương	30313	0	\N	\N	\N	\N	\N	cl	303
3031337	Xã Phiêng Pằn	30313	0	\N	\N	\N	\N	\N	pp	303
3031339	Xã Tà Hộc	30313	0	\N	\N	\N	\N	\N	th	303
3031341	Xã Phiêng Cằm	30313	0	\N	\N	\N	\N	\N	pc	303
3031343	Xã Nà ớt	30313	0	\N	\N	\N	\N	\N	no	303
3031500	Không xác định	30315	0	\N	\N	\N	\N	\N	kx	303
3031501	Thị trấn Sông Mã	30315	0	\N	\N	\N	\N	\N	sm	303
3031503	Xã Bó Sinh	30315	0	\N	\N	\N	\N	\N	bs	303
3031505	Xã Pú Pẩu	30315	0	\N	\N	\N	\N	\N	pp	303
3031507	Xã Chiềng Phung	30315	0	\N	\N	\N	\N	\N	cp	303
3031509	Xã Chiềng En	30315	0	\N	\N	\N	\N	\N	ce	303
3031511	Xã Mường Lầm	30315	0	\N	\N	\N	\N	\N	ml	303
3031513	Xã Nậm Ty	30315	0	\N	\N	\N	\N	\N	nt	303
3031515	Xã Đứa Mòn	30315	0	\N	\N	\N	\N	\N	dm	303
3031517	Xã Yên Hưng	30315	0	\N	\N	\N	\N	\N	yh	303
3031519	Xã Chiềng Sơ	30315	0	\N	\N	\N	\N	\N	cs	303
3031521	Xã Nà Ngựu	30315	0	\N	\N	\N	\N	\N	nn	303
3031523	Xã Nậm Mằn	30315	0	\N	\N	\N	\N	\N	nm	303
3031525	Xã Chiềng Khoong	30315	0	\N	\N	\N	\N	\N	ck	303
3031527	Xã Chiềng Cang	30315	0	\N	\N	\N	\N	\N	cc	303
3031529	Xã Sam Kha	30315	0	\N	\N	\N	\N	\N	sk	303
3031531	Xã Púng Bánh	30315	0	\N	\N	\N	\N	\N	pb	303
3031533	Xã Huổi Một	30315	0	\N	\N	\N	\N	\N	hm	303
3031535	Xã Mường Sai	30315	0	\N	\N	\N	\N	\N	ms	303
3031537	Xã Dồm Cang	30315	0	\N	\N	\N	\N	\N	dc	303
3031539	Xã Xốp Cộp	30315	0	\N	\N	\N	\N	\N	xc	303
3031541	Xã Mường Cai	30315	0	\N	\N	\N	\N	\N	mc	303
3031543	Xã Mường Hung	30315	0	\N	\N	\N	\N	\N	mh	303
3031545	Xã Mường Lèo	30315	0	\N	\N	\N	\N	\N	ml	303
3031547	Xã Chiềng Khương	30315	0	\N	\N	\N	\N	\N	ck	303
3031549	Xã Nậm Lạnh	30315	0	\N	\N	\N	\N	\N	nl	303
3031551	Xã Mường Và	30315	0	\N	\N	\N	\N	\N	mv	303
3031553	Xã Mường Lạn	30315	0	\N	\N	\N	\N	\N	ml	303
3031700	Không xác định	30317	0	\N	\N	\N	\N	\N	kx	303
3031701	Thị trấn Yên Châu	30317	0	\N	\N	\N	\N	\N	yc	303
3031703	Xã Chiềng Đông	30317	0	\N	\N	\N	\N	\N	cd	303
3031705	Xã Sập Vạt	30317	0	\N	\N	\N	\N	\N	sv	303
3031707	Xã Chiềng Sàng	30317	0	\N	\N	\N	\N	\N	cs	303
3031709	Xã Chiềng Pằn	30317	0	\N	\N	\N	\N	\N	cp	303
3031711	Xã Viêng Lán	30317	0	\N	\N	\N	\N	\N	vl	303
3031713	Xã Chiềng Hặc	30317	0	\N	\N	\N	\N	\N	ch	303
3031715	Xã Mường Lựm	30317	0	\N	\N	\N	\N	\N	ml	303
3031717	Xã Chiềng On	30317	0	\N	\N	\N	\N	\N	co	303
3031719	Xã Chiềng Khoi	30317	0	\N	\N	\N	\N	\N	ck	303
3031721	Xã Tú Nang	30317	0	\N	\N	\N	\N	\N	tn	303
3031723	Xã Lóng Phiêng	30317	0	\N	\N	\N	\N	\N	lp	303
3031725	Xã Phiêng Khoài	30317	0	\N	\N	\N	\N	\N	pk	303
3031727	Xã Chiềng Tương	30317	0	\N	\N	\N	\N	\N	ct	303
3031729	Xã Yên Sơn	30317	0	\N	\N	\N	\N	\N	ys	303
3031900	Không xác định	30319	0	\N	\N	\N	\N	\N	kx	303
3031901	Thị trấn Mộc Châu	30319	0	\N	\N	\N	\N	\N	mc	303
3031905	Thị trấn NT Chiềng Ve	30319	0	\N	\N	\N	\N	\N	ncv	303
3031907	Xã Tân Hợp	30319	0	\N	\N	\N	\N	\N	th	303
3031909	Xã Qui Hướng	30319	0	\N	\N	\N	\N	\N	qh	303
3031911	Xã Suối Bàng	30319	0	\N	\N	\N	\N	\N	sb	303
3031913	Xã Tân Lập	30319	0	\N	\N	\N	\N	\N	tl	303
3031915	Xã Nà Mường	30319	0	\N	\N	\N	\N	\N	nm	303
3031917	Xã Song Khủa	30319	0	\N	\N	\N	\N	\N	sk	303
3031919	Xã Chiềng Hắc	30319	0	\N	\N	\N	\N	\N	ch	303
3031921	Xã Hua Păng	30319	0	\N	\N	\N	\N	\N	hp	303
3031923	Xã Tô Múa	30319	0	\N	\N	\N	\N	\N	tm	303
3031925	Xã Mường Tè	30319	0	\N	\N	\N	\N	\N	mt	303
3031927	Xã Chiềng Khừa	30319	0	\N	\N	\N	\N	\N	ck	303
3031929	Xã Mường Sang	30319	0	\N	\N	\N	\N	\N	ms	303
3031931	Xã Phiêng Luông	30319	0	\N	\N	\N	\N	\N	pl	303
3031933	Xã Chiềng Khoa	30319	0	\N	\N	\N	\N	\N	ck	303
3031935	Xã Mường Men	30319	0	\N	\N	\N	\N	\N	mm	303
3031937	Xã Quang Minh	30319	0	\N	\N	\N	\N	\N	qm	303
3031939	Xã Lóng Sập	30319	0	\N	\N	\N	\N	\N	ls	303
3031941	Xã Vân Hồ	30319	0	\N	\N	\N	\N	\N	vh	303
3031943	Xã Lóng Luông	30319	0	\N	\N	\N	\N	\N	ll	303
3031945	Xã Chiềng Yên	30319	0	\N	\N	\N	\N	\N	cy	303
3031947	Xã Xuân Nha	30319	0	\N	\N	\N	\N	\N	xn	303
3031949	Xã Đông Sang	30319	0	\N	\N	\N	\N	\N	ds	303
3031951	Xã Tà Lai	30319	0	\N	\N	\N	\N	\N	tl	303
3031953	Xã Liên Hòa	30319	0	\N	\N	\N	\N	\N	lh	303
3050000	Không xác định	30500	0	\N	\N	\N	\N	\N	kx	305
3050100	Không xác định	30501	0	\N	\N	\N	\N	\N	kx	305
3050101	Phường Phương Lâm	30501	0	\N	\N	\N	\N	\N	pl	305
3050103	Phường Đồng Tiến	30501	0	\N	\N	\N	\N	\N	dt	305
3050105	Phường Chăm Mát	30501	0	\N	\N	\N	\N	\N	cm	305
3050107	Phường Tân Thịnh	30501	0	\N	\N	\N	\N	\N	tt	305
3050109	Phường Tân Hòa	30501	0	\N	\N	\N	\N	\N	th	305
3050111	Phường Hữu Nghị	30501	0	\N	\N	\N	\N	\N	hn	305
3050113	Xã Yên Mông	30501	0	\N	\N	\N	\N	\N	ym	305
3050115	Xã Hòa Bình	30501	0	\N	\N	\N	\N	\N	hb	305
3050117	Xã Thịnh Lang	30501	0	\N	\N	\N	\N	\N	tl	305
3050119	Xã Sủ Ngòi	30501	0	\N	\N	\N	\N	\N	sn	305
3050121	Xã Dân Chủ	30501	0	\N	\N	\N	\N	\N	dc	305
3050123	Xã Thái Thịnh	30501	0	\N	\N	\N	\N	\N	tt	305
3050125	Xã Thái Bình	30501	0	\N	\N	\N	\N	\N	tb	305
3050127	Xã Thống Nhất	30501	0	\N	\N	\N	\N	\N	tn	305
3050300	Không xác định	30503	0	\N	\N	\N	\N	\N	kx	305
3050301	Thị trấn Đà Bắc	30503	0	\N	\N	\N	\N	\N	db	305
3050303	Xã Đồng Nghê	30503	0	\N	\N	\N	\N	\N	dn	305
3050305	Xã Suối Nánh	30503	0	\N	\N	\N	\N	\N	sn	305
3050307	Xã Mường Tuổng	30503	0	\N	\N	\N	\N	\N	mt	305
3050309	Xã Giáp Đắt	30503	0	\N	\N	\N	\N	\N	gd	305
1060923	Xã Hà Mãn	10609	0	\N	\N	\N	\N	\N	hm	106
3050311	Xã Mường Chiềng	30503	0	\N	\N	\N	\N	\N	mc	305
3050313	Xã Tân Pheo	30503	0	\N	\N	\N	\N	\N	tp	305
3050315	Xã Đồng Chum	30503	0	\N	\N	\N	\N	\N	dc	305
3050317	Xã Đoàn Kết	30503	0	\N	\N	\N	\N	\N	dk	305
3050319	Xã Đồng Ruộng	30503	0	\N	\N	\N	\N	\N	dr	305
3050321	Xã Tân Minh	30503	0	\N	\N	\N	\N	\N	tm	305
3050323	Xã Tu Lý	30503	0	\N	\N	\N	\N	\N	tl	305
3050325	Xã Hào Lý	30503	0	\N	\N	\N	\N	\N	hl	305
3050327	Xã Trung Thành	30503	0	\N	\N	\N	\N	\N	tt	305
3050329	Xã Toàn Sơn	30503	0	\N	\N	\N	\N	\N	ts	305
3050331	Xã Yên Hòa	30503	0	\N	\N	\N	\N	\N	yh	305
3050333	Xã Tân Dân	30503	0	\N	\N	\N	\N	\N	td	305
3050335	Xã Hiền Lương	30503	0	\N	\N	\N	\N	\N	hl	305
3050337	Xã Cao Sơn	30503	0	\N	\N	\N	\N	\N	cs	305
3050339	Xã Tiền Phong	30503	0	\N	\N	\N	\N	\N	tp	305
3050341	Xã Vầy Nưa	30503	0	\N	\N	\N	\N	\N	vn	305
3050500	Không xác định	30505	0	\N	\N	\N	\N	\N	kx	305
3050501	Thị trấn Mai Châu	30505	0	\N	\N	\N	\N	\N	mc	305
3050503	Xã Tân Mai	30505	0	\N	\N	\N	\N	\N	tm	305
3050505	Xã Phúc Sạn	30505	0	\N	\N	\N	\N	\N	ps	305
3050507	Xã Pà Cò	30505	0	\N	\N	\N	\N	\N	pc	305
3050509	Xã Hang Kia	30505	0	\N	\N	\N	\N	\N	hk	305
3050511	Xã Ba Khan	30505	0	\N	\N	\N	\N	\N	bk	305
3050513	Xã Bao La	30505	0	\N	\N	\N	\N	\N	bl	305
3050515	Xã Piềng Vế	30505	0	\N	\N	\N	\N	\N	pv	305
3050517	Xã Đồng Bảng	30505	0	\N	\N	\N	\N	\N	db	305
3050519	Xã Cun Pheo	30505	0	\N	\N	\N	\N	\N	cp	305
3050521	Xã Tòng Đậu	30505	0	\N	\N	\N	\N	\N	td	305
3050523	Xã Nà Mèo	30505	0	\N	\N	\N	\N	\N	nm	305
3050525	Xã Thung Khe	30505	0	\N	\N	\N	\N	\N	tk	305
3050527	Xã Săm Khóe	30505	0	\N	\N	\N	\N	\N	sk	305
3050529	Xã Nà Phòn	30505	0	\N	\N	\N	\N	\N	np	305
3050531	Xã Chiềng Châu	30505	0	\N	\N	\N	\N	\N	cc	305
3050533	Xã Mai Hạ	30505	0	\N	\N	\N	\N	\N	mh	305
3050535	Xã Mai Hịch	30505	0	\N	\N	\N	\N	\N	mh	305
3050537	Xã Nong Luông	30505	0	\N	\N	\N	\N	\N	nl	305
3050539	Xã Pù Pin	30505	0	\N	\N	\N	\N	\N	pp	305
3050541	Xã Vạn Mai	30505	0	\N	\N	\N	\N	\N	vm	305
3050700	Không xác định	30507	0	\N	\N	\N	\N	\N	kx	305
3050701	Thị trấn Kỳ Sơn	30507	0	\N	\N	\N	\N	\N	ks	305
3050703	Thị trấn Cao Phong	30507	0	\N	\N	\N	\N	\N	cp	305
3050705	Xã Hợp Thịnh	30507	0	\N	\N	\N	\N	\N	ht	305
3050707	Xã Phú Minh	30507	0	\N	\N	\N	\N	\N	pm	305
3050709	Xã Hợp Thành	30507	0	\N	\N	\N	\N	\N	ht	305
3050711	Xã Phúc Tiến	30507	0	\N	\N	\N	\N	\N	pt	305
3050713	Xã Dân Hòa	30507	0	\N	\N	\N	\N	\N	dh	305
3050715	Xã Mông Hóa	30507	0	\N	\N	\N	\N	\N	mh	305
3050717	Xã Dân Hạ	30507	0	\N	\N	\N	\N	\N	dh	305
3050719	Xã Trung Minh	30507	0	\N	\N	\N	\N	\N	tm	305
3050721	Xã Độc Lập	30507	0	\N	\N	\N	\N	\N	dl	305
3050723	Xã Bình Thanh	30507	0	\N	\N	\N	\N	\N	bt	305
3050725	Xã Thung Nai	30507	0	\N	\N	\N	\N	\N	tn	305
3050727	Xã Bắc Phong	30507	0	\N	\N	\N	\N	\N	bp	305
3050729	Xã Thu Phong	30507	0	\N	\N	\N	\N	\N	tp	305
3050731	Xã Đông Phong	30507	0	\N	\N	\N	\N	\N	dp	305
3050733	Xã Xuân Phong	30507	0	\N	\N	\N	\N	\N	xp	305
3050735	Xã Tân Phong	30507	0	\N	\N	\N	\N	\N	tp	305
3050737	Xã Tây Phong	30507	0	\N	\N	\N	\N	\N	tp	305
3050739	Xã Dũng Phong	30507	0	\N	\N	\N	\N	\N	dp	305
3050741	Xã Nam Phong	30507	0	\N	\N	\N	\N	\N	np	305
3050743	Xã Yên Lập	30507	0	\N	\N	\N	\N	\N	yl	305
3050745	Xã Yên Thượng	30507	0	\N	\N	\N	\N	\N	yt	305
3050900	Không xác định	30509	0	\N	\N	\N	\N	\N	kx	305
3050901	Thị trấn Lương Sơn	30509	0	\N	\N	\N	\N	\N	ls	305
3050903	Xã Yên Bình	30509	0	\N	\N	\N	\N	\N	yb	305
3050905	Xã Yên Trung	30509	0	\N	\N	\N	\N	\N	yt	305
3050907	Xã Yên Quang	30509	0	\N	\N	\N	\N	\N	yq	305
3050909	Xã Tiến Xuân	30509	0	\N	\N	\N	\N	\N	tx	305
3050911	Xã Đông Xuân	30509	0	\N	\N	\N	\N	\N	dx	305
3050913	Xã Lâm Sơn	30509	0	\N	\N	\N	\N	\N	ls	305
3050915	Xã Hòa Sơn	30509	0	\N	\N	\N	\N	\N	hs	305
3050917	Xã Trường Sơn	30509	0	\N	\N	\N	\N	\N	ts	305
3050919	Xã Tân Vinh	30509	0	\N	\N	\N	\N	\N	tv	305
3050921	Xã Nhuận Trạch	30509	0	\N	\N	\N	\N	\N	nt	305
3050923	Xã Cao Răm	30509	0	\N	\N	\N	\N	\N	cr	305
3050925	Xã Cư Yên	30509	0	\N	\N	\N	\N	\N	cy	305
3050927	Xã Hợp Hòa	30509	0	\N	\N	\N	\N	\N	hh	305
3050929	Xã Liên Sơn	30509	0	\N	\N	\N	\N	\N	ls	305
3050931	Xã Thành Lập	30509	0	\N	\N	\N	\N	\N	tl	305
3050933	Xã Tiến Sơn	30509	0	\N	\N	\N	\N	\N	ts	305
3050935	Xã Trung Sơn	30509	0	\N	\N	\N	\N	\N	ts	305
3051100	Không xác định	30511	0	\N	\N	\N	\N	\N	kx	305
3051101	Thị trấn Bo	30511	0	\N	\N	\N	\N	\N	b	305
1012720	Không xác định	10127	0	\N	\N	\N	\N	\N	kx	101
3051105	Xã Đú Sáng	30511	0	\N	\N	\N	\N	\N	ds	305
3051107	Xã  Bắc Sơn	30511	0	\N	\N	\N	\N	\N	bs	305
3051109	Xã Bình Sơn	30511	0	\N	\N	\N	\N	\N	bs	305
3051111	Xã Hùng Tiến	30511	0	\N	\N	\N	\N	\N	ht	305
3051113	Xã Tân Thành	30511	0	\N	\N	\N	\N	\N	tt	305
3051115	Xã Tú Sơn	30511	0	\N	\N	\N	\N	\N	ts	305
3051117	Xã Nật Sơn	30511	0	\N	\N	\N	\N	\N	ns	305
3051119	Xã Vĩnh Tiến	30511	0	\N	\N	\N	\N	\N	vt	305
3051121	Xã Sơn Thủy	30511	0	\N	\N	\N	\N	\N	st	305
3051123	Xã Cao Dương	30511	0	\N	\N	\N	\N	\N	cd	305
3051125	Xã Hạ Bì	30511	0	\N	\N	\N	\N	\N	hb	305
3051127	Xã Đông Bắc	30511	0	\N	\N	\N	\N	\N	db	305
3051129	Xã Lập Chiệng	30511	0	\N	\N	\N	\N	\N	lc	305
3051131	Xã Hợp Châu	30511	0	\N	\N	\N	\N	\N	hc	305
3051133	Xã Vĩnh Đồng	30511	0	\N	\N	\N	\N	\N	vd	305
3051135	Xã Kim Sơn	30511	0	\N	\N	\N	\N	\N	ks	305
3051137	Xã Hợp Đồng	30511	0	\N	\N	\N	\N	\N	hd	305
3051139	Xã Long Sơn	30511	0	\N	\N	\N	\N	\N	ls	305
3051141	Xã Thượng Tiến	30511	0	\N	\N	\N	\N	\N	tt	305
3051143	Xã Cao Thắng	30511	0	\N	\N	\N	\N	\N	ct	305
3051145	Xã Kim Bình	30511	0	\N	\N	\N	\N	\N	kb	305
3051147	Xã Kim Tiến	30511	0	\N	\N	\N	\N	\N	kt	305
3051149	Xã Hợp Kim	30511	0	\N	\N	\N	\N	\N	hk	305
3051151	Xã Thanh Lương	30511	0	\N	\N	\N	\N	\N	tl	305
3051153	Xã Kim Bôi	30511	0	\N	\N	\N	\N	\N	kb	305
3051155	Xã Hợp Thanh	30511	0	\N	\N	\N	\N	\N	ht	305
3051157	Xã Nam Thượng	30511	0	\N	\N	\N	\N	\N	nt	305
3051159	Xã Thanh Nông	30511	0	\N	\N	\N	\N	\N	tn	305
3051161	Xã Kim Truy	30511	0	\N	\N	\N	\N	\N	kt	305
3051163	Xã Sào Báy	30511	0	\N	\N	\N	\N	\N	sb	305
3051165	Xã Cuối Hạ	30511	0	\N	\N	\N	\N	\N	ch	305
3051167	Xã Mi Hòa	30511	0	\N	\N	\N	\N	\N	mh	305
3051169	Xã Nuông Dăm	30511	0	\N	\N	\N	\N	\N	nd	305
3051300	Không xác định	30513	0	\N	\N	\N	\N	\N	kx	305
3051301	Thị trấn Mường Khến	30513	0	\N	\N	\N	\N	\N	mk	305
3051303	Xã Ngòi Hoa	30513	0	\N	\N	\N	\N	\N	nh	305
3051305	Xã Trung Hòa	30513	0	\N	\N	\N	\N	\N	th	305
3051307	Xã Phú Vinh	30513	0	\N	\N	\N	\N	\N	pv	305
3051309	Xã Phú Cường	30513	0	\N	\N	\N	\N	\N	pc	305
3051311	Xã Mỹ Hòa	30513	0	\N	\N	\N	\N	\N	mh	305
3051313	Xã Quy Hậu	30513	0	\N	\N	\N	\N	\N	qh	305
3051315	Xã Phong Phú	30513	0	\N	\N	\N	\N	\N	pp	305
3051317	Xã Mãn Đức	30513	0	\N	\N	\N	\N	\N	md	305
3051319	Xã Quyết Chiến	30513	0	\N	\N	\N	\N	\N	qc	305
3051321	Xã Địch Giáo	30513	0	\N	\N	\N	\N	\N	dg	305
3051323	Xã Tuân Lộ	30513	0	\N	\N	\N	\N	\N	tl	305
3051325	Xã Tử Nê	30513	0	\N	\N	\N	\N	\N	tn	305
3051327	Xã Ngọc Mỹ	30513	0	\N	\N	\N	\N	\N	nm	305
3051329	Xã Thanh Hối	30513	0	\N	\N	\N	\N	\N	th	305
3051331	Xã Đông Lai	30513	0	\N	\N	\N	\N	\N	dl	305
3051333	Xã Bắc Sơn	30513	0	\N	\N	\N	\N	\N	bs	305
3051335	Xã Lũng Vân	30513	0	\N	\N	\N	\N	\N	lv	305
3051337	Xã Quy Mỹ	30513	0	\N	\N	\N	\N	\N	qm	305
3051339	Xã Do Nhân	30513	0	\N	\N	\N	\N	\N	dn	305
3051341	Xã Nam Sơn	30513	0	\N	\N	\N	\N	\N	ns	305
3051343	Xã Lỗ Sơn	30513	0	\N	\N	\N	\N	\N	ls	305
3051345	Xã Ngổ Luông	30513	0	\N	\N	\N	\N	\N	nl	305
3051347	Xã Gia Mô	30513	0	\N	\N	\N	\N	\N	gm	305
3051500	Không xác định	30515	0	\N	\N	\N	\N	\N	kx	305
3051501	Thị trấn Vụ Bản	30515	0	\N	\N	\N	\N	\N	vb	305
3051503	Xã Quý Hòa	30515	0	\N	\N	\N	\N	\N	qh	305
3051505	Xã Miền Đồi	30515	0	\N	\N	\N	\N	\N	md	305
3051507	Xã Mỹ Thành	30515	0	\N	\N	\N	\N	\N	mt	305
3051509	Xã Tuân Đạo	30515	0	\N	\N	\N	\N	\N	td	305
3051511	Xã Văn Nghĩa	30515	0	\N	\N	\N	\N	\N	vn	305
3051513	Xã Văn Sơn	30515	0	\N	\N	\N	\N	\N	vs	305
3051515	Xã Tân Lập	30515	0	\N	\N	\N	\N	\N	tl	305
3051517	Xã Nhân Nghĩa	30515	0	\N	\N	\N	\N	\N	nn	305
3051519	Xã Thượng Cốc	30515	0	\N	\N	\N	\N	\N	tc	305
3051521	Xã Phú Lương	30515	0	\N	\N	\N	\N	\N	pl	305
3051523	Xã Phúc Tuy	30515	0	\N	\N	\N	\N	\N	pt	305
3051525	Xã Xuất Hóa	30515	0	\N	\N	\N	\N	\N	xh	305
3051527	Xã Yên Phú	30515	0	\N	\N	\N	\N	\N	yp	305
3051529	Xã Bình Hẻm	30515	0	\N	\N	\N	\N	\N	bh	305
3051531	Xã Chí Đạo	30515	0	\N	\N	\N	\N	\N	cd	305
3051533	Xã Chí Thiện	30515	0	\N	\N	\N	\N	\N	ct	305
3051535	Xã Bình Cảng	30515	0	\N	\N	\N	\N	\N	bc	305
3051537	Xã Bình Chân	30515	0	\N	\N	\N	\N	\N	bc	305
3051539	Xã Định Cư	30515	0	\N	\N	\N	\N	\N	dc	305
3051541	Xã Hương Nhượng	30515	0	\N	\N	\N	\N	\N	hn	305
3051543	Xã Liên Vũ	30515	0	\N	\N	\N	\N	\N	lv	305
3051545	Xã Đa Phúc	30515	0	\N	\N	\N	\N	\N	dp	305
3051547	Xã Ngọc Sơn	30515	0	\N	\N	\N	\N	\N	ns	305
3051549	Xã Tự Do	30515	0	\N	\N	\N	\N	\N	td	305
3051551	Xã Vũ Lâm	30515	0	\N	\N	\N	\N	\N	vl	305
3051553	Xã Tân Mỹ	30515	0	\N	\N	\N	\N	\N	tm	305
3051555	Xã Ân Nghĩa	30515	0	\N	\N	\N	\N	\N	an	305
3051557	Xã Yên Nghiệp	30515	0	\N	\N	\N	\N	\N	yn	305
3051559	Xã Ngọc Lâu	30515	0	\N	\N	\N	\N	\N	nl	305
3051700	Không xác định	30517	0	\N	\N	\N	\N	\N	kx	305
3051701	Thị trấn Chi Nê	30517	0	\N	\N	\N	\N	\N	cn	305
3051703	Thị trấn NT Sông Bôi	30517	0	\N	\N	\N	\N	\N	nsb	305
3051705	Xã Phú Lão	30517	0	\N	\N	\N	\N	\N	pl	305
3051707	Xã Phú Thành	30517	0	\N	\N	\N	\N	\N	pt	305
3051709	Xã Cố Nghĩa	30517	0	\N	\N	\N	\N	\N	cn	305
3051711	Xã Hưng Thi	30517	0	\N	\N	\N	\N	\N	ht	305
3051713	Xã Lạc Long	30517	0	\N	\N	\N	\N	\N	ll	305
3051715	Xã Liên Hòa	30517	0	\N	\N	\N	\N	\N	lh	305
3051717	Xã Khoan Dụ	30517	0	\N	\N	\N	\N	\N	kd	305
3051719	Xã Đồng Môn	30517	0	\N	\N	\N	\N	\N	dm	305
3051721	Xã Đồng Tâm	30517	0	\N	\N	\N	\N	\N	dt	305
3051723	Xã Yên Bồng	30517	0	\N	\N	\N	\N	\N	yb	305
3051725	Xã An Lạc	30517	0	\N	\N	\N	\N	\N	al	305
3051727	Xã An Bình	30517	0	\N	\N	\N	\N	\N	ab	305
3051900	Không xác định	30519	0	\N	\N	\N	\N	\N	kx	305
3051901	Thị trấn Hàng Trạm	30519	0	\N	\N	\N	\N	\N	ht	305
3051903	Xã Lạc Sỹ	30519	0	\N	\N	\N	\N	\N	ls	305
3051905	Xã Lạc Hưng	30519	0	\N	\N	\N	\N	\N	lh	305
3051907	Xã Lạc Lương	30519	0	\N	\N	\N	\N	\N	ll	305
3051909	Xã Bảo Hiệu	30519	0	\N	\N	\N	\N	\N	bh	305
3051911	Xã Hữu Lợi	30519	0	\N	\N	\N	\N	\N	hl	305
3051913	Xã Lạc Thịnh	30519	0	\N	\N	\N	\N	\N	lt	305
3051915	Xã Yên Lạc	30519	0	\N	\N	\N	\N	\N	yl	305
3051917	Xã Phú Lai	30519	0	\N	\N	\N	\N	\N	pl	305
3051919	Xã Đoàn Kết	30519	0	\N	\N	\N	\N	\N	dk	305
3051921	Xã Yên Trị	30519	0	\N	\N	\N	\N	\N	yt	305
3051923	Xã Ngọc Lương	30519	0	\N	\N	\N	\N	\N	nl	305
4010000	Không xác định	40100	0	\N	\N	\N	\N	\N	kx	401
4010100	Không xác định	40101	0	\N	\N	\N	\N	\N	kx	401
4010101	Phường Hàm Rồng	40101	0	\N	\N	\N	\N	\N	hr	401
4010103	Phường Nam Ngạn	40101	0	\N	\N	\N	\N	\N	nn	401
4010105	Phường Trường Thi	40101	0	\N	\N	\N	\N	\N	tt	401
4010107	Phường Đông Sơn	40101	0	\N	\N	\N	\N	\N	ds	401
4010109	Phường Điện Biên	40101	0	\N	\N	\N	\N	\N	db	401
4010111	Phường Lam Sơn	40101	0	\N	\N	\N	\N	\N	ls	401
4010113	Phường Ba Đình	40101	0	\N	\N	\N	\N	\N	bd	401
4010115	Phường Ngọc Trạo	40101	0	\N	\N	\N	\N	\N	nt	401
4010117	Phường Phú Sơn	40101	0	\N	\N	\N	\N	\N	ps	401
4010119	Phường Đông Vệ	40101	0	\N	\N	\N	\N	\N	dv	401
4010121	Phường Đông Thọ	40101	0	\N	\N	\N	\N	\N	dt	401
4010123	Xã Đông Hương	40101	0	\N	\N	\N	\N	\N	dh	401
4010125	Xã Đông Hải	40101	0	\N	\N	\N	\N	\N	dh	401
4010127	Xã Quảng Thắng	40101	0	\N	\N	\N	\N	\N	qt	401
4010129	Xã Đông Cương	40101	0	\N	\N	\N	\N	\N	dc	401
4010131	Xã Quảng Thành	40101	0	\N	\N	\N	\N	\N	qt	401
4010133	Xã Quảng Hưng	40101	0	\N	\N	\N	\N	\N	qh	401
4010300	Không xác định	40103	0	\N	\N	\N	\N	\N	kx	401
4010301	Phường Bắc Sơn	40103	0	\N	\N	\N	\N	\N	bs	401
4010303	Phường Ngọc Trạo	40103	0	\N	\N	\N	\N	\N	nt	401
4010305	Phường Ba Đình	40103	0	\N	\N	\N	\N	\N	bd	401
4010307	Phường Lam Sơn	40103	0	\N	\N	\N	\N	\N	ls	401
4010309	Xã Quang Trung	40103	0	\N	\N	\N	\N	\N	qt	401
4010311	Xã Hà Lan	40103	0	\N	\N	\N	\N	\N	hl	401
4010500	Không xác định	40105	0	\N	\N	\N	\N	\N	kx	401
4010501	Phường Bắc Sơn	40105	0	\N	\N	\N	\N	\N	bs	401
4010503	Phường Trường Sơn	40105	0	\N	\N	\N	\N	\N	ts	401
4010505	Phường Trung Sơn	40105	0	\N	\N	\N	\N	\N	ts	401
4010507	Xã Quảng Tiến	40105	0	\N	\N	\N	\N	\N	qt	401
4010509	Xã Quảng Cư	40105	0	\N	\N	\N	\N	\N	qc	401
4010700	Không xác định	40107	0	\N	\N	\N	\N	\N	kx	401
4010701	Xã Trung Lý	40107	0	\N	\N	\N	\N	\N	tl	401
4010703	Xã Tén Tằn	40107	0	\N	\N	\N	\N	\N	tt	401
4010705	Xã Tam Chung	40107	0	\N	\N	\N	\N	\N	tc	401
4010707	Xã Phù Nhi	40107	0	\N	\N	\N	\N	\N	pn	401
4010709	Xã Quang Chiểu	40107	0	\N	\N	\N	\N	\N	qc	401
4010711	Xã Mường Chanh	40107	0	\N	\N	\N	\N	\N	mc	401
4010900	Không xác định	40109	0	\N	\N	\N	\N	\N	kx	401
4010901	Thị trấn Quan Hóa	40109	0	\N	\N	\N	\N	\N	qh	401
4010903	Xã Thiên Phú	40109	0	\N	\N	\N	\N	\N	tp	401
4010905	Xã Nam Động	40109	0	\N	\N	\N	\N	\N	nd	401
4010907	Xã Hiền Chung	40109	0	\N	\N	\N	\N	\N	hc	401
4010909	Xã Hiền Kiệt	40109	0	\N	\N	\N	\N	\N	hk	401
4010911	Xã Phú Nghiêm	40109	0	\N	\N	\N	\N	\N	pn	401
4010913	Xã Nam Tiến	40109	0	\N	\N	\N	\N	\N	nt	401
4010915	Xã Phú Lệ	40109	0	\N	\N	\N	\N	\N	pl	401
4010917	Xã Hồi Xuân	40109	0	\N	\N	\N	\N	\N	hx	401
4010919	Xã Phú Sơn	40109	0	\N	\N	\N	\N	\N	ps	401
4010921	Xã Phú Thanh	40109	0	\N	\N	\N	\N	\N	pt	401
4010923	Xã Phú Xuân	40109	0	\N	\N	\N	\N	\N	px	401
4010925	Xã Thanh Sơn	40109	0	\N	\N	\N	\N	\N	ts	401
4010927	Xã Trung Thành	40109	0	\N	\N	\N	\N	\N	tt	401
4010929	Xã Thanh Xuân	40109	0	\N	\N	\N	\N	\N	tx	401
4010931	Xã Trung Sơn	40109	0	\N	\N	\N	\N	\N	ts	401
4010933	Xã Nam Xuân	40109	0	\N	\N	\N	\N	\N	nx	401
4010935	Xã Xuân Phú	40109	0	\N	\N	\N	\N	\N	xp	401
4011100	Không xác định	40111	0	\N	\N	\N	\N	\N	kx	401
4011101	Xã Trung Xuân	40111	0	\N	\N	\N	\N	\N	tx	401
4011103	Xã Trung Thượng	40111	0	\N	\N	\N	\N	\N	tt	401
4011105	Xã Trung Hạ	40111	0	\N	\N	\N	\N	\N	th	401
4011107	Xã Sơn Hà	40111	0	\N	\N	\N	\N	\N	sh	401
4011109	Xã Tam Thanh	40111	0	\N	\N	\N	\N	\N	tt	401
4011111	Xã Sơn Thủy	40111	0	\N	\N	\N	\N	\N	st	401
4011113	Xã Sơn Lư	40111	0	\N	\N	\N	\N	\N	sl	401
4011115	Xã Tam Lư	40111	0	\N	\N	\N	\N	\N	tl	401
4011117	Xã Sơn Điện	40111	0	\N	\N	\N	\N	\N	sd	401
4011300	Không xác định	40113	0	\N	\N	\N	\N	\N	kx	401
4011301	Thị trấn Cành Nàng	40113	0	\N	\N	\N	\N	\N	cn	401
4011303	Xã Điền Thượng	40113	0	\N	\N	\N	\N	\N	dt	401
4011305	Xã Điền Hạ	40113	0	\N	\N	\N	\N	\N	dh	401
4011307	Xã Điền Quang	40113	0	\N	\N	\N	\N	\N	dq	401
4011309	Xã Điền Trung	40113	0	\N	\N	\N	\N	\N	dt	401
4011311	Xã Thành Sơn	40113	0	\N	\N	\N	\N	\N	ts	401
4011313	Xã Lương Ngoại	40113	0	\N	\N	\N	\N	\N	ln	401
4011315	Xã ái Thượng	40113	0	\N	\N	\N	\N	\N	at	401
4011317	Xã Lương Nội	40113	0	\N	\N	\N	\N	\N	ln	401
4011319	Xã Điền Lư	40113	0	\N	\N	\N	\N	\N	dl	401
4011321	Xã Lương Trung	40113	0	\N	\N	\N	\N	\N	lt	401
4011323	Xã Lũng Niêm	40113	0	\N	\N	\N	\N	\N	ln	401
4011325	Xã Lũng Cao	40113	0	\N	\N	\N	\N	\N	lc	401
4011327	Xã Hạ Trung	40113	0	\N	\N	\N	\N	\N	ht	401
4011329	Xã Cổ Lũng	40113	0	\N	\N	\N	\N	\N	cl	401
4011331	Xã Thành Lâm	40113	0	\N	\N	\N	\N	\N	tl	401
4011333	Xã Ban Công	40113	0	\N	\N	\N	\N	\N	bc	401
4011335	Xã Kỳ Tân	40113	0	\N	\N	\N	\N	\N	kt	401
4011337	Xã Văn Nho	40113	0	\N	\N	\N	\N	\N	vn	401
4011339	Xã Thiết ống	40113	0	\N	\N	\N	\N	\N	to	401
4011341	Xã Lâm Sa	40113	0	\N	\N	\N	\N	\N	ls	401
4011343	Xã Thiết Kế	40113	0	\N	\N	\N	\N	\N	tk	401
4011345	Xã Tân Lập	40113	0	\N	\N	\N	\N	\N	tl	401
4011500	Không xác định	40115	0	\N	\N	\N	\N	\N	kx	401
4011501	Thị trấn Cẩm Thủy	40115	0	\N	\N	\N	\N	\N	ct	401
4011503	Thị trấn NT Phúc Do	40115	0	\N	\N	\N	\N	\N	npd	401
4011505	Xã Cẩm Thành	40115	0	\N	\N	\N	\N	\N	ct	401
4011507	Xã Cẩm Quý	40115	0	\N	\N	\N	\N	\N	cq	401
4011509	Xã Cẩm Lương	40115	0	\N	\N	\N	\N	\N	cl	401
4011511	Xã Cẩm Thạch	40115	0	\N	\N	\N	\N	\N	ct	401
4011513	Xã Cẩm Liên	40115	0	\N	\N	\N	\N	\N	cl	401
4011515	Xã Cẩm Giang	40115	0	\N	\N	\N	\N	\N	cg	401
4011517	Xã Cẩm Bình	40115	0	\N	\N	\N	\N	\N	cb	401
4011519	Xã Cẩm Tú	40115	0	\N	\N	\N	\N	\N	ct	401
4011521	Xã Cẩm Sơn	40115	0	\N	\N	\N	\N	\N	cs	401
4011523	Xã Cẩm Châu	40115	0	\N	\N	\N	\N	\N	cc	401
4011525	Xã Cẩm Tâm	40115	0	\N	\N	\N	\N	\N	ct	401
4011527	Xã Cẩm Phong	40115	0	\N	\N	\N	\N	\N	cp	401
4011529	Xã Cẩm Ngọc	40115	0	\N	\N	\N	\N	\N	cn	401
4011531	Xã Cẩm Long	40115	0	\N	\N	\N	\N	\N	cl	401
4011533	Xã Cẩm Yên	40115	0	\N	\N	\N	\N	\N	cy	401
4011535	Xã Cẩm Tân	40115	0	\N	\N	\N	\N	\N	ct	401
4011537	Xã Cẩm Phú	40115	0	\N	\N	\N	\N	\N	cp	401
4011539	Xã Cẩm Vân	40115	0	\N	\N	\N	\N	\N	cv	401
4011700	Không xác định	40117	0	\N	\N	\N	\N	\N	kx	401
4011701	Thị trấn Lang Chánh	40117	0	\N	\N	\N	\N	\N	lc	401
4011703	Xã Yên Khương	40117	0	\N	\N	\N	\N	\N	yk	401
4011705	Xã Yên Thắng	40117	0	\N	\N	\N	\N	\N	yt	401
4011707	Xã Trí Nang	40117	0	\N	\N	\N	\N	\N	tn	401
4011709	Xã Giao An	40117	0	\N	\N	\N	\N	\N	ga	401
4011711	Xã Giao Thiện	40117	0	\N	\N	\N	\N	\N	gt	401
4011713	Xã Tân Phúc	40117	0	\N	\N	\N	\N	\N	tp	401
4011715	Xã Tam Văn	40117	0	\N	\N	\N	\N	\N	tv	401
4011717	Xã Lâm Phú	40117	0	\N	\N	\N	\N	\N	lp	401
4011719	Xã Quang Hiến	40117	0	\N	\N	\N	\N	\N	qh	401
4011721	Xã Đồng Lương	40117	0	\N	\N	\N	\N	\N	dl	401
4011900	Không xác định	40119	0	\N	\N	\N	\N	\N	kx	401
4011901	Thị trấn NT Thạch Thành	40119	0	\N	\N	\N	\N	\N	ntt	401
4011903	Thị trấn Kim Tân	40119	0	\N	\N	\N	\N	\N	kt	401
4011905	Thị trấn NT Vân Du	40119	0	\N	\N	\N	\N	\N	nvd	401
4011907	Xã Thạch Lâm	40119	0	\N	\N	\N	\N	\N	tl	401
4011909	Xã Thạch Quảng	40119	0	\N	\N	\N	\N	\N	tq	401
4011911	Xã Thạch Tượng	40119	0	\N	\N	\N	\N	\N	tt	401
4011913	Xã Thạch Cẩm	40119	0	\N	\N	\N	\N	\N	tc	401
4011915	Xã Thạch Sơn	40119	0	\N	\N	\N	\N	\N	ts	401
4011917	Xã Thạch Bình	40119	0	\N	\N	\N	\N	\N	tb	401
4011919	Xã Thạch Định	40119	0	\N	\N	\N	\N	\N	td	401
4011921	Xã Thạch Đồng	40119	0	\N	\N	\N	\N	\N	td	401
4011923	Xã Thạch Long	40119	0	\N	\N	\N	\N	\N	tl	401
4011925	Xã Thành Mỹ	40119	0	\N	\N	\N	\N	\N	tm	401
4011927	Xã Thành Yên	40119	0	\N	\N	\N	\N	\N	ty	401
4011929	Xã Thành Vinh	40119	0	\N	\N	\N	\N	\N	tv	401
4011931	Xã Thành Minh	40119	0	\N	\N	\N	\N	\N	tm	401
4011933	Xã Thành Công	40119	0	\N	\N	\N	\N	\N	tc	401
4011935	Xã Thành Tân	40119	0	\N	\N	\N	\N	\N	tt	401
4011937	Xã Thành Trực	40119	0	\N	\N	\N	\N	\N	tt	401
4011939	Xã Thành Vân	40119	0	\N	\N	\N	\N	\N	tv	401
4011941	Xã Thành Tâm	40119	0	\N	\N	\N	\N	\N	tt	401
4011943	Xã Thành An	40119	0	\N	\N	\N	\N	\N	ta	401
4011945	Xã Thành Thọ	40119	0	\N	\N	\N	\N	\N	tt	401
4011947	Xã Thành Tiến	40119	0	\N	\N	\N	\N	\N	tt	401
4011949	Xã Thành Long	40119	0	\N	\N	\N	\N	\N	tl	401
4011951	Xã Thành Kim	40119	0	\N	\N	\N	\N	\N	tk	401
4011953	Xã Thành Hưng	40119	0	\N	\N	\N	\N	\N	th	401
4011955	Xã Ngọc Trạo	40119	0	\N	\N	\N	\N	\N	nt	401
4012100	Không xác định	40121	0	\N	\N	\N	\N	\N	kx	401
4012101	Thị trấn Ngọc Lạc	40121	0	\N	\N	\N	\N	\N	nl	401
4012103	Thị trấn NT Lam Sơn	40121	0	\N	\N	\N	\N	\N	nls	401
4012105	Thị trấn NT Sông Âm	40121	0	\N	\N	\N	\N	\N	nsa	401
4012107	Xã Mỹ Tân	40121	0	\N	\N	\N	\N	\N	mt	401
4012109	Xã Thúy Sơn	40121	0	\N	\N	\N	\N	\N	ts	401
4012111	Xã Thạch Lập	40121	0	\N	\N	\N	\N	\N	tl	401
4012113	Xã Vân Âm	40121	0	\N	\N	\N	\N	\N	va	401
4012115	Xã Cao Ngọc	40121	0	\N	\N	\N	\N	\N	cn	401
4012117	Xã Ngọc Khê	40121	0	\N	\N	\N	\N	\N	nk	401
4012119	Xã Quang Trung	40121	0	\N	\N	\N	\N	\N	qt	401
4012121	Xã Đông Thịnh	40121	0	\N	\N	\N	\N	\N	dt	401
4012123	Xã Ngọc Liên	40121	0	\N	\N	\N	\N	\N	nl	401
4012125	Xã Ngọc Sơn	40121	0	\N	\N	\N	\N	\N	ns	401
4012127	Xã Lộc Thịnh	40121	0	\N	\N	\N	\N	\N	lt	401
4012129	Xã Cao Thịnh	40121	0	\N	\N	\N	\N	\N	ct	401
4012131	Xã Ngọc Trung	40121	0	\N	\N	\N	\N	\N	nt	401
4012133	Xã Phùng Giáo	40121	0	\N	\N	\N	\N	\N	pg	401
4012135	Xã Phùng Minh	40121	0	\N	\N	\N	\N	\N	pm	401
4012137	Xã Phúc Thịnh	40121	0	\N	\N	\N	\N	\N	pt	401
4012139	Xã Nguyệt ấn	40121	0	\N	\N	\N	\N	\N	na	401
4012141	Xã Kiên Thọ	40121	0	\N	\N	\N	\N	\N	kt	401
4012143	Xã Minh Tiến	40121	0	\N	\N	\N	\N	\N	mt	401
4012145	Xã Minh Sơn	40121	0	\N	\N	\N	\N	\N	ms	401
4012300	Không xác định	40123	0	\N	\N	\N	\N	\N	kx	401
4012301	Thị trấn Thường Xuân	40123	0	\N	\N	\N	\N	\N	tx	401
4012303	Xã Bát Mọt	40123	0	\N	\N	\N	\N	\N	bm	401
4012305	Xã Yên Nhân	40123	0	\N	\N	\N	\N	\N	yn	401
4012307	Xã Xuân Khao	40123	0	\N	\N	\N	\N	\N	xk	401
4012309	Xã Xuân Liên	40123	0	\N	\N	\N	\N	\N	xl	401
4012311	Xã Xuân Lẹ	40123	0	\N	\N	\N	\N	\N	xl	401
4012313	Xã Vạn Xuân	40123	0	\N	\N	\N	\N	\N	vx	401
4012315	Xã Xuân Mỹ	40123	0	\N	\N	\N	\N	\N	xm	401
4012317	Xã Lương Sơn	40123	0	\N	\N	\N	\N	\N	ls	401
4012319	Xã Xuân Cao	40123	0	\N	\N	\N	\N	\N	xc	401
4012321	Xã Luận Thành	40123	0	\N	\N	\N	\N	\N	lt	401
4012323	Xã Luận Khê	40123	0	\N	\N	\N	\N	\N	lk	401
4012325	Xã Xuân Thắng	40123	0	\N	\N	\N	\N	\N	xt	401
4012327	Xã Xuân Lộc	40123	0	\N	\N	\N	\N	\N	xl	401
4012329	Xã Xuân Cẩm	40123	0	\N	\N	\N	\N	\N	xc	401
4012331	Xã Xuân Dương	40123	0	\N	\N	\N	\N	\N	xd	401
4012333	Xã Thọ Thanh	40123	0	\N	\N	\N	\N	\N	tt	401
4012335	Xã Ngọc Phụng	40123	0	\N	\N	\N	\N	\N	np	401
4012337	Xã Xuân Chinh	40123	0	\N	\N	\N	\N	\N	xc	401
4012339	Xã Tân Thành	40123	0	\N	\N	\N	\N	\N	tt	401
4012500	Không xác định	40125	0	\N	\N	\N	\N	\N	kx	401
4012501	Thị trấn Yên Cát	40125	0	\N	\N	\N	\N	\N	yc	401
4012503	Thị trấn Bãi Trành	40125	0	\N	\N	\N	\N	\N	bt	401
4012505	Xã Xuân Bình	40125	0	\N	\N	\N	\N	\N	xb	401
4012507	Xã Hóa Quỳ	40125	0	\N	\N	\N	\N	\N	hq	401
4012509	Xã Xuân Quỳ	40125	0	\N	\N	\N	\N	\N	xq	401
4012511	Xã Yên Lễ	40125	0	\N	\N	\N	\N	\N	yl	401
4012513	Xã Cát Vân	40125	0	\N	\N	\N	\N	\N	cv	401
4012515	Xã Cát Tân	40125	0	\N	\N	\N	\N	\N	ct	401
4012517	Xã Tân Bình	40125	0	\N	\N	\N	\N	\N	tb	401
4012519	Xã Bình Lương	40125	0	\N	\N	\N	\N	\N	bl	401
4012521	Xã Thanh Quân	40125	0	\N	\N	\N	\N	\N	tq	401
4012523	Xã Thanh Xuân	40125	0	\N	\N	\N	\N	\N	tx	401
4012525	Xã Thanh Phong	40125	0	\N	\N	\N	\N	\N	tp	401
4012527	Xã Thanh Lâm	40125	0	\N	\N	\N	\N	\N	tl	401
4012529	Xã Thanh Sơn	40125	0	\N	\N	\N	\N	\N	ts	401
4012531	Xã Thượng Ninh	40125	0	\N	\N	\N	\N	\N	tn	401
4012700	Không xác định	40127	0	\N	\N	\N	\N	\N	kx	401
4012701	Xã Thanh Kỳ	40127	0	\N	\N	\N	\N	\N	tk	401
4012703	Xã Thanh Tân	40127	0	\N	\N	\N	\N	\N	tt	401
4012705	Xã Xuân Thái	40127	0	\N	\N	\N	\N	\N	xt	401
4012707	Xã Yên Lạc	40127	0	\N	\N	\N	\N	\N	yl	401
4012709	Xã Yên Thọ	40127	0	\N	\N	\N	\N	\N	yt	401
4012711	Xã Xuân Phúc	40127	0	\N	\N	\N	\N	\N	xp	401
4012713	Xã Phúc Đường	40127	0	\N	\N	\N	\N	\N	pd	401
4012715	Xã Xuân Thọ	40127	0	\N	\N	\N	\N	\N	xt	401
4012717	Xã Xuân Khang	40127	0	\N	\N	\N	\N	\N	xk	401
4012719	Xã Hải Long	40127	0	\N	\N	\N	\N	\N	hl	401
4012721	Xã Phú Nhuận	40127	0	\N	\N	\N	\N	\N	pn	401
4012723	Xã Mậu Lâm	40127	0	\N	\N	\N	\N	\N	ml	401
4012725	Xã Phượng Nghi	40127	0	\N	\N	\N	\N	\N	pn	401
4012727	Xã Xuân Du	40127	0	\N	\N	\N	\N	\N	xd	401
4012729	Xã Cán Khê	40127	0	\N	\N	\N	\N	\N	ck	401
4012731	Xã Hải Vân	40127	0	\N	\N	\N	\N	\N	hv	401
4012900	Không xác định	40129	0	\N	\N	\N	\N	\N	kx	401
4012901	Thị trấn Vĩnh Lộc	40129	0	\N	\N	\N	\N	\N	vl	401
4012903	Xã Vĩnh Thành	40129	0	\N	\N	\N	\N	\N	vt	401
4012905	Xã Vĩnh Quang	40129	0	\N	\N	\N	\N	\N	vq	401
4012907	Xã Vĩnh Yên	40129	0	\N	\N	\N	\N	\N	vy	401
4012909	Xã Vĩnh Tiến	40129	0	\N	\N	\N	\N	\N	vt	401
4012911	Xã Vĩnh Long	40129	0	\N	\N	\N	\N	\N	vl	401
4012913	Xã Vĩnh Phúc	40129	0	\N	\N	\N	\N	\N	vp	401
4012915	Xã Vĩnh Hưng	40129	0	\N	\N	\N	\N	\N	vh	401
4012917	Xã Vĩnh Minh	40129	0	\N	\N	\N	\N	\N	vm	401
4012919	Xã Vĩnh Khang	40129	0	\N	\N	\N	\N	\N	vk	401
4012921	Xã Vĩnh Hòa	40129	0	\N	\N	\N	\N	\N	vh	401
4012923	Xã Vĩnh Hùng	40129	0	\N	\N	\N	\N	\N	vh	401
4012925	Xã Vĩnh Tân	40129	0	\N	\N	\N	\N	\N	vt	401
4012927	Xã Vĩnh Ninh	40129	0	\N	\N	\N	\N	\N	vn	401
4012929	Xã Vĩnh Thịnh	40129	0	\N	\N	\N	\N	\N	vt	401
4012931	Xã Vĩnh An	40129	0	\N	\N	\N	\N	\N	va	401
4013100	Không xác định	40131	0	\N	\N	\N	\N	\N	kx	401
4013101	Thị trấn Hà Trung	40131	0	\N	\N	\N	\N	\N	ht	401
4013103	Xã Hà Long	40131	0	\N	\N	\N	\N	\N	hl	401
4013105	Xã Hà Vinh	40131	0	\N	\N	\N	\N	\N	hv	401
4013107	Xã Hà Bắc	40131	0	\N	\N	\N	\N	\N	hb	401
4013109	Xã Hà Vân	40131	0	\N	\N	\N	\N	\N	hv	401
4013111	Xã Hà Yên	40131	0	\N	\N	\N	\N	\N	hy	401
4013113	Xã Hà Thanh	40131	0	\N	\N	\N	\N	\N	ht	401
4013115	Xã Hà Giang	40131	0	\N	\N	\N	\N	\N	hg	401
4013117	Xã Hà Dương	40131	0	\N	\N	\N	\N	\N	hd	401
4013119	Xã Hà Phú	40131	0	\N	\N	\N	\N	\N	hp	401
4013121	Xã Hà Phong	40131	0	\N	\N	\N	\N	\N	hp	401
4013123	Xã Hà Ngọc	40131	0	\N	\N	\N	\N	\N	hn	401
4013125	Xã Hà Ninh	40131	0	\N	\N	\N	\N	\N	hn	401
4013127	Xã Hà Lâm	40131	0	\N	\N	\N	\N	\N	hl	401
4013129	Xã Hà Sơn	40131	0	\N	\N	\N	\N	\N	hs	401
4013131	Xã Hà Lĩnh	40131	0	\N	\N	\N	\N	\N	hl	401
4013133	Xã Hà Đông	40131	0	\N	\N	\N	\N	\N	hd	401
4013135	Xã Hà Tân	40131	0	\N	\N	\N	\N	\N	ht	401
4013137	Xã Hà Tiến	40131	0	\N	\N	\N	\N	\N	ht	401
4013139	Xã Hà Bình	40131	0	\N	\N	\N	\N	\N	hb	401
4013141	Xã Hà Lai	40131	0	\N	\N	\N	\N	\N	hl	401
4013143	Xã Hà Châu	40131	0	\N	\N	\N	\N	\N	hc	401
4013145	Xã Hà Toại	40131	0	\N	\N	\N	\N	\N	ht	401
4013147	Xã Hà Thái	40131	0	\N	\N	\N	\N	\N	ht	401
4013149	Xã Hà Hải	40131	0	\N	\N	\N	\N	\N	hh	401
4013300	Không xác định	40133	0	\N	\N	\N	\N	\N	kx	401
4013301	Thị trấn Nga Sơn	40133	0	\N	\N	\N	\N	\N	ns	401
4013303	Xã Ba Đình	40133	0	\N	\N	\N	\N	\N	bd	401
4013305	Xã Nga Vịnh	40133	0	\N	\N	\N	\N	\N	nv	401
4013307	Xã Nga Văn	40133	0	\N	\N	\N	\N	\N	nv	401
4013309	Xã Nga Thiện	40133	0	\N	\N	\N	\N	\N	nt	401
4013311	Xã Nga Tiến	40133	0	\N	\N	\N	\N	\N	nt	401
4013313	Xã Nga Lĩnh	40133	0	\N	\N	\N	\N	\N	nl	401
4013315	Xã Nga Nhân	40133	0	\N	\N	\N	\N	\N	nn	401
4013317	Xã Nga Trung	40133	0	\N	\N	\N	\N	\N	nt	401
4013319	Xã Nga Bạch	40133	0	\N	\N	\N	\N	\N	nb	401
4013321	Xã Nga Thanh	40133	0	\N	\N	\N	\N	\N	nt	401
4013323	Xã Nga Hưng	40133	0	\N	\N	\N	\N	\N	nh	401
4013325	Xã Nga Mỹ	40133	0	\N	\N	\N	\N	\N	nm	401
4013327	Xã Nga Yên	40133	0	\N	\N	\N	\N	\N	ny	401
4013329	Xã Nga Giáp	40133	0	\N	\N	\N	\N	\N	ng	401
4013331	Xã Nga Hải	40133	0	\N	\N	\N	\N	\N	nh	401
4013333	Xã Nga Thành	40133	0	\N	\N	\N	\N	\N	nt	401
4013335	Xã Nga An	40133	0	\N	\N	\N	\N	\N	na	401
4013337	Xã Nga Phú	40133	0	\N	\N	\N	\N	\N	np	401
4013339	Xã Nga Điền	40133	0	\N	\N	\N	\N	\N	nd	401
4013341	Xã Nga Tân	40133	0	\N	\N	\N	\N	\N	nt	401
4013343	Xã Nga Thủy	40133	0	\N	\N	\N	\N	\N	nt	401
4013345	Xã Nga Liên	40133	0	\N	\N	\N	\N	\N	nl	401
4013347	Xã Nga Thái	40133	0	\N	\N	\N	\N	\N	nt	401
4013349	Xã Nga Thạch	40133	0	\N	\N	\N	\N	\N	nt	401
4013351	Xã Nga Thắng	40133	0	\N	\N	\N	\N	\N	nt	401
4013353	Xã Nga Trường	40133	0	\N	\N	\N	\N	\N	nt	401
4013500	Không xác định	40135	0	\N	\N	\N	\N	\N	kx	401
4013501	Thị trấn Quán Lào	40135	0	\N	\N	\N	\N	\N	ql	401
4013503	Thị trấn NT Thống Nhất	40135	0	\N	\N	\N	\N	\N	ntn	401
4013505	Xã Yên Phú	40135	0	\N	\N	\N	\N	\N	yp	401
4013507	Xã Yên Lâm	40135	0	\N	\N	\N	\N	\N	yl	401
4013509	Xã Yên Tâm	40135	0	\N	\N	\N	\N	\N	yt	401
4013511	Xã Yên Giang	40135	0	\N	\N	\N	\N	\N	yg	401
4013513	Xã Yên Qúi	40135	0	\N	\N	\N	\N	\N	yq	401
4013515	Xã Yên Thọ	40135	0	\N	\N	\N	\N	\N	yt	401
4013517	Xã Yên Trung	40135	0	\N	\N	\N	\N	\N	yt	401
4013519	Xã Yên Trường	40135	0	\N	\N	\N	\N	\N	yt	401
4013521	Xã Yên Bái	40135	0	\N	\N	\N	\N	\N	yb	401
4013523	Xã Yên Phong	40135	0	\N	\N	\N	\N	\N	yp	401
4013525	Xã Yên Thái	40135	0	\N	\N	\N	\N	\N	yt	401
4013527	Xã Yên Hùng	40135	0	\N	\N	\N	\N	\N	yh	401
4013529	Xã Yên Thịnh	40135	0	\N	\N	\N	\N	\N	yt	401
4013531	Xã Yên Ninh	40135	0	\N	\N	\N	\N	\N	yn	401
4013533	Xã Yên Lạc	40135	0	\N	\N	\N	\N	\N	yl	401
4013535	Xã Định Tăng	40135	0	\N	\N	\N	\N	\N	dt	401
4013537	Xã Định Hòa	40135	0	\N	\N	\N	\N	\N	dh	401
4013539	Xã Định Thành	40135	0	\N	\N	\N	\N	\N	dt	401
4013541	Xã Định Công	40135	0	\N	\N	\N	\N	\N	dc	401
4013543	Xã Định Tân	40135	0	\N	\N	\N	\N	\N	dt	401
4013545	Xã Định Tiến	40135	0	\N	\N	\N	\N	\N	dt	401
4013547	Xã Định Long	40135	0	\N	\N	\N	\N	\N	dl	401
4013549	Xã Định Liên	40135	0	\N	\N	\N	\N	\N	dl	401
4013551	Xã Định Tường	40135	0	\N	\N	\N	\N	\N	dt	401
4013553	Xã Hưng Hùng	40135	0	\N	\N	\N	\N	\N	hh	401
4013555	Xã Định Hải	40135	0	\N	\N	\N	\N	\N	dh	401
4013557	Xã Định Bình	40135	0	\N	\N	\N	\N	\N	db	401
4013700	Không xác định	40137	0	\N	\N	\N	\N	\N	kx	401
4013701	Thị trấn Thọ Xuân	40137	0	\N	\N	\N	\N	\N	tx	401
4013703	Thị trấn Lam Sơn	40137	0	\N	\N	\N	\N	\N	ls	401
4013705	Thị trấn NT Sao Vàng	40137	0	\N	\N	\N	\N	\N	nsv	401
4013707	Xã Xuân Khánh	40137	0	\N	\N	\N	\N	\N	xk	401
4013709	Xã Thọ Nguyên	40137	0	\N	\N	\N	\N	\N	tn	401
4013711	Xã Xuân Thành	40137	0	\N	\N	\N	\N	\N	xt	401
4013713	Xã Hạnh Phúc	40137	0	\N	\N	\N	\N	\N	hp	401
4013715	Xã Bắc Lương	40137	0	\N	\N	\N	\N	\N	bl	401
4013717	Xã Nam Giang	40137	0	\N	\N	\N	\N	\N	ng	401
4013719	Xã Xuân Phong	40137	0	\N	\N	\N	\N	\N	xp	401
4013721	Xã Thọ Lộc	40137	0	\N	\N	\N	\N	\N	tl	401
4013723	Xã Xuân Trường	40137	0	\N	\N	\N	\N	\N	xt	401
4013725	Xã Xuân Hòa	40137	0	\N	\N	\N	\N	\N	xh	401
4013727	Xã Thọ Hải	40137	0	\N	\N	\N	\N	\N	th	401
4013729	Xã Tây Hồ	40137	0	\N	\N	\N	\N	\N	th	401
4013731	Xã Xuân Giang	40137	0	\N	\N	\N	\N	\N	xg	401
4013733	Xã Xuân Quang	40137	0	\N	\N	\N	\N	\N	xq	401
4013735	Xã Xuân Sơn	40137	0	\N	\N	\N	\N	\N	xs	401
4013737	Xã Xuân Hưng	40137	0	\N	\N	\N	\N	\N	xh	401
4013739	Xã Thọ Diên	40137	0	\N	\N	\N	\N	\N	td	401
4013741	Xã Thọ Lâm	40137	0	\N	\N	\N	\N	\N	tl	401
4013743	Xã Thọ Xương	40137	0	\N	\N	\N	\N	\N	tx	401
4013745	Xã Xuân Bái	40137	0	\N	\N	\N	\N	\N	xb	401
4013747	Xã Xuân Phú	40137	0	\N	\N	\N	\N	\N	xp	401
4013749	Xã Xuân Thắng	40137	0	\N	\N	\N	\N	\N	xt	401
4013751	Xã Xuân Lam	40137	0	\N	\N	\N	\N	\N	xl	401
4013753	Xã Xuân Thiên	40137	0	\N	\N	\N	\N	\N	xt	401
4013755	Xã Thọ Minh	40137	0	\N	\N	\N	\N	\N	tm	401
4013757	Xã Xuân Châu	40137	0	\N	\N	\N	\N	\N	xc	401
4013759	Xã Thọ Lập	40137	0	\N	\N	\N	\N	\N	tl	401
4013761	Xã Quảng Phú	40137	0	\N	\N	\N	\N	\N	qp	401
4013763	Xã Xuân Tiến	40137	0	\N	\N	\N	\N	\N	xt	401
4013765	Xã Phú Yên	40137	0	\N	\N	\N	\N	\N	py	401
4013767	Xã Xuân Yên	40137	0	\N	\N	\N	\N	\N	xy	401
4013769	Xã Xuân Lai	40137	0	\N	\N	\N	\N	\N	xl	401
4013771	Xã Xuân Lập	40137	0	\N	\N	\N	\N	\N	xl	401
4013773	Xã Thọ Thắng	40137	0	\N	\N	\N	\N	\N	tt	401
4013775	Xã Xuân Minh	40137	0	\N	\N	\N	\N	\N	xm	401
4013777	Xã Xuân Tân	40137	0	\N	\N	\N	\N	\N	xt	401
4013779	Xã Xuân Vinh	40137	0	\N	\N	\N	\N	\N	xv	401
4013781	Xã Thọ Trường	40137	0	\N	\N	\N	\N	\N	tt	401
4013900	Không xác định	40139	0	\N	\N	\N	\N	\N	kx	401
4013901	Thị trấn Hậu Lộc	40139	0	\N	\N	\N	\N	\N	hl	401
4013903	Xã Đồng Lộc	40139	0	\N	\N	\N	\N	\N	dl	401
4013905	Xã Đại Lộc	40139	0	\N	\N	\N	\N	\N	dl	401
4013907	Xã Triệu Lộc	40139	0	\N	\N	\N	\N	\N	tl	401
4013909	Xã Châu Lộc	40139	0	\N	\N	\N	\N	\N	cl	401
4013911	Xã Tiến Lộc	40139	0	\N	\N	\N	\N	\N	tl	401
4013913	Xã Lộc Sơn	40139	0	\N	\N	\N	\N	\N	ls	401
4013915	Xã Cầu Lộc	40139	0	\N	\N	\N	\N	\N	cl	401
4013917	Xã Thành Lộc	40139	0	\N	\N	\N	\N	\N	tl	401
4013919	Xã Tuy Lộc	40139	0	\N	\N	\N	\N	\N	tl	401
4013921	Xã Phong Lộc	40139	0	\N	\N	\N	\N	\N	pl	401
4013923	Xã Mỹ Lộc	40139	0	\N	\N	\N	\N	\N	ml	401
4013925	Xã Văn Lộc	40139	0	\N	\N	\N	\N	\N	vl	401
4013927	Xã Thuần Lộc	40139	0	\N	\N	\N	\N	\N	tl	401
4013929	Xã Lộc Tân	40139	0	\N	\N	\N	\N	\N	lt	401
4013931	Xã Xuân Lộc	40139	0	\N	\N	\N	\N	\N	xl	401
4013933	Xã Thịnh Lộc	40139	0	\N	\N	\N	\N	\N	tl	401
4013935	Xã Hoa Lộc	40139	0	\N	\N	\N	\N	\N	hl	401
4013937	Xã Liên Lộc	40139	0	\N	\N	\N	\N	\N	ll	401
4013939	Xã Quang Lộc	40139	0	\N	\N	\N	\N	\N	ql	401
4013941	Xã Phú Lộc	40139	0	\N	\N	\N	\N	\N	pl	401
4013943	Xã Hòa Lộc	40139	0	\N	\N	\N	\N	\N	hl	401
4013945	Xã Minh Lộc	40139	0	\N	\N	\N	\N	\N	ml	401
4013947	Xã Hưng Lộc	40139	0	\N	\N	\N	\N	\N	hl	401
4013949	Xã Hải Lộc	40139	0	\N	\N	\N	\N	\N	hl	401
4013951	Xã Đa Lộc	40139	0	\N	\N	\N	\N	\N	dl	401
4013953	Xã Ngư Lộc	40139	0	\N	\N	\N	\N	\N	nl	401
4014100	Không xác định	40141	0	\N	\N	\N	\N	\N	kx	401
4014101	Xã Thiệu Ngọc	40141	0	\N	\N	\N	\N	\N	tn	401
4014103	Xã Thiệu Vũ	40141	0	\N	\N	\N	\N	\N	tv	401
4014105	Xã Thiệu Phúc	40141	0	\N	\N	\N	\N	\N	tp	401
4014107	Xã Thiệu Tiến	40141	0	\N	\N	\N	\N	\N	tt	401
4014109	Xã Thiệu Công	40141	0	\N	\N	\N	\N	\N	tc	401
4014111	Xã Thiệu Phú	40141	0	\N	\N	\N	\N	\N	tp	401
4014113	Xã Thiệu Hưng	40141	0	\N	\N	\N	\N	\N	th	401
4014115	Xã Thiệu Long	40141	0	\N	\N	\N	\N	\N	tl	401
4014117	Xã Thiệu Giang	40141	0	\N	\N	\N	\N	\N	tg	401
4014119	Xã Thiệu Duy	40141	0	\N	\N	\N	\N	\N	td	401
4014121	Xã Thiệu Nguyên	40141	0	\N	\N	\N	\N	\N	tn	401
4014123	Xã Thiệu Hợp	40141	0	\N	\N	\N	\N	\N	th	401
4014125	Xã Thiệu Thịnh	40141	0	\N	\N	\N	\N	\N	tt	401
4014127	Xã Thiệu Quang	40141	0	\N	\N	\N	\N	\N	tq	401
4014129	Xã Thiệu Thành	40141	0	\N	\N	\N	\N	\N	tt	401
4014131	Xã Thiệu Toán	40141	0	\N	\N	\N	\N	\N	tt	401
4014133	Xã Thiệu Chính	40141	0	\N	\N	\N	\N	\N	tc	401
4014135	Xã Thiệu Hòa	40141	0	\N	\N	\N	\N	\N	th	401
4014137	Xã Thiệu Minh	40141	0	\N	\N	\N	\N	\N	tm	401
4014139	Xã Thiệu Tâm	40141	0	\N	\N	\N	\N	\N	tt	401
4014141	Xã Thiệu Viên	40141	0	\N	\N	\N	\N	\N	tv	401
4014143	Xã Thiệu Lý	40141	0	\N	\N	\N	\N	\N	tl	401
4014145	Xã Thiệu Vận	40141	0	\N	\N	\N	\N	\N	tv	401
4014147	Xã Thiệu Trung	40141	0	\N	\N	\N	\N	\N	tt	401
4014149	Xã Thiệu Đô	40141	0	\N	\N	\N	\N	\N	td	401
4014151	Xã Thiệu Châu	40141	0	\N	\N	\N	\N	\N	tc	401
4014153	Xã Thiệu Vân	40141	0	\N	\N	\N	\N	\N	tv	401
4014155	Xã Thiệu Giao	40141	0	\N	\N	\N	\N	\N	tg	401
4014157	Xã Thiệu Khánh	40141	0	\N	\N	\N	\N	\N	tk	401
4014159	Xã Thiệu Dương	40141	0	\N	\N	\N	\N	\N	td	401
4014161	Xã Thiệu Tân	40141	0	\N	\N	\N	\N	\N	tt	401
4014300	Không xác định	40143	0	\N	\N	\N	\N	\N	kx	401
4014301	Thị trấn Hoằng Hóa	40143	0	\N	\N	\N	\N	\N	hh	401
4014303	Xã Hoằng Giang	40143	0	\N	\N	\N	\N	\N	hg	401
4014305	Xã Hoằng Xuân	40143	0	\N	\N	\N	\N	\N	hx	401
4014307	Xã Hoằng Khánh	40143	0	\N	\N	\N	\N	\N	hk	401
4014309	Xã Hoằng Phượng	40143	0	\N	\N	\N	\N	\N	hp	401
4014311	Xã Hoằng Phú	40143	0	\N	\N	\N	\N	\N	hp	401
4014313	Xã Hoằng Quỳ	40143	0	\N	\N	\N	\N	\N	hq	401
4014315	Xã Hoằng Kim	40143	0	\N	\N	\N	\N	\N	hk	401
4014317	Xã Hoằng Trung	40143	0	\N	\N	\N	\N	\N	ht	401
4014319	Xã Hoằng Trinh	40143	0	\N	\N	\N	\N	\N	ht	401
4014321	Xã Hoằng Sơn	40143	0	\N	\N	\N	\N	\N	hs	401
4014323	Xã Hoằng Lương	40143	0	\N	\N	\N	\N	\N	hl	401
4014325	Xã Hoằng Xuyên	40143	0	\N	\N	\N	\N	\N	hx	401
4014327	Xã Hoằng Cát	40143	0	\N	\N	\N	\N	\N	hc	401
4014329	Xã Hoằng Khê	40143	0	\N	\N	\N	\N	\N	hk	401
4014331	Xã Hoằng Lý	40143	0	\N	\N	\N	\N	\N	hl	401
4014333	Xã Hoằng Quý	40143	0	\N	\N	\N	\N	\N	hq	401
4014335	Xã Hoằng Hợp	40143	0	\N	\N	\N	\N	\N	hh	401
4014337	Xã Hoằng Long	40143	0	\N	\N	\N	\N	\N	hl	401
4014339	Xã Hoằng Quang	40143	0	\N	\N	\N	\N	\N	hq	401
4014341	Xã Hoằng Minh	40143	0	\N	\N	\N	\N	\N	hm	401
4014343	Xã Hoằng Phúc	40143	0	\N	\N	\N	\N	\N	hp	401
4014345	Xã Hoằng Đức	40143	0	\N	\N	\N	\N	\N	hd	401
4014347	Xã Hoằng Hà	40143	0	\N	\N	\N	\N	\N	hh	401
4014349	Xã Hoằng Đạt	40143	0	\N	\N	\N	\N	\N	hd	401
4014351	Xã Hoằng Vinh	40143	0	\N	\N	\N	\N	\N	hv	401
4014353	Xã Hoằng Đạo	40143	0	\N	\N	\N	\N	\N	hd	401
4014355	Xã Hoằng Thắng	40143	0	\N	\N	\N	\N	\N	ht	401
4014357	Xã Hoằng Đồng	40143	0	\N	\N	\N	\N	\N	hd	401
4014359	Xã Hoằng Thái	40143	0	\N	\N	\N	\N	\N	ht	401
4014361	Xã Hoằng Thịnh	40143	0	\N	\N	\N	\N	\N	ht	401
4014363	Xã Hoằng Thành	40143	0	\N	\N	\N	\N	\N	ht	401
4014365	Xã Hoằng Lộc	40143	0	\N	\N	\N	\N	\N	hl	401
4014367	Xã Hoằng Trạch	40143	0	\N	\N	\N	\N	\N	ht	401
4014369	Xã Hoằng Đại	40143	0	\N	\N	\N	\N	\N	hd	401
4014371	Xã Hoằng Phong	40143	0	\N	\N	\N	\N	\N	hp	401
4014373	Xã Hoằng Lưu	40143	0	\N	\N	\N	\N	\N	hl	401
4014375	Xã Hoằng Châu	40143	0	\N	\N	\N	\N	\N	hc	401
4014377	Xã Hoằng Tân	40143	0	\N	\N	\N	\N	\N	ht	401
4014379	Xã Hoằng Yến	40143	0	\N	\N	\N	\N	\N	hy	401
4014381	Xã Hoằng Tiến	40143	0	\N	\N	\N	\N	\N	ht	401
4014383	Xã Hoằng Hải	40143	0	\N	\N	\N	\N	\N	hh	401
4014385	Xã Hoằng Ngọc	40143	0	\N	\N	\N	\N	\N	hn	401
4014387	Xã Hoằng Đông	40143	0	\N	\N	\N	\N	\N	hd	401
4014389	Xã Hoằng Thanh	40143	0	\N	\N	\N	\N	\N	ht	401
4014391	Xã Hoằng Phụ	40143	0	\N	\N	\N	\N	\N	hp	401
4014393	Xã Hoằng Trường	40143	0	\N	\N	\N	\N	\N	ht	401
4014395	Xã Hoằng Anh	40143	0	\N	\N	\N	\N	\N	ha	401
4014500	Không xác định	40145	0	\N	\N	\N	\N	\N	kx	401
4014501	Thị trấn Rừng Thông	40145	0	\N	\N	\N	\N	\N	rt	401
4014503	Xã Đông Hoàng	40145	0	\N	\N	\N	\N	\N	dh	401
4014505	Xã Đông Ninh	40145	0	\N	\N	\N	\N	\N	dn	401
4014507	Xã Đông Khê	40145	0	\N	\N	\N	\N	\N	dk	401
4014509	Xã Đông Hòa	40145	0	\N	\N	\N	\N	\N	dh	401
4014511	Xã Đông Yên	40145	0	\N	\N	\N	\N	\N	dy	401
4014513	Xã Đông Lĩnh	40145	0	\N	\N	\N	\N	\N	dl	401
4014515	Xã Đông Minh	40145	0	\N	\N	\N	\N	\N	dm	401
4014517	Xã Đông Thanh	40145	0	\N	\N	\N	\N	\N	dt	401
4014519	Xã Đông Tiến	40145	0	\N	\N	\N	\N	\N	dt	401
4014521	Xã Đông Anh	40145	0	\N	\N	\N	\N	\N	da	401
4014523	Xã Đông Xuân	40145	0	\N	\N	\N	\N	\N	dx	401
4014525	Xã Đông Thịnh	40145	0	\N	\N	\N	\N	\N	dt	401
4014527	Xã Đông Văn	40145	0	\N	\N	\N	\N	\N	dv	401
4014529	Xã Đông Phú	40145	0	\N	\N	\N	\N	\N	dp	401
4014531	Xã Đông Nam	40145	0	\N	\N	\N	\N	\N	dn	401
4014533	Xã Đông Quang	40145	0	\N	\N	\N	\N	\N	dq	401
4014535	Xã Đông Vinh	40145	0	\N	\N	\N	\N	\N	dv	401
4014537	Xã Đông Tân	40145	0	\N	\N	\N	\N	\N	dt	401
4014539	Xã Đông Hưng	40145	0	\N	\N	\N	\N	\N	dh	401
4014700	Không xác định	40147	0	\N	\N	\N	\N	\N	kx	401
4014701	Thị trấn Triệu Sơn	40147	0	\N	\N	\N	\N	\N	ts	401
4014703	Xã Thọ Sơn	40147	0	\N	\N	\N	\N	\N	ts	401
4014705	Xã Thọ Bình	40147	0	\N	\N	\N	\N	\N	tb	401
4014707	Xã Thọ Tiến	40147	0	\N	\N	\N	\N	\N	tt	401
4014709	Xã Hợp Lý	40147	0	\N	\N	\N	\N	\N	hl	401
4014711	Xã Hợp Tiến	40147	0	\N	\N	\N	\N	\N	ht	401
4014713	Xã Hợp Thành	40147	0	\N	\N	\N	\N	\N	ht	401
4014715	Xã Triệu Thành	40147	0	\N	\N	\N	\N	\N	tt	401
4014717	Xã Hợp Thắng	40147	0	\N	\N	\N	\N	\N	ht	401
4014719	Xã Minh Sơn	40147	0	\N	\N	\N	\N	\N	ms	401
4014721	Xã Minh Dân	40147	0	\N	\N	\N	\N	\N	md	401
4014723	Xã Minh Châu	40147	0	\N	\N	\N	\N	\N	mc	401
4014725	Xã Dân Lực	40147	0	\N	\N	\N	\N	\N	dl	401
4014727	Xã Dân Lý	40147	0	\N	\N	\N	\N	\N	dl	401
4014729	Xã Dân Quyền	40147	0	\N	\N	\N	\N	\N	dq	401
4014731	Xã An Nông	40147	0	\N	\N	\N	\N	\N	an	401
4014733	Xã Văn Sơn	40147	0	\N	\N	\N	\N	\N	vs	401
4014735	Xã Thái Hòa	40147	0	\N	\N	\N	\N	\N	th	401
4014737	Xã Tân Ninh	40147	0	\N	\N	\N	\N	\N	tn	401
4014739	Xã Đồng Lợi	40147	0	\N	\N	\N	\N	\N	dl	401
4014741	Xã Đồng Tiến	40147	0	\N	\N	\N	\N	\N	dt	401
4014743	Xã Đồng Thắng	40147	0	\N	\N	\N	\N	\N	dt	401
4014745	Xã Tiến Nông	40147	0	\N	\N	\N	\N	\N	tn	401
4014747	Xã Khuyến Nông	40147	0	\N	\N	\N	\N	\N	kn	401
4014749	Xã Xuân Thịnh	40147	0	\N	\N	\N	\N	\N	xt	401
4014751	Xã Xuân Lộc	40147	0	\N	\N	\N	\N	\N	xl	401
4014753	Xã Thọ Dân	40147	0	\N	\N	\N	\N	\N	td	401
4014755	Xã Xuân Thọ	40147	0	\N	\N	\N	\N	\N	xt	401
4014757	Xã Thọ Tân	40147	0	\N	\N	\N	\N	\N	tt	401
4014759	Xã Thọ Ngọc	40147	0	\N	\N	\N	\N	\N	tn	401
4014761	Xã Thọ Cường	40147	0	\N	\N	\N	\N	\N	tc	401
4014763	Xã Thọ Phú	40147	0	\N	\N	\N	\N	\N	tp	401
4014765	Xã Thọ Vực	40147	0	\N	\N	\N	\N	\N	tv	401
4014767	Xã Thọ Thế	40147	0	\N	\N	\N	\N	\N	tt	401
4014769	Xã Nông Trường	40147	0	\N	\N	\N	\N	\N	nt	401
4014771	Xã Bình Sơn	40147	0	\N	\N	\N	\N	\N	bs	401
4014900	Không xác định	40149	0	\N	\N	\N	\N	\N	kx	401
4014901	Thị trấn Quảng Xương	40149	0	\N	\N	\N	\N	\N	qx	401
4014903	Xã Quảng Thịnh	40149	0	\N	\N	\N	\N	\N	qt	401
4014905	Xã Quảng Tân	40149	0	\N	\N	\N	\N	\N	qt	401
4014907	Xã Quảng Trạch	40149	0	\N	\N	\N	\N	\N	qt	401
4014909	Xã Quảng Phong	40149	0	\N	\N	\N	\N	\N	qp	401
4014911	Xã Quảng Đức	40149	0	\N	\N	\N	\N	\N	qd	401
4014913	Xã Quảng Định	40149	0	\N	\N	\N	\N	\N	qd	401
4014915	Xã Quảng Đông	40149	0	\N	\N	\N	\N	\N	qd	401
4014917	Xã Quảng Nhân	40149	0	\N	\N	\N	\N	\N	qn	401
4014919	Xã Quảng Ninh	40149	0	\N	\N	\N	\N	\N	qn	401
4014921	Xã Quảng Bình	40149	0	\N	\N	\N	\N	\N	qb	401
4014923	Xã Quảng Hợp	40149	0	\N	\N	\N	\N	\N	qh	401
4014925	Xã Quảng Văn	40149	0	\N	\N	\N	\N	\N	qv	401
4014927	Xã Quảng Long	40149	0	\N	\N	\N	\N	\N	ql	401
4014929	Xã Quảng Yên	40149	0	\N	\N	\N	\N	\N	qy	401
4014931	Xã Quảng Hòa	40149	0	\N	\N	\N	\N	\N	qh	401
4014933	Xã Quảng Lĩnh	40149	0	\N	\N	\N	\N	\N	ql	401
4014935	Xã Quảng Khê	40149	0	\N	\N	\N	\N	\N	qk	401
4014937	Xã Quảng Trung	40149	0	\N	\N	\N	\N	\N	qt	401
4014939	Xã Quảng Chính	40149	0	\N	\N	\N	\N	\N	qc	401
4014941	Xã Quảng Ngọc	40149	0	\N	\N	\N	\N	\N	qn	401
4014943	Xã Quảng Trường	40149	0	\N	\N	\N	\N	\N	qt	401
4014945	Xã Quảng Phúc	40149	0	\N	\N	\N	\N	\N	qp	401
4014947	Xã Quảng Cát	40149	0	\N	\N	\N	\N	\N	qc	401
4014949	Xã Quảng Vọng	40149	0	\N	\N	\N	\N	\N	qv	401
4014951	Xã Quảng Minh	40149	0	\N	\N	\N	\N	\N	qm	401
4014953	Xã Quảng Hùng	40149	0	\N	\N	\N	\N	\N	qh	401
4014955	Xã Quảng Giao	40149	0	\N	\N	\N	\N	\N	qg	401
4014957	Xã Quảng Phú	40149	0	\N	\N	\N	\N	\N	qp	401
4014959	Xã Quảng Tâm	40149	0	\N	\N	\N	\N	\N	qt	401
4014961	Xã Quảng Thọ	40149	0	\N	\N	\N	\N	\N	qt	401
4014963	Xã Quảng Châu	40149	0	\N	\N	\N	\N	\N	qc	401
4014965	Xã Quảng Vinh	40149	0	\N	\N	\N	\N	\N	qv	401
4014967	Xã Quảng Đại	40149	0	\N	\N	\N	\N	\N	qd	401
4014969	Xã Quảng Hải	40149	0	\N	\N	\N	\N	\N	qh	401
4014971	Xã Quảng Lưu	40149	0	\N	\N	\N	\N	\N	ql	401
4014973	Xã Quảng Lộc	40149	0	\N	\N	\N	\N	\N	ql	401
4014975	Xã Quảng Lợi	40149	0	\N	\N	\N	\N	\N	ql	401
4014977	Xã Quảng Nham	40149	0	\N	\N	\N	\N	\N	qn	401
4014979	Xã Quảng Thạch	40149	0	\N	\N	\N	\N	\N	qt	401
4014981	Xã Quảng Thái	40149	0	\N	\N	\N	\N	\N	qt	401
4015100	Không xác định	40151	0	\N	\N	\N	\N	\N	kx	401
4015101	Thị trấn Nông Cống	40151	0	\N	\N	\N	\N	\N	nc	401
4015103	Thị trấn Yên Mỹ	40151	0	\N	\N	\N	\N	\N	ym	401
4015105	Xã Tân Phúc	40151	0	\N	\N	\N	\N	\N	tp	401
4015107	Xã Tân Thọ	40151	0	\N	\N	\N	\N	\N	tt	401
4015109	Xã Tân Khang	40151	0	\N	\N	\N	\N	\N	tk	401
4015111	Xã Trung Chính	40151	0	\N	\N	\N	\N	\N	tc	401
4015113	Xã Trung Thành	40151	0	\N	\N	\N	\N	\N	tt	401
4015115	Xã Trung ý	40151	0	\N	\N	\N	\N	\N	ty	401
4015117	Xã Hoàng Giang	40151	0	\N	\N	\N	\N	\N	hg	401
4015119	Xã Hoàng Sơn	40151	0	\N	\N	\N	\N	\N	hs	401
4015121	Xã Tế Nông	40151	0	\N	\N	\N	\N	\N	tn	401
4015123	Xã Tế Tân	40151	0	\N	\N	\N	\N	\N	tt	401
4015125	Xã Tế Lợi	40151	0	\N	\N	\N	\N	\N	tl	401
4015127	Xã Tế Thắng	40151	0	\N	\N	\N	\N	\N	tt	401
4015129	Xã Minh Khôi	40151	0	\N	\N	\N	\N	\N	mk	401
4015131	Xã Minh Nghĩa	40151	0	\N	\N	\N	\N	\N	mn	401
4015133	Xã Minh Thọ	40151	0	\N	\N	\N	\N	\N	mt	401
4015135	Xã Vạn Thắng	40151	0	\N	\N	\N	\N	\N	vt	401
4015137	Xã Vạn Hòa	40151	0	\N	\N	\N	\N	\N	vh	401
4015139	Xã Vạn Thiện	40151	0	\N	\N	\N	\N	\N	vt	401
4015141	Xã Thăng Long	40151	0	\N	\N	\N	\N	\N	tl	401
4015143	Xã Thăng Thọ	40151	0	\N	\N	\N	\N	\N	tt	401
4015145	Xã Thăng Bình	40151	0	\N	\N	\N	\N	\N	tb	401
4015147	Xã Công Liêm	40151	0	\N	\N	\N	\N	\N	cl	401
4015149	Xã Công Chính	40151	0	\N	\N	\N	\N	\N	cc	401
4015151	Xã Công Bình	40151	0	\N	\N	\N	\N	\N	cb	401
4015153	Xã Tượng Văn	40151	0	\N	\N	\N	\N	\N	tv	401
4015155	Xã Tượng Lĩnh	40151	0	\N	\N	\N	\N	\N	tl	401
4015157	Xã Tượng Sơn	40151	0	\N	\N	\N	\N	\N	ts	401
4015159	Xã Trường Sơn	40151	0	\N	\N	\N	\N	\N	ts	401
4015161	Xã Trường Giang	40151	0	\N	\N	\N	\N	\N	tg	401
4015163	Xã Trừơng Trung	40151	0	\N	\N	\N	\N	\N	tt	401
4015165	Xã Trường Minh	40151	0	\N	\N	\N	\N	\N	tm	401
4015300	Không xác định	40153	0	\N	\N	\N	\N	\N	kx	401
4015301	Thị trấn Tĩnh Gia	40153	0	\N	\N	\N	\N	\N	tg	401
4015303	Xã Thanh Sơn	40153	0	\N	\N	\N	\N	\N	ts	401
4015305	Xã Thanh Thủy	40153	0	\N	\N	\N	\N	\N	tt	401
4015307	Xã Triêu Dương	40153	0	\N	\N	\N	\N	\N	td	401
4015309	Xã Ngọc Lĩnh	40153	0	\N	\N	\N	\N	\N	nl	401
4015311	Xã Các Sơn	40153	0	\N	\N	\N	\N	\N	cs	401
4015313	Xã Anh Sơn	40153	0	\N	\N	\N	\N	\N	as	401
4015315	Xã Hùng Sơn	40153	0	\N	\N	\N	\N	\N	hs	401
4015317	Xã Định Hải	40153	0	\N	\N	\N	\N	\N	dh	401
4015319	Xã Hải Nhân	40153	0	\N	\N	\N	\N	\N	hn	401
4015321	Xã Nguyên Bình	40153	0	\N	\N	\N	\N	\N	nb	401
4015323	Xã Xuân Lâm	40153	0	\N	\N	\N	\N	\N	xl	401
4015325	Xã Phú Lâm	40153	0	\N	\N	\N	\N	\N	pl	401
4015327	Xã Phú Sơn	40153	0	\N	\N	\N	\N	\N	ps	401
4015329	Xã Trúc Lâm	40153	0	\N	\N	\N	\N	\N	tl	401
4015331	Xã Tùng Lâm	40153	0	\N	\N	\N	\N	\N	tl	401
4015333	Xã Tân Trường	40153	0	\N	\N	\N	\N	\N	tt	401
4015335	Xã Trường Lâm	40153	0	\N	\N	\N	\N	\N	tl	401
4015337	Xã Hải Châu	40153	0	\N	\N	\N	\N	\N	hc	401
4015339	Xã Hải Ninh	40153	0	\N	\N	\N	\N	\N	hn	401
4015341	Xã Hải An	40153	0	\N	\N	\N	\N	\N	ha	401
4015343	Xã Tân Dân	40153	0	\N	\N	\N	\N	\N	td	401
4015345	Xã Hải Lĩnh	40153	0	\N	\N	\N	\N	\N	hl	401
4015347	Xã Ninh Hải	40153	0	\N	\N	\N	\N	\N	nh	401
4015349	Xã Hải Hòa	40153	0	\N	\N	\N	\N	\N	hh	401
4015351	Xã Bình Minh	40153	0	\N	\N	\N	\N	\N	bm	401
4015353	Xã Hải Thanh	40153	0	\N	\N	\N	\N	\N	ht	401
4015355	Xã Hải Bình	40153	0	\N	\N	\N	\N	\N	hb	401
4015357	Xã Tĩnh Hải	40153	0	\N	\N	\N	\N	\N	th	401
4015359	Xã Hải Yến	40153	0	\N	\N	\N	\N	\N	hy	401
4015361	Xã Mai Lâm	40153	0	\N	\N	\N	\N	\N	ml	401
4015363	Xã Hải Thượng	40153	0	\N	\N	\N	\N	\N	ht	401
4015365	Xã Hải Hà	40153	0	\N	\N	\N	\N	\N	hh	401
4015367	Xã Nghi Sơn	40153	0	\N	\N	\N	\N	\N	ns	401
4030000	Không xác định	40300	0	\N	\N	\N	\N	\N	kx	403
4030100	Không xác định	40301	0	\N	\N	\N	\N	\N	kx	403
4030101	Phường Lê Mao	40301	0	\N	\N	\N	\N	\N	lm	403
4030105	Phường Đội Cung	40301	0	\N	\N	\N	\N	\N	dc	403
4030107	Phường Lê Lợi	40301	0	\N	\N	\N	\N	\N	ll	403
4030109	Phường Hưng Bình	40301	0	\N	\N	\N	\N	\N	hb	403
4030111	Phường Cửa Nam	40301	0	\N	\N	\N	\N	\N	cn	403
4030113	Phường Quang Trung	40301	0	\N	\N	\N	\N	\N	qt	403
4030115	Phường Trường Thi	40301	0	\N	\N	\N	\N	\N	tt	403
4030117	Phường Hồng Sơn	40301	0	\N	\N	\N	\N	\N	hs	403
4030119	Phường Trung Đô	40301	0	\N	\N	\N	\N	\N	td	403
4030121	Phường Bến Thủy	40301	0	\N	\N	\N	\N	\N	bt	403
4030123	Phường Đông Vĩnh	40301	0	\N	\N	\N	\N	\N	dv	403
4030125	Phường Hưng Dũng	40301	0	\N	\N	\N	\N	\N	hd	403
4030127	Xã Nghi Phú	40301	0	\N	\N	\N	\N	\N	np	403
4030129	Xã Hưng Đông	40301	0	\N	\N	\N	\N	\N	hd	403
4030131	Xã Hưng Lộc	40301	0	\N	\N	\N	\N	\N	hl	403
4030133	Xã Hưng Hòa	40301	0	\N	\N	\N	\N	\N	hh	403
4030135	Xã Vinh Tân	40301	0	\N	\N	\N	\N	\N	vt	403
4030300	Không xác định	40303	0	\N	\N	\N	\N	\N	kx	403
4030301	Phường Nghi Tân	40303	0	\N	\N	\N	\N	\N	nt	403
4030303	Phường Nghi Thuỷ	40303	0	\N	\N	\N	\N	\N	nt	403
4030305	Phường Thu Thuỷ	40303	0	\N	\N	\N	\N	\N	tt	403
4030307	Phường Nghi Hoà	40303	0	\N	\N	\N	\N	\N	nh	403
4030309	Phường Nghi Hải	40303	0	\N	\N	\N	\N	\N	nh	403
4030311	Xã Nghi Thu	40303	0	\N	\N	\N	\N	\N	nt	403
4030313	Xã Nghi Hương	40303	0	\N	\N	\N	\N	\N	nh	403
4030500	Không xác định	40305	0	\N	\N	\N	\N	\N	kx	403
4030501	Thị trấn Kim Sơn	40305	0	\N	\N	\N	\N	\N	ks	403
4030503	Xã Thông Thụ	40305	0	\N	\N	\N	\N	\N	tt	403
4030505	Xã Đồng Văn	40305	0	\N	\N	\N	\N	\N	dv	403
4030507	Xã Hạnh Dịch	40305	0	\N	\N	\N	\N	\N	hd	403
4030509	Xã Tiền Phong	40305	0	\N	\N	\N	\N	\N	tp	403
4030511	Xã Nậm Giải	40305	0	\N	\N	\N	\N	\N	ng	403
4030513	Xã Châu Kim	40305	0	\N	\N	\N	\N	\N	ck	403
4030515	Xã Tri Lễ	40305	0	\N	\N	\N	\N	\N	tl	403
4030517	Xã Châu Thôn	40305	0	\N	\N	\N	\N	\N	ct	403
4030519	Xã Mường Nọc	40305	0	\N	\N	\N	\N	\N	mn	403
4030521	Xã Nậm Nhoóng	40305	0	\N	\N	\N	\N	\N	nn	403
4030523	Xã Quang Phong	40305	0	\N	\N	\N	\N	\N	qp	403
4030525	Xã Căm Muộn	40305	0	\N	\N	\N	\N	\N	cm	403
4030700	Không xác định	40307	0	\N	\N	\N	\N	\N	kx	403
4030701	Thị trấn Quỳ Châu	40307	0	\N	\N	\N	\N	\N	qc	403
4030703	Xã Châu Bính	40307	0	\N	\N	\N	\N	\N	cb	403
4030705	Xã Châu Thuận	40307	0	\N	\N	\N	\N	\N	ct	403
4030707	Xã Châu Tiến	40307	0	\N	\N	\N	\N	\N	ct	403
4030709	Xã Châu Thắng	40307	0	\N	\N	\N	\N	\N	ct	403
4030711	Xã Châu Hạnh	40307	0	\N	\N	\N	\N	\N	ch	403
4030713	Xã Châu Hội	40307	0	\N	\N	\N	\N	\N	ch	403
4030715	Xã Châu Nga	40307	0	\N	\N	\N	\N	\N	cn	403
4030717	Xã Châu Phong	40307	0	\N	\N	\N	\N	\N	cp	403
6050309	Xã Ea Wy	60503	0	\N	\N	\N	\N	\N	ew	605
4030719	Xã Châu Bình	40307	0	\N	\N	\N	\N	\N	cb	403
4030721	Xã Diên Lãm	40307	0	\N	\N	\N	\N	\N	dl	403
4030723	Xã Châu Hoàn	40307	0	\N	\N	\N	\N	\N	ch	403
4030900	Không xác định	40309	0	\N	\N	\N	\N	\N	kx	403
4030901	Thị trấn Mường Xén	40309	0	\N	\N	\N	\N	\N	mx	403
4030903	Xã Keng Đu	40309	0	\N	\N	\N	\N	\N	kd	403
4030905	Xã Bắc Lý	40309	0	\N	\N	\N	\N	\N	bl	403
4030907	Xã Mỹ Lý	40309	0	\N	\N	\N	\N	\N	ml	403
4030909	Xã Đoọc Mạy	40309	0	\N	\N	\N	\N	\N	dm	403
4030911	Xã Na Loi	40309	0	\N	\N	\N	\N	\N	nl	403
4030913	Xã Huồi Tụ	40309	0	\N	\N	\N	\N	\N	ht	403
4030915	Xã Mường Lống	40309	0	\N	\N	\N	\N	\N	ml	403
4030917	Xã Nậm Cắn	40309	0	\N	\N	\N	\N	\N	nc	403
4030919	Xã Bảo Nam	40309	0	\N	\N	\N	\N	\N	bn	403
4030921	Xã Phà Đánh	40309	0	\N	\N	\N	\N	\N	pd	403
4030923	Xã Hữu Lập	40309	0	\N	\N	\N	\N	\N	hl	403
4030925	Xã Bảo Thắng	40309	0	\N	\N	\N	\N	\N	bt	403
4030927	Xã Tà Cạ	40309	0	\N	\N	\N	\N	\N	tc	403
4030929	Xã Mường Típ	40309	0	\N	\N	\N	\N	\N	mt	403
4030931	Xã Tây Sơn	40309	0	\N	\N	\N	\N	\N	ts	403
4030933	Xã Hữu Kiệm	40309	0	\N	\N	\N	\N	\N	hk	403
4030935	Xã Chiêu Lưu	40309	0	\N	\N	\N	\N	\N	cl	403
4030937	Xã Mường ải	40309	0	\N	\N	\N	\N	\N	ma	403
4030939	Xã Na Ngoi	40309	0	\N	\N	\N	\N	\N	nn	403
4030941	Xã Nậm Càn	40309	0	\N	\N	\N	\N	\N	nc	403
4031100	Không xác định	40311	0	\N	\N	\N	\N	\N	kx	403
4031101	Thị trấn Quỳ Hợp	40311	0	\N	\N	\N	\N	\N	qh	403
4031103	Xã Minh Hợp	40311	0	\N	\N	\N	\N	\N	mh	403
4031105	Xã Châu Hồng	40311	0	\N	\N	\N	\N	\N	ch	403
4031107	Xã Châu Tiến	40311	0	\N	\N	\N	\N	\N	ct	403
4031109	Xã Yên Hợp	40311	0	\N	\N	\N	\N	\N	yh	403
4031111	Xã Châu Thành	40311	0	\N	\N	\N	\N	\N	ct	403
4031113	Xã Liên Hợp	40311	0	\N	\N	\N	\N	\N	lh	403
4031115	Xã Châu Lộc	40311	0	\N	\N	\N	\N	\N	cl	403
4031117	Xã Tam Hợp	40311	0	\N	\N	\N	\N	\N	th	403
4031119	Xã Châu Cường	40311	0	\N	\N	\N	\N	\N	cc	403
4031121	Xã Châu Quang	40311	0	\N	\N	\N	\N	\N	cq	403
4031123	Xã Thọ Hợp	40311	0	\N	\N	\N	\N	\N	th	403
4031125	Xã Nghĩa Xuân	40311	0	\N	\N	\N	\N	\N	nx	403
4031127	Xã Châu Thái	40311	0	\N	\N	\N	\N	\N	ct	403
4031129	Xã Châu Đình	40311	0	\N	\N	\N	\N	\N	cd	403
4031131	Xã Châu Lý	40311	0	\N	\N	\N	\N	\N	cl	403
4031133	Xã Văn Lợi	40311	0	\N	\N	\N	\N	\N	vl	403
4031135	Xã Nam Sơn	40311	0	\N	\N	\N	\N	\N	ns	403
4031137	Xã Bắc Sơn	40311	0	\N	\N	\N	\N	\N	bs	403
4031139	Xã Hạ Sơn	40311	0	\N	\N	\N	\N	\N	hs	403
4031141	Xã Đồng Hợp	40311	0	\N	\N	\N	\N	\N	dh	403
4031300	Không xác định	40313	0	\N	\N	\N	\N	\N	kx	403
4031301	Thị trấn Thái Hòa	40313	0	\N	\N	\N	\N	\N	th	403
4031303	Xã Nghĩa Hồng	40313	0	\N	\N	\N	\N	\N	nh	403
4031305	Xã Nghĩa Sơn	40313	0	\N	\N	\N	\N	\N	ns	403
4031307	Xã Nghĩa Bình	40313	0	\N	\N	\N	\N	\N	nb	403
4031309	Xã Đông Hiếu	40313	0	\N	\N	\N	\N	\N	dh	403
4031311	Xã Tây Hiếu	40313	0	\N	\N	\N	\N	\N	th	403
4031313	Xã Nghĩa Hiếu	40313	0	\N	\N	\N	\N	\N	nh	403
4031315	Xã Nghĩa Tân	40313	0	\N	\N	\N	\N	\N	nt	403
4031317	Xã Nghĩa Mai	40313	0	\N	\N	\N	\N	\N	nm	403
4031319	Xã Nghĩa Yên	40313	0	\N	\N	\N	\N	\N	ny	403
4031321	Xã Nghĩa Lâm	40313	0	\N	\N	\N	\N	\N	nl	403
4031323	Xã Nghĩa Lạc	40313	0	\N	\N	\N	\N	\N	nl	403
4031325	Xã Nghĩa Hưng	40313	0	\N	\N	\N	\N	\N	nh	403
4031327	Xã Nghĩa Thịnh	40313	0	\N	\N	\N	\N	\N	nt	403
4031329	Xã Nghĩa Minh	40313	0	\N	\N	\N	\N	\N	nm	403
4031331	Xã Nghĩa Lợi	40313	0	\N	\N	\N	\N	\N	nl	403
4031333	Xã Nghĩa Thọ	40313	0	\N	\N	\N	\N	\N	nt	403
4031335	Xã Nghĩa Thắng	40313	0	\N	\N	\N	\N	\N	nt	403
4031337	Xã Nghĩa Quang	40313	0	\N	\N	\N	\N	\N	nq	403
4031339	Xã Nghĩa Trung	40313	0	\N	\N	\N	\N	\N	nt	403
4031341	Xã Nghĩa Hội	40313	0	\N	\N	\N	\N	\N	nh	403
4031343	Xã Nghĩa Liên	40313	0	\N	\N	\N	\N	\N	nl	403
4031345	Xã Nghĩa Tiến	40313	0	\N	\N	\N	\N	\N	nt	403
4031347	Xã Nghĩa Hòa	40313	0	\N	\N	\N	\N	\N	nh	403
4031349	Xã Nghĩa Mỹ	40313	0	\N	\N	\N	\N	\N	nm	403
4031351	Xã Nghĩa An	40313	0	\N	\N	\N	\N	\N	na	403
4031353	Xã Nghĩa Long	40313	0	\N	\N	\N	\N	\N	nl	403
4031355	Xã Nghĩa Thuận	40313	0	\N	\N	\N	\N	\N	nt	403
4031357	Xã Nghĩa Đức	40313	0	\N	\N	\N	\N	\N	nd	403
4031359	Xã Nghĩa Khánh	40313	0	\N	\N	\N	\N	\N	nk	403
4031361	Xã Nghĩa Lộc	40313	0	\N	\N	\N	\N	\N	nl	403
4031363	Xã Nghĩa Phú	40313	0	\N	\N	\N	\N	\N	np	403
4031500	Không xác định	40315	0	\N	\N	\N	\N	\N	kx	403
4031501	Thị trấn Hòa Bình	40315	0	\N	\N	\N	\N	\N	hb	403
4031503	Xã Tam Quang	40315	0	\N	\N	\N	\N	\N	tq	403
4031505	Xã Tam Đình	40315	0	\N	\N	\N	\N	\N	td	403
4031507	Xã Tam Thái	40315	0	\N	\N	\N	\N	\N	tt	403
4031509	Xã Tam Hợp	40315	0	\N	\N	\N	\N	\N	th	403
4031511	Xã Thạch Giám	40315	0	\N	\N	\N	\N	\N	tg	403
4031513	Xã Xá Lượng	40315	0	\N	\N	\N	\N	\N	xl	403
4031515	Xã Lưu Kiền	40315	0	\N	\N	\N	\N	\N	lk	403
4031517	Xã Lưỡng Minh	40315	0	\N	\N	\N	\N	\N	lm	403
4031519	Xã Kim Đa	40315	0	\N	\N	\N	\N	\N	kd	403
4031521	Xã Kim Tiến	40315	0	\N	\N	\N	\N	\N	kt	403
4031523	Xã Hữu Khuông	40315	0	\N	\N	\N	\N	\N	hk	403
4031525	Xã Hữu Dương	40315	0	\N	\N	\N	\N	\N	hd	403
4031527	Xã Luân Mai	40315	0	\N	\N	\N	\N	\N	lm	403
4031529	Xã Mai Sơn	40315	0	\N	\N	\N	\N	\N	ms	403
4031531	Xã Nhôn Mai	40315	0	\N	\N	\N	\N	\N	nm	403
4031533	Xã Yên Na	40315	0	\N	\N	\N	\N	\N	yn	403
4031535	Xã Yên Hòa	40315	0	\N	\N	\N	\N	\N	yh	403
4031537	Xã Yên Tĩnh	40315	0	\N	\N	\N	\N	\N	yt	403
4031539	Xã Yên Thắng	40315	0	\N	\N	\N	\N	\N	yt	403
4031541	Xã Nga My	40315	0	\N	\N	\N	\N	\N	nm	403
4031700	Không xác định	40317	0	\N	\N	\N	\N	\N	kx	403
4031701	Thị trấn Cầu Giát	40317	0	\N	\N	\N	\N	\N	cg	403
4031703	Xã Quỳnh Thắng	40317	0	\N	\N	\N	\N	\N	qt	403
4031705	Xã Quỳnh Vinh	40317	0	\N	\N	\N	\N	\N	qv	403
4031707	Xã Quỳnh Lộc	40317	0	\N	\N	\N	\N	\N	ql	403
4031709	Xã Quỳnh Trang	40317	0	\N	\N	\N	\N	\N	qt	403
4031711	Xã Quỳnh Thiện	40317	0	\N	\N	\N	\N	\N	qt	403
4031713	Xã Quỳnh Dị	40317	0	\N	\N	\N	\N	\N	qd	403
4031715	Xã Quỳnh Lập	40317	0	\N	\N	\N	\N	\N	ql	403
4031717	Xã Quỳnh Phương	40317	0	\N	\N	\N	\N	\N	qp	403
4031719	Xã Quỳnh Châu	40317	0	\N	\N	\N	\N	\N	qc	403
4031721	Xã Quỳnh Văn	40317	0	\N	\N	\N	\N	\N	qv	403
4031723	Xã Quỳnh Xuân	40317	0	\N	\N	\N	\N	\N	qx	403
4031725	Xã Quỳnh Tân	40317	0	\N	\N	\N	\N	\N	qt	403
4031727	Xã Quỳnh Tam	40317	0	\N	\N	\N	\N	\N	qt	403
4031729	Xã Quỳnh Hoa	40317	0	\N	\N	\N	\N	\N	qh	403
4031731	Xã Quỳnh Thạch	40317	0	\N	\N	\N	\N	\N	qt	403
4031733	Xã Quỳnh Mỹ	40317	0	\N	\N	\N	\N	\N	qm	403
4031735	Xã Quỳnh Hậu	40317	0	\N	\N	\N	\N	\N	qh	403
4031737	Xã Quỳnh Diện	40317	0	\N	\N	\N	\N	\N	qd	403
4031739	Xã Quỳnh Hưng	40317	0	\N	\N	\N	\N	\N	qh	403
4031741	Xã Quỳnh Thanh	40317	0	\N	\N	\N	\N	\N	qt	403
4031743	Xã Quỳnh Ngọc	40317	0	\N	\N	\N	\N	\N	qn	403
4031745	Xã Quỳnh Bảng	40317	0	\N	\N	\N	\N	\N	qb	403
4031747	Xã Quỳnh Lâm	40317	0	\N	\N	\N	\N	\N	ql	403
1060925	Xã Xuân Lâm	10609	0	\N	\N	\N	\N	\N	xl	106
4031749	Xã Quỳnh Hồng	40317	0	\N	\N	\N	\N	\N	qh	403
4031751	Xã Quỳnh Đôi	40317	0	\N	\N	\N	\N	\N	qd	403
4031753	Xã Quỳnh Lương	40317	0	\N	\N	\N	\N	\N	ql	403
4031755	Xã Quỳnh Giang	40317	0	\N	\N	\N	\N	\N	qg	403
4031757	Xã Quỳnh Bá	40317	0	\N	\N	\N	\N	\N	qb	403
4031759	Xã Quỳnh Yên	40317	0	\N	\N	\N	\N	\N	qy	403
4031761	Xã Quỳnh Minh	40317	0	\N	\N	\N	\N	\N	qm	403
4031763	Xã Tân Sơn	40317	0	\N	\N	\N	\N	\N	ts	403
4031765	Xã Ngọc Sơn	40317	0	\N	\N	\N	\N	\N	ns	403
4031767	Xã Mai Hùng	40317	0	\N	\N	\N	\N	\N	mh	403
4031769	Xã Quỳnh Liên	40317	0	\N	\N	\N	\N	\N	ql	403
4031771	Xã Quỳnh Nghĩa	40317	0	\N	\N	\N	\N	\N	qn	403
4031773	Xã Quỳnh Thọ	40317	0	\N	\N	\N	\N	\N	qt	403
4031775	Xã Tiến Thủy	40317	0	\N	\N	\N	\N	\N	tt	403
4031777	Xã An Hòa	40317	0	\N	\N	\N	\N	\N	ah	403
4031779	Xã Sơn Hải	40317	0	\N	\N	\N	\N	\N	sh	403
4031781	Xã Quỳnh Thuận	40317	0	\N	\N	\N	\N	\N	qt	403
4031783	Xã Quỳnh Long	40317	0	\N	\N	\N	\N	\N	ql	403
4031900	Không xác định	40319	0	\N	\N	\N	\N	\N	kx	403
4031901	Thị trấn Tân Kỳ	40319	0	\N	\N	\N	\N	\N	tk	403
4031903	Xã Tân Phú	40319	0	\N	\N	\N	\N	\N	tp	403
4031905	Xã Tân Hợp	40319	0	\N	\N	\N	\N	\N	th	403
4031907	Xã Tân Xuân	40319	0	\N	\N	\N	\N	\N	tx	403
4031909	Xã Nghĩa Bình	40319	0	\N	\N	\N	\N	\N	nb	403
4031911	Xã Giai Xuân	40319	0	\N	\N	\N	\N	\N	gx	403
4031913	Xã Nghĩa Thái	40319	0	\N	\N	\N	\N	\N	nt	403
4031915	Xã Nghĩa Đồng	40319	0	\N	\N	\N	\N	\N	nd	403
4031917	Xã Nghĩa Hợp	40319	0	\N	\N	\N	\N	\N	nh	403
4031919	Xã Đồng Văn	40319	0	\N	\N	\N	\N	\N	dv	403
4031921	Xã Nghĩa Phúc	40319	0	\N	\N	\N	\N	\N	np	403
4031923	Xã Nghĩa Hoàn	40319	0	\N	\N	\N	\N	\N	nh	403
4031925	Xã Nghĩa Dũng	40319	0	\N	\N	\N	\N	\N	nd	403
4031927	Xã Tiên Kỳ	40319	0	\N	\N	\N	\N	\N	tk	403
4031929	Xã Nghĩa Hành	40319	0	\N	\N	\N	\N	\N	nh	403
4031931	Xã Hương Sơn	40319	0	\N	\N	\N	\N	\N	hs	403
4031933	Xã Kỳ Sơn	40319	0	\N	\N	\N	\N	\N	ks	403
4031935	Xã Kỳ Tân	40319	0	\N	\N	\N	\N	\N	kt	403
4031937	Xã Phú Sơn	40319	0	\N	\N	\N	\N	\N	ps	403
4031939	Xã Tân Long	40319	0	\N	\N	\N	\N	\N	tl	403
4031941	Xã Tân An	40319	0	\N	\N	\N	\N	\N	ta	403
4032100	Không xác định	40321	0	\N	\N	\N	\N	\N	kx	403
4032101	Thị trấn Con Cuông	40321	0	\N	\N	\N	\N	\N	cc	403
4032103	Xã Bình Chuẩn	40321	0	\N	\N	\N	\N	\N	bc	403
4032105	Xã Lạng Khê	40321	0	\N	\N	\N	\N	\N	lk	403
4032107	Xã Cam Lâm	40321	0	\N	\N	\N	\N	\N	cl	403
4032109	Xã Đôn Phục	40321	0	\N	\N	\N	\N	\N	dp	403
4032111	Xã Mậu Đức	40321	0	\N	\N	\N	\N	\N	md	403
4032113	Xã Thạch Ngàn	40321	0	\N	\N	\N	\N	\N	tn	403
4032115	Xã Châu Khê	40321	0	\N	\N	\N	\N	\N	ck	403
4032117	Xã Chi Khê	40321	0	\N	\N	\N	\N	\N	ck	403
4032119	Xã Bồng Khê	40321	0	\N	\N	\N	\N	\N	bk	403
4032121	Xã Yên Khê	40321	0	\N	\N	\N	\N	\N	yk	403
4032123	Xã Lục Dạ	40321	0	\N	\N	\N	\N	\N	ld	403
4032125	Xã Môn Sơn	40321	0	\N	\N	\N	\N	\N	ms	403
4032300	Không xác định	40323	0	\N	\N	\N	\N	\N	kx	403
4032301	Thị trấn Yên Thành	40323	0	\N	\N	\N	\N	\N	yt	403
4032303	Xã Tân Thành	40323	0	\N	\N	\N	\N	\N	tt	403
4032305	Xã Đức Thành	40323	0	\N	\N	\N	\N	\N	dt	403
4032307	Xã Mã Thành	40323	0	\N	\N	\N	\N	\N	mt	403
4032309	Xã Đô Thành	40323	0	\N	\N	\N	\N	\N	dt	403
4032311	Xã Lăng Thành	40323	0	\N	\N	\N	\N	\N	lt	403
4032313	Xã Thọ Thành	40323	0	\N	\N	\N	\N	\N	tt	403
4032315	Xã Quang Thành	40323	0	\N	\N	\N	\N	\N	qt	403
4032317	Xã Đồng Thành	40323	0	\N	\N	\N	\N	\N	dt	403
4032319	Xã Hậu Thành	40323	0	\N	\N	\N	\N	\N	ht	403
4032321	Xã Phúc Thành	40323	0	\N	\N	\N	\N	\N	pt	403
4032323	Xã Phú Thành	40323	0	\N	\N	\N	\N	\N	pt	403
4032325	Xã Hồng Thành	40323	0	\N	\N	\N	\N	\N	ht	403
4032327	Xã Tăng Thành	40323	0	\N	\N	\N	\N	\N	tt	403
4032329	Xã Hoa Thành	40323	0	\N	\N	\N	\N	\N	ht	403
4032331	Xã Hợp Thành	40323	0	\N	\N	\N	\N	\N	ht	403
4032333	Xã Văn Thành	40323	0	\N	\N	\N	\N	\N	vt	403
4032335	Xã Thịnh Thành	40323	0	\N	\N	\N	\N	\N	tt	403
4032337	Xã Bắc Thành	40323	0	\N	\N	\N	\N	\N	bt	403
4032339	Xã Xuân Thành	40323	0	\N	\N	\N	\N	\N	xt	403
4032341	Xã Nhân Thành	40323	0	\N	\N	\N	\N	\N	nt	403
4032343	Xã Minh Thành	40323	0	\N	\N	\N	\N	\N	mt	403
4032345	Xã Lý Thành	40323	0	\N	\N	\N	\N	\N	lt	403
4032347	Xã Trung Thành	40323	0	\N	\N	\N	\N	\N	tt	403
4032349	Xã Công Thành	40323	0	\N	\N	\N	\N	\N	ct	403
4032351	Xã Nam Thành	40323	0	\N	\N	\N	\N	\N	nt	403
4032353	Xã Vĩnh Thành	40323	0	\N	\N	\N	\N	\N	vt	403
4032355	Xã Long Thành	40323	0	\N	\N	\N	\N	\N	lt	403
4032357	Xã Liên Thành	40323	0	\N	\N	\N	\N	\N	lt	403
4032359	Xã Viên Thành	40323	0	\N	\N	\N	\N	\N	vt	403
4032361	Xã Khánh Thành	40323	0	\N	\N	\N	\N	\N	kt	403
4032363	Xã Bảo Thành	40323	0	\N	\N	\N	\N	\N	bt	403
4032365	Xã Mỹ Thành	40323	0	\N	\N	\N	\N	\N	mt	403
4032367	Xã Sơn Thành	40323	0	\N	\N	\N	\N	\N	st	403
4032500	Không xác định	40325	0	\N	\N	\N	\N	\N	kx	403
4032501	Thị trấn Diễn Châu	40325	0	\N	\N	\N	\N	\N	dc	403
4032503	Xã Diễn Lâm	40325	0	\N	\N	\N	\N	\N	dl	403
4032505	Xã Diễn Đoài	40325	0	\N	\N	\N	\N	\N	dd	403
4032507	Xã Diễn Trường	40325	0	\N	\N	\N	\N	\N	dt	403
4032509	Xã Diễn Hùng	40325	0	\N	\N	\N	\N	\N	dh	403
4032511	Xã Diễn Yên	40325	0	\N	\N	\N	\N	\N	dy	403
4032513	Xã Diễn Hoàng	40325	0	\N	\N	\N	\N	\N	dh	403
4032515	Xã Diễn Mỹ	40325	0	\N	\N	\N	\N	\N	dm	403
4032517	Xã Diễn Phong	40325	0	\N	\N	\N	\N	\N	dp	403
4032519	Xã Diễn Tháp	40325	0	\N	\N	\N	\N	\N	dt	403
4032521	Xã Diễn Hồng	40325	0	\N	\N	\N	\N	\N	dh	403
4032523	Xã Diễn Hải	40325	0	\N	\N	\N	\N	\N	dh	403
4032525	Xã Diễn Liên	40325	0	\N	\N	\N	\N	\N	dl	403
4032527	Xã Diễn Vạn	40325	0	\N	\N	\N	\N	\N	dv	403
4032529	Xã Diễn Kim	40325	0	\N	\N	\N	\N	\N	dk	403
4032531	Xã Diễn Thái	40325	0	\N	\N	\N	\N	\N	dt	403
4032533	Xã Diễn Xuân	40325	0	\N	\N	\N	\N	\N	dx	403
4032535	Xã Diễn Kỷ	40325	0	\N	\N	\N	\N	\N	dk	403
4032537	Xã Diễn Bích	40325	0	\N	\N	\N	\N	\N	db	403
4032539	Xã Diễn Đồng	40325	0	\N	\N	\N	\N	\N	dd	403
4032541	Xã Diễn Hạnh	40325	0	\N	\N	\N	\N	\N	dh	403
4032543	Xã Diễn Hoa	40325	0	\N	\N	\N	\N	\N	dh	403
4032545	Xã Diễn Ngọc	40325	0	\N	\N	\N	\N	\N	dn	403
4032547	Xã Diễn Nguyên	40325	0	\N	\N	\N	\N	\N	dn	403
4032549	Xã Diễn Quảng	40325	0	\N	\N	\N	\N	\N	dq	403
4032551	Xã Diễn Thành	40325	0	\N	\N	\N	\N	\N	dt	403
4032553	Xã Diễn Minh	40325	0	\N	\N	\N	\N	\N	dm	403
4032555	Xã Diễn Phúc	40325	0	\N	\N	\N	\N	\N	dp	403
4032557	Xã Diễn Tân	40325	0	\N	\N	\N	\N	\N	dt	403
4032559	Xã Diễn Bình	40325	0	\N	\N	\N	\N	\N	db	403
4032561	Xã Diễn Cát	40325	0	\N	\N	\N	\N	\N	dc	403
4032563	Xã Diễn Thắng	40325	0	\N	\N	\N	\N	\N	dt	403
4032565	Xã Diễn Thịnh	40325	0	\N	\N	\N	\N	\N	dt	403
4032567	Xã Diễn Phú	40325	0	\N	\N	\N	\N	\N	dp	403
4032569	Xã Diễn Thọ	40325	0	\N	\N	\N	\N	\N	dt	403
4032571	Xã Diễn Lợi	40325	0	\N	\N	\N	\N	\N	dl	403
4032573	Xã Diễn An	40325	0	\N	\N	\N	\N	\N	da	403
4032575	Xã Diễn Trung	40325	0	\N	\N	\N	\N	\N	dt	403
4032577	Xã Diễn Lộc	40325	0	\N	\N	\N	\N	\N	dl	403
4032700	Không xác định	40327	0	\N	\N	\N	\N	\N	kx	403
4032701	Thị trấn Anh Sơn	40327	0	\N	\N	\N	\N	\N	as	403
4032703	Xã Thọ Sơn	40327	0	\N	\N	\N	\N	\N	ts	403
4032705	Xã Tam Sơn	40327	0	\N	\N	\N	\N	\N	ts	403
4032707	Xã Thành Sơn	40327	0	\N	\N	\N	\N	\N	ts	403
4032709	Xã Bình Sơn	40327	0	\N	\N	\N	\N	\N	bs	403
4032711	Xã Đỉnh Sơn	40327	0	\N	\N	\N	\N	\N	ds	403
4032713	Xã Cẩm Sơn	40327	0	\N	\N	\N	\N	\N	cs	403
4032715	Xã Tường Sơn	40327	0	\N	\N	\N	\N	\N	ts	403
4032717	Xã Hùng Sơn	40327	0	\N	\N	\N	\N	\N	hs	403
4032719	Xã Đức Sơn	40327	0	\N	\N	\N	\N	\N	ds	403
4032721	Xã Hội Sơn	40327	0	\N	\N	\N	\N	\N	hs	403
4032723	Xã Thạch Sơn	40327	0	\N	\N	\N	\N	\N	ts	403
4032725	Xã Vĩnh Sơn	40327	0	\N	\N	\N	\N	\N	vs	403
4032727	Xã Khai Sơn	40327	0	\N	\N	\N	\N	\N	ks	403
4032729	Xã Lạng Sơn	40327	0	\N	\N	\N	\N	\N	ls	403
4032731	Xã Tào Sơn	40327	0	\N	\N	\N	\N	\N	ts	403
4032733	Xã Phúc Sơn	40327	0	\N	\N	\N	\N	\N	ps	403
4032735	Xã Long Sơn	40327	0	\N	\N	\N	\N	\N	ls	403
4032737	Xã Cao Sơn	40327	0	\N	\N	\N	\N	\N	cs	403
4032739	Xã Lĩnh Sơn	40327	0	\N	\N	\N	\N	\N	ls	403
4032900	Không xác định	40329	0	\N	\N	\N	\N	\N	kx	403
4032901	Thị trấn Đô Lương	40329	0	\N	\N	\N	\N	\N	dl	403
4032903	Xã Giang Sơn	40329	0	\N	\N	\N	\N	\N	gs	403
4032905	Xã Lam Sơn	40329	0	\N	\N	\N	\N	\N	ls	403
4032907	Xã Bồi Sơn	40329	0	\N	\N	\N	\N	\N	bs	403
4032909	Xã Hồng Sơn	40329	0	\N	\N	\N	\N	\N	hs	403
4032911	Xã Bài Sơn	40329	0	\N	\N	\N	\N	\N	bs	403
4032913	Xã Ngọc Sơn	40329	0	\N	\N	\N	\N	\N	ns	403
4032915	Xã Bắc Sơn	40329	0	\N	\N	\N	\N	\N	bs	403
4032917	Xã Tràng Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032919	Xã Thượng Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032921	Xã Hòa Sơn	40329	0	\N	\N	\N	\N	\N	hs	403
4032923	Xã Đặng Sơn	40329	0	\N	\N	\N	\N	\N	ds	403
4032925	Xã Đông Sơn	40329	0	\N	\N	\N	\N	\N	ds	403
4032927	Xã Nam Sơn	40329	0	\N	\N	\N	\N	\N	ns	403
4032929	Xã Lưu Sơn	40329	0	\N	\N	\N	\N	\N	ls	403
4032931	Xã Yên Sơn	40329	0	\N	\N	\N	\N	\N	ys	403
4032933	Xã Văn Sơn	40329	0	\N	\N	\N	\N	\N	vs	403
4032935	Xã Đà Sơn	40329	0	\N	\N	\N	\N	\N	ds	403
4032937	Xã Lạc Sơn	40329	0	\N	\N	\N	\N	\N	ls	403
4032939	Xã Tân Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032941	Xã Thái Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032943	Xã Quang Sơn	40329	0	\N	\N	\N	\N	\N	qs	403
4032945	Xã Thịnh Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032947	Xã Trung Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032949	Xã Xuân Sơn	40329	0	\N	\N	\N	\N	\N	xs	403
4032951	Xã Minh Sơn	40329	0	\N	\N	\N	\N	\N	ms	403
4032953	Xã Thuận Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032955	Xã Nhân Sơn	40329	0	\N	\N	\N	\N	\N	ns	403
4032957	Xã Hiến Sơn	40329	0	\N	\N	\N	\N	\N	hs	403
4032959	Xã Mỹ Sơn	40329	0	\N	\N	\N	\N	\N	ms	403
4032961	Xã Trù Sơn	40329	0	\N	\N	\N	\N	\N	ts	403
4032963	Xã Đại Sơn	40329	0	\N	\N	\N	\N	\N	ds	403
4033100	Không xác định	40331	0	\N	\N	\N	\N	\N	kx	403
4033101	Thị trấn Thanh Chương	40331	0	\N	\N	\N	\N	\N	tc	403
4033103	Xã Cát Văn	40331	0	\N	\N	\N	\N	\N	cv	403
4033105	Xã Hạnh Lâm	40331	0	\N	\N	\N	\N	\N	hl	403
4033107	Xã Thanh Nho	40331	0	\N	\N	\N	\N	\N	tn	403
4033109	Xã Thanh Hòa	40331	0	\N	\N	\N	\N	\N	th	403
4033111	Xã Phong Thịnh	40331	0	\N	\N	\N	\N	\N	pt	403
4033113	Xã Thanh Mỹ	40331	0	\N	\N	\N	\N	\N	tm	403
4033115	Xã Thanh Liên	40331	0	\N	\N	\N	\N	\N	tl	403
8090101	Phường 1	80901	0	\N	\N	\N	\N	\N	1	809
4033117	Xã Thanh Tiên	40331	0	\N	\N	\N	\N	\N	tt	403
4033119	Xã Thanh Hưng	40331	0	\N	\N	\N	\N	\N	th	403
4033121	Xã Thanh Phong	40331	0	\N	\N	\N	\N	\N	tp	403
4033123	Xã Thanh Văn	40331	0	\N	\N	\N	\N	\N	tv	403
4033125	Xã Thanh Tường	40331	0	\N	\N	\N	\N	\N	tt	403
4033127	Xã Thanh Hương	40331	0	\N	\N	\N	\N	\N	th	403
4033129	Xã Thanh Lĩnh	40331	0	\N	\N	\N	\N	\N	tl	403
4033131	Xã Thanh Đồng	40331	0	\N	\N	\N	\N	\N	td	403
4033133	Xã Thanh Thịnh	40331	0	\N	\N	\N	\N	\N	tt	403
4033135	Xã Đồng Văn	40331	0	\N	\N	\N	\N	\N	dv	403
4033137	Xã Thanh Ngọc	40331	0	\N	\N	\N	\N	\N	tn	403
4033139	Xã Thanh An	40331	0	\N	\N	\N	\N	\N	ta	403
4033141	Xã Thanh Chi	40331	0	\N	\N	\N	\N	\N	tc	403
4033143	Xã Ngọc Sơn	40331	0	\N	\N	\N	\N	\N	ns	403
4033145	Xã Thanh Khê	40331	0	\N	\N	\N	\N	\N	tk	403
4033147	Xã Xuân Tường	40331	0	\N	\N	\N	\N	\N	xt	403
4033149	Xã Võ Liệt	40331	0	\N	\N	\N	\N	\N	vl	403
4033151	Xã Thanh Long	40331	0	\N	\N	\N	\N	\N	tl	403
4033153	Xã Thanh Thủy	40331	0	\N	\N	\N	\N	\N	tt	403
4033155	Xã Thanh Dương	40331	0	\N	\N	\N	\N	\N	td	403
4033157	Xã Thanh Hà	40331	0	\N	\N	\N	\N	\N	th	403
4033159	Xã Thanh Lương	40331	0	\N	\N	\N	\N	\N	tl	403
4033161	Xã Thanh Khai	40331	0	\N	\N	\N	\N	\N	tk	403
4033163	Xã Thanh Yên	40331	0	\N	\N	\N	\N	\N	ty	403
4033165	Xã Thanh Tùng	40331	0	\N	\N	\N	\N	\N	tt	403
4033167	Xã Thanh Giang	40331	0	\N	\N	\N	\N	\N	tg	403
4033169	Xã Thanh Mai	40331	0	\N	\N	\N	\N	\N	tm	403
4033171	Xã Thanh Xuân	40331	0	\N	\N	\N	\N	\N	tx	403
4033173	Xã Thanh Lâm	40331	0	\N	\N	\N	\N	\N	tl	403
4033300	Không xác định	40333	0	\N	\N	\N	\N	\N	kx	403
4033301	Thị trấn Quán Hành	40333	0	\N	\N	\N	\N	\N	qh	403
4033303	Xã Nghi Văn	40333	0	\N	\N	\N	\N	\N	nv	403
4033305	Xã Nghi Yên	40333	0	\N	\N	\N	\N	\N	ny	403
4033307	Xã Nghi Kiều	40333	0	\N	\N	\N	\N	\N	nk	403
4033309	Xã Nghi Lâm	40333	0	\N	\N	\N	\N	\N	nl	403
4033311	Xã Nghi Đồng	40333	0	\N	\N	\N	\N	\N	nd	403
4033313	Xã Nghi Hưng	40333	0	\N	\N	\N	\N	\N	nh	403
4033315	Xã Nghi Tiến	40333	0	\N	\N	\N	\N	\N	nt	403
4033317	Xã Nghi Mỹ	40333	0	\N	\N	\N	\N	\N	nm	403
4033319	Xã Nghi Phương	40333	0	\N	\N	\N	\N	\N	np	403
4033321	Xã Nghi Thuận	40333	0	\N	\N	\N	\N	\N	nt	403
4033323	Xã Nghi Quang	40333	0	\N	\N	\N	\N	\N	nq	403
4033325	Xã Nghi Thiết	40333	0	\N	\N	\N	\N	\N	nt	403
4033327	Xã Nghi Xá	40333	0	\N	\N	\N	\N	\N	nx	403
4033329	Xã Nghi Hợp	40333	0	\N	\N	\N	\N	\N	nh	403
4033331	Xã Nghi Khánh	40333	0	\N	\N	\N	\N	\N	nk	403
4033333	Xã Nghi Long	40333	0	\N	\N	\N	\N	\N	nl	403
4033335	Xã Nghi Thịnh	40333	0	\N	\N	\N	\N	\N	nt	403
4033337	Xã Nghi Công	40333	0	\N	\N	\N	\N	\N	nc	403
4033339	Xã Nghi Diên	40333	0	\N	\N	\N	\N	\N	nd	403
4033341	Xã Nghi Trung	40333	0	\N	\N	\N	\N	\N	nt	403
4033343	Xã Nghi Trường	40333	0	\N	\N	\N	\N	\N	nt	403
4033345	Xã Nghi Thạch	40333	0	\N	\N	\N	\N	\N	nt	403
4033347	Xã Nghi Vạn	40333	0	\N	\N	\N	\N	\N	nv	403
4033349	Xã Nghi Liên	40333	0	\N	\N	\N	\N	\N	nl	403
4033351	Xã Nghi Ân	40333	0	\N	\N	\N	\N	\N	na	403
4033353	Xã Nghi Phong	40333	0	\N	\N	\N	\N	\N	np	403
4033355	Xã Nghi Xuân	40333	0	\N	\N	\N	\N	\N	nx	403
4033357	Xã Nghi Hoa	40333	0	\N	\N	\N	\N	\N	nh	403
4033359	Xã Nghi Kim	40333	0	\N	\N	\N	\N	\N	nk	403
4033361	Xã Nghi Đức	40333	0	\N	\N	\N	\N	\N	nd	403
4033363	Xã Phúc Thọ	40333	0	\N	\N	\N	\N	\N	pt	403
4033365	Xã Nghi Thái	40333	0	\N	\N	\N	\N	\N	nt	403
4033500	Không xác định	40335	0	\N	\N	\N	\N	\N	kx	403
4033501	Thị trấn Nam Đàn	40335	0	\N	\N	\N	\N	\N	nd	403
4033503	Xã Nam Hưng	40335	0	\N	\N	\N	\N	\N	nh	403
4033505	Xã Nam Nghĩa	40335	0	\N	\N	\N	\N	\N	nn	403
4033507	Xã Nam Thái	40335	0	\N	\N	\N	\N	\N	nt	403
4033509	Xã Nam Thanh	40335	0	\N	\N	\N	\N	\N	nt	403
4033511	Xã Nam Anh	40335	0	\N	\N	\N	\N	\N	na	403
4033513	Xã Vân Diên	40335	0	\N	\N	\N	\N	\N	vd	403
4033515	Xã Nam Xuân	40335	0	\N	\N	\N	\N	\N	nx	403
4033517	Xã Xuân Hòa	40335	0	\N	\N	\N	\N	\N	xh	403
4033519	Xã Nam Lĩnh	40335	0	\N	\N	\N	\N	\N	nl	403
4033521	Xã Nam Giang	40335	0	\N	\N	\N	\N	\N	ng	403
4033523	Xã Nam Thượng	40335	0	\N	\N	\N	\N	\N	nt	403
4033525	Xã Nam Tân	40335	0	\N	\N	\N	\N	\N	nt	403
4033527	Xã Nam Lộc	40335	0	\N	\N	\N	\N	\N	nl	403
4033529	Xã Hồng Long	40335	0	\N	\N	\N	\N	\N	hl	403
4033531	Xã Hùng Tiến	40335	0	\N	\N	\N	\N	\N	ht	403
4033533	Xã Kim Liên	40335	0	\N	\N	\N	\N	\N	kl	403
4033535	Xã Xuân Lâm	40335	0	\N	\N	\N	\N	\N	xl	403
4033537	Xã Nam Cát	40335	0	\N	\N	\N	\N	\N	nc	403
4033539	Xã Khánh Sơn	40335	0	\N	\N	\N	\N	\N	ks	403
4033541	Xã Nam Trung	40335	0	\N	\N	\N	\N	\N	nt	403
4033543	Xã Nam Phúc	40335	0	\N	\N	\N	\N	\N	np	403
4033545	Xã Nam Cường	40335	0	\N	\N	\N	\N	\N	nc	403
4033547	Xã Nam Kim	40335	0	\N	\N	\N	\N	\N	nk	403
4033700	Không xác định	40337	0	\N	\N	\N	\N	\N	kx	403
4033701	Xã Hưng Trung	40337	0	\N	\N	\N	\N	\N	ht	403
4033703	Xã Hưng Yên	40337	0	\N	\N	\N	\N	\N	hy	403
4033705	Xã Hưng Tây	40337	0	\N	\N	\N	\N	\N	ht	403
4033707	Xã Hưng Đạo	40337	0	\N	\N	\N	\N	\N	hd	403
4033709	Thị trấn Hưng Nguyên	40337	0	\N	\N	\N	\N	\N	hn	403
4033711	Xã Hưng Chính	40337	0	\N	\N	\N	\N	\N	hc	403
4033713	Xã Hưng Thông	40337	0	\N	\N	\N	\N	\N	ht	403
4033715	Xã Hưng Tân	40337	0	\N	\N	\N	\N	\N	ht	403
4033717	Xã Hưng Mỹ	40337	0	\N	\N	\N	\N	\N	hm	403
4033719	Xã Hưng Thịnh	40337	0	\N	\N	\N	\N	\N	ht	403
4033721	Xã Hưng Lĩnh	40337	0	\N	\N	\N	\N	\N	hl	403
4033723	Xã Hưng Long	40337	0	\N	\N	\N	\N	\N	hl	403
4033725	Xã Hưng Xá	40337	0	\N	\N	\N	\N	\N	hx	403
4033727	Xã Hưng Tiến	40337	0	\N	\N	\N	\N	\N	ht	403
4033729	Xã Hưng Thắng	40337	0	\N	\N	\N	\N	\N	ht	403
4033731	Xã Hưng Phú	40337	0	\N	\N	\N	\N	\N	hp	403
4033733	Xã Hưng Lợi	40337	0	\N	\N	\N	\N	\N	hl	403
4033735	Xã Hưng Xuân	40337	0	\N	\N	\N	\N	\N	hx	403
4033737	Xã Hưng Châu	40337	0	\N	\N	\N	\N	\N	hc	403
4033739	Xã Hưng Lam	40337	0	\N	\N	\N	\N	\N	hl	403
4033741	Xã Hưng Phúc	40337	0	\N	\N	\N	\N	\N	hp	403
4033743	Xã Hưng Khánh	40337	0	\N	\N	\N	\N	\N	hk	403
4033745	Xã Hưng Nhân	40337	0	\N	\N	\N	\N	\N	hn	403
4050000	Không xác định	40500	0	\N	\N	\N	\N	\N	kx	405
4050100	Không xác định	40501	0	\N	\N	\N	\N	\N	kx	405
4050101	Phường Bắc Hà	40501	0	\N	\N	\N	\N	\N	bh	405
4050103	Phường Nam Hà	40501	0	\N	\N	\N	\N	\N	nh	405
4050105	Phường Trần Phú	40501	0	\N	\N	\N	\N	\N	tp	405
4050107	Phường Tân Giang	40501	0	\N	\N	\N	\N	\N	tg	405
4050109	Xã Thạch Linh	40501	0	\N	\N	\N	\N	\N	tl	405
4050111	Xã Thạch Trung	40501	0	\N	\N	\N	\N	\N	tt	405
4050113	Xã Thạch Phú	40501	0	\N	\N	\N	\N	\N	tp	405
4050115	Xã Thạch Quí	40501	0	\N	\N	\N	\N	\N	tq	405
4050117	Xã Đại Nài	40501	0	\N	\N	\N	\N	\N	dn	405
4050119	Xã Thạch Yên	40501	0	\N	\N	\N	\N	\N	ty	405
4050300	Không xác định	40503	0	\N	\N	\N	\N	\N	kx	405
4050301	Phường Bắc Hồng	40503	0	\N	\N	\N	\N	\N	bh	405
4050303	Phường Nam Hồng	40503	0	\N	\N	\N	\N	\N	nh	405
4050305	Xã Trung Lương	40503	0	\N	\N	\N	\N	\N	tl	405
4050307	Xã Đức Thuận	40503	0	\N	\N	\N	\N	\N	dt	405
4050309	Xã Thuận Lộc	40503	0	\N	\N	\N	\N	\N	tl	405
4050311	Xã Đậu Liêu	40503	0	\N	\N	\N	\N	\N	dl	405
4050500	Không xác định	40505	0	\N	\N	\N	\N	\N	kx	405
4050501	Thị trấn Nghi Xuân	40505	0	\N	\N	\N	\N	\N	nx	405
4050503	Thị trấn Xuân An	40505	0	\N	\N	\N	\N	\N	xa	405
4050505	Xã Xuân Hội	40505	0	\N	\N	\N	\N	\N	xh	405
4050507	Xã Xuân Trường	40505	0	\N	\N	\N	\N	\N	xt	405
4050509	Xã Xuân Đan	40505	0	\N	\N	\N	\N	\N	xd	405
4050511	Xã Xuân Phổ	40505	0	\N	\N	\N	\N	\N	xp	405
4050513	Xã Xuân Hải	40505	0	\N	\N	\N	\N	\N	xh	405
4050515	Xã Xuân Yên	40505	0	\N	\N	\N	\N	\N	xy	405
4050517	Xã Tiên Điền	40505	0	\N	\N	\N	\N	\N	td	405
4050519	Xã Xuân Giang	40505	0	\N	\N	\N	\N	\N	xg	405
4050521	Xã Xuân Mỹ	40505	0	\N	\N	\N	\N	\N	xm	405
4050523	Xã Xuân Thành	40505	0	\N	\N	\N	\N	\N	xt	405
4050525	Xã Xuân Hồng	40505	0	\N	\N	\N	\N	\N	xh	405
4050527	Xã Xuân Viên	40505	0	\N	\N	\N	\N	\N	xv	405
4050529	Xã Xuân Lam	40505	0	\N	\N	\N	\N	\N	xl	405
4050531	Xã Xuân Lĩnh	40505	0	\N	\N	\N	\N	\N	xl	405
4050533	Xã Xuân Liên	40505	0	\N	\N	\N	\N	\N	xl	405
4050535	Xã Cỗ Đạm	40505	0	\N	\N	\N	\N	\N	cd	405
4050537	Xã Cương Gián	40505	0	\N	\N	\N	\N	\N	cg	405
4050700	Không xác định	40507	0	\N	\N	\N	\N	\N	kx	405
4050701	Thị trấn Đức Thọ	40507	0	\N	\N	\N	\N	\N	dt	405
4050703	Xã Đức Tùng	40507	0	\N	\N	\N	\N	\N	dt	405
4050705	Xã Đức Quang	40507	0	\N	\N	\N	\N	\N	dq	405
4050707	Xã Đức Châu	40507	0	\N	\N	\N	\N	\N	dc	405
4050709	Xã Trường Sơn	40507	0	\N	\N	\N	\N	\N	ts	405
4050711	Xã Liên Minh	40507	0	\N	\N	\N	\N	\N	lm	405
4050713	Xã Đức La	40507	0	\N	\N	\N	\N	\N	dl	405
4050715	Xã Đức Vĩnh	40507	0	\N	\N	\N	\N	\N	dv	405
4050717	Xã Tùng ảnh	40507	0	\N	\N	\N	\N	\N	ta	405
4050719	Xã Đức Yên	40507	0	\N	\N	\N	\N	\N	dy	405
4050721	Xã Đức Nhân	40507	0	\N	\N	\N	\N	\N	dn	405
4050723	Xã Bùi Xá	40507	0	\N	\N	\N	\N	\N	bx	405
4050725	Xã Yên Hồ	40507	0	\N	\N	\N	\N	\N	yh	405
4050727	Xã Trung Lễ	40507	0	\N	\N	\N	\N	\N	tl	405
4050729	Xã Đức Thủy	40507	0	\N	\N	\N	\N	\N	dt	405
4050731	Xã Đức Thịnh	40507	0	\N	\N	\N	\N	\N	dt	405
4050733	Xã Thái Yên	40507	0	\N	\N	\N	\N	\N	ty	405
4050735	Xã Đức Hòa	40507	0	\N	\N	\N	\N	\N	dh	405
4050737	Xã Đức Lạc	40507	0	\N	\N	\N	\N	\N	dl	405
4050739	Xã Đức Long	40507	0	\N	\N	\N	\N	\N	dl	405
4050741	Xã Đức Lâm	40507	0	\N	\N	\N	\N	\N	dl	405
4050743	Xã Đức Thanh	40507	0	\N	\N	\N	\N	\N	dt	405
4050745	Xã Ân Phú	40507	0	\N	\N	\N	\N	\N	ap	405
4050747	Xã Đức Lập	40507	0	\N	\N	\N	\N	\N	dl	405
4050749	Xã Đức Dũng	40507	0	\N	\N	\N	\N	\N	dd	405
4050751	Xã Đức An	40507	0	\N	\N	\N	\N	\N	da	405
4050753	Xã Đức Giang	40507	0	\N	\N	\N	\N	\N	dg	405
4050755	Xã Đức Đồng	40507	0	\N	\N	\N	\N	\N	dd	405
4050757	Xã Đức Lĩnh	40507	0	\N	\N	\N	\N	\N	dl	405
4050759	Xã Đức Hương	40507	0	\N	\N	\N	\N	\N	dh	405
4050761	Xã Đức Lạng	40507	0	\N	\N	\N	\N	\N	dl	405
4050763	Xã Tân Hương	40507	0	\N	\N	\N	\N	\N	th	405
4050765	Xã Đức Bồng	40507	0	\N	\N	\N	\N	\N	db	405
4050767	Xã Đức Liên	40507	0	\N	\N	\N	\N	\N	dl	405
4050900	Không xác định	40509	0	\N	\N	\N	\N	\N	kx	405
4050901	Thị trấn  Tây Sơn	40509	0	\N	\N	\N	\N	\N	ts	405
4050903	Thị trấn Phố Châu	40509	0	\N	\N	\N	\N	\N	pc	405
4050905	Xã Sơn Hồng	40509	0	\N	\N	\N	\N	\N	sh	405
4050907	Xã Sơn Lĩnh	40509	0	\N	\N	\N	\N	\N	sl	405
4050909	Xã Sơn Lâm	40509	0	\N	\N	\N	\N	\N	sl	405
4050911	Xã Sơn Lễ	40509	0	\N	\N	\N	\N	\N	sl	405
4050913	Xã Sơn Tiến	40509	0	\N	\N	\N	\N	\N	st	405
4050915	Xã Sơn An	40509	0	\N	\N	\N	\N	\N	sa	405
4050917	Xã Sơn Kim	40509	0	\N	\N	\N	\N	\N	sk	405
4050919	Xã Sơn Tây	40509	0	\N	\N	\N	\N	\N	st	405
4050921	Xã Sơn Quang	40509	0	\N	\N	\N	\N	\N	sq	405
4050923	Xã Sơn Giang	40509	0	\N	\N	\N	\N	\N	sg	405
4050925	Xã Sơn Ninh	40509	0	\N	\N	\N	\N	\N	sn	405
4050927	Xã Sơn Hòa	40509	0	\N	\N	\N	\N	\N	sh	405
4050929	Xã Sơn Thịnh	40509	0	\N	\N	\N	\N	\N	st	405
4050931	Xã Sơn Diệm	40509	0	\N	\N	\N	\N	\N	sd	405
4050933	Xã Sơn Hàm	40509	0	\N	\N	\N	\N	\N	sh	405
4050935	Xã Sơn Trung	40509	0	\N	\N	\N	\N	\N	st	405
4050937	Xã Sơn Phố	40509	0	\N	\N	\N	\N	\N	sp	405
4050939	Xã Sơn Phúc	40509	0	\N	\N	\N	\N	\N	sp	405
4050941	Xã Sơn Bằng	40509	0	\N	\N	\N	\N	\N	sb	405
4050943	Xã Sơn Mai	40509	0	\N	\N	\N	\N	\N	sm	405
4050945	Xã Sơn Thọ	40509	0	\N	\N	\N	\N	\N	st	405
4050947	Xã Sơn Châu	40509	0	\N	\N	\N	\N	\N	sc	405
4050949	Xã Sơn Bình	40509	0	\N	\N	\N	\N	\N	sb	405
4050951	Xã Sơn Hà	40509	0	\N	\N	\N	\N	\N	sh	405
4050953	Xã Sơn Mỹ	40509	0	\N	\N	\N	\N	\N	sm	405
4050955	Xã Sơn Tân	40509	0	\N	\N	\N	\N	\N	st	405
4050957	Xã Sơn Long	40509	0	\N	\N	\N	\N	\N	sl	405
4050959	Xã Sơn Phú	40509	0	\N	\N	\N	\N	\N	sp	405
4050961	Xã Sơn Thủy	40509	0	\N	\N	\N	\N	\N	st	405
4050963	Xã Sơn Trà	40509	0	\N	\N	\N	\N	\N	st	405
4050965	Xã Sơn Trường	40509	0	\N	\N	\N	\N	\N	st	405
4051100	Không xác định	40511	0	\N	\N	\N	\N	\N	kx	405
4051101	Thị trấn Can Lộc	40511	0	\N	\N	\N	\N	\N	cl	405
4051103	Xã Hồng Lộc	40511	0	\N	\N	\N	\N	\N	hl	405
4051105	Xã Tân Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051107	Xã Thịnh Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051109	Xã Thiên Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051111	Xã An Lộc	40511	0	\N	\N	\N	\N	\N	al	405
4051113	Xã Kim Lộc	40511	0	\N	\N	\N	\N	\N	kl	405
4051115	Xã Thanh Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051117	Xã Song Lộc	40511	0	\N	\N	\N	\N	\N	sl	405
4051119	Xã Gia Hanh	40511	0	\N	\N	\N	\N	\N	gh	405
4051121	Xã Trường Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051123	Xã Vượng Lộc	40511	0	\N	\N	\N	\N	\N	vl	405
4051125	Xã Bình Lộc	40511	0	\N	\N	\N	\N	\N	bl	405
4051127	Xã  Thường Nga	40511	0	\N	\N	\N	\N	\N	tn	405
4051129	Xã Vĩnh Lộc	40511	0	\N	\N	\N	\N	\N	vl	405
4051131	Xã Khánh Lộc	40511	0	\N	\N	\N	\N	\N	kl	405
4051133	Xã Đại Lộc	40511	0	\N	\N	\N	\N	\N	dl	405
4051135	Xã Tùng Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051137	Xã Thuần Thiện	40511	0	\N	\N	\N	\N	\N	tt	405
4051139	Xã ích Hậu	40511	0	\N	\N	\N	\N	\N	ýh	405
4051141	Xã Phú Lộc	40511	0	\N	\N	\N	\N	\N	pl	405
4051143	Xã Yên Lộc	40511	0	\N	\N	\N	\N	\N	yl	405
4051145	Xã Trung Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051147	Xã Phù Lưu	40511	0	\N	\N	\N	\N	\N	pl	405
4051149	Xã Xuân Lộc	40511	0	\N	\N	\N	\N	\N	xl	405
4051151	Xã Tiến Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051153	Xã Thượng Lộc	40511	0	\N	\N	\N	\N	\N	tl	405
4051155	Xã Đồng Lộc	40511	0	\N	\N	\N	\N	\N	dl	405
4051157	Xã Quang Lộc	40511	0	\N	\N	\N	\N	\N	ql	405
4051159	Xã Mỹ Lộc	40511	0	\N	\N	\N	\N	\N	ml	405
4051161	Xã Sơn Lộc	40511	0	\N	\N	\N	\N	\N	sl	405
4051300	Không xác định	40513	0	\N	\N	\N	\N	\N	kx	405
4051301	Thị trấn Cày	40513	0	\N	\N	\N	\N	\N	c	405
4051303	Thị trấn NT Thạch Ngọc	40513	0	\N	\N	\N	\N	\N	ntn	405
4051305	Xã Thạch Liên	40513	0	\N	\N	\N	\N	\N	tl	405
4051307	Xã Thạch Kênh	40513	0	\N	\N	\N	\N	\N	tk	405
4051309	Xã  Việt Xuyên	40513	0	\N	\N	\N	\N	\N	vx	405
4051311	Xã Thạch Sơn	40513	0	\N	\N	\N	\N	\N	ts	405
4051313	Xã Thạch Bằng	40513	0	\N	\N	\N	\N	\N	tb	405
4051315	Xã Thạch Mỹ	40513	0	\N	\N	\N	\N	\N	tm	405
4051317	Xã Thạch Châu	40513	0	\N	\N	\N	\N	\N	tc	405
4051319	Xã Thạch Kim	40513	0	\N	\N	\N	\N	\N	tk	405
4051321	Xã Thạch Bàn	40513	0	\N	\N	\N	\N	\N	tb	405
4051323	Xã Phù Việt	40513	0	\N	\N	\N	\N	\N	pv	405
4051325	Xã Thạch Long	40513	0	\N	\N	\N	\N	\N	tl	405
4051327	Xã Thạch Đỉnh	40513	0	\N	\N	\N	\N	\N	td	405
4051329	Xã Thạch Hải	40513	0	\N	\N	\N	\N	\N	th	405
4051331	Xã Thạch Tiến	40513	0	\N	\N	\N	\N	\N	tt	405
4051333	Xã Thạch Thanh	40513	0	\N	\N	\N	\N	\N	tt	405
4051335	Xã Thạch Thượng	40513	0	\N	\N	\N	\N	\N	tt	405
4051337	Xã Thạch Hạ	40513	0	\N	\N	\N	\N	\N	th	405
1010815	Phường Dương Nội	10108	0	\N	\N	\N	\N	\N	dn	101
4051341	Xã Mai Phụ	40513	0	\N	\N	\N	\N	\N	mp	405
4051343	Xã Thạch Môn	40513	0	\N	\N	\N	\N	\N	tm	405
4051345	Xã Hộ Độ	40513	0	\N	\N	\N	\N	\N	hd	405
4051347	Xã Thạch Khê	40513	0	\N	\N	\N	\N	\N	tk	405
4051349	Xã Thạch Trị	40513	0	\N	\N	\N	\N	\N	tt	405
4051351	Xã Thạch Hưng	40513	0	\N	\N	\N	\N	\N	th	405
4051353	Xã  Tượng Sơn	40513	0	\N	\N	\N	\N	\N	ts	405
7012701	Phường 1	70127	0	\N	\N	\N	\N	\N	1	701
4051355	Xã Thạch Lạc	40513	0	\N	\N	\N	\N	\N	tl	405
4051357	Xã Thạch Ngọc	40513	0	\N	\N	\N	\N	\N	tn	405
4051359	Xã Thạch Vĩnh	40513	0	\N	\N	\N	\N	\N	tv	405
4051361	Xã Thạch Lưu	40513	0	\N	\N	\N	\N	\N	tl	405
4051363	Xã Bắc Sơn	40513	0	\N	\N	\N	\N	\N	bs	405
4051365	Xã Thạch Đài	40513	0	\N	\N	\N	\N	\N	td	405
4051367	Xã Thạch Thắng	40513	0	\N	\N	\N	\N	\N	tt	405
4051369	Xã Thạch Hội	40513	0	\N	\N	\N	\N	\N	th	405
4051371	Xã Thạch Văn	40513	0	\N	\N	\N	\N	\N	tv	405
4051373	Xã Thạch Xuân	40513	0	\N	\N	\N	\N	\N	tx	405
4051375	Xã Thạch Tân	40513	0	\N	\N	\N	\N	\N	tt	405
4051377	Xã Thạch Bình	40513	0	\N	\N	\N	\N	\N	tb	405
4051379	Xã Thạch Hương	40513	0	\N	\N	\N	\N	\N	th	405
4051381	Xã Thạch Điền	40513	0	\N	\N	\N	\N	\N	td	405
4051383	Xã Nam Hương	40513	0	\N	\N	\N	\N	\N	nh	405
4051385	Xã Thạch Lâm	40513	0	\N	\N	\N	\N	\N	tl	405
4051500	Không xác định	40515	0	\N	\N	\N	\N	\N	kx	405
4051501	Thị trấn Cẩm Xuyên	40515	0	\N	\N	\N	\N	\N	cx	405
4051503	Xã Cẩm Vĩnh	40515	0	\N	\N	\N	\N	\N	cv	405
4051505	Xã Cẩm Bình	40515	0	\N	\N	\N	\N	\N	cb	405
4051507	Xã Cẩm Yên	40515	0	\N	\N	\N	\N	\N	cy	405
4051509	Xã Cẩm Hòa	40515	0	\N	\N	\N	\N	\N	ch	405
4051511	Xã Cẩm Nam	40515	0	\N	\N	\N	\N	\N	cn	405
4051513	Xã Cẩm Dương	40515	0	\N	\N	\N	\N	\N	cd	405
4051515	Xã Cẩm Thành	40515	0	\N	\N	\N	\N	\N	ct	405
4051517	Xã Cẩm Quang	40515	0	\N	\N	\N	\N	\N	cq	405
4051519	Xã Cẩm Huy	40515	0	\N	\N	\N	\N	\N	ch	405
4051521	Xã Cẩm Thăng	40515	0	\N	\N	\N	\N	\N	ct	405
4051523	Xã Cẩm Long	40515	0	\N	\N	\N	\N	\N	cl	405
4051525	Xã Cẩm Nhượng	40515	0	\N	\N	\N	\N	\N	cn	405
4051527	Xã Cẩm Thạch	40515	0	\N	\N	\N	\N	\N	ct	405
4051529	Xã Cẩm Duệ	40515	0	\N	\N	\N	\N	\N	cd	405
4051531	Xã Cẩm Phúc	40515	0	\N	\N	\N	\N	\N	cp	405
4051533	Xã Cẩm Lĩnh	40515	0	\N	\N	\N	\N	\N	cl	405
4051535	Xã Cẩm Quan	40515	0	\N	\N	\N	\N	\N	cq	405
4051537	Xã Cẩm Hà	40515	0	\N	\N	\N	\N	\N	ch	405
4051539	Xã Cẩm Mỹ	40515	0	\N	\N	\N	\N	\N	cm	405
4051541	Xã Cẩm Hưng	40515	0	\N	\N	\N	\N	\N	ch	405
8090103	Phường 2	80901	0	\N	\N	\N	\N	\N	2	809
4051543	Xã Cẩm Lộc	40515	0	\N	\N	\N	\N	\N	cl	405
4051545	Xã Cẩm Trung	40515	0	\N	\N	\N	\N	\N	ct	405
4051547	Xã Cẩm Thịnh	40515	0	\N	\N	\N	\N	\N	ct	405
4051549	Xã Cẩm Sơn	40515	0	\N	\N	\N	\N	\N	cs	405
4051551	Xã Cẩm Lạc	40515	0	\N	\N	\N	\N	\N	cl	405
4051553	Xã Cẩm Minh	40515	0	\N	\N	\N	\N	\N	cm	405
4051700	Không xác định	40517	0	\N	\N	\N	\N	\N	kx	405
4051701	Thị trấn Hương Khê	40517	0	\N	\N	\N	\N	\N	hk	405
4051703	Thị trấn NT 20-4	40517	0	\N	\N	\N	\N	\N	n2	405
4051705	Xã Vũ Quang	40517	0	\N	\N	\N	\N	\N	vq	405
4051707	Xã Hương Điền	40517	0	\N	\N	\N	\N	\N	hd	405
4051709	Xã Hương Đại	40517	0	\N	\N	\N	\N	\N	hd	405
4051711	Xã Hương Minh	40517	0	\N	\N	\N	\N	\N	hm	405
4051713	Xã Hương Thọ	40517	0	\N	\N	\N	\N	\N	ht	405
4051715	Xã Phương Điền	40517	0	\N	\N	\N	\N	\N	pd	405
4051717	Xã Phương Mỹ	40517	0	\N	\N	\N	\N	\N	pm	405
4051719	Xã Hà Linh	40517	0	\N	\N	\N	\N	\N	hl	405
4051721	Xã Phúc Đồng	40517	0	\N	\N	\N	\N	\N	pd	405
4051723	Xã Hòa Hải	40517	0	\N	\N	\N	\N	\N	hh	405
4051725	Xã Hương Bình	40517	0	\N	\N	\N	\N	\N	hb	405
4051727	Xã Hương Long	40517	0	\N	\N	\N	\N	\N	hl	405
4051729	Xã Hương Thủy	40517	0	\N	\N	\N	\N	\N	ht	405
4051731	Xã Hương Giang	40517	0	\N	\N	\N	\N	\N	hg	405
4051733	Xã Gia Phố	40517	0	\N	\N	\N	\N	\N	gp	405
4051735	Xã Phú Gia	40517	0	\N	\N	\N	\N	\N	pg	405
4051737	Xã Hương Vĩnh	40517	0	\N	\N	\N	\N	\N	hv	405
4051739	Xã Hương Xuân	40517	0	\N	\N	\N	\N	\N	hx	405
4051741	Xã Phú Phong	40517	0	\N	\N	\N	\N	\N	pp	405
4051743	Xã Lộc Yên	40517	0	\N	\N	\N	\N	\N	ly	405
4051745	Xã Hương Lâm	40517	0	\N	\N	\N	\N	\N	hl	405
4051747	Xã Hương Liên	40517	0	\N	\N	\N	\N	\N	hl	405
4051749	Xã Hương Đô	40517	0	\N	\N	\N	\N	\N	hd	405
4051751	Xã Phúc Trạch	40517	0	\N	\N	\N	\N	\N	pt	405
4051753	Xã Hương Trạch	40517	0	\N	\N	\N	\N	\N	ht	405
4051900	Không xác định	40519	0	\N	\N	\N	\N	\N	kx	405
4051901	Thị trấn Kỳ Anh	40519	0	\N	\N	\N	\N	\N	ka	405
4051903	Xã Kỳ Bắc	40519	0	\N	\N	\N	\N	\N	kb	405
4051905	Xã Kỳ Tiến	40519	0	\N	\N	\N	\N	\N	kt	405
4051907	Xã Kỳ Xuân	40519	0	\N	\N	\N	\N	\N	kx	405
4051909	Xã Kỳ Giang	40519	0	\N	\N	\N	\N	\N	kg	405
4051911	Xã Kỳ Phú	40519	0	\N	\N	\N	\N	\N	kp	405
4051913	Xã Kỳ Phong	40519	0	\N	\N	\N	\N	\N	kp	405
4051915	Xã Kỳ Sơn	40519	0	\N	\N	\N	\N	\N	ks	405
4051917	Xã Kỳ Tây	40519	0	\N	\N	\N	\N	\N	kt	405
4051919	Xã Kỳ Hợp	40519	0	\N	\N	\N	\N	\N	kh	405
4051921	Xã Kỳ Lâm	40519	0	\N	\N	\N	\N	\N	kl	405
4051923	Xã Kỳ Khang	40519	0	\N	\N	\N	\N	\N	kk	405
4051925	Xã Kỳ Văn	40519	0	\N	\N	\N	\N	\N	kv	405
4051927	Xã Kỳ Lạc	40519	0	\N	\N	\N	\N	\N	kl	405
4051929	Xã Kỳ Hà	40519	0	\N	\N	\N	\N	\N	kh	405
4051931	Xã Kỳ Hưng	40519	0	\N	\N	\N	\N	\N	kh	405
4051933	Xã Kỳ Hải	40519	0	\N	\N	\N	\N	\N	kh	405
4051935	Xã Kỳ Châu	40519	0	\N	\N	\N	\N	\N	kc	405
4051937	Xã Kỳ Tân	40519	0	\N	\N	\N	\N	\N	kt	405
4051939	Xã Kỳ Hoa	40519	0	\N	\N	\N	\N	\N	kh	405
4051941	Xã Kỳ Thư	40519	0	\N	\N	\N	\N	\N	kt	405
4051943	Xã Kỳ Thọ	40519	0	\N	\N	\N	\N	\N	kt	405
4051945	Xã Kỳ Phương	40519	0	\N	\N	\N	\N	\N	kp	405
4051947	Xã Kỳ Lợi	40519	0	\N	\N	\N	\N	\N	kl	405
4051949	Xã Kỳ Liên	40519	0	\N	\N	\N	\N	\N	kl	405
4051951	Xã Kỳ Ninh	40519	0	\N	\N	\N	\N	\N	kn	405
4051953	Xã Kỳ Đồng	40519	0	\N	\N	\N	\N	\N	kd	405
4051955	Xã Kỳ Long	40519	0	\N	\N	\N	\N	\N	kl	405
4051957	Xã Kỳ Trinh	40519	0	\N	\N	\N	\N	\N	kt	405
4051959	Xã Kỳ Thịnh	40519	0	\N	\N	\N	\N	\N	kt	405
4051961	Xã Kỳ Thượng	40519	0	\N	\N	\N	\N	\N	kt	405
4051963	Xã Kỳ Nam	40519	0	\N	\N	\N	\N	\N	kn	405
4070000	Không xác định	40700	0	\N	\N	\N	\N	\N	kx	407
4070100	Không xác định	40701	0	\N	\N	\N	\N	\N	kx	407
4070101	Phường Đồng Sơn	40701	0	\N	\N	\N	\N	\N	ds	407
4070103	Phường Bắc Lý	40701	0	\N	\N	\N	\N	\N	bl	407
4070105	Phường Nam Lý	40701	0	\N	\N	\N	\N	\N	nl	407
4070107	Phường Hải Thành	40701	0	\N	\N	\N	\N	\N	ht	407
4070109	Phường Đồng Phú	40701	0	\N	\N	\N	\N	\N	dp	407
4070111	Phường Đồng Mỹ	40701	0	\N	\N	\N	\N	\N	dm	407
4070113	Phường Hải Đình	40701	0	\N	\N	\N	\N	\N	hd	407
4070115	Phường Phú Hải	40701	0	\N	\N	\N	\N	\N	ph	407
4070117	Xã Nghĩa Ninh	40701	0	\N	\N	\N	\N	\N	nn	407
4070119	Xã Đức Ninh	40701	0	\N	\N	\N	\N	\N	dn	407
4070121	Xã Quang Phú	40701	0	\N	\N	\N	\N	\N	qp	407
4070123	Xã Lộc Ninh	40701	0	\N	\N	\N	\N	\N	ln	407
4070125	Xã Bảo Ninh	40701	0	\N	\N	\N	\N	\N	bn	407
4070127	Xã Thuận Đức	40701	0	\N	\N	\N	\N	\N	td	407
4070300	Không xác định	40703	0	\N	\N	\N	\N	\N	kx	407
4070301	Xã Lâm Hóa	40703	0	\N	\N	\N	\N	\N	lh	407
4070303	Xã Hương Hóa	40703	0	\N	\N	\N	\N	\N	hh	407
4070305	Xã Thanh Hóa	40703	0	\N	\N	\N	\N	\N	th	407
4070307	Xã Kim Hóa	40703	0	\N	\N	\N	\N	\N	kh	407
4070309	Xã Lê Hóa	40703	0	\N	\N	\N	\N	\N	lh	407
4070311	Xã Thuận Hóa	40703	0	\N	\N	\N	\N	\N	th	407
4070313	Xã Đồng Hóa	40703	0	\N	\N	\N	\N	\N	dh	407
4070315	Xã Thạch Hóa	40703	0	\N	\N	\N	\N	\N	th	407
4070317	Xã Đức Hóa	40703	0	\N	\N	\N	\N	\N	dh	407
4070319	Xã Phong Hóa	40703	0	\N	\N	\N	\N	\N	ph	407
4070321	Xã Mai Hóa	40703	0	\N	\N	\N	\N	\N	mh	407
4070323	Xã Ngư Hóa	40703	0	\N	\N	\N	\N	\N	nh	407
4070325	Xã Tiến Hóa	40703	0	\N	\N	\N	\N	\N	th	407
4070327	Xã Châu Hóa	40703	0	\N	\N	\N	\N	\N	ch	407
4070329	Xã Cao Quảng	40703	0	\N	\N	\N	\N	\N	cq	407
4070331	Xã Văn Hóa	40703	0	\N	\N	\N	\N	\N	vh	407
4070500	Không xác định	40705	0	\N	\N	\N	\N	\N	kx	407
4070501	Xã Dân Hóa	40705	0	\N	\N	\N	\N	\N	dh	407
4070503	Xã Hóa Thanh	40705	0	\N	\N	\N	\N	\N	ht	407
4070505	Xã Hóa Phúc	40705	0	\N	\N	\N	\N	\N	hp	407
4070507	Xã Hồng Hóa	40705	0	\N	\N	\N	\N	\N	hh	407
4070509	Xã Hóa Tiến	40705	0	\N	\N	\N	\N	\N	ht	407
4070511	Xã Hóa Hợp	40705	0	\N	\N	\N	\N	\N	hh	407
4070513	Xã Hóa Sơn	40705	0	\N	\N	\N	\N	\N	hs	407
4070515	Xã Xuân Hóa	40705	0	\N	\N	\N	\N	\N	xh	407
4070517	Xã Yên Hóa	40705	0	\N	\N	\N	\N	\N	yh	407
4070519	Xã Quy Hóa	40705	0	\N	\N	\N	\N	\N	qh	407
4070521	Xã Trung Hóa	40705	0	\N	\N	\N	\N	\N	th	407
4070523	Xã Minh Hóa	40705	0	\N	\N	\N	\N	\N	mh	407
4070525	Xã Thượng Hóa	40705	0	\N	\N	\N	\N	\N	th	407
4070527	Xã Tân Hóa	40705	0	\N	\N	\N	\N	\N	th	407
4070700	Không xác định	40707	0	\N	\N	\N	\N	\N	kx	407
4070701	Thị trấn Ba Đồn	40707	0	\N	\N	\N	\N	\N	bd	407
4070703	Xã Quảng Hợp	40707	0	\N	\N	\N	\N	\N	qh	407
4070705	Xã Quảng Đông	40707	0	\N	\N	\N	\N	\N	qd	407
4070707	Xã Quảng Kim	40707	0	\N	\N	\N	\N	\N	qk	407
4070709	Xã Quảng Phú	40707	0	\N	\N	\N	\N	\N	qp	407
4070711	Xã Quảng Châu	40707	0	\N	\N	\N	\N	\N	qc	407
4070713	Xã Quảng Tùng	40707	0	\N	\N	\N	\N	\N	qt	407
4070715	Xã Cảnh Dương	40707	0	\N	\N	\N	\N	\N	cd	407
4070717	Xã Quảng Hưng	40707	0	\N	\N	\N	\N	\N	qh	407
4070719	Xã Quảng Xuân	40707	0	\N	\N	\N	\N	\N	qx	407
4070721	Xã Quảng Thọ	40707	0	\N	\N	\N	\N	\N	qt	407
4070723	Xã Quảng Phúc	40707	0	\N	\N	\N	\N	\N	qp	407
4070725	Xã Quảng Thuận	40707	0	\N	\N	\N	\N	\N	qt	407
4070727	Xã Quảng Long	40707	0	\N	\N	\N	\N	\N	ql	407
4070729	Xã Quảng Phong	40707	0	\N	\N	\N	\N	\N	qp	407
4070731	Xã Quảng Thanh	40707	0	\N	\N	\N	\N	\N	qt	407
4070733	Xã Quảng Trường	40707	0	\N	\N	\N	\N	\N	qt	407
4070735	Xã Quảng Phương	40707	0	\N	\N	\N	\N	\N	qp	407
4070737	Xã Quảng Lưu	40707	0	\N	\N	\N	\N	\N	ql	407
4070739	Xã Quảng Tiến	40707	0	\N	\N	\N	\N	\N	qt	407
4070741	Xã Quảng Thạch	40707	0	\N	\N	\N	\N	\N	qt	407
4070743	Xã Quảng Liên	40707	0	\N	\N	\N	\N	\N	ql	407
4070745	Xã Phù Hóa	40707	0	\N	\N	\N	\N	\N	ph	407
4070747	Xã Cảnh Hóa	40707	0	\N	\N	\N	\N	\N	ch	407
4070749	Xã Quảng Tiên	40707	0	\N	\N	\N	\N	\N	qt	407
4070751	Xã Quảng Trung	40707	0	\N	\N	\N	\N	\N	qt	407
4070753	Xã Quảng Thủy	40707	0	\N	\N	\N	\N	\N	qt	407
4070755	Xã Quảng Sơn	40707	0	\N	\N	\N	\N	\N	qs	407
4070757	Xã Quảng Minh	40707	0	\N	\N	\N	\N	\N	qm	407
4070759	Xã Quảng Hòa	40707	0	\N	\N	\N	\N	\N	qh	407
4070761	Xã Quảng Lộc	40707	0	\N	\N	\N	\N	\N	ql	407
4070763	Xã Quảng Tân	40707	0	\N	\N	\N	\N	\N	qt	407
4070765	Xã Quảng Hải	40707	0	\N	\N	\N	\N	\N	qh	407
4070767	Xã Quảng Văn	40707	0	\N	\N	\N	\N	\N	qv	407
4070900	Không xác định	40709	0	\N	\N	\N	\N	\N	kx	407
4070901	Thị trấn Hoàn Lão	40709	0	\N	\N	\N	\N	\N	hl	407
4070903	Thị trấn NT Việt Trung	40709	0	\N	\N	\N	\N	\N	nvt	407
4070905	Xã Thượng Trạch	40709	0	\N	\N	\N	\N	\N	tt	407
4070907	Xã Tân Trạch	40709	0	\N	\N	\N	\N	\N	tt	407
4070909	Xã Phúc Trạch	40709	0	\N	\N	\N	\N	\N	pt	407
4070911	Xã Lâm Trạch	40709	0	\N	\N	\N	\N	\N	lt	407
4070913	Xã Xuân Trạch	40709	0	\N	\N	\N	\N	\N	xt	407
4070915	Xã Sơn Trạch	40709	0	\N	\N	\N	\N	\N	st	407
4070917	Xã Hưng Trạch	40709	0	\N	\N	\N	\N	\N	ht	407
4070919	Xã Liên Trạch	40709	0	\N	\N	\N	\N	\N	lt	407
4070921	Xã Cự Nẫm	40709	0	\N	\N	\N	\N	\N	cn	407
4070923	Xã Phú Định	40709	0	\N	\N	\N	\N	\N	pd	407
4070925	Xã Sơn Lộc	40709	0	\N	\N	\N	\N	\N	sl	407
4070927	Xã Vạn Trạch	40709	0	\N	\N	\N	\N	\N	vt	407
4070929	Xã Hoàn Trạch	40709	0	\N	\N	\N	\N	\N	ht	407
4070931	Xã Tây Trạch	40709	0	\N	\N	\N	\N	\N	tt	407
4070933	Xã Hoà Trạch	40709	0	\N	\N	\N	\N	\N	ht	407
4070935	Xã Nam Trạch	40709	0	\N	\N	\N	\N	\N	nt	407
4070937	Xã Mỹ Trạch	40709	0	\N	\N	\N	\N	\N	mt	407
4070939	Xã Hạ Trạch	40709	0	\N	\N	\N	\N	\N	ht	407
4070941	Xã Bắc Trạch	40709	0	\N	\N	\N	\N	\N	bt	407
4070943	Xã Thanh Trạch	40709	0	\N	\N	\N	\N	\N	tt	407
4070945	Xã Hải Trạch	40709	0	\N	\N	\N	\N	\N	ht	407
4070947	Xã Phú Trạch	40709	0	\N	\N	\N	\N	\N	pt	407
4070949	Xã Đức Trạch	40709	0	\N	\N	\N	\N	\N	dt	407
4070951	Xã Đồng Trạch	40709	0	\N	\N	\N	\N	\N	dt	407
4070953	Xã Trung Trạch	40709	0	\N	\N	\N	\N	\N	tt	407
4070955	Xã Đại Trạch	40709	0	\N	\N	\N	\N	\N	dt	407
4070957	Xã Nhân Trạch	40709	0	\N	\N	\N	\N	\N	nt	407
4070959	Xã Lý Trạch	40709	0	\N	\N	\N	\N	\N	lt	407
4071100	Không xác định	40711	0	\N	\N	\N	\N	\N	kx	407
4071101	Xã Vĩnh Ninh	40711	0	\N	\N	\N	\N	\N	vn	407
4071103	Xã Trường Xuân	40711	0	\N	\N	\N	\N	\N	tx	407
4071105	Xã Trường Sơn	40711	0	\N	\N	\N	\N	\N	ts	407
4071107	Xã Duy Ninh	40711	0	\N	\N	\N	\N	\N	dn	407
4071109	Xã Hàm Ninh	40711	0	\N	\N	\N	\N	\N	hn	407
4071111	Xã Hiền Ninh	40711	0	\N	\N	\N	\N	\N	hn	407
4071113	Xã Tân Ninh	40711	0	\N	\N	\N	\N	\N	tn	407
4071115	Xã Xuân Ninh	40711	0	\N	\N	\N	\N	\N	xn	407
4071117	Xã An Ninh	40711	0	\N	\N	\N	\N	\N	an	407
4071119	Xã Vạn Ninh	40711	0	\N	\N	\N	\N	\N	vn	407
4071121	Xã Lương Ninh	40711	0	\N	\N	\N	\N	\N	ln	407
4071123	Xã Võ Ninh	40711	0	\N	\N	\N	\N	\N	vn	407
4071125	Xã Gia Ninh	40711	0	\N	\N	\N	\N	\N	gn	407
4071127	Xã Hải Ninh	40711	0	\N	\N	\N	\N	\N	hn	407
4071300	Không xác định	40713	0	\N	\N	\N	\N	\N	kx	407
4071301	Thị trấn Kiến Giang	40713	0	\N	\N	\N	\N	\N	kg	407
4071303	Thị trấn NT Lệ Ninh	40713	0	\N	\N	\N	\N	\N	nln	407
4071305	Xã Kim Thủy	40713	0	\N	\N	\N	\N	\N	kt	407
4071307	Xã Ngân Thủy	40713	0	\N	\N	\N	\N	\N	nt	407
4071309	Xã Hoa Thủy	40713	0	\N	\N	\N	\N	\N	ht	407
4071311	Xã Sơn Thủy	40713	0	\N	\N	\N	\N	\N	st	407
4071313	Xã Phú Thủy	40713	0	\N	\N	\N	\N	\N	pt	407
4071315	Xã Trường Thủy	40713	0	\N	\N	\N	\N	\N	tt	407
4071317	Xã Mai Thủy	40713	0	\N	\N	\N	\N	\N	mt	407
4071319	Xã Văn Thủy	40713	0	\N	\N	\N	\N	\N	vt	407
4071321	Xã Lộc Thủy	40713	0	\N	\N	\N	\N	\N	lt	407
4071323	Xã An Thủy	40713	0	\N	\N	\N	\N	\N	at	407
4071325	Xã Xuân Thủy	40713	0	\N	\N	\N	\N	\N	xt	407
4071327	Xã Phong Thủy	40713	0	\N	\N	\N	\N	\N	pt	407
4071329	Xã Liên Thủy	40713	0	\N	\N	\N	\N	\N	lt	407
4071331	Xã Mỹ Thủy	40713	0	\N	\N	\N	\N	\N	mt	407
4071333	Xã Dương Thủy	40713	0	\N	\N	\N	\N	\N	dt	407
4071335	Xã Tân Thủy	40713	0	\N	\N	\N	\N	\N	tt	407
4071337	Xã Thái Thủy	40713	0	\N	\N	\N	\N	\N	tt	407
4071339	Xã Hồng Thủy	40713	0	\N	\N	\N	\N	\N	ht	407
4071341	Xã Thanh Thủy	40713	0	\N	\N	\N	\N	\N	tt	407
4071343	Xã Cam Thủy	40713	0	\N	\N	\N	\N	\N	ct	407
4071345	Xã Hưng Thủy	40713	0	\N	\N	\N	\N	\N	ht	407
4071347	Xã Sen Thủy	40713	0	\N	\N	\N	\N	\N	st	407
4071349	Xã Ngư Hòa	40713	0	\N	\N	\N	\N	\N	nh	407
4071351	Xã Hải Thủy	40713	0	\N	\N	\N	\N	\N	ht	407
4071353	Xã Ngư Thủy	40713	0	\N	\N	\N	\N	\N	nt	407
4090000	Không xác định	40900	0	\N	\N	\N	\N	\N	kx	409
4090100	Không xác định	40901	0	\N	\N	\N	\N	\N	kx	409
4090101	Phường 1	40901	0	\N	\N	\N	\N	\N	1	409
4090103	Phường 2	40901	0	\N	\N	\N	\N	\N	2	409
4090105	Phường 3	40901	0	\N	\N	\N	\N	\N	3	409
4090107	Phường 4	40901	0	\N	\N	\N	\N	\N	4	409
4090109	Phường 5	40901	0	\N	\N	\N	\N	\N	5	409
4090111	Phường Đông Thanh	40901	0	\N	\N	\N	\N	\N	dt	409
4090113	Phường Đông Giang	40901	0	\N	\N	\N	\N	\N	dg	409
4090115	Phường Đông Lễ	40901	0	\N	\N	\N	\N	\N	dl	409
4090117	Phường Đông Lương	40901	0	\N	\N	\N	\N	\N	dl	409
4090300	Không xác định	40903	0	\N	\N	\N	\N	\N	kx	409
4090301	Phường 1	40903	0	\N	\N	\N	\N	\N	1	409
4090303	Phường 2	40903	0	\N	\N	\N	\N	\N	2	409
4090500	Không xác định	40905	0	\N	\N	\N	\N	\N	kx	409
4090501	Thị trấn Hồ Xá	40905	0	\N	\N	\N	\N	\N	hx	409
4091539	Xã A Túc	40915	0	\N	\N	\N	\N	\N	at	409
4090503	Thị trấn Bến Quan	40905	0	\N	\N	\N	\N	\N	bq	409
4090505	Xã Vĩnh Thái	40905	0	\N	\N	\N	\N	\N	vt	409
4090507	Xã Vĩnh Tú	40905	0	\N	\N	\N	\N	\N	vt	409
4090509	Xã Vĩnh Trung	40905	0	\N	\N	\N	\N	\N	vt	409
4090511	Xã Vĩnh Chấp	40905	0	\N	\N	\N	\N	\N	vc	409
4090513	Xã Vĩnh Nam	40905	0	\N	\N	\N	\N	\N	vn	409
4090515	Xã Vĩnh Khê	40905	0	\N	\N	\N	\N	\N	vk	409
4090517	Xã Vĩnh Long	40905	0	\N	\N	\N	\N	\N	vl	409
4090519	Xã Vĩnh Kim	40905	0	\N	\N	\N	\N	\N	vk	409
4090521	Xã Vĩnh Hòa	40905	0	\N	\N	\N	\N	\N	vh	409
4090523	Xã Vĩnh Thạch	40905	0	\N	\N	\N	\N	\N	vt	409
4090525	Xã Vĩnh Lâm	40905	0	\N	\N	\N	\N	\N	vl	409
4090527	Xã Vĩnh Hiền	40905	0	\N	\N	\N	\N	\N	vh	409
4090529	Xã Vĩnh Thủy	40905	0	\N	\N	\N	\N	\N	vt	409
4090531	Xã Vĩnh Thành	40905	0	\N	\N	\N	\N	\N	vt	409
4090533	Xã Vĩnh Hà	40905	0	\N	\N	\N	\N	\N	vh	409
4090535	Xã Vĩnh Sơn	40905	0	\N	\N	\N	\N	\N	vs	409
4090537	Xã Vĩnh Tân	40905	0	\N	\N	\N	\N	\N	vt	409
4090539	Xã Vĩnh Quang	40905	0	\N	\N	\N	\N	\N	vq	409
4090541	Xã Vĩnh Giang	40905	0	\N	\N	\N	\N	\N	vg	409
4090543	Xã Vĩnh Ô	40905	0	\N	\N	\N	\N	\N	vo	409
4090700	Không xác định	40907	0	\N	\N	\N	\N	\N	kx	409
4090701	Thị trấn Gio Linh	40907	0	\N	\N	\N	\N	\N	gl	409
4090703	Xã Gio Châu	40907	0	\N	\N	\N	\N	\N	gc	409
4090705	Xã Trung Hải	40907	0	\N	\N	\N	\N	\N	th	409
4090707	Xã Trung Giang	40907	0	\N	\N	\N	\N	\N	tg	409
4090709	Xã Trung Sơn	40907	0	\N	\N	\N	\N	\N	ts	409
4090711	Xã Gio Mỹ	40907	0	\N	\N	\N	\N	\N	gm	409
4090713	Xã Gio Phong	40907	0	\N	\N	\N	\N	\N	gp	409
4090715	Xã Gio An	40907	0	\N	\N	\N	\N	\N	ga	409
4090717	Xã Gio Bình	40907	0	\N	\N	\N	\N	\N	gb	409
4090719	Xã Gio Thành	40907	0	\N	\N	\N	\N	\N	gt	409
4090721	Xã Gio Hải	40907	0	\N	\N	\N	\N	\N	gh	409
4090723	Xã Gio Sơn	40907	0	\N	\N	\N	\N	\N	gs	409
4090725	Xã Gio Hòa	40907	0	\N	\N	\N	\N	\N	gh	409
4090727	Xã Linh Hải	40907	0	\N	\N	\N	\N	\N	lh	409
4090729	Xã Gio Việt	40907	0	\N	\N	\N	\N	\N	gv	409
4090731	Xã Vĩnh Trường	40907	0	\N	\N	\N	\N	\N	vt	409
4090733	Xã Hải Thái	40907	0	\N	\N	\N	\N	\N	ht	409
4090735	Xã Gio Mai	40907	0	\N	\N	\N	\N	\N	gm	409
4090737	Xã Gio Quang	40907	0	\N	\N	\N	\N	\N	gq	409
4090739	Xã Linh Thượng	40907	0	\N	\N	\N	\N	\N	lt	409
4090900	Không xác định	40909	0	\N	\N	\N	\N	\N	kx	409
4090901	Thị trấn Cam Lộ	40909	0	\N	\N	\N	\N	\N	cl	409
4090903	Xã Cam Thành	40909	0	\N	\N	\N	\N	\N	ct	409
4090905	Xã Cam An	40909	0	\N	\N	\N	\N	\N	ca	409
4090907	Xã Cam Thanh	40909	0	\N	\N	\N	\N	\N	ct	409
4090909	Xã Cam Thủy	40909	0	\N	\N	\N	\N	\N	ct	409
4090911	Xã Cam Tuyền	40909	0	\N	\N	\N	\N	\N	ct	409
4090913	Xã Cam Hiếu	40909	0	\N	\N	\N	\N	\N	ch	409
4090915	Xã Cam Chính	40909	0	\N	\N	\N	\N	\N	cc	409
4090917	Xã Cam Nghĩa	40909	0	\N	\N	\N	\N	\N	cn	409
4091100	Không xác định	40911	0	\N	\N	\N	\N	\N	kx	409
4091101	Thị trấn ái Tử	40911	0	\N	\N	\N	\N	\N	at	409
4091103	Xã Triệu ái	40911	0	\N	\N	\N	\N	\N	ta	409
4091105	Xã Triệu Thượng	40911	0	\N	\N	\N	\N	\N	tt	409
4091107	Xã Triệu Phước	40911	0	\N	\N	\N	\N	\N	tp	409
4091109	Xã Triệu Vân	40911	0	\N	\N	\N	\N	\N	tv	409
4091111	Xã Triệu Độ	40911	0	\N	\N	\N	\N	\N	td	409
4091113	Xã Triệu Trạch	40911	0	\N	\N	\N	\N	\N	tt	409
4091115	Xã Triệu Đại	40911	0	\N	\N	\N	\N	\N	td	409
4091117	Xã Triệu Lăng	40911	0	\N	\N	\N	\N	\N	tl	409
4091119	Xã Triệu Thuận	40911	0	\N	\N	\N	\N	\N	tt	409
4091121	Xã Triệu Sơn	40911	0	\N	\N	\N	\N	\N	ts	409
4091123	Xã Triệu Giang	40911	0	\N	\N	\N	\N	\N	tg	409
4091125	Xã Triệu Hòa	40911	0	\N	\N	\N	\N	\N	th	409
4091127	Xã Triệu Tài	40911	0	\N	\N	\N	\N	\N	tt	409
4091129	Xã Triệu Đông	40911	0	\N	\N	\N	\N	\N	td	409
4091131	Xã Triệu Trung	40911	0	\N	\N	\N	\N	\N	tt	409
4091133	Xã Triệu Long	40911	0	\N	\N	\N	\N	\N	tl	409
4091135	Xã Triệu Thành	40911	0	\N	\N	\N	\N	\N	tt	409
4091137	Xã Triệu An	40911	0	\N	\N	\N	\N	\N	ta	409
4091300	Không xác định	40913	0	\N	\N	\N	\N	\N	kx	409
4091301	Thị trấn Hải Lăng	40913	0	\N	\N	\N	\N	\N	hl	409
4091303	Xã Hải Lâm	40913	0	\N	\N	\N	\N	\N	hl	409
4091305	Xã Hải An	40913	0	\N	\N	\N	\N	\N	ha	409
4091307	Xã Hải Ba	40913	0	\N	\N	\N	\N	\N	hb	409
4091309	Xã Hải Khê	40913	0	\N	\N	\N	\N	\N	hk	409
4091311	Xã Hải Quy	40913	0	\N	\N	\N	\N	\N	hq	409
4091313	Xã Hải Vĩnh	40913	0	\N	\N	\N	\N	\N	hv	409
4091315	Xã Hải Xuân	40913	0	\N	\N	\N	\N	\N	hx	409
4091317	Xã Hải Quế	40913	0	\N	\N	\N	\N	\N	hq	409
4091319	Xã Hải Thiện	40913	0	\N	\N	\N	\N	\N	ht	409
4091321	Xã Hải Dương	40913	0	\N	\N	\N	\N	\N	hd	409
4091323	Xã Hải Trường	40913	0	\N	\N	\N	\N	\N	ht	409
4091325	Xã Hải Thành	40913	0	\N	\N	\N	\N	\N	ht	409
4091327	Xã Hải Phú	40913	0	\N	\N	\N	\N	\N	hp	409
4091329	Xã Hải Thọ	40913	0	\N	\N	\N	\N	\N	ht	409
4091331	Xã Hải Hòa	40913	0	\N	\N	\N	\N	\N	hh	409
4091333	Xã Hải Lệ	40913	0	\N	\N	\N	\N	\N	hl	409
4091335	Xã Hải Tân	40913	0	\N	\N	\N	\N	\N	ht	409
4091337	Xã Hải Thượng	40913	0	\N	\N	\N	\N	\N	ht	409
4091339	Xã Hải Sơn	40913	0	\N	\N	\N	\N	\N	hs	409
4091341	Xã Hải Chánh	40913	0	\N	\N	\N	\N	\N	hc	409
4091500	Không xác định	40915	0	\N	\N	\N	\N	\N	kx	409
4091501	Thị trấn Khe Sanh	40915	0	\N	\N	\N	\N	\N	ks	409
4091503	Thị trấn Lao Bảo	40915	0	\N	\N	\N	\N	\N	lb	409
4091505	Xã Hướng Lập	40915	0	\N	\N	\N	\N	\N	hl	409
4091507	Xã Hướng Phùng	40915	0	\N	\N	\N	\N	\N	hp	409
4091509	Xã Hướng Sơn	40915	0	\N	\N	\N	\N	\N	hs	409
4091511	Xã Hướng Linh	40915	0	\N	\N	\N	\N	\N	hl	409
4091513	Xã Tân Hợp	40915	0	\N	\N	\N	\N	\N	th	409
4091515	Xã Hướng Tân	40915	0	\N	\N	\N	\N	\N	ht	409
4091517	Xã Tân Thành	40915	0	\N	\N	\N	\N	\N	tt	409
4091519	Xã Tân Long	40915	0	\N	\N	\N	\N	\N	tl	409
4091521	Xã Tân Lập	40915	0	\N	\N	\N	\N	\N	tl	409
4091523	Xã Tân Liên	40915	0	\N	\N	\N	\N	\N	tl	409
4091525	Xã Húc	40915	0	\N	\N	\N	\N	\N	h	409
4091527	Xã Thuận	40915	0	\N	\N	\N	\N	\N	t	409
4091529	Xã Hướng Lộc	40915	0	\N	\N	\N	\N	\N	hl	409
4091531	Xã Ba Tầng	40915	0	\N	\N	\N	\N	\N	bt	409
4091533	Xã Thanh	40915	0	\N	\N	\N	\N	\N	t	409
4091535	Xã  A Dơi	40915	0	\N	\N	\N	\N	\N	ad	409
4091537	Xã A Xing	40915	0	\N	\N	\N	\N	\N	ax	409
4091541	Xã Xy	40915	0	\N	\N	\N	\N	\N	x	409
4091700	Không xác định	40917	0	\N	\N	\N	\N	\N	kx	409
4091701	Xã Mò ó	40917	0	\N	\N	\N	\N	\N	mó	409
4091703	Xã Hướng Hiệp	40917	0	\N	\N	\N	\N	\N	hh	409
4091705	Xã Đa Krông	40917	0	\N	\N	\N	\N	\N	dk	409
4091707	Xã Triệu Nguyên	40917	0	\N	\N	\N	\N	\N	tn	409
4091709	Xã Ba Lòng	40917	0	\N	\N	\N	\N	\N	bl	409
4091711	Xã Hải Phúc	40917	0	\N	\N	\N	\N	\N	hp	409
4091713	Xã Ba Nang	40917	0	\N	\N	\N	\N	\N	bn	409
4091715	Xã Tà Long	40917	0	\N	\N	\N	\N	\N	tl	409
4091717	Xã Húc Nghì	40917	0	\N	\N	\N	\N	\N	hn	409
4091719	Xã A Vao	40917	0	\N	\N	\N	\N	\N	av	409
4091721	Xã Tà Rụt	40917	0	\N	\N	\N	\N	\N	tr	409
4091723	Xã A Bung	40917	0	\N	\N	\N	\N	\N	ab	409
4091725	Xã A Ngo	40917	0	\N	\N	\N	\N	\N	an	409
4110000	Không xác định	41100	0	\N	\N	\N	\N	\N	kx	411
4110100	Không xác định	41101	0	\N	\N	\N	\N	\N	kx	411
4110101	Phường Phú Thuận	41101	0	\N	\N	\N	\N	\N	pt	411
4110103	Phường Phú Bình	41101	0	\N	\N	\N	\N	\N	pb	411
4110105	Phường Tây Lộc	41101	0	\N	\N	\N	\N	\N	tl	411
4110107	Phường Thuận Lộc	41101	0	\N	\N	\N	\N	\N	tl	411
4110109	Phường Phú Hiệp	41101	0	\N	\N	\N	\N	\N	ph	411
4110111	Phường Phú Hậu	41101	0	\N	\N	\N	\N	\N	ph	411
4110113	Phường Thuận Hòa	41101	0	\N	\N	\N	\N	\N	th	411
4110115	Phường Thuận Thành	41101	0	\N	\N	\N	\N	\N	tt	411
4110117	Phường Phú Hòa	41101	0	\N	\N	\N	\N	\N	ph	411
4110119	Phường Phú Cát	41101	0	\N	\N	\N	\N	\N	pc	411
4110121	Phường Kim Long	41101	0	\N	\N	\N	\N	\N	kl	411
4110123	Phường Vĩ Dạ	41101	0	\N	\N	\N	\N	\N	vd	411
4110125	Phường Phường Đúc	41101	0	\N	\N	\N	\N	\N	pd	411
4110127	Phường Vĩnh Ninh	41101	0	\N	\N	\N	\N	\N	vn	411
4110129	Phường Phú Hội	41101	0	\N	\N	\N	\N	\N	ph	411
4110131	Phường Phú Nhuận	41101	0	\N	\N	\N	\N	\N	pn	411
4110133	Phường Xuân Phú	41101	0	\N	\N	\N	\N	\N	xp	411
4110135	Phường Trường An	41101	0	\N	\N	\N	\N	\N	ta	411
4110137	Phường Phước Vĩnh	41101	0	\N	\N	\N	\N	\N	pv	411
4110139	Phường An Cựu	41101	0	\N	\N	\N	\N	\N	ac	411
4110141	Xã Hương Sơ	41101	0	\N	\N	\N	\N	\N	hs	411
4110143	Xã Thủy Biều	41101	0	\N	\N	\N	\N	\N	tb	411
4110145	Xã Hương Long	41101	0	\N	\N	\N	\N	\N	hl	411
4110147	Xã Thủy Xuân	41101	0	\N	\N	\N	\N	\N	tx	411
4110149	Xã Thủy An	41101	0	\N	\N	\N	\N	\N	ta	411
4110300	Không xác định	41103	0	\N	\N	\N	\N	\N	kx	411
4110301	Thị trấn Phong Điền	41103	0	\N	\N	\N	\N	\N	pd	411
4110303	Xã Điền Hương	41103	0	\N	\N	\N	\N	\N	dh	411
4110305	Xã Điền Môn	41103	0	\N	\N	\N	\N	\N	dm	411
4110307	Xã Phong Bình	41103	0	\N	\N	\N	\N	\N	pb	411
4110309	Xã Phong Chương	41103	0	\N	\N	\N	\N	\N	pc	411
4110311	Xã Điền Lộc	41103	0	\N	\N	\N	\N	\N	dl	411
4110313	Xã Phong Hòa	41103	0	\N	\N	\N	\N	\N	ph	411
4110315	Xã Điền Hòa	41103	0	\N	\N	\N	\N	\N	dh	411
4110317	Xã Phong Hải	41103	0	\N	\N	\N	\N	\N	ph	411
4110319	Xã Điền Hải	41103	0	\N	\N	\N	\N	\N	dh	411
4110321	Xã Phong Mỹ	41103	0	\N	\N	\N	\N	\N	pm	411
4110323	Xã Phong Thu	41103	0	\N	\N	\N	\N	\N	pt	411
4110325	Xã Phong Hiền	41103	0	\N	\N	\N	\N	\N	ph	411
4110327	Xã Phong An	41103	0	\N	\N	\N	\N	\N	pa	411
4110329	Xã Phong Xuân	41103	0	\N	\N	\N	\N	\N	px	411
4110331	Xã Phong Sơn	41103	0	\N	\N	\N	\N	\N	ps	411
4110500	Không xác định	41105	0	\N	\N	\N	\N	\N	kx	411
4110501	Thị trấn Sịa	41105	0	\N	\N	\N	\N	\N	s	411
4110503	Xã Quảng Thái	41105	0	\N	\N	\N	\N	\N	qt	411
4110505	Xã Quảng Lợi	41105	0	\N	\N	\N	\N	\N	ql	411
4110507	Xã Quảng Ngạn	41105	0	\N	\N	\N	\N	\N	qn	411
4110509	Xã Quảng Vinh	41105	0	\N	\N	\N	\N	\N	qv	411
4110511	Xã Quảng Phước	41105	0	\N	\N	\N	\N	\N	qp	411
4110513	Xã Quảng Công	41105	0	\N	\N	\N	\N	\N	qc	411
4110515	Xã Quảng Phú	41105	0	\N	\N	\N	\N	\N	qp	411
4110517	Xã Quảng Thọ	41105	0	\N	\N	\N	\N	\N	qt	411
4110519	Xã Quảng An	41105	0	\N	\N	\N	\N	\N	qa	411
4110521	Xã Quảng Thành	41105	0	\N	\N	\N	\N	\N	qt	411
4110700	Không xác định	41107	0	\N	\N	\N	\N	\N	kx	411
4110701	Thị trấn Tứ Hạ	41107	0	\N	\N	\N	\N	\N	th	411
4110703	Xã Hải Dương	41107	0	\N	\N	\N	\N	\N	hd	411
4110705	Xã Hương Phong	41107	0	\N	\N	\N	\N	\N	hp	411
4110707	Xã Hương Vân	41107	0	\N	\N	\N	\N	\N	hv	411
4110709	Xã Hương Văn	41107	0	\N	\N	\N	\N	\N	hv	411
4110711	Xã Hương Toàn	41107	0	\N	\N	\N	\N	\N	ht	411
4110713	Xã Hương Vinh	41107	0	\N	\N	\N	\N	\N	hv	411
4110715	Xã Hương Xuân	41107	0	\N	\N	\N	\N	\N	hx	411
4110717	Xã Hương Chữ	41107	0	\N	\N	\N	\N	\N	hc	411
4110719	Xã Hương An	41107	0	\N	\N	\N	\N	\N	ha	411
4110721	Xã Hương Bình	41107	0	\N	\N	\N	\N	\N	hb	411
4110723	Xã Hương Hồ	41107	0	\N	\N	\N	\N	\N	hh	411
4110725	Xã Hồng Tiến	41107	0	\N	\N	\N	\N	\N	ht	411
4110727	Xã Bình Điền	41107	0	\N	\N	\N	\N	\N	bd	411
4110729	Xã Bình Thành	41107	0	\N	\N	\N	\N	\N	bt	411
4110731	Xã Hương Thọ	41107	0	\N	\N	\N	\N	\N	ht	411
4110900	Không xác định	41109	0	\N	\N	\N	\N	\N	kx	411
4110901	Xã Phú Tân	41109	0	\N	\N	\N	\N	\N	pt	411
4110903	Xã Thuận An	41109	0	\N	\N	\N	\N	\N	ta	411
4110905	Xã Phú Thanh	41109	0	\N	\N	\N	\N	\N	pt	411
4110907	Xã Phú Mậu	41109	0	\N	\N	\N	\N	\N	pm	411
4110909	Xã Phú Dương	41109	0	\N	\N	\N	\N	\N	pd	411
4110911	Xã Phú Thuận	41109	0	\N	\N	\N	\N	\N	pt	411
4110913	Xã Phú Thượng	41109	0	\N	\N	\N	\N	\N	pt	411
4110915	Xã Phú Mỹ	41109	0	\N	\N	\N	\N	\N	pm	411
4110917	Xã Phú An	41109	0	\N	\N	\N	\N	\N	pa	411
4110919	Xã Phú Xuân	41109	0	\N	\N	\N	\N	\N	px	411
4110921	Xã Phú Hồ	41109	0	\N	\N	\N	\N	\N	ph	411
4110923	Xã Phú Hải	41109	0	\N	\N	\N	\N	\N	ph	411
4110925	Xã Phú Diên	41109	0	\N	\N	\N	\N	\N	pd	411
4110927	Xã Phú Lương	41109	0	\N	\N	\N	\N	\N	pl	411
4110929	Xã Phú Đa	41109	0	\N	\N	\N	\N	\N	pd	411
4110931	Xã Vinh Xuân	41109	0	\N	\N	\N	\N	\N	vx	411
4110933	Xã Vinh Thanh	41109	0	\N	\N	\N	\N	\N	vt	411
4110935	Xã Vinh Thái	41109	0	\N	\N	\N	\N	\N	vt	411
4110937	Xã Vinh Phú	41109	0	\N	\N	\N	\N	\N	vp	411
4110939	Xã Vinh An	41109	0	\N	\N	\N	\N	\N	va	411
4110941	Xã Vinh Hà	41109	0	\N	\N	\N	\N	\N	vh	411
4111100	Không xác định	41111	0	\N	\N	\N	\N	\N	kx	411
4111101	Thị trấn Phú Bài	41111	0	\N	\N	\N	\N	\N	pb	411
4111103	Xã Thủy Vân	41111	0	\N	\N	\N	\N	\N	tv	411
4111105	Xã Thủy Thanh	41111	0	\N	\N	\N	\N	\N	tt	411
4111107	Xã Thủy Dương	41111	0	\N	\N	\N	\N	\N	td	411
4111109	Xã Thủy Bằng	41111	0	\N	\N	\N	\N	\N	tb	411
4111111	Xã Thủy Phương	41111	0	\N	\N	\N	\N	\N	tp	411
4111113	Xã Thủy Châu	41111	0	\N	\N	\N	\N	\N	tc	411
4111115	Xã Thủy Lương	41111	0	\N	\N	\N	\N	\N	tl	411
4111117	Xã Thủy Tân	41111	0	\N	\N	\N	\N	\N	tt	411
4111119	Xã Thủy Phù	41111	0	\N	\N	\N	\N	\N	tp	411
4111121	Xã Dương Hòa	41111	0	\N	\N	\N	\N	\N	dh	411
4111123	Xã Phú Sơn	41111	0	\N	\N	\N	\N	\N	ps	411
4111300	Không xác định	41113	0	\N	\N	\N	\N	\N	kx	411
4111301	Thị trấn Phú Lộc	41113	0	\N	\N	\N	\N	\N	pl	411
4111303	Xã Vinh Hưng	41113	0	\N	\N	\N	\N	\N	vh	411
4111305	Xã Lộc Bổn	41113	0	\N	\N	\N	\N	\N	lb	411
4111307	Xã Lộc An	41113	0	\N	\N	\N	\N	\N	la	411
4111309	Xã Lộc Sơn	41113	0	\N	\N	\N	\N	\N	ls	411
4111311	Xã Vinh Mỹ	41113	0	\N	\N	\N	\N	\N	vm	411
4111313	Xã Vinh Hải	41113	0	\N	\N	\N	\N	\N	vh	411
4111315	Xã Vinh Giang	41113	0	\N	\N	\N	\N	\N	vg	411
4111317	Xã Vinh Hiền	41113	0	\N	\N	\N	\N	\N	vh	411
4111319	Xã Xuân Lộc	41113	0	\N	\N	\N	\N	\N	xl	411
4111321	Xã Lộc Hòa	41113	0	\N	\N	\N	\N	\N	lh	411
4111323	Xã Lộc Điền	41113	0	\N	\N	\N	\N	\N	ld	411
4111325	Xã Lộc Bình	41113	0	\N	\N	\N	\N	\N	lb	411
4111327	Xã Lộc Trì	41113	0	\N	\N	\N	\N	\N	lt	411
4111329	Xã Lộc Thủy	41113	0	\N	\N	\N	\N	\N	lt	411
4111331	Xã Lộc Vĩnh	41113	0	\N	\N	\N	\N	\N	lv	411
4111333	Xã Lộc Tiến	41113	0	\N	\N	\N	\N	\N	lt	411
4111335	Xã Lộc Hải	41113	0	\N	\N	\N	\N	\N	lh	411
4111500	Không xác định	41115	0	\N	\N	\N	\N	\N	kx	411
4111501	Thị trấn A Lưới	41115	0	\N	\N	\N	\N	\N	al	411
4111503	Xã Hồng Thủy	41115	0	\N	\N	\N	\N	\N	ht	411
4111505	Xã Hồng Vân	41115	0	\N	\N	\N	\N	\N	hv	411
4111507	Xã Hồng Trung	41115	0	\N	\N	\N	\N	\N	ht	411
4111509	Xã Bắc Sơn	41115	0	\N	\N	\N	\N	\N	bs	411
4111511	Xã Hồng Kim	41115	0	\N	\N	\N	\N	\N	hk	411
4111513	Xã Hồng Bắc	41115	0	\N	\N	\N	\N	\N	hb	411
4111515	Xã Hồng Quảng	41115	0	\N	\N	\N	\N	\N	hq	411
4111517	Xã Nhâm	41115	0	\N	\N	\N	\N	\N	n	411
4111519	Xã A Ngo	41115	0	\N	\N	\N	\N	\N	an	411
4111521	Xã Sơn Thủy	41115	0	\N	\N	\N	\N	\N	st	411
4111523	Xã Phú Vinh	41115	0	\N	\N	\N	\N	\N	pv	411
4111525	Xã Hồng Hạ	41115	0	\N	\N	\N	\N	\N	hh	411
4111527	Xã Hồng Thái	41115	0	\N	\N	\N	\N	\N	ht	411
4111529	Xã Hồng Thượng	41115	0	\N	\N	\N	\N	\N	ht	411
4111531	Xã Hương Phong	41115	0	\N	\N	\N	\N	\N	hp	411
4111533	Xã Hương Lâm	41115	0	\N	\N	\N	\N	\N	hl	411
4111535	Xã Đông Sơn	41115	0	\N	\N	\N	\N	\N	ds	411
4111537	Xã A Đớt	41115	0	\N	\N	\N	\N	\N	ad	411
4111539	Xã A Roằng	41115	0	\N	\N	\N	\N	\N	ar	411
4111541	Xã Hương Nguyên	41115	0	\N	\N	\N	\N	\N	hn	411
4111700	Không xác định	41117	0	\N	\N	\N	\N	\N	kx	411
4111701	Thị trấn Khe Tre	41117	0	\N	\N	\N	\N	\N	kt	411
4111703	Xã Hương Phú	41117	0	\N	\N	\N	\N	\N	hp	411
4111705	Xã Hương Sơn	41117	0	\N	\N	\N	\N	\N	hs	411
4111707	Xã Thượng Quảng	41117	0	\N	\N	\N	\N	\N	tq	411
4111709	Xã Hương Hữu	41117	0	\N	\N	\N	\N	\N	hh	411
4111711	Xã Hương Giang	41117	0	\N	\N	\N	\N	\N	hg	411
4111713	Xã Hương Hoà	41117	0	\N	\N	\N	\N	\N	hh	411
4111715	Xã Hương Lộc	41117	0	\N	\N	\N	\N	\N	hl	411
4111717	Xã Thượng Long	41117	0	\N	\N	\N	\N	\N	tl	411
4111719	Xã Thượng Nhật	41117	0	\N	\N	\N	\N	\N	tn	411
4111721	Xã Thượng Lộ	41117	0	\N	\N	\N	\N	\N	tl	411
5010000	Không xác định	50100	0	\N	\N	\N	\N	\N	kx	501
5010100	Không xác định	50101	0	\N	\N	\N	\N	\N	kx	501
5010101	Phường Hải Châu  I	50101	0	\N	\N	\N	\N	\N	hci	501
5010103	Phường Hải Châu II	50101	0	\N	\N	\N	\N	\N	hci	501
5010105	Phường Thạch Thang	50101	0	\N	\N	\N	\N	\N	tt	501
5010107	Phường Thanh Bình	50101	0	\N	\N	\N	\N	\N	tb	501
5010109	Phường Thuận Phước	50101	0	\N	\N	\N	\N	\N	tp	501
5010111	Phường Bình Thuận	50101	0	\N	\N	\N	\N	\N	bt	501
5010113	Phường Hoà Thuận	50101	0	\N	\N	\N	\N	\N	ht	501
5010115	Phường Nam Dương	50101	0	\N	\N	\N	\N	\N	nd	501
5010117	Phường Phước Ninh	50101	0	\N	\N	\N	\N	\N	pn	501
5010119	Phường Bình Hiên	50101	0	\N	\N	\N	\N	\N	bh	501
5010121	Phường Hoà Cường	50101	0	\N	\N	\N	\N	\N	hc	501
5010123	Phường Khuê Trung	50101	0	\N	\N	\N	\N	\N	kt	501
5010300	Không xác định	50103	0	\N	\N	\N	\N	\N	kx	501
5010301	Phường An Khê	50103	0	\N	\N	\N	\N	\N	ak	501
5010303	Phường Thanh Lộc Đán	50103	0	\N	\N	\N	\N	\N	tld	501
5010305	Phường Xuân Hà	50103	0	\N	\N	\N	\N	\N	xh	501
5010307	Phường Tam Thuận	50103	0	\N	\N	\N	\N	\N	tt	501
5010309	Phường Vĩnh Trung	50103	0	\N	\N	\N	\N	\N	vt	501
5010311	Phường Tân Chính	50103	0	\N	\N	\N	\N	\N	tc	501
5010313	Phường Thạc Gián	50103	0	\N	\N	\N	\N	\N	tg	501
5010315	Phường Chính Gián	50103	0	\N	\N	\N	\N	\N	cg	501
5010500	Không xác định	50105	0	\N	\N	\N	\N	\N	kx	501
5010501	Phường An Hải Tây	50105	0	\N	\N	\N	\N	\N	aht	501
5010503	Phường An Hải Bắc	50105	0	\N	\N	\N	\N	\N	ahb	501
5010505	Phường Nại Hiên Đông	50105	0	\N	\N	\N	\N	\N	nhd	501
5010507	Phường Mân Thái	50105	0	\N	\N	\N	\N	\N	mt	501
5010509	Phường Phước Mỹ	50105	0	\N	\N	\N	\N	\N	pm	501
5010511	Phường Thọ Quang	50105	0	\N	\N	\N	\N	\N	tq	501
5010513	Phường An Hải Đông	50105	0	\N	\N	\N	\N	\N	ahd	501
5010700	Không xác định	50107	0	\N	\N	\N	\N	\N	kx	501
5010701	Phường Bắc Mỹ An	50107	0	\N	\N	\N	\N	\N	bma	501
5010703	Phường Hoà Quý	50107	0	\N	\N	\N	\N	\N	hq	501
5010705	Phường Hoà Hải	50107	0	\N	\N	\N	\N	\N	hh	501
5010900	Không xác định	50109	0	\N	\N	\N	\N	\N	kx	501
5010901	Phường Hoà Hiệp	50109	0	\N	\N	\N	\N	\N	hh	501
5010903	Phường Hoà Khánh	50109	0	\N	\N	\N	\N	\N	hk	501
5010905	Phường Hoà Minh	50109	0	\N	\N	\N	\N	\N	hm	501
5011100	Không xác định	50111	0	\N	\N	\N	\N	\N	kx	501
5011101	Xã Hoà Thọ	50111	0	\N	\N	\N	\N	\N	ht	501
5011103	Xã Hoà Bắc	50111	0	\N	\N	\N	\N	\N	hb	501
5011105	Xã Hoà Ninh	50111	0	\N	\N	\N	\N	\N	hn	501
5011107	Xã Hoà Sơn	10611	0	\N	\N	\N	\N	\N	hs	501
5011109	Xã Hoà Phát	50111	0	\N	\N	\N	\N	\N	hp	501
5011111	Xã Hoà Tiến	50111	0	\N	\N	\N	\N	\N	ht	501
5011113	Xã Hoà Châu	50111	0	\N	\N	\N	\N	\N	hc	501
5011115	Xã Hoà Phước	50111	0	\N	\N	\N	\N	\N	hp	501
5011117	Xã Hoà Liên	50111	0	\N	\N	\N	\N	\N	hl	501
5011119	Xã Hoà Xuân	50111	0	\N	\N	\N	\N	\N	hx	501
5011121	Xã Hoà Nhơn	50111	0	\N	\N	\N	\N	\N	hn	501
5011123	Xã Hoà Phong	50111	0	\N	\N	\N	\N	\N	hp	501
5011125	Xã Hoà Khương	50111	0	\N	\N	\N	\N	\N	hk	501
5011127	Xã Hoà Phú	50111	0	\N	\N	\N	\N	\N	hp	501
5011300	Không xác định	50113	0	\N	\N	\N	\N	\N	kx	501
5030000	Không xác định	50300	0	\N	\N	\N	\N	\N	kx	503
5030100	Không xác định	50301	0	\N	\N	\N	\N	\N	kx	503
5030101	Phường Tân Thạnh	50301	0	\N	\N	\N	\N	\N	tt	503
5030103	Phường An Mỹ	50301	0	\N	\N	\N	\N	\N	am	503
5030105	Phường Trường Xuân	50301	0	\N	\N	\N	\N	\N	tx	503
5030107	Phường An Xuân	50301	0	\N	\N	\N	\N	\N	ax	503
5030109	Phường Phước Hòa	50301	0	\N	\N	\N	\N	\N	ph	503
5030111	Phường An Sơn	50301	0	\N	\N	\N	\N	\N	as	503
5030113	Phường Hòa Hương	50301	0	\N	\N	\N	\N	\N	hh	503
5030115	Xã Tam Thành	50301	0	\N	\N	\N	\N	\N	tt	503
5030117	Xã Tam Lộc	50301	0	\N	\N	\N	\N	\N	tl	503
5030119	Xã Tam Phước	50301	0	\N	\N	\N	\N	\N	tp	503
5030121	Xã Tam An	50301	0	\N	\N	\N	\N	\N	ta	503
5030123	Xã Tam Đàn	50301	0	\N	\N	\N	\N	\N	td	503
5030125	Xã Tam Thăng	50301	0	\N	\N	\N	\N	\N	tt	503
5030127	Xã Tam Thanh	50301	0	\N	\N	\N	\N	\N	tt	503
5030129	Xã Tam Vinh	50301	0	\N	\N	\N	\N	\N	tv	503
5030131	Xã Tam Dân	50301	0	\N	\N	\N	\N	\N	td	503
5030133	Xã Tam Thái	50301	0	\N	\N	\N	\N	\N	tt	503
5030135	Xã Tam Ngọc	50301	0	\N	\N	\N	\N	\N	tn	503
5030137	Xã Tam Phú	50301	0	\N	\N	\N	\N	\N	tp	503
5030139	Xã Tam Lãnh	50301	0	\N	\N	\N	\N	\N	tl	503
5030300	Không xác định	50303	0	\N	\N	\N	\N	\N	kx	503
5030301	Phường Minh An	50303	0	\N	\N	\N	\N	\N	ma	503
5030303	Phường Cẩm Phô	50303	0	\N	\N	\N	\N	\N	cp	503
5030305	Phường Sơn Phong	50303	0	\N	\N	\N	\N	\N	sp	503
5030307	Xã Cẩm Hà	50303	0	\N	\N	\N	\N	\N	ch	503
5030309	Xã Cẩm Châu	50303	0	\N	\N	\N	\N	\N	cc	503
5030311	Xã Cẩm An	50303	0	\N	\N	\N	\N	\N	ca	503
5030313	Xã Cẩm Kim	50303	0	\N	\N	\N	\N	\N	ck	503
5030315	Xã Cẩm Nam	50303	0	\N	\N	\N	\N	\N	cn	503
5030317	Xã Cẩm Thanh	50303	0	\N	\N	\N	\N	\N	ct	503
5030319	Xã Tân Hiệp	50303	0	\N	\N	\N	\N	\N	th	503
5030500	Không xác định	50305	0	\N	\N	\N	\N	\N	kx	503
5030501	Thị trấn P Rao	50305	0	\N	\N	\N	\N	\N	pr	503
5030503	Xã Ch om	50305	0	\N	\N	\N	\N	\N	c	503
5030505	Xã A Xan	50305	0	\N	\N	\N	\N	\N	ax	503
5030507	Xã Tr Hy	50305	0	\N	\N	\N	\N	\N	th	503
5030509	Xã Lăng	50305	0	\N	\N	\N	\N	\N	l	503
5030511	Xã A Tiêng	50305	0	\N	\N	\N	\N	\N	at	503
5030513	Xã Bhallê	50305	0	\N	\N	\N	\N	\N	b	503
5030515	Xã A Vương	50305	0	\N	\N	\N	\N	\N	av	503
5030517	Xã Tà Lu	50305	0	\N	\N	\N	\N	\N	tl	503
5030519	Xã Sông Kôn	50305	0	\N	\N	\N	\N	\N	sk	503
5030521	Xã A Ting	50305	0	\N	\N	\N	\N	\N	at	503
5030523	Xã  Tư	50305	0	\N	\N	\N	\N	\N	t	503
5030525	Xã Ba	50305	0	\N	\N	\N	\N	\N	b	503
5030527	Xã Dang	50305	0	\N	\N	\N	\N	\N	d	503
5030529	Xã A Rooih	50305	0	\N	\N	\N	\N	\N	ar	503
5030531	Xã Za Hung	50305	0	\N	\N	\N	\N	\N	zh	503
5030533	Xã Ma Cooih	50305	0	\N	\N	\N	\N	\N	mc	503
5030535	Xã Kà Dăng	50305	0	\N	\N	\N	\N	\N	kd	503
5030700	Không xác định	50307	0	\N	\N	\N	\N	\N	kx	503
5030701	Thị trấn ái Nghĩa	50307	0	\N	\N	\N	\N	\N	an	503
5030703	Xã Đại Sơn	50307	0	\N	\N	\N	\N	\N	ds	503
5030705	Xã Đại Lãnh	50307	0	\N	\N	\N	\N	\N	dl	503
5030707	Xã Đại Hồng	50307	0	\N	\N	\N	\N	\N	dh	503
5030709	Xã Đại Đồng	50307	0	\N	\N	\N	\N	\N	dd	503
5030711	Xã Đại Quang	50307	0	\N	\N	\N	\N	\N	dq	503
5030713	Xã Đại Nghĩa	50307	0	\N	\N	\N	\N	\N	dn	503
5030715	Xã Đại Hiệp	50307	0	\N	\N	\N	\N	\N	dh	503
5030717	Xã Đại Thạnh	50307	0	\N	\N	\N	\N	\N	dt	503
5030719	Xã Đại Chánh	50307	0	\N	\N	\N	\N	\N	dc	503
5030721	Xã Đại Tân	50307	0	\N	\N	\N	\N	\N	dt	503
5030723	Xã Đại Phong	50307	0	\N	\N	\N	\N	\N	dp	503
5030725	Xã Đại Minh	50307	0	\N	\N	\N	\N	\N	dm	503
5030727	Xã Đại Thắng	50307	0	\N	\N	\N	\N	\N	dt	503
5030729	Xã Đại Cường	50307	0	\N	\N	\N	\N	\N	dc	503
5030731	Xã Đại Hòa	50307	0	\N	\N	\N	\N	\N	dh	503
5030900	Không xác định	50309	0	\N	\N	\N	\N	\N	kx	503
5030901	Thị trấn Vĩnh Điện	50309	0	\N	\N	\N	\N	\N	vd	503
5030903	Xã Điện Tiến	50309	0	\N	\N	\N	\N	\N	dt	503
5030905	Xã Điện Hòa	50309	0	\N	\N	\N	\N	\N	dh	503
5030907	Xã Điện Thắng	50309	0	\N	\N	\N	\N	\N	dt	503
5030909	Xã Điện Ngọc	50309	0	\N	\N	\N	\N	\N	dn	503
5030911	Xã Điện Hồng	50309	0	\N	\N	\N	\N	\N	dh	503
5030913	Xã Điện Thọ	50309	0	\N	\N	\N	\N	\N	dt	503
5030915	Xã Điện Phước	50309	0	\N	\N	\N	\N	\N	dp	503
5030917	Xã Điện An	50309	0	\N	\N	\N	\N	\N	da	503
5030919	Xã Điện Nam	50309	0	\N	\N	\N	\N	\N	dn	503
5030921	Xã Điện Dương	50309	0	\N	\N	\N	\N	\N	dd	503
5030923	Xã Điện Quang	50309	0	\N	\N	\N	\N	\N	dq	503
5030925	Xã Điện Trung	50309	0	\N	\N	\N	\N	\N	dt	503
5030927	Xã Điện Phong	50309	0	\N	\N	\N	\N	\N	dp	503
5030929	Xã Điện Minh	50309	0	\N	\N	\N	\N	\N	dm	503
5030931	Xã Điện Phương	50309	0	\N	\N	\N	\N	\N	dp	503
5031100	Không xác định	50311	0	\N	\N	\N	\N	\N	kx	503
5031101	Thị trấn Nam Phước	50311	0	\N	\N	\N	\N	\N	np	503
5031103	Xã Duy Thu	50311	0	\N	\N	\N	\N	\N	dt	503
5031105	Xã Duy Phú	50311	0	\N	\N	\N	\N	\N	dp	503
5031107	Xã Duy Tân	50311	0	\N	\N	\N	\N	\N	dt	503
5031109	Xã Duy Hòa	50311	0	\N	\N	\N	\N	\N	dh	503
5031111	Xã Duy Châu	50311	0	\N	\N	\N	\N	\N	dc	503
5031113	Xã Duy Trinh	50311	0	\N	\N	\N	\N	\N	dt	503
5031115	Xã Duy Sơn	50311	0	\N	\N	\N	\N	\N	ds	503
5031117	Xã Duy Trung	50311	0	\N	\N	\N	\N	\N	dt	503
5031119	Xã Duy Phước	50311	0	\N	\N	\N	\N	\N	dp	503
5031121	Xã Duy Thành	50311	0	\N	\N	\N	\N	\N	dt	503
5031123	Xã Duy Vinh	50311	0	\N	\N	\N	\N	\N	dv	503
5031125	Xã Duy Nghĩa	50311	0	\N	\N	\N	\N	\N	dn	503
5031127	Xã Duy Hải	50311	0	\N	\N	\N	\N	\N	dh	503
5031300	Không xác định	50313	0	\N	\N	\N	\N	\N	kx	503
5031301	Thị trấn Thạnh Mỹ	50313	0	\N	\N	\N	\N	\N	tm	503
5031303	Xã Laêê	50313	0	\N	\N	\N	\N	\N	l	503
5031305	Xã Zuoih	50313	0	\N	\N	\N	\N	\N	zh	503
5031307	Xã LaDêê	50313	0	\N	\N	\N	\N	\N	l	503
5031309	Xã Chàvàl	50313	0	\N	\N	\N	\N	\N	c	503
5031311	Xã Tà Bhing	50313	0	\N	\N	\N	\N	\N	tb	503
5031313	Xã Cà Dy	50313	0	\N	\N	\N	\N	\N	cd	503
5031315	Xã Đacpree	50313	0	\N	\N	\N	\N	\N	d	503
5031317	Xã Đacpring	50313	0	\N	\N	\N	\N	\N	d	503
5031500	Không xác định	50315	0	\N	\N	\N	\N	\N	kx	503
5031501	Thị trấn Hà Lam	50315	0	\N	\N	\N	\N	\N	hl	503
5031503	Xã Bình Dương	50315	0	\N	\N	\N	\N	\N	bd	503
5031505	Xã Bình Giang	50315	0	\N	\N	\N	\N	\N	bg	503
5031507	Xã Bình Nguyên	50315	0	\N	\N	\N	\N	\N	bn	503
5031509	Xã Bình Phục	50315	0	\N	\N	\N	\N	\N	bp	503
5031511	Xã Bình Triều	50315	0	\N	\N	\N	\N	\N	bt	503
5031513	Xã Bình Đào	50315	0	\N	\N	\N	\N	\N	bd	503
5031515	Xã Bình Minh	50315	0	\N	\N	\N	\N	\N	bm	503
5031517	Xã Bình Lãnh	50315	0	\N	\N	\N	\N	\N	bl	503
5031519	Xã Bình Trị	50315	0	\N	\N	\N	\N	\N	bt	503
5031521	Xã Bình Định	50315	0	\N	\N	\N	\N	\N	bd	503
5031523	Xã Bình Quý	50315	0	\N	\N	\N	\N	\N	bq	503
5031525	Xã Bình Phú	50315	0	\N	\N	\N	\N	\N	bp	503
5031527	Xã Bình Chánh	50315	0	\N	\N	\N	\N	\N	bc	503
5031529	Xã Bình Tú	50315	0	\N	\N	\N	\N	\N	bt	503
5031531	Xã Bình Sa	50315	0	\N	\N	\N	\N	\N	bs	503
5031533	Xã Bình Hải	50315	0	\N	\N	\N	\N	\N	bh	503
5031535	Xã Bình Quế	50315	0	\N	\N	\N	\N	\N	bq	503
5031537	Xã Bình An	50315	0	\N	\N	\N	\N	\N	ba	503
5031539	Xã Bình Trung	50315	0	\N	\N	\N	\N	\N	bt	503
5031541	Xã Bình Nam	50315	0	\N	\N	\N	\N	\N	bn	503
5031700	Không xác định	50317	0	\N	\N	\N	\N	\N	kx	503
5031701	Thị trấn Đông Phú	50317	0	\N	\N	\N	\N	\N	dp	503
5031703	Xã Quế Phước	50317	0	\N	\N	\N	\N	\N	qp	503
5031705	Xã Quế Lâm	50317	0	\N	\N	\N	\N	\N	ql	503
5031707	Xã Quế Ninh	50317	0	\N	\N	\N	\N	\N	qn	503
5031709	Xã Quế Trung	50317	0	\N	\N	\N	\N	\N	qt	503
5031711	Xã Quế Lộc	50317	0	\N	\N	\N	\N	\N	ql	503
5031713	Xã Quế Phong	50317	0	\N	\N	\N	\N	\N	qp	503
5031715	Xã Quế Long	50317	0	\N	\N	\N	\N	\N	ql	503
5031717	Xã Quế Hiệp	50317	0	\N	\N	\N	\N	\N	qh	503
5031719	Xã Quế Xuân	50317	0	\N	\N	\N	\N	\N	qx	503
5031721	Xã Quế Phú	50317	0	\N	\N	\N	\N	\N	qp	503
5031723	Xã Quế An	50317	0	\N	\N	\N	\N	\N	qa	503
5031725	Xã Quế Minh	50317	0	\N	\N	\N	\N	\N	qm	503
5031727	Xã Quế Châu	50317	0	\N	\N	\N	\N	\N	qc	503
5031729	Xã Quế Thuận	50317	0	\N	\N	\N	\N	\N	qt	503
5031731	Xã Phú Thọ	50317	0	\N	\N	\N	\N	\N	pt	503
5031733	Xã Quế Cường	50317	0	\N	\N	\N	\N	\N	qc	503
5031900	Không xác định	50319	0	\N	\N	\N	\N	\N	kx	503
5031901	Thị trấn Tân An	50319	0	\N	\N	\N	\N	\N	ta	503
5031903	Xã Hiệp Hòa	50319	0	\N	\N	\N	\N	\N	hh	503
5031905	Xã Hiệp Thuận	50319	0	\N	\N	\N	\N	\N	ht	503
5031907	Xã Quế Thọ	50319	0	\N	\N	\N	\N	\N	qt	503
5031909	Xã Bình Lâm	50319	0	\N	\N	\N	\N	\N	bl	503
5031911	Xã Phước Trà	50319	0	\N	\N	\N	\N	\N	pt	503
5031913	Xã Phước Gia	50319	0	\N	\N	\N	\N	\N	pg	503
5031915	Xã Quế Bình	50319	0	\N	\N	\N	\N	\N	qb	503
5031917	Xã Quế Lưu	50319	0	\N	\N	\N	\N	\N	ql	503
5031919	Xã Thăng Phước	50319	0	\N	\N	\N	\N	\N	tp	503
5031921	Xã Bình Sơn	50319	0	\N	\N	\N	\N	\N	bs	503
5032100	Không xác định	50321	0	\N	\N	\N	\N	\N	kx	503
5032101	Thị trấn Tiên Kỳ	50321	0	\N	\N	\N	\N	\N	tk	503
5032103	Xã Tiên Sơn	50321	0	\N	\N	\N	\N	\N	ts	503
5032105	Xã Tiên Hà	50321	0	\N	\N	\N	\N	\N	th	503
5032107	Xã Tiên Cẩm	50321	0	\N	\N	\N	\N	\N	tc	503
5032109	Xã Tiên Châu	50321	0	\N	\N	\N	\N	\N	tc	503
5032111	Xã Tiên Lãnh	50321	0	\N	\N	\N	\N	\N	tl	503
5032113	Xã Tiên Ngọc	50321	0	\N	\N	\N	\N	\N	tn	503
5032115	Xã Tiên Hiệp	50321	0	\N	\N	\N	\N	\N	th	503
5032117	Xã Tiên Cảnh	50321	0	\N	\N	\N	\N	\N	tc	503
5032119	Xã Tiên Mỹ	50321	0	\N	\N	\N	\N	\N	tm	503
5032121	Xã Tiên Phong	50321	0	\N	\N	\N	\N	\N	tp	503
5032123	Xã Tiên Thọ	50321	0	\N	\N	\N	\N	\N	tt	503
5032125	Xã Tiên An	50321	0	\N	\N	\N	\N	\N	ta	503
5032127	Xã Tiên Lộc	50321	0	\N	\N	\N	\N	\N	tl	503
5032129	Xã Tiên Lập	50321	0	\N	\N	\N	\N	\N	tl	503
5032300	Không xác định	50323	0	\N	\N	\N	\N	\N	kx	503
5032301	Thị trấn Khâm Đức	50323	0	\N	\N	\N	\N	\N	kd	503
5032303	Xã Phước Hiệp	50323	0	\N	\N	\N	\N	\N	ph	503
5032305	Xã Phước Đức	50323	0	\N	\N	\N	\N	\N	pd	503
5032307	Xã Phước Năng	50323	0	\N	\N	\N	\N	\N	pn	503
5032309	Xã Phước Mỹ	50323	0	\N	\N	\N	\N	\N	pm	503
5032311	Xã Phước Chánh	50323	0	\N	\N	\N	\N	\N	pc	503
5032313	Xã Phước Công	50323	0	\N	\N	\N	\N	\N	pc	503
5032315	Xã Phước Kim	50323	0	\N	\N	\N	\N	\N	pk	503
5032317	Xã Phước Thành	50323	0	\N	\N	\N	\N	\N	pt	503
5032500	Không xác định	50325	0	\N	\N	\N	\N	\N	kx	503
5032501	Thị trấn Núi Thành	50325	0	\N	\N	\N	\N	\N	nt	503
5032503	Xã Tam Xuân I	50325	0	\N	\N	\N	\N	\N	txi	503
5032505	Xã Tam Xuân II	50325	0	\N	\N	\N	\N	\N	txi	503
5032507	Xã Tam Tiến	50325	0	\N	\N	\N	\N	\N	tt	503
5032509	Xã Tam Sơn	50325	0	\N	\N	\N	\N	\N	ts	503
5032511	Xã Tam Thạnh	50325	0	\N	\N	\N	\N	\N	tt	503
5032513	Xã Tam Anh	50325	0	\N	\N	\N	\N	\N	ta	503
5032515	Xã Tam Hòa	50325	0	\N	\N	\N	\N	\N	th	503
5032517	Xã Tam Hiệp	50325	0	\N	\N	\N	\N	\N	th	503
5032519	Xã Tam Hải	50325	0	\N	\N	\N	\N	\N	th	503
5032521	Xã Tam Giang	50325	0	\N	\N	\N	\N	\N	tg	503
5032523	Xã Tam Quang	50325	0	\N	\N	\N	\N	\N	tq	503
5032525	Xã Tam Nghĩa	50325	0	\N	\N	\N	\N	\N	tn	503
5032527	Xã Tam Mỹ	50325	0	\N	\N	\N	\N	\N	tm	503
5032529	Xã Tam Trà	50325	0	\N	\N	\N	\N	\N	tt	503
5032700	Không xác định	50327	0	\N	\N	\N	\N	\N	kx	503
5032701	Thị trấn Trà My	50327	0	\N	\N	\N	\N	\N	tm	503
5032703	Xã Trà Kót	50327	0	\N	\N	\N	\N	\N	tk	503
5032705	Xã Trà Nú	50327	0	\N	\N	\N	\N	\N	tn	503
5032707	Xã Trà Đông	50327	0	\N	\N	\N	\N	\N	td	503
5032709	Xã Trà Dương	50327	0	\N	\N	\N	\N	\N	td	503
5032711	Xã Trà Giang	50327	0	\N	\N	\N	\N	\N	tg	503
5032713	Xã Trà Bui	50327	0	\N	\N	\N	\N	\N	tb	503
5032715	Xã Trà Đốc	50327	0	\N	\N	\N	\N	\N	td	503
5032717	Xã Trà Tân	50327	0	\N	\N	\N	\N	\N	tt	503
5032719	Xã Trà Leng	50327	0	\N	\N	\N	\N	\N	tl	503
5032721	Xã Trà Dơn	50327	0	\N	\N	\N	\N	\N	td	503
5032723	Xã Trà Giác	50327	0	\N	\N	\N	\N	\N	tg	503
5032725	Xã Trà Giáp	50327	0	\N	\N	\N	\N	\N	tg	503
5032727	Xã Trà Tập	50327	0	\N	\N	\N	\N	\N	tt	503
5032729	Xã Trà Mai	50327	0	\N	\N	\N	\N	\N	tm	503
5032731	Xã Trà Cang	50327	0	\N	\N	\N	\N	\N	tc	503
5032733	Xã Trà Linh	50327	0	\N	\N	\N	\N	\N	tl	503
5032735	Xã Trà Nam	50327	0	\N	\N	\N	\N	\N	tn	503
5032737	Xã Trà Don	50327	0	\N	\N	\N	\N	\N	td	503
5032739	Xã Trà Vân	50327	0	\N	\N	\N	\N	\N	tv	503
5032741	Xã Trà Vinh	50327	0	\N	\N	\N	\N	\N	tv	503
5050000	Không xác định	50500	0	\N	\N	\N	\N	\N	kx	505
5050100	Không xác định	50501	0	\N	\N	\N	\N	\N	kx	505
5050101	Phường Lê Hồng Phong	50501	0	\N	\N	\N	\N	\N	lhp	505
5050103	Phường Trần Phú	50501	0	\N	\N	\N	\N	\N	tp	505
5050105	Phường Trần Hưng Đạo	50501	0	\N	\N	\N	\N	\N	thd	505
5050107	Phường Nguyễn Nghiêm	50501	0	\N	\N	\N	\N	\N	nn	505
5050109	Phường Nghĩa Lộ	50501	0	\N	\N	\N	\N	\N	nl	505
5050111	Phường Chánh Lộ	50501	0	\N	\N	\N	\N	\N	cl	505
5050113	Xã Quảng Phú	50501	0	\N	\N	\N	\N	\N	qp	505
5050115	Xã Nghĩa Dõng	50501	0	\N	\N	\N	\N	\N	nd	505
5050117	Xã Nghĩa Chánh	50501	0	\N	\N	\N	\N	\N	nc	505
5050119	Xã Nghĩa Dũng	50501	0	\N	\N	\N	\N	\N	nd	505
5050300	Không xác định	50503	0	\N	\N	\N	\N	\N	kx	505
5050301	Xã Lý Vĩnh	50503	0	\N	\N	\N	\N	\N	lv	505
5050303	Xã Lý Hải	50503	0	\N	\N	\N	\N	\N	lh	505
5050500	Không xác định	50505	0	\N	\N	\N	\N	\N	kx	505
5050501	Thị trấn Châu ổ	50505	0	\N	\N	\N	\N	\N	co	505
5050503	Xã Bình Thới	50505	0	\N	\N	\N	\N	\N	bt	505
5050505	Xã Bình Đông	50505	0	\N	\N	\N	\N	\N	bd	505
5050507	Xã Bình Thạnh	50505	0	\N	\N	\N	\N	\N	bt	505
5050509	Xã Bình Chánh	50505	0	\N	\N	\N	\N	\N	bc	505
5050511	Xã Bình Nguyên	50505	0	\N	\N	\N	\N	\N	bn	505
5050513	Xã Bình Khương	50505	0	\N	\N	\N	\N	\N	bk	505
5050515	Xã Bình An	50505	0	\N	\N	\N	\N	\N	ba	505
5050517	Xã Bình Trị	50505	0	\N	\N	\N	\N	\N	bt	505
5050519	Xã Bình Hải	50505	0	\N	\N	\N	\N	\N	bh	505
5050521	Xã Bình Thuận	50505	0	\N	\N	\N	\N	\N	bt	505
5050523	Xã Bình Dương	50505	0	\N	\N	\N	\N	\N	bd	505
5050525	Xã Bình Phước	50505	0	\N	\N	\N	\N	\N	bp	505
5050527	Xã Bình Trung	50505	0	\N	\N	\N	\N	\N	bt	505
5050529	Xã Bình Hòa	50505	0	\N	\N	\N	\N	\N	bh	505
5050531	Xã Bình Long	50505	0	\N	\N	\N	\N	\N	bl	505
5050533	Xã Bình Minh	50505	0	\N	\N	\N	\N	\N	bm	505
5050535	Xã Bình Phú	50505	0	\N	\N	\N	\N	\N	bp	505
5050537	Xã Bình Chương	50505	0	\N	\N	\N	\N	\N	bc	505
5050539	Xã Bình Thanh Đông	50505	0	\N	\N	\N	\N	\N	btd	505
5050541	Xã Bình Hiệp	50505	0	\N	\N	\N	\N	\N	bh	505
5050543	Xã Bình Mỹ	50505	0	\N	\N	\N	\N	\N	bm	505
5050545	Xã Bình Tân	50505	0	\N	\N	\N	\N	\N	bt	505
5050547	Xã Bình Châu	50505	0	\N	\N	\N	\N	\N	bc	505
5050549	Xã Bình Thanh Tây	50505	0	\N	\N	\N	\N	\N	btt	505
5050700	Không xác định	50507	0	\N	\N	\N	\N	\N	kx	505
5050701	Xã Trà Xuân	50507	0	\N	\N	\N	\N	\N	tx	505
5050703	Xã Trà Giang	50507	0	\N	\N	\N	\N	\N	tg	505
5050705	Xã Trà Thủy	50507	0	\N	\N	\N	\N	\N	tt	505
5050707	Xã Trà Hiệp	50507	0	\N	\N	\N	\N	\N	th	505
5050709	Xã Trà Phú	50507	0	\N	\N	\N	\N	\N	tp	505
5050711	Xã Trà Thọ	50507	0	\N	\N	\N	\N	\N	tt	505
5050713	Xã Trà Tân	50507	0	\N	\N	\N	\N	\N	tt	505
5050715	Xã Trà Khê	50507	0	\N	\N	\N	\N	\N	tk	505
5050717	Xã Trà Nham	50507	0	\N	\N	\N	\N	\N	tn	505
5050719	Xã Trà Sơn	50507	0	\N	\N	\N	\N	\N	ts	505
5050721	Xã Trà Lâm	50507	0	\N	\N	\N	\N	\N	tl	505
5050723	Xã Trà Thanh	50507	0	\N	\N	\N	\N	\N	tt	505
5050725	Xã Trà Quân	50507	0	\N	\N	\N	\N	\N	tq	505
5050727	Xã Trà Phong	50507	0	\N	\N	\N	\N	\N	tp	505
5050729	Xã Trà Lãnh	50507	0	\N	\N	\N	\N	\N	tl	505
5050731	Xã Trà Bình	50507	0	\N	\N	\N	\N	\N	tb	505
5050733	Xã Trà Bùi	50507	0	\N	\N	\N	\N	\N	tb	505
5050735	Xã Trà Trung	50507	0	\N	\N	\N	\N	\N	tt	505
5050737	Xã Trà Xinh	50507	0	\N	\N	\N	\N	\N	tx	505
5050900	Không xác định	50509	0	\N	\N	\N	\N	\N	kx	505
5050901	Thị trấn Sơn Tịnh	50509	0	\N	\N	\N	\N	\N	st	505
5050903	Xã Tịnh ấn Tây	50509	0	\N	\N	\N	\N	\N	tat	505
5050905	Xã Tịnh ấn Đông	50509	0	\N	\N	\N	\N	\N	tod	505
5050907	Xã Tịnh Thọ	50509	0	\N	\N	\N	\N	\N	tt	505
5050909	Xã Tịnh Trà	50509	0	\N	\N	\N	\N	\N	tt	505
5050911	Xã Tịnh Hòa	50509	0	\N	\N	\N	\N	\N	th	505
5050913	Xã Tịnh Hiệp	50509	0	\N	\N	\N	\N	\N	th	505
5050915	Xã Tịnh Phong	50509	0	\N	\N	\N	\N	\N	tp	505
5050917	Xã Tịnh Thiện	50509	0	\N	\N	\N	\N	\N	tt	505
5050919	Xã Tịnh Bình	50509	0	\N	\N	\N	\N	\N	tb	505
5050921	Xã Tịnh Kỳ	50509	0	\N	\N	\N	\N	\N	tk	505
5050923	Xã Tịnh Khê	50509	0	\N	\N	\N	\N	\N	tk	505
5050925	Xã Tịnh Đông	50509	0	\N	\N	\N	\N	\N	td	505
5050927	Xã Tịnh Bắc	50509	0	\N	\N	\N	\N	\N	tb	505
5050929	Xã Tịnh Châu	50509	0	\N	\N	\N	\N	\N	tc	505
5050931	Xã Tịnh Giang	50509	0	\N	\N	\N	\N	\N	tg	505
5050933	Xã Tịnh Hà	50509	0	\N	\N	\N	\N	\N	th	505
5050935	Xã Tịnh Sơn	50509	0	\N	\N	\N	\N	\N	ts	505
5050937	Xã Tịnh Minh	50509	0	\N	\N	\N	\N	\N	tm	505
5050939	Xã Tịnh Long	50509	0	\N	\N	\N	\N	\N	tl	505
5050941	Xã Tịnh An	50509	0	\N	\N	\N	\N	\N	ta	505
5051100	Không xác định	50511	0	\N	\N	\N	\N	\N	kx	505
5051101	Xã Sơn Dung	50511	0	\N	\N	\N	\N	\N	sd	505
5051103	Xã Sơn Mùa	50511	0	\N	\N	\N	\N	\N	sm	505
5051105	Xã Sơn Tân	50511	0	\N	\N	\N	\N	\N	st	505
5051107	Xã Sơn Tinh	50511	0	\N	\N	\N	\N	\N	st	505
5051300	Không xác định	50513	0	\N	\N	\N	\N	\N	kx	505
5051301	Thị trấn Di Lăng	50513	0	\N	\N	\N	\N	\N	dl	505
5051303	Xã Sơn Trung	50513	0	\N	\N	\N	\N	\N	st	505
5051305	Xã Sơn Thượng	50513	0	\N	\N	\N	\N	\N	st	505
5051307	Xã Sơn Bao	50513	0	\N	\N	\N	\N	\N	sb	505
5051309	Xã Sơn Thành	50513	0	\N	\N	\N	\N	\N	st	505
5051311	Xã Sơn Hạ	50513	0	\N	\N	\N	\N	\N	sh	505
5051313	Xã Sơn Nham	50513	0	\N	\N	\N	\N	\N	sn	505
5051315	Xã Sơn Giang	50513	0	\N	\N	\N	\N	\N	sg	505
5051317	Xã Sơn Linh	50513	0	\N	\N	\N	\N	\N	sl	505
5051319	Xã Sơn Cao	50513	0	\N	\N	\N	\N	\N	sc	505
5051321	Xã Sơn Hải	50513	0	\N	\N	\N	\N	\N	sh	505
5051323	Xã Sơn Thủy	50513	0	\N	\N	\N	\N	\N	st	505
5051325	Xã Sơn Kỳ	50513	0	\N	\N	\N	\N	\N	sk	505
5051327	Xã Sơn Ba	50513	0	\N	\N	\N	\N	\N	sb	505
5051500	Không xác định	50515	0	\N	\N	\N	\N	\N	kx	505
5051501	Thị trấn La Hà	50515	0	\N	\N	\N	\N	\N	lh	505
5051503	Thị trấn Sông Vệ	50515	0	\N	\N	\N	\N	\N	sv	505
5051505	Xã Nghĩa Trung	50515	0	\N	\N	\N	\N	\N	nt	505
5051507	Xã Nghĩa Lâm	50515	0	\N	\N	\N	\N	\N	nl	505
5051509	Xã Nghĩa Sơn	50515	0	\N	\N	\N	\N	\N	ns	505
5051511	Xã Nghĩa Thắng	50515	0	\N	\N	\N	\N	\N	nt	505
5051513	Xã Nghĩa Thọ	50515	0	\N	\N	\N	\N	\N	nt	505
5051515	Xã Nghĩa Thuận	50515	0	\N	\N	\N	\N	\N	nt	505
5051517	Xã Nghĩa Kỳ	50515	0	\N	\N	\N	\N	\N	nk	505
5051519	Xã Nghĩa Điền	50515	0	\N	\N	\N	\N	\N	nd	505
5051521	Xã Nghĩa Hà	50515	0	\N	\N	\N	\N	\N	nh	505
5051523	Xã Nghĩa Hòa	50515	0	\N	\N	\N	\N	\N	nh	505
5051525	Xã Nghĩa An	50515	0	\N	\N	\N	\N	\N	na	505
5051527	Xã Nghĩa Thương	50515	0	\N	\N	\N	\N	\N	nt	505
5051529	Xã Nghĩa Hiệp	50515	0	\N	\N	\N	\N	\N	nh	505
5051531	Xã Nghĩa Phương	50515	0	\N	\N	\N	\N	\N	np	505
5051533	Xã Nghĩa Mỹ	50515	0	\N	\N	\N	\N	\N	nm	505
5051535	Xã Nghĩa Phú	50515	0	\N	\N	\N	\N	\N	np	505
5051700	Không xác định	50517	0	\N	\N	\N	\N	\N	kx	505
5051701	Thị trấn Chợ Chùa	50517	0	\N	\N	\N	\N	\N	cc	505
5051703	Xã Hành Thuận	50517	0	\N	\N	\N	\N	\N	ht	505
5051705	Xã Hành Dũng	50517	0	\N	\N	\N	\N	\N	hd	505
5051707	Xã Hành Minh	50517	0	\N	\N	\N	\N	\N	hm	505
5051709	Xã Hành Đức	50517	0	\N	\N	\N	\N	\N	hd	505
5051711	Xã Hành Phước	50517	0	\N	\N	\N	\N	\N	hp	505
5051713	Xã Hành Thịnh	50517	0	\N	\N	\N	\N	\N	ht	505
5051715	Xã Hành Thiện	50517	0	\N	\N	\N	\N	\N	ht	505
5051717	Xã Hành Tín Tây	50517	0	\N	\N	\N	\N	\N	htt	505
5051719	Xã Hành Tín  Đông	50517	0	\N	\N	\N	\N	\N	htd	505
5051721	Xã Hành Nhân	50517	0	\N	\N	\N	\N	\N	hn	505
5051723	Xã Hành Trung	50517	0	\N	\N	\N	\N	\N	ht	505
5051900	Không xác định	50519	0	\N	\N	\N	\N	\N	kx	505
5051901	Xã Long Hiệp	50519	0	\N	\N	\N	\N	\N	lh	505
5051903	Xã Long Sơn	50519	0	\N	\N	\N	\N	\N	ls	505
5051905	Xã Long Mai	50519	0	\N	\N	\N	\N	\N	lm	505
5051907	Xã Thanh An	50519	0	\N	\N	\N	\N	\N	ta	505
5051909	Xã Long Môn	50519	0	\N	\N	\N	\N	\N	lm	505
5052100	Không xác định	50521	0	\N	\N	\N	\N	\N	kx	505
5052101	Thị trấn Mộ Đức	50521	0	\N	\N	\N	\N	\N	md	505
5052103	Xã Đức Nhuận	50521	0	\N	\N	\N	\N	\N	dn	505
5052105	Xã Đức Lợi	50521	0	\N	\N	\N	\N	\N	dl	505
5052107	Xã Đức Thắng	50521	0	\N	\N	\N	\N	\N	dt	505
5052109	Xã Đức Chánh	50521	0	\N	\N	\N	\N	\N	dc	505
5052111	Xã Đức Hiệp	50521	0	\N	\N	\N	\N	\N	dh	505
5052113	Xã Đức Minh	50521	0	\N	\N	\N	\N	\N	dm	505
5052115	Xã Đức Thạnh	50521	0	\N	\N	\N	\N	\N	dt	505
5052117	Xã Đức Tân	50521	0	\N	\N	\N	\N	\N	dt	505
5052119	Xã Đức Hòa	50521	0	\N	\N	\N	\N	\N	dh	505
5052121	Xã Đức Phú	50521	0	\N	\N	\N	\N	\N	dp	505
5052123	Xã Đức Phong	50521	0	\N	\N	\N	\N	\N	dp	505
5052125	Xã Đức Lân	50521	0	\N	\N	\N	\N	\N	dl	505
5052300	Không xác định	50523	0	\N	\N	\N	\N	\N	kx	505
5052301	Thị trấn Đức Phổ	50523	0	\N	\N	\N	\N	\N	dp	505
5052303	Xã Phổ Hòa	50523	0	\N	\N	\N	\N	\N	ph	505
5052305	Xã Phổ Thuận	50523	0	\N	\N	\N	\N	\N	pt	505
5052307	Xã Phổ Văn	50523	0	\N	\N	\N	\N	\N	pv	505
5052309	Xã Phổ Phong	50523	0	\N	\N	\N	\N	\N	pp	505
5052311	Xã Phổ An	50523	0	\N	\N	\N	\N	\N	pa	505
5052313	Xã Phổ Quang	50523	0	\N	\N	\N	\N	\N	pq	505
5052315	Xã Phổ Ninh	50523	0	\N	\N	\N	\N	\N	pn	505
5052317	Xã Phổ Minh	50523	0	\N	\N	\N	\N	\N	pm	505
5052319	Xã Phổ Nhơn	50523	0	\N	\N	\N	\N	\N	pn	505
5052321	Xã Phổ Cường	50523	0	\N	\N	\N	\N	\N	pc	505
5052323	Xã Phổ Khánh	50523	0	\N	\N	\N	\N	\N	pk	505
5052325	Xã Phổ Thạnh	50523	0	\N	\N	\N	\N	\N	pt	505
5052327	Xã Phổ Vinh	50523	0	\N	\N	\N	\N	\N	pv	505
5052500	Không xác định	50525	0	\N	\N	\N	\N	\N	kx	505
5052501	Thị trấn Ba Tơ	50525	0	\N	\N	\N	\N	\N	bt	505
5052503	Xã Ba Động	50525	0	\N	\N	\N	\N	\N	bd	505
5052505	Xã Ba Dinh	50525	0	\N	\N	\N	\N	\N	bd	505
5052507	Xã Ba Điền	50525	0	\N	\N	\N	\N	\N	bd	505
5052509	Xã Ba Thành	50525	0	\N	\N	\N	\N	\N	bt	505
5052511	Xã Ba Vinh	50525	0	\N	\N	\N	\N	\N	bv	505
5052513	Xã Ba Trang	50525	0	\N	\N	\N	\N	\N	bt	505
5052515	Xã Ba Lế	50525	0	\N	\N	\N	\N	\N	bl	505
5052517	Xã Ba Bích	50525	0	\N	\N	\N	\N	\N	bb	505
5052519	Xã Ba Vì	50525	0	\N	\N	\N	\N	\N	bv	505
5052521	Xã Ba Tiêu	50525	0	\N	\N	\N	\N	\N	bt	505
5052523	Xã Ba Xa	50525	0	\N	\N	\N	\N	\N	bx	505
5052525	Xã Ba Ngạc	50525	0	\N	\N	\N	\N	\N	bn	505
5052527	Xã Ba Tô	50525	0	\N	\N	\N	\N	\N	bt	505
5052529	Xã Ba Chùa	50525	0	\N	\N	\N	\N	\N	bc	505
5052531	Xã Ba Cung	50525	0	\N	\N	\N	\N	\N	bc	505
5052533	Xã Ba Nam	50525	0	\N	\N	\N	\N	\N	bn	505
5052535	Xã Ba Liên	50525	0	\N	\N	\N	\N	\N	bl	505
5070000	Không xác định	50700	0	\N	\N	\N	\N	\N	kx	507
5070100	Không xác định	50701	0	\N	\N	\N	\N	\N	kx	507
5070101	Phường Trần Quang Diệu	50701	0	\N	\N	\N	\N	\N	tqd	507
5070103	Phường Bùi Thị Xuân	50701	0	\N	\N	\N	\N	\N	btx	507
5070105	Phường Đống Đa	50701	0	\N	\N	\N	\N	\N	dd	507
5070107	Phường Quang Trung	50701	0	\N	\N	\N	\N	\N	qt	507
5070109	Phường Ghềnh Ráng	50701	0	\N	\N	\N	\N	\N	gr	507
5070111	Phường Ngô Mậy	50701	0	\N	\N	\N	\N	\N	nm	507
5070113	Phường Nguyến  Văn Cừ	50701	0	\N	\N	\N	\N	\N	nvc	507
5070115	Phường Trần Hưng Đạo	50701	0	\N	\N	\N	\N	\N	thd	507
5070117	Phường Lê Hồng Phong	50701	0	\N	\N	\N	\N	\N	lhp	507
5070119	Phường Trần Phú	50701	0	\N	\N	\N	\N	\N	tp	507
5070121	Phường Lê Lợi	50701	0	\N	\N	\N	\N	\N	ll	507
5070123	Phường Hải Cảng	50701	0	\N	\N	\N	\N	\N	hc	507
5070125	Phường Nhơn Bình	50701	0	\N	\N	\N	\N	\N	nb	507
5070127	Phường Nhơn Phú	50701	0	\N	\N	\N	\N	\N	np	507
5070129	Xã Nhơn Lý	50701	0	\N	\N	\N	\N	\N	nl	507
5070131	Xã Nhơn Hải	50701	0	\N	\N	\N	\N	\N	nh	507
5070133	Xã Nhơn Hội	50701	0	\N	\N	\N	\N	\N	nh	507
5070135	Xã Nhơn Châu	50701	0	\N	\N	\N	\N	\N	nc	507
5070137	Phường Lý Thường Kiệt	50701	0	\N	\N	\N	\N	\N	ltk	507
5070139	Phường Thị Nại	50701	0	\N	\N	\N	\N	\N	tn	507
5070300	Không xác định	50703	0	\N	\N	\N	\N	\N	kx	507
5070301	Xã An Hưng	50703	0	\N	\N	\N	\N	\N	ah	507
5070303	Xã An Trung	50703	0	\N	\N	\N	\N	\N	at	507
5070305	Xã An Dũng	50703	0	\N	\N	\N	\N	\N	ad	507
5070307	Xã An Vinh	50703	0	\N	\N	\N	\N	\N	av	507
5070309	Xã An Toàn	50703	0	\N	\N	\N	\N	\N	at	507
5070311	Xã An Tân	50703	0	\N	\N	\N	\N	\N	at	507
5070313	Xã An Hòa	50703	0	\N	\N	\N	\N	\N	ah	507
5070315	Xã An Quang	50703	0	\N	\N	\N	\N	\N	aq	507
5070317	Xã An Nghĩa	50703	0	\N	\N	\N	\N	\N	an	507
5070500	Không xác định	50705	0	\N	\N	\N	\N	\N	kx	507
5070501	Thị trấn Bồng Sơn	50705	0	\N	\N	\N	\N	\N	bs	507
5070503	Thị trấn  Tam Quan	50705	0	\N	\N	\N	\N	\N	tq	507
5070505	Xã Hoài Sơn	50705	0	\N	\N	\N	\N	\N	hs	507
5070507	Xã Hoài Châu	50705	0	\N	\N	\N	\N	\N	hc	507
5070509	Xã Hoài Châu Bắc	50705	0	\N	\N	\N	\N	\N	hcb	507
5070511	Xã Hoài Phú	50705	0	\N	\N	\N	\N	\N	hp	507
5070513	Xã Tam Quan Bắc	50705	0	\N	\N	\N	\N	\N	tqb	507
5070515	Xã Tam Quan Nam	50705	0	\N	\N	\N	\N	\N	tqn	507
5070517	Xã Hoài Hảo	50705	0	\N	\N	\N	\N	\N	hh	507
5070519	Xã Hoài Thanh	50705	0	\N	\N	\N	\N	\N	ht	507
5070521	Xã Hoài Thanh Tây	50705	0	\N	\N	\N	\N	\N	htt	507
5070523	Xã Hoài Hương	50705	0	\N	\N	\N	\N	\N	hh	507
5070525	Xã Hoài Tân	50705	0	\N	\N	\N	\N	\N	ht	507
5070527	Xã Hoài Hải	50705	0	\N	\N	\N	\N	\N	hh	507
5070529	Xã Hoài Xuân	50705	0	\N	\N	\N	\N	\N	hx	507
5070531	Xã Hoài Mỹ	50705	0	\N	\N	\N	\N	\N	hm	507
5070533	Xã Hoài Đức	50705	0	\N	\N	\N	\N	\N	hd	507
5070700	Không xác định	50707	0	\N	\N	\N	\N	\N	kx	507
5070701	Thị trấn Tăng Bạt Hổ	50707	0	\N	\N	\N	\N	\N	tbh	507
5070703	Xã Ân Hảo	50707	0	\N	\N	\N	\N	\N	ah	507
5070705	Xã Ân Mỹ	50707	0	\N	\N	\N	\N	\N	am	507
5070707	Xã Ân Sơn	50707	0	\N	\N	\N	\N	\N	as	507
5070709	Xã Dak Mang	50707	0	\N	\N	\N	\N	\N	dm	507
5070711	Xã Ân Tín	50707	0	\N	\N	\N	\N	\N	at	507
5070713	Xã Ân Thạnh	50707	0	\N	\N	\N	\N	\N	at	507
5070715	Xã Ân Phong	50707	0	\N	\N	\N	\N	\N	ap	507
8090105	Phường 3	80901	0	\N	\N	\N	\N	\N	3	809
5070717	Xã Ân Đức	50707	0	\N	\N	\N	\N	\N	ad	507
5070719	Xã Ân Hữu	50707	0	\N	\N	\N	\N	\N	ah	507
5070721	Xã Bok Tới	50707	0	\N	\N	\N	\N	\N	bt	507
5070723	Xã Ân Tường Đông	50707	0	\N	\N	\N	\N	\N	atd	507
5070725	Xã Ân Nghĩa	50707	0	\N	\N	\N	\N	\N	an	507
5070727	Xã Ân Tường Tây	50707	0	\N	\N	\N	\N	\N	att	507
7012911	Phường 7	70129	0	\N	\N	\N	\N	\N	7	701
5070900	Không xác định	50709	0	\N	\N	\N	\N	\N	kx	507
5070901	Thị trấn Phù Mỹ	50709	0	\N	\N	\N	\N	\N	pm	507
5070903	Xã Mỹ Đức	50709	0	\N	\N	\N	\N	\N	md	507
5070905	Xã Mỹ Châu	50709	0	\N	\N	\N	\N	\N	mc	507
5070907	Xã Mỹ Thắng	50709	0	\N	\N	\N	\N	\N	mt	507
5070909	Xã Mỹ Lộc	50709	0	\N	\N	\N	\N	\N	ml	507
5070911	Xã Mỹ Lợi	50709	0	\N	\N	\N	\N	\N	ml	507
5070913	Xã Mỹ An	50709	0	\N	\N	\N	\N	\N	ma	507
5070915	Xã Mỹ Phong	50709	0	\N	\N	\N	\N	\N	mp	507
5070917	Xã Mỹ Trinh	50709	0	\N	\N	\N	\N	\N	mt	507
5070919	Xã Mỹ Thọ	50709	0	\N	\N	\N	\N	\N	mt	507
5070921	Xã Mỹ Hòa	50709	0	\N	\N	\N	\N	\N	mh	507
5070923	Xã Mỹ Thành	50709	0	\N	\N	\N	\N	\N	mt	507
5070925	Xã Mỹ Chánh	50709	0	\N	\N	\N	\N	\N	mc	507
5070927	Xã Mỹ Quang	50709	0	\N	\N	\N	\N	\N	mq	507
5070929	Xã Mỹ Hiệp	50709	0	\N	\N	\N	\N	\N	mh	507
5070931	Xã Mỹ Tài	50709	0	\N	\N	\N	\N	\N	mt	507
5070933	Xã Mỹ Cát	50709	0	\N	\N	\N	\N	\N	mc	507
5071100	Không xác định	50711	0	\N	\N	\N	\N	\N	kx	507
5071101	Xã Vĩnh Sơn	50711	0	\N	\N	\N	\N	\N	vs	507
5071103	Xã Vĩnh Kim	50711	0	\N	\N	\N	\N	\N	vk	507
5071105	Xã Vĩnh Hòa	50711	0	\N	\N	\N	\N	\N	vh	507
5071107	Xã Vĩnh Hiệp	50711	0	\N	\N	\N	\N	\N	vh	507
5071109	Xã Vĩnh Hảo	50711	0	\N	\N	\N	\N	\N	vh	507
5071111	Xã Vĩnh Quang	50711	0	\N	\N	\N	\N	\N	vq	507
5071113	Xã Vĩnh Thịnh	50711	0	\N	\N	\N	\N	\N	vt	507
5071300	Không xác định	50713	0	\N	\N	\N	\N	\N	kx	507
5071301	Thị trấn Ngô Mây	50713	0	\N	\N	\N	\N	\N	nm	507
5071303	Xã Cát Sơn	50713	0	\N	\N	\N	\N	\N	cs	507
5071305	Xã Cát Minh	50713	0	\N	\N	\N	\N	\N	cm	507
5071307	Xã Cát Tài	50713	0	\N	\N	\N	\N	\N	ct	507
5071309	Xã Cát Khánh	50713	0	\N	\N	\N	\N	\N	ck	507
5071311	Xã Cát Lâm	50713	0	\N	\N	\N	\N	\N	cl	507
5071313	Xã Cát Hanh	50713	0	\N	\N	\N	\N	\N	ch	507
5071315	Xã Cát Thành	50713	0	\N	\N	\N	\N	\N	ct	507
5071317	Xã Cát Hải	50713	0	\N	\N	\N	\N	\N	ch	507
5071319	Xã Cát Hiệp	50713	0	\N	\N	\N	\N	\N	ch	507
5071321	Xã Cát Trinh	50713	0	\N	\N	\N	\N	\N	ct	507
5071323	Xã Cát Nhơn	50713	0	\N	\N	\N	\N	\N	cn	507
5071325	Xã Cát Hưng	50713	0	\N	\N	\N	\N	\N	ch	507
5071327	Xã Cát Tường	50713	0	\N	\N	\N	\N	\N	ct	507
5071329	Xã Cát Tân	50713	0	\N	\N	\N	\N	\N	ct	507
5071331	Xã Cát Tiến	50713	0	\N	\N	\N	\N	\N	ct	507
5071333	Xã Cát Thắng	50713	0	\N	\N	\N	\N	\N	ct	507
5071335	Xã Cát Chánh	50713	0	\N	\N	\N	\N	\N	cc	507
5071500	Không xác định	50715	0	\N	\N	\N	\N	\N	kx	507
5071501	Thị trấn Phú Phong	50715	0	\N	\N	\N	\N	\N	pp	507
5071503	Xã Bình Tân	50715	0	\N	\N	\N	\N	\N	bt	507
5071505	Xã Tây Thuận	50715	0	\N	\N	\N	\N	\N	tt	507
5071507	Xã Bình Thuận	50715	0	\N	\N	\N	\N	\N	bt	507
5071509	Xã Tây Giang	50715	0	\N	\N	\N	\N	\N	tg	507
5071511	Xã Bình Thành	50715	0	\N	\N	\N	\N	\N	bt	507
5071513	Xã Tây An	50715	0	\N	\N	\N	\N	\N	ta	507
5071515	Xã Bình Hòa	50715	0	\N	\N	\N	\N	\N	bh	507
5071517	Xã Bình Tường	50715	0	\N	\N	\N	\N	\N	bt	507
5071519	Xã Tây Vinh	50715	0	\N	\N	\N	\N	\N	tv	507
5071521	Xã Tây Bình	50715	0	\N	\N	\N	\N	\N	tb	507
5071523	Xã Vĩnh An	50715	0	\N	\N	\N	\N	\N	va	507
5071525	Xã Tây Xuân	50715	0	\N	\N	\N	\N	\N	tx	507
5071527	Xã Tây Phú	50715	0	\N	\N	\N	\N	\N	tp	507
5071529	Xã Bình Nghi	50715	0	\N	\N	\N	\N	\N	bn	507
5071700	Không xác định	50717	0	\N	\N	\N	\N	\N	kx	507
5071701	Thị trấn Bình Định	50717	0	\N	\N	\N	\N	\N	bd	507
5071703	Thị trấn Đập Đá	50717	0	\N	\N	\N	\N	\N	dd	507
5071705	Xã Nhơn Thành	50717	0	\N	\N	\N	\N	\N	nt	507
5071707	Xã Nhơn Mỹ	50717	0	\N	\N	\N	\N	\N	nm	507
5071709	Xã Nhơn Hạnh	50717	0	\N	\N	\N	\N	\N	nh	507
5071711	Xã Nhơn Phong	50717	0	\N	\N	\N	\N	\N	np	507
5071713	Xã Nhơn Hậu	50717	0	\N	\N	\N	\N	\N	nh	507
5071715	Xã Nhơn An	50717	0	\N	\N	\N	\N	\N	na	507
5071717	Xã Nhơn Hưng	50717	0	\N	\N	\N	\N	\N	nh	507
5071719	Xã Nhơn Phúc	50717	0	\N	\N	\N	\N	\N	np	507
5071721	Xã Nhơn Khánh	50717	0	\N	\N	\N	\N	\N	nk	507
5071723	Xã Nhơn Lộc	50717	0	\N	\N	\N	\N	\N	nl	507
5071725	Xã Nhơn Hòa	50717	0	\N	\N	\N	\N	\N	nh	507
5071727	Xã Nhơn Thọ	50717	0	\N	\N	\N	\N	\N	nt	507
5071729	Xã Nhơn Tân	50717	0	\N	\N	\N	\N	\N	nt	507
5071900	Không xác định	50719	0	\N	\N	\N	\N	\N	kx	507
5071901	Thị trấn Tuy Phước	50719	0	\N	\N	\N	\N	\N	tp	507
5071903	Thị trấn Diêu Trì	50719	0	\N	\N	\N	\N	\N	dt	507
5071905	Xã Phước Thắng	50719	0	\N	\N	\N	\N	\N	pt	507
5071907	Xã Phước Hưng	50719	0	\N	\N	\N	\N	\N	ph	507
5071909	Xã Phước Hòa	50719	0	\N	\N	\N	\N	\N	ph	507
5071911	Xã Phước Quang	50719	0	\N	\N	\N	\N	\N	pq	507
5071913	Xã Phước Sơn	50719	0	\N	\N	\N	\N	\N	ps	507
5071915	Xã Phước Hiệp	50719	0	\N	\N	\N	\N	\N	ph	507
5071917	Xã Phước Lộc	50719	0	\N	\N	\N	\N	\N	pl	507
5071919	Xã Phước Thuận	50719	0	\N	\N	\N	\N	\N	pt	507
5071921	Xã Phước Nghĩa	50719	0	\N	\N	\N	\N	\N	pn	507
5071923	Xã Phước An	50719	0	\N	\N	\N	\N	\N	pa	507
5071925	Xã Phước Thành	50719	0	\N	\N	\N	\N	\N	pt	507
5071927	Xã Phước Mỹ	50719	0	\N	\N	\N	\N	\N	pm	507
5072100	Không xác định	50721	0	\N	\N	\N	\N	\N	kx	507
5072101	Xã Canh Hiệp	50721	0	\N	\N	\N	\N	\N	ch	507
5072103	Xã Canh Liên	50721	0	\N	\N	\N	\N	\N	cl	507
5072105	Xã Canh Vinh	50721	0	\N	\N	\N	\N	\N	cv	507
5072107	Xã Canh Hiển	50721	0	\N	\N	\N	\N	\N	ch	507
5072109	Xã Canh Thuận	50721	0	\N	\N	\N	\N	\N	ct	507
5072111	Xã Canh Hòa	50721	0	\N	\N	\N	\N	\N	ch	507
5090000	Không xác định	50900	0	\N	\N	\N	\N	\N	kx	509
1010201	Bồ Đề	10102	0	\N	\N	\N	\N	\N	bdf	101
5090100	Không xác định	50901	0	\N	\N	\N	\N	\N	kx	509
5090101	Phường 1	50901	0	\N	\N	\N	\N	\N	1	509
5090103	Phường 2	50901	0	\N	\N	\N	\N	\N	2	509
5090105	Phường 3	50901	0	\N	\N	\N	\N	\N	3	509
5090107	Phường 4	50901	0	\N	\N	\N	\N	\N	4	509
5090109	Phường 5	50901	0	\N	\N	\N	\N	\N	5	509
5090111	Phường 6	50901	0	\N	\N	\N	\N	\N	6	509
5090113	Xã Hòa Hội	50901	0	\N	\N	\N	\N	\N	hh	509
5090115	Xã Hòa Định Tây	50901	0	\N	\N	\N	\N	\N	hdt	509
5090117	Xã Hòa Định Đông	50901	0	\N	\N	\N	\N	\N	hdd	509
5090119	Xã Hòa Thắng	50901	0	\N	\N	\N	\N	\N	ht	509
5090121	Xã Hòa An	50901	0	\N	\N	\N	\N	\N	ha	509
5090123	Xã Hòa Quang	50901	0	\N	\N	\N	\N	\N	hq	509
5090125	Xã Hòa Trị	50901	0	\N	\N	\N	\N	\N	ht	509
5090127	Xã Hòa Kiến	50901	0	\N	\N	\N	\N	\N	hk	509
5090129	Xã Bình Kiến	50901	0	\N	\N	\N	\N	\N	bk	509
5090131	Xã Bình Ngọc	50901	0	\N	\N	\N	\N	\N	bn	509
5090300	Không xác định	50903	0	\N	\N	\N	\N	\N	kx	509
5090301	Thị trấn La Hai	50903	0	\N	\N	\N	\N	\N	lh	509
5090303	Xã Phú Mỡ	50903	0	\N	\N	\N	\N	\N	pm	509
5090305	Xã Đa Lộc	50903	0	\N	\N	\N	\N	\N	dl	509
5090307	Xã Xuân Lãnh	50903	0	\N	\N	\N	\N	\N	xl	509
5090309	Xã Xuân Long	50903	0	\N	\N	\N	\N	\N	xl	509
5090311	Xã Xuân Quang 1	50903	0	\N	\N	\N	\N	\N	xq1	509
5090313	Xã Xuân Quang 2	50903	0	\N	\N	\N	\N	\N	xq2	509
5090315	Xã Xuân Sơn Bắc	50903	0	\N	\N	\N	\N	\N	xsb	509
5090317	Xã Xuân Sơn Nam	50903	0	\N	\N	\N	\N	\N	xsn	509
5090319	Xã Xuân Quang 3	50903	0	\N	\N	\N	\N	\N	xq3	509
5090321	Xã Xuân Phước	50903	0	\N	\N	\N	\N	\N	xp	509
5090500	Không xác định	50905	0	\N	\N	\N	\N	\N	kx	509
5090501	Thị trấn Sông Cầu	50905	0	\N	\N	\N	\N	\N	sc	509
5090503	Xã Xuân Lộc	50905	0	\N	\N	\N	\N	\N	xl	509
5090505	Xã Xuân Hải	50905	0	\N	\N	\N	\N	\N	xh	509
5090507	Xã Xuân Bình	50905	0	\N	\N	\N	\N	\N	xb	509
5090509	Xã Xuân Hòa	50905	0	\N	\N	\N	\N	\N	xh	509
5090511	Xã Xuân Cảnh	50905	0	\N	\N	\N	\N	\N	xc	509
5090513	Xã Xuân Thịnh	50905	0	\N	\N	\N	\N	\N	xt	509
5090515	Xã Xuân Phương	50905	0	\N	\N	\N	\N	\N	xp	509
5090517	Xã Xuân Thọ 1	50905	0	\N	\N	\N	\N	\N	xt1	509
5090519	Xã Xuân Thọ 2	50905	0	\N	\N	\N	\N	\N	xt2	509
5090700	Không xác định	50907	0	\N	\N	\N	\N	\N	kx	509
5090701	Thị trấn Chí Thạnh	50907	0	\N	\N	\N	\N	\N	ct	509
5090703	Xã An Thạch	50907	0	\N	\N	\N	\N	\N	at	509
5090705	Xã An Dân	50907	0	\N	\N	\N	\N	\N	ad	509
5090707	Xã An Ninh Tây	50907	0	\N	\N	\N	\N	\N	ant	509
5090709	Xã An Ninh Đông	50907	0	\N	\N	\N	\N	\N	and	509
5090711	Xã An Định	50907	0	\N	\N	\N	\N	\N	ad	509
5090713	Xã An Nghiệp	50907	0	\N	\N	\N	\N	\N	an	509
5090715	Xã An Xuân	50907	0	\N	\N	\N	\N	\N	ax	509
5090717	Xã An Lĩnh	50907	0	\N	\N	\N	\N	\N	al	509
5090719	Xã An Thọ	50907	0	\N	\N	\N	\N	\N	at	509
5090721	Xã An Cư	50907	0	\N	\N	\N	\N	\N	ac	509
5090723	Xã An Hải	50907	0	\N	\N	\N	\N	\N	ah	509
5090725	Xã An Hiệp	50907	0	\N	\N	\N	\N	\N	ah	509
5090727	Xã An Hòa	50907	0	\N	\N	\N	\N	\N	ah	509
5090729	Xã An Mỹ	50907	0	\N	\N	\N	\N	\N	am	509
5090731	Xã An Chấn	50907	0	\N	\N	\N	\N	\N	ac	509
5090733	Xã An Phú	50907	0	\N	\N	\N	\N	\N	ap	509
5090900	Không xác định	50909	0	\N	\N	\N	\N	\N	kx	509
5090901	Thị trấn Củng Sơn	50909	0	\N	\N	\N	\N	\N	cs	509
5090903	Xã Phước Tân	50909	0	\N	\N	\N	\N	\N	pt	509
5090905	Xã Cà Lúi	50909	0	\N	\N	\N	\N	\N	cl	509
5090907	Xã Krông Pa	50909	0	\N	\N	\N	\N	\N	kp	509
5090909	Xã Suối Trai	50909	0	\N	\N	\N	\N	\N	st	509
5090911	Xã Sơn Phước	50909	0	\N	\N	\N	\N	\N	sp	509
5090913	Xã Sơn Hội	50909	0	\N	\N	\N	\N	\N	sh	509
5090915	Xã Sơn Xuân	50909	0	\N	\N	\N	\N	\N	sx	509
5090917	Xã Sơn Định	50909	0	\N	\N	\N	\N	\N	sd	509
5090919	Xã Sơn Long	50909	0	\N	\N	\N	\N	\N	sl	509
5090921	Xã Sơn Nguyên	50909	0	\N	\N	\N	\N	\N	sn	509
5090923	Xã Sơn Hà	50909	0	\N	\N	\N	\N	\N	sh	509
5090925	Xã Eachà Rang	50909	0	\N	\N	\N	\N	\N	er	509
5091100	Không xác định	50911	0	\N	\N	\N	\N	\N	kx	509
5091101	Thị trấn Phú Lâm	50911	0	\N	\N	\N	\N	\N	pl	509
5091103	Xã Sơn Thành	50911	0	\N	\N	\N	\N	\N	st	509
5091105	Xã Hòa Phú	50911	0	\N	\N	\N	\N	\N	hp	509
5091107	Xã Hòa Phong	50911	0	\N	\N	\N	\N	\N	hp	509
5091109	Xã Hòa Mỹ Tây	50911	0	\N	\N	\N	\N	\N	hmt	509
5091111	Xã Hòa Mỹ Đông	50911	0	\N	\N	\N	\N	\N	hmd	509
5091113	Xã Hòa Thịnh	50911	0	\N	\N	\N	\N	\N	ht	509
5091115	Xã Hòa Đồng	50911	0	\N	\N	\N	\N	\N	hd	509
5091117	Xã Hòa Tân Tây	50911	0	\N	\N	\N	\N	\N	htt	509
5091119	Xã Hòa Bình 2	50911	0	\N	\N	\N	\N	\N	hb2	509
5091121	Xã Hòa Bình 1	50911	0	\N	\N	\N	\N	\N	hb1	509
5091123	Xã Hòa Tân Đông	50911	0	\N	\N	\N	\N	\N	htd	509
5091125	Xã Hòa Thành	50911	0	\N	\N	\N	\N	\N	ht	509
5091127	Xã Hòa Hiệp Bắc	50911	0	\N	\N	\N	\N	\N	hhb	509
5091129	Xã Hòa Hiệp Trung	50911	0	\N	\N	\N	\N	\N	hht	509
5091131	Xã Hòa Hiệp Nam	50911	0	\N	\N	\N	\N	\N	hhn	509
5091133	Xã Hòa Vinh	50911	0	\N	\N	\N	\N	\N	hv	509
5091135	Xã Hòa Xuân Đông	50911	0	\N	\N	\N	\N	\N	hxd	509
5091137	Xã Hòa Xuân Tây	50911	0	\N	\N	\N	\N	\N	hxt	509
5091139	Xã Hòa Xuân Nam	50911	0	\N	\N	\N	\N	\N	hxn	509
5091141	Xã Hòa Tâm	50911	0	\N	\N	\N	\N	\N	ht	509
5091300	Không xác định	50913	0	\N	\N	\N	\N	\N	kx	509
5091301	Thị trấn Hai Riêng	50913	0	\N	\N	\N	\N	\N	hr	509
5091303	Xã Ea Bá	50913	0	\N	\N	\N	\N	\N	eb	509
5091305	Xã Ea Lâm	50913	0	\N	\N	\N	\N	\N	el	509
5091307	Xã EaBar	50913	0	\N	\N	\N	\N	\N	eb	509
5091309	Xã EaBia	50913	0	\N	\N	\N	\N	\N	eb	509
5091311	Xã EaTrol	50913	0	\N	\N	\N	\N	\N	et	509
5091313	Xã Sông Hinh	50913	0	\N	\N	\N	\N	\N	sh	509
5091315	Xã Đức Bình Tây	50913	0	\N	\N	\N	\N	\N	dbt	509
5091317	Xã Đức Bình Đông	50913	0	\N	\N	\N	\N	\N	dbd	509
5091319	Xã Sơn Giang	50913	0	\N	\N	\N	\N	\N	sg	509
5110000	Không xác định	51100	0	\N	\N	\N	\N	\N	kx	511
5110100	Không xác định	51101	0	\N	\N	\N	\N	\N	kx	511
5110101	Phường Vĩnh Hải	51101	0	\N	\N	\N	\N	\N	vh	511
5110103	Phường Vĩnh Phước	51101	0	\N	\N	\N	\N	\N	vp	511
5110105	Phường Vĩnh Thọ	51101	0	\N	\N	\N	\N	\N	vt	511
5110107	Phường Ngọc Hiệp	51101	0	\N	\N	\N	\N	\N	nh	511
5110109	Phường Vạn Thắng	51101	0	\N	\N	\N	\N	\N	vt	511
5110111	Phường Phương Sơn	51101	0	\N	\N	\N	\N	\N	ps	511
5110113	Phường Xương Huân	51101	0	\N	\N	\N	\N	\N	xh	511
5110115	Phường Vạn Thạnh	51101	0	\N	\N	\N	\N	\N	vt	511
5110117	Phường Phương Sài	51101	0	\N	\N	\N	\N	\N	ps	511
5110119	Phường Phước Tân	51101	0	\N	\N	\N	\N	\N	pt	511
5110121	Phường Phước Tiến	51101	0	\N	\N	\N	\N	\N	pt	511
5110123	Phường Phước Hải	51101	0	\N	\N	\N	\N	\N	ph	511
5110125	Phường Lộc Thọ	51101	0	\N	\N	\N	\N	\N	lt	511
5110127	Phường Phước Hòa	51101	0	\N	\N	\N	\N	\N	ph	511
5110129	Phường Tân Lập	51101	0	\N	\N	\N	\N	\N	tl	511
5110131	Phường Vĩnh Nguyên	51101	0	\N	\N	\N	\N	\N	vn	511
5110133	Phường Vĩnh Trường	51101	0	\N	\N	\N	\N	\N	vt	511
5110135	Xã Vĩnh Lương	51101	0	\N	\N	\N	\N	\N	vl	511
5110137	Xã Vĩnh Phương	51101	0	\N	\N	\N	\N	\N	vp	511
5110139	Xã Vĩnh Ngọc	51101	0	\N	\N	\N	\N	\N	vn	511
5110141	Xã Vĩnh Thạnh	51101	0	\N	\N	\N	\N	\N	vt	511
5110143	Xã Vĩnh Hiệp	51101	0	\N	\N	\N	\N	\N	vh	511
5110145	Xã Vĩnh Trung	51101	0	\N	\N	\N	\N	\N	vt	511
5110147	Xã Vĩnh Thái	51101	0	\N	\N	\N	\N	\N	vt	511
5110149	Xã Phước Đồng	51101	0	\N	\N	\N	\N	\N	pd	511
5110151	Phường Phước Long	51101	0	\N	\N	\N	\N	\N	pl	511
5110300	Không xác định	51103	0	\N	\N	\N	\N	\N	kx	511
5110301	Thị trấn Vạn Giã	51103	0	\N	\N	\N	\N	\N	vg	511
5110303	Xã Đại Lãnh	51103	0	\N	\N	\N	\N	\N	dl	511
5110305	Xã Vạn Long	51103	0	\N	\N	\N	\N	\N	vl	511
5110307	Xã Vạn Phước	51103	0	\N	\N	\N	\N	\N	vp	511
5110309	Xã Vạn Thọ	51103	0	\N	\N	\N	\N	\N	vt	511
5110311	Xã Vạn Bình	51103	0	\N	\N	\N	\N	\N	vb	511
5110313	Xã Vạn Khánh	51103	0	\N	\N	\N	\N	\N	vk	511
5110315	Xã Vạn Phú	51103	0	\N	\N	\N	\N	\N	vp	511
5110317	Xã Vạn Thắng	51103	0	\N	\N	\N	\N	\N	vt	511
5110319	Xã Vạn Thạnh	51103	0	\N	\N	\N	\N	\N	vt	511
5110321	Xã Vạn Lương	51103	0	\N	\N	\N	\N	\N	vl	511
5110323	Xã Xuân Sơn	51103	0	\N	\N	\N	\N	\N	xs	511
5110325	Xã Vạn Hưng	51103	0	\N	\N	\N	\N	\N	vh	511
5110500	Không xác định	51105	0	\N	\N	\N	\N	\N	kx	511
5110501	Thị trấn Ninh Hòa	51105	0	\N	\N	\N	\N	\N	nh	511
5110503	Xã Ninh An	51105	0	\N	\N	\N	\N	\N	na	511
5110505	Xã Ninh Tây	51105	0	\N	\N	\N	\N	\N	nt	511
5110507	Xã Ninh Thượng	51105	0	\N	\N	\N	\N	\N	nt	511
5110509	Xã Ninh Thọ	51105	0	\N	\N	\N	\N	\N	nt	511
5110511	Xã Ninh Hải	51105	0	\N	\N	\N	\N	\N	nh	511
5110513	Xã Ninh Sim	51105	0	\N	\N	\N	\N	\N	ns	511
5110515	Xã Ninh Xuân	51105	0	\N	\N	\N	\N	\N	nx	511
5110517	Xã Ninh Trung	51105	0	\N	\N	\N	\N	\N	nt	511
5110519	Xã Ninh Thân	51105	0	\N	\N	\N	\N	\N	nt	511
5110521	Xã Ninh Đông	51105	0	\N	\N	\N	\N	\N	nd	511
5110523	Xã Ninh Diêm	51105	0	\N	\N	\N	\N	\N	nd	511
5110525	Xã Ninh Thủy	51105	0	\N	\N	\N	\N	\N	nt	511
5110527	Xã Ninh Phụng	51105	0	\N	\N	\N	\N	\N	np	511
5110529	Xã Ninh Đa	51105	0	\N	\N	\N	\N	\N	nd	511
5110531	Xã Ninh Bình	51105	0	\N	\N	\N	\N	\N	nb	511
5110533	Xã Ninh Giang	51105	0	\N	\N	\N	\N	\N	ng	511
5110535	Xã Ninh Phú	51105	0	\N	\N	\N	\N	\N	np	511
5110537	Xã Ninh Quang	51105	0	\N	\N	\N	\N	\N	nq	511
5110539	Xã Ninh Hà	51105	0	\N	\N	\N	\N	\N	nh	511
5110541	Xã Ninh Phước	51105	0	\N	\N	\N	\N	\N	np	511
5110543	Xã Ninh Tân	51105	0	\N	\N	\N	\N	\N	nt	511
5110545	Xã Ninh Hưng	51105	0	\N	\N	\N	\N	\N	nh	511
5110547	Xã Ninh Lộc	51105	0	\N	\N	\N	\N	\N	nl	511
5110549	Xã Ninh Vân	51105	0	\N	\N	\N	\N	\N	nv	511
5110551	Xã Ninh ích	51105	0	\N	\N	\N	\N	\N	ny	511
5110553	Xã Ninh Hòa	51105	0	\N	\N	\N	\N	\N	nh	511
5110700	Không xác định	51107	0	\N	\N	\N	\N	\N	kx	511
5110701	Thị trấn Diên Khánh	51107	0	\N	\N	\N	\N	\N	dk	511
5110703	Xã Diên Lâm	51107	0	\N	\N	\N	\N	\N	dl	511
5110705	Xã Diên Điền	51107	0	\N	\N	\N	\N	\N	dd	511
5110707	Xã Diên Xuân	51107	0	\N	\N	\N	\N	\N	dx	511
5110709	Xã Diên Sơn	51107	0	\N	\N	\N	\N	\N	ds	511
5110711	Xã Diên Đồng	51107	0	\N	\N	\N	\N	\N	dd	511
5110713	Xã Diên Phú	51107	0	\N	\N	\N	\N	\N	dp	511
5110715	Xã Diên Thọ	51107	0	\N	\N	\N	\N	\N	dt	511
5110717	Xã Diên Phước	51107	0	\N	\N	\N	\N	\N	dp	511
5110719	Xã Diên Lạc	51107	0	\N	\N	\N	\N	\N	dl	511
5110721	Xã Diên Thạnh	51107	0	\N	\N	\N	\N	\N	dt	511
5110723	Xã Diên Toàn	51107	0	\N	\N	\N	\N	\N	dt	511
5110725	Xã Diên An	51107	0	\N	\N	\N	\N	\N	da	511
5110727	Xã Diên Tân	51107	0	\N	\N	\N	\N	\N	dt	511
5110729	Xã Diên Hòa	51107	0	\N	\N	\N	\N	\N	dh	511
5110731	Xã Diên Lộc	51107	0	\N	\N	\N	\N	\N	dl	511
5110733	Xã Diên Bình	51107	0	\N	\N	\N	\N	\N	db	511
5110735	Xã Suối Hiệp	51107	0	\N	\N	\N	\N	\N	sh	511
5110737	Xã Suối Tiên	51107	0	\N	\N	\N	\N	\N	st	511
5110739	Xã Suối Cát	51107	0	\N	\N	\N	\N	\N	sc	511
5110741	Xã Suối Tân	51107	0	\N	\N	\N	\N	\N	st	511
5110900	Không xác định	51109	0	\N	\N	\N	\N	\N	kx	511
5110901	Thị trấn Ba Ngòi	51109	0	\N	\N	\N	\N	\N	bn	511
5110903	Xã Cam Tân	51109	0	\N	\N	\N	\N	\N	ct	511
5110905	Xã Cam Hòa	51109	0	\N	\N	\N	\N	\N	ch	511
5110907	Xã Cam Hải Đông	51109	0	\N	\N	\N	\N	\N	chd	511
5110909	Xã Sơn Tân	51109	0	\N	\N	\N	\N	\N	st	511
5110911	Xã Cam Hiệp Bắc	51109	0	\N	\N	\N	\N	\N	chb	511
5110913	Xã Cam Hải Tây	51109	0	\N	\N	\N	\N	\N	cht	511
5110915	Xã Cam Đức	51109	0	\N	\N	\N	\N	\N	cd	511
5110917	Xã Cam Hiệp Nam	51109	0	\N	\N	\N	\N	\N	chn	511
5110919	Xã Cam Thành Bắc	51109	0	\N	\N	\N	\N	\N	ctb	511
5110921	Xã Cam Phước Tây	51109	0	\N	\N	\N	\N	\N	cpt	511
5110923	Xã Cam An Bắc	51109	0	\N	\N	\N	\N	\N	cab	511
5110925	Xã Cam An Nam	51109	0	\N	\N	\N	\N	\N	can	511
5110927	Xã Cam Thành Nam	51109	0	\N	\N	\N	\N	\N	ctn	511
5110929	Xã Cam Nghĩa	51109	0	\N	\N	\N	\N	\N	cn	511
5110931	Xã Cam Phúc Bắc	51109	0	\N	\N	\N	\N	\N	cpb	511
5110933	Xã Cam Phước Đông	51109	0	\N	\N	\N	\N	\N	cpd	511
5110935	Xã Cam Phúc Nam	51109	0	\N	\N	\N	\N	\N	cpn	511
5110937	Xã Cam Thịnh Tây	51109	0	\N	\N	\N	\N	\N	ctt	511
5110939	Xã Cam Thịnh Đông	51109	0	\N	\N	\N	\N	\N	ctd	511
5110941	Xã Cam Lập	51109	0	\N	\N	\N	\N	\N	cl	511
5110943	Xã Cam Bình	51109	0	\N	\N	\N	\N	\N	cb	511
5111100	Không xác định	51111	0	\N	\N	\N	\N	\N	kx	511
5111101	Thị trấn Khánh Vĩnh	51111	0	\N	\N	\N	\N	\N	kv	511
5111103	Xã Khánh Hiệp	51111	0	\N	\N	\N	\N	\N	kh	511
5111105	Xã Khánh Bình	51111	0	\N	\N	\N	\N	\N	kb	511
5111107	Xã Khánh Trung	51111	0	\N	\N	\N	\N	\N	kt	511
5111109	Xã Khánh Đông	51111	0	\N	\N	\N	\N	\N	kd	511
5111111	Xã Khánh Thượng	51111	0	\N	\N	\N	\N	\N	kt	511
5111113	Xã Khánh Nam	51111	0	\N	\N	\N	\N	\N	kn	511
5111115	Xã Giang Ly	51111	0	\N	\N	\N	\N	\N	gl	511
5111117	Xã Cầu Bà	51111	0	\N	\N	\N	\N	\N	cb	511
5111119	Xã Khánh Thành	51111	0	\N	\N	\N	\N	\N	kt	511
5111121	Xã Khánh Phú	51111	0	\N	\N	\N	\N	\N	kp	511
5111123	Xã Sơn Thái	51111	0	\N	\N	\N	\N	\N	st	511
5111125	Xã Liên Sang	51111	0	\N	\N	\N	\N	\N	ls	511
5111127	Xã Sông Cầu	51111	0	\N	\N	\N	\N	\N	sc	511
5111300	Không xác định	51113	0	\N	\N	\N	\N	\N	kx	511
5111301	Thị trấn Tô Hạp	51113	0	\N	\N	\N	\N	\N	th	511
5111303	Xã Thành Sơn	51113	0	\N	\N	\N	\N	\N	ts	511
5111305	Xã Sơn Lâm	51113	0	\N	\N	\N	\N	\N	sl	511
5111307	Xã Sơn Bình	51113	0	\N	\N	\N	\N	\N	sb	511
5111309	Xã Sơn Hiệp	51113	0	\N	\N	\N	\N	\N	sh	511
5111311	Xã Sơn Trung	51113	0	\N	\N	\N	\N	\N	st	511
5111313	Xã Ba Cụm Bắc	51113	0	\N	\N	\N	\N	\N	bcb	511
5111315	Xã Ba Cụm Nam	51113	0	\N	\N	\N	\N	\N	bcn	511
5111500	Không xác định	51115	0	\N	\N	\N	\N	\N	kx	511
6010000	Không xác định	60100	0	\N	\N	\N	\N	\N	kx	601
6010100	Không xác định	60101	0	\N	\N	\N	\N	\N	kx	601
6010101	Phường Quang Trung	60101	0	\N	\N	\N	\N	\N	qt	601
6010103	Phường Quyết Thắng	60101	0	\N	\N	\N	\N	\N	qt	601
6010105	Phường Thắng Lợi	60101	0	\N	\N	\N	\N	\N	tl	601
6010107	Phường Thống Nhất	60101	0	\N	\N	\N	\N	\N	tn	601
6010109	Xã Đắk Cấm	60101	0	\N	\N	\N	\N	\N	dc	601
6010111	Xã Kroong	60101	0	\N	\N	\N	\N	\N	k	601
6010113	Xã Ngọk Bay	60101	0	\N	\N	\N	\N	\N	nb	601
6010115	Xã Vinh Quang	60101	0	\N	\N	\N	\N	\N	vq	601
6010117	Xã Đắk Blà	60101	0	\N	\N	\N	\N	\N	db	601
6010119	Xã Ia Chim	60101	0	\N	\N	\N	\N	\N	ic	601
6010121	Xã Đoàn Kết	60101	0	\N	\N	\N	\N	\N	dk	601
6010123	Xã Chư Hreng	60101	0	\N	\N	\N	\N	\N	ch	601
6010125	Xã Đắk Rơ Wa	60101	0	\N	\N	\N	\N	\N	drw	601
6010127	Xã Hòa Bình	60101	0	\N	\N	\N	\N	\N	hb	601
6010129	Phường Lê Lợi	60101	0	\N	\N	\N	\N	\N	ll	601
6010131	Phường Duy Tân	60101	0	\N	\N	\N	\N	\N	dt	601
6010300	Không xác định	60103	0	\N	\N	\N	\N	\N	kx	601
6010301	Thị trấn Đắk Glei	60103	0	\N	\N	\N	\N	\N	dg	601
6010303	Xã Đắk Plô	60103	0	\N	\N	\N	\N	\N	dp	601
6010305	Xã Đắk Man	60103	0	\N	\N	\N	\N	\N	dm	601
6010307	Xã Đắk Nhoong	60103	0	\N	\N	\N	\N	\N	dn	601
6010309	Xã Đắk Pék	60103	0	\N	\N	\N	\N	\N	dp	601
6010311	Xã Đắk Choong	60103	0	\N	\N	\N	\N	\N	dc	601
6010313	Xã Mường Hoong	60103	0	\N	\N	\N	\N	\N	mh	601
6010315	Xã Ngọc Linh	60103	0	\N	\N	\N	\N	\N	nl	601
6010317	Xã Đắk Long	60103	0	\N	\N	\N	\N	\N	dl	601
6010319	Xã Đắk KRoong	60103	0	\N	\N	\N	\N	\N	dk	601
6010321	Xã Đắk Môn	60103	0	\N	\N	\N	\N	\N	dm	601
6010500	Không xác định	60105	0	\N	\N	\N	\N	\N	kx	601
6010501	Thị trấn Plei Cần	60105	0	\N	\N	\N	\N	\N	pc	601
6010503	Xã Đắk Ang	60105	0	\N	\N	\N	\N	\N	da	601
6010505	Xã Đắk Dục	60105	0	\N	\N	\N	\N	\N	dd	601
6010507	Xã Đắk Nông	60105	0	\N	\N	\N	\N	\N	dn	601
6010509	Xã Đắk Xú	60105	0	\N	\N	\N	\N	\N	dx	601
6010511	Xã Pờ Y	60105	0	\N	\N	\N	\N	\N	py	601
6010513	Xã Sa Loong	60105	0	\N	\N	\N	\N	\N	sl	601
6010700	Không xác định	60107	0	\N	\N	\N	\N	\N	kx	601
6010701	Thị trấn Đắk Tô	60107	0	\N	\N	\N	\N	\N	dt	601
6010703	Xã Đắk Na	60107	0	\N	\N	\N	\N	\N	dn	601
6010705	Xã Măng Xăng	60107	0	\N	\N	\N	\N	\N	mx	601
6010707	Xã Ngọk Lây	60107	0	\N	\N	\N	\N	\N	nl	601
6010709	Xã Đắk Sao	60107	0	\N	\N	\N	\N	\N	ds	601
6010711	Xã Đắk Tơ Kan	60107	0	\N	\N	\N	\N	\N	dtk	601
6010713	Xã Tu Mơ Rông	60107	0	\N	\N	\N	\N	\N	tmr	601
6010715	Xã Ngok Yêu	60107	0	\N	\N	\N	\N	\N	ny	601
6010719	Xã Văn Lem	60107	0	\N	\N	\N	\N	\N	vl	601
6010721	Xã Kon Đào	60107	0	\N	\N	\N	\N	\N	kd	601
6010723	Xã Đắk Hà	60107	0	\N	\N	\N	\N	\N	dh	601
6010725	Xã Tân Cảnh	60107	0	\N	\N	\N	\N	\N	tc	601
6010727	Xã Pô Kô	60107	0	\N	\N	\N	\N	\N	pk	601
6010729	Xã Diên Bình	60107	0	\N	\N	\N	\N	\N	db	601
6010900	Không xác định	60109	0	\N	\N	\N	\N	\N	kx	601
6010901	Thị trấn Kon Plông	60109	0	\N	\N	\N	\N	\N	kp	601
6010903	Xã Đak Ring	60109	0	\N	\N	\N	\N	\N	dr	601
6010905	Xã Măng Buk	60109	0	\N	\N	\N	\N	\N	mb	601
6010907	Xã Ngok Tem	60109	0	\N	\N	\N	\N	\N	nt	601
6010909	Xã Đak Kôi	60109	0	\N	\N	\N	\N	\N	dk	601
6010911	Xã Măng Cành	60109	0	\N	\N	\N	\N	\N	mc	601
6010913	Xã Hiếu	60109	0	\N	\N	\N	\N	\N	h	601
6010915	Xã Pờ Ê	60109	0	\N	\N	\N	\N	\N	pe	601
6010917	Xã Đak Ruồng	60109	0	\N	\N	\N	\N	\N	dr	601
6010919	Xã Tân Lập	60109	0	\N	\N	\N	\N	\N	tl	601
6010921	Xã Đak Pne	60109	0	\N	\N	\N	\N	\N	dp	601
6010923	Xã Đak Tờ Re	60109	0	\N	\N	\N	\N	\N	dtr	601
6011100	Không xác định	60111	0	\N	\N	\N	\N	\N	kx	601
6011101	Thị trấn Đak Hà	60111	0	\N	\N	\N	\N	\N	dh	601
6011103	Xã Đak PXi	60111	0	\N	\N	\N	\N	\N	dp	601
6011105	Xã Đak HRing	60111	0	\N	\N	\N	\N	\N	dh	601
6011109	Xã Ngok Wang	60111	0	\N	\N	\N	\N	\N	nw	601
6011111	Xã Hà Mòn	60111	0	\N	\N	\N	\N	\N	hm	601
6011113	Xã Ngok Réo	60111	0	\N	\N	\N	\N	\N	nr	601
6011115	Xã Đak La	60111	0	\N	\N	\N	\N	\N	dl	601
6011117	Xã Đắkmar	60111	0	\N	\N	\N	\N	\N	dm	601
6011300	Không xác định	60113	0	\N	\N	\N	\N	\N	kx	601
6011301	Thị trấn Sa Thầy	60113	0	\N	\N	\N	\N	\N	st	601
6011303	Xã Rơ Kơi	60113	0	\N	\N	\N	\N	\N	rk	601
6011305	Xã Mô Rai	60113	0	\N	\N	\N	\N	\N	mr	601
6011307	Xã Sa Nhơn	60113	0	\N	\N	\N	\N	\N	sn	601
6011309	Xã Sa Sơn	60113	0	\N	\N	\N	\N	\N	ss	601
6011311	Xã Sa Nghĩa	60113	0	\N	\N	\N	\N	\N	sn	601
6011313	Xã Sa Bình	60113	0	\N	\N	\N	\N	\N	sb	601
6011315	Xã Ya Xiêr	60113	0	\N	\N	\N	\N	\N	yx	601
6011317	Xã Ya ly	60113	0	\N	\N	\N	\N	\N	yl	601
6030000	Không xác định	60300	0	\N	\N	\N	\N	\N	kx	603
6030100	Không xác định	60301	0	\N	\N	\N	\N	\N	kx	603
6030101	Phường Yên Đỗ	60301	0	\N	\N	\N	\N	\N	yd	603
6030103	Phường Diên Hồng	60301	0	\N	\N	\N	\N	\N	dh	603
6030105	Phường Hội Thương	60301	0	\N	\N	\N	\N	\N	ht	603
6030107	Phường Hội Phú	60301	0	\N	\N	\N	\N	\N	hp	603
6030109	Phường Hoa Lư	60301	0	\N	\N	\N	\N	\N	hl	603
6030111	Phường Thống Nhất	60301	0	\N	\N	\N	\N	\N	tn	603
6030113	Xã Trà Bá	60301	0	\N	\N	\N	\N	\N	tb	603
6030115	Xã Biển Hồ	60301	0	\N	\N	\N	\N	\N	bh	603
6030117	Xã Tân Sơn	60301	0	\N	\N	\N	\N	\N	ts	603
6030119	Xã Trà Đa	60301	0	\N	\N	\N	\N	\N	td	603
6030121	Xã Chư á	60301	0	\N	\N	\N	\N	\N	ca	603
6030123	Xã An Phú	60301	0	\N	\N	\N	\N	\N	ap	603
6030125	Xã Diên Phú	60301	0	\N	\N	\N	\N	\N	dp	603
6030127	Xã Gào	60301	0	\N	\N	\N	\N	\N	g	603
6030300	Không xác định	60303	0	\N	\N	\N	\N	\N	kx	603
6030301	Thị trấn KBang	60303	0	\N	\N	\N	\N	\N	k	603
6030303	Xã Đăk Rong	60303	0	\N	\N	\N	\N	\N	dr	603
6030305	Xã Sơn Lang	60303	0	\N	\N	\N	\N	\N	sl	603
6030307	Xã Kon Pne	60303	0	\N	\N	\N	\N	\N	kp	603
6030309	Xã KRong	60303	0	\N	\N	\N	\N	\N	k	603
6030311	Xã Sơ Pai	60303	0	\N	\N	\N	\N	\N	sp	603
6030313	Xã Lơ Ku	60303	0	\N	\N	\N	\N	\N	lk	603
6030315	Xã Đông	60303	0	\N	\N	\N	\N	\N	d	603
6030317	Xã Nghĩa An	60303	0	\N	\N	\N	\N	\N	na	603
6030319	Xã Tơ Tung	60303	0	\N	\N	\N	\N	\N	tt	603
6030321	Xã Kông Lơng Khơng	60303	0	\N	\N	\N	\N	\N	klk	603
6030323	Xã Kông Bơ La	60303	0	\N	\N	\N	\N	\N	kbl	603
6030325	Xã Đăk HLơ	60303	0	\N	\N	\N	\N	\N	dh	603
6030500	Không xác định	60305	0	\N	\N	\N	\N	\N	kx	603
6030501	Thị trấn Mang Yang	60305	0	\N	\N	\N	\N	\N	my	603
6030503	Xã Hà Đông	60305	0	\N	\N	\N	\N	\N	hd	603
6030505	Xã Đăk Đoa	60305	0	\N	\N	\N	\N	\N	dd	603
6030507	Xã Ayun	60305	0	\N	\N	\N	\N	\N	a	603
6030509	Xã Hải Yang	60305	0	\N	\N	\N	\N	\N	hy	603
6030511	Xã Hà Bầu	60305	0	\N	\N	\N	\N	\N	hb	603
6030513	Xã Kon Gang	60305	0	\N	\N	\N	\N	\N	kg	603
6030515	Xã HRa	60305	0	\N	\N	\N	\N	\N	h	603
6030517	Xã Nam Yang	60305	0	\N	\N	\N	\N	\N	ny	603
6030519	Xã Kon Dơng	60305	0	\N	\N	\N	\N	\N	kd	603
6030521	Xã Kơ Dang	60305	0	\N	\N	\N	\N	\N	kd	603
6030523	Xã H Neng	60305	0	\N	\N	\N	\N	\N	hn	603
6030525	Xã Tân Bình	60305	0	\N	\N	\N	\N	\N	tb	603
6030527	Xã Glar	60305	0	\N	\N	\N	\N	\N	g	603
6030529	Xã Ia Dơk	60305	0	\N	\N	\N	\N	\N	id	603
6030531	Xã Trang	60305	0	\N	\N	\N	\N	\N	th	603
6030533	Xã Lơ Pang	60305	0	\N	\N	\N	\N	\N	lp	603
6030535	Xã Ia Pết	60305	0	\N	\N	\N	\N	\N	ip	603
6030537	Xã Ia Băng	60305	0	\N	\N	\N	\N	\N	ib	603
6030539	Xã Kon Thụp	60305	0	\N	\N	\N	\N	\N	kt	603
6030541	Xã Đê Ar	60305	0	\N	\N	\N	\N	\N	da	603
6030543	Xã Kon Chiêng	60305	0	\N	\N	\N	\N	\N	kc	603
6030545	Xã Đăk Trôi	60305	0	\N	\N	\N	\N	\N	dt	603
6030700	Không xác định	60307	0	\N	\N	\N	\N	\N	kx	603
6030701	Thị trấn Phú Hòa	60307	0	\N	\N	\N	\N	\N	ph	603
6030703	Xã Hà Tây	60307	0	\N	\N	\N	\N	\N	ht	603
6030705	Xã Ia Khươl	60307	0	\N	\N	\N	\N	\N	ik	603
6030707	Xã Ia Phí	60307	0	\N	\N	\N	\N	\N	ip	603
6030709	Xã Ia Mơ Nông	60307	0	\N	\N	\N	\N	\N	imn	603
6030711	Xã Đăk Tơ Ver	60307	0	\N	\N	\N	\N	\N	dtv	603
6030713	Xã Hòa Phú	60307	0	\N	\N	\N	\N	\N	hp	603
6030715	Xã Chư Đăng Ya	60307	0	\N	\N	\N	\N	\N	cdy	603
6030717	Xã Ia Ka	60307	0	\N	\N	\N	\N	\N	ik	603
6030719	Xã Nghĩa Hòa	60307	0	\N	\N	\N	\N	\N	nh	603
6030721	Xã Chư Jôr	60307	0	\N	\N	\N	\N	\N	cj	603
6030723	Xã Nghĩa Hưng	60307	0	\N	\N	\N	\N	\N	nh	603
6030900	Không xác định	60309	0	\N	\N	\N	\N	\N	kx	603
6030901	Thị trấn Ia Kha	60309	0	\N	\N	\N	\N	\N	ik	603
6030903	Xã Ia Sao	60309	0	\N	\N	\N	\N	\N	is	603
6030905	Xã Ia Hrung	60309	0	\N	\N	\N	\N	\N	ih	603
6030907	Xã Ia KRai	60309	0	\N	\N	\N	\N	\N	ik	603
6030909	Xã Ia Tô	60309	0	\N	\N	\N	\N	\N	it	603
6030911	Xã Ia Kênh	60309	0	\N	\N	\N	\N	\N	ik	603
6030913	Xã Ia O	60309	0	\N	\N	\N	\N	\N	io	603
6030915	Xã Ia Dêr	60309	0	\N	\N	\N	\N	\N	id	603
6030917	Xã Ia Chia	60309	0	\N	\N	\N	\N	\N	ic	603
6030919	Xã Ia Pếch	60309	0	\N	\N	\N	\N	\N	ip	603
6031100	Không xác định	60311	0	\N	\N	\N	\N	\N	kx	603
6031101	Thị trấn An Khê	60311	0	\N	\N	\N	\N	\N	ak	603
6031103	Xã Tú An	60311	0	\N	\N	\N	\N	\N	ta	603
6031105	Xã Hà Tam	60311	0	\N	\N	\N	\N	\N	ht	603
6031107	Xã Cửu An	60311	0	\N	\N	\N	\N	\N	ca	603
6031109	Xã Cư An	60311	0	\N	\N	\N	\N	\N	ca	603
6031111	Xã Song An	60311	0	\N	\N	\N	\N	\N	sa	603
6031113	Xã Tân An	60311	0	\N	\N	\N	\N	\N	ta	603
6031115	Xã Phú An	60311	0	\N	\N	\N	\N	\N	pa	603
6031117	Xã Yang Bắc	60311	0	\N	\N	\N	\N	\N	yb	603
6031119	Xã An Thành	60311	0	\N	\N	\N	\N	\N	at	603
6031121	Xã Thành An	60311	0	\N	\N	\N	\N	\N	ta	603
6031123	Xã Ya Hội	60311	0	\N	\N	\N	\N	\N	yh	603
6031300	Không xác định	60313	0	\N	\N	\N	\N	\N	kx	603
6031301	Thị trấn Kông Chro	60313	0	\N	\N	\N	\N	\N	kc	603
6031303	Xã Chư Krêy	60313	0	\N	\N	\N	\N	\N	ck	603
6031305	Xã An Trung	60313	0	\N	\N	\N	\N	\N	at	603
6031307	Xã Kông Yang	60313	0	\N	\N	\N	\N	\N	ky	603
6031309	Xã Đăk Tơ Pang	60313	0	\N	\N	\N	\N	\N	dtp	603
6031311	Xã SRó	60313	0	\N	\N	\N	\N	\N	s	603
6031313	Xã Đăk Song	60313	0	\N	\N	\N	\N	\N	ds	603
6031315	Xã Yang Trung	60313	0	\N	\N	\N	\N	\N	yt	603
6031317	Xã Ya Ma	60313	0	\N	\N	\N	\N	\N	ym	603
6031319	Xã Chư Long	60313	0	\N	\N	\N	\N	\N	cl	603
6031321	Xã Yang Nam	60313	0	\N	\N	\N	\N	\N	yn	603
6031500	Không xác định	60315	0	\N	\N	\N	\N	\N	kx	603
6031501	Thị trấn Chư Ty	60315	0	\N	\N	\N	\N	\N	ct	603
6031503	Xã Ia Dơk	60315	0	\N	\N	\N	\N	\N	id	603
6031505	Xã Ia Krêl	60315	0	\N	\N	\N	\N	\N	ik	603
6031507	Xã Ia Din	60315	0	\N	\N	\N	\N	\N	id	603
6031509	Xã Ia Kla	60315	0	\N	\N	\N	\N	\N	ik	603
6031511	Xã Ia Dom	60315	0	\N	\N	\N	\N	\N	id	603
6031513	Xã Ia Lang	60315	0	\N	\N	\N	\N	\N	il	603
6031515	Xã Ia Kriêng	60315	0	\N	\N	\N	\N	\N	ik	603
6031517	Xã Ia Pnôn	60315	0	\N	\N	\N	\N	\N	ip	603
6031519	Xã Ia Nan	60315	0	\N	\N	\N	\N	\N	in	603
6031700	Không xác định	60317	0	\N	\N	\N	\N	\N	kx	603
6031701	Thị trấn Chư Prông	60317	0	\N	\N	\N	\N	\N	cp	603
6031703	Xã Bình Giáo	60317	0	\N	\N	\N	\N	\N	bg	603
6031705	Xã Thăng Hưng	60317	0	\N	\N	\N	\N	\N	th	603
6031707	Xã Ia Phìn	60317	0	\N	\N	\N	\N	\N	ip	603
6031709	Xã Ia Băng	60317	0	\N	\N	\N	\N	\N	ib	603
6031711	Xã Ia Tôr	60317	0	\N	\N	\N	\N	\N	it	603
6031713	Xã Ia Boòng	60317	0	\N	\N	\N	\N	\N	ib	603
6031715	Xã Ia O	60317	0	\N	\N	\N	\N	\N	io	603
6031717	Xã Ia Púch	60317	0	\N	\N	\N	\N	\N	ip	603
6031719	Xã Ia Me	60317	0	\N	\N	\N	\N	\N	im	603
6031721	Xã Ia Vê	60317	0	\N	\N	\N	\N	\N	iv	603
6031723	Xã Ia Pia	60317	0	\N	\N	\N	\N	\N	ip	603
6031725	Xã Ia Lâu	60317	0	\N	\N	\N	\N	\N	il	603
6031727	Xã Ia Mơ	60317	0	\N	\N	\N	\N	\N	im	603
6031729	Xã Bàu Cạn	60317	0	\N	\N	\N	\N	\N	bc	603
6031900	Không xác định	60319	0	\N	\N	\N	\N	\N	kx	603
6031901	Thị trấn Chư Sê	60319	0	\N	\N	\N	\N	\N	cs	603
6031903	Xã Ia Tiêm	60319	0	\N	\N	\N	\N	\N	it	603
6031905	Xã Bờ  Ngoong	60319	0	\N	\N	\N	\N	\N	bn	603
6031907	Xã Ia Glai	60319	0	\N	\N	\N	\N	\N	ig	603
6031909	Xã A Lbá	60319	0	\N	\N	\N	\N	\N	al	603
6031911	Xã AYun	60319	0	\N	\N	\N	\N	\N	a	603
6031913	Xã Ia HLốp	60319	0	\N	\N	\N	\N	\N	ih	603
6031915	Xã Ia Blang	60319	0	\N	\N	\N	\N	\N	ib	603
6031917	Xã Dun	60319	0	\N	\N	\N	\N	\N	d	603
6031919	Xã H Bông	60319	0	\N	\N	\N	\N	\N	hb	603
6031921	Xã Ia Hrú	60319	0	\N	\N	\N	\N	\N	ih	603
6031923	Xã Ia Ko	60319	0	\N	\N	\N	\N	\N	ik	603
6031925	Xã Nhơn Hòa	60319	0	\N	\N	\N	\N	\N	nh	603
6031927	Xã Ia Le	60319	0	\N	\N	\N	\N	\N	il	603
6032100	Không xác định	60321	0	\N	\N	\N	\N	\N	kx	603
6032101	Thị trấn Ayun Pa	60321	0	\N	\N	\N	\N	\N	ap	603
6032103	Xã Pờ Tó	60321	0	\N	\N	\N	\N	\N	pt	603
6032105	Xã Chư A Thai	60321	0	\N	\N	\N	\N	\N	cat	603
6032107	Xã Ia Sol	60321	0	\N	\N	\N	\N	\N	is	603
6032109	Xã Chư Răng	60321	0	\N	\N	\N	\N	\N	cr	603
6032111	Xã Chư Mố	60321	0	\N	\N	\N	\N	\N	cm	603
6032113	Xã Ia Tul	60321	0	\N	\N	\N	\N	\N	it	603
6032115	Xã Ia Piar	60321	0	\N	\N	\N	\N	\N	ip	603
6032117	Xã  Ia MRơn	60321	0	\N	\N	\N	\N	\N	im	603
6032119	Xã Ia Trok	60321	0	\N	\N	\N	\N	\N	it	603
6032121	Xã Ia Hiao	60321	0	\N	\N	\N	\N	\N	ih	603
6032123	Xã Ia Rbol	60321	0	\N	\N	\N	\N	\N	ir	603
6032125	Xã Ia Yeng	60321	0	\N	\N	\N	\N	\N	iy	603
6032127	Xã Ia Rtô	60321	0	\N	\N	\N	\N	\N	ir	603
6032129	Xã Ia Sao	60321	0	\N	\N	\N	\N	\N	is	603
6032131	Xã Ia Broãi	60321	0	\N	\N	\N	\N	\N	ib	603
6032133	Xã Ia Kdăm	60321	0	\N	\N	\N	\N	\N	ik	603
6032135	Xã Kim Tân	60321	0	\N	\N	\N	\N	\N	kt	603
6032137	Thị trấn Phú Thiện	60321	0	\N	\N	\N	\N	\N	pt	603
6032300	Không xác định	60323	0	\N	\N	\N	\N	\N	kx	603
6032301	Thị trấn Phú Túc	60323	0	\N	\N	\N	\N	\N	pt	603
6032303	Xã Ia RSai	60323	0	\N	\N	\N	\N	\N	ir	603
6032305	Xã Ia RSươm	60323	0	\N	\N	\N	\N	\N	ir	603
6032307	Xã Chư Gu	60323	0	\N	\N	\N	\N	\N	cg	603
6032309	Xã Đất Bằng	60323	0	\N	\N	\N	\N	\N	db	603
6032311	Xã Ia Mláh	60323	0	\N	\N	\N	\N	\N	im	603
6032313	Xã Chư Drăng	60323	0	\N	\N	\N	\N	\N	cd	603
6032315	Xã Phú Cần	60323	0	\N	\N	\N	\N	\N	pc	603
6032317	Xã Ia HDreh	60323	0	\N	\N	\N	\N	\N	ih	603
6032319	Xã Ia Rmok	60323	0	\N	\N	\N	\N	\N	ir	603
6032321	Xã Chư Ngọc	60323	0	\N	\N	\N	\N	\N	cn	603
6032323	Xã Uar	60323	0	\N	\N	\N	\N	\N	u	603
6032325	Xã Chư RCăm	60323	0	\N	\N	\N	\N	\N	cr	603
6032327	Xã Krông Năng	60323	0	\N	\N	\N	\N	\N	kn	603
6050000	Không xác định	60500	0	\N	\N	\N	\N	\N	kx	605
6050100	Không xác định	60501	0	\N	\N	\N	\N	\N	kx	605
6050101	Phường Tân Lập	60501	0	\N	\N	\N	\N	\N	tl	605
6050103	Phường Tân Hoà	60501	0	\N	\N	\N	\N	\N	th	605
6050105	Phường Tân An	60501	0	\N	\N	\N	\N	\N	ta	605
6050107	Phường Thống Nhất	60501	0	\N	\N	\N	\N	\N	tn	605
6050109	Phường Thành Nhất	60501	0	\N	\N	\N	\N	\N	tn	605
6050111	Phường Thắng Lợi	60501	0	\N	\N	\N	\N	\N	tl	605
6050113	Phường Tân Lợi	60501	0	\N	\N	\N	\N	\N	tl	605
6050115	Phường Thành Công	60501	0	\N	\N	\N	\N	\N	tc	605
6050117	Phường Tân Thành	60501	0	\N	\N	\N	\N	\N	tt	605
6050119	Phường Tân Tiến	60501	0	\N	\N	\N	\N	\N	tt	605
6050121	Phường Tự An	60501	0	\N	\N	\N	\N	\N	ta	605
6050123	Phường Ea Tam	60501	0	\N	\N	\N	\N	\N	et	605
6050125	Phường Khánh Xuân	60501	0	\N	\N	\N	\N	\N	kx	605
6050127	Xã Hòa Thuận	60501	0	\N	\N	\N	\N	\N	ht	605
6050129	Xã Cư ÊBur	60501	0	\N	\N	\N	\N	\N	ce	605
6050131	Xã Ea Tu	60501	0	\N	\N	\N	\N	\N	et	605
6050133	Xã Hòa Thắng	60501	0	\N	\N	\N	\N	\N	ht	605
6050135	Xã Ea Kao	60501	0	\N	\N	\N	\N	\N	ek	605
6050300	Không xác định	60503	0	\N	\N	\N	\N	\N	kx	605
6050301	Thị trấn Ea Drăng	60503	0	\N	\N	\N	\N	\N	ed	605
6050303	Xã Ea Hleo	60503	0	\N	\N	\N	\N	\N	ehl	605
6050305	Xã Ea Sol	60503	0	\N	\N	\N	\N	\N	es	605
6050311	Xã Cư Mốt	60503	0	\N	\N	\N	\N	\N	cm	605
6050313	Xã Ea Hiao	60503	0	\N	\N	\N	\N	\N	eh	605
6050315	Xã Ea Khal	60503	0	\N	\N	\N	\N	\N	ek	605
6050317	Xã Dlê Yang	60503	0	\N	\N	\N	\N	\N	dy	605
6050319	Xã Ea Nam	60503	0	\N	\N	\N	\N	\N	en	605
6050500	Không xác định	60505	0	\N	\N	\N	\N	\N	kx	605
6050501	Xã Ea  Rôk	60505	0	\N	\N	\N	\N	\N	er	605
6050503	Xã Ya Tờ Mốt	60505	0	\N	\N	\N	\N	\N	ytm	605
6050505	Xã Ea Lê	60505	0	\N	\N	\N	\N	\N	el	605
6050507	Xã Ea Bung	60505	0	\N	\N	\N	\N	\N	eb	605
6050509	Xã Cư M Lan	60505	0	\N	\N	\N	\N	\N	cml	605
6050511	Xã Cư KBang	60505	0	\N	\N	\N	\N	\N	ck	605
6050513	Xã Ia Lốp	60505	0	\N	\N	\N	\N	\N	il	605
6050515	Thị trấn Ea Súp	60505	0	\N	\N	\N	\N	\N	es	605
6050700	Không xác định	60507	0	\N	\N	\N	\N	\N	kx	605
6050701	Xã ĐLiê Ya	60507	0	\N	\N	\N	\N	\N	dy	605
6050703	Xã Ea Tóh	60507	0	\N	\N	\N	\N	\N	et	605
6050705	Xã Ea Tam	60507	0	\N	\N	\N	\N	\N	et	605
6050707	Xã Phú Lộc	60507	0	\N	\N	\N	\N	\N	pl	605
6050709	Xã Tam Giang	60507	0	\N	\N	\N	\N	\N	tg	605
6050711	Xã Krông Năng	60507	0	\N	\N	\N	\N	\N	kn	605
6050713	Xã Ea Hồ	60507	0	\N	\N	\N	\N	\N	eh	605
6050715	Xã Phú Xuân	60507	0	\N	\N	\N	\N	\N	px	605
6050900	Không xác định	60509	0	\N	\N	\N	\N	\N	kx	605
6050901	Thị trấn Buôn Hồ	60509	0	\N	\N	\N	\N	\N	bh	605
6050903	Xã Cư Né	60509	0	\N	\N	\N	\N	\N	cn	605
6050905	Xã Cư Pơng	60509	0	\N	\N	\N	\N	\N	cp	605
6050907	Xã Pơng DRang	60509	0	\N	\N	\N	\N	\N	pd	605
6050909	Xã Đoàn Kết	60509	0	\N	\N	\N	\N	\N	dk	605
6050911	Xã Ea BLang	60509	0	\N	\N	\N	\N	\N	ebl	605
6050913	Xã Ea Drông	60509	0	\N	\N	\N	\N	\N	ed	605
6050915	Xã Thống Nhất	60509	0	\N	\N	\N	\N	\N	tn	605
6050917	Xã Ea Siên	60509	0	\N	\N	\N	\N	\N	es	605
6050919	Xã Bình Thuận	60509	0	\N	\N	\N	\N	\N	bt	605
6050921	Xã Cư Bao	60509	0	\N	\N	\N	\N	\N	cb	605
6051100	Không xác định	60511	0	\N	\N	\N	\N	\N	kx	605
6051101	Xã Krông Na	60511	0	\N	\N	\N	\N	\N	kn	605
6051103	Xã Ea Huar	60511	0	\N	\N	\N	\N	\N	eh	605
6051105	Xã Ea Wer	60511	0	\N	\N	\N	\N	\N	ew	605
6051107	Xã Cuôr KNia	60511	0	\N	\N	\N	\N	\N	ck	605
6051109	Xã Ea Bar	60511	0	\N	\N	\N	\N	\N	eb	605
6051111	Xã Ea Nuôl	60511	0	\N	\N	\N	\N	\N	en	605
6051300	Không xác định	60513	0	\N	\N	\N	\N	\N	kx	605
6051301	Thị trấn Ea Pốk	60513	0	\N	\N	\N	\N	\N	ep	605
6051303	Thị trấn  Quảng Phú	60513	0	\N	\N	\N	\N	\N	qp	605
6051305	Xã Quảng  Tiến	60513	0	\N	\N	\N	\N	\N	qt	605
6051307	Xã Ea Kiết	60513	0	\N	\N	\N	\N	\N	ek	605
6051309	Xã Ea Tar	60513	0	\N	\N	\N	\N	\N	et	605
6051311	Xã Cư Dliê M nông	60513	0	\N	\N	\N	\N	\N	cdm	605
6051313	Xã Ea H đinh	60513	0	\N	\N	\N	\N	\N	ehd	605
6051315	Xã Ea Tul	60513	0	\N	\N	\N	\N	\N	et	605
6051317	Xã Ea KPam	60513	0	\N	\N	\N	\N	\N	ek	605
6051319	Xã Ea M DRóh	60513	0	\N	\N	\N	\N	\N	em	605
6051321	Xã Cư M gar	60513	0	\N	\N	\N	\N	\N	cm	605
6051323	Xã Ea D Rơng	60513	0	\N	\N	\N	\N	\N	edr	605
6051325	Xã Ea M nang	60513	0	\N	\N	\N	\N	\N	em	605
6051327	Xã Cư Suê	60513	0	\N	\N	\N	\N	\N	cs	605
6051329	Xã Cuor Đăng	60513	0	\N	\N	\N	\N	\N	cd	605
6051500	Không xác định	60515	0	\N	\N	\N	\N	\N	kx	605
6051501	Thị trấn Ea Kar	60515	0	\N	\N	\N	\N	\N	ek	605
6051503	Thị trấn Ea Knốp	60515	0	\N	\N	\N	\N	\N	ek	605
6051505	Xã Ea Sô	60515	0	\N	\N	\N	\N	\N	es	605
6051507	Xã Xuân Phú	60515	0	\N	\N	\N	\N	\N	xp	605
6051509	Xã Cư Huê	60515	0	\N	\N	\N	\N	\N	ch	605
6051511	Xã Ea Tih	60515	0	\N	\N	\N	\N	\N	et	605
6051513	Xã Ea Đar	60515	0	\N	\N	\N	\N	\N	ed	605
6051515	Xã Ea Kmút	60515	0	\N	\N	\N	\N	\N	ek	605
6051517	Xã Cư Ni	60515	0	\N	\N	\N	\N	\N	cn	605
6051519	Xã Ea Păn	60515	0	\N	\N	\N	\N	\N	ep	605
6051521	Xã Ea Ô	60515	0	\N	\N	\N	\N	\N	eo	605
6051523	Xã Cư Jiang	60515	0	\N	\N	\N	\N	\N	cj	605
6051700	Không xác định	60517	0	\N	\N	\N	\N	\N	kx	605
6051701	Thị trấn MĐrắk	60517	0	\N	\N	\N	\N	\N	m	605
6051703	Xã Cư Prao	60517	0	\N	\N	\N	\N	\N	cp	605
6051705	Xã Ea Pil	60517	0	\N	\N	\N	\N	\N	ep	605
6051707	Xã Ea Lai	60517	0	\N	\N	\N	\N	\N	el	605
6051709	Xã Ea H MLay	60517	0	\N	\N	\N	\N	\N	eh	605
6051711	Xã Krông Jing	60517	0	\N	\N	\N	\N	\N	kj	605
6051713	Xã Ea M Doal	60517	0	\N	\N	\N	\N	\N	emd	605
6051715	Xã Ea Riêng	60517	0	\N	\N	\N	\N	\N	er	605
6051717	Xã Cư M ta	60517	0	\N	\N	\N	\N	\N	cm	605
6051719	Xã Cư K Róa	60517	0	\N	\N	\N	\N	\N	ckr	605
6051721	Xã KRông á	60517	0	\N	\N	\N	\N	\N	ká	605
6051723	Xã Ea Trang	60517	0	\N	\N	\N	\N	\N	et	605
6051900	Không xác định	60519	0	\N	\N	\N	\N	\N	kx	605
6051901	Thị trấn Phước An	60519	0	\N	\N	\N	\N	\N	pa	605
6051903	Xã KRông Búk	60519	0	\N	\N	\N	\N	\N	kb	605
6051905	Xã Ea Kly	60519	0	\N	\N	\N	\N	\N	ek	605
6051907	Xã Ea Kênh	60519	0	\N	\N	\N	\N	\N	ek	605
6051909	Xã Ea Phê	60519	0	\N	\N	\N	\N	\N	ep	605
6051911	Xã Ea KNuec	60519	0	\N	\N	\N	\N	\N	ek	605
6051913	Xã Ea Yông	60519	0	\N	\N	\N	\N	\N	ey	605
6051915	Xã Hòa An	60519	0	\N	\N	\N	\N	\N	ha	605
6051917	Xã Ea Kuăng	60519	0	\N	\N	\N	\N	\N	ek	605
6051919	Xã Hoà Đông	60519	0	\N	\N	\N	\N	\N	hd	605
6051921	Xã Ea Hiu	60519	0	\N	\N	\N	\N	\N	eh	605
6051923	Xã Hòa Tiến	60519	0	\N	\N	\N	\N	\N	ht	605
6051925	Xã Tân Tiến	60519	0	\N	\N	\N	\N	\N	tt	605
6051927	Xã Vụ Bổn	60519	0	\N	\N	\N	\N	\N	vb	605
6051929	Xã Ea Uy	60519	0	\N	\N	\N	\N	\N	eu	605
6051931	Xã Ea Yiêng	60519	0	\N	\N	\N	\N	\N	ey	605
6052100	Không xác định	60521	0	\N	\N	\N	\N	\N	kx	605
6052101	Thị trấn Ea T Ling	60521	0	\N	\N	\N	\N	\N	et	605
6052103	Xã Eapô	60521	0	\N	\N	\N	\N	\N	ep	605
6052105	Xã Nam Dong	60521	0	\N	\N	\N	\N	\N	nd	605
6052107	Xã Hòa Xuân	60521	0	\N	\N	\N	\N	\N	hx	605
6052109	Xã Đắk DRông	60521	0	\N	\N	\N	\N	\N	dd	605
6052111	Xã Hòa Khánh	60521	0	\N	\N	\N	\N	\N	hk	605
6052113	Xã Hòa Phú	60521	0	\N	\N	\N	\N	\N	hp	605
6052115	Xã Tâm Thắng	60521	0	\N	\N	\N	\N	\N	tt	605
6052117	Xã Trúc Sơn	60521	0	\N	\N	\N	\N	\N	ts	605
6052300	Không xác định	60523	0	\N	\N	\N	\N	\N	kx	605
6052301	Thị trấn Buôn Trấp	60523	0	\N	\N	\N	\N	\N	bt	605
6052303	Xã Cư Ê Wi	60523	0	\N	\N	\N	\N	\N	cew	605
6052305	Xã Ea Ktur	60523	0	\N	\N	\N	\N	\N	ek	605
6052307	Xã Ea Tiêu	60523	0	\N	\N	\N	\N	\N	et	605
6052309	Xã Ea BHốk	60523	0	\N	\N	\N	\N	\N	ebh	605
6052311	Xã Ea Hu	60523	0	\N	\N	\N	\N	\N	eh	605
6052313	Xã Ea Na	60523	0	\N	\N	\N	\N	\N	en	605
6052315	Xã Hòa Hiệp	60523	0	\N	\N	\N	\N	\N	hh	605
6052317	Xã Ea Bông	60523	0	\N	\N	\N	\N	\N	eb	605
6052319	Xã Dur KMăl	60523	0	\N	\N	\N	\N	\N	dk	605
6052321	Xã Bình Hòa	60523	0	\N	\N	\N	\N	\N	bh	605
6052323	Xã Quảng Điền	60523	0	\N	\N	\N	\N	\N	qd	605
6052500	Không xác định	60525	0	\N	\N	\N	\N	\N	kx	605
6052501	Thị trấn  Krông Kmar	60525	0	\N	\N	\N	\N	\N	kk	605
6052503	Xã Dang Kang	60525	0	\N	\N	\N	\N	\N	dk	605
6052505	Xã Cư KTy	60525	0	\N	\N	\N	\N	\N	ck	605
6052507	Xã Hòa Thành	60525	0	\N	\N	\N	\N	\N	ht	605
6052509	Xã Hòa Tân	60525	0	\N	\N	\N	\N	\N	ht	605
6052511	Xã Hòa Phong	60525	0	\N	\N	\N	\N	\N	hp	605
6052513	Xã Hòa Lễ	60525	0	\N	\N	\N	\N	\N	hl	605
6052515	Xã Ea Trul	60525	0	\N	\N	\N	\N	\N	et	605
6052517	Xã Khuê Ngọc Điền	60525	0	\N	\N	\N	\N	\N	knd	605
6052519	Xã Cư Pui	60525	0	\N	\N	\N	\N	\N	cp	605
6052521	Xã Hòa Sơn	60525	0	\N	\N	\N	\N	\N	hs	605
6052523	Xã Cư Drăm	60525	0	\N	\N	\N	\N	\N	cd	605
6052525	Xã Yang Mao	60525	0	\N	\N	\N	\N	\N	ym	605
6052700	Không xác định	60527	0	\N	\N	\N	\N	\N	kx	605
6052701	Thị trấn Đắk Mil	60527	0	\N	\N	\N	\N	\N	dm	605
6052703	Xã Đắk Gằn	60527	0	\N	\N	\N	\N	\N	dg	605
6052705	Xã Đức Mạnh	60527	0	\N	\N	\N	\N	\N	dm	605
6052707	Xã  Đắk Lao	60527	0	\N	\N	\N	\N	\N	dl	605
6052709	Xã Đắk Sắk	60527	0	\N	\N	\N	\N	\N	ds	605
6052711	Xã Đức Minh	60527	0	\N	\N	\N	\N	\N	dm	605
6052713	Xã Thuận An	60527	0	\N	\N	\N	\N	\N	ta	605
6052715	Xã Đắk Môl	60527	0	\N	\N	\N	\N	\N	dm	605
6052717	Xã Thuận Hạnh	60527	0	\N	\N	\N	\N	\N	th	605
6052719	Xã Đắk Song	60527	0	\N	\N	\N	\N	\N	ds	605
6052721	Xã Đắk R La	60527	0	\N	\N	\N	\N	\N	drl	605
6052900	Không xác định	60529	0	\N	\N	\N	\N	\N	kx	605
6052901	Xã Đắk Sôr	60529	0	\N	\N	\N	\N	\N	ds	605
6052903	Xã Nam Đà	60529	0	\N	\N	\N	\N	\N	nd	605
6052905	Xã Buôn Choah	60529	0	\N	\N	\N	\N	\N	bc	605
6052907	Xã Đắk Mâm	60529	0	\N	\N	\N	\N	\N	dm	605
6052909	Xã Đắk Rồ	60529	0	\N	\N	\N	\N	\N	dr	605
6052911	Xã Nam Nung	60529	0	\N	\N	\N	\N	\N	nn	605
6052913	Xã Đức Xuyên	60529	0	\N	\N	\N	\N	\N	dx	605
6052915	Xã Ea R Bin	60529	0	\N	\N	\N	\N	\N	er	605
6052917	Xã Đắk Nang	60529	0	\N	\N	\N	\N	\N	dn	605
6052919	Xã Quảng Phú	60529	0	\N	\N	\N	\N	\N	qp	605
6052921	Xã Nam Ka	60529	0	\N	\N	\N	\N	\N	nk	605
6053100	Không xác định	60531	0	\N	\N	\N	\N	\N	kx	605
6053101	Thị trấn Liên Sơn	60531	0	\N	\N	\N	\N	\N	ls	605
6053103	Xã Yang Tao	60531	0	\N	\N	\N	\N	\N	yt	605
6053105	Xã Bông Krang	60531	0	\N	\N	\N	\N	\N	bk	605
6053107	Xã Đắk Liêng	60531	0	\N	\N	\N	\N	\N	dl	605
6053109	Xã Buôn Triết	60531	0	\N	\N	\N	\N	\N	bt	605
6053111	Xã Buôn Tría	60531	0	\N	\N	\N	\N	\N	bt	605
6053113	Xã Đắk Phơi	60531	0	\N	\N	\N	\N	\N	dp	605
6053115	Xã Đắk Nuê	60531	0	\N	\N	\N	\N	\N	dn	605
6053117	Xã Krông Nô	60531	0	\N	\N	\N	\N	\N	kn	605
6053300	Không xác định	60533	0	\N	\N	\N	\N	\N	kx	605
6053301	Xã Quảng Trực	60533	0	\N	\N	\N	\N	\N	qt	605
6053303	Xã Đắk Búk So	60533	0	\N	\N	\N	\N	\N	dbs	605
6053305	Xã Đắk R Tíh	60533	0	\N	\N	\N	\N	\N	dr	605
6053307	Xã Quảng Tân	60533	0	\N	\N	\N	\N	\N	qt	605
6053309	Xã Nhân Cơ	60533	0	\N	\N	\N	\N	\N	nc	605
6053311	Xã Kiến Đức	60533	0	\N	\N	\N	\N	\N	kd	605
6053313	Xã Quảng Tín	60533	0	\N	\N	\N	\N	\N	qt	605
6053315	Xã Đạo Nghĩa	60533	0	\N	\N	\N	\N	\N	dn	605
6053317	Xã Đắk Sin	60533	0	\N	\N	\N	\N	\N	ds	605
6053500	Không xác định	60535	0	\N	\N	\N	\N	\N	kx	605
6053501	Thị trấn Gia Nghĩa	60535	0	\N	\N	\N	\N	\N	gn	605
6053503	Xã Đắk Rung	60535	0	\N	\N	\N	\N	\N	dr	605
6053505	Xã Quảng Sơn	60535	0	\N	\N	\N	\N	\N	qs	605
6053507	Xã Trường Xuân	60535	0	\N	\N	\N	\N	\N	tx	605
6053509	Xã Đắk Ha	60535	0	\N	\N	\N	\N	\N	dh	605
6053511	Xã Đắk R Măng	60535	0	\N	\N	\N	\N	\N	dr	605
6053513	Xã Quảng Thành	60535	0	\N	\N	\N	\N	\N	qt	605
6053515	Xã Đắk Nia	60535	0	\N	\N	\N	\N	\N	dn	605
6053517	Xã Quảng Khê	60535	0	\N	\N	\N	\N	\N	qk	605
6053519	Xã Đắk Plao	60535	0	\N	\N	\N	\N	\N	dp	605
6053521	Xã Đắk Som	60535	0	\N	\N	\N	\N	\N	ds	605
7010000	Không xác định	70100	0	\N	\N	\N	\N	\N	kx	701
7010100	Không xác định	70101	0	\N	\N	\N	\N	\N	kx	701
7010101	Phường Tân Định	70101	0	\N	\N	\N	\N	\N	td	701
7010103	Phường Đa Kao	70101	0	\N	\N	\N	\N	\N	dk	701
7010109	Phường Nguyễn Thái Bình	70101	0	\N	\N	\N	\N	\N	ntb	701
7010111	Phường Phạm Ngũ Lão	70101	0	\N	\N	\N	\N	\N	pnl	701
7010113	Phường Cầu Ông Lãnh	70101	0	\N	\N	\N	\N	\N	col	701
7010115	Phường Cô Giang	70101	0	\N	\N	\N	\N	\N	cg	701
7010117	Phường Nguyễn Cư Trinh	70101	0	\N	\N	\N	\N	\N	nct	701
7010119	Phường Cầu Kho	70101	0	\N	\N	\N	\N	\N	ck	701
7010300	Không xác định	70103	0	\N	\N	\N	\N	\N	kx	701
7010301	Phường An Phú	70103	0	\N	\N	\N	\N	\N	ap	701
7010303	Phường Thảo Điền	70103	0	\N	\N	\N	\N	\N	td	701
7010305	Phường An Khánh	70103	0	\N	\N	\N	\N	\N	ak	701
7010307	Phường Bình Khánh	70103	0	\N	\N	\N	\N	\N	bk	701
7010309	Phường Bình An	70103	0	\N	\N	\N	\N	\N	ba	701
7010311	Phường Thủ Thiêm	70103	0	\N	\N	\N	\N	\N	tt	701
7010313	Phường An Lợi Đông	70103	0	\N	\N	\N	\N	\N	ald	701
7010315	Phường Bình Trưng Tây	70103	0	\N	\N	\N	\N	\N	btt	701
7010317	Phường Bình Trưng Đông	70103	0	\N	\N	\N	\N	\N	btd	701
7010319	Phường Cát Lái	70103	0	\N	\N	\N	\N	\N	cl	701
7010321	Phường Thạnh Mỹ Lợi	70103	0	\N	\N	\N	\N	\N	tml	701
7010500	Không xác định	70105	0	\N	\N	\N	\N	\N	kx	701
7010519	Phường 10	70105	0	\N	\N	\N	\N	\N	10	701
7010521	Phường 11	70105	0	\N	\N	\N	\N	\N	11	701
7010523	Phường 12	70105	0	\N	\N	\N	\N	\N	12	701
7010525	Phường 13	70105	0	\N	\N	\N	\N	\N	13	701
7010527	Phường 14	70105	0	\N	\N	\N	\N	\N	14	701
7010700	Không xác định	70107	0	\N	\N	\N	\N	\N	kx	701
7010717	Phường 10	70107	0	\N	\N	\N	\N	\N	10	701
7010719	Phường 12	70107	0	\N	\N	\N	\N	\N	12	701
7010721	Phường 13	70107	0	\N	\N	\N	\N	\N	13	701
7010723	Phường 14	70107	0	\N	\N	\N	\N	\N	14	701
7010725	Phường 15	70107	0	\N	\N	\N	\N	\N	15	701
7010727	Phường 16	70107	0	\N	\N	\N	\N	\N	16	701
7010729	Phường 18	70107	0	\N	\N	\N	\N	\N	18	701
7010900	Không xác định	70109	0	\N	\N	\N	\N	\N	kx	701
7010919	Phường 10	70109	0	\N	\N	\N	\N	\N	10	701
7010921	Phường 11	70109	0	\N	\N	\N	\N	\N	11	701
7010923	Phường 12	70109	0	\N	\N	\N	\N	\N	12	701
7010925	Phường 13	70109	0	\N	\N	\N	\N	\N	13	701
7010927	Phường 14	70109	0	\N	\N	\N	\N	\N	14	701
7010929	Phường 15	70109	0	\N	\N	\N	\N	\N	15	701
7011100	Không xác định	70111	0	\N	\N	\N	\N	\N	kx	701
7011119	Phường 10	70111	0	\N	\N	\N	\N	\N	10	701
7011121	Phường 11	70111	0	\N	\N	\N	\N	\N	11	701
7011123	Phường 12	70111	0	\N	\N	\N	\N	\N	12	701
7011125	Phường 13	70111	0	\N	\N	\N	\N	\N	13	701
7011127	Phường 14	70111	0	\N	\N	\N	\N	\N	14	701
7011300	Không xác định	70113	0	\N	\N	\N	\N	\N	kx	701
7011301	Phường Phú Mỹ	70113	0	\N	\N	\N	\N	\N	pm	701
7011303	Phường Phú Thuận	70113	0	\N	\N	\N	\N	\N	pt	701
7011305	Phường Tân Phú	70113	0	\N	\N	\N	\N	\N	tp	701
7011307	Phường Tân Thuận Đông	70113	0	\N	\N	\N	\N	\N	ttd	701
7011309	Phường Bình Thuận	70113	0	\N	\N	\N	\N	\N	bt	701
7011311	Phường Tân Thuận Tây	70113	0	\N	\N	\N	\N	\N	ttt	701
7011313	Phường Tân Kiểng	70113	0	\N	\N	\N	\N	\N	tk	701
7011315	Phường Tân Quy	70113	0	\N	\N	\N	\N	\N	tq	701
7170125	Phước thắng	71701	0	\N	\N	\N	\N	\N	zpt	717
7011317	Phường Tân Phong	70113	0	\N	\N	\N	\N	\N	tp	701
7011319	Phường Tân Hưng	70113	0	\N	\N	\N	\N	\N	th	701
7011500	Không xác định	70115	0	\N	\N	\N	\N	\N	kx	701
7011519	Phường 10	70115	0	\N	\N	\N	\N	\N	10	701
7011521	Phường 11	70115	0	\N	\N	\N	\N	\N	11	701
7011523	Phường 12	70115	0	\N	\N	\N	\N	\N	12	701
7011525	Phường 13	70115	0	\N	\N	\N	\N	\N	13	701
7011527	Phường 14	70115	0	\N	\N	\N	\N	\N	14	701
7011529	Phường 15	70115	0	\N	\N	\N	\N	\N	15	701
7011531	Phường 16	70115	0	\N	\N	\N	\N	\N	16	701
7011700	Không xác định	70117	0	\N	\N	\N	\N	\N	kx	701
7011701	Phường Phước Long A	70117	0	\N	\N	\N	\N	\N	pla	701
7011703	Phường Phước Long B	70117	0	\N	\N	\N	\N	\N	plb	701
7011705	Phường Tăng Nhơn Phú A	70117	0	\N	\N	\N	\N	\N	tnpa	701
7011707	Phường Tăng Nhơn Phú B	70117	0	\N	\N	\N	\N	\N	tnpb	701
7011709	Phường Long Trường	70117	0	\N	\N	\N	\N	\N	lt	701
7011711	Phường Trường Thạnh	70117	0	\N	\N	\N	\N	\N	tt	701
7011713	Phường Phước Bình	70117	0	\N	\N	\N	\N	\N	pb	701
7011715	Phường Tân Phú	70117	0	\N	\N	\N	\N	\N	tp	701
7011717	Phường Hiệp Phú	70117	0	\N	\N	\N	\N	\N	hp	701
7011719	Phường Long Thạnh Mỹ	70117	0	\N	\N	\N	\N	\N	ltm	701
7011721	Phường Long Bình	70117	0	\N	\N	\N	\N	\N	lb	701
7011723	Phường Long Phước	70117	0	\N	\N	\N	\N	\N	lp	701
7011725	Phường Phú Hữu	70117	0	\N	\N	\N	\N	\N	ph	701
7011900	Không xác định	70119	0	\N	\N	\N	\N	\N	kx	701
7011919	Phường 10	70119	0	\N	\N	\N	\N	\N	10	701
7011921	Phường 11	70119	0	\N	\N	\N	\N	\N	11	701
7011923	Phường 12	70119	0	\N	\N	\N	\N	\N	12	701
7012100	Không xác định	70121	0	\N	\N	\N	\N	\N	kx	701
7012119	Phường 10	70121	0	\N	\N	\N	\N	\N	10	701
7012121	Phường 11	70121	0	\N	\N	\N	\N	\N	11	701
7012123	Phường 12	70121	0	\N	\N	\N	\N	\N	12	701
7012125	Phường 13	70121	0	\N	\N	\N	\N	\N	13	701
7012127	Phường 14	70121	0	\N	\N	\N	\N	\N	14	701
7012129	Phường 15	70121	0	\N	\N	\N	\N	\N	15	701
7012131	Phường 16	70121	0	\N	\N	\N	\N	\N	16	701
7012300	Không xác định	70123	0	\N	\N	\N	\N	\N	kx	701
7012301	Phường Tân Thới Nhất	70123	0	\N	\N	\N	\N	\N	ttn	701
7012303	Phường Đông Hưng Thuận	70123	0	\N	\N	\N	\N	\N	dht	701
7012305	Phường An Phú Đông	70123	0	\N	\N	\N	\N	\N	apd	701
7012307	Phường Trung Mỹ Tây	70123	0	\N	\N	\N	\N	\N	tmt	701
7012309	Phường Tân Chánh Hiệp	70123	0	\N	\N	\N	\N	\N	tch	701
7012311	Phường Thạnh Lộc	70123	0	\N	\N	\N	\N	\N	tl	701
7012313	Phường Thạnh Xuân	70123	0	\N	\N	\N	\N	\N	tx	701
7012315	Phường Hiệp Thành	70123	0	\N	\N	\N	\N	\N	ht	701
7012317	Phường Thới An	70123	0	\N	\N	\N	\N	\N	ta	701
7012319	Phường Tân Thới Hiệp	70123	0	\N	\N	\N	\N	\N	tth	701
7012500	Không xác định	70125	0	\N	\N	\N	\N	\N	kx	701
7012511	Phường 10	70125	0	\N	\N	\N	\N	\N	10	701
7012513	Phường 11	70125	0	\N	\N	\N	\N	\N	11	701
7012515	Phường 12	70125	0	\N	\N	\N	\N	\N	12	701
7012517	Phường 13	70125	0	\N	\N	\N	\N	\N	13	701
7012519	Phường 15	70125	0	\N	\N	\N	\N	\N	15	701
7012521	Phường 16	70125	0	\N	\N	\N	\N	\N	16	701
7012523	Phường 17	70125	0	\N	\N	\N	\N	\N	17	701
7012700	Không xác định	70127	0	\N	\N	\N	\N	\N	kx	701
7012719	Phường 10	70127	0	\N	\N	\N	\N	\N	10	701
7012721	Phường 11	70127	0	\N	\N	\N	\N	\N	11	701
7012723	Phường 12	70127	0	\N	\N	\N	\N	\N	12	701
7012725	Phường 13	70127	0	\N	\N	\N	\N	\N	13	701
7012727	Phường 14	70127	0	\N	\N	\N	\N	\N	14	701
7012729	Phường 15	70127	0	\N	\N	\N	\N	\N	15	701
7012733	Phường 17	70127	0	\N	\N	\N	\N	\N	17	701
7012735	Phường 18	70127	0	\N	\N	\N	\N	\N	18	701
7012737	Phường 19	70127	0	\N	\N	\N	\N	\N	19	701
7012739	Phường 20	70127	0	\N	\N	\N	\N	\N	20	701
7012900	Không xác định	70129	0	\N	\N	\N	\N	\N	kx	701
7012913	Phường 11	70129	0	\N	\N	\N	\N	\N	11	701
7012915	Phường 12	70129	0	\N	\N	\N	\N	\N	12	701
7012917	Phường 13	70129	0	\N	\N	\N	\N	\N	13	701
7012919	Phường 14	70129	0	\N	\N	\N	\N	\N	14	701
7012921	Phường 15	70129	0	\N	\N	\N	\N	\N	15	701
7012923	Phường 17	70129	0	\N	\N	\N	\N	\N	17	701
7012925	Phường 19	70129	0	\N	\N	\N	\N	\N	19	701
7012927	Phường 21	70129	0	\N	\N	\N	\N	\N	21	701
7012929	Phường 22	70129	0	\N	\N	\N	\N	\N	22	701
7012931	Phường 24	70129	0	\N	\N	\N	\N	\N	24	701
7012933	Phường 25	70129	0	\N	\N	\N	\N	\N	25	701
7012935	Phường 26	70129	0	\N	\N	\N	\N	\N	26	701
7012937	Phường 27	70129	0	\N	\N	\N	\N	\N	27	701
7012939	Phường 28	70129	0	\N	\N	\N	\N	\N	28	701
7013100	Không xác định	70131	0	\N	\N	\N	\N	\N	kx	701
7013117	Phường 10	70131	0	\N	\N	\N	\N	\N	10	701
7013119	Phường 11	70131	0	\N	\N	\N	\N	\N	11	701
7013121	Phường 12	70131	0	\N	\N	\N	\N	\N	12	701
7013123	Phường 13	70131	0	\N	\N	\N	\N	\N	13	701
7013125	Phường 14	70131	0	\N	\N	\N	\N	\N	14	701
7013127	Phường 15	70131	0	\N	\N	\N	\N	\N	15	701
7013129	Phường 17	70131	0	\N	\N	\N	\N	\N	17	701
7013300	Không xác định	70133	0	\N	\N	\N	\N	\N	kx	701
7013301	Phường Linh Đông	70133	0	\N	\N	\N	\N	\N	ld	701
7013303	Phường Hiệp Bình Chánh	70133	0	\N	\N	\N	\N	\N	hbc	701
7013305	Phường Hiệp Bình Phước	70133	0	\N	\N	\N	\N	\N	hbp	701
7013307	Phường Tam Phú	70133	0	\N	\N	\N	\N	\N	tp	701
7013309	Phường Linh Xuân	70133	0	\N	\N	\N	\N	\N	lx	701
7013311	Phường Linh Chiểu	70133	0	\N	\N	\N	\N	\N	lc	701
7013313	Phường Trường Thọ	70133	0	\N	\N	\N	\N	\N	tt	701
7013315	Phường Bình Chiểu	70133	0	\N	\N	\N	\N	\N	bc	701
7013317	Phường Linh Tây	70133	0	\N	\N	\N	\N	\N	lt	701
7013319	Phường Bình Thọ	70133	0	\N	\N	\N	\N	\N	bt	701
7013321	Phường Tam Bình	70133	0	\N	\N	\N	\N	\N	tb	701
7013323	Phường Linh Trung	70133	0	\N	\N	\N	\N	\N	lt	701
7013500	Không xác định	70135	0	\N	\N	\N	\N	\N	kx	701
7013501	Thị trấn Củ Chi	70135	0	\N	\N	\N	\N	\N	cc	701
7012909	Phường 6	70129	0	\N	\N	\N	\N	\N	6	701
7013503	Xã Phú Hòa Đông	70135	0	\N	\N	\N	\N	\N	phd	701
7013505	Xã Tân Thạnh Đông	70135	0	\N	\N	\N	\N	\N	ttd	701
7013507	Xã Tân Thạnh Tây	70135	0	\N	\N	\N	\N	\N	ttt	701
7013509	Xã Trung An	70135	0	\N	\N	\N	\N	\N	ta	701
7013511	Xã Phước Vĩnh An	70135	0	\N	\N	\N	\N	\N	pva	701
7013513	Xã Hòa Phú	70135	0	\N	\N	\N	\N	\N	hp	701
7013515	Xã Tân An Hội	70135	0	\N	\N	\N	\N	\N	tah	701
7013517	Xã Tân Thông Hội	70135	0	\N	\N	\N	\N	\N	tth	701
7013519	Xã Tân Phú Trung	70135	0	\N	\N	\N	\N	\N	tpt	701
7013521	Xã Thái Mỹ	70135	0	\N	\N	\N	\N	\N	tm	701
7013523	Xã Phước Thạnh	70135	0	\N	\N	\N	\N	\N	pt	701
7013525	Xã An Nhơn Tây	70135	0	\N	\N	\N	\N	\N	ant	701
7013527	Xã Trung Lập Thượng	70135	0	\N	\N	\N	\N	\N	tlt	701
7013529	Xã Phú Mỹ Hưng	70135	0	\N	\N	\N	\N	\N	pmh	701
7013531	Xã An Phú	70135	0	\N	\N	\N	\N	\N	ap	701
7013533	Xã Nhuận Đức	70135	0	\N	\N	\N	\N	\N	nd	701
7013535	Xã Phạm Văn Cội	70135	0	\N	\N	\N	\N	\N	pvc	701
7013537	Xã Bình Mỹ	70135	0	\N	\N	\N	\N	\N	bm	701
7013539	Xã Phước Hiệp	70135	0	\N	\N	\N	\N	\N	ph	701
7013541	Xã Trung Lập Hạ	70135	0	\N	\N	\N	\N	\N	tlh	701
7013700	Không xác định	70137	0	\N	\N	\N	\N	\N	kx	701
7013701	Thị trấn Hóc Môn	70137	0	\N	\N	\N	\N	\N	hm	701
7013703	Xã Tân Thới Nhì	70137	0	\N	\N	\N	\N	\N	ttn	701
7013705	Xã Tân Hiệp	70137	0	\N	\N	\N	\N	\N	th	701
7013707	Xã Thới Tam Thôn	70137	0	\N	\N	\N	\N	\N	ttt	701
7013709	Xã Đông Thạnh	70137	0	\N	\N	\N	\N	\N	dt	701
7013711	Xã Nhị Bình	70137	0	\N	\N	\N	\N	\N	nb	701
7013713	Xã Xuân Thới Sơn	70137	0	\N	\N	\N	\N	\N	xts	701
7013715	Xã Tân Xuân	70137	0	\N	\N	\N	\N	\N	tx	701
7013717	Xã Xuân Thới Thượng	70137	0	\N	\N	\N	\N	\N	xtt	701
7013719	Xã Bà Điểm	70137	0	\N	\N	\N	\N	\N	bd	701
7013900	Không xác định	70139	0	\N	\N	\N	\N	\N	kx	701
7013901	Thị trấn An Lạc	70139	0	\N	\N	\N	\N	\N	al	701
7013903	Xã Bình Hưng	70139	0	\N	\N	\N	\N	\N	bh	701
7013905	Xã Phong Phú	70139	0	\N	\N	\N	\N	\N	pp	701
7013907	Xã Đa Phước	70139	0	\N	\N	\N	\N	\N	dp	701
7013909	Xã Quy Đức	70139	0	\N	\N	\N	\N	\N	qd	701
7013911	Xã Hưng Long	70139	0	\N	\N	\N	\N	\N	hl	701
7013913	Xã Tân Quý Tây	70139	0	\N	\N	\N	\N	\N	tqt	701
7013915	Xã Bình Chánh	70139	0	\N	\N	\N	\N	\N	bc	701
7013917	Xã Bình Trị Đông	70139	0	\N	\N	\N	\N	\N	btd	701
7013919	Xã Tân Tạo	70139	0	\N	\N	\N	\N	\N	tt	701
7013921	Xã Bình Hưng Hòa	70139	0	\N	\N	\N	\N	\N	bhh	701
7013923	Xã Vĩnh Lộc A	70139	0	\N	\N	\N	\N	\N	vla	701
7013925	Xã Vĩnh Lộc B	70139	0	\N	\N	\N	\N	\N	vlb	701
7013927	Xã Phạm Văn Hai	70139	0	\N	\N	\N	\N	\N	pvh	701
7013929	Xã Lê Minh Xuân	70139	0	\N	\N	\N	\N	\N	lmx	701
7013931	Xã Bình Lợi	70139	0	\N	\N	\N	\N	\N	bl	701
7013933	Xã Tân Nhựt	70139	0	\N	\N	\N	\N	\N	tn	701
7013935	Xã Tân Túc	70139	0	\N	\N	\N	\N	\N	tt	701
7013937	Xã Tân Kiên	70139	0	\N	\N	\N	\N	\N	tk	701
7013939	Xã An Phú Tây	70139	0	\N	\N	\N	\N	\N	apt	701
7014100	Không xác định	70141	0	\N	\N	\N	\N	\N	kx	701
7014101	Thị trấn Nhà Bè	70141	0	\N	\N	\N	\N	\N	nb	701
7014103	Xã Phú Xuân	70141	0	\N	\N	\N	\N	\N	px	701
7014105	Xã Phước Kiển	70141	0	\N	\N	\N	\N	\N	pk	701
7014107	Xã Phước Lộc	70141	0	\N	\N	\N	\N	\N	pl	701
7014109	Xã Nhơn Đức	70141	0	\N	\N	\N	\N	\N	nd	701
7014111	Xã Long Thới	70141	0	\N	\N	\N	\N	\N	lt	701
7014113	Xã Hiệp Phước	70141	0	\N	\N	\N	\N	\N	hp	701
7014300	Không xác định	70143	0	\N	\N	\N	\N	\N	kx	701
7014301	Xã Cần Thạnh	70143	0	\N	\N	\N	\N	\N	ct	701
7014303	Xã Long Hòa	70143	0	\N	\N	\N	\N	\N	lh	701
7014305	Xã Lý Nhơn	70143	0	\N	\N	\N	\N	\N	ln	701
7014307	Xã Thạnh An	70143	0	\N	\N	\N	\N	\N	ta	701
7014309	Xã Tam Thôn Hiệp	70143	0	\N	\N	\N	\N	\N	tth	701
7014311	Xã Bình Khánh	70143	0	\N	\N	\N	\N	\N	bk	701
7014313	Xã An Thới Đông	70143	0	\N	\N	\N	\N	\N	atd	701
7030000	Không xác định	70300	0	\N	\N	\N	\N	\N	kx	703
7030100	Không xác định	70301	0	\N	\N	\N	\N	\N	kx	703
7030101	Phường 1	70301	0	\N	\N	\N	\N	\N	1	703
7030103	Phường 2	70301	0	\N	\N	\N	\N	\N	2	703
7030105	Phường 3	70301	0	\N	\N	\N	\N	\N	3	703
7030107	Phường 4	70301	0	\N	\N	\N	\N	\N	4	703
7030109	Phường 5	70301	0	\N	\N	\N	\N	\N	5	703
7030111	Phường 6	70301	0	\N	\N	\N	\N	\N	6	703
7030113	Phường 7	70301	0	\N	\N	\N	\N	\N	7	703
7030115	Phường 8	70301	0	\N	\N	\N	\N	\N	8	703
7030117	Phường 9	70301	0	\N	\N	\N	\N	\N	9	703
7030119	Phường 10	70301	0	\N	\N	\N	\N	\N	10	703
7030121	Phường 11	70301	0	\N	\N	\N	\N	\N	11	703
7030123	Phường 12	70301	0	\N	\N	\N	\N	\N	12	703
7030125	Xã Xuân Thọ	70301	0	\N	\N	\N	\N	\N	xt	703
7030127	Xã Xuân Trường	70301	0	\N	\N	\N	\N	\N	xt	703
7030129	Xã Tà Nung	70301	0	\N	\N	\N	\N	\N	tn	703
7030300	Không xác định	70303	0	\N	\N	\N	\N	\N	kx	703
7030301	Phường 1	70303	0	\N	\N	\N	\N	\N	1	703
7030303	Phường 2	70303	0	\N	\N	\N	\N	\N	2	703
7030305	Phường Lộc Phát	70303	0	\N	\N	\N	\N	\N	lp	703
7012713	Phường 7	70127	0	\N	\N	\N	\N	\N	7	701
7030307	Phường Lộc Tiến	70303	0	\N	\N	\N	\N	\N	lt	703
7030309	Phường B lao	70303	0	\N	\N	\N	\N	\N	b	703
7030311	Phường Lộc Sơn	70303	0	\N	\N	\N	\N	\N	ls	703
7030313	Xã Đam Bri	70303	0	\N	\N	\N	\N	\N	db	703
7030315	Xã Lộc Thanh	70303	0	\N	\N	\N	\N	\N	lt	703
7030317	Xã Lộc Nga	70303	0	\N	\N	\N	\N	\N	ln	703
7030319	Xã Lộc Châu	70303	0	\N	\N	\N	\N	\N	lc	703
7030500	Không xác định	70305	0	\N	\N	\N	\N	\N	kx	703
7030501	Xã Lát	70305	0	\N	\N	\N	\N	\N	l	703
7030503	Xã Đạ Chais	70305	0	\N	\N	\N	\N	\N	dc	703
7030505	Xã Đạ Sar	70305	0	\N	\N	\N	\N	\N	ds	703
7030507	Xã Đạ Long	70305	0	\N	\N	\N	\N	\N	dl	703
7030509	Xã Đạ Tông	70305	0	\N	\N	\N	\N	\N	dt	703
7030511	Xã Đam Rong	70305	0	\N	\N	\N	\N	\N	dr	703
7030700	Không xác định	70307	0	\N	\N	\N	\N	\N	kx	703
7030701	Thị trấn Thạnh Mỹ	70307	0	\N	\N	\N	\N	\N	tm	703
7030703	Thị trấn D Ran	70307	0	\N	\N	\N	\N	\N	d	703
7030705	Xã Lạc Xuân	70307	0	\N	\N	\N	\N	\N	lx	703
7030707	Xã Lạc Lâm	70307	0	\N	\N	\N	\N	\N	ll	703
7030709	Xã Ka Đô	70307	0	\N	\N	\N	\N	\N	kd	703
7030711	Xã Quảng Lập	70307	0	\N	\N	\N	\N	\N	ql	703
7030713	Xã Pró	70307	0	\N	\N	\N	\N	\N	p	703
7030715	Xã Ka Đơn	70307	0	\N	\N	\N	\N	\N	kd	703
7030717	Xã Tu Tra	70307	0	\N	\N	\N	\N	\N	tt	703
7030900	Không xác định	70309	0	\N	\N	\N	\N	\N	kx	703
7030901	Thị trấn Liên Nghĩa	70309	0	\N	\N	\N	\N	\N	ln	703
7030903	Xã Hiệp Thạnh	70309	0	\N	\N	\N	\N	\N	ht	703
7030905	Xã Liên Hiệp	70309	0	\N	\N	\N	\N	\N	lh	703
7030907	Xã Bình Thạnh	70309	0	\N	\N	\N	\N	\N	bt	703
7030909	Xã N Thol Hạ	70309	0	\N	\N	\N	\N	\N	nh	703
7030911	Xã Tân Hội	70309	0	\N	\N	\N	\N	\N	th	703
7030913	Xã Phú Hội	70309	0	\N	\N	\N	\N	\N	ph	703
7030915	Xã Ninh Gia	70309	0	\N	\N	\N	\N	\N	ng	703
7030917	Xã Tà Hine	70309	0	\N	\N	\N	\N	\N	th	703
7030919	Xã Ninh Loan	70309	0	\N	\N	\N	\N	\N	nl	703
7030921	Xã Đà Loan	70309	0	\N	\N	\N	\N	\N	dl	703
7030923	Xã Tà Năng	70309	0	\N	\N	\N	\N	\N	tn	703
7031100	Không xác định	70311	0	\N	\N	\N	\N	\N	kx	703
7170126	Thắng nhất	71701	0	\N	\N	\N	\N	\N	ztn	717
7031101	Thị trấn Đinh Văn	70311	0	\N	\N	\N	\N	\N	dv	703
7031103	Thị trấn Nam Ban	70311	0	\N	\N	\N	\N	\N	nb	703
7031105	Xã Đạ Đờn	70311	0	\N	\N	\N	\N	\N	dd	703
7031107	Xã Phi Tô	70311	0	\N	\N	\N	\N	\N	pt	703
7031109	Xã Phú Sơn	70311	0	\N	\N	\N	\N	\N	ps	703
7031111	Xã Phi Liêng	70311	0	\N	\N	\N	\N	\N	pl	703
7031113	Xã Liêng S Roin	70311	0	\N	\N	\N	\N	\N	ls	703
7031115	Xã Rô Men	70311	0	\N	\N	\N	\N	\N	rm	703
7031117	Xã Tân Văn	70311	0	\N	\N	\N	\N	\N	tv	703
7031119	Xã Tân Hà	70311	0	\N	\N	\N	\N	\N	th	703
7031121	Xã Phúc Thọ	70311	0	\N	\N	\N	\N	\N	pt	703
7031123	Xã Hoài Đức	70311	0	\N	\N	\N	\N	\N	hd	703
7031125	Xã Tân Thanh	70311	0	\N	\N	\N	\N	\N	tt	703
7031127	Xã Đan Phượng	70311	0	\N	\N	\N	\N	\N	dp	703
7031129	Xã Gia Lâm	70311	0	\N	\N	\N	\N	\N	gl	703
7031131	Xã Đông Thanh	70311	0	\N	\N	\N	\N	\N	dt	703
7031133	Xã Mê Linh	70311	0	\N	\N	\N	\N	\N	ml	703
7031300	Không xác định	70313	0	\N	\N	\N	\N	\N	kx	703
7031301	Thị trấn Lộc Thắng	70313	0	\N	\N	\N	\N	\N	lt	703
7031303	Xã Lộc Bảo	70313	0	\N	\N	\N	\N	\N	lb	703
7031305	Xã Lộc Bắc	70313	0	\N	\N	\N	\N	\N	lb	703
7031307	Xã Lộc Lâm	70313	0	\N	\N	\N	\N	\N	ll	703
7031309	Xã Lộc Phú	70313	0	\N	\N	\N	\N	\N	lp	703
7031311	Xã Lộc Quảng	70313	0	\N	\N	\N	\N	\N	lq	703
7031313	Xã Lộc Ngãi	70313	0	\N	\N	\N	\N	\N	ln	703
7031315	Xã Lộc Đức	70313	0	\N	\N	\N	\N	\N	ld	703
7031317	Xã Lộc Tân	70313	0	\N	\N	\N	\N	\N	lt	703
7031319	Xã Lộc An	70313	0	\N	\N	\N	\N	\N	la	703
7031321	Xã Lộc Thành	70313	0	\N	\N	\N	\N	\N	lt	703
7031323	Xã Lộc Nam	70313	0	\N	\N	\N	\N	\N	ln	703
7031500	Không xác định	70315	0	\N	\N	\N	\N	\N	kx	703
7031501	Thị trấn Di Linh	70315	0	\N	\N	\N	\N	\N	dl	703
7031503	Xã Đinh Trang Thượng	70315	0	\N	\N	\N	\N	\N	dtt	703
7031505	Xã Tân Thượng	70315	0	\N	\N	\N	\N	\N	tt	703
7031507	Xã Tân Châu	70315	0	\N	\N	\N	\N	\N	tc	703
7031509	Xã Đinh Lạc	70315	0	\N	\N	\N	\N	\N	dl	703
7031511	Xã Gia Hiệp	70315	0	\N	\N	\N	\N	\N	gh	703
7031513	Xã Tam Bố	70315	0	\N	\N	\N	\N	\N	tb	703
7031515	Xã Đinh Trang Hòa	70315	0	\N	\N	\N	\N	\N	dth	703
7031517	Xã Liên Đầm	70315	0	\N	\N	\N	\N	\N	ld	703
7031519	Xã Gung Ré	70315	0	\N	\N	\N	\N	\N	gr	703
7031521	Xã Bảo Thuận	70315	0	\N	\N	\N	\N	\N	bt	703
7031523	Xã Hòa Ninh	70315	0	\N	\N	\N	\N	\N	hn	703
7031525	Xã Hòa Trung	70315	0	\N	\N	\N	\N	\N	ht	703
7031527	Xã Hòa Nam	70315	0	\N	\N	\N	\N	\N	hn	703
7031529	Xã Hòa Bắc	70315	0	\N	\N	\N	\N	\N	hb	703
7031531	Xã Sơn Điền	70315	0	\N	\N	\N	\N	\N	sd	703
7031533	Xã Gia Bắc	70315	0	\N	\N	\N	\N	\N	gb	703
7031700	Không xác định	70317	0	\N	\N	\N	\N	\N	kx	703
7031701	Thị trấn Ma Đa Guôi	70317	0	\N	\N	\N	\N	\N	mdg	703
7031703	Thị trấn Đạ M ri	70317	0	\N	\N	\N	\N	\N	dm	703
7031705	Xã Đạ M ri	70317	0	\N	\N	\N	\N	\N	dm	703
7031707	Xã Hà Lâm	70317	0	\N	\N	\N	\N	\N	hl	703
7031709	Xã Đạ Tồn	70317	0	\N	\N	\N	\N	\N	dt	703
7031711	Xã Đạ Oai	70317	0	\N	\N	\N	\N	\N	do	703
7031713	Xã Ma Đa Guôi	70317	0	\N	\N	\N	\N	\N	mdg	703
7031715	Xã Đạ Ploa	70317	0	\N	\N	\N	\N	\N	dp	703
7031717	Xã Đoàn Kết	70317	0	\N	\N	\N	\N	\N	dk	703
7031900	Không xác định	70319	0	\N	\N	\N	\N	\N	kx	703
7031901	Thị trấn Đạ Tẻh	70319	0	\N	\N	\N	\N	\N	dt	703
7031903	Xã An Nhơn	70319	0	\N	\N	\N	\N	\N	an	703
7031905	Xã Mỹ Đức	70319	0	\N	\N	\N	\N	\N	md	703
7031907	Xã Quốc Oai	70319	0	\N	\N	\N	\N	\N	qo	703
7031909	Xã Đạ Lây	70319	0	\N	\N	\N	\N	\N	dl	703
7031911	Xã Quảng Trị	70319	0	\N	\N	\N	\N	\N	qt	703
7031913	Xã Hương Lâm	70319	0	\N	\N	\N	\N	\N	hl	703
7031915	Xã Triệu Hải	70319	0	\N	\N	\N	\N	\N	th	703
7031917	Xã Hà Đông	70319	0	\N	\N	\N	\N	\N	hd	703
7031919	Xã Đạ Kho	70319	0	\N	\N	\N	\N	\N	dk	703
7032100	Không xác định	70321	0	\N	\N	\N	\N	\N	kx	703
7032101	Thị trấn Đồng Nai	70321	0	\N	\N	\N	\N	\N	dn	703
7032103	Xã Tiên Hoàng	70321	0	\N	\N	\N	\N	\N	th	703
7032105	Xã Phước Cát 2	70321	0	\N	\N	\N	\N	\N	pc2	703
7032107	Xã Gia Viễn	70321	0	\N	\N	\N	\N	\N	gv	703
7032109	Xã Nam Ninh	70321	0	\N	\N	\N	\N	\N	nn	703
7032111	Xã Mỹ Lâm	70321	0	\N	\N	\N	\N	\N	ml	703
7032113	Xã Đức Phổ	70321	0	\N	\N	\N	\N	\N	dp	703
7032115	Xã Tư Nghĩa	70321	0	\N	\N	\N	\N	\N	tn	703
7032117	Xã Phước Cát 1	70321	0	\N	\N	\N	\N	\N	pc1	703
7032119	Xã Phù Mỹ	70321	0	\N	\N	\N	\N	\N	pm	703
7032121	Xã Quảng Ngãi	70321	0	\N	\N	\N	\N	\N	qn	703
7050000	Không xác định	70500	0	\N	\N	\N	\N	\N	kx	705
7050100	Không xác định	70501	0	\N	\N	\N	\N	\N	kx	705
7050101	Phường Mỹ Hương	70501	0	\N	\N	\N	\N	\N	mh	705
7050103	Phường Kinh Dinh	70501	0	\N	\N	\N	\N	\N	kd	705
7050105	Phường Đạo Long	70501	0	\N	\N	\N	\N	\N	dl	705
7050107	Phường Tấn Tài	70501	0	\N	\N	\N	\N	\N	tt	705
7050109	Phường Phủ Hà	70501	0	\N	\N	\N	\N	\N	ph	705
7050111	Phường Thanh Sơn	70501	0	\N	\N	\N	\N	\N	ts	705
7050113	Phường Phước Mỹ	70501	0	\N	\N	\N	\N	\N	pm	705
7050115	Phường Bảo An	70501	0	\N	\N	\N	\N	\N	ba	705
7050117	Phường Đô Vinh	70501	0	\N	\N	\N	\N	\N	dv	705
7012907	Phường 5	70129	0	\N	\N	\N	\N	\N	5	701
7050119	Xã Thành Hải	70501	0	\N	\N	\N	\N	\N	th	705
7050121	Xã Văn Hải	70501	0	\N	\N	\N	\N	\N	vh	705
7050123	Xã Đông Hải	70501	0	\N	\N	\N	\N	\N	dh	705
7050125	Xã Mỹ Hải	70501	0	\N	\N	\N	\N	\N	mh	705
7050300	Không xác định	70503	0	\N	\N	\N	\N	\N	kx	705
7050301	Xã Lâm Sơn	70503	0	\N	\N	\N	\N	\N	ls	705
7050303	Xã Tân Sơn	70503	0	\N	\N	\N	\N	\N	ts	705
7050305	Xã Quảng Sơn	70503	0	\N	\N	\N	\N	\N	qs	705
7050307	Xã Mỹ Sơn	70503	0	\N	\N	\N	\N	\N	ms	705
7050309	Xã Hòa Sơn	70503	0	\N	\N	\N	\N	\N	hs	705
7050311	Xã Nhơn Sơn	70503	0	\N	\N	\N	\N	\N	ns	705
7050313	Xã Phước Trung	70503	0	\N	\N	\N	\N	\N	pt	705
7050315	Xã Phước Đại	70503	0	\N	\N	\N	\N	\N	pd	705
7050317	Xã Phước Chính	70503	0	\N	\N	\N	\N	\N	pc	705
7050319	Xã Phước Hòa	70503	0	\N	\N	\N	\N	\N	ph	705
7050321	Xã Phước Bình	70503	0	\N	\N	\N	\N	\N	pb	705
7050323	Xã Phước Tân	70503	0	\N	\N	\N	\N	\N	pt	705
7050325	Xã Phước Tiến	70503	0	\N	\N	\N	\N	\N	pt	705
7050327	Xã Ma Nới	70503	0	\N	\N	\N	\N	\N	mn	705
7050329	Xã Phước Thành	70503	0	\N	\N	\N	\N	\N	pt	705
7050331	Xã Phước Thắng	70503	0	\N	\N	\N	\N	\N	pt	705
7050500	Không xác định	70505	0	\N	\N	\N	\N	\N	kx	705
7050501	Thị trấn Khánh Hải	70505	0	\N	\N	\N	\N	\N	kh	705
7050503	Xã Phước Kháng	70505	0	\N	\N	\N	\N	\N	pk	705
7050505	Xã Phước Chiến	70505	0	\N	\N	\N	\N	\N	pc	705
7050507	Xã Tân Hải	70505	0	\N	\N	\N	\N	\N	th	705
7050509	Xã Hộ Hải	70505	0	\N	\N	\N	\N	\N	hh	705
7050511	Xã Xuân Hải	70505	0	\N	\N	\N	\N	\N	xh	705
7050513	Xã Phương Hải	70505	0	\N	\N	\N	\N	\N	ph	705
7050515	Xã Tri Hải	70505	0	\N	\N	\N	\N	\N	th	705
7050517	Xã Nhơn Hải	70505	0	\N	\N	\N	\N	\N	nh	705
7050519	Xã Vĩnh Hải	70505	0	\N	\N	\N	\N	\N	vh	705
7050521	Xã Công Hải	70505	0	\N	\N	\N	\N	\N	ch	705
7050523	Xã Lợi Hải	70505	0	\N	\N	\N	\N	\N	lh	705
7050700	Không xác định	70507	0	\N	\N	\N	\N	\N	kx	705
7050701	Thị trấn Phước Dân	70507	0	\N	\N	\N	\N	\N	pd	705
7050703	Xã Phước Sơn	70507	0	\N	\N	\N	\N	\N	ps	705
7050705	Xã Phước Thái	70507	0	\N	\N	\N	\N	\N	pt	705
7050707	Xã Phước Hậu	70507	0	\N	\N	\N	\N	\N	ph	705
7050709	Xã Phước Thuận	70507	0	\N	\N	\N	\N	\N	pt	705
7050711	Xã An Hải	70507	0	\N	\N	\N	\N	\N	ah	705
7050713	Xã Phước Hải	70507	0	\N	\N	\N	\N	\N	ph	705
7050715	Xã Phước Dinh	70507	0	\N	\N	\N	\N	\N	pd	705
7050717	Xã Phước Diêm	70507	0	\N	\N	\N	\N	\N	pd	705
7050719	Xã Phước Hữu	70507	0	\N	\N	\N	\N	\N	ph	705
7050721	Xã Phước Nam	70507	0	\N	\N	\N	\N	\N	pn	705
7050723	Xã Phước Hà	70507	0	\N	\N	\N	\N	\N	ph	705
7050725	Xã Nhị Hà	70507	0	\N	\N	\N	\N	\N	nh	705
7050727	Xã Phước Minh	70507	0	\N	\N	\N	\N	\N	pm	705
7070000	Không xác định	70700	0	\N	\N	\N	\N	\N	kx	707
7070100	Không xác định	70701	0	\N	\N	\N	\N	\N	kx	707
7070101	Thị trấn Đồng Xoài	70701	0	\N	\N	\N	\N	\N	dx	707
7070103	Xã Thuận Lợi	70701	0	\N	\N	\N	\N	\N	tl	707
7070105	Xã Đồng Tâm	70701	0	\N	\N	\N	\N	\N	dt	707
7070107	Xã Tân Thành	70701	0	\N	\N	\N	\N	\N	tt	707
7070109	Xã Tân Phước	70701	0	\N	\N	\N	\N	\N	tp	707
7070111	Xã Tân Hưng	70701	0	\N	\N	\N	\N	\N	th	707
7070113	Xã Tân Lợi	70701	0	\N	\N	\N	\N	\N	tl	707
7070115	Xã Tân Hòa	70701	0	\N	\N	\N	\N	\N	th	707
7070117	Xã Tân Lập	70701	0	\N	\N	\N	\N	\N	tl	707
7070300	Không xác định	70703	0	\N	\N	\N	\N	\N	kx	707
7070301	Thị trấn Thác Mơ	70703	0	\N	\N	\N	\N	\N	tm	707
7070303	Thị trấn Phước Bình	70703	0	\N	\N	\N	\N	\N	pb	707
7070305	Xã Đak ơ	70703	0	\N	\N	\N	\N	\N	do	707
7070307	Xã Bù Gia Mâp	70703	0	\N	\N	\N	\N	\N	bgm	707
7070309	Xã Đức Hạnh	70703	0	\N	\N	\N	\N	\N	dh	707
7070311	Xã Đa Kia	70703	0	\N	\N	\N	\N	\N	dk	707
7070313	Xã Bình Thắng	70703	0	\N	\N	\N	\N	\N	bt	707
7070315	Xã Bình Phước	70703	0	\N	\N	\N	\N	\N	bp	707
7070317	Xã Sơn Giang	70703	0	\N	\N	\N	\N	\N	sg	707
7070319	Xã Phước Tín	70703	0	\N	\N	\N	\N	\N	pt	707
7070321	Xã Long Hưng	70703	0	\N	\N	\N	\N	\N	lh	707
7070323	Xã Long Hà	70703	0	\N	\N	\N	\N	\N	lh	707
7070325	Xã Bù Nho	70703	0	\N	\N	\N	\N	\N	bn	707
7070327	Xã Phú Riềng	70703	0	\N	\N	\N	\N	\N	pr	707
7070329	Xã Long Tân	70703	0	\N	\N	\N	\N	\N	lt	707
7070331	Xã Phú Trung	70703	0	\N	\N	\N	\N	\N	pt	707
7070333	Xã Long Bình	70703	0	\N	\N	\N	\N	\N	lb	707
7070500	Không xác định	70705	0	\N	\N	\N	\N	\N	kx	707
7070501	Thị trấn Lộc Ninh	70705	0	\N	\N	\N	\N	\N	ln	707
7070503	Xã Hưng Phước	70705	0	\N	\N	\N	\N	\N	hp	707
7070505	Xã Thiện Hưng	70705	0	\N	\N	\N	\N	\N	th	707
7070507	Xã Thanh Hòa	70705	0	\N	\N	\N	\N	\N	th	707
7070509	Xã Lộc Tấn	70705	0	\N	\N	\N	\N	\N	lt	707
7070511	Xã Lộc An	70705	0	\N	\N	\N	\N	\N	la	707
7070513	Xã Tân Thành	70705	0	\N	\N	\N	\N	\N	tt	707
7070515	Xã Tân Tiến	70705	0	\N	\N	\N	\N	\N	tt	707
7070517	Xã Lộc Hòa	70705	0	\N	\N	\N	\N	\N	lh	707
7070519	Xã Lộc Hiệp	70705	0	\N	\N	\N	\N	\N	lh	707
7070521	Xã Lộc Quang	70705	0	\N	\N	\N	\N	\N	lq	707
7070523	Xã Lộc Khánh	70705	0	\N	\N	\N	\N	\N	lk	707
7070525	Xã Lộc Thành	70705	0	\N	\N	\N	\N	\N	lt	707
7070527	Xã Lộc Thái	70705	0	\N	\N	\N	\N	\N	lt	707
7070529	Xã Lộc Hưng	70705	0	\N	\N	\N	\N	\N	lh	707
7070531	Xã Lộc Thiện	70705	0	\N	\N	\N	\N	\N	lt	707
7070533	Xã Lộc Điền	70705	0	\N	\N	\N	\N	\N	ld	707
7070535	Xã Lộc Thuận	70705	0	\N	\N	\N	\N	\N	lt	707
7070700	Không xác định	70707	0	\N	\N	\N	\N	\N	kx	707
7070701	Thị trấn Đức Phong	70707	0	\N	\N	\N	\N	\N	dp	707
7070703	Xã Đak Nhau	70707	0	\N	\N	\N	\N	\N	dn	707
7070705	Xã Bom Bo	70707	0	\N	\N	\N	\N	\N	bb	707
7070707	Xã Thọ Sơn	70707	0	\N	\N	\N	\N	\N	ts	707
7070709	Xã Minh Hưng	70707	0	\N	\N	\N	\N	\N	mh	707
7070711	Xã Đoàn Kết	70707	0	\N	\N	\N	\N	\N	dk	707
7070713	Xã Đồng Nai	70707	0	\N	\N	\N	\N	\N	dn	707
7070715	Xã Đức Liễu	70707	0	\N	\N	\N	\N	\N	dl	707
7070717	Xã Thống Nhất	70707	0	\N	\N	\N	\N	\N	tn	707
7070719	Xã Nghĩa Trung	70707	0	\N	\N	\N	\N	\N	nt	707
7070721	Xã Đăng Hà	70707	0	\N	\N	\N	\N	\N	dh	707
7070900	Không xác định	70709	0	\N	\N	\N	\N	\N	kx	707
7070901	Thị trấn An Lộc	70709	0	\N	\N	\N	\N	\N	al	707
7070903	Thị trấn Chơn Thành	70709	0	\N	\N	\N	\N	\N	ct	707
7070905	Xã Thanh An	70709	0	\N	\N	\N	\N	\N	ta	707
7070907	Xã An Khương	70709	0	\N	\N	\N	\N	\N	ak	707
7070909	Xã Thanh Lương	70709	0	\N	\N	\N	\N	\N	tl	707
7070911	Xã An Phú	70709	0	\N	\N	\N	\N	\N	ap	707
7070913	Xã Thanh Phú	70709	0	\N	\N	\N	\N	\N	tp	707
7070915	Xã Tân Hưng	70709	0	\N	\N	\N	\N	\N	th	707
7070917	Xã Phước An	70709	0	\N	\N	\N	\N	\N	pa	707
7070919	Xã Minh Đức	70709	0	\N	\N	\N	\N	\N	md	707
7070921	Xã Thanh Bình	70709	0	\N	\N	\N	\N	\N	tb	707
7070923	Xã Tân Quan	70709	0	\N	\N	\N	\N	\N	tq	707
7070925	Xã Đồng Nơ	70709	0	\N	\N	\N	\N	\N	dn	707
7070927	Xã Tân Khai	70709	0	\N	\N	\N	\N	\N	tk	707
7070929	Xã Minh Lập	70709	0	\N	\N	\N	\N	\N	ml	707
7070931	Xã Nha Bích	70709	0	\N	\N	\N	\N	\N	nb	707
7070933	Xã Minh Hưng	70709	0	\N	\N	\N	\N	\N	mh	707
7070935	Xã Minh Thành	70709	0	\N	\N	\N	\N	\N	mt	707
7070937	Xã Minh Long	70709	0	\N	\N	\N	\N	\N	ml	707
7070939	Xã Tân Lợi	70709	0	\N	\N	\N	\N	\N	tl	707
7090000	Không xác định	70900	0	\N	\N	\N	\N	\N	kx	709
7090100	Không xác định	70901	0	\N	\N	\N	\N	\N	kx	709
7090101	Phường 1	70901	0	\N	\N	\N	\N	\N	1	709
7090103	Phường 3	70901	0	\N	\N	\N	\N	\N	3	709
7090105	Phường 2	70901	0	\N	\N	\N	\N	\N	2	709
7090107	Xã Bình Minh	70901	0	\N	\N	\N	\N	\N	bm	709
7090300	Không xác định	70903	0	\N	\N	\N	\N	\N	kx	709
7090301	Thị trấn Tân Biên	70903	0	\N	\N	\N	\N	\N	tb	709
7090303	Xã Tân Lập	70903	0	\N	\N	\N	\N	\N	tl	709
7090305	Xã Tân Bình	70903	0	\N	\N	\N	\N	\N	tb	709
7090307	Xã Thạnh Tây	70903	0	\N	\N	\N	\N	\N	tt	709
7090309	Xã Thạnh Bình	70903	0	\N	\N	\N	\N	\N	tb	709
7090311	Xã Hòa Hiệp	70903	0	\N	\N	\N	\N	\N	hh	709
7090313	Xã Tân Phong	70903	0	\N	\N	\N	\N	\N	tp	709
7090315	Xã Mỏ Công	70903	0	\N	\N	\N	\N	\N	mc	709
7090317	Xã Trà Vong	70903	0	\N	\N	\N	\N	\N	tv	709
7090500	Không xác định	70905	0	\N	\N	\N	\N	\N	kx	709
7090501	Thị trấn Tân Châu	70905	0	\N	\N	\N	\N	\N	tc	709
7090503	Xã Tân Hà	70905	0	\N	\N	\N	\N	\N	th	709
7090505	Xã Tân Đông	70905	0	\N	\N	\N	\N	\N	td	709
7090507	Xã Tân Hội	70905	0	\N	\N	\N	\N	\N	th	709
7090509	Xã Tân Hoà	70905	0	\N	\N	\N	\N	\N	th	709
7090511	Xã Suối Ngô	70905	0	\N	\N	\N	\N	\N	sn	709
7090513	Xã Suối Dây	70905	0	\N	\N	\N	\N	\N	sd	709
7090515	Xã Tân Hiệp	70905	0	\N	\N	\N	\N	\N	th	709
7090517	Xã Thạnh Đông	70905	0	\N	\N	\N	\N	\N	td	709
7090519	Xã Tân Thành	70905	0	\N	\N	\N	\N	\N	tt	709
7090521	Xã Tân Phú	70905	0	\N	\N	\N	\N	\N	tp	709
7090523	Xã Tân Hưng	70905	0	\N	\N	\N	\N	\N	th	709
7090700	Không xác định	70907	0	\N	\N	\N	\N	\N	kx	709
7090701	Thị trấn Dương Minh Châu	70907	0	\N	\N	\N	\N	\N	dmc	709
7090703	Xã Phan	70907	0	\N	\N	\N	\N	\N	p	709
7090705	Xã Phước Ninh	70907	0	\N	\N	\N	\N	\N	pn	709
7090707	Xã Phước Minh	70907	0	\N	\N	\N	\N	\N	pm	709
7090709	Xã Bàu Năng	70907	0	\N	\N	\N	\N	\N	bn	709
7090711	Xã Chà Là	70907	0	\N	\N	\N	\N	\N	cl	709
7090713	Xã Cầu Khởi	70907	0	\N	\N	\N	\N	\N	ck	709
7090715	Xã Bến Củi	70907	0	\N	\N	\N	\N	\N	bc	709
7090717	Xã Lộc Ninh	70907	0	\N	\N	\N	\N	\N	ln	709
7090719	Xã Truông Mít	70907	0	\N	\N	\N	\N	\N	tm	709
7090721	Xã Suối Đá	70907	0	\N	\N	\N	\N	\N	sd	709
7090900	Không xác định	70909	0	\N	\N	\N	\N	\N	kx	709
7090901	Xã Hảo Đước	70909	0	\N	\N	\N	\N	\N	hd	709
7090903	Xã Phước Vinh	70909	0	\N	\N	\N	\N	\N	pv	709
7090905	Xã Thái Bình	70909	0	\N	\N	\N	\N	\N	tb	709
7090907	Xã Biên Giới	70909	0	\N	\N	\N	\N	\N	bg	709
7090909	Xã Hòa Thạnh	70909	0	\N	\N	\N	\N	\N	ht	709
7090911	Xã Trí Bình	70909	0	\N	\N	\N	\N	\N	tb	709
7090913	Xã Hòa Hội	70909	0	\N	\N	\N	\N	\N	hh	709
7090915	Xã Thanh Điền	70909	0	\N	\N	\N	\N	\N	td	709
7090917	Xã Thành Long	70909	0	\N	\N	\N	\N	\N	tl	709
7090919	Xã Ninh Điền	70909	0	\N	\N	\N	\N	\N	nd	709
7090921	Xã Long Vĩnh	70909	0	\N	\N	\N	\N	\N	lv	709
7090923	Xã Đồng Khởi	70909	0	\N	\N	\N	\N	\N	dk	709
7090925	Thị trấn Châu Thành	70909	0	\N	\N	\N	\N	\N	ct	709
7091100	Không xác định	70911	0	\N	\N	\N	\N	\N	kx	709
7091101	Thị trấn Hòa Thành	70911	0	\N	\N	\N	\N	\N	ht	709
7091103	Xã Thạnh Tân	70911	0	\N	\N	\N	\N	\N	tt	709
7091105	Xã Tân Bình	70911	0	\N	\N	\N	\N	\N	tb	709
7091107	Xã Ninh Sơn	70911	0	\N	\N	\N	\N	\N	ns	709
7091109	Xã Ninh Thạnh	70911	0	\N	\N	\N	\N	\N	nt	709
7091111	Xã Hiệp Ninh	70911	0	\N	\N	\N	\N	\N	hn	709
7091113	Xã Hiệp Tân	70911	0	\N	\N	\N	\N	\N	ht	709
7091115	Xã Long Thành Bắc	70911	0	\N	\N	\N	\N	\N	ltb	709
7091117	Xã Trường Hòa	70911	0	\N	\N	\N	\N	\N	th	709
7091119	Xã Trường Đông	70911	0	\N	\N	\N	\N	\N	td	709
7091121	Xã Long Thành Trung	70911	0	\N	\N	\N	\N	\N	ltt	709
7091123	Xã Trường Tây	70911	0	\N	\N	\N	\N	\N	tt	709
7091125	Xã Long Thành Nam	70911	0	\N	\N	\N	\N	\N	ltn	709
7091300	Không xác định	70913	0	\N	\N	\N	\N	\N	kx	709
7091301	Xã Long Chữ	70913	0	\N	\N	\N	\N	\N	lc	709
7091303	Xã Long Phước	70913	0	\N	\N	\N	\N	\N	lp	709
7091305	Xã Long Giang	70913	0	\N	\N	\N	\N	\N	lg	709
7091307	Xã Tiên Thuận	70913	0	\N	\N	\N	\N	\N	tt	709
7091309	Xã Long Khánh	70913	0	\N	\N	\N	\N	\N	lk	709
7091311	Xã Lợi Thuận	70913	0	\N	\N	\N	\N	\N	lt	709
7091313	Xã Long Thuận	70913	0	\N	\N	\N	\N	\N	lt	709
7091315	Xã An Thạnh	70913	0	\N	\N	\N	\N	\N	at	709
7091500	Không xác định	70915	0	\N	\N	\N	\N	\N	kx	709
7091501	Thị trấn Gò Dầu	70915	0	\N	\N	\N	\N	\N	gd	709
7091503	Xã Thạnh Đức	70915	0	\N	\N	\N	\N	\N	td	709
7091505	Xã Bàu Đồn	70915	0	\N	\N	\N	\N	\N	bd	709
7091507	Xã Cẩm Giang	70915	0	\N	\N	\N	\N	\N	cg	709
7091509	Xã Hiệp Thạnh	70915	0	\N	\N	\N	\N	\N	ht	709
7091511	Xã Phước Thạnh	70915	0	\N	\N	\N	\N	\N	pt	709
7091513	Xã Phước Đông	70915	0	\N	\N	\N	\N	\N	pd	709
7091515	Xã Phước Trạch	70915	0	\N	\N	\N	\N	\N	pt	709
7091517	Xã Thanh Phước	70915	0	\N	\N	\N	\N	\N	tp	709
7091700	Không xác định	70917	0	\N	\N	\N	\N	\N	kx	709
7091701	Thị trấn Trảng Bàng	70917	0	\N	\N	\N	\N	\N	tb	709
7091703	Xã Đôn Thuận	70917	0	\N	\N	\N	\N	\N	dt	709
7091705	Xã Lộc Hưng	70917	0	\N	\N	\N	\N	\N	lh	709
7091707	Xã Gia Lộc	70917	0	\N	\N	\N	\N	\N	gl	709
7091709	Xã Gia Bình	70917	0	\N	\N	\N	\N	\N	gb	709
7091711	Xã Phước Lưu	70917	0	\N	\N	\N	\N	\N	pl	709
7091713	Xã Bình Thạnh	70917	0	\N	\N	\N	\N	\N	bt	709
7091715	Xã An Tịnh	70917	0	\N	\N	\N	\N	\N	at	709
7091717	Xã An Hòa	70917	0	\N	\N	\N	\N	\N	ah	709
7091719	Xã Phước Chỉ	70917	0	\N	\N	\N	\N	\N	pc	709
7110000	Không xác định	71100	0	\N	\N	\N	\N	\N	kx	711
7110100	Không xác định	71101	0	\N	\N	\N	\N	\N	kx	711
7110101	Phường Phú Cường	71101	0	\N	\N	\N	\N	\N	pc	711
7110103	Phường Hiệp Thành	71101	0	\N	\N	\N	\N	\N	ht	711
7110105	Phường Chánh Nghĩa	71101	0	\N	\N	\N	\N	\N	cn	711
7110107	Phường Phú Hòa	71101	0	\N	\N	\N	\N	\N	ph	711
7110109	Phường Phú Thọ	71101	0	\N	\N	\N	\N	\N	pt	711
7110111	Xã Phú Mỹ	71101	0	\N	\N	\N	\N	\N	pm	711
7110113	Xã Định Hòa	71101	0	\N	\N	\N	\N	\N	dh	711
7110115	Xã Tân An	71101	0	\N	\N	\N	\N	\N	ta	711
7110117	Xã Tương Bình Hiệp	71101	0	\N	\N	\N	\N	\N	tbh	711
7110119	Xã Chánh Mỹ	71101	0	\N	\N	\N	\N	\N	cm	711
7110300	Không xác định	71103	0	\N	\N	\N	\N	\N	kx	711
7110301	Thị trấn Mỹ Phước	71103	0	\N	\N	\N	\N	\N	mp	711
7110303	Thị trấn Dầu Tiếng	71103	0	\N	\N	\N	\N	\N	dt	711
7110305	Xã Minh Hoà	71103	0	\N	\N	\N	\N	\N	mh	711
7110307	Xã Minh Thạnh	71103	0	\N	\N	\N	\N	\N	mt	711
7110309	Xã Minh Tân	71103	0	\N	\N	\N	\N	\N	mt	711
7110311	Xã Định Hiệp	71103	0	\N	\N	\N	\N	\N	dh	711
7110313	Xã An Long	71103	0	\N	\N	\N	\N	\N	al	711
7110315	Xã Long Hòa	71103	0	\N	\N	\N	\N	\N	lh	711
7110317	Xã Cây Trường II	71103	0	\N	\N	\N	\N	\N	cti	711
7110319	Xã Trừ Văn Thố	71103	0	\N	\N	\N	\N	\N	tvt	711
7110321	Xã Tân Long	71103	0	\N	\N	\N	\N	\N	tl	711
7110323	Xã Lai Uyên	71103	0	\N	\N	\N	\N	\N	lu	711
7110325	Xã An Lập	71103	0	\N	\N	\N	\N	\N	al	711
7110327	Xã Long Tân	71103	0	\N	\N	\N	\N	\N	lt	711
7110329	Xã Thanh An	71103	0	\N	\N	\N	\N	\N	ta	711
7110331	Xã Tân Hưng	71103	0	\N	\N	\N	\N	\N	th	711
7110333	Xã Long Nguyên	71103	0	\N	\N	\N	\N	\N	ln	711
7110335	Xã Hưng Hòa	71103	0	\N	\N	\N	\N	\N	hh	711
7110337	Xã Lai Hưng	71103	0	\N	\N	\N	\N	\N	lh	711
7110339	Xã Thanh Tuyền	71103	0	\N	\N	\N	\N	\N	tt	711
7110341	Xã Chánh Phú Hòa	71103	0	\N	\N	\N	\N	\N	cph	711
7110343	Xã An Điền	71103	0	\N	\N	\N	\N	\N	ad	711
7110345	Xã An Tây	71103	0	\N	\N	\N	\N	\N	at	711
7110347	Xã Thới Hòa	71103	0	\N	\N	\N	\N	\N	th	711
7110349	Xã Hòa Lợi	71103	0	\N	\N	\N	\N	\N	hl	711
7110351	Xã Phú An	71103	0	\N	\N	\N	\N	\N	pa	711
7110353	Xã Tân Định	71103	0	\N	\N	\N	\N	\N	td	711
7110500	Không xác định	71105	0	\N	\N	\N	\N	\N	kx	711
7110501	Thị trấn Uyên Hưng	71105	0	\N	\N	\N	\N	\N	uh	711
7110503	Thị trấn Phước Vĩnh	71105	0	\N	\N	\N	\N	\N	pv	711
7110505	Thị trấn Tân Phước Khánh	71105	0	\N	\N	\N	\N	\N	tpk	711
7110507	Xã An Linh	71105	0	\N	\N	\N	\N	\N	al	711
7110509	Xã Phước Sang	71105	0	\N	\N	\N	\N	\N	ps	711
7110511	Xã An Bình	71105	0	\N	\N	\N	\N	\N	ab	711
7110513	Xã Tân Hiệp	71105	0	\N	\N	\N	\N	\N	th	711
7110515	Xã Vĩnh Hoà	71105	0	\N	\N	\N	\N	\N	vh	711
7110517	Xã Phước Hòa	71105	0	\N	\N	\N	\N	\N	ph	711
7110519	Xã Tân Định	71105	0	\N	\N	\N	\N	\N	td	711
7110521	Xã Tân Bình	71105	0	\N	\N	\N	\N	\N	tb	711
7110523	Xã Bình Mỹ	71105	0	\N	\N	\N	\N	\N	bm	711
7110525	Xã Tân Lập	71105	0	\N	\N	\N	\N	\N	tl	711
7110527	Xã Tân Thành	71105	0	\N	\N	\N	\N	\N	tt	711
7110529	Xã Vĩnh Tân	71105	0	\N	\N	\N	\N	\N	vt	711
7110531	Xã Lạc An	71105	0	\N	\N	\N	\N	\N	la	711
7110533	Xã Hội Nghĩa	71105	0	\N	\N	\N	\N	\N	hn	711
7110535	Xã Tân Mỹ	71105	0	\N	\N	\N	\N	\N	tm	711
7110537	Xã Khánh Bình	71105	0	\N	\N	\N	\N	\N	kb	711
7110539	Xã Phú Chánh	71105	0	\N	\N	\N	\N	\N	pc	711
7110541	Xã Thường Tân	71105	0	\N	\N	\N	\N	\N	tt	711
7110543	Xã Bạch Đằng	71105	0	\N	\N	\N	\N	\N	bd	711
7110545	Xã Tân Vĩnh Hiệp	71105	0	\N	\N	\N	\N	\N	tvh	711
7110547	Xã Thạnh Phước	71105	0	\N	\N	\N	\N	\N	tp	711
7110549	Xã Thái Hòa	71105	0	\N	\N	\N	\N	\N	th	711
7110700	Không xác định	71107	0	\N	\N	\N	\N	\N	kx	711
7110701	Thị trấn Lái Thiêu	71107	0	\N	\N	\N	\N	\N	lt	711
7110703	Thị trấn Dĩ An	71107	0	\N	\N	\N	\N	\N	da	711
7110705	Thị trấn An Thạnh	71107	0	\N	\N	\N	\N	\N	at	711
7110707	Xã Bình Chuẩn	71107	0	\N	\N	\N	\N	\N	bc	711
7110709	Xã Thuận Giao	71107	0	\N	\N	\N	\N	\N	tg	711
7110711	Xã An Phú	71107	0	\N	\N	\N	\N	\N	ap	711
7110713	Xã Tân Bình	71107	0	\N	\N	\N	\N	\N	tb	711
7110715	Xã Hưng Định	71107	0	\N	\N	\N	\N	\N	hd	711
7110717	Xã An Sơn	71107	0	\N	\N	\N	\N	\N	as	711
7110719	Xã Bình Nhâm	71107	0	\N	\N	\N	\N	\N	bn	711
7110721	Xã Bình Hòa	71107	0	\N	\N	\N	\N	\N	bh	711
7110723	Xã Tân Đông Hiệp	71107	0	\N	\N	\N	\N	\N	tdh	711
7110725	Xã Bình An	71107	0	\N	\N	\N	\N	\N	ba	711
7110727	Xã Đông Hòa	71107	0	\N	\N	\N	\N	\N	dh	711
7110729	Xã Vĩnh Phú	71107	0	\N	\N	\N	\N	\N	vp	711
7130000	Không xác định	71300	0	\N	\N	\N	\N	\N	kx	713
7130100	Không xác định	71301	0	\N	\N	\N	\N	\N	kx	713
7130101	Phường Thanh Bình	71301	0	\N	\N	\N	\N	\N	tb	713
7130103	Phường Hòa Bình	71301	0	\N	\N	\N	\N	\N	hb	713
7130105	Phường Trung Dũng	71301	0	\N	\N	\N	\N	\N	td	713
7130107	Phường Quang Vinh	71301	0	\N	\N	\N	\N	\N	qv	713
7130109	Phường Quyết Thắng	71301	0	\N	\N	\N	\N	\N	qt	713
7130111	Phường Bửu Long	71301	0	\N	\N	\N	\N	\N	bl	713
7130113	Phường Bửu Hòa	71301	0	\N	\N	\N	\N	\N	bh	713
7130115	Phường Tân Vạn	71301	0	\N	\N	\N	\N	\N	tv	713
7130117	Phường Tân Phong	71301	0	\N	\N	\N	\N	\N	tp	713
7130119	Phường Thống Nhất	71301	0	\N	\N	\N	\N	\N	tn	713
7130121	Phường Tân Tiến	71301	0	\N	\N	\N	\N	\N	tt	713
7130123	Phường Trảng Dài	71301	0	\N	\N	\N	\N	\N	td	713
7130125	Phường Tân Mai	71301	0	\N	\N	\N	\N	\N	tm	713
7130127	Phường Tân Hiệp	71301	0	\N	\N	\N	\N	\N	th	713
7130129	Phường Tam Hiệp	71301	0	\N	\N	\N	\N	\N	th	713
7130131	Phường Tam Hòa	71301	0	\N	\N	\N	\N	\N	th	713
7130133	Phường Bình Đa	71301	0	\N	\N	\N	\N	\N	bd	713
7130135	Phường An Bình	71301	0	\N	\N	\N	\N	\N	ab	713
7130137	Phường Long Bình Tân	71301	0	\N	\N	\N	\N	\N	lbt	713
7130139	Phường Long Bình	71301	0	\N	\N	\N	\N	\N	lb	713
7130141	Phường Hố Nai	71301	0	\N	\N	\N	\N	\N	hn	713
7130143	Phường Tân Biên	71301	0	\N	\N	\N	\N	\N	tb	713
7130145	Phường Tân Hòa	71301	0	\N	\N	\N	\N	\N	th	713
7130147	Xã Tân Hạnh	71301	0	\N	\N	\N	\N	\N	th	713
7130149	Xã Hóa An	71301	0	\N	\N	\N	\N	\N	ha	713
7130151	Xã Hiệp Hòa	71301	0	\N	\N	\N	\N	\N	hh	713
7130300	Không xác định	71303	0	\N	\N	\N	\N	\N	kx	713
7130301	Thị trấn Tân Phú	71303	0	\N	\N	\N	\N	\N	tp	713
7130303	Xã Dak Lua	71303	0	\N	\N	\N	\N	\N	dl	713
7130305	Xã Nam Cát Tiên	71303	0	\N	\N	\N	\N	\N	nct	713
7130307	Xã Phú An	71303	0	\N	\N	\N	\N	\N	pa	713
7130309	Xã Núi Tượng	71303	0	\N	\N	\N	\N	\N	nt	713
7130311	Xã Tà Lài	71303	0	\N	\N	\N	\N	\N	tl	713
7130313	Xã Phú Lập	71303	0	\N	\N	\N	\N	\N	pl	713
7130315	Xã Phú Thịnh	71303	0	\N	\N	\N	\N	\N	pt	713
7130317	Xã Thanh Sơn	71303	0	\N	\N	\N	\N	\N	ts	713
7130319	Xã Phú Sơn	71303	0	\N	\N	\N	\N	\N	ps	713
7130321	Xã Phú Trung	71303	0	\N	\N	\N	\N	\N	pt	713
7130323	Xã Phú Bình	71303	0	\N	\N	\N	\N	\N	pb	713
7130325	Xã Phú Lâm	71303	0	\N	\N	\N	\N	\N	pl	713
7130327	Xã Phú Xuân	71303	0	\N	\N	\N	\N	\N	px	713
7130329	Xã Phú Thanh	71303	0	\N	\N	\N	\N	\N	pt	713
7130331	Xã Phú Lộc	71303	0	\N	\N	\N	\N	\N	pl	713
7130333	Xã Trà Cổ	71303	0	\N	\N	\N	\N	\N	tc	713
7130335	Xã Phú Điền	71303	0	\N	\N	\N	\N	\N	pd	713
7130500	Không xác định	71305	0	\N	\N	\N	\N	\N	kx	713
7130501	Thị trấn Định Quán	71305	0	\N	\N	\N	\N	\N	dq	713
7130503	Xã Thanh Sơn	71305	0	\N	\N	\N	\N	\N	ts	713
7130505	Xã Phú Tân	71305	0	\N	\N	\N	\N	\N	pt	713
7130507	Xã Phú Vinh	71305	0	\N	\N	\N	\N	\N	pv	713
7130509	Xã Ngọc Định	71305	0	\N	\N	\N	\N	\N	nd	713
7130511	Xã La Ngà	71305	0	\N	\N	\N	\N	\N	ln	713
7130513	Xã Phú Lợi	71305	0	\N	\N	\N	\N	\N	pl	713
7130515	Xã Phú Hòa	71305	0	\N	\N	\N	\N	\N	ph	713
7130517	Xã Gia Canh	71305	0	\N	\N	\N	\N	\N	gc	713
7130519	Xã Phú Ngọc	71305	0	\N	\N	\N	\N	\N	pn	713
7130521	Xã Túc Trưng	71305	0	\N	\N	\N	\N	\N	tt	713
7130523	Xã Phú Cường	71305	0	\N	\N	\N	\N	\N	pc	713
7130525	Xã Phú Túc	71305	0	\N	\N	\N	\N	\N	pt	713
7130527	Xã Suối Nho	71305	0	\N	\N	\N	\N	\N	sn	713
7130700	Không xác định	71307	0	\N	\N	\N	\N	\N	kx	713
7130701	Thị trấn Vĩnh An	71307	0	\N	\N	\N	\N	\N	va	713
7130703	Xã Phú Lý	71307	0	\N	\N	\N	\N	\N	pl	713
7130705	Xã Trị An	71307	0	\N	\N	\N	\N	\N	ta	713
7130707	Xã Vĩnh Tân	71307	0	\N	\N	\N	\N	\N	vt	713
7130709	Xã Tân An	71307	0	\N	\N	\N	\N	\N	ta	713
7130711	Xã Thiện Tân	71307	0	\N	\N	\N	\N	\N	tt	713
7130713	Xã Thạnh Phú	71307	0	\N	\N	\N	\N	\N	tp	713
7130715	Xã Bình Lợi	71307	0	\N	\N	\N	\N	\N	bl	713
7130717	Xã Tân Bình	71307	0	\N	\N	\N	\N	\N	tb	713
7130719	Xã Bình Hòa	71307	0	\N	\N	\N	\N	\N	bh	713
7130900	Không xác định	71309	0	\N	\N	\N	\N	\N	kx	713
7130901	Thị trấn Trảng Bom	71309	0	\N	\N	\N	\N	\N	tb	713
7130903	Xã Gia Tân 1	71309	0	\N	\N	\N	\N	\N	gt1	713
7130905	Xã Gia Tân 2	71309	0	\N	\N	\N	\N	\N	gt2	713
7130907	Xã Gia Tân 3	71309	0	\N	\N	\N	\N	\N	gt3	713
7130909	Xã Gia Kiệm	71309	0	\N	\N	\N	\N	\N	gk	713
7130911	Xã Quang Trung	71309	0	\N	\N	\N	\N	\N	qt	713
7130913	Xã Bàu Hàm 2	71309	0	\N	\N	\N	\N	\N	bh2	713
7130915	Xã Lộ 25	71309	0	\N	\N	\N	\N	\N	l25	713
7130917	Xã Cây Gáo	71309	0	\N	\N	\N	\N	\N	cg	713
7130919	Xã Thanh Bình	71309	0	\N	\N	\N	\N	\N	tb	713
7130921	Xã Sông Trầu	71309	0	\N	\N	\N	\N	\N	st	713
7130923	Xã Đồi 61	71309	0	\N	\N	\N	\N	\N	d6	713
7130925	Xã An Viễn	71309	0	\N	\N	\N	\N	\N	av	713
7130927	Xã Bàu Hàm	71309	0	\N	\N	\N	\N	\N	bh	713
7130929	Xã Sông Thao	71309	0	\N	\N	\N	\N	\N	st	713
7130931	Xã Hưng Lộc	71309	0	\N	\N	\N	\N	\N	hl	713
7130933	Xã Hưng Thịnh	71309	0	\N	\N	\N	\N	\N	ht	713
7130935	Xã Đông Hoà	71309	0	\N	\N	\N	\N	\N	dh	713
7130937	Xã Trung Hoà	71309	0	\N	\N	\N	\N	\N	th	713
7130939	Xã Tây Hoà	71309	0	\N	\N	\N	\N	\N	th	713
7130941	Xã Quảng Tiến	71309	0	\N	\N	\N	\N	\N	qt	713
7130943	Xã Bình Minh	71309	0	\N	\N	\N	\N	\N	bm	713
7130945	Xã Giang Điền	71309	0	\N	\N	\N	\N	\N	gd	713
7130947	Xã Bắc Sơn	71309	0	\N	\N	\N	\N	\N	bs	713
7130949	Xã Hố Nai 3	71309	0	\N	\N	\N	\N	\N	hn3	713
7131100	Không xác định	71311	0	\N	\N	\N	\N	\N	kx	713
7131101	Thị trấn Xuân Lộc	71311	0	\N	\N	\N	\N	\N	xl	713
7131103	Xã Bảo Vinh	71311	0	\N	\N	\N	\N	\N	bv	713
7131105	Xã Bình Lộc	71311	0	\N	\N	\N	\N	\N	bl	713
7131107	Xã Xuân Thiện	71311	0	\N	\N	\N	\N	\N	xt	713
7131109	Xã Bảo Quang	71311	0	\N	\N	\N	\N	\N	bq	713
7131111	Xã Suối Tre	71311	0	\N	\N	\N	\N	\N	st	713
7131113	Xã Xuân Thạnh	71311	0	\N	\N	\N	\N	\N	xt	713
7131115	Xã Xuân Lập	71311	0	\N	\N	\N	\N	\N	xl	713
7131117	Xã Bàu Sen	71311	0	\N	\N	\N	\N	\N	bs	713
7131119	Xã Xuân Tân	71311	0	\N	\N	\N	\N	\N	xt	713
7131121	Xã Xuân Thanh	71311	0	\N	\N	\N	\N	\N	xt	713
7131123	Xã Sông Nhạn	71311	0	\N	\N	\N	\N	\N	sn	713
7131125	Xã Long Giao	71311	0	\N	\N	\N	\N	\N	lg	713
7131127	Xã Xuân Quế	71311	0	\N	\N	\N	\N	\N	xq	713
7131129	Xã Nhân Nghĩa	71311	0	\N	\N	\N	\N	\N	nn	713
7131131	Xã Xuân Mỹ	71311	0	\N	\N	\N	\N	\N	xm	713
7131133	Xã Thừa Đức	71311	0	\N	\N	\N	\N	\N	td	713
7131135	Xã Xuân Đường	71311	0	\N	\N	\N	\N	\N	xd	713
7131300	Không xác định	71313	0	\N	\N	\N	\N	\N	kx	713
7131301	Thị trấn Gia Ray	71313	0	\N	\N	\N	\N	\N	gr	713
7131303	Xã Xuân Bắc	71313	0	\N	\N	\N	\N	\N	xb	713
7131305	Xã Xuân Thành	71313	0	\N	\N	\N	\N	\N	xt	713
7131307	Xã Xuân Trường	71313	0	\N	\N	\N	\N	\N	xt	713
7131309	Xã Suối Cao	71313	0	\N	\N	\N	\N	\N	sc	713
7131311	Xã Xuân Thọ	71313	0	\N	\N	\N	\N	\N	xt	713
7131313	Xã Xuân Tâm	71313	0	\N	\N	\N	\N	\N	xt	713
7131315	Xã Lang Minh	71313	0	\N	\N	\N	\N	\N	lm	713
7131317	Xã Xuân Hiệp	71313	0	\N	\N	\N	\N	\N	xh	713
7131319	Xã Suối Cát	71313	0	\N	\N	\N	\N	\N	sc	713
7131321	Xã Xuân Phú	71313	0	\N	\N	\N	\N	\N	xp	713
7131323	Xã Bảo Hoà	71313	0	\N	\N	\N	\N	\N	bh	713
7131325	Xã Xuân Định	71313	0	\N	\N	\N	\N	\N	xd	713
7131327	Xã Xuân Hòa	71313	0	\N	\N	\N	\N	\N	xh	713
7131329	Xã Xuân Hưng	71313	0	\N	\N	\N	\N	\N	xh	713
7131331	Xã Xuân Đông	71313	0	\N	\N	\N	\N	\N	xd	713
7131333	Xã Xuân Tây	71313	0	\N	\N	\N	\N	\N	xt	713
7131335	Xã Bảo Bình	71313	0	\N	\N	\N	\N	\N	bb	713
7131337	Xã Xuân Bảo	71313	0	\N	\N	\N	\N	\N	xb	713
7131339	Xã Lâm San	71313	0	\N	\N	\N	\N	\N	ls	713
7131341	Xã Sông Ray	71313	0	\N	\N	\N	\N	\N	sr	713
7131500	Không xác định	71315	0	\N	\N	\N	\N	\N	kx	713
7131501	Thị trấn Long Thành	71315	0	\N	\N	\N	\N	\N	lt	713
7131503	Xã Phước Tân	71315	0	\N	\N	\N	\N	\N	pt	713
7131505	Xã An Hoà	71315	0	\N	\N	\N	\N	\N	ah	713
7131507	Xã Long Hưng	71315	0	\N	\N	\N	\N	\N	lh	713
7131509	Xã Tam Phước	71315	0	\N	\N	\N	\N	\N	tp	713
7131511	Xã Bình An	71315	0	\N	\N	\N	\N	\N	ba	713
7131513	Xã An Phước	71315	0	\N	\N	\N	\N	\N	ap	713
7131515	Xã Tam An	71315	0	\N	\N	\N	\N	\N	ta	713
7131517	Xã Lộc An	71315	0	\N	\N	\N	\N	\N	la	713
7131519	Xã Long Đức	71315	0	\N	\N	\N	\N	\N	ld	713
7131521	Xã Bình Sơn	71315	0	\N	\N	\N	\N	\N	bs	713
7131523	Xã Cẩm Đường	71315	0	\N	\N	\N	\N	\N	cd	713
7131525	Xã Long An	71315	0	\N	\N	\N	\N	\N	la	713
7131527	Xã Suối Trầu	71315	0	\N	\N	\N	\N	\N	st	713
7131529	Xã Bàu Cạn	71315	0	\N	\N	\N	\N	\N	bc	713
7131531	Xã Long Phước	71315	0	\N	\N	\N	\N	\N	lp	713
7131533	Xã Phước Bình	71315	0	\N	\N	\N	\N	\N	pb	713
7131535	Xã Tân Hiệp	71315	0	\N	\N	\N	\N	\N	th	713
7131537	Xã Phước Thái	71315	0	\N	\N	\N	\N	\N	pt	713
7131700	Không xác định	71317	0	\N	\N	\N	\N	\N	kx	713
7131701	Xã Phước Thiền	71317	0	\N	\N	\N	\N	\N	pt	713
7131703	Xã Long Tân	71317	0	\N	\N	\N	\N	\N	lt	713
7131705	Xã Đại Phước	71317	0	\N	\N	\N	\N	\N	dp	713
7131707	Xã Phú Hội	71317	0	\N	\N	\N	\N	\N	ph	713
7131709	Xã Hiệp Phước	71317	0	\N	\N	\N	\N	\N	hp	713
7131711	Xã Phú Hữu	71317	0	\N	\N	\N	\N	\N	ph	713
7131713	Xã Phú Thạnh	71317	0	\N	\N	\N	\N	\N	pt	713
7131715	Xã Long Thọ	71317	0	\N	\N	\N	\N	\N	lt	713
7131717	Xã Phú Đông	71317	0	\N	\N	\N	\N	\N	pd	713
7131719	Xã Phước An	71317	0	\N	\N	\N	\N	\N	pa	713
7131721	Xã Vĩnh Thanh	71317	0	\N	\N	\N	\N	\N	vt	713
7131723	Xã Phước Khánh	71317	0	\N	\N	\N	\N	\N	pk	713
7150000	Không xác định	71500	0	\N	\N	\N	\N	\N	kx	715
7150100	Không xác định	71501	0	\N	\N	\N	\N	\N	kx	715
7150101	Phường Đức Thắng	71501	0	\N	\N	\N	\N	\N	dt	715
7150103	Phường Mũi Né	71501	0	\N	\N	\N	\N	\N	mn	715
7150105	Phường Phú Trinh	71501	0	\N	\N	\N	\N	\N	pt	715
7150107	Phường Phú Thủy	71501	0	\N	\N	\N	\N	\N	pt	715
7150109	Phường Thanh Hải	71501	0	\N	\N	\N	\N	\N	th	715
7150111	Phường Bình Hưng	71501	0	\N	\N	\N	\N	\N	bh	715
7150113	Phường Hưng Long	71501	0	\N	\N	\N	\N	\N	hl	715
7150115	Phường Đức Nghĩa	71501	0	\N	\N	\N	\N	\N	dn	715
7150117	Phường Lạc Đạo	71501	0	\N	\N	\N	\N	\N	ld	715
7150119	Phường Đức Long	71501	0	\N	\N	\N	\N	\N	dl	715
7150121	Xã Hàm Tiến	71501	0	\N	\N	\N	\N	\N	ht	715
7150123	Xã Phú Hải	71501	0	\N	\N	\N	\N	\N	ph	715
7150125	Xã Phong Nẫm	71501	0	\N	\N	\N	\N	\N	pn	715
7150127	Xã Tiến Lợi	71501	0	\N	\N	\N	\N	\N	tl	715
7150129	Xã Tiến Thành	71501	0	\N	\N	\N	\N	\N	tt	715
7150300	Không xác định	71503	0	\N	\N	\N	\N	\N	kx	715
7150301	Thị trấn Liên Hương	71503	0	\N	\N	\N	\N	\N	lh	715
7150303	Thị trấn Phan Rí Cửa	71503	0	\N	\N	\N	\N	\N	prc	715
7150305	Xã Phan Dũng	71503	0	\N	\N	\N	\N	\N	pd	715
7150307	Xã Vĩnh Hảo	71503	0	\N	\N	\N	\N	\N	vh	715
7150309	Xã Phong Phú	71503	0	\N	\N	\N	\N	\N	pp	715
7150311	Xã Phú Lạc	71503	0	\N	\N	\N	\N	\N	pl	715
7150313	Xã Phước Thể	71503	0	\N	\N	\N	\N	\N	pt	715
7150315	Xã Bình Thạnh	71503	0	\N	\N	\N	\N	\N	bt	715
7150317	Xã Chí Công	71503	0	\N	\N	\N	\N	\N	cc	715
7150319	Xã Hòa Minh	71503	0	\N	\N	\N	\N	\N	hm	715
7150321	Xã Hoà Phú	71503	0	\N	\N	\N	\N	\N	hp	715
7150500	Không xác định	71505	0	\N	\N	\N	\N	\N	kx	715
7150501	Thị trấn Chợ Lầu	71505	0	\N	\N	\N	\N	\N	cl	715
7150503	Xã Phan Lâm	71505	0	\N	\N	\N	\N	\N	pl	715
7150505	Xã Phan Điền	71505	0	\N	\N	\N	\N	\N	pd	715
7150507	Xã Phan Hiệp	71505	0	\N	\N	\N	\N	\N	ph	715
7150509	Xã Phan Hòa	71505	0	\N	\N	\N	\N	\N	ph	715
7150511	Xã Hải Ninh	71505	0	\N	\N	\N	\N	\N	hn	715
7150513	Xã Phan Rí Thành	71505	0	\N	\N	\N	\N	\N	prt	715
7150515	Xã Bình An	71505	0	\N	\N	\N	\N	\N	ba	715
7150517	Xã Hồng Thái	71505	0	\N	\N	\N	\N	\N	ht	715
7150519	Xã Phan Sơn	71505	0	\N	\N	\N	\N	\N	ps	715
7150521	Xã Lương Sơn	71505	0	\N	\N	\N	\N	\N	ls	715
7150523	Xã Phan Thanh	71505	0	\N	\N	\N	\N	\N	pt	715
7150525	Xã Hòa Thắng	71505	0	\N	\N	\N	\N	\N	ht	715
7150527	Xã Sông Lũy	71505	0	\N	\N	\N	\N	\N	sl	715
7150529	Xã Bình Tân	71505	0	\N	\N	\N	\N	\N	bt	715
7150531	Xã Hồng Phong	71505	0	\N	\N	\N	\N	\N	hp	715
7150533	Xã Phan Tiến	71505	0	\N	\N	\N	\N	\N	pt	715
7150700	Không xác định	71507	0	\N	\N	\N	\N	\N	kx	715
7150701	Xã Ma Lâm	71507	0	\N	\N	\N	\N	\N	ml	715
7150703	Xã Hồng Liêm	71507	0	\N	\N	\N	\N	\N	hl	715
7150705	Xã Thuận Hòa	71507	0	\N	\N	\N	\N	\N	th	715
7150707	Xã Đông Tiến	71507	0	\N	\N	\N	\N	\N	dt	715
7150709	Xã Hàm Trí	71507	0	\N	\N	\N	\N	\N	ht	715
7150711	Xã Hồng Sơn	71507	0	\N	\N	\N	\N	\N	hs	715
7150713	Xã Hàm Phú	71507	0	\N	\N	\N	\N	\N	hp	715
7150715	Xã Hàm Đức	71507	0	\N	\N	\N	\N	\N	hd	715
7150717	Xã La Dạ	71507	0	\N	\N	\N	\N	\N	ld	715
7150719	Xã Đông Giang	71507	0	\N	\N	\N	\N	\N	dg	715
7150721	Xã Thuận Minh	71507	0	\N	\N	\N	\N	\N	tm	715
7150723	Xã Hàm Chính	71507	0	\N	\N	\N	\N	\N	hc	715
7150725	Xã Hàm Thắng	71507	0	\N	\N	\N	\N	\N	ht	715
7150727	Xã Hàm Nhơn	71507	0	\N	\N	\N	\N	\N	hn	715
7150729	Xã Hàm Liêm	71507	0	\N	\N	\N	\N	\N	hl	715
7150731	Xã Hàm Hiệp	71507	0	\N	\N	\N	\N	\N	hh	715
7150900	Không xác định	71509	0	\N	\N	\N	\N	\N	kx	715
7150901	Xã Tân Lập	71509	0	\N	\N	\N	\N	\N	tl	715
7150903	Xã Mỹ Thạnh	71509	0	\N	\N	\N	\N	\N	mt	715
7150905	Xã Hàm Cần	71509	0	\N	\N	\N	\N	\N	hc	715
7150907	Xã Mương Mán	71509	0	\N	\N	\N	\N	\N	mm	715
7150909	Xã Hàm Mỹ	71509	0	\N	\N	\N	\N	\N	hm	715
7150911	Xã Hàm Thạnh	71509	0	\N	\N	\N	\N	\N	ht	715
7150913	Xã Hàm Kiệm	71509	0	\N	\N	\N	\N	\N	hk	715
7150915	Xã Hàm Cường	71509	0	\N	\N	\N	\N	\N	hc	715
7150917	Xã Hàm Minh	71509	0	\N	\N	\N	\N	\N	hm	715
7150919	Xã Thuận Quí	71509	0	\N	\N	\N	\N	\N	tq	715
7150921	Xã Tân Thuận	71509	0	\N	\N	\N	\N	\N	tt	715
7150923	Xã Tân Thành	71509	0	\N	\N	\N	\N	\N	tt	715
7151100	Không xác định	71511	0	\N	\N	\N	\N	\N	kx	715
7151101	Xã Lạc Tánh	71511	0	\N	\N	\N	\N	\N	lt	715
7151103	Xã Bắc Ruộng	71511	0	\N	\N	\N	\N	\N	br	715
7151105	Xã La Ngâu	71511	0	\N	\N	\N	\N	\N	ln	715
7151107	Xã Đồng Kho	71511	0	\N	\N	\N	\N	\N	dk	715
7151109	Xã Đức Bình	71511	0	\N	\N	\N	\N	\N	db	715
7151111	Xã Đức Thuận	71511	0	\N	\N	\N	\N	\N	dt	715
7151113	Xã Suối Kiết	71511	0	\N	\N	\N	\N	\N	sk	715
7151115	Xã Măng Tố	71511	0	\N	\N	\N	\N	\N	mt	715
7151117	Xã Huy Khiêm	71511	0	\N	\N	\N	\N	\N	hk	715
7151119	Xã Nghị Đức	71511	0	\N	\N	\N	\N	\N	nd	715
7151121	Xã Đức Tân	71511	0	\N	\N	\N	\N	\N	dt	715
7151123	Xã Đức Phú	71511	0	\N	\N	\N	\N	\N	dp	715
7151125	Xã Gia An	71511	0	\N	\N	\N	\N	\N	ga	715
7151127	Xã Gia Huynh	71511	0	\N	\N	\N	\N	\N	gh	715
7151300	Không xác định	71513	0	\N	\N	\N	\N	\N	kx	715
7151301	Thị trấn La Gi	71513	0	\N	\N	\N	\N	\N	lg	715
7151303	Xã Tân An	71513	0	\N	\N	\N	\N	\N	ta	715
7151305	Xã Tân Nghĩa	71513	0	\N	\N	\N	\N	\N	tn	715
7151307	Xã Tân Hải	71513	0	\N	\N	\N	\N	\N	th	715
7151309	Xã Tân Bình	71513	0	\N	\N	\N	\N	\N	tb	715
7151311	Xã Tân Minh	71513	0	\N	\N	\N	\N	\N	tm	715
7151313	Xã Tân Hà	71513	0	\N	\N	\N	\N	\N	th	715
7151315	Xã Tân Xuân	71513	0	\N	\N	\N	\N	\N	tx	715
7151317	Xã Tân Thiện	71513	0	\N	\N	\N	\N	\N	tt	715
7151319	Xã Sơn Mỹ	71513	0	\N	\N	\N	\N	\N	sm	715
7151321	Xã Tân Thắng	71513	0	\N	\N	\N	\N	\N	tt	715
7151500	Không xác định	71515	0	\N	\N	\N	\N	\N	kx	715
7151501	Xã Võ Xu	71515	0	\N	\N	\N	\N	\N	vx	715
7151503	Xã Mê Pu	71515	0	\N	\N	\N	\N	\N	mp	715
7151505	Xã Vũ Hoà	71515	0	\N	\N	\N	\N	\N	vh	715
7151507	Xã Tân Hà	71515	0	\N	\N	\N	\N	\N	th	715
7151509	Xã Trà Tân	71515	0	\N	\N	\N	\N	\N	tt	715
7151511	Xã Sùng Nhơn	71515	0	\N	\N	\N	\N	\N	sn	715
7151513	Xã Nam Chính	71515	0	\N	\N	\N	\N	\N	nc	715
7151515	Xã Đức Chính	71515	0	\N	\N	\N	\N	\N	dc	715
7151517	Xã Đức Tài	71515	0	\N	\N	\N	\N	\N	dt	715
7151519	Xã Đa Kai	71515	0	\N	\N	\N	\N	\N	dk	715
7151521	Xã Đức Hạnh	71515	0	\N	\N	\N	\N	\N	dh	715
7151700	Không xác định	71517	0	\N	\N	\N	\N	\N	kx	715
7151701	Xã Ngũ Phụng	71517	0	\N	\N	\N	\N	\N	np	715
7151703	Xã Long Hải	71517	0	\N	\N	\N	\N	\N	lh	715
7151705	Xã Tam Thanh	71517	0	\N	\N	\N	\N	\N	tt	715
7170000	Không xác định	71700	0	\N	\N	\N	\N	\N	kx	717
7170300	Không xác định	71703	0	\N	\N	\N	\N	\N	kx	717
7170301	Phường Phước Hưng	71703	0	\N	\N	\N	\N	\N	ph	717
7170303	Phường Phước Hiệp	71703	0	\N	\N	\N	\N	\N	ph	717
7170305	Phường Phước Nguyên	71703	0	\N	\N	\N	\N	\N	pn	717
7170307	Phường Long Toàn	71703	0	\N	\N	\N	\N	\N	lt	717
7170309	Phường Phước Trung	71703	0	\N	\N	\N	\N	\N	pt	717
7170311	Xã Long Phước	71703	0	\N	\N	\N	\N	\N	lp	717
7170313	Xã Hoà Long	71703	0	\N	\N	\N	\N	\N	hl	717
7170315	Xã Long Hương	71703	0	\N	\N	\N	\N	\N	lh	717
7170500	Không xác định	71705	0	\N	\N	\N	\N	\N	kx	717
7170501	Thị trấn Ngãi Giao	71705	0	\N	\N	\N	\N	\N	ng	717
7170503	Xã Bình Ba	71705	0	\N	\N	\N	\N	\N	bb	717
7170505	Xã Suối Nghệ	71705	0	\N	\N	\N	\N	\N	sn	717
7170507	Xã Xuân Sơn	71705	0	\N	\N	\N	\N	\N	xs	717
7170509	Xã Bình Giã	71705	0	\N	\N	\N	\N	\N	bg	717
7170511	Xã Xà Bang	71705	0	\N	\N	\N	\N	\N	xb	717
7170513	Xã Láng Lớn	71705	0	\N	\N	\N	\N	\N	ll	717
7170515	Xã Quảng Thành	71705	0	\N	\N	\N	\N	\N	qt	717
7170517	Xã Kim Long	71705	0	\N	\N	\N	\N	\N	kl	717
7170519	Xã Suối Rao	71705	0	\N	\N	\N	\N	\N	sr	717
7170521	Xã Đá Bạc	71705	0	\N	\N	\N	\N	\N	db	717
7170523	Xã Nghĩa Thành	71705	0	\N	\N	\N	\N	\N	nt	717
7170700	Không xác định	71707	0	\N	\N	\N	\N	\N	kx	717
7170701	Thị trấn Phước Bửu	71707	0	\N	\N	\N	\N	\N	pb	717
7170703	Xã Phước Thuận	71707	0	\N	\N	\N	\N	\N	pt	717
7170705	Xã Phước Tân	71707	0	\N	\N	\N	\N	\N	pt	717
7170707	Xã Xuyên Mộc	71707	0	\N	\N	\N	\N	\N	xm	717
7170709	Xã Bông Trang	71707	0	\N	\N	\N	\N	\N	bt	717
7170711	Xã Bàu Lâm	71707	0	\N	\N	\N	\N	\N	bl	717
7170713	Xã Hòa Bình	71707	0	\N	\N	\N	\N	\N	hb	717
7170715	Xã Hòa Hưng	71707	0	\N	\N	\N	\N	\N	hh	717
7170717	Xã Hòa Hiệp	71707	0	\N	\N	\N	\N	\N	hh	717
7170719	Xã Hòa Hội	71707	0	\N	\N	\N	\N	\N	hh	717
7170721	Xã Bưng Riềng	71707	0	\N	\N	\N	\N	\N	br	717
7170723	Xã Bình Châu	71707	0	\N	\N	\N	\N	\N	bc	717
7170900	Không xác định	71709	0	\N	\N	\N	\N	\N	kx	717
7170901	Thị trấn Phú Mỹ	71709	0	\N	\N	\N	\N	\N	pm	717
7170903	Xã Hội Bài	71709	0	\N	\N	\N	\N	\N	hb	717
7170905	Xã Phước Hoà	71709	0	\N	\N	\N	\N	\N	ph	717
7170907	Xã Mỹ Xuân	71709	0	\N	\N	\N	\N	\N	mx	717
7170909	Xã Sông Xoài	71709	0	\N	\N	\N	\N	\N	sx	717
7170911	Xã Hắc Dịch	71709	0	\N	\N	\N	\N	\N	hd	717
7170913	Xã Châu Pha	71709	0	\N	\N	\N	\N	\N	cp	717
7170915	Xã Tóc Tiên	71709	0	\N	\N	\N	\N	\N	tt	717
7171300	Không xác định	71713	0	\N	\N	\N	\N	\N	kx	717
8010000	Không xác định	80100	0	\N	\N	\N	\N	\N	kx	801
8010100	Không xác định	80101	0	\N	\N	\N	\N	\N	kx	801
8010101	Phường 1	80101	0	\N	\N	\N	\N	\N	1	801
8010103	Phường 2	80101	0	\N	\N	\N	\N	\N	2	801
8010105	Phường 3	80101	0	\N	\N	\N	\N	\N	3	801
8010107	Phường 4	80101	0	\N	\N	\N	\N	\N	4	801
8010109	Phường 5	80101	0	\N	\N	\N	\N	\N	5	801
8010111	Xã Hướng Thọ Phú	80101	0	\N	\N	\N	\N	\N	htp	801
8010113	Xã Lợi Bình Nhơn	80101	0	\N	\N	\N	\N	\N	lbn	801
8010115	Xã Nhơn Thạnh Trung	80101	0	\N	\N	\N	\N	\N	ntt	801
8010117	Xã Bình Tâm	80101	0	\N	\N	\N	\N	\N	bt	801
8010119	Xã Khánh Hậu	80101	0	\N	\N	\N	\N	\N	kh	801
8010121	Xã An Vĩnh Ngãi	80101	0	\N	\N	\N	\N	\N	avn	801
8010123	Phường 6	80101	0	\N	\N	\N	\N	\N	6	801
8010300	Không xác định	80103	0	\N	\N	\N	\N	\N	kx	801
8010301	Thị trấn Tân Hưng	80103	0	\N	\N	\N	\N	\N	th	801
8010303	Xã Vĩnh Thạnh	80103	0	\N	\N	\N	\N	\N	vt	801
8010305	Xã Vĩnh Lợi	80103	0	\N	\N	\N	\N	\N	vl	801
8010307	Xã Vĩnh Đại	80103	0	\N	\N	\N	\N	\N	vd	801
8010309	Xã Hưng Điền B	80103	0	\N	\N	\N	\N	\N	hdb	801
8010311	Xã Hưng Thạnh	80103	0	\N	\N	\N	\N	\N	ht	801
8010313	Xã Vĩnh Châu A	80103	0	\N	\N	\N	\N	\N	vca	801
8010315	Xã Vĩnh Châu B	80103	0	\N	\N	\N	\N	\N	vcb	801
8010317	Xã Thạnh Hưng	80103	0	\N	\N	\N	\N	\N	th	801
8010319	Xã Hưng Hà	80103	0	\N	\N	\N	\N	\N	hh	801
8010321	Xã Hưng Điền	80103	0	\N	\N	\N	\N	\N	hd	801
8010500	Không xác định	80105	0	\N	\N	\N	\N	\N	kx	801
8010501	Thị trấn Vĩnh Hưng	80105	0	\N	\N	\N	\N	\N	vh	801
8010503	Xã Vĩnh Trị	80105	0	\N	\N	\N	\N	\N	vt	801
8010505	Xã Hưng Điền A	80105	0	\N	\N	\N	\N	\N	hda	801
8010507	Xã Thái Trị	80105	0	\N	\N	\N	\N	\N	tt	801
8010509	Xã Thái Bình Trung	80105	0	\N	\N	\N	\N	\N	tbt	801
8010511	Xã Tuyên Bình	80105	0	\N	\N	\N	\N	\N	tb	801
8010513	Xã Tuyên Bình Tây	80105	0	\N	\N	\N	\N	\N	tbt	801
8010515	Xã Vĩnh Bình	80105	0	\N	\N	\N	\N	\N	vb	801
8010517	Xã Khánh Hưng	80105	0	\N	\N	\N	\N	\N	kh	801
8010519	Xã Vĩnh Thuận	80105	0	\N	\N	\N	\N	\N	vt	801
8010700	Không xác định	80107	0	\N	\N	\N	\N	\N	kx	801
8010701	Thị trấn Mộc Hóa	80107	0	\N	\N	\N	\N	\N	mh	801
8010703	Xã Thạnh Trị	80107	0	\N	\N	\N	\N	\N	tt	801
8010705	Xã Bình Hiệp	80107	0	\N	\N	\N	\N	\N	bh	801
8010707	Xã Bình Hòa Tây	80107	0	\N	\N	\N	\N	\N	bht	801
8010709	Xã Bình Hòa Đông	80107	0	\N	\N	\N	\N	\N	bhd	801
8010711	Xã Tuyên Thạnh	80107	0	\N	\N	\N	\N	\N	tt	801
8010713	Xã Tân Lập	80107	0	\N	\N	\N	\N	\N	tl	801
8010715	Xã Bình Phong Thạnh	80107	0	\N	\N	\N	\N	\N	bpt	801
8010717	Xã Bình Hòa Trung	80107	0	\N	\N	\N	\N	\N	bht	801
8010719	Xã Bình Tân	80107	0	\N	\N	\N	\N	\N	bt	801
8010721	Xã Thạnh Hưng	80107	0	\N	\N	\N	\N	\N	th	801
8010723	Xã Tân Thành	80107	0	\N	\N	\N	\N	\N	tt	801
8010725	Xã Bình Thạnh	80107	0	\N	\N	\N	\N	\N	bt	801
8010900	Không xác định	80109	0	\N	\N	\N	\N	\N	kx	801
8010901	Thị trấn Tân Thạnh	80109	0	\N	\N	\N	\N	\N	tt	801
8010903	Xã Kiến Bình	80109	0	\N	\N	\N	\N	\N	kb	801
8010905	Xã Bắc Hòa	80109	0	\N	\N	\N	\N	\N	bh	801
8010907	Xã Hậu Thạnh Đông	80109	0	\N	\N	\N	\N	\N	htd	801
8010909	Xã Nhơn Hòa Lập	80109	0	\N	\N	\N	\N	\N	nhl	801
8010911	Xã Nhơn Ninh	80109	0	\N	\N	\N	\N	\N	nn	801
8010913	Xã Tân Thành	80109	0	\N	\N	\N	\N	\N	tt	801
8010915	Xã Tân Ninh	80109	0	\N	\N	\N	\N	\N	tn	801
8010917	Xã Tân Lập	80109	0	\N	\N	\N	\N	\N	tl	801
8010919	Xã Tân Hòa	80109	0	\N	\N	\N	\N	\N	th	801
8010921	Xã Hậu Thạnh Tây	80109	0	\N	\N	\N	\N	\N	htt	801
8010923	Xã Tân Bình	80109	0	\N	\N	\N	\N	\N	tb	801
8010925	Xã Nhơn Hoà	80109	0	\N	\N	\N	\N	\N	nh	801
8011100	Không xác định	80111	0	\N	\N	\N	\N	\N	kx	801
8011101	Thị trấn Thạnh Hóa	80111	0	\N	\N	\N	\N	\N	th	801
8011103	Xã Thủy Đông	80111	0	\N	\N	\N	\N	\N	td	801
8011105	Xã Thủy Tây	80111	0	\N	\N	\N	\N	\N	tt	801
8011107	Xã Tân Đông	80111	0	\N	\N	\N	\N	\N	td	801
8011109	Xã Tân Tây	80111	0	\N	\N	\N	\N	\N	tt	801
8011111	Xã Thạnh Phước	80111	0	\N	\N	\N	\N	\N	tp	801
8011113	Xã Thạnh Phú	80111	0	\N	\N	\N	\N	\N	tp	801
8011115	Xã Thuận Nghĩa Hòa	80111	0	\N	\N	\N	\N	\N	tnh	801
8011117	Xã Thuận Bình	80111	0	\N	\N	\N	\N	\N	tb	801
8011119	Xã Tân Hiệp	80111	0	\N	\N	\N	\N	\N	th	801
8011300	Không xác định	80113	0	\N	\N	\N	\N	\N	kx	801
8011301	Thị trấn Đông Thành	80113	0	\N	\N	\N	\N	\N	dt	801
8011303	Xã Mỹ Thạnh Đông	80113	0	\N	\N	\N	\N	\N	mtd	801
8011305	Xã Mỹ Quý Đông	80113	0	\N	\N	\N	\N	\N	mqd	801
8011307	Xã Mỹ Quý Tây	80113	0	\N	\N	\N	\N	\N	mqt	801
8011309	Xã Mỹ Thạnh Tây	80113	0	\N	\N	\N	\N	\N	mtt	801
8011311	Xã Bình Thành	80113	0	\N	\N	\N	\N	\N	bt	801
8011313	Xã Mỹ Thạnh Bắc	80113	0	\N	\N	\N	\N	\N	mtb	801
8011315	Xã Bình Hòa Bắc	80113	0	\N	\N	\N	\N	\N	bhb	801
8011317	Xã Bình Hòa Nam	80113	0	\N	\N	\N	\N	\N	bhn	801
8011319	Xã Bình Hòa Hưng	80113	0	\N	\N	\N	\N	\N	bhh	801
8011500	Không xác định	80115	0	\N	\N	\N	\N	\N	kx	801
8011501	Thị trấn Hậu Nghĩa	80115	0	\N	\N	\N	\N	\N	hn	801
8011503	Thị trấn Đức Hòa	80115	0	\N	\N	\N	\N	\N	dh	801
8011505	Thị trấn Hiệp Hòa	80115	0	\N	\N	\N	\N	\N	hh	801
8011507	Xã Lộc Giang	80115	0	\N	\N	\N	\N	\N	lg	801
8011509	Xã An Ninh Đông	80115	0	\N	\N	\N	\N	\N	and	801
8011511	Xã An Ninh Tây	80115	0	\N	\N	\N	\N	\N	ant	801
8011513	Xã Hiệp Hòa	80115	0	\N	\N	\N	\N	\N	hh	801
8011515	Xã Tân Phú	80115	0	\N	\N	\N	\N	\N	tp	801
8011517	Xã Hòa Khánh Tây	80115	0	\N	\N	\N	\N	\N	hkt	801
8011519	Xã Hòa Khánh Đông	80115	0	\N	\N	\N	\N	\N	hkd	801
8011521	Xã Hòa Khánh Nam	80115	0	\N	\N	\N	\N	\N	hkn	801
8011523	Xã Tân Mỹ	80115	0	\N	\N	\N	\N	\N	tm	801
8011525	Xã Đức Lập Thượng	80115	0	\N	\N	\N	\N	\N	dlt	801
8011527	Xã Đức Lập Hạ	80115	0	\N	\N	\N	\N	\N	dlh	801
8011529	Xã Hựu Thạnh	80115	0	\N	\N	\N	\N	\N	ht	801
8011531	Xã Đức Hòa Thượng	80115	0	\N	\N	\N	\N	\N	dht	801
8011533	Xã Đức Hòa Hạ	80115	0	\N	\N	\N	\N	\N	dhh	801
8011535	Xã Mỹ Hạnh Bắc	80115	0	\N	\N	\N	\N	\N	mhb	801
8011537	Xã Mỹ Hạnh Nam	80115	0	\N	\N	\N	\N	\N	mhn	801
8011539	Xã Đức Hòa Đông	80115	0	\N	\N	\N	\N	\N	dhd	801
8011700	Không xác định	80117	0	\N	\N	\N	\N	\N	kx	801
8011701	Thị trấn Bến Lức	80117	0	\N	\N	\N	\N	\N	bl	801
8011703	Xã Thạnh Lợi	80117	0	\N	\N	\N	\N	\N	tl	801
8011705	Xã Thạnh Hòa	80117	0	\N	\N	\N	\N	\N	th	801
8011707	Xã Bình Đức	80117	0	\N	\N	\N	\N	\N	bd	801
8011709	Xã Lương Bình	80117	0	\N	\N	\N	\N	\N	lb	801
8011711	Xã Lương Hòa	80117	0	\N	\N	\N	\N	\N	lh	801
8011713	Xã Tân Bửu	80117	0	\N	\N	\N	\N	\N	tb	801
8011715	Xã An Thạnh	80117	0	\N	\N	\N	\N	\N	at	801
8011717	Xã Thạnh Đức	80117	0	\N	\N	\N	\N	\N	td	801
8011719	Xã Nhựt Chánh	80117	0	\N	\N	\N	\N	\N	nc	801
8011721	Xã Thanh Phú	80117	0	\N	\N	\N	\N	\N	tp	801
8011723	Xã Long Hiệp	80117	0	\N	\N	\N	\N	\N	lh	801
8011725	Xã Mỹ Yên	80117	0	\N	\N	\N	\N	\N	my	801
8011727	Xã Phước Lợi	80117	0	\N	\N	\N	\N	\N	pl	801
8011729	Xã Tân Hòa	80117	0	\N	\N	\N	\N	\N	th	801
8011900	Không xác định	80119	0	\N	\N	\N	\N	\N	kx	801
8011901	Thị trấn Thủ Thừa	80119	0	\N	\N	\N	\N	\N	tt	801
8011903	Xã Long Thạnh	80119	0	\N	\N	\N	\N	\N	lt	801
8011905	Xã Long Thuận	80119	0	\N	\N	\N	\N	\N	lt	801
8011907	Xã Mỹ Lạc	80119	0	\N	\N	\N	\N	\N	ml	801
8011909	Xã Mỹ Thạnh	80119	0	\N	\N	\N	\N	\N	mt	801
8011911	Xã Mỹ An	80119	0	\N	\N	\N	\N	\N	ma	801
8011913	Xã Mỹ Phú	80119	0	\N	\N	\N	\N	\N	mp	801
8011915	Xã Tân Thành	80119	0	\N	\N	\N	\N	\N	tt	801
8011917	Xã Bình An	80119	0	\N	\N	\N	\N	\N	ba	801
8011919	Xã Bình Thạnh	80119	0	\N	\N	\N	\N	\N	bt	801
8011921	Xã Nhị Thành	80119	0	\N	\N	\N	\N	\N	nt	801
8012100	Không xác định	80121	0	\N	\N	\N	\N	\N	kx	801
8012101	Thị trấn Tầm Vu	80121	0	\N	\N	\N	\N	\N	tv	801
8012103	Xã Bình Quới	80121	0	\N	\N	\N	\N	\N	bq	801
8012105	Xã Hòa Phú	80121	0	\N	\N	\N	\N	\N	hp	801
8012107	Xã Vĩnh Công	80121	0	\N	\N	\N	\N	\N	vc	801
8012109	Xã Hiệp Thạnh	80121	0	\N	\N	\N	\N	\N	ht	801
8012111	Xã Dương Xuân Hội	80121	0	\N	\N	\N	\N	\N	dxh	801
8012113	Xã Long Trì	80121	0	\N	\N	\N	\N	\N	lt	801
8012115	Xã Phú Ngãi Trị	80121	0	\N	\N	\N	\N	\N	pnt	801
8012117	Xã Phước Tân Hưng	80121	0	\N	\N	\N	\N	\N	pth	801
8012119	Xã Thanh Phú Long	80121	0	\N	\N	\N	\N	\N	tpl	801
8012121	Xã An Lục Long	80121	0	\N	\N	\N	\N	\N	all	801
8012123	Xã Thuận Mỹ	80121	0	\N	\N	\N	\N	\N	tm	801
8012125	Xã Thanh Vĩnh Đông	80121	0	\N	\N	\N	\N	\N	tvd	801
8012300	Không xác định	80123	0	\N	\N	\N	\N	\N	kx	801
8012301	Thị trấn Tân Trụ	80123	0	\N	\N	\N	\N	\N	tt	801
8012303	Xã Bình Tịnh	80123	0	\N	\N	\N	\N	\N	bt	801
8012305	Xã Mỹ Bình	80123	0	\N	\N	\N	\N	\N	mb	801
8012307	Xã An Nhựt Tân	80123	0	\N	\N	\N	\N	\N	ant	801
8012309	Xã Quê Mỹ Thạnh	80123	0	\N	\N	\N	\N	\N	qmt	801
8012311	Xã Lạc Tấn	80123	0	\N	\N	\N	\N	\N	lt	801
8012313	Xã Bình Lãng	80123	0	\N	\N	\N	\N	\N	bl	801
8012315	Xã Bình Trinh Đông	80123	0	\N	\N	\N	\N	\N	btd	801
8012317	Xã Tân Phước Tây	80123	0	\N	\N	\N	\N	\N	tpt	801
8012319	Xã Đức Tân	80123	0	\N	\N	\N	\N	\N	dt	801
8012321	Xã Nhựt Ninh	80123	0	\N	\N	\N	\N	\N	nn	801
8012500	Không xác định	80125	0	\N	\N	\N	\N	\N	kx	801
8012501	Thị trấn Cần Đước	80125	0	\N	\N	\N	\N	\N	cd	801
8012503	Xã Long Trạch	80125	0	\N	\N	\N	\N	\N	lt	801
8012505	Xã Long Khê	80125	0	\N	\N	\N	\N	\N	lk	801
8012507	Xã Long Định	80125	0	\N	\N	\N	\N	\N	ld	801
8012509	Xã Phước Vân	80125	0	\N	\N	\N	\N	\N	pv	801
8012511	Xã Long Cang	80125	0	\N	\N	\N	\N	\N	lc	801
8012513	Xã Long Sơn	80125	0	\N	\N	\N	\N	\N	ls	801
8012515	Xã Long Hòa	80125	0	\N	\N	\N	\N	\N	lh	801
8012517	Xã Tân Trạch	80125	0	\N	\N	\N	\N	\N	tt	801
8012519	Xã Phước Tuy	80125	0	\N	\N	\N	\N	\N	pt	801
8012521	Xã Tân Ân	80125	0	\N	\N	\N	\N	\N	ta	801
8012523	Xã Tân Chánh	80125	0	\N	\N	\N	\N	\N	tc	801
8012525	Xã Mỹ Lệ	80125	0	\N	\N	\N	\N	\N	ml	801
8012527	Xã Tân Lân	80125	0	\N	\N	\N	\N	\N	tl	801
8012529	Xã Phước Đông	80125	0	\N	\N	\N	\N	\N	pd	801
8012531	Xã Long Hựu Tây	80125	0	\N	\N	\N	\N	\N	lht	801
8012533	Xã Long Hựu Đông	80125	0	\N	\N	\N	\N	\N	lhd	801
8012700	Không xác định	80127	0	\N	\N	\N	\N	\N	kx	801
8012701	Thị trấn Cần Giuộc	80127	0	\N	\N	\N	\N	\N	cg	801
8012703	Xã Phước Lý	80127	0	\N	\N	\N	\N	\N	pl	801
8012705	Xã Long Thượng	80127	0	\N	\N	\N	\N	\N	lt	801
8012707	Xã Phứơc Hậu	80127	0	\N	\N	\N	\N	\N	ph	801
8012709	Xã Mỹ Lộc	80127	0	\N	\N	\N	\N	\N	ml	801
8012711	Xã Phước Lâm	80127	0	\N	\N	\N	\N	\N	pl	801
8012713	Xã Thuận Thành	80127	0	\N	\N	\N	\N	\N	tt	801
8012715	Xã Long Hậu	80127	0	\N	\N	\N	\N	\N	lh	801
8012717	Xã Tân Kim	80127	0	\N	\N	\N	\N	\N	tk	801
8012719	Xã Trường Bình	80127	0	\N	\N	\N	\N	\N	tb	801
8012721	Xã Long An	80127	0	\N	\N	\N	\N	\N	la	801
8012723	Xã Phước Lại	80127	0	\N	\N	\N	\N	\N	pl	801
8012725	Xã Phước Vĩnh Tây	80127	0	\N	\N	\N	\N	\N	pvt	801
8012727	Xã Long Phụng	80127	0	\N	\N	\N	\N	\N	lp	801
8012729	Xã Đông Thạnh	80127	0	\N	\N	\N	\N	\N	dt	801
8012731	Xã Phước Vĩnh Đông	80127	0	\N	\N	\N	\N	\N	pvd	801
8012733	Xã Tân Tập	80127	0	\N	\N	\N	\N	\N	tt	801
8030000	Không xác định	80300	0	\N	\N	\N	\N	\N	kx	803
8030100	Không xác định	80301	0	\N	\N	\N	\N	\N	kx	803
8030101	Phường 1	80301	0	\N	\N	\N	\N	\N	1	803
8030103	Phường 2	80301	0	\N	\N	\N	\N	\N	2	803
8030105	Phường 3	80301	0	\N	\N	\N	\N	\N	3	803
8030107	Phường 4	80301	0	\N	\N	\N	\N	\N	4	803
8030109	Phường 6	80301	0	\N	\N	\N	\N	\N	6	803
8030111	Phường 11	80301	0	\N	\N	\N	\N	\N	11	803
8030113	Xã Mỹ Ngãi	80301	0	\N	\N	\N	\N	\N	mn	803
8030115	Xã Mỹ Tân	80301	0	\N	\N	\N	\N	\N	mt	803
8030117	Xã Mỹ Trà	80301	0	\N	\N	\N	\N	\N	mt	803
8030119	Xã Hòa An	80301	0	\N	\N	\N	\N	\N	ha	803
8030121	Xã Tân Thuận Đông	80301	0	\N	\N	\N	\N	\N	ttd	803
8030123	Xã Tân Thuận Tây	80301	0	\N	\N	\N	\N	\N	ttt	803
8030125	Xã Tịnh Thới	80301	0	\N	\N	\N	\N	\N	tt	803
8030300	Không xác định	80303	0	\N	\N	\N	\N	\N	kx	803
8030301	Phường 1	80303	0	\N	\N	\N	\N	\N	1	803
8030303	Phường 2	80303	0	\N	\N	\N	\N	\N	2	803
8030305	Phường 3	80303	0	\N	\N	\N	\N	\N	3	803
8030307	Phường 4	80303	0	\N	\N	\N	\N	\N	4	803
8030309	Xã Tân Khánh Đông	80303	0	\N	\N	\N	\N	\N	tkd	803
8030311	Xã Tân Phú Đông	80303	0	\N	\N	\N	\N	\N	tpd	803
8030313	Xã Tân Quy Đông	80303	0	\N	\N	\N	\N	\N	tqd	803
8030315	Xã Tân Quy Tây	80303	0	\N	\N	\N	\N	\N	tqt	803
8030500	Không xác định	80305	0	\N	\N	\N	\N	\N	kx	803
8030501	Thị trấn Sa Rài	80305	0	\N	\N	\N	\N	\N	sr	803
8030503	Xã Bình Phú	80305	0	\N	\N	\N	\N	\N	bp	803
8030505	Xã Tân Hộ Cơ	80305	0	\N	\N	\N	\N	\N	thc	803
8030507	Xã Thông Bình	80305	0	\N	\N	\N	\N	\N	tb	803
8030509	Xã Tân Thành A	80305	0	\N	\N	\N	\N	\N	tta	803
8030511	Xã Tân Thành B	80305	0	\N	\N	\N	\N	\N	ttb	803
8030513	Xã Tân Phước	80305	0	\N	\N	\N	\N	\N	tp	803
8030515	Xã An Phước	80305	0	\N	\N	\N	\N	\N	ap	803
8030517	Xã Tân Công Chí	80305	0	\N	\N	\N	\N	\N	tcc	803
8030700	Không xác định	80307	0	\N	\N	\N	\N	\N	kx	803
8030701	Thị trấn Hồng Ngự	80307	0	\N	\N	\N	\N	\N	hn	803
8030703	Xã Long Khánh A	80307	0	\N	\N	\N	\N	\N	lka	803
8030705	Xã Long Khánh B	80307	0	\N	\N	\N	\N	\N	lkb	803
8030707	Xã Phú Thuận A	80307	0	\N	\N	\N	\N	\N	pta	803
8030709	Xã Phú Thuận B	80307	0	\N	\N	\N	\N	\N	ptb	803
8030711	Xã Long Thuận	80307	0	\N	\N	\N	\N	\N	lt	803
8030713	Xã Thường Phước 1	80307	0	\N	\N	\N	\N	\N	tp1	803
8030715	Xã Thường Phước 2	80307	0	\N	\N	\N	\N	\N	tp2	803
8030717	Xã Thường Thới Tiền	80307	0	\N	\N	\N	\N	\N	ttt	803
8030719	Xã Thường Lạc	80307	0	\N	\N	\N	\N	\N	tl	803
8030721	Xã Thường Thới Hậu A	80307	0	\N	\N	\N	\N	\N	ttha	803
8030723	Xã Thường Thới Hậu B	80307	0	\N	\N	\N	\N	\N	tthb	803
8030725	Xã Tân Hội	80307	0	\N	\N	\N	\N	\N	th	803
8030727	Xã Bình Thạnh	80307	0	\N	\N	\N	\N	\N	bt	803
8030729	Xã An Bình A	80307	0	\N	\N	\N	\N	\N	aba	803
8030731	Xã An Bình B	80307	0	\N	\N	\N	\N	\N	abb	803
8030900	Không xác định	80309	0	\N	\N	\N	\N	\N	kx	803
8030901	Thị trấn Tràm Chim	80309	0	\N	\N	\N	\N	\N	tc	803
8030903	Xã An Hòa	80309	0	\N	\N	\N	\N	\N	ah	803
8030905	Xã An Long	80309	0	\N	\N	\N	\N	\N	al	803
8030907	Xã Phú Ninh	80309	0	\N	\N	\N	\N	\N	pn	803
8030909	Xã Phú Thành A	80309	0	\N	\N	\N	\N	\N	pta	803
8030911	Xã Phú Thành B	80309	0	\N	\N	\N	\N	\N	ptb	803
8030913	Xã Phú Thọ	80309	0	\N	\N	\N	\N	\N	pt	803
8030915	Xã Tân Công Sính	80309	0	\N	\N	\N	\N	\N	tcs	803
8030917	Xã Phú Cường	80309	0	\N	\N	\N	\N	\N	pc	803
8030919	Xã Phú Đức	80309	0	\N	\N	\N	\N	\N	pd	803
8030921	Xã Phú Hiệp	80309	0	\N	\N	\N	\N	\N	ph	803
8030923	Xã Hoà Bình	80309	0	\N	\N	\N	\N	\N	hb	803
8031100	Không xác định	80311	0	\N	\N	\N	\N	\N	kx	803
8031101	Thị trấn Thanh Bình	80311	0	\N	\N	\N	\N	\N	tb	803
8031103	Xã Bình Tấn	80311	0	\N	\N	\N	\N	\N	bt	803
8031105	Xã Tân Bình	80311	0	\N	\N	\N	\N	\N	tb	803
8031107	Xã Bình Thành	80311	0	\N	\N	\N	\N	\N	bt	803
8031109	Xã Tân Phú	80311	0	\N	\N	\N	\N	\N	tp	803
8031111	Xã An Phong	80311	0	\N	\N	\N	\N	\N	ap	803
8031113	Xã Tân Thạnh	80311	0	\N	\N	\N	\N	\N	tt	803
8031115	Xã Phú Lợi	80311	0	\N	\N	\N	\N	\N	pl	803
8031117	Xã Tân Mỹ	80311	0	\N	\N	\N	\N	\N	tm	803
8031119	Xã Tân Quới	80311	0	\N	\N	\N	\N	\N	tq	803
8031121	Xã Tân Hòa	80311	0	\N	\N	\N	\N	\N	th	803
8031123	Xã Tân Huề	80311	0	\N	\N	\N	\N	\N	th	803
8031125	Xã Tân Long	80311	0	\N	\N	\N	\N	\N	tl	803
8031300	Không xác định	80313	0	\N	\N	\N	\N	\N	kx	803
8031301	Thị trấn Mỹ An	80313	0	\N	\N	\N	\N	\N	ma	803
8031303	Xã Hưng Thạnh	80313	0	\N	\N	\N	\N	\N	ht	803
8031305	Xã Trường Xuân	80313	0	\N	\N	\N	\N	\N	tx	803
8031307	Xã Mỹ Hòa	80313	0	\N	\N	\N	\N	\N	mh	803
8031309	Xã Tân Kiều	80313	0	\N	\N	\N	\N	\N	tk	803
8031311	Xã Đốc Binh Kiều	80313	0	\N	\N	\N	\N	\N	dbk	803
8031313	Xã Mỹ An	80313	0	\N	\N	\N	\N	\N	ma	803
8031315	Xã Phú Điền	80313	0	\N	\N	\N	\N	\N	pd	803
8031317	Xã Thanh Mỹ	80313	0	\N	\N	\N	\N	\N	tm	803
8031319	Xã Mỹ Quý	80313	0	\N	\N	\N	\N	\N	mq	803
8031321	Xã Mỹ Đông	80313	0	\N	\N	\N	\N	\N	md	803
8031323	Xã Láng Biển	80313	0	\N	\N	\N	\N	\N	lb	803
8031325	Xã Thạnh Lợi	80313	0	\N	\N	\N	\N	\N	tl	803
8031500	Không xác định	80315	0	\N	\N	\N	\N	\N	kx	803
8031501	Thị trấn Mỹ Thọ	80315	0	\N	\N	\N	\N	\N	mt	803
8031503	Xã Phong Mỹ	80315	0	\N	\N	\N	\N	\N	pm	803
8031505	Xã Tân Nghĩa	80315	0	\N	\N	\N	\N	\N	tn	803
8031507	Xã Phương Trà	80315	0	\N	\N	\N	\N	\N	pt	803
8031509	Xã An Bình	80315	0	\N	\N	\N	\N	\N	ab	803
8031511	Xã Nhị Mỹ	80315	0	\N	\N	\N	\N	\N	nm	803
8031513	Xã Mỹ Thọ	80315	0	\N	\N	\N	\N	\N	mt	803
8031515	Xã Mỹ Hội	80315	0	\N	\N	\N	\N	\N	mh	803
8031517	Xã Mỹ Xương	80315	0	\N	\N	\N	\N	\N	mx	803
8031519	Xã Bình Hàng Trung	80315	0	\N	\N	\N	\N	\N	bht	803
8031521	Xã Bình Hàng Tây	80315	0	\N	\N	\N	\N	\N	bht	803
8031523	Xã Bình Thạnh	80315	0	\N	\N	\N	\N	\N	bt	803
8031525	Xã Mỹ Long	80315	0	\N	\N	\N	\N	\N	ml	803
8031527	Xã Mỹ Hiệp	80315	0	\N	\N	\N	\N	\N	mh	803
8031529	Xã Ba Sao	80315	0	\N	\N	\N	\N	\N	bs	803
8031531	Xã Phương Thịnh	80315	0	\N	\N	\N	\N	\N	pt	803
8031533	Xã Tân Hội Trung	80315	0	\N	\N	\N	\N	\N	tht	803
8031535	Xã Gáo Giồng	80315	0	\N	\N	\N	\N	\N	gg	803
8031700	Không xác định	80317	0	\N	\N	\N	\N	\N	kx	803
8031701	Thị trấn Lấp Vò	80317	0	\N	\N	\N	\N	\N	lv	803
8031703	Xã Bình Thành	80317	0	\N	\N	\N	\N	\N	bt	803
8031705	Xã Định An	80317	0	\N	\N	\N	\N	\N	da	803
8031707	Xã Định Yên	80317	0	\N	\N	\N	\N	\N	dy	803
8031709	Xã Long Hưng A	80317	0	\N	\N	\N	\N	\N	lha	803
8031711	Xã Long Hưng B	80317	0	\N	\N	\N	\N	\N	lhb	803
8031713	Xã Tân  Khánh Trung	80317	0	\N	\N	\N	\N	\N	tkt	803
8031715	Xã Vĩnh Thạnh	80317	0	\N	\N	\N	\N	\N	vt	803
8031717	Xã Tân Mỹ	80317	0	\N	\N	\N	\N	\N	tm	803
8031719	Xã Mỹ An Hưng A	80317	0	\N	\N	\N	\N	\N	maha	803
8031721	Xã Mỹ An Hưng B	80317	0	\N	\N	\N	\N	\N	mahb	803
8031723	Xã Hội An Đông	80317	0	\N	\N	\N	\N	\N	had	803
8031725	Xã Bình Thạnh Trung	80317	0	\N	\N	\N	\N	\N	btt	803
8031900	Không xác định	80319	0	\N	\N	\N	\N	\N	kx	803
8031901	Thị trấn Lai Vung	80319	0	\N	\N	\N	\N	\N	lv	803
8031903	Xã Hòa Long	80319	0	\N	\N	\N	\N	\N	hl	803
8031905	Xã Hòa Thành	80319	0	\N	\N	\N	\N	\N	ht	803
8031907	Xã Tân Dương	80319	0	\N	\N	\N	\N	\N	td	803
8031909	Xã Long Thắng	80319	0	\N	\N	\N	\N	\N	lt	803
8031911	Xã Long Hậu	80319	0	\N	\N	\N	\N	\N	lh	803
8031913	Xã Tân Thành	80319	0	\N	\N	\N	\N	\N	tt	803
8031915	Xã Tân Phước	80319	0	\N	\N	\N	\N	\N	tp	803
8031917	Xã Vĩnh Thới	80319	0	\N	\N	\N	\N	\N	vt	803
8031919	Xã Tân Hòa	80319	0	\N	\N	\N	\N	\N	th	803
8031921	Xã Định Hòa	80319	0	\N	\N	\N	\N	\N	dh	803
8031923	Xã Phong Hòa	80319	0	\N	\N	\N	\N	\N	ph	803
8032100	Không xác định	80321	0	\N	\N	\N	\N	\N	kx	803
8032101	Thị trấn Cái Tàu Hạ	80321	0	\N	\N	\N	\N	\N	cth	803
8032103	Xã Tân Phú	80321	0	\N	\N	\N	\N	\N	tp	803
8032105	Xã Tân Phú Trung	80321	0	\N	\N	\N	\N	\N	tpt	803
8032107	Xã Tân Bình	80321	0	\N	\N	\N	\N	\N	tb	803
7012905	Phường 3	70129	0	\N	\N	\N	\N	\N	3	701
8032109	Xã An Hiệp	80321	0	\N	\N	\N	\N	\N	ah	803
8032111	Xã Tân Nhuận Đông	80321	0	\N	\N	\N	\N	\N	tnd	803
8032113	Xã An Nhơn	80321	0	\N	\N	\N	\N	\N	an	803
8032115	Xã Phú Hựu	80321	0	\N	\N	\N	\N	\N	ph	803
8032117	Xã An Phú Thuận	80321	0	\N	\N	\N	\N	\N	apt	803
8032119	Xã Hòa Tân	80321	0	\N	\N	\N	\N	\N	ht	803
8032121	Xã An Khánh	80321	0	\N	\N	\N	\N	\N	ak	803
8032123	Xã Phú Long	80321	0	\N	\N	\N	\N	\N	pl	803
8050000	Không xác định	80500	0	\N	\N	\N	\N	\N	kx	805
8050100	Không xác định	80501	0	\N	\N	\N	\N	\N	kx	805
8050101	Phường Mỹ Bình	80501	0	\N	\N	\N	\N	\N	mb	805
8050103	Phường Mỹ Long	80501	0	\N	\N	\N	\N	\N	ml	805
8050105	Phường Mỹ Xuyên	80501	0	\N	\N	\N	\N	\N	mx	805
8050107	Phường Bình Đức	80501	0	\N	\N	\N	\N	\N	bd	805
8050109	Phường Mỹ Phước	80501	0	\N	\N	\N	\N	\N	mp	805
8050111	Xã Mỹ Hòa Hưng	80501	0	\N	\N	\N	\N	\N	mhh	805
8050113	Xã Mỹ Khánh	80501	0	\N	\N	\N	\N	\N	mk	805
8050115	Xã Mỹ Hòa	80501	0	\N	\N	\N	\N	\N	mh	805
8050117	Xã Mỹ Thới	80501	0	\N	\N	\N	\N	\N	mt	805
8050119	Xã Mỹ Thạnh	80501	0	\N	\N	\N	\N	\N	mt	805
8050300	Không xác định	80503	0	\N	\N	\N	\N	\N	kx	805
8050301	Phường Châu Phú B	80503	0	\N	\N	\N	\N	\N	cpb	805
8050303	Phường Châu Phú A	80503	0	\N	\N	\N	\N	\N	cpa	805
8050305	Xã Vĩnh Ngươn	80503	0	\N	\N	\N	\N	\N	vn	805
8050307	Xã Vĩnh Tế	80503	0	\N	\N	\N	\N	\N	vt	805
8050309	Xã Vĩnh Mỹ	80503	0	\N	\N	\N	\N	\N	vm	805
8050500	Không xác định	80505	0	\N	\N	\N	\N	\N	kx	805
8050501	Thị trấn An Phú	80505	0	\N	\N	\N	\N	\N	ap	805
8050503	Xã Khánh An	80505	0	\N	\N	\N	\N	\N	ka	805
8050505	Xã Khánh Bình	80505	0	\N	\N	\N	\N	\N	kb	805
8050507	Xã Quốc Thái	80505	0	\N	\N	\N	\N	\N	qt	805
8050509	Xã Nhơn Hội	80505	0	\N	\N	\N	\N	\N	nh	805
8050511	Xã Phú Hữu	80505	0	\N	\N	\N	\N	\N	ph	805
8050513	Xã Phú Hội	80505	0	\N	\N	\N	\N	\N	ph	805
8050515	Xã Phước Hưng	80505	0	\N	\N	\N	\N	\N	ph	805
8050517	Xã Vĩnh Lộc	80505	0	\N	\N	\N	\N	\N	vl	805
8050519	Xã Vĩnh Hậu	80505	0	\N	\N	\N	\N	\N	vh	805
8050521	Xã Vĩnh Trường	80505	0	\N	\N	\N	\N	\N	vt	805
8050523	Xã Vĩnh Hội Đông	80505	0	\N	\N	\N	\N	\N	vhd	805
8050525	Xã Đa Phước	80505	0	\N	\N	\N	\N	\N	dp	805
8050700	Không xác định	80507	0	\N	\N	\N	\N	\N	kx	805
8050701	Thị trấn Tân Châu	80507	0	\N	\N	\N	\N	\N	tc	805
8050703	Xã Phú Lộc	80507	0	\N	\N	\N	\N	\N	pl	805
8050705	Xã Vĩnh Xương	80507	0	\N	\N	\N	\N	\N	vx	805
8050707	Xã Vĩnh Hòa	80507	0	\N	\N	\N	\N	\N	vh	805
8050709	Xã Tân An	80507	0	\N	\N	\N	\N	\N	ta	805
8050711	Xã Long An	80507	0	\N	\N	\N	\N	\N	la	805
8050713	Xã Long Phú	80507	0	\N	\N	\N	\N	\N	lp	805
8050715	Xã Châu Phong	80507	0	\N	\N	\N	\N	\N	cp	805
8050717	Xã Phú Vĩnh	80507	0	\N	\N	\N	\N	\N	pv	805
8050719	Xã Lê Chánh	80507	0	\N	\N	\N	\N	\N	lc	805
8050900	Không xác định	80509	0	\N	\N	\N	\N	\N	kx	805
8050901	Thị trấn Phú Mỹ	80509	0	\N	\N	\N	\N	\N	pm	805
8050903	Thị trấn Chợ Vàm	80509	0	\N	\N	\N	\N	\N	cv	805
8050905	Xã Long Sơn	80509	0	\N	\N	\N	\N	\N	ls	805
8050907	Xã Phú Long	80509	0	\N	\N	\N	\N	\N	pl	805
8050909	Xã Phú Lâm	80509	0	\N	\N	\N	\N	\N	pl	805
8050911	Xã Phú Hiệp	80509	0	\N	\N	\N	\N	\N	ph	805
8050913	Xã Phú Thạnh	80509	0	\N	\N	\N	\N	\N	pt	805
8050915	Xã Hoà Lạc	80509	0	\N	\N	\N	\N	\N	hl	805
8050917	Xã Phú Thành	80509	0	\N	\N	\N	\N	\N	pt	805
8050919	Xã Phú An	80509	0	\N	\N	\N	\N	\N	pa	805
8050921	Xã Phú Xuân	80509	0	\N	\N	\N	\N	\N	px	805
8050923	Xã Hiệp Xương	80509	0	\N	\N	\N	\N	\N	hx	805
8050925	Xã Phú Bình	80509	0	\N	\N	\N	\N	\N	pb	805
8050927	Xã Phú Thọ	80509	0	\N	\N	\N	\N	\N	pt	805
8050929	Xã Phú Hưng	80509	0	\N	\N	\N	\N	\N	ph	805
8050931	Xã Bình Thạnh Đông	80509	0	\N	\N	\N	\N	\N	btd	805
8050933	Xã Tân Hòa	80509	0	\N	\N	\N	\N	\N	th	805
8051100	Không xác định	80511	0	\N	\N	\N	\N	\N	kx	805
8051101	Thị trấn Cái Dầu	80511	0	\N	\N	\N	\N	\N	cd	805
8051103	Xã Khánh Hòa	80511	0	\N	\N	\N	\N	\N	kh	805
8051105	Xã Mỹ Đức	80511	0	\N	\N	\N	\N	\N	md	805
8051107	Xã Mỹ Phú	80511	0	\N	\N	\N	\N	\N	mp	805
8051109	Xã Ô Long Vỹ	80511	0	\N	\N	\N	\N	\N	olv	805
8051111	Xã Vĩnh Thạnh Trung	80511	0	\N	\N	\N	\N	\N	vtt	805
8051113	Xã Bình Long	80511	0	\N	\N	\N	\N	\N	bl	805
8051115	Xã Thạnh Mỹ Tây	80511	0	\N	\N	\N	\N	\N	tmt	805
8051117	Xã Bình Mỹ	80511	0	\N	\N	\N	\N	\N	bm	805
8051119	Xã Bình Thủy	80511	0	\N	\N	\N	\N	\N	bt	805
8051121	Xã Đào Hữu Cảnh	80511	0	\N	\N	\N	\N	\N	dhc	805
8051123	Xã Bình Phú	80511	0	\N	\N	\N	\N	\N	bp	805
8051125	Xã Bình Chánh	80511	0	\N	\N	\N	\N	\N	bc	805
8051300	Không xác định	80513	0	\N	\N	\N	\N	\N	kx	805
8051301	Thị trấn Nhà Bàng	80513	0	\N	\N	\N	\N	\N	nb	805
8051303	Thị trấn Chi Lăng	80513	0	\N	\N	\N	\N	\N	cl	805
8051305	Xã Nhơn Hưng	80513	0	\N	\N	\N	\N	\N	nh	805
8051307	Xã An Phú	80513	0	\N	\N	\N	\N	\N	ap	805
8051309	Xã Thới Sơn	80513	0	\N	\N	\N	\N	\N	ts	805
8051311	Xã Xuân Tô	80513	0	\N	\N	\N	\N	\N	xt	805
8051313	Xã Văn Giáo	80513	0	\N	\N	\N	\N	\N	vg	805
8051315	Xã An Cư	80513	0	\N	\N	\N	\N	\N	ac	805
8051317	Xã An Nông	80513	0	\N	\N	\N	\N	\N	an	805
8051319	Xã Vĩnh Trung	80513	0	\N	\N	\N	\N	\N	vt	805
8051321	Xã Tân Lợi	80513	0	\N	\N	\N	\N	\N	tl	805
8051323	Xã An Hảo	80513	0	\N	\N	\N	\N	\N	ah	805
8051325	Xã Tân Lập	80513	0	\N	\N	\N	\N	\N	tl	805
8051500	Không xác định	80515	0	\N	\N	\N	\N	\N	kx	805
8051501	Thị trấn Tri Tôn	80515	0	\N	\N	\N	\N	\N	tt	805
8051503	Xã Lạc Quới	80515	0	\N	\N	\N	\N	\N	lq	805
8051505	Xã Lê Trì	80515	0	\N	\N	\N	\N	\N	lt	805
8051507	Xã Vĩnh Gia	80515	0	\N	\N	\N	\N	\N	vg	805
8051509	Xã Ba Chúc	80515	0	\N	\N	\N	\N	\N	bc	805
8051511	Xã Châu Lăng	80515	0	\N	\N	\N	\N	\N	cl	805
8051513	Xã Lương Phi	80515	0	\N	\N	\N	\N	\N	lp	805
8051515	Xã Lương An Trà	80515	0	\N	\N	\N	\N	\N	lat	805
8051517	Xã Tà Đảnh	80515	0	\N	\N	\N	\N	\N	td	805
8051519	Xã Núi Tô	80515	0	\N	\N	\N	\N	\N	nt	805
8051521	Xã An Tức	80515	0	\N	\N	\N	\N	\N	at	805
8051523	Xã Cô Tô	80515	0	\N	\N	\N	\N	\N	ct	805
8051525	Xã Tân Tuyến	80515	0	\N	\N	\N	\N	\N	tt	805
8051527	Xã Ô Lâm	80515	0	\N	\N	\N	\N	\N	ol	805
8051700	Không xác định	80517	0	\N	\N	\N	\N	\N	kx	805
8051701	Thị trấn Chợ Mới	80517	0	\N	\N	\N	\N	\N	cm	805
8051703	Xã Kiến An	80517	0	\N	\N	\N	\N	\N	ka	805
8051705	Xã Mỹ Hội Đông	80517	0	\N	\N	\N	\N	\N	mhd	805
8051707	Xã Long Điền A	80517	0	\N	\N	\N	\N	\N	lda	805
8051709	Xã Tấn Mỹ	80517	0	\N	\N	\N	\N	\N	tm	805
8090121	Xã Tân Hội	80901	0	\N	\N	\N	\N	\N	th	809
8051711	Xã Long Điền B	80517	0	\N	\N	\N	\N	\N	ldb	805
8051713	Xã Kiến Thành	80517	0	\N	\N	\N	\N	\N	kt	805
8051715	Xã Mỹ Hiệp	80517	0	\N	\N	\N	\N	\N	mh	805
8051717	Xã Mỹ Luông	80517	0	\N	\N	\N	\N	\N	ml	805
8051719	Xã Nhơn Mỹ	80517	0	\N	\N	\N	\N	\N	nm	805
8051721	Xã Long Giang	80517	0	\N	\N	\N	\N	\N	lg	805
8051723	Xã Long Kiến	80517	0	\N	\N	\N	\N	\N	lk	805
8051725	Xã Bình Phước Xuân	80517	0	\N	\N	\N	\N	\N	bpx	805
8051727	Xã An Thạnh Trung	80517	0	\N	\N	\N	\N	\N	att	805
8051729	Xã Hội An	80517	0	\N	\N	\N	\N	\N	ha	805
8051731	Xã Hòa Bình	80517	0	\N	\N	\N	\N	\N	hb	805
8051733	Xã Hòa An	80517	0	\N	\N	\N	\N	\N	ha	805
8051900	Không xác định	80519	0	\N	\N	\N	\N	\N	kx	805
8051901	Thị trấn An Châu	80519	0	\N	\N	\N	\N	\N	ac	805
8051903	Xã An Hòa	80519	0	\N	\N	\N	\N	\N	ah	805
8051905	Xã Cần Đăng	80519	0	\N	\N	\N	\N	\N	cd	805
8051907	Xã Vĩnh Hanh	80519	0	\N	\N	\N	\N	\N	vh	805
8051909	Xã Bình Thạnh	80519	0	\N	\N	\N	\N	\N	bt	805
8051911	Xã Vĩnh Bình	80519	0	\N	\N	\N	\N	\N	vb	805
8051913	Xã Bình Hòa	80519	0	\N	\N	\N	\N	\N	bh	805
8051915	Xã Vĩnh An	80519	0	\N	\N	\N	\N	\N	va	805
8051917	Xã Hòa Bình Thạnh	80519	0	\N	\N	\N	\N	\N	hbt	805
8051919	Xã Vĩnh Lợi	80519	0	\N	\N	\N	\N	\N	vl	805
8051921	Xã Vĩnh Nhuận	80519	0	\N	\N	\N	\N	\N	vn	805
8051923	Xã Tân Phú	80519	0	\N	\N	\N	\N	\N	tp	805
8051925	Xã Vĩnh Thành	80519	0	\N	\N	\N	\N	\N	vt	805
8052100	Không xác định	80521	0	\N	\N	\N	\N	\N	kx	805
8052101	Thị trấn Núi Sập	80521	0	\N	\N	\N	\N	\N	ns	805
8052103	Xã Tây Phú	80521	0	\N	\N	\N	\N	\N	tp	805
8052105	Xã Vĩnh Phú	80521	0	\N	\N	\N	\N	\N	vp	805
8052107	Xã Vĩnh Trạch	80521	0	\N	\N	\N	\N	\N	vt	805
8052109	Xã Phú Hòa	80521	0	\N	\N	\N	\N	\N	ph	805
8052111	Xã Vĩnh Chánh	80521	0	\N	\N	\N	\N	\N	vc	805
8052113	Xã Định Mỹ	80521	0	\N	\N	\N	\N	\N	dm	805
8052115	Xã Định Thành	80521	0	\N	\N	\N	\N	\N	dt	805
8052117	Xã Mỹ Phú Đông	80521	0	\N	\N	\N	\N	\N	mpd	805
8052119	Xã Vọng Đông	80521	0	\N	\N	\N	\N	\N	vd	805
8052121	Xã Vĩnh Khánh	80521	0	\N	\N	\N	\N	\N	vk	805
8052123	Xã Thoại Giang	80521	0	\N	\N	\N	\N	\N	tg	805
8052125	Xã Vọng Thê	80521	0	\N	\N	\N	\N	\N	vt	805
8070000	Không xác định	80700	0	\N	\N	\N	\N	\N	kx	807
8070100	Không xác định	80701	0	\N	\N	\N	\N	\N	kx	807
8070101	Phường 5	80701	0	\N	\N	\N	\N	\N	5	807
8070103	Phường 4	80701	0	\N	\N	\N	\N	\N	4	807
8070105	Phường 7	80701	0	\N	\N	\N	\N	\N	7	807
8070107	Phường 3	80701	0	\N	\N	\N	\N	\N	3	807
8070109	Phường 1	80701	0	\N	\N	\N	\N	\N	1	807
8070111	Phường 2	80701	0	\N	\N	\N	\N	\N	2	807
8070113	Phường 8	80701	0	\N	\N	\N	\N	\N	8	807
8070115	Phường 6	80701	0	\N	\N	\N	\N	\N	6	807
8070117	Xã Đạo Thạnh	80701	0	\N	\N	\N	\N	\N	dt	807
8070119	Xã Trung An	80701	0	\N	\N	\N	\N	\N	ta	807
8070121	Xã Mỹ Phong	80701	0	\N	\N	\N	\N	\N	mp	807
8070123	Xã Tân Mỹ Chánh	80701	0	\N	\N	\N	\N	\N	tmc	807
8070125	Xã Tân Long	80701	0	\N	\N	\N	\N	\N	tl	807
8070300	Không xác định	80703	0	\N	\N	\N	\N	\N	kx	807
8070301	Phường 3	80703	0	\N	\N	\N	\N	\N	3	807
8070303	Phường 2	80703	0	\N	\N	\N	\N	\N	2	807
8070305	Phường 4	80703	0	\N	\N	\N	\N	\N	4	807
8070307	Phường 1	80703	0	\N	\N	\N	\N	\N	1	807
8070309	Xã Long Hưng	80703	0	\N	\N	\N	\N	\N	lh	807
8070311	Xã Long Thuận	80703	0	\N	\N	\N	\N	\N	lt	807
8070313	Xã Long Chánh	80703	0	\N	\N	\N	\N	\N	lc	807
8070315	Xã Long Hòa	80703	0	\N	\N	\N	\N	\N	lh	807
8070500	Không xác định	80705	0	\N	\N	\N	\N	\N	kx	807
8070501	Thị trấn Mỹ Phước	80705	0	\N	\N	\N	\N	\N	mp	807
8070503	Xã Tân Hòa Đông	80705	0	\N	\N	\N	\N	\N	thd	807
8070505	Xã Thạnh Tân	80705	0	\N	\N	\N	\N	\N	tt	807
8070507	Xã Thạnh Mỹ	80705	0	\N	\N	\N	\N	\N	tm	807
8070509	Xã Thạnh Hoà	80705	0	\N	\N	\N	\N	\N	th	807
8070511	Xã Phú Mỹ	80705	0	\N	\N	\N	\N	\N	pm	807
8070513	Xã Tân Hòa  Thành	80705	0	\N	\N	\N	\N	\N	tht	807
8070515	Xã Hưng Thạnh	80705	0	\N	\N	\N	\N	\N	ht	807
8070517	Xã Tân Lập 1	80705	0	\N	\N	\N	\N	\N	tl1	807
8070519	Xã Tân Hòa Tây	80705	0	\N	\N	\N	\N	\N	tht	807
8070521	Xã Mỹ Phước	80705	0	\N	\N	\N	\N	\N	mp	807
8070523	Xã Tân Lập 2	80705	0	\N	\N	\N	\N	\N	tl2	807
8070525	Xã Phước Lập	80705	0	\N	\N	\N	\N	\N	pl	807
8070700	Không xác định	80707	0	\N	\N	\N	\N	\N	kx	807
8070701	Thị trấn Tân Hiệp	80707	0	\N	\N	\N	\N	\N	th	807
8070703	Xã Tân Hội Đông	80707	0	\N	\N	\N	\N	\N	thd	807
8070705	Xã Tân Hương	80707	0	\N	\N	\N	\N	\N	th	807
8070707	Xã Tân Lý Đông	80707	0	\N	\N	\N	\N	\N	tld	807
8070709	Xã Tân Lý Tây	80707	0	\N	\N	\N	\N	\N	tlt	807
8070711	Xã Thân Cửu Nghĩa	80707	0	\N	\N	\N	\N	\N	tcn	807
8070713	Xã Tam Hiệp	80707	0	\N	\N	\N	\N	\N	th	807
8070715	Xã Điềm Hy	80707	0	\N	\N	\N	\N	\N	dh	807
8070717	Xã Nhị Bình	80707	0	\N	\N	\N	\N	\N	nb	807
8070719	Xã Dưỡng Điềm	80707	0	\N	\N	\N	\N	\N	dd	807
8070721	Xã Đông Hòa	80707	0	\N	\N	\N	\N	\N	dh	807
8070723	Xã Long Định	80707	0	\N	\N	\N	\N	\N	ld	807
8070725	Xã Hữu Đạo	80707	0	\N	\N	\N	\N	\N	hd	807
8070727	Xã Long An	80707	0	\N	\N	\N	\N	\N	la	807
8070729	Xã Long Hưng	80707	0	\N	\N	\N	\N	\N	lh	807
8070731	Xã Bình Trưng	80707	0	\N	\N	\N	\N	\N	bt	807
8070733	Xã Phước Thạnh	80707	0	\N	\N	\N	\N	\N	pt	807
8070735	Xã Thạnh Phú	80707	0	\N	\N	\N	\N	\N	tp	807
8070737	Xã Bàn Long	80707	0	\N	\N	\N	\N	\N	bl	807
8070739	Xã Vĩnh Kim	80707	0	\N	\N	\N	\N	\N	vk	807
8070741	Xã Bình Đức	80707	0	\N	\N	\N	\N	\N	bd	807
8070743	Xã Song Thuận	80707	0	\N	\N	\N	\N	\N	st	807
8070745	Xã Kim Sơn	80707	0	\N	\N	\N	\N	\N	ks	807
8070747	Xã Phú Phong	80707	0	\N	\N	\N	\N	\N	pp	807
8070749	Xã Thới Sơn	80707	0	\N	\N	\N	\N	\N	ts	807
8070900	Không xác định	80709	0	\N	\N	\N	\N	\N	kx	807
8070901	Thị trấn Cai Lậy	80709	0	\N	\N	\N	\N	\N	cl	807
8070903	Xã Thạnh Lộc	80709	0	\N	\N	\N	\N	\N	tl	807
8070905	Xã Mỹ Thành Bắc	80709	0	\N	\N	\N	\N	\N	mtb	807
8070907	Xã Phú Cường	80709	0	\N	\N	\N	\N	\N	pc	807
8070909	Xã Mỹ Phước Tây	80709	0	\N	\N	\N	\N	\N	mpt	807
8070911	Xã Mỹ Hạnh Đông	80709	0	\N	\N	\N	\N	\N	mhd	807
8070913	Xã Mỹ Hạnh Trung	80709	0	\N	\N	\N	\N	\N	mht	807
8070915	Xã Mỹ Thành Nam	80709	0	\N	\N	\N	\N	\N	mtn	807
8070917	Xã Tân Phú	80709	0	\N	\N	\N	\N	\N	tp	807
8070919	Xã Tân Bình	80709	0	\N	\N	\N	\N	\N	tb	807
8070921	Xã Phú Nhuận	80709	0	\N	\N	\N	\N	\N	pn	807
8070923	Xã Tân Hội	80709	0	\N	\N	\N	\N	\N	th	807
8070925	Xã Bình Phú	80709	0	\N	\N	\N	\N	\N	bp	807
8070927	Xã Nhị Mỹ	80709	0	\N	\N	\N	\N	\N	nm	807
8070929	Xã Nhị Quý	80709	0	\N	\N	\N	\N	\N	nq	807
8070931	Xã Thanh Hòa	80709	0	\N	\N	\N	\N	\N	th	807
8070933	Xã Phú Quý	80709	0	\N	\N	\N	\N	\N	pq	807
8070935	Xã Long Khánh	80709	0	\N	\N	\N	\N	\N	lk	807
8070937	Xã Cẩm Sơn	80709	0	\N	\N	\N	\N	\N	cs	807
8070939	Xã Phú An	80709	0	\N	\N	\N	\N	\N	pa	807
8070941	Xã Mỹ Long	80709	0	\N	\N	\N	\N	\N	ml	807
8070943	Xã Long Tiên	80709	0	\N	\N	\N	\N	\N	lt	807
8070945	Xã Hiệp Đức	80709	0	\N	\N	\N	\N	\N	hd	807
8070947	Xã Long Trung	80709	0	\N	\N	\N	\N	\N	lt	807
8070949	Xã Hội Xuân	80709	0	\N	\N	\N	\N	\N	hx	807
8070951	Xã Tân Phong	80709	0	\N	\N	\N	\N	\N	tp	807
8070953	Xã Tam Bình	80709	0	\N	\N	\N	\N	\N	tb	807
8070955	Xã Ngũ Hiệp	80709	0	\N	\N	\N	\N	\N	nh	807
8071100	Không xác định	80711	0	\N	\N	\N	\N	\N	kx	807
8071101	Thị trấn Chợ Gạo	80711	0	\N	\N	\N	\N	\N	cg	807
8071103	Xã Trung Hòa	80711	0	\N	\N	\N	\N	\N	th	807
8071105	Xã Hòa Tịnh	80711	0	\N	\N	\N	\N	\N	ht	807
8071107	Xã Mỹ Tịnh An	80711	0	\N	\N	\N	\N	\N	mta	807
8071109	Xã Tân Bình Thạnh	80711	0	\N	\N	\N	\N	\N	tbt	807
8071111	Xã Phú Kiết	80711	0	\N	\N	\N	\N	\N	pk	807
8071113	Xã Lương Hòa Lạc	80711	0	\N	\N	\N	\N	\N	lhl	807
8071115	Xã Thanh Bình	80711	0	\N	\N	\N	\N	\N	tb	807
8071117	Xã Quơn Long	80711	0	\N	\N	\N	\N	\N	ql	807
8071119	Xã Bình Phục Nhứt	80711	0	\N	\N	\N	\N	\N	bpn	807
8071121	Xã Đăng Hưng Phước	80711	0	\N	\N	\N	\N	\N	dhp	807
8071123	Xã Tân Thuận Bình	80711	0	\N	\N	\N	\N	\N	ttb	807
8071125	Xã Song Bình	80711	0	\N	\N	\N	\N	\N	sb	807
8071127	Xã Bình Phan	80711	0	\N	\N	\N	\N	\N	bp	807
8071129	Xã Long Bình Điền	80711	0	\N	\N	\N	\N	\N	lbd	807
8071131	Xã An Thạnh Thủy	80711	0	\N	\N	\N	\N	\N	att	807
8071133	Xã Xuân Đông	80711	0	\N	\N	\N	\N	\N	xd	807
8071135	Xã Hòa Định	80711	0	\N	\N	\N	\N	\N	hd	807
8071137	Xã Bình Ninh	80711	0	\N	\N	\N	\N	\N	bn	807
8071300	Không xác định	80713	0	\N	\N	\N	\N	\N	kx	807
8071301	Thị trấn Cái Bè	80713	0	\N	\N	\N	\N	\N	cb	807
8071303	Xã Hậu Mỹ Bắc B	80713	0	\N	\N	\N	\N	\N	hmbb	807
8071305	Xã Hậu Mỹ Bắc A	80713	0	\N	\N	\N	\N	\N	hmba	807
8071307	Xã Mỹ Trung	80713	0	\N	\N	\N	\N	\N	mt	807
8071309	Xã Hậu Mỹ Trinh	80713	0	\N	\N	\N	\N	\N	hmt	807
8071311	Xã Hậu Mỹ Phú	80713	0	\N	\N	\N	\N	\N	hmp	807
8071313	Xã Mỹ Tân	80713	0	\N	\N	\N	\N	\N	mt	807
8071315	Xã Mỹ Lợi B	80713	0	\N	\N	\N	\N	\N	mlb	807
8071317	Xã Thiện Trung	80713	0	\N	\N	\N	\N	\N	tt	807
8071319	Xã Hội Cư	80713	0	\N	\N	\N	\N	\N	hc	807
8071321	Xã Hậu Thành	80713	0	\N	\N	\N	\N	\N	ht	807
8071323	Xã Mỹ Lợi A	80713	0	\N	\N	\N	\N	\N	mla	807
8071325	Xã Hòa Khánh	80713	0	\N	\N	\N	\N	\N	hk	807
8071327	Xã Thiện Trí	80713	0	\N	\N	\N	\N	\N	tt	807
8071329	Xã Mỹ Đức Đông	80713	0	\N	\N	\N	\N	\N	mdd	807
8071331	Xã Mỹ Đức Tây	80713	0	\N	\N	\N	\N	\N	mdt	807
8071333	Xã Đông Hòa Hiệp	80713	0	\N	\N	\N	\N	\N	dhh	807
8071335	Xã An Thái Đông	80713	0	\N	\N	\N	\N	\N	atd	807
8071337	Xã Tân Hưng	80713	0	\N	\N	\N	\N	\N	th	807
8071339	Xã Mỹ Lương	80713	0	\N	\N	\N	\N	\N	ml	807
8071341	Xã Tân Thanh	80713	0	\N	\N	\N	\N	\N	tt	807
8071343	Xã An Thái Trung	80713	0	\N	\N	\N	\N	\N	att	807
8071345	Xã An Hữu	80713	0	\N	\N	\N	\N	\N	ah	807
8071347	Xã Hòa Hưng	80713	0	\N	\N	\N	\N	\N	hh	807
8071500	Không xác định	80715	0	\N	\N	\N	\N	\N	kx	807
8071501	Thị trấn Vĩnh Bình	80715	0	\N	\N	\N	\N	\N	vb	807
8071503	Xã Đồng Sơn	80715	0	\N	\N	\N	\N	\N	ds	807
8071505	Xã Bình Phú	80715	0	\N	\N	\N	\N	\N	bp	807
8071507	Xã Đồng Thạnh	80715	0	\N	\N	\N	\N	\N	dt	807
8071509	Xã Thành Công	80715	0	\N	\N	\N	\N	\N	tc	807
8071511	Xã Bình Nhì	80715	0	\N	\N	\N	\N	\N	bn	807
8071513	Xã Yên Luông	80715	0	\N	\N	\N	\N	\N	yl	807
8071515	Xã Thạnh Trị	80715	0	\N	\N	\N	\N	\N	tt	807
8071517	Xã Thạnh Nhựt	80715	0	\N	\N	\N	\N	\N	tn	807
8071519	Xã Long Vĩnh	80715	0	\N	\N	\N	\N	\N	lv	807
8071521	Xã Bình Tân	80715	0	\N	\N	\N	\N	\N	bt	807
8071523	Xã Vĩnh Hựu	80715	0	\N	\N	\N	\N	\N	vh	807
8071525	Xã Long Bình	80715	0	\N	\N	\N	\N	\N	lb	807
8071527	Xã Tân Thới	80715	0	\N	\N	\N	\N	\N	tt	807
8071529	Xã Tân Phú	80715	0	\N	\N	\N	\N	\N	tp	807
8071531	Xã Phú Thạnh	80715	0	\N	\N	\N	\N	\N	pt	807
8071700	Không xác định	80717	0	\N	\N	\N	\N	\N	kx	807
8071701	Thị trấn Tân Hòa	80717	0	\N	\N	\N	\N	\N	th	807
8071703	Xã Bình Đông	80717	0	\N	\N	\N	\N	\N	bd	807
8071705	Xã Tân Phước	80717	0	\N	\N	\N	\N	\N	tp	807
8071707	Xã Gia Thuận	80717	0	\N	\N	\N	\N	\N	gt	807
8071709	Xã Bình Xuân	80717	0	\N	\N	\N	\N	\N	bx	807
8071711	Xã Vàm Láng	80717	0	\N	\N	\N	\N	\N	vl	807
8071713	Xã Tân Tây	80717	0	\N	\N	\N	\N	\N	tt	807
8071715	Xã Kiểng Phước	80717	0	\N	\N	\N	\N	\N	kp	807
8071717	Xã Tân Trung	80717	0	\N	\N	\N	\N	\N	tt	807
8071719	Xã Tân Đông	80717	0	\N	\N	\N	\N	\N	td	807
8071721	Xã Bình Ân	80717	0	\N	\N	\N	\N	\N	ba	807
8071723	Xã Tân Điền	80717	0	\N	\N	\N	\N	\N	td	807
8071725	Xã Bình Nghị	80717	0	\N	\N	\N	\N	\N	bn	807
8071727	Xã Phước Trung	80717	0	\N	\N	\N	\N	\N	pt	807
8071729	Xã Tân Thành	80717	0	\N	\N	\N	\N	\N	tt	807
8071731	Xã Phú Đông	80717	0	\N	\N	\N	\N	\N	pd	807
8071733	Xã Phú Tân	80717	0	\N	\N	\N	\N	\N	pt	807
8090000	Không xác định	80900	0	\N	\N	\N	\N	\N	kx	809
8090100	Không xác định	80901	0	\N	\N	\N	\N	\N	kx	809
8090107	Phường 4	80901	0	\N	\N	\N	\N	\N	4	809
8090109	Phường 5	80901	0	\N	\N	\N	\N	\N	5	809
8090111	Phường 8	80901	0	\N	\N	\N	\N	\N	8	809
8090113	Phường 9	80901	0	\N	\N	\N	\N	\N	9	809
8090115	Xã Trường An	80901	0	\N	\N	\N	\N	\N	ta	809
8090117	Xã Tân Ngãi	80901	0	\N	\N	\N	\N	\N	tn	809
8090119	Xã Tân Hòa	80901	0	\N	\N	\N	\N	\N	th	809
8090300	Không xác định	80903	0	\N	\N	\N	\N	\N	kx	809
8090301	Thị trấn Long Hồ	80903	0	\N	\N	\N	\N	\N	lh	809
8090303	Xã Đồng Phú	80903	0	\N	\N	\N	\N	\N	dp	809
8090305	Xã Hòa Ninh	80903	0	\N	\N	\N	\N	\N	hn	809
8090307	Xã Bình Hòa Phước	80903	0	\N	\N	\N	\N	\N	bhp	809
8090309	Xã An Bình	80903	0	\N	\N	\N	\N	\N	ab	809
8090311	Xã Thanh Đức	80903	0	\N	\N	\N	\N	\N	td	809
8090313	Xã Tân Hạnh	80903	0	\N	\N	\N	\N	\N	th	809
8090315	Xã Long Phước	80903	0	\N	\N	\N	\N	\N	lp	809
8090317	Xã Phước Hậu	80903	0	\N	\N	\N	\N	\N	ph	809
8090319	Xã Lộc Hòa	80903	0	\N	\N	\N	\N	\N	lh	809
8090321	Xã Phú Đức	80903	0	\N	\N	\N	\N	\N	pd	809
8090323	Xã Thạnh Quới	80903	0	\N	\N	\N	\N	\N	tq	809
8090325	Xã Phú Quới	80903	0	\N	\N	\N	\N	\N	pq	809
8090327	Xã Hòa Phú	80903	0	\N	\N	\N	\N	\N	hp	809
8090329	Xã Long An	80903	0	\N	\N	\N	\N	\N	la	809
8090500	Không xác định	80905	0	\N	\N	\N	\N	\N	kx	809
8090501	Thị trấn Cái Nhum	80905	0	\N	\N	\N	\N	\N	cn	809
8090503	Xã Mỹ An	80905	0	\N	\N	\N	\N	\N	ma	809
8090505	Xã Long Mỹ	80905	0	\N	\N	\N	\N	\N	lm	809
8090507	Xã Hòa Tịnh	80905	0	\N	\N	\N	\N	\N	ht	809
8090509	Xã Bình Phước	80905	0	\N	\N	\N	\N	\N	bp	809
8090511	Xã Nhơn Phú	80905	0	\N	\N	\N	\N	\N	np	809
8090513	Xã Mỹ Phước	80905	0	\N	\N	\N	\N	\N	mp	809
8090515	Xã Chánh Hội	80905	0	\N	\N	\N	\N	\N	ch	809
8090517	Xã An Phước	80905	0	\N	\N	\N	\N	\N	ap	809
8090519	Xã Chánh An	80905	0	\N	\N	\N	\N	\N	ca	809
8090521	Xã Tân Long	80905	0	\N	\N	\N	\N	\N	tl	809
8090523	Xã Tân An Hội	80905	0	\N	\N	\N	\N	\N	tah	809
8090525	Xã Tân Long Hội	80905	0	\N	\N	\N	\N	\N	tlh	809
8090700	Không xác định	80907	0	\N	\N	\N	\N	\N	kx	809
8090701	Thị trấn Cái Vồn	80907	0	\N	\N	\N	\N	\N	cv	809
8090703	Xã Nguyễn Văn Thảnh	80907	0	\N	\N	\N	\N	\N	nvt	809
8090705	Xã Tân Thành	80907	0	\N	\N	\N	\N	\N	tt	809
8090707	Xã Thành Trung	80907	0	\N	\N	\N	\N	\N	tt	809
8090709	Xã Tân Hưng	80907	0	\N	\N	\N	\N	\N	th	809
8090711	Xã Mỹ Thuận	80907	0	\N	\N	\N	\N	\N	mt	809
8090713	Xã Thuận An	80907	0	\N	\N	\N	\N	\N	ta	809
8090715	Xã Đông Thạnh	80907	0	\N	\N	\N	\N	\N	dt	809
8090717	Xã Thành Đông	80907	0	\N	\N	\N	\N	\N	td	809
8090719	Xã Đông Bình	80907	0	\N	\N	\N	\N	\N	db	809
8090721	Xã Tân Lược	80907	0	\N	\N	\N	\N	\N	tl	809
8090723	Xã Tân An Thạnh	80907	0	\N	\N	\N	\N	\N	tat	809
8090725	Xã Thành Lợi	80907	0	\N	\N	\N	\N	\N	tl	809
8090727	Xã Tân Quới	80907	0	\N	\N	\N	\N	\N	tq	809
8090729	Xã Tân Bình	80907	0	\N	\N	\N	\N	\N	tb	809
8090731	Xã Đông Thành	80907	0	\N	\N	\N	\N	\N	dt	809
8090733	Xã Mỹ Hòa	80907	0	\N	\N	\N	\N	\N	mh	809
8090900	Không xác định	80909	0	\N	\N	\N	\N	\N	kx	809
8090901	Thị trấn Tam Bình	80909	0	\N	\N	\N	\N	\N	tb	809
8090903	Xã Hòa Thạnh	80909	0	\N	\N	\N	\N	\N	ht	809
8090905	Xã Tân Lộc	80909	0	\N	\N	\N	\N	\N	tl	809
8090907	Xã Hòa Hiệp	80909	0	\N	\N	\N	\N	\N	hh	809
8090909	Xã Hậu Lộc	80909	0	\N	\N	\N	\N	\N	hl	809
8090911	Xã Hoà Lộc	80909	0	\N	\N	\N	\N	\N	hl	809
8090913	Xã Phú Lộc	80909	0	\N	\N	\N	\N	\N	pl	809
8090915	Xã Mỹ Lộc	80909	0	\N	\N	\N	\N	\N	ml	809
8090917	Xã Phú Thịnh	80909	0	\N	\N	\N	\N	\N	pt	809
8090919	Xã Song Phú	80909	0	\N	\N	\N	\N	\N	sp	809
8090921	Xã Mỹ Thạnh Trung	80909	0	\N	\N	\N	\N	\N	mtt	809
8090923	Xã Tường Lộc	80909	0	\N	\N	\N	\N	\N	tl	809
8090925	Xã Tân Phú	80909	0	\N	\N	\N	\N	\N	tp	809
8090927	Xã Long Phú	80909	0	\N	\N	\N	\N	\N	lp	809
8090929	Xã Long Mỹ	80909	0	\N	\N	\N	\N	\N	lm	809
8090931	Xã Ngãi Tứ	80909	0	\N	\N	\N	\N	\N	nt	809
8090933	Xã Bình Ninh	80909	0	\N	\N	\N	\N	\N	bn	809
8091100	Không xác định	80911	0	\N	\N	\N	\N	\N	kx	809
8091101	Thị trấn Trà Ôn	80911	0	\N	\N	\N	\N	\N	to	809
8091103	Xã Xuân Hiệp	80911	0	\N	\N	\N	\N	\N	xh	809
8091105	Xã Hòa Bình	80911	0	\N	\N	\N	\N	\N	hb	809
8091107	Xã Nhơn Bình	80911	0	\N	\N	\N	\N	\N	nb	809
8091109	Xã Thới Hòa	80911	0	\N	\N	\N	\N	\N	th	809
8091111	Xã Hựu Thành	80911	0	\N	\N	\N	\N	\N	ht	809
8091113	Xã Thuận Thới	80911	0	\N	\N	\N	\N	\N	tt	809
8091115	Xã Trà Côn	80911	0	\N	\N	\N	\N	\N	tc	809
8091117	Xã Vĩnh Xuân	80911	0	\N	\N	\N	\N	\N	vx	809
8091119	Xã Thiện Mỹ	80911	0	\N	\N	\N	\N	\N	tm	809
8091121	Xã Tân Mỹ	80911	0	\N	\N	\N	\N	\N	tm	809
8091123	Xã Tích Thiện	80911	0	\N	\N	\N	\N	\N	tt	809
8091125	Xã Lục Sỹ Thành	80911	0	\N	\N	\N	\N	\N	lst	809
8091127	Xã Phú Thành	80911	0	\N	\N	\N	\N	\N	pt	809
8091300	Không xác định	80913	0	\N	\N	\N	\N	\N	kx	809
8091301	Thị trấn Vũng Liêm	80913	0	\N	\N	\N	\N	\N	vl	809
8091303	Xã Tân Quới Trung	80913	0	\N	\N	\N	\N	\N	tqt	809
8091305	Xã Quới An	80913	0	\N	\N	\N	\N	\N	qa	809
8091307	Xã Quới Thiện	80913	0	\N	\N	\N	\N	\N	qt	809
8091309	Xã Trung Chánh	80913	0	\N	\N	\N	\N	\N	tc	809
8091311	Xã Trung Hiệp	80913	0	\N	\N	\N	\N	\N	th	809
8091313	Xã Thanh Bình	80913	0	\N	\N	\N	\N	\N	tb	809
8091315	Xã Trung Thành Tây	80913	0	\N	\N	\N	\N	\N	ttt	809
8091317	Xã Tân An Luông	80913	0	\N	\N	\N	\N	\N	tal	809
8091319	Xã Hiếu Phụng	80913	0	\N	\N	\N	\N	\N	hp	809
8091321	Xã Trung Thành Đông	80913	0	\N	\N	\N	\N	\N	ttd	809
8091323	Xã Trung Hiếu	80913	0	\N	\N	\N	\N	\N	th	809
8091325	Xã Trung Thành	80913	0	\N	\N	\N	\N	\N	tt	809
8091327	Xã Trung Ngãi	80913	0	\N	\N	\N	\N	\N	tn	809
8091329	Xã Trung Nghĩa	80913	0	\N	\N	\N	\N	\N	tn	809
8091331	Xã Hiếu Thuận	80913	0	\N	\N	\N	\N	\N	ht	809
8091333	Xã Hiếu Nhơn	80913	0	\N	\N	\N	\N	\N	hn	809
8091335	Xã Trung An	80913	0	\N	\N	\N	\N	\N	ta	809
8091337	Xã Hiếu Thành	80913	0	\N	\N	\N	\N	\N	ht	809
8091339	Xã Hiếu Nghĩa	80913	0	\N	\N	\N	\N	\N	hn	809
8110000	Không xác định	81100	0	\N	\N	\N	\N	\N	kx	811
8110100	Không xác định	81101	0	\N	\N	\N	\N	\N	kx	811
8110101	Phường 1	81101	0	\N	\N	\N	\N	\N	1	811
8110103	Phường 2	81101	0	\N	\N	\N	\N	\N	2	811
8110105	Phường 3	81101	0	\N	\N	\N	\N	\N	3	811
8110107	Phường 4	81101	0	\N	\N	\N	\N	\N	4	811
8110109	Phường 5	81101	0	\N	\N	\N	\N	\N	5	811
8110111	Phường 6	81101	0	\N	\N	\N	\N	\N	6	811
8110113	Phường 7	81101	0	\N	\N	\N	\N	\N	7	811
8110115	Phường 8	81101	0	\N	\N	\N	\N	\N	8	811
8110117	Xã Phú Khương	81101	0	\N	\N	\N	\N	\N	pk	811
8110119	Xã Sơn Đông	81101	0	\N	\N	\N	\N	\N	sd	811
8110121	Xã Bình Phú	81101	0	\N	\N	\N	\N	\N	bp	811
8110123	Xã Phú Hưng	81101	0	\N	\N	\N	\N	\N	ph	811
8110125	Xã Nhơn Thạnh	81101	0	\N	\N	\N	\N	\N	nt	811
8110127	Xã Mỹ Thạnh An	81101	0	\N	\N	\N	\N	\N	mta	811
8110129	Xã Phú Nhuận	81101	0	\N	\N	\N	\N	\N	pn	811
8110300	Không xác định	81103	0	\N	\N	\N	\N	\N	kx	811
8110301	Thị trấn Châu Thành	81103	0	\N	\N	\N	\N	\N	ct	811
8110303	Xã Tân Thạch	81103	0	\N	\N	\N	\N	\N	tt	811
8110305	Xã An Khánh	81103	0	\N	\N	\N	\N	\N	ak	811
8110307	Xã Phú Túc	81103	0	\N	\N	\N	\N	\N	pt	811
8110309	Xã Phú Đức	81103	0	\N	\N	\N	\N	\N	pd	811
8110311	Xã Tân Phú	81103	0	\N	\N	\N	\N	\N	tp	811
8110313	Xã Tiên Long	81103	0	\N	\N	\N	\N	\N	tl	811
8110315	Xã Tiên Thủy	81103	0	\N	\N	\N	\N	\N	tt	811
8110317	Xã Quới Thành	81103	0	\N	\N	\N	\N	\N	qt	811
8110319	Xã Thành Triệu	81103	0	\N	\N	\N	\N	\N	tt	811
8110321	Xã Tường Đa	81103	0	\N	\N	\N	\N	\N	td	811
8110323	Xã An Hiệp	81103	0	\N	\N	\N	\N	\N	ah	811
8110325	Xã Sơn Hòa	81103	0	\N	\N	\N	\N	\N	sh	811
8110327	Xã Mỹ Thành	81103	0	\N	\N	\N	\N	\N	mt	811
8110329	Xã Tam Phước	81103	0	\N	\N	\N	\N	\N	tp	811
8110331	Xã Phú An Hòa	81103	0	\N	\N	\N	\N	\N	pah	811
8110333	Xã Hữu Định	81103	0	\N	\N	\N	\N	\N	hd	811
8110335	Xã Phước Thạnh	81103	0	\N	\N	\N	\N	\N	pt	811
8110337	Xã An Phước	81103	0	\N	\N	\N	\N	\N	ap	811
8110339	Xã Qưới Sơn	81103	0	\N	\N	\N	\N	\N	qs	811
8110341	Xã Giao Long	81103	0	\N	\N	\N	\N	\N	gl	811
8110343	Xã Giao Hòa	81103	0	\N	\N	\N	\N	\N	gh	811
8110345	Xã An Hóa	81103	0	\N	\N	\N	\N	\N	ah	811
8110500	Không xác định	81105	0	\N	\N	\N	\N	\N	kx	811
8110501	Thị trấn Chợ Lách	81105	0	\N	\N	\N	\N	\N	cl	811
8110503	Xã Phú Phụng	81105	0	\N	\N	\N	\N	\N	pp	811
8110505	Xã Vĩnh Bình	81105	0	\N	\N	\N	\N	\N	vb	811
8110507	Xã Sơn Định	81105	0	\N	\N	\N	\N	\N	sd	811
8110509	Xã Hòa Nghĩa	81105	0	\N	\N	\N	\N	\N	hn	811
8110511	Xã Tân Thiềng	81105	0	\N	\N	\N	\N	\N	tt	811
8110513	Xã Long Thới	81105	0	\N	\N	\N	\N	\N	lt	811
8110515	Xã Vĩnh Thành	81105	0	\N	\N	\N	\N	\N	vt	811
8110517	Xã Phú Sơn	81105	0	\N	\N	\N	\N	\N	ps	811
8110519	Xã Vĩnh Hòa	81105	0	\N	\N	\N	\N	\N	vh	811
8110521	Xã Hưng Khánh Trung	81105	0	\N	\N	\N	\N	\N	hkt	811
8110700	Không xác định	81107	0	\N	\N	\N	\N	\N	kx	811
8110701	Thị trấn Mỏ Cầy	81107	0	\N	\N	\N	\N	\N	mc	811
8110703	Xã Thanh Tân	81107	0	\N	\N	\N	\N	\N	tt	811
8110705	Xã Thạnh Ngãi	81107	0	\N	\N	\N	\N	\N	tn	811
8110707	Xã Phước Mỹ Trung	81107	0	\N	\N	\N	\N	\N	pmt	811
8110709	Xã Tân Phú Tây	81107	0	\N	\N	\N	\N	\N	tpt	811
8110711	Xã Tân Thành Bình	81107	0	\N	\N	\N	\N	\N	ttb	811
8110713	Xã Thành An	81107	0	\N	\N	\N	\N	\N	ta	811
8110715	Xã Tân Thanh Tây	81107	0	\N	\N	\N	\N	\N	ttt	811
8110717	Xã Nhuận Phú Tân	81107	0	\N	\N	\N	\N	\N	npt	811
8110719	Xã Tân Bình	81107	0	\N	\N	\N	\N	\N	tb	811
8110721	Xã Hòa Lộc	81107	0	\N	\N	\N	\N	\N	hl	811
8110723	Xã Định Thủy	81107	0	\N	\N	\N	\N	\N	dt	811
8110725	Xã Phước Hiệp	81107	0	\N	\N	\N	\N	\N	ph	811
8110727	Xã Bình Khánh Tây	81107	0	\N	\N	\N	\N	\N	bkt	811
8110729	Xã Bình Khánh Đông	81107	0	\N	\N	\N	\N	\N	bkd	811
8110731	Xã Đa Phước Hội	81107	0	\N	\N	\N	\N	\N	dph	811
8110733	Xã Khánh Thạnh Tân	81107	0	\N	\N	\N	\N	\N	ktt	811
8110735	Xã An Thạnh	81107	0	\N	\N	\N	\N	\N	at	811
8110737	Xã Thành Thới B	81107	0	\N	\N	\N	\N	\N	ttb	811
8110739	Xã Thành Thới A	81107	0	\N	\N	\N	\N	\N	tta	811
8110741	Xã An Thới	81107	0	\N	\N	\N	\N	\N	at	811
8110743	Xã An Định	81107	0	\N	\N	\N	\N	\N	ad	811
8110745	Xã Tân Trung	81107	0	\N	\N	\N	\N	\N	tt	811
8110747	Xã Ngãi Đăng	81107	0	\N	\N	\N	\N	\N	nd	811
8110749	Xã Cẩm Sơn	81107	0	\N	\N	\N	\N	\N	cs	811
8110751	Xã Hương Mỹ	81107	0	\N	\N	\N	\N	\N	hm	811
8110753	Xã Minh Đức	81107	0	\N	\N	\N	\N	\N	md	811
8110900	Không xác định	81109	0	\N	\N	\N	\N	\N	kx	811
8110901	Thị trấn Giồng Trôm	81109	0	\N	\N	\N	\N	\N	gt	811
8110903	Xã Phong Nẫm	81109	0	\N	\N	\N	\N	\N	pn	811
8110905	Xã Phong Mỹ	81109	0	\N	\N	\N	\N	\N	pm	811
8110907	Xã Mỹ Thạnh	81109	0	\N	\N	\N	\N	\N	mt	811
8110909	Xã Lương Phú	81109	0	\N	\N	\N	\N	\N	lp	811
8110911	Xã Thuận Điền	81109	0	\N	\N	\N	\N	\N	td	811
8110913	Xã Sơn Phú	81109	0	\N	\N	\N	\N	\N	sp	811
8110915	Xã Phước Long	81109	0	\N	\N	\N	\N	\N	pl	811
8110917	Xã Hưng Phong	81109	0	\N	\N	\N	\N	\N	hp	811
8110919	Xã Long Mỹ	81109	0	\N	\N	\N	\N	\N	lm	811
8110921	Xã Lương Hòa	81109	0	\N	\N	\N	\N	\N	lh	811
8110923	Xã Lương Quới	81109	0	\N	\N	\N	\N	\N	lq	811
8110925	Xã Châu Hòa	81109	0	\N	\N	\N	\N	\N	ch	811
8110927	Xã Châu Bình	81109	0	\N	\N	\N	\N	\N	cb	811
8110929	Xã Bình Hoà	81109	0	\N	\N	\N	\N	\N	bh	811
8110931	Xã Bình Thành	81109	0	\N	\N	\N	\N	\N	bt	811
8110933	Xã Tân Thanh	81109	0	\N	\N	\N	\N	\N	tt	811
8110935	Xã Tân Hào	81109	0	\N	\N	\N	\N	\N	th	811
8110937	Xã Tân Lợi Thạnh	81109	0	\N	\N	\N	\N	\N	tlt	811
8110941	Xã Hưng Lễ	81109	0	\N	\N	\N	\N	\N	hl	811
8110943	Xã Hưng Nhượng	81109	0	\N	\N	\N	\N	\N	hn	811
7011507	Phường 4	70115	0	\N	\N	\N	\N	\N	4	701
7171105	Xã.An Ngãi	71711	0	\N	\N	\N	\N	\N	an	717
8111100	Không xác định	81111	0	\N	\N	\N	\N	\N	kx	811
8111101	Thị trấn Bình Đại	81111	0	\N	\N	\N	\N	\N	bd	811
7012903	Phường 2	70129	0	\N	\N	\N	\N	\N	2	701
8111103	Xã Tam Hiệp	81111	0	\N	\N	\N	\N	\N	th	811
8111105	Xã Long Định	81111	0	\N	\N	\N	\N	\N	ld	811
8111107	Xã Long Hòa	81111	0	\N	\N	\N	\N	\N	lh	811
8111109	Xã Phú Thuận	81111	0	\N	\N	\N	\N	\N	pt	811
8111111	Xã Châu Hưng	81111	0	\N	\N	\N	\N	\N	ch	811
8111117	Xã Thới Lai	81111	0	\N	\N	\N	\N	\N	tl	811
8111119	Xã Phú Vang	81111	0	\N	\N	\N	\N	\N	pv	811
8111121	Xã Lộc Thuận	81111	0	\N	\N	\N	\N	\N	lt	811
8111123	Xã Định Trung	81111	0	\N	\N	\N	\N	\N	dt	811
8111125	Xã Phú Long	81111	0	\N	\N	\N	\N	\N	pl	811
8111127	Xã Bình Thới	81111	0	\N	\N	\N	\N	\N	bt	811
8111129	Xã Thạnh Trị	81111	0	\N	\N	\N	\N	\N	tt	811
8111133	Xã Bình Thắng	81111	0	\N	\N	\N	\N	\N	bt	811
8111135	Xã Thạnh Phước	81111	0	\N	\N	\N	\N	\N	tp	811
8111137	Xã Thừa Đức	81111	0	\N	\N	\N	\N	\N	td	811
8111139	Xã Thới Thuận	81111	0	\N	\N	\N	\N	\N	tt	811
8111300	Không xác định	81113	0	\N	\N	\N	\N	\N	kx	811
8111301	Thị trấn Ba Tri	81113	0	\N	\N	\N	\N	\N	bt	811
8111303	Xã Tân Xuân	81113	0	\N	\N	\N	\N	\N	tx	811
8111305	Xã Mỹ Hòa	81113	0	\N	\N	\N	\N	\N	mh	811
8111307	Xã Mỹ Chánh	81113	0	\N	\N	\N	\N	\N	mc	811
8111309	Xã Mỹ Nhơn	81113	0	\N	\N	\N	\N	\N	mn	811
8111311	Xã Mỹ Thạnh	81113	0	\N	\N	\N	\N	\N	mt	811
8111313	Xã An Phú Trung	81113	0	\N	\N	\N	\N	\N	apt	811
8111315	Xã An Ngãi Trung	81113	0	\N	\N	\N	\N	\N	ant	811
8111317	Xã Tân Hưng	81113	0	\N	\N	\N	\N	\N	th	811
8111319	Xã An Ngãi Tây	81113	0	\N	\N	\N	\N	\N	ant	811
8111321	Xã An Hiệp	81113	0	\N	\N	\N	\N	\N	ah	811
8111323	Xã An Bình Tây	81113	0	\N	\N	\N	\N	\N	abt	811
8111325	Xã Phú Lễ	81113	0	\N	\N	\N	\N	\N	pl	811
8111327	Xã Phú Ngãi	81113	0	\N	\N	\N	\N	\N	pn	811
8111329	Xã Phước Tuy	81113	0	\N	\N	\N	\N	\N	pt	811
8111331	Xã Bảo Thạnh	81113	0	\N	\N	\N	\N	\N	bt	811
8111333	Xã Bảo Thuận	81113	0	\N	\N	\N	\N	\N	bt	811
8111335	Xã Tân Thủy	81113	0	\N	\N	\N	\N	\N	tt	811
8111337	Xã Vĩnh Hòa	81113	0	\N	\N	\N	\N	\N	vh	811
8111339	Xã Vĩnh An	81113	0	\N	\N	\N	\N	\N	va	811
8111341	Xã An Đức	81113	0	\N	\N	\N	\N	\N	ad	811
8111343	Xã An Hòa Tây	81113	0	\N	\N	\N	\N	\N	aht	811
8111345	Xã An Thủy	81113	0	\N	\N	\N	\N	\N	at	811
8111500	Không xác định	81115	0	\N	\N	\N	\N	\N	kx	811
8111501	Thị trấn Thạnh Phú	81115	0	\N	\N	\N	\N	\N	tp	811
8111503	Xã Phú Khánh	81115	0	\N	\N	\N	\N	\N	pk	811
8111505	Xã Đại Điền	81115	0	\N	\N	\N	\N	\N	dd	811
8111507	Xã Tân Phong	81115	0	\N	\N	\N	\N	\N	tp	811
8111509	Xã Thới Thạnh	81115	0	\N	\N	\N	\N	\N	tt	811
8111511	Xã Quới Điền	81115	0	\N	\N	\N	\N	\N	qd	811
8111513	Xã Mỹ Hưng	81115	0	\N	\N	\N	\N	\N	mh	811
8111515	Xã Hòa Lợi	81115	0	\N	\N	\N	\N	\N	hl	811
8111517	Xã Bình Thạnh	81115	0	\N	\N	\N	\N	\N	bt	811
8111519	Xã An Thạnh	81115	0	\N	\N	\N	\N	\N	at	811
8111521	Xã An Thuận	81115	0	\N	\N	\N	\N	\N	at	811
8111523	Xã An Điền	81115	0	\N	\N	\N	\N	\N	ad	811
8111525	Xã An Quy	81115	0	\N	\N	\N	\N	\N	aq	811
8111527	Xã An Nhơn	81115	0	\N	\N	\N	\N	\N	an	811
8111529	Xã Giao Thạnh	81115	0	\N	\N	\N	\N	\N	gt	811
8111531	Xã Thạnh Hải	81115	0	\N	\N	\N	\N	\N	th	811
8111533	Xã Thạnh Phong	81115	0	\N	\N	\N	\N	\N	tp	811
8130000	Không xác định	81300	0	\N	\N	\N	\N	\N	kx	813
8130100	Không xác định	81301	0	\N	\N	\N	\N	\N	kx	813
8130101	Phường Vĩnh Thanh Vân	81301	0	\N	\N	\N	\N	\N	vtv	813
8130103	Phường Vĩnh Thanh	81301	0	\N	\N	\N	\N	\N	vt	813
8130105	Phường Vĩnh Hiệp	81301	0	\N	\N	\N	\N	\N	vh	813
8130107	Phường Vĩnh Lạc	81301	0	\N	\N	\N	\N	\N	vl	813
8130109	Phường An Hòa	81301	0	\N	\N	\N	\N	\N	ah	813
8130111	Phường Rạch Sỏi	81301	0	\N	\N	\N	\N	\N	rs	813
8130113	Phường Vĩnh Thông	81301	0	\N	\N	\N	\N	\N	vt	813
8130115	Xã Phi Thông	81301	0	\N	\N	\N	\N	\N	pt	813
8130300	Không xác định	81303	0	\N	\N	\N	\N	\N	kx	813
8130303	Thị trấn Kiên Lương	81303	0	\N	\N	\N	\N	\N	kl	813
8130305	Xã Vĩnh Điều	81303	0	\N	\N	\N	\N	\N	vd	813
8130307	Xã Tân Khánh Hòa	81303	0	\N	\N	\N	\N	\N	tkh	813
8130309	Xã Phú Mỹ	81303	0	\N	\N	\N	\N	\N	pm	813
8130317	Xã Hòa Điền	81303	0	\N	\N	\N	\N	\N	hd	813
8130319	Xã Dương Hòa	81303	0	\N	\N	\N	\N	\N	dh	813
8130321	Xã Bình An	81303	0	\N	\N	\N	\N	\N	ba	813
8130500	Không xác định	81305	0	\N	\N	\N	\N	\N	kx	813
8130501	Thị trấn Hòn Đất	81305	0	\N	\N	\N	\N	\N	hd	813
8130503	Xã Bình Sơn	81305	0	\N	\N	\N	\N	\N	bs	813
8130505	Xã Bình Giang	81305	0	\N	\N	\N	\N	\N	bg	813
8130507	Xã Nam Thái Sơn	81305	0	\N	\N	\N	\N	\N	nts	813
8130509	Xã Mỹ Hiệp Sơn	81305	0	\N	\N	\N	\N	\N	mhs	813
8130511	Xã Sơn Kiên	81305	0	\N	\N	\N	\N	\N	sk	813
8130513	Xã Sóc Sơn	81305	0	\N	\N	\N	\N	\N	ss	813
8130515	Xã Thổ Sơn	81305	0	\N	\N	\N	\N	\N	ts	813
8130517	Xã Mỹ Lâm	81305	0	\N	\N	\N	\N	\N	ml	813
8130700	Không xác định	81307	0	\N	\N	\N	\N	\N	kx	813
8130701	Thị trấn Tân Hiệp	81307	0	\N	\N	\N	\N	\N	th	813
8130703	Xã Tân Hội	81307	0	\N	\N	\N	\N	\N	th	813
8130705	Xã Tân Hiệp B	81307	0	\N	\N	\N	\N	\N	thb	813
8130707	Xã Thạnh Đông B	81307	0	\N	\N	\N	\N	\N	tdb	813
8130709	Xã Thạnh Đông	81307	0	\N	\N	\N	\N	\N	td	813
8130711	Xã Tân Hiệp A	81307	0	\N	\N	\N	\N	\N	tha	813
8130713	Xã Thạnh Đông A	81307	0	\N	\N	\N	\N	\N	tda	813
8130715	Xã Thạnh Trị	81307	0	\N	\N	\N	\N	\N	tt	813
8130900	Không xác định	81309	0	\N	\N	\N	\N	\N	kx	813
8130901	Thị trấn Minh Lương	81309	0	\N	\N	\N	\N	\N	ml	813
8130903	Xã Mong Thọ A	81309	0	\N	\N	\N	\N	\N	mta	813
8130905	Xã Mong Thọ B	81309	0	\N	\N	\N	\N	\N	mtb	813
8130907	Xã Giục Tượng	81309	0	\N	\N	\N	\N	\N	gt	813
8130909	Xã Vĩnh Hòa Hiệp	81309	0	\N	\N	\N	\N	\N	vhh	813
8130911	Xã Minh Hòa	81309	0	\N	\N	\N	\N	\N	mh	813
8130913	Xã Bình An	81309	0	\N	\N	\N	\N	\N	ba	813
8130915	Xã Thạnh Lộc	81309	0	\N	\N	\N	\N	\N	tl	813
8131100	Không xác định	81311	0	\N	\N	\N	\N	\N	kx	813
8131101	Thị trấn Giồng Giềng	81311	0	\N	\N	\N	\N	\N	gg	813
8131103	Xã Thạnh Hưng	81311	0	\N	\N	\N	\N	\N	th	813
8131105	Xã Thạnh Phước	81311	0	\N	\N	\N	\N	\N	tp	813
8131107	Xã Thạnh Lộc	81311	0	\N	\N	\N	\N	\N	tl	813
8131109	Xã Thạnh Hòa	81311	0	\N	\N	\N	\N	\N	th	813
8131111	Xã Bàn Tân Định	81311	0	\N	\N	\N	\N	\N	btd	813
8131113	Xã Ngọc Chúc	81311	0	\N	\N	\N	\N	\N	nc	813
8131115	Xã Hòa Hưng	81311	0	\N	\N	\N	\N	\N	hh	813
8131117	Xã Hoà Lợi	81311	0	\N	\N	\N	\N	\N	hl	813
8131119	Xã Hoà An	81311	0	\N	\N	\N	\N	\N	ha	813
8131121	Xã Long Thạnh	81311	0	\N	\N	\N	\N	\N	lt	813
8131123	Xã Vĩnh Thạnh	81311	0	\N	\N	\N	\N	\N	vt	813
8131125	Xã  Hòa Thuận	81311	0	\N	\N	\N	\N	\N	ht	813
8131300	Không xác định	81313	0	\N	\N	\N	\N	\N	kx	813
8131301	Thị trấn Gò Quao	81313	0	\N	\N	\N	\N	\N	gq	813
8131303	Xã Vĩnh Hòa Hưng Bắc	81313	0	\N	\N	\N	\N	\N	vhhb	813
8131305	Xã Định Hòa	81313	0	\N	\N	\N	\N	\N	dh	813
8131307	Xã Thới Quản	81313	0	\N	\N	\N	\N	\N	tq	813
8131309	Xã Định An	81313	0	\N	\N	\N	\N	\N	da	813
8131311	Xã Thủy Liểu	81313	0	\N	\N	\N	\N	\N	tl	813
8131313	Xã Vĩnh Hòa Hưng Nam	81313	0	\N	\N	\N	\N	\N	vhhn	813
8131315	Xã Vĩnh Phước A	81313	0	\N	\N	\N	\N	\N	vpa	813
8131317	Xã Vĩnh Phước B	81313	0	\N	\N	\N	\N	\N	vpb	813
8131319	Xã Vĩnh Tuy	81313	0	\N	\N	\N	\N	\N	vt	813
8131500	Không xác định	81315	0	\N	\N	\N	\N	\N	kx	813
8131501	Thị trấn Thứ Ba	81315	0	\N	\N	\N	\N	\N	tb	813
8131503	Xã Tây Yên	81315	0	\N	\N	\N	\N	\N	ty	813
8131505	Xã Tây Yên A	81315	0	\N	\N	\N	\N	\N	tya	813
8131507	Xã Nam Yên	81315	0	\N	\N	\N	\N	\N	ny	813
8131509	Xã Hưng Yên	81315	0	\N	\N	\N	\N	\N	hy	813
8131511	Xã Nam Thái	81315	0	\N	\N	\N	\N	\N	nt	813
8131513	Xã Nam Thái A	81315	0	\N	\N	\N	\N	\N	nta	813
8131515	Xã Đông Thái	81315	0	\N	\N	\N	\N	\N	dt	813
8131517	Xã Đông Yên	81315	0	\N	\N	\N	\N	\N	dy	813
8131519	Xã Thạnh Yên	81315	0	\N	\N	\N	\N	\N	ty	813
8131700	Không xác định	81317	0	\N	\N	\N	\N	\N	kx	813
8131701	Thị trấn Thứ Mười Một	81317	0	\N	\N	\N	\N	\N	tmm	813
8131703	Xã Thuận Hoà	81317	0	\N	\N	\N	\N	\N	th	813
8131705	Xã Đông Hòa	81317	0	\N	\N	\N	\N	\N	dh	813
8131707	Xã An Minh Bắc	81317	0	\N	\N	\N	\N	\N	amb	813
8131709	Xã Đông Thạnh	81317	0	\N	\N	\N	\N	\N	dt	813
8131711	Xã Đông Hưng	81317	0	\N	\N	\N	\N	\N	dh	813
8131713	Xã Đông Hưng A	81317	0	\N	\N	\N	\N	\N	dha	813
8131715	Xã Đông Hưng B	81317	0	\N	\N	\N	\N	\N	dhb	813
8131717	Xã Vân Khánh	81317	0	\N	\N	\N	\N	\N	vk	813
8131900	Không xác định	81319	0	\N	\N	\N	\N	\N	kx	813
8131901	Thị trấn Vĩnh Thuận	81319	0	\N	\N	\N	\N	\N	vt	813
8131903	Xã Vĩnh Hòa	81319	0	\N	\N	\N	\N	\N	vh	813
8131905	Xã Vĩnh Bình Bắc	81319	0	\N	\N	\N	\N	\N	vbb	813
8131907	Xã Vĩnh Bình Nam	81319	0	\N	\N	\N	\N	\N	vbn	813
8131909	Xã Minh Thuận	81319	0	\N	\N	\N	\N	\N	mt	813
8131911	Xã Vĩnh Thuận	81319	0	\N	\N	\N	\N	\N	vt	813
8131913	Xã Tân Thuận	81319	0	\N	\N	\N	\N	\N	tt	813
8131915	Xã Vĩnh Phong	81319	0	\N	\N	\N	\N	\N	vp	813
8132100	Không xác định	81321	0	\N	\N	\N	\N	\N	kx	813
8132101	Thị trấn Dương Đông	81321	0	\N	\N	\N	\N	\N	dd	813
8132103	Xã Cửa Cạn	81321	0	\N	\N	\N	\N	\N	cc	813
8132105	Xã Gành Dầu	81321	0	\N	\N	\N	\N	\N	gd	813
8132107	Xã Cửa Dương	81321	0	\N	\N	\N	\N	\N	cd	813
8132109	Xã Hàm Ninh	81321	0	\N	\N	\N	\N	\N	hn	813
8132111	Xã Dương Tơ	81321	0	\N	\N	\N	\N	\N	dt	813
8132113	Xã An Thới	81321	0	\N	\N	\N	\N	\N	at	813
8132115	Xã Bãi Thơm	81321	0	\N	\N	\N	\N	\N	bt	813
8132117	Xã Thổ Châu	81321	0	\N	\N	\N	\N	\N	tc	813
8132300	Không xác định	81323	0	\N	\N	\N	\N	\N	kx	813
8132301	Xã Hòn Tre	81323	0	\N	\N	\N	\N	\N	ht	813
8132303	Xã Hòn Nghệ	81323	0	\N	\N	\N	\N	\N	hn	813
8132305	Xã Lại Sơn	81323	0	\N	\N	\N	\N	\N	ls	813
8132307	Xã Sơn Hải	81323	0	\N	\N	\N	\N	\N	sh	813
8132309	Xã An Sơn	81323	0	\N	\N	\N	\N	\N	as	813
8132500	Không xác định	81325	0	\N	\N	\N	\N	\N	kx	813
8132501	Phường Pháo Đài	81325	0	\N	\N	\N	\N	\N	pd	813
8132503	Phường Bình San	81325	0	\N	\N	\N	\N	\N	bs	813
8132505	Phường Tô Châu	81325	0	\N	\N	\N	\N	\N	tc	813
8132507	Phường Đông Hồ	81325	0	\N	\N	\N	\N	\N	dh	813
8132509	Xã Mỹ Đức	81325	0	\N	\N	\N	\N	\N	md	813
8132511	Xã Tiên Hải	81325	0	\N	\N	\N	\N	\N	th	813
8132513	Xã Thuận Yên	81325	0	\N	\N	\N	\N	\N	ty	813
8150000	Không xác định	81500	0	\N	\N	\N	\N	\N	kx	815
8150100	Không xác định	81501	0	\N	\N	\N	\N	\N	kx	815
8150101	Phường Trà Nóc	81501	0	\N	\N	\N	\N	\N	tn	815
8150103	Phường Bình Thủy	81501	0	\N	\N	\N	\N	\N	bt	815
8150105	Phường An Thới	81501	0	\N	\N	\N	\N	\N	at	815
8150107	Phường Cái Khế	81501	0	\N	\N	\N	\N	\N	ck	815
8150109	Phường An Hòa	81501	0	\N	\N	\N	\N	\N	ah	815
8150111	Phường Thới Bình	81501	0	\N	\N	\N	\N	\N	tb	815
8150113	Phường An Nghiệp	81501	0	\N	\N	\N	\N	\N	an	815
8150115	Phường An Cư	81501	0	\N	\N	\N	\N	\N	ac	815
8150117	Phường An Hội	81501	0	\N	\N	\N	\N	\N	ah	815
8150119	Phường Tân An	81501	0	\N	\N	\N	\N	\N	ta	815
8150121	Phường An Lạc	81501	0	\N	\N	\N	\N	\N	al	815
8150123	Phường An Phú	81501	0	\N	\N	\N	\N	\N	ap	815
8150125	Phường Xuân Khánh	81501	0	\N	\N	\N	\N	\N	xk	815
8150127	Phường Hưng Lợi	81501	0	\N	\N	\N	\N	\N	hl	815
8150129	Phường Hưng Phú	81501	0	\N	\N	\N	\N	\N	hp	815
8150131	Xã Long Hòa	81501	0	\N	\N	\N	\N	\N	lh	815
8150133	Xã Thới An Đông	81501	0	\N	\N	\N	\N	\N	tad	815
8150135	Xã Giai Xuân	81501	0	\N	\N	\N	\N	\N	gx	815
8150137	Xã Long Tuyền	81501	0	\N	\N	\N	\N	\N	lt	815
8150139	Xã An Bình	81501	0	\N	\N	\N	\N	\N	ab	815
8150141	Xã Mỹ Khánh	81501	0	\N	\N	\N	\N	\N	mk	815
8150143	Xã Hưng Thạnh	81501	0	\N	\N	\N	\N	\N	ht	815
8150201	Phường 2	81502	0	\N	\N	\N	\N	\N	2	815
8150203	Phường 3	81502	0	\N	\N	\N	\N	\N	3	815
8150205	Phường 4	81502	0	\N	\N	\N	\N	\N	4	815
8150207	Phường 1	81502	0	\N	\N	\N	\N	\N	1	815
8150209	Xã Vị Tân	81502	0	\N	\N	\N	\N	\N	vt	815
8150211	Xã Hoà Lưu	81502	0	\N	\N	\N	\N	\N	hl	815
8150213	Xã Hoà Tiến	81502	0	\N	\N	\N	\N	\N	ht	815
8150300	Không xác định	81503	0	\N	\N	\N	\N	\N	kx	815
8150301	Thị trấn Thốt Nốt	81503	0	\N	\N	\N	\N	\N	tn	815
8150303	Xã Thạnh Thắng	81503	0	\N	\N	\N	\N	\N	tt	815
8150305	Xã Thạnh An	81503	0	\N	\N	\N	\N	\N	ta	815
8150307	Xã Thạnh Qưới	81503	0	\N	\N	\N	\N	\N	tq	815
8150309	Xã Vĩnh Trinh	81503	0	\N	\N	\N	\N	\N	vt	815
8150311	Xã Thới Thuận	81503	0	\N	\N	\N	\N	\N	tt	815
8150313	Xã Tân Lộc	81503	0	\N	\N	\N	\N	\N	tl	815
8150315	Xã Trung Nhất	81503	0	\N	\N	\N	\N	\N	tn	815
8150317	Xã Thạnh Lộc	81503	0	\N	\N	\N	\N	\N	tl	815
8150319	Xã Thạnh Phú	81503	0	\N	\N	\N	\N	\N	tp	815
8150321	Xã Trung Hưng	81503	0	\N	\N	\N	\N	\N	th	815
8150323	Xã Trung An	81503	0	\N	\N	\N	\N	\N	ta	815
8150325	Xã Thuận Hưng	81503	0	\N	\N	\N	\N	\N	th	815
8150327	Xã Trung Kiên	81503	0	\N	\N	\N	\N	\N	tk	815
8150500	Không xác định	81505	0	\N	\N	\N	\N	\N	kx	815
8150501	Thị trấn Ô Môn	81505	0	\N	\N	\N	\N	\N	om	815
8150503	Xã Thới Long	81505	0	\N	\N	\N	\N	\N	tl	815
8150505	Xã Thới Đông	81505	0	\N	\N	\N	\N	\N	td	815
8150507	Xã Đông Thuận	81505	0	\N	\N	\N	\N	\N	dt	815
8150509	Xã Thới Lai	81505	0	\N	\N	\N	\N	\N	tl	815
8150511	Xã Thới Thạnh	81505	0	\N	\N	\N	\N	\N	tt	815
8150513	Xã Thới An	81505	0	\N	\N	\N	\N	\N	ta	815
8150515	Xã Phước Thới	81505	0	\N	\N	\N	\N	\N	pt	815
8150517	Xã Trường Lạc	81505	0	\N	\N	\N	\N	\N	tl	815
8150519	Xã Định Môn	81505	0	\N	\N	\N	\N	\N	dm	815
8150521	Xã Tân Thới	81505	0	\N	\N	\N	\N	\N	tt	815
8150523	Xã Trường Thành	81505	0	\N	\N	\N	\N	\N	tt	815
8150525	Xã Trường Xuân	81505	0	\N	\N	\N	\N	\N	tx	815
8150527	Xã Đông Hiệp	81505	0	\N	\N	\N	\N	\N	dh	815
8150529	Xã Đông Bình	81505	0	\N	\N	\N	\N	\N	db	815
8150531	Thị trấn Cờ Đỏ	81505	0	\N	\N	\N	\N	\N	cd	815
8150700	Không xác định	81507	0	\N	\N	\N	\N	\N	kx	815
8150701	Thị trấn Cái Răng	81507	0	\N	\N	\N	\N	\N	cr	815
8150703	Xã Nhơn ái	81507	0	\N	\N	\N	\N	\N	na	815
8150705	Xã Trường Long	81507	0	\N	\N	\N	\N	\N	tl	815
8150707	Xã Trường Long Tây	81507	0	\N	\N	\N	\N	\N	tlt	815
8150709	Xã Tân Hòa	81507	0	\N	\N	\N	\N	\N	th	815
8150711	Xã Tân Thuận	81507	0	\N	\N	\N	\N	\N	tt	815
8150713	Xã Nhơn Nghĩa	81507	0	\N	\N	\N	\N	\N	nn	815
8150715	Xã Thạnh Xuân	81507	0	\N	\N	\N	\N	\N	tx	815
8150717	Xã Tân Phú Thạnh	81507	0	\N	\N	\N	\N	\N	tpt	815
8150719	Xã Đông Thạnh	81507	0	\N	\N	\N	\N	\N	dt	815
8150721	Xã Phú An	81507	0	\N	\N	\N	\N	\N	pa	815
8150723	Xã Đông Phú	81507	0	\N	\N	\N	\N	\N	dp	815
8150725	Xã Phú Hữu	81507	0	\N	\N	\N	\N	\N	ph	815
8150727	Xã Đông Phước	81507	0	\N	\N	\N	\N	\N	dp	815
8150900	Không xác định	81509	0	\N	\N	\N	\N	\N	kx	815
8150901	Thị trấn Phụng Hiệp	81509	0	\N	\N	\N	\N	\N	ph	815
8150903	Xã Tân Bình	81509	0	\N	\N	\N	\N	\N	tb	815
8150905	Xã Thạnh Hòa	81509	0	\N	\N	\N	\N	\N	th	815
8150907	Xã Long Thạnh	81509	0	\N	\N	\N	\N	\N	lt	815
8150909	Xã Đại Thành	81509	0	\N	\N	\N	\N	\N	dt	815
8150911	Xã Phụng Hiệp	81509	0	\N	\N	\N	\N	\N	ph	815
8150913	Xã Hòa Mỹ	81509	0	\N	\N	\N	\N	\N	hm	815
8150915	Xã Hòa An	81509	0	\N	\N	\N	\N	\N	ha	815
8150917	Xã Phương Bình	81509	0	\N	\N	\N	\N	\N	pb	815
8150919	Xã Hiệp Hưng	81509	0	\N	\N	\N	\N	\N	hh	815
8150921	Xã Tân Phước Hưng	81509	0	\N	\N	\N	\N	\N	tph	815
8150923	Xã Phương Phú	81509	0	\N	\N	\N	\N	\N	pp	815
8150925	Xã Tân Long	81509	0	\N	\N	\N	\N	\N	tl	815
8151100	Không xác định	81511	0	\N	\N	\N	\N	\N	kx	815
8151101	Thị trấn Nà Mau	81511	0	\N	\N	\N	\N	\N	nm	815
8151103	Xã Vị Thanh	81511	0	\N	\N	\N	\N	\N	vt	815
8151105	Xã Vị Đông	81511	0	\N	\N	\N	\N	\N	vd	815
8151107	Xã Vĩnh Trung	81511	0	\N	\N	\N	\N	\N	vt	815
8151109	Xã Vĩnh Tường	81511	0	\N	\N	\N	\N	\N	vt	815
8151111	Xã Vị Thủy	81511	0	\N	\N	\N	\N	\N	vt	815
8151115	Xã Vị Thắng	81511	0	\N	\N	\N	\N	\N	vt	815
8151117	Xã Vĩnh Thuận Tây	81511	0	\N	\N	\N	\N	\N	vtt	815
8151119	Xã Vị Bình	81511	0	\N	\N	\N	\N	\N	vb	815
8151121	Xã Vị Trung	81511	0	\N	\N	\N	\N	\N	vt	815
8151300	Không xác định	81513	0	\N	\N	\N	\N	\N	kx	815
8151301	Thị trấn Long Mỹ	81513	0	\N	\N	\N	\N	\N	lm	815
8151305	Xã Long Bình	81513	0	\N	\N	\N	\N	\N	lb	815
8151307	Xã Long Trị	81513	0	\N	\N	\N	\N	\N	lt	815
8151309	Xã Long Phú	81513	0	\N	\N	\N	\N	\N	lp	815
8151311	Xã Thuận Hưng	81513	0	\N	\N	\N	\N	\N	th	815
8151313	Xã Vĩnh Thuận Đông	81513	0	\N	\N	\N	\N	\N	vtd	815
8151315	Xã Vĩnh Viễn	81513	0	\N	\N	\N	\N	\N	vv	815
8151317	Xã Lương Tâm	81513	0	\N	\N	\N	\N	\N	lt	815
8151319	Xã Xà Phiên	81513	0	\N	\N	\N	\N	\N	xp	815
8170000	Không xác định	81700	0	\N	\N	\N	\N	\N	kx	817
8170100	Không xác định	81701	0	\N	\N	\N	\N	\N	kx	817
8170101	Phường 1	81701	0	\N	\N	\N	\N	\N	1	817
8170103	Phường 2	81701	0	\N	\N	\N	\N	\N	2	817
8170105	Phường 3	81701	0	\N	\N	\N	\N	\N	3	817
8170107	Phường 4	81701	0	\N	\N	\N	\N	\N	4	817
8170109	Phường 5	81701	0	\N	\N	\N	\N	\N	5	817
8170111	Phường 6	81701	0	\N	\N	\N	\N	\N	6	817
8170113	Phường 7	81701	0	\N	\N	\N	\N	\N	7	817
8170115	Xã Long Đức	81701	0	\N	\N	\N	\N	\N	ld	817
8170300	Không xác định	81703	0	\N	\N	\N	\N	\N	kx	817
8170301	Thị trấn Càng Long	81703	0	\N	\N	\N	\N	\N	cl	817
8170303	Xã Mỹ Cẩm	81703	0	\N	\N	\N	\N	\N	mc	817
8170305	Xã An Trường	81703	0	\N	\N	\N	\N	\N	at	817
8170307	Xã Huyền Hội	81703	0	\N	\N	\N	\N	\N	hh	817
8170309	Xã Tân An	81703	0	\N	\N	\N	\N	\N	ta	817
8170311	Xã Tân Bình	81703	0	\N	\N	\N	\N	\N	tb	817
8170313	Xã Bình Phú	81703	0	\N	\N	\N	\N	\N	bp	817
8170315	Xã Phương Thạnh	81703	0	\N	\N	\N	\N	\N	pt	817
8170317	Xã Đại Phước	81703	0	\N	\N	\N	\N	\N	dp	817
8170319	Xã Nhị Long	81703	0	\N	\N	\N	\N	\N	nl	817
8170321	Xã Đức Mỹ	81703	0	\N	\N	\N	\N	\N	dm	817
8170323	Xã An Trường A	81703	0	\N	\N	\N	\N	\N	ata	817
8170500	Không xác định	81705	0	\N	\N	\N	\N	\N	kx	817
8170501	Thị trấn Châu Thành	81705	0	\N	\N	\N	\N	\N	ct	817
8170503	Xã Đa Lộc	81705	0	\N	\N	\N	\N	\N	dl	817
8170505	Xã Thanh Mỹ	81705	0	\N	\N	\N	\N	\N	tm	817
8170507	Xã Lương Hòa	81705	0	\N	\N	\N	\N	\N	lh	817
8170509	Xã Song Lộc	81705	0	\N	\N	\N	\N	\N	sl	817
8170511	Xã Nguyệt Hóa	81705	0	\N	\N	\N	\N	\N	nh	817
8170513	Xã Hòa Thuận	81705	0	\N	\N	\N	\N	\N	ht	817
8170515	Xã Hòa Lợi	81705	0	\N	\N	\N	\N	\N	hl	817
8170517	Xã Phước Hảo	81705	0	\N	\N	\N	\N	\N	ph	817
8170519	Xã Hưng Mỹ	81705	0	\N	\N	\N	\N	\N	hm	817
8170521	Xã Hòa Minh	81705	0	\N	\N	\N	\N	\N	hm	817
8170523	Xã Long Hòa	81705	0	\N	\N	\N	\N	\N	lh	817
8170525	Xã Mỹ Chánh	81705	0	\N	\N	\N	\N	\N	mc	817
8170700	Không xác định	81707	0	\N	\N	\N	\N	\N	kx	817
8170701	Thị trấn Cầu Kè	81707	0	\N	\N	\N	\N	\N	ck	817
8170703	Xã Hòa Ân	81707	0	\N	\N	\N	\N	\N	ha	817
8170705	Xã Châu Điền	81707	0	\N	\N	\N	\N	\N	cd	817
8170707	Xã An Phú Tân	81707	0	\N	\N	\N	\N	\N	apt	817
8170709	Xã Ninh Thới	81707	0	\N	\N	\N	\N	\N	nt	817
8170711	Xã Phong Phú	81707	0	\N	\N	\N	\N	\N	pp	817
8170713	Xã Phong Thạnh	81707	0	\N	\N	\N	\N	\N	pt	817
8170715	Xã Tam Ngãi	81707	0	\N	\N	\N	\N	\N	tn	817
8170717	Xã Thông Hòa	81707	0	\N	\N	\N	\N	\N	th	817
8170719	Xã Thạnh Phú	81707	0	\N	\N	\N	\N	\N	tp	817
8170721	Xã Hòa Tân	81707	0	\N	\N	\N	\N	\N	ht	817
8170900	Không xác định	81709	0	\N	\N	\N	\N	\N	kx	817
8170901	Thị trấn Tiểu Cần	81709	0	\N	\N	\N	\N	\N	tc	817
8170903	Thị trấn Cầu Quan	81709	0	\N	\N	\N	\N	\N	cq	817
8170905	Xã Phú Cần	81709	0	\N	\N	\N	\N	\N	pc	817
8170907	Xã Hiếu Tử	81709	0	\N	\N	\N	\N	\N	ht	817
8170909	Xã Hiếu Trung	81709	0	\N	\N	\N	\N	\N	ht	817
8170911	Xã Long Thới	81709	0	\N	\N	\N	\N	\N	lt	817
8170913	Xã Hùng Hòa	81709	0	\N	\N	\N	\N	\N	hh	817
8170915	Xã Tập Ngãi	81709	0	\N	\N	\N	\N	\N	tn	817
8170917	Xã Ngãi Hùng	81709	0	\N	\N	\N	\N	\N	nh	817
8170919	Xã Tân Hòa	81709	0	\N	\N	\N	\N	\N	th	817
8170921	Xã Tân Hùng	81709	0	\N	\N	\N	\N	\N	th	817
8171100	Không xác định	81711	0	\N	\N	\N	\N	\N	kx	817
8171101	Thị trấn Cầu Ngang	81711	0	\N	\N	\N	\N	\N	cn	817
8171103	Thị trấn Mỹ Long	81711	0	\N	\N	\N	\N	\N	ml	817
8171105	Xã Mỹ Long Bắc	81711	0	\N	\N	\N	\N	\N	mlb	817
8171107	Xã Mỹ Hòa	81711	0	\N	\N	\N	\N	\N	mh	817
8171109	Xã Vĩnh Kim	81711	0	\N	\N	\N	\N	\N	vk	817
8171111	Xã Kim Hòa	81711	0	\N	\N	\N	\N	\N	kh	817
8171113	Xã Hiệp Hòa	81711	0	\N	\N	\N	\N	\N	hh	817
8171115	Xã Thuận Hòa	81711	0	\N	\N	\N	\N	\N	th	817
8171117	Xã Long Sơn	81711	0	\N	\N	\N	\N	\N	ls	817
8171119	Xã Nhị Trường	81711	0	\N	\N	\N	\N	\N	nt	817
8171121	Xã Trường Thọ	81711	0	\N	\N	\N	\N	\N	tt	817
8171123	Xã Hiệp Mỹ	81711	0	\N	\N	\N	\N	\N	hm	817
8171125	Xã Thạnh Hòa Sơn	81711	0	\N	\N	\N	\N	\N	ths	817
8171127	Xã Mỹ Long Nam	81711	0	\N	\N	\N	\N	\N	mln	817
8171300	Không xác định	81713	0	\N	\N	\N	\N	\N	kx	817
8171301	Thị trấn Trà Cú	81713	0	\N	\N	\N	\N	\N	tc	817
8171303	Xã Phước Hưng	81713	0	\N	\N	\N	\N	\N	ph	817
8171305	Xã Tập Sơn	81713	0	\N	\N	\N	\N	\N	ts	817
8171307	Xã An Quảng Hữu	81713	0	\N	\N	\N	\N	\N	aqh	817
8171309	Xã Lưu Nghiệp Anh	81713	0	\N	\N	\N	\N	\N	lna	817
8171311	Xã Ngãi Xuyên	81713	0	\N	\N	\N	\N	\N	nx	817
8171313	Xã Thanh Sơn	81713	0	\N	\N	\N	\N	\N	ts	817
8171315	Xã Hàm Giang	81713	0	\N	\N	\N	\N	\N	hg	817
8171317	Xã Đại An	81713	0	\N	\N	\N	\N	\N	da	817
8171319	Xã Đôn Xuân	81713	0	\N	\N	\N	\N	\N	dx	817
8171321	Xã Đôn Châu	81713	0	\N	\N	\N	\N	\N	dc	817
8171323	Xã Ngọc Biên	81713	0	\N	\N	\N	\N	\N	nb	817
8171325	Xã Long Hiệp	81713	0	\N	\N	\N	\N	\N	lh	817
8171327	Xã Tân Hiệp	81713	0	\N	\N	\N	\N	\N	th	817
8171329	Xã Định An	81713	0	\N	\N	\N	\N	\N	da	817
8171500	Không xác định	81715	0	\N	\N	\N	\N	\N	kx	817
8171501	Thị trấn Duyên Hải	81715	0	\N	\N	\N	\N	\N	dh	817
8171503	Xã Long Toàn	81715	0	\N	\N	\N	\N	\N	lt	817
8171505	Xã Long Hữu	81715	0	\N	\N	\N	\N	\N	lh	817
8171507	Xã Long Khánh	81715	0	\N	\N	\N	\N	\N	lk	817
8171509	Xã Dân Thành	81715	0	\N	\N	\N	\N	\N	dt	817
8171511	Xã Trường Long Hòa	81715	0	\N	\N	\N	\N	\N	tlh	817
8171513	Xã Ngũ Lạc	81715	0	\N	\N	\N	\N	\N	nl	817
8171515	Xã Long Vĩnh	81715	0	\N	\N	\N	\N	\N	lv	817
8171517	Xã Đông Hải	81715	0	\N	\N	\N	\N	\N	dh	817
8171519	Xã Hiệp Thạnh	81715	0	\N	\N	\N	\N	\N	ht	817
8190000	Không xác định	81900	0	\N	\N	\N	\N	\N	kx	819
8190100	Không xác định	81901	0	\N	\N	\N	\N	\N	kx	819
8190101	Phường 1	81901	0	\N	\N	\N	\N	\N	1	819
8190103	Phường 2	81901	0	\N	\N	\N	\N	\N	2	819
8190105	Phường 3	81901	0	\N	\N	\N	\N	\N	3	819
8190107	Phường 4	81901	0	\N	\N	\N	\N	\N	4	819
8190109	Phường 5	81901	0	\N	\N	\N	\N	\N	5	819
8190111	Phường 6	81901	0	\N	\N	\N	\N	\N	6	819
8190113	Phường 7	81901	0	\N	\N	\N	\N	\N	7	819
8190115	Phường 8	81901	0	\N	\N	\N	\N	\N	8	819
8190117	Phường 9	81901	0	\N	\N	\N	\N	\N	9	819
8190119	Phường 10	81901	0	\N	\N	\N	\N	\N	10	819
8190300	Không xác định	81903	0	\N	\N	\N	\N	\N	kx	819
8190301	Thị trấn Kế Sách	81903	0	\N	\N	\N	\N	\N	ks	819
8190303	Xã An Mỹ	81903	0	\N	\N	\N	\N	\N	am	819
8190305	Xã Nhơn Mỹ	81903	0	\N	\N	\N	\N	\N	nm	819
8190307	Xã Thới An Hội	81903	0	\N	\N	\N	\N	\N	tah	819
8190309	Xã Kế An	81903	0	\N	\N	\N	\N	\N	ka	819
8190311	Xã Kế Thành	81903	0	\N	\N	\N	\N	\N	kt	819
8190313	Xã Đại Hải	81903	0	\N	\N	\N	\N	\N	dh	819
8190315	Xã Phong Nẫm	81903	0	\N	\N	\N	\N	\N	pn	819
8190317	Xã An Lạc Thôn	81903	0	\N	\N	\N	\N	\N	alt	819
8190319	Xã Xuân Hòa	81903	0	\N	\N	\N	\N	\N	xh	819
8190321	Xã An Lạc Tây	81903	0	\N	\N	\N	\N	\N	alt	819
8190323	Xã Ba Trinh	81903	0	\N	\N	\N	\N	\N	bt	819
8190325	Xã Trinh Phú	81903	0	\N	\N	\N	\N	\N	tp	819
8190500	Không xác định	81905	0	\N	\N	\N	\N	\N	kx	819
8190501	Thị trấn Long Phú	81905	0	\N	\N	\N	\N	\N	lp	819
8190503	Xã Long Phú	81905	0	\N	\N	\N	\N	\N	lp	819
8190505	Xã Tân Thạnh	81905	0	\N	\N	\N	\N	\N	tt	819
8190507	Xã Tân Hưng	81905	0	\N	\N	\N	\N	\N	th	819
8190509	Xã Đại Ân 1	81905	0	\N	\N	\N	\N	\N	da1	819
8190511	Xã Đại Ân  2	81905	0	\N	\N	\N	\N	\N	da2	819
8190513	Xã An Thạnh 2	81905	0	\N	\N	\N	\N	\N	at2	819
8190515	Xã Trường Khánh	81905	0	\N	\N	\N	\N	\N	tk	819
8190517	Xã Hậu Thạnh	81905	0	\N	\N	\N	\N	\N	ht	819
8190519	Xã Đại Ngãi	81905	0	\N	\N	\N	\N	\N	dn	819
8190521	Xã Song Phụng	81905	0	\N	\N	\N	\N	\N	sp	819
8190523	Xã Long Đức	81905	0	\N	\N	\N	\N	\N	ld	819
8190525	Xã Châu Khánh	81905	0	\N	\N	\N	\N	\N	ck	819
8190527	Xã Phú Hữu	81905	0	\N	\N	\N	\N	\N	ph	819
8190529	Xã An Thạnh 1	81905	0	\N	\N	\N	\N	\N	at1	819
8190531	Xã Liêu Tú	81905	0	\N	\N	\N	\N	\N	lt	819
8190533	Xã Lịch Hội Thượng	81905	0	\N	\N	\N	\N	\N	lht	819
8190535	Xã Trung Bình	81905	0	\N	\N	\N	\N	\N	tb	819
8190537	Xã An Thạnh 3	81905	0	\N	\N	\N	\N	\N	at3	819
8190700	Không xác định	81907	0	\N	\N	\N	\N	\N	kx	819
8190701	Thị trấn Huỳnh Hữu Nghĩa	81907	0	\N	\N	\N	\N	\N	hhn	819
8190703	Xã Phú Mỹ	81907	0	\N	\N	\N	\N	\N	pm	819
8190705	Xã Mỹ Tú	81907	0	\N	\N	\N	\N	\N	mt	819
8190707	Xã Hưng Phú	81907	0	\N	\N	\N	\N	\N	hp	819
8190709	Xã Thuận Hưng	81907	0	\N	\N	\N	\N	\N	th	819
8190711	Xã Mỹ Thuận	81907	0	\N	\N	\N	\N	\N	mt	819
8190713	Xã Mỹ Phước	81907	0	\N	\N	\N	\N	\N	mp	819
8190715	Xã Long Hưng	81907	0	\N	\N	\N	\N	\N	lh	819
8190717	Xã Hồ Đắc Kiện	81907	0	\N	\N	\N	\N	\N	hdk	819
8190719	Xã Phú Tâm	81907	0	\N	\N	\N	\N	\N	pt	819
8190721	Xã Thiện Mỹ	81907	0	\N	\N	\N	\N	\N	tm	819
8190723	Xã Thuận Hòa	81907	0	\N	\N	\N	\N	\N	th	819
8190725	Xã Phú Tân	81907	0	\N	\N	\N	\N	\N	pt	819
8190727	Xã Mỹ Hương	81907	0	\N	\N	\N	\N	\N	mh	819
8190729	Xã An Hiệp	81907	0	\N	\N	\N	\N	\N	ah	819
8190731	Xã An Ninh	81907	0	\N	\N	\N	\N	\N	an	819
8190900	Không xác định	81909	0	\N	\N	\N	\N	\N	kx	819
8190901	Thị trấn Mỹ Xuyên	81909	0	\N	\N	\N	\N	\N	mx	819
8190903	Xã Tài Văn	81909	0	\N	\N	\N	\N	\N	tv	819
8190905	Xã Viên An	81909	0	\N	\N	\N	\N	\N	va	819
8190907	Xã Viên Bình	81909	0	\N	\N	\N	\N	\N	vb	819
8190909	Xã Thạnh Thới An	81909	0	\N	\N	\N	\N	\N	tta	819
8190911	Xã Thạnh Quới	81909	0	\N	\N	\N	\N	\N	tq	819
8190913	Xã Thạnh Phú	81909	0	\N	\N	\N	\N	\N	tp	819
8190915	Xã Đại Tâm	81909	0	\N	\N	\N	\N	\N	dt	819
8190917	Xã Ngọc Tố	81909	0	\N	\N	\N	\N	\N	nt	819
8190919	Xã Ngọc Đông	81909	0	\N	\N	\N	\N	\N	nd	819
8190921	Xã Hòa Tú 1	81909	0	\N	\N	\N	\N	\N	ht1	819
8190923	Xã Hòa Tú II	81909	0	\N	\N	\N	\N	\N	hti	819
8190925	Xã Gia Hòa 1	81909	0	\N	\N	\N	\N	\N	gh1	819
8190927	Xã Gia Hòa 2	81909	0	\N	\N	\N	\N	\N	gh2	819
8190929	Xã Tham Đôn	81909	0	\N	\N	\N	\N	\N	td	819
8190931	Xã Thạnh Thới Thuận	81909	0	\N	\N	\N	\N	\N	ttt	819
8191100	Không xác định	81911	0	\N	\N	\N	\N	\N	kx	819
8191101	Thị trấn Phú Lộc	81911	0	\N	\N	\N	\N	\N	pl	819
8191103	Thị trấn Ngã Năm	81911	0	\N	\N	\N	\N	\N	nn	819
8191105	Xã Vĩnh Quới	81911	0	\N	\N	\N	\N	\N	vq	819
8191107	Xã Lâm Tân	81911	0	\N	\N	\N	\N	\N	lt	819
8191109	Xã Lâm Kiết	81911	0	\N	\N	\N	\N	\N	lk	819
8191111	Xã Thạnh Trị	81911	0	\N	\N	\N	\N	\N	tt	819
8191113	Xã Thạnh Tân	81911	0	\N	\N	\N	\N	\N	tt	819
8191115	Xã Châu Hưng	81911	0	\N	\N	\N	\N	\N	ch	819
8191117	Xã Tân Long	81911	0	\N	\N	\N	\N	\N	tl	819
8191119	Xã Vĩnh Biên	81911	0	\N	\N	\N	\N	\N	vb	819
8191121	Xã Long Tân	81911	0	\N	\N	\N	\N	\N	lt	819
8191123	Xã Mỹ Quới	81911	0	\N	\N	\N	\N	\N	mq	819
8191125	Xã Vĩnh Lợi	81911	0	\N	\N	\N	\N	\N	vl	819
8191127	Xã Tuân Tức	81911	0	\N	\N	\N	\N	\N	tt	819
8191300	Không xác định	81913	0	\N	\N	\N	\N	\N	kx	819
8191301	Thị trấn Vĩnh Châu	81913	0	\N	\N	\N	\N	\N	vc	819
8191303	Xã Lai Hòa	81913	0	\N	\N	\N	\N	\N	lh	819
8191305	Xã Vĩnh Tân	81913	0	\N	\N	\N	\N	\N	vt	819
8191307	Xã Vĩnh Phước	81913	0	\N	\N	\N	\N	\N	vp	819
8191309	Xã Vĩnh Hiệp	81913	0	\N	\N	\N	\N	\N	vh	819
8191311	Xã Hòa Đông	81913	0	\N	\N	\N	\N	\N	hd	819
8191313	Xã Khánh Hòa	81913	0	\N	\N	\N	\N	\N	kh	819
8191315	Xã Vĩnh Châu	81913	0	\N	\N	\N	\N	\N	vc	819
8191317	Xã Lạc Hòa	81913	0	\N	\N	\N	\N	\N	lh	819
8191319	Xã Vĩnh Hải	81913	0	\N	\N	\N	\N	\N	vh	819
8210000	Không xác định	82100	0	\N	\N	\N	\N	\N	kx	821
8210100	Không xác định	82101	0	\N	\N	\N	\N	\N	kx	821
8210101	Phường 2	82101	0	\N	\N	\N	\N	\N	2	821
8210103	Phường 3	82101	0	\N	\N	\N	\N	\N	3	821
8210105	Phường 5	82101	0	\N	\N	\N	\N	\N	5	821
8210107	Phường 7	82101	0	\N	\N	\N	\N	\N	7	821
8210109	Phường 8	82101	0	\N	\N	\N	\N	\N	8	821
8210111	Xã Thuận Hòa	82101	0	\N	\N	\N	\N	\N	th	821
8210113	Xã Hiệp Thành	82101	0	\N	\N	\N	\N	\N	ht	821
8210300	Không xác định	82103	0	\N	\N	\N	\N	\N	kx	821
8210301	Thị trấn Phước Long	82103	0	\N	\N	\N	\N	\N	pl	821
8210303	Thị trấn Ngan Dừa	82103	0	\N	\N	\N	\N	\N	nd	821
8210305	Xã Ninh Quới	82103	0	\N	\N	\N	\N	\N	nq	821
8210307	Xã Ninh Hòa	82103	0	\N	\N	\N	\N	\N	nh	821
8210309	Xã Lộc Ninh	82103	0	\N	\N	\N	\N	\N	ln	821
8210311	Xã Vĩnh Lộc	82103	0	\N	\N	\N	\N	\N	vl	821
8210313	Xã Ninh Thạnh Lợi	82103	0	\N	\N	\N	\N	\N	ntl	821
8210315	Xã Vĩnh Phú Đông	82103	0	\N	\N	\N	\N	\N	vpd	821
8210317	Xã Vĩnh Phú Tây	82103	0	\N	\N	\N	\N	\N	vpt	821
8210319	Xã Phước Long	82103	0	\N	\N	\N	\N	\N	pl	821
8210321	Xã Hưng Phú	82103	0	\N	\N	\N	\N	\N	hp	821
8210323	Xã Vĩnh Thanh	82103	0	\N	\N	\N	\N	\N	vt	821
8210325	Xã Phong Thạnh Nam	82103	0	\N	\N	\N	\N	\N	ptn	821
8210500	Không xác định	82105	0	\N	\N	\N	\N	\N	kx	821
8210501	Thị trấn Hòa Bình	82105	0	\N	\N	\N	\N	\N	hb	821
8210503	Xã Vĩnh Hưng	82105	0	\N	\N	\N	\N	\N	vh	821
8210505	Xã Châu Hưng	82105	0	\N	\N	\N	\N	\N	ch	821
8210507	Xã Hưng Thành	82105	0	\N	\N	\N	\N	\N	ht	821
8210509	Xã Hưng Hội	82105	0	\N	\N	\N	\N	\N	hh	821
8210511	Xã Châu Thới	82105	0	\N	\N	\N	\N	\N	ct	821
8210513	Xã Minh Diệu	82105	0	\N	\N	\N	\N	\N	md	821
8210515	Xã Vĩnh Bình	82105	0	\N	\N	\N	\N	\N	vb	821
8210517	Xã Long Thạnh	82105	0	\N	\N	\N	\N	\N	lt	821
8210519	Xã Vĩnh Mỹ B	82105	0	\N	\N	\N	\N	\N	vmb	821
8210521	Xã Vĩnh Hậu	82105	0	\N	\N	\N	\N	\N	vh	821
8210523	Xã Vĩnh Mỹ A	82105	0	\N	\N	\N	\N	\N	vma	821
8210525	Xã Vĩnh Thịnh	82105	0	\N	\N	\N	\N	\N	vt	821
8210700	Không xác định	82107	0	\N	\N	\N	\N	\N	kx	821
8210701	Thị trấn Giá Rai	82107	0	\N	\N	\N	\N	\N	gr	821
8210703	Thị trấn Hộ Phòng	82107	0	\N	\N	\N	\N	\N	hp	821
8210705	Thị trấn Gành Hào	82107	0	\N	\N	\N	\N	\N	gh	821
8210707	Xã Phong Thạnh Đông	82107	0	\N	\N	\N	\N	\N	ptd	821
8210709	Xã Phong Tân	82107	0	\N	\N	\N	\N	\N	pt	821
8210711	Xã Tân Phong	82107	0	\N	\N	\N	\N	\N	tp	821
8210713	Xã Phong Thạnh	82107	0	\N	\N	\N	\N	\N	pt	821
8210715	Xã Phong Thạnh Tây	82107	0	\N	\N	\N	\N	\N	ptt	821
8210717	Xã Long Điền Đông	82107	0	\N	\N	\N	\N	\N	ldd	821
8210719	Xã Long Điền	82107	0	\N	\N	\N	\N	\N	ld	821
8210721	Xã Long Điền Tây	82107	0	\N	\N	\N	\N	\N	ldt	821
8210723	Xã An Trạch	82107	0	\N	\N	\N	\N	\N	at	821
8210725	Xã Tân Thạnh	82107	0	\N	\N	\N	\N	\N	tt	821
8210727	Xã An Phúc	82107	0	\N	\N	\N	\N	\N	ap	821
8210729	Xã Định Thành	82107	0	\N	\N	\N	\N	\N	dt	821
8230000	Không xác định	82300	0	\N	\N	\N	\N	\N	kx	823
8230100	Không xác định	82301	0	\N	\N	\N	\N	\N	kx	823
8230101	Phường 1	82301	0	\N	\N	\N	\N	\N	1	823
8230103	Phường 2	82301	0	\N	\N	\N	\N	\N	2	823
8230105	Phường 4	82301	0	\N	\N	\N	\N	\N	4	823
8230107	Phường 5	82301	0	\N	\N	\N	\N	\N	5	823
8230109	Phường 6	82301	0	\N	\N	\N	\N	\N	6	823
8230111	Phường 7	82301	0	\N	\N	\N	\N	\N	7	823
8230113	Phường 8	82301	0	\N	\N	\N	\N	\N	8	823
8230115	Phường 9	82301	0	\N	\N	\N	\N	\N	9	823
8230117	Xã An Xuyên	82301	0	\N	\N	\N	\N	\N	ax	823
8230119	Xã Tân Thành	82301	0	\N	\N	\N	\N	\N	tt	823
8230121	Xã Tắc Vân	82301	0	\N	\N	\N	\N	\N	tv	823
8230123	Xã Định Bình	82301	0	\N	\N	\N	\N	\N	db	823
8230125	Xã Hòa Thành	82301	0	\N	\N	\N	\N	\N	ht	823
8230127	Xã Lý Văn Lâm	82301	0	\N	\N	\N	\N	\N	lvl	823
8230129	Xã Hòa Tân	82301	0	\N	\N	\N	\N	\N	ht	823
8230300	Không xác định	82303	0	\N	\N	\N	\N	\N	kx	823
8230301	Thị trấn Thới Bình	82303	0	\N	\N	\N	\N	\N	tb	823
8230303	Xã Biển Bạch Đông	82303	0	\N	\N	\N	\N	\N	bbd	823
8230305	Xã Biển Bạch	82303	0	\N	\N	\N	\N	\N	bb	823
8230307	Xã Trí Phải	82303	0	\N	\N	\N	\N	\N	tp	823
8230309	Xã Tân Phú	82303	0	\N	\N	\N	\N	\N	tp	823
8230311	Xã Thới Bình	82303	0	\N	\N	\N	\N	\N	tb	823
8230313	Xã Tân Lộc	82303	0	\N	\N	\N	\N	\N	tl	823
8230315	Xã Hồ Thị Kỷ	82303	0	\N	\N	\N	\N	\N	htk	823
8230500	Không xác định	82305	0	\N	\N	\N	\N	\N	kx	823
8230501	Thị trấn U Minh	82305	0	\N	\N	\N	\N	\N	um	823
8230503	Xã Nguyễn Phích	82305	0	\N	\N	\N	\N	\N	np	823
8230505	Xã Khánh Hòa	82305	0	\N	\N	\N	\N	\N	kh	823
8230507	Xã Khánh Tiến	82305	0	\N	\N	\N	\N	\N	kt	823
8230509	Xã Khánh Lâm	82305	0	\N	\N	\N	\N	\N	kl	823
8230511	Xã Khánh An	82305	0	\N	\N	\N	\N	\N	ka	823
8230700	Không xác định	82307	0	\N	\N	\N	\N	\N	kx	823
8230701	Thị trấn Trần Văn Thời	82307	0	\N	\N	\N	\N	\N	tvt	823
8230703	Thị trấn Sông Đốc	82307	0	\N	\N	\N	\N	\N	sd	823
8230705	Xã Khánh Bình Đông	82307	0	\N	\N	\N	\N	\N	kbd	823
8230707	Xã Khánh Bình	82307	0	\N	\N	\N	\N	\N	kb	823
8230709	Xã Khánh Bình Tây	82307	0	\N	\N	\N	\N	\N	kbt	823
8230711	Xã Khánh Hưng	82307	0	\N	\N	\N	\N	\N	kh	823
8230713	Xã Trần Hợi	82307	0	\N	\N	\N	\N	\N	th	823
8230715	Xã Lợi An	82307	0	\N	\N	\N	\N	\N	la	823
8230717	Xã Khánh Hải	82307	0	\N	\N	\N	\N	\N	kh	823
8230719	Xã Phong Lạc	82307	0	\N	\N	\N	\N	\N	pl	823
8230900	Không xác định	82309	0	\N	\N	\N	\N	\N	kx	823
8230901	Thị trấn Cái Nước	82309	0	\N	\N	\N	\N	\N	cn	823
8230903	Thị trấn Cái Đôi Vàm	82309	0	\N	\N	\N	\N	\N	cdv	823
8230905	Xã Lương Thế Trân	82309	0	\N	\N	\N	\N	\N	ltt	823
8230907	Xã Phú Hưng	82309	0	\N	\N	\N	\N	\N	ph	823
8230909	Xã Hưng Mỹ	82309	0	\N	\N	\N	\N	\N	hm	823
8230911	Xã Đông Thới	82309	0	\N	\N	\N	\N	\N	dt	823
8230913	Xã Phú Mỹ	82309	0	\N	\N	\N	\N	\N	pm	823
8230915	Xã Tân Hưng	82309	0	\N	\N	\N	\N	\N	th	823
8230917	Xã Phú Tân	82309	0	\N	\N	\N	\N	\N	pt	823
8230919	Xã Tân Hưng Đông	82309	0	\N	\N	\N	\N	\N	thd	823
8230921	Xã Tân Hưng Tây	82309	0	\N	\N	\N	\N	\N	tht	823
8230923	Xã Trần Thới	82309	0	\N	\N	\N	\N	\N	tt	823
8230925	Xã Việt Khái	82309	0	\N	\N	\N	\N	\N	vk	823
8231100	Không xác định	82311	0	\N	\N	\N	\N	\N	kx	823
8231101	Thị trấn Đầm Dơi	82311	0	\N	\N	\N	\N	\N	dd	823
8231103	Xã Tân Thuận	82311	0	\N	\N	\N	\N	\N	tt	823
8231105	Xã Tân Đức	82311	0	\N	\N	\N	\N	\N	td	823
8231107	Xã Trần Phán	82311	0	\N	\N	\N	\N	\N	tp	823
8231109	Xã Tạ An Khương	82311	0	\N	\N	\N	\N	\N	tak	823
8231111	Xã Tân Duyệt	82311	0	\N	\N	\N	\N	\N	td	823
8231113	Xã Quách Phẩm	82311	0	\N	\N	\N	\N	\N	qp	823
8231115	Xã Tân Tiến	82311	0	\N	\N	\N	\N	\N	tt	823
8231117	Xã Nguyễn Huân	82311	0	\N	\N	\N	\N	\N	nh	823
8231119	Xã Thanh Tùng	82311	0	\N	\N	\N	\N	\N	tt	823
8231300	Không xác định	82313	0	\N	\N	\N	\N	\N	kx	823
8231301	Thị trấn Ngọc Hiển	82313	0	\N	\N	\N	\N	\N	nh	823
8231303	Xã Hàm Rồng	82313	0	\N	\N	\N	\N	\N	hr	823
8231305	Xã Hiệp Tùng	82313	0	\N	\N	\N	\N	\N	ht	823
8231307	Xã Tam Giang	82313	0	\N	\N	\N	\N	\N	tg	823
8231309	Xã Hàng Vịnh	82313	0	\N	\N	\N	\N	\N	hv	823
8231311	Xã Đất Mới	82313	0	\N	\N	\N	\N	\N	dm	823
8231313	Xã Tân Ân	82313	0	\N	\N	\N	\N	\N	ta	823
8231315	Xã Viên An Đông	82313	0	\N	\N	\N	\N	\N	vad	823
8231317	Xã Viên An	82313	0	\N	\N	\N	\N	\N	va	823
8231319	Xã Đất Mũi	82313	0	\N	\N	\N	\N	\N	dm	823
8231320	Xã Đất Mũi	82313	0	\N	\N	\N	\N	\N	dm	823
7010509	Phường 5	70105	0	\N	\N	\N	\N	\N	p5	701
7010505	Phường 3	70105	0	\N	\N	\N	\N	\N	p3	701
1090617	Xã An Vĩ	10906	0	\N	\N	\N	\N	\N	av	109
7010599	Y tế CA tỉnh TP HCM	70105	0	\N	\N	\N	\N	\N	ca	701
8110939	Xã Thạnh Phú Đông	81109	0	\N	\N	\N	\N	\N	tp	811
8111113	Xã Vang Quới Tây	81111	0	\N	\N	\N	\N	\N	vq	811
8111115	Xã Vang Quới Đông	81111	0	\N	\N	\N	\N	\N	vq	811
8111131	Xã Đại Hòa Lộc	81111	0	\N	\N	\N	\N	\N	dh	811
1010900	Không xác định	10109	0	\N	\N	\N	\N	\N	kx	101
1010903	Phường Cát Linh	10109	0	\N	\N	\N	\N	\N	cl	101
1010909	Phường Hàng Bột	10109	0	\N	\N	\N	\N	\N	hb	101
1010921	Phường Khâm Thiên	10109	0	\N	\N	\N	\N	\N	kt	101
1010933	Phường Khương Thượng	10109	0	\N	\N	\N	\N	\N	kt	101
1010927	Phường Kim Liên	10109	0	\N	\N	\N	\N	\N	kl	101
1010939	Phường Láng Hạ	10109	0	\N	\N	\N	\N	\N	lh	101
1010941	Phường Láng Thượng	10109	0	\N	\N	\N	\N	\N	lt	101
1010913	Phường Nam Đồng	10109	0	\N	\N	\N	\N	\N	nd	101
1010925	Phường Phương Liên	10109	0	\N	\N	\N	\N	\N	pl	101
1010929	Phường Phương Mai	10109	0	\N	\N	\N	\N	\N	pm	101
1010915	Phường Quang Trung	10109	0	\N	\N	\N	\N	\N	qt	101
1010935	Phường Thịnh Quang	10109	0	\N	\N	\N	\N	\N	tq	101
7012901	Phường 1	70129	0	\N	\N	\N	\N	\N	1	701
1010919	Phường Thổ Quan	10109	0	\N	\N	\N	\N	\N	tq	101
1010917	Phường Trung Liệt	10109	0	\N	\N	\N	\N	\N	tl	101
1010923	Phường Trung Phụng	10109	0	\N	\N	\N	\N	\N	tp	101
1010931	Phường Trung Tự	10109	0	\N	\N	\N	\N	\N	tt	101
1010907	Phường Văn Chương	10109	0	\N	\N	\N	\N	\N	vc	101
1010901	Phường Văn Miếu	10109	0	\N	\N	\N	\N	\N	vm	101
7010703	Phường 2	70107	0	\N	\N	\N	\N	\N	2	701
7010701	Phường 1	70107	0	\N	\N	\N	\N	\N	1	701
7010705	Phường 3	70107	0	\N	\N	\N	\N	\N	3	701
7010707	Phường 4	70107	0	\N	\N	\N	\N	\N	4	701
7010709	Phường 5	70107	0	\N	\N	\N	\N	\N	5	701
7010711	Phường 6	70107	0	\N	\N	\N	\N	\N	6	701
7010713	Phường 8	70107	0	\N	\N	\N	\N	\N	8	701
7170128	Thắng nhì	71701	0	\N	\N	\N	\N	\N	ztn	717
7170100	Không xác định	71701	0	\N	\N	\N	\N	\N	kx	717
7171100	Không xác định	71711	0	\N	\N	\N	\N	\N	kx	717
7010120	292Bis Cống quỳnh	70101	0	\N	\N	\N	\N	\N	cq	701
7170316	TTTM Bà Rịa	71703	0	\N	\N	\N	\N	\N	br	717
7010121	33 nguyên V Giai	70101	0	\N	\N	\N	\N	\N	vg	701
7170119	Phường 10	71701	0	\N	\N	\N	\N	\N	z10	717
7170121	Phường 11	71701	0	\N	\N	\N	\N	\N	z11	717
7170107	Phường 4	71701	0	\N	\N	\N	\N	\N	z04	717
7170101	Phường 1	71701	0	\N	\N	\N	\N	\N	z01	717
7170103	Phường 2	71701	0	\N	\N	\N	\N	\N	z02	717
7170105	Phường 3	71701	0	\N	\N	\N	\N	\N	z03	717
7170109	Phường 5	71701	0	\N	\N	\N	\N	\N	z05	717
7170111	Phường 6	71701	0	\N	\N	\N	\N	\N	z06	717
7170113	Phường 7	71701	0	\N	\N	\N	\N	\N	z07	717
7170115	Phường 8	71701	0	\N	\N	\N	\N	\N	z08	717
7170117	Phường 9	71701	0	\N	\N	\N	\N	\N	z09	717
7170123	Xã Long Sơn	71701	0	\N	\N	\N	\N	\N	zls	717
7171109	Xã. PThạnh	71711	0	\N	\N	\N	\N	\N	pt	717
7170124	Phường 12	71701	0	\N	\N	\N	\N	\N	z12	717
7171103	TT.Long Hải	71711	0	\N	\N	\N	\N	\N	lh	717
7171101	TT.LĐiền	71711	0	\N	\N	\N	\N	\N	ld	717
7171125	 Xã.P Hưng	71711	0	\N	\N	\N	\N	\N	ph	717
7171115	Xã Phước Hải	71711	0	\N	\N	\N	\N	\N	ph	717
7171117	Xã Long Tân	71711	0	\N	\N	\N	\N	\N	lt	717
7171119	Xã Láng Dài	71711	0	\N	\N	\N	\N	\N	ld	717
7171121	Xã Lộc An	71711	0	\N	\N	\N	\N	\N	la	717
7171123	Xã Phước Tỉnh	71711	0	\N	\N	\N	\N	\N	pt	717
7171127	TTYT Long Đất	71711	0	\N	\N	\N	\N	\N	yt	717
7171129	Xã An Nhứt	71711	0	\N	\N	\N	\N	\N	an	717
7171113	Xã Phước Hội	71711	0	\N	\N	\N	\N	\N	ph	717
7171131	Xã Long Mỹ	71711	0	\N	\N	\N	\N	\N	lm	717
7171107	Xã Tam Phước	71711	0	\N	\N	\N	\N	\N	tp	717
7010105	Phường Bến Nghé	70101	0	\N	\N	\N	\N	\N	bn	701
7010107	Phường Bến Thành	70101	0	\N	\N	\N	\N	\N	bt	701
7010715	Phường 9	70107	0	\N	\N	\N	\N	\N	9	701
7010501	Phường 1	70105	0	\N	\N	\N	\N	\N	1	701
7010503	Phường 2	70105	0	\N	\N	\N	\N	\N	2	701
7010507	Phường 4	70105	0	\N	\N	\N	\N	\N	4	701
7010511	Phường 6	70105	0	\N	\N	\N	\N	\N	6	701
7010513	Phường 7	70105	0	\N	\N	\N	\N	\N	7	701
7010515	Phường 8	70105	0	\N	\N	\N	\N	\N	8	701
7010517	Phường 9	70105	0	\N	\N	\N	\N	\N	9	701
7010905	Phường 3	70109	0	\N	\N	\N	\N	\N	3	701
7010913	Phường 7	70109	0	\N	\N	\N	\N	\N	7	701
7010917	Phường 9	70109	0	\N	\N	\N	\N	\N	9	701
7010915	Phường 8	70109	0	\N	\N	\N	\N	\N	8	701
7010911	Phường 6	70109	0	\N	\N	\N	\N	\N	6	701
7010909	Phường 5	70109	0	\N	\N	\N	\N	\N	5	701
7010907	Phường 4	70109	0	\N	\N	\N	\N	\N	4	701
7010903	Phường 2	70109	0	\N	\N	\N	\N	\N	2	701
7010901	Phường 1	70109	0	\N	\N	\N	\N	\N	1	701
7011117	Phường 9	70111	0	\N	\N	\N	\N	\N	9	701
7011115	Phường 8	70111	0	\N	\N	\N	\N	\N	8	701
7011113	Phường 7	70111	0	\N	\N	\N	\N	\N	7	701
7011111	Phường 6	70111	0	\N	\N	\N	\N	\N	6	701
7011109	Phường 5	70111	0	\N	\N	\N	\N	\N	5	701
7011107	Phường 4	70111	0	\N	\N	\N	\N	\N	4	701
7011105	Phường 3	70111	0	\N	\N	\N	\N	\N	3	701
7011103	Phường 2	70111	0	\N	\N	\N	\N	\N	2	701
7011101	Phường 1	70111	0	\N	\N	\N	\N	\N	1	701
7011517	Phường 9	70115	0	\N	\N	\N	\N	\N	9	701
7011515	Phường 8	70115	0	\N	\N	\N	\N	\N	8	701
7011513	Phường 7	70115	0	\N	\N	\N	\N	\N	7	701
7011511	Phường 6	70115	0	\N	\N	\N	\N	\N	6	701
7011509	Phường 5	70115	0	\N	\N	\N	\N	\N	5	701
7011505	Phường 3	70115	0	\N	\N	\N	\N	\N	3	701
7011503	Phường 2	70115	0	\N	\N	\N	\N	\N	2	701
7011501	Phường 1	70115	0	\N	\N	\N	\N	\N	1	701
7011925	Phường 13	70119	0	\N	\N	\N	\N	\N	13	701
7011909	Phường 5	70119	0	\N	\N	\N	\N	\N	5	701
7011907	Phường 4	70119	0	\N	\N	\N	\N	\N	4	701
7011927	Phường 14	70119	0	\N	\N	\N	\N	\N	14	701
7011929	Phường 15	70119	0	\N	\N	\N	\N	\N	15	701
7011917	Phường 9	70119	0	\N	\N	\N	\N	\N	9	701
7011915	Phường 8	70119	0	\N	\N	\N	\N	\N	8	701
7011913	Phường 7	70119	0	\N	\N	\N	\N	\N	7	701
7011911	Phường 6	70119	0	\N	\N	\N	\N	\N	6	701
7011905	Phường 3	70119	0	\N	\N	\N	\N	\N	3	701
7011903	Phường 2	70119	0	\N	\N	\N	\N	\N	2	701
7011901	Phường 1	70119	0	\N	\N	\N	\N	\N	1	701
7012117	Phường 9	70121	0	\N	\N	\N	\N	\N	9	701
7012115	Phường 8	70121	0	\N	\N	\N	\N	\N	8	701
7012113	Phường 7	70121	0	\N	\N	\N	\N	\N	7	701
7012111	Phường 6	70121	0	\N	\N	\N	\N	\N	6	701
7012109	Phường 5	70121	0	\N	\N	\N	\N	\N	5	701
7012107	Phường 4	70121	0	\N	\N	\N	\N	\N	4	701
7012105	Phường 3	70121	0	\N	\N	\N	\N	\N	3	701
7012103	Phường 2	70121	0	\N	\N	\N	\N	\N	2	701
7012101	Phường 1	70121	0	\N	\N	\N	\N	\N	1	701
7012509	Phường 7	70125	0	\N	\N	\N	\N	\N	7	701
7012507	Phường 5	70125	0	\N	\N	\N	\N	\N	5	701
7012505	Phường 4	70125	0	\N	\N	\N	\N	\N	4	701
7012503	Phường 3	70125	0	\N	\N	\N	\N	\N	3	701
7012501	Phường 1	70125	0	\N	\N	\N	\N	\N	1	701
7012731	Phường 16	70127	0	\N	\N	\N	\N	\N	16	701
7012705	Phường 3	70127	0	\N	\N	\N	\N	\N	3	701
7012717	Phường 9	70127	0	\N	\N	\N	\N	\N	9	701
7012715	Phường 8	70127	0	\N	\N	\N	\N	\N	8	701
7012711	Phường 6	70127	0	\N	\N	\N	\N	\N	6	701
7012709	Phường 5	70127	0	\N	\N	\N	\N	\N	5	701
7012707	Phường 4	70127	0	\N	\N	\N	\N	\N	4	701
7012703	Phường 2	70127	0	\N	\N	\N	\N	\N	2	701
7013113	Phường 8	70131	0	\N	\N	\N	\N	\N	8	701
7013115	Phường 9	70131	0	\N	\N	\N	\N	\N	9	701
7013111	Phường 7	70131	0	\N	\N	\N	\N	\N	7	701
7013109	Phường 5	70131	0	\N	\N	\N	\N	\N	5	701
7013107	Phường 4	70131	0	\N	\N	\N	\N	\N	4	701
7013105	Phường 3	70131	0	\N	\N	\N	\N	\N	3	701
7013103	Phường 2	70131	0	\N	\N	\N	\N	\N	2	701
7013101	Phường 1	70131	0	\N	\N	\N	\N	\N	1	701
1010507	Phường Phan Chu Trinh	10105	0	\N	\N	\N	\N	\N	ct	101
1010535	Phường Chương Dương Độ	10105	0	\N	\N	\N	\N	\N	dd	101
1010125	BHXH Ba Dinh	10101	0	\N	\N	\N	\N	\N	bd	101
1010709	Phường Ngô Thì Nhậm	10107	0	\N	\N	\N	\N	\N	tn	101
1010749	BHXH HB	10107	0	\N	\N	\N	\N	\N	hb	101
1010943	BHXH ĐĐ	10109	0	\N	\N	\N	\N	\N	dd	101
1011123	BHXH TX	10111	0	\N	\N	\N	\N	\N	tx	101
1011315	BHXH CG	10113	0	\N	\N	\N	\N	\N	cg	101
1011553	BHXH SS	10115	0	\N	\N	\N	\N	\N	ss	101
1011749	BHXH DA	10117	0	\N	\N	\N	\N	\N	da	101
1011971	BHXH GL	10119	0	\N	\N	\N	\N	\N	gl	101
1010537	BHXH Hoàn Kiếm	10105	0	\N	\N	\N	\N	\N	hk	101
1010317	BHXH Tây Hồ	10103	0	\N	\N	\N	\N	\N	th	101
1012351	BHXH Thanh Trì	10123	0	\N	\N	\N	\N	\N	tt	101
1012133	BHXH Từ Liêm	10121	0	\N	\N	\N	\N	\N	tl	101
1010400	Không xác định	10104	0	\N	\N	\N	\N	\N	kx	101
1010401	Phường Hoàng Văn Thụ	10104	0	\N	\N	\N	\N	\N	vt	101
1010937	Phường Ngã tư sở	10109	0	\N	\N	\N	\N	\N	ts	101
1010703	Phường Lê Đại Hành	10107	0	\N	\N	\N	\N	\N	ldh	101
1010103	Phường Nguyễn Trung Trực	10101	0	\N	\N	\N	\N	\N	ntt	101
82922	Loong Hec	8292	0	\N	\N	\N	\N	\N	lh	829
1010503	Phường Trần Hưng Đạo	10105	0	\N	\N	\N	\N	\N	hd	101
1012349	Xã Tả Thanh Oai	10123	0	\N	\N	\N	\N	\N	to	101
4030103	Phường Hà Huy Tập	40301	0	\N	\N	\N	\N	\N	ht	403
1010403	Đại Kim	10104	0	\N	\N	\N	\N	\N	dk	101
1010405	Định Công	10104	0	\N	\N	\N	\N	\N	dc	101
1010407	Giáp Bát	10104	0	\N	\N	\N	\N	\N	gb	101
1010409	Hoàng Liệt	10104	0	\N	\N	\N	\N	\N	hl	101
1010411	Lĩnh Nam	10104	0	\N	\N	\N	\N	\N	ln	101
1010419	Thịnh Liệt	10104	0	\N	\N	\N	\N	\N	tl	101
1010421	Trần Phú	10104	0	\N	\N	\N	\N	\N	tp	101
1010423	Tương Mai	10104	0	\N	\N	\N	\N	\N	tm	101
1010413	Mai Động	10104	0	\N	\N	\N	\N	\N	md	101
1010417	Thanh Trì	10104	0	\N	\N	\N	\N	\N	tt	101
1010415	Tân Mai	10104	0	\N	\N	\N	\N	\N	tm	101
1010200	Không xác định	10102	0	\N	\N	\N	\N	\N	kx	101
1010203	BHXH Long Biên	10102	0	\N	\N	\N	\N	\N	lb	101
1010205	Cự Khối	10102	0	\N	\N	\N	\N	\N	ck	101
1010207	Đức Giang	10102	0	\N	\N	\N	\N	\N	dg	101
1010209	Gia Thụy	10102	0	\N	\N	\N	\N	\N	gt	101
1010211	Giang Biên	10102	0	\N	\N	\N	\N	\N	gb	101
1010213	Long Biên	10102	0	\N	\N	\N	\N	\N	lb	101
1010215	Ngọc Thụy	10102	0	\N	\N	\N	\N	\N	nt	101
1010217	Phúc Đồng	10102	0	\N	\N	\N	\N	\N	pd	101
1010219	Phúc Lợi	10102	0	\N	\N	\N	\N	\N	pl	101
1010221	Sài Đồng	10102	0	\N	\N	\N	\N	\N	sd	101
1010229	Phường Ngọc Lâm	10102	0	\N	\N	\N	\N	\N	nl	101
1010227	Phường Việt Hưng	10102	0	\N	\N	\N	\N	\N	vh	101
1010225	Phường Thượng Thanh	10102	0	\N	\N	\N	\N	\N	tt	101
1010223	Phường Thạch Bàn	10102	0	\N	\N	\N	\N	\N	tb	101
1060000	Không xác định	10600	0	\N	\N	\N	\N	\N	kx	106
1060100	Không xác định	10601	0	\N	\N	\N	\N	\N	kx	106
1060101	Phường Ninh Xá	10601	0	\N	\N	\N	\N	\N	nx	106
1060103	Phường Đáp Cầu	10601	0	\N	\N	\N	\N	\N	dc	106
1060105	Phường Thị Cầu	10601	0	\N	\N	\N	\N	\N	tc	106
1060107	Phường Tiền An	10601	0	\N	\N	\N	\N	\N	ta	106
1060109	Phường Vệ An	10601	0	\N	\N	\N	\N	\N	va	106
1060115	Xã Đại Phúc	10601	0	\N	\N	\N	\N	\N	dp	106
1060117	Xã Võ Cường	10601	0	\N	\N	\N	\N	\N	vc	106
1060300	Không xác định	10603	0	\N	\N	\N	\N	\N	kx	106
1060301	Thị trấn Chờ	10603	0	\N	\N	\N	\N	\N	c	106
1060303	Xã Dũng Liệt	10603	0	\N	\N	\N	\N	\N	dl	106
1060305	Xã Hòa Tiến	10603	0	\N	\N	\N	\N	\N	ht	106
1060307	Xã Tam Giang	10603	0	\N	\N	\N	\N	\N	tg	106
1060309	Xã Tam Đa	10603	0	\N	\N	\N	\N	\N	td	106
1060311	Xã Yên Trung	10603	0	\N	\N	\N	\N	\N	yt	106
1060313	Xã Đông Tiến	10603	0	\N	\N	\N	\N	\N	dt	106
1060315	Xã Thụy Hòa	10603	0	\N	\N	\N	\N	\N	th	106
1060317	Xã Hòa Long	10603	0	\N	\N	\N	\N	\N	hl	106
1060319	Xã Yên Phụ	10603	0	\N	\N	\N	\N	\N	yp	106
1060321	Xã Đông Phong	10603	0	\N	\N	\N	\N	\N	dp	106
1060323	Xã Vạn An	10603	0	\N	\N	\N	\N	\N	va	106
1060325	Xã Long Châu	10603	0	\N	\N	\N	\N	\N	lc	106
1060327	Xã Trung Nghĩa	10603	0	\N	\N	\N	\N	\N	tn	106
1060329	Xã Khúc Xuyên	10603	0	\N	\N	\N	\N	\N	kx	106
1060331	Xã Văn Môn	10603	0	\N	\N	\N	\N	\N	vm	106
1060333	Xã Đông Thọ	10603	0	\N	\N	\N	\N	\N	dt	106
1060335	Xã Phong Khê	10603	0	\N	\N	\N	\N	\N	pk	106
1060500	Không xác định	10605	0	\N	\N	\N	\N	\N	kx	106
1060501	Thị trấn Phố Mới	10605	0	\N	\N	\N	\N	\N	pm	106
1060503	Xã Việt Thống	10605	0	\N	\N	\N	\N	\N	vt	106
1060505	Xã Kim Chân	10605	0	\N	\N	\N	\N	\N	kc	106
1060507	Xã Đại Xuân	10605	0	\N	\N	\N	\N	\N	dx	106
1060509	Xã Nhân Hòa	10605	0	\N	\N	\N	\N	\N	nh	106
1060511	Xã Bằng An	10605	0	\N	\N	\N	\N	\N	ba	106
1060513	Xã Quế Tân	10605	0	\N	\N	\N	\N	\N	qt	106
1060515	Xã Vân Dương	10605	0	\N	\N	\N	\N	\N	vd	106
1060517	Xã Phù Lương	10605	0	\N	\N	\N	\N	\N	pl	106
1060519	Xã Phương Liễu	10605	0	\N	\N	\N	\N	\N	pl	106
1060521	Xã Phượng Mao	10605	0	\N	\N	\N	\N	\N	pm	106
1060523	Xã Việt Hùng	10605	0	\N	\N	\N	\N	\N	vh	106
1060527	Xã Phù Lãng	10605	0	\N	\N	\N	\N	\N	pl	106
1060529	Xã Ngọc Xá	10605	0	\N	\N	\N	\N	\N	nx	106
1060531	Xã Châu Phong	10605	0	\N	\N	\N	\N	\N	cp	106
1060533	Xã Cách Bi	10605	0	\N	\N	\N	\N	\N	cb	106
1060537	Xã Đào Viên	10605	0	\N	\N	\N	\N	\N	dv	106
1060539	Xã Bồng Lai	10605	0	\N	\N	\N	\N	\N	bl	106
1060541	Xã Mộ Đạo	10605	0	\N	\N	\N	\N	\N	md	106
1060543	Xã Đức Long	10605	0	\N	\N	\N	\N	\N	dl	106
1060545	Xã Chi Lăng	10605	0	\N	\N	\N	\N	\N	cl	106
1060547	Xã Hán Quảng	10605	0	\N	\N	\N	\N	\N	hq	106
1060700	Không xác định	10607	0	\N	\N	\N	\N	\N	kx	106
1060701	Thị trấn Lim	10607	0	\N	\N	\N	\N	\N	l	106
1060705	Xã Phú Lâm	10607	0	\N	\N	\N	\N	\N	pl	106
1060713	Xã Khắc Niệm	10607	0	\N	\N	\N	\N	\N	kn	106
1060715	Xã Nội Duệ	10607	0	\N	\N	\N	\N	\N	nd	106
1060721	Xã Hạp Lĩnh	10607	0	\N	\N	\N	\N	\N	hl	106
1060723	Xã Liên Bão	10607	0	\N	\N	\N	\N	\N	lb	106
1060725	Xã Nam Sơn	10607	0	\N	\N	\N	\N	\N	ns	106
1060727	Xã Lạc Vệ	10607	0	\N	\N	\N	\N	\N	lv	106
1060729	Xã Hiên Vân	10607	0	\N	\N	\N	\N	\N	hv	106
1060735	Xã Việt Đoàn	10607	0	\N	\N	\N	\N	\N	vd	106
1060737	Xã Hoàn Sơn	10607	0	\N	\N	\N	\N	\N	hs	106
1060741	Xã Phật Tích	10607	0	\N	\N	\N	\N	\N	pt	106
1060745	Xã Đại Đồng	10607	0	\N	\N	\N	\N	\N	dd	106
1060747	Xã Minh Đạo	10607	0	\N	\N	\N	\N	\N	md	106
1060749	Xã Tri Phương	10607	0	\N	\N	\N	\N	\N	tp	106
1060751	Xã Cảnh Hưng	10607	0	\N	\N	\N	\N	\N	ch	106
1060753	Xã Tân Chi	10607	0	\N	\N	\N	\N	\N	tc	106
1060801	Thị trấn Từ Sơn	10608	0	\N	\N	\N	\N	\N	ts	106
1060803	Xã Hương Mạc	10608	0	\N	\N	\N	\N	\N	hm	106
1060805	Xã Tam Sơn	10608	0	\N	\N	\N	\N	\N	ts	106
1060807	Xã Phù Khê	10608	0	\N	\N	\N	\N	\N	pk	106
1060809	Xã Tương Giang	10608	0	\N	\N	\N	\N	\N	tg	106
1060811	Xã Đồng Nguyên	10608	0	\N	\N	\N	\N	\N	dn	106
1060813	Xã Đồng Quang	10608	0	\N	\N	\N	\N	\N	dq	106
1060815	Xã Tân Hồng	10608	0	\N	\N	\N	\N	\N	th	106
1060817	Xã Châu Khê	10608	0	\N	\N	\N	\N	\N	ck	106
1060819	Xã Đình Bảng	10608	0	\N	\N	\N	\N	\N	db	106
1060821	Xã Phù Chẩn	10608	0	\N	\N	\N	\N	\N	pc	106
1060900	Không xác định	10609	0	\N	\N	\N	\N	\N	kx	106
1060901	Thị trấn Hồ	10609	0	\N	\N	\N	\N	\N	h	106
1060903	Xã Hoài Thượng	10609	0	\N	\N	\N	\N	\N	ht	106
1060905	Xã Đại Đồng Thành	10609	0	\N	\N	\N	\N	\N	ddt	106
1060907	Xã Song Hồ	10609	0	\N	\N	\N	\N	\N	sh	106
1060909	Xã Mão Điền	10609	0	\N	\N	\N	\N	\N	md	106
1060911	Xã Đình Tổ	10609	0	\N	\N	\N	\N	\N	dt	106
1060913	Xã An Bình	10609	0	\N	\N	\N	\N	\N	ab	106
1060915	Xã Trí Quả	10609	0	\N	\N	\N	\N	\N	tq	106
1041501	Tiên Châu	10415	0	\N	\N	\N	\N	\N	tc	104
1170315	Phường Tây Sơn	11703	0	\N	\N	\N	\N	\N	ts	117
2170315	xã phú hộ	21703	0	\N	\N	\N	\N	\N	ph	217
1060927	Xã Ninh Xá	10609	0	\N	\N	\N	\N	\N	nx	106
1060929	Xã Ngũ Thái	10609	0	\N	\N	\N	\N	\N	nt	106
1060931	Xã Nguyệt Đức	10609	0	\N	\N	\N	\N	\N	nd	106
1010911	Phường Ô Chợ Dừa	10109	0	\N	\N	\N	\N	\N	ocd	101
1010751	Phường Phạm Đình Hồ	10107	0	\N	\N	\N	\N	\N	pdh	101
1060933	Xã Nghĩa Đạo	10609	0	\N	\N	\N	\N	\N	nd	106
1060935	Xã Song Liễu	10609	0	\N	\N	\N	\N	\N	sl	106
1061100	Không xác định	10611	0	\N	\N	\N	\N	\N	kx	106
1061127	Xã Trung Kênh	10611	0	\N	\N	\N	\N	\N	tk	106
1061131	Xã Phú Hòa	10611	0	\N	\N	\N	\N	\N	ph	106
1061133	Xã Mỹ Hương	10611	0	\N	\N	\N	\N	\N	mh	106
1061137	Xã Quảng Phú	10611	0	\N	\N	\N	\N	\N	qp	106
1061139	Xã Lai Hạ	10611	0	\N	\N	\N	\N	\N	lh	106
1061141	Xã An Thịnh	10611	0	\N	\N	\N	\N	\N	at	106
1061143	Xã Trừng Xá	10611	0	\N	\N	\N	\N	\N	tx	106
1061145	Xã Trung Chính	10611	0	\N	\N	\N	\N	\N	tc	106
1061147	Xã Minh Tân	10611	0	\N	\N	\N	\N	\N	mt	106
1061149	Xã Phú Lương	10611	0	\N	\N	\N	\N	\N	pl	106
1061151	Xã Bình Định	10611	0	\N	\N	\N	\N	\N	bd	106
1061153	Xã Lâm Thao	10611	0	\N	\N	\N	\N	\N	lt	106
1061203	Xã Vạn Ninh	10612	0	\N	\N	\N	\N	\N	vn	106
1061205	Xã Thái Bảo	10612	0	\N	\N	\N	\N	\N	tb	106
1061207	Xã Đại Lai	10612	0	\N	\N	\N	\N	\N	dl	106
1061209	Xã Giang Sơn	10612	0	\N	\N	\N	\N	\N	gs	106
1061211	Xã Đông Cứu	10612	0	\N	\N	\N	\N	\N	dc	106
1061213	Xã Cao Đức	10612	0	\N	\N	\N	\N	\N	cd	106
1061215	Xã Song Giang	10612	0	\N	\N	\N	\N	\N	sg	106
1061217	Xã Lãng Ngâm	10612	0	\N	\N	\N	\N	\N	ln	106
1061219	Xã Bình Dương	10612	0	\N	\N	\N	\N	\N	bd	106
1061221	Xã Nhân Thắng	10612	0	\N	\N	\N	\N	\N	nt	106
1061223	Xã Đại Bái	10612	0	\N	\N	\N	\N	\N	db	106
1061225	Xã Quỳnh Phú	10612	0	\N	\N	\N	\N	\N	qp	106
1061156	Xã Tân Lãng	10611	0	\N	\N	\N	\N	\N	tl	106
1061101	Thị trấn Thứa	10611	0	\N	\N	\N	\N	\N	t	106
1060113	Phường Kinh Bắc	10601	0	\N	\N	\N	\N	\N	kb	106
1060111	Phường Vũ Ninh	10601	0	\N	\N	\N	\N	\N	vn	106
1060118	Phường Suối Hoa	10601	0	\N	\N	\N	\N	\N	sh	106
1060155	Xã Tân Lãng	10601	0	\N	\N	\N	\N	\N	tl	106
1060119	Phường Đại Phúc	10601	0	\N	\N	\N	\N	\N	dp	106
1060120	Xã Hòa Long	10601	0	\N	\N	\N	\N	\N	hl	106
1060121	Xã Hạp Lĩnh	10601	0	\N	\N	\N	\N	\N	hl	106
1060122	Xã Khúc Xuyên	10601	0	\N	\N	\N	\N	\N	kx	106
1060123	Xã Khắc Niệm	10601	0	\N	\N	\N	\N	\N	kn	106
1060124	Xã Kim Chân	10601	0	\N	\N	\N	\N	\N	kc	106
1060125	Xã Nam Sơn	10601	0	\N	\N	\N	\N	\N	ns	106
1060126	Xã Phong Khê	10601	0	\N	\N	\N	\N	\N	pk	106
1060127	Xã Vân Dương	10601	0	\N	\N	\N	\N	\N	vd	106
1060128	Xã Võ Cường	10601	0	\N	\N	\N	\N	\N	vc	106
1060129	Xã Vạn An	10601	0	\N	\N	\N	\N	\N	va	106
1060823	Xã đông ngàn	10608	0	\N	\N	\N	\N	\N	dn	106
1060549	Xã Yên Giả	10605	0	\N	\N	\N	\N	\N	yg	106
1060337	Xã Hàm Sơn	10603	0	\N	\N	\N	\N	\N	hs	106
1170117	Xã Ninh Tiến	11701	0	\N	\N	\N	\N	\N	nt	117
1170119	Xã Ninh Nhất	11701	0	\N	\N	\N	\N	\N	nn	117
1170121	Phường Ninh Sơn	11701	0	\N	\N	\N	\N	\N	ns	117
1170123	Phường Ninh Phong	11701	0	\N	\N	\N	\N	\N	np	117
1170933	TT Thiên Tôn	11709	0	\N	\N	\N	\N	\N	tt	117
1170317	Phường Tân Bình 	11703	0	\N	\N	\N	\N	\N	tb	117
1171133	Xã Yên Hưng	11711	0	\N	\N	\N	\N	\N	yh	117
1170125	Phường Ninh Phúc	11701	0	\N	\N	\N	\N	\N	np	117
1060825	Xã Trang Hạ	10608	0	\N	\N	\N	\N	\N	th	106
1170127	Phường Ninh Khánh	11701	0	\N	\N	\N	\N	\N	nk	117
1131971	xã hải thịnh	11319	0	\N	\N	\N	\N	\N	ht	113
4010313	Đông Sơn	40103	0	\N	\N	\N	\N	\N	ds	401
1010800	Không xác định	10108	0	\N	\N	\N	\N	\N	kx	101
1010801	Phường Nguyễn Trãi	10108	0	\N	\N	\N	\N	\N	nt	101
1010802	Phường Văn Mỗ	10108	0	\N	\N	\N	\N	\N	vm	101
1010803	Phường Yết Kiêu	10108	0	\N	\N	\N	\N	\N	yk	101
1010804	Phường Phúc La	10108	0	\N	\N	\N	\N	\N	pl	101
1010805	Phường Quang Trung	10108	0	\N	\N	\N	\N	\N	qt	101
1010806	Phường Vạn Phúc	10108	0	\N	\N	\N	\N	\N	vp	101
1010807	Phường Hà Cầu	10108	0	\N	\N	\N	\N	\N	hc	101
1010808	Phường Văn Khê	10108	0	\N	\N	\N	\N	\N	vk	101
1010809	Xã Kiến Hưng	10108	0	\N	\N	\N	\N	\N	kh	101
4050121	Phường Hà Huy Tập	40501	0	\N	\N	\N	\N	\N	hht	405
1011117	Phường Thanh Xuân Bắc	10111	0	\N	\N	\N	\N	\N	txb	101
1011119	Phường Thanh Xuân Nam	10111	0	\N	\N	\N	\N	\N	txn	101
1010905	Phường Quốc Tử Giám	10109	0	\N	\N	\N	\N	\N	qtg	101
2250137	Phường Đại Yên	22501	0	\N	\N	\N	\N	\N	dy	225
1010811	Phường Văn Quán	10108	0	\N	\N	\N	\N	\N	vq	101
1010813	Phường Phú Lương	10108	0	\N	\N	\N	\N	\N	pl	101
4050123	Xã Thạch Đồng	40501	0	\N	\N	\N	\N	\N	td	405
2170133	xã Thanh Đình	21701	0	\N	\N	\N	\N	\N	td	217
1012522	Thị trấn Phúc Yên	10125	0	\N	\N	\N	\N	\N	py	101
1012524	Thị trấn Xuân Hòa	10125	0	\N	\N	\N	\N	\N	xh	101
1012526	Xã Ngọc Thanh	10125	0	\N	\N	\N	\N	\N	nt	101
1012528	Xã Cao Minh	10125	0	\N	\N	\N	\N	\N	cm	101
1012530	Xã Nam Viêm	10125	0	\N	\N	\N	\N	\N	nv	101
1012532	Xã Tiền Châu	10125	0	\N	\N	\N	\N	\N	tc	101
1012534	Xã Phúc Thắng	10125	0	\N	\N	\N	\N	\N	pt	101
1012536	Xã Kim Hoa	10125	0	\N	\N	\N	\N	\N	kh	101
1012538	Xã Thạch Đà	10125	0	\N	\N	\N	\N	\N	td	101
1012540	Xã Tiến Thắng	10125	0	\N	\N	\N	\N	\N	tt	101
1012542	Xã Tự Lập	10125	0	\N	\N	\N	\N	\N	tl	101
1012544	Xã Quang Minh	10125	0	\N	\N	\N	\N	\N	qm	101
1012546	Xã Thanh Lâm	10125	0	\N	\N	\N	\N	\N	tl	101
1012548	Xã Tam Đồng	10125	0	\N	\N	\N	\N	\N	td	101
1012550	Xã Liên Mạc	10125	0	\N	\N	\N	\N	\N	lm	101
1012552	Xã Vạn Yên	10125	0	\N	\N	\N	\N	\N	vy	101
1012554	Xã Đại Thịnh	10125	0	\N	\N	\N	\N	\N	dt	101
1012556	Xã Chu Phan	10125	0	\N	\N	\N	\N	\N	cp	101
1012558	Xã Tiến Thịnh	10125	0	\N	\N	\N	\N	\N	tt	101
1012560	Xã Mê Linh	10125	0	\N	\N	\N	\N	\N	ml	101
1012562	Xã Hoàng Kim	10125	0	\N	\N	\N	\N	\N	hk	101
1012564	Xã Tráng Việt	10125	0	\N	\N	\N	\N	\N	tv	101
8252020	Không xác định	82520	0	\N	\N	\N	\N	\N	kx	825
8252220	Không xác định	82522	0	\N	\N	\N	\N	\N	kx	825
8252222	Phường Nam Thành	82522	0	\N	\N	\N	\N	\N	nt	825
8252224	Phường Him Lam	82522	0	\N	\N	\N	\N	\N	hl	825
8252226	Phường Noong Bua	82522	0	\N	\N	\N	\N	\N	nb	825
8252228	Phường Thanh Trường	82522	0	\N	\N	\N	\N	\N	tt	825
8252230	Phường Mường Thanh	82522	0	\N	\N	\N	\N	\N	mt	825
8252232	Phường Tân Thanh	82522	0	\N	\N	\N	\N	\N	tt	825
8252234	Phường Than Bình	82522	0	\N	\N	\N	\N	\N	tb	825
8252236	Xã Thanh Minh	82522	0	\N	\N	\N	\N	\N	tm	825
8252420	Không xác định	82524	0	\N	\N	\N	\N	\N	kx	825
8252620	Huyện Điện Biên	82526	0	\N	\N	\N	\N	\N	db	825
8252820	Huyện Mường Chà	82528	0	\N	\N	\N	\N	\N	mc	825
8253020	Không xác định	82530	0	\N	\N	\N	\N	\N	kx	825
8253220	Không xác định	82532	0	\N	\N	\N	\N	\N	kx	825
8253420	Không xác định	82534	0	\N	\N	\N	\N	\N	kx	825
8253620	Không xác định	82536	0	\N	\N	\N	\N	\N	kx	825
8253820	Không xác định	82538	0	\N	\N	\N	\N	\N	kx	825
8272020	Không xác định	82720	0	\N	\N	\N	\N	\N	kx	827
8272220	Không xác định	82722	0	\N	\N	\N	\N	\N	kx	827
1091520	Không xác định	10915	0	\N	\N	\N	\N	\N	kx	109
1091522	Thị trấn Văn Giang	10915	0	\N	\N	\N	\N	\N	vg	109
1091524	Xã Phụng Công	10915	0	\N	\N	\N	\N	\N	pc	109
4030420	Không xác định	40304	0	\N	\N	\N	\N	\N	kx	403
5032920	Không xác định	50329	0	\N	\N	\N	\N	\N	kx	503
5032922	Xã Tam Thái	50329	0	\N	\N	\N	\N	\N	tt	503
7014520	Không xác định	70145	0	\N	\N	\N	\N	\N	kx	701
7014522	Xá Bình Trị Đông	70145	0	\N	\N	\N	\N	\N	btd	701
1010817	La khê	10108	0	\N	\N	\N	\N	\N	lk	101
1010821	phú lãm	10108	0	\N	\N	\N	\N	\N	pl	101
217212	Không xác định	21721	0	\N	\N	\N	\N	\N	kxd	217
1010823	Phường Yên Nghĩa	10108	0	\N	\N	\N	\N	\N	yn	101
1010819	Phường Mỗ Lao	10108	0	\N	\N	\N	\N	\N	ml	101
1050565	Xã Thái Hòa	10505	0	\N	\N	\N	\N	\N	th	105
2030115	Phường Đề Thám	20301	0	\N	\N	\N	\N	\N	dt	203
2071520	Không xác định	20715	0	\N	\N	\N	\N	\N	kx	207
2071522	Xã Xuân La	20715	0	\N	\N	\N	\N	\N	xl	207
1091526	Xuân Quang	10915	0	\N	\N	\N	\N	\N	xq	109
1032720	Không xác định	10327	0	\N	\N	\N	\N	\N	kx	103
1032722	Xã An Hưng	10327	0	\N	\N	\N	\N	\N	an	103
1032724	Xã Tân Tiến	10327	0	\N	\N	\N	\N	\N	tt	103
1032726	Xã Đại Bản	10327	0	\N	\N	\N	\N	\N	db	103
82942	không xác định	8294	0	\N	\N	\N	\N	\N	kx	829
1032728	xã An Đồng	10327	0	\N	\N	\N	\N	\N	ad	103
1032730	xã An Hòa	10327	0	\N	\N	\N	\N	\N	ah	103
217232	Không xác định	21723	0	\N	\N	\N	\N	\N	kx	217
217234	Xã Tạ Xá	21723	0	\N	\N	\N	\N	\N	tx	217
1012901	Không xác định	10129	0	\N	\N	\N	\N	\N	kx	101
1012903	Phường Thượng Cát	10129	0	\N	\N	\N	\N	\N	tc	101
1012905	Phường Liên Mạc	10129	0	\N	\N	\N	\N	\N	lm	101
1012907	Phường Thụy Phương	10129	0	\N	\N	\N	\N	\N	tp	101
1012909	Phường Tây Tựu	10129	0	\N	\N	\N	\N	\N	tt	101
1012911	Phường Đông Ngạc 1	10129	0	\N	\N	\N	\N	\N	dn1	101
1012913	Phường Đông Ngạc 2	10129	0	\N	\N	\N	\N	\N	dn2	101
1012915	Phường Xuân Đỉnh 1	10129	0	\N	\N	\N	\N	\N	xd1	101
1012917	Phường Xuân Đỉnh 2	10129	0	\N	\N	\N	\N	\N	xd2	101
1012919	Phường Cổ Nhuế 1	10129	0	\N	\N	\N	\N	\N	cn1	101
1012921	Phường Cổ Nhuế 2	10129	0	\N	\N	\N	\N	\N	nc2	101
1012923	Phường Phú Diễn 1	10129	0	\N	\N	\N	\N	\N	pd1	101
1012925	Phường Phú Diễn 2	10129	0	\N	\N	\N	\N	\N	pd2	101
1012927	Phường Minh Khai	10129	0	\N	\N	\N	\N	\N	mk	101
1013101	Không xác định	10131	0	\N	\N	\N	\N	\N	kx	101
1013103	Phường Mỹ Đình 1	10131	0	\N	\N	\N	\N	\N	md1	101
1013105	Phường Trung Văn	10131	0	\N	\N	\N	\N	\N	tv	101
1013107	Phường Đại Mỗ	10131	0	\N	\N	\N	\N	\N	dm	101
1013109	Phường Tây Mỗ	10131	0	\N	\N	\N	\N	\N	tm	101
1013111	Phường Mễ Trì	10131	0	\N	\N	\N	\N	\N	mt	101
1013113	Phường Phú Đô	10131	0	\N	\N	\N	\N	\N	pd	101
1013115	Phường Mỹ Đình 2	10131	0	\N	\N	\N	\N	\N	md2	101
1013117	Phường Cầu Diễn	10131	0	\N	\N	\N	\N	\N	cd	101
1013119	Phường Xuân Phương 1	10131	0	\N	\N	\N	\N	\N	xp1	101
1013121	Phường Xuân Phương 2	10131	0	\N	\N	\N	\N	\N	xp2	101
8298020	Không xác định	82980	0	\N	\N	\N	\N	\N	kx	829
8298220	Không xác định	82982	0	\N	\N	\N	\N	\N	kx	829
8298420	Không xác định	82984	0	\N	\N	\N	\N	\N	kx	829
8298422	Loong hec	82984	0	\N	\N	\N	\N	\N	lh	829
1041503	xã Ngọc Thanh	10415	0	\N	\N	\N	\N	\N	nt	104
1061201	Xã Xuân Lai	10612	0	\N	\N	\N	\N	\N	xl	106
30222	Thị trấn Tủa Chùa	3022	0	\N	\N	\N	\N	\N	tc	302
30224	Xã Mường Phăng	3022	0	\N	\N	\N	\N	\N	mp	302
217252	Xã Gia Thanh	21725	0	\N	\N	\N	\N	\N	gt	217
104172	Xã Hải Lựu	10417	0	\N	\N	\N	\N	\N	hl	104
2210123	Phường Xương Giang	22101	0	\N	\N	\N	\N	\N	tp	221
201212	Xã Hương Sơn	20121	0	\N	\N	\N	\N	\N	hs	201
3050129	Xã Trung Minh	30501	0	\N	\N	\N	\N	\N	tm	305
2110111	Phường Nông Tiến	21101	0	\N	\N	\N	\N	\N	nt	211
1040113	Phường Khai Quang	10401	0	\N	\N	\N	\N	\N	kq	104
1031749	Xã Du Lê	10317	0	\N	\N	\N	\N	\N	dl	103
1010127	Phường Vĩnh Phúc	10101	0	\N	\N	\N	\N	\N	vp	101
103292	Phường Hưng Đạo	10329	0	\N	\N	\N	\N	\N	hd	103
103312	Phường Đông Hải 1	10331	0	\N	\N	\N	\N	\N	dh	103
1110113	Xã Tiến Hiệp	11101	0	\N	\N	\N	\N	\N	th	111
3010307	Phường Tân Phong	30103	0	\N	\N	\N	\N	\N	tp	301
1131547	Thị trấn Quất Lâm	11315	0	\N	\N	\N	\N	\N	ql	113
1060157	Thị xã Từ Sơn	10601	0	\N	\N	\N	\N	\N	ts	106
201214	Xã Xuân Giang	20121	0	\N	\N	\N	\N	\N	xg	201
1091127	Xã Tống Chân	10911	0	\N	\N	\N	\N	\N	tc	109
1150127	Xã Vũ Lạc	11501	0	\N	\N	\N	\N	\N	vl	115
1151381	Thị trấn Thanh Nê	11513	0	\N	\N	\N	\N	\N	tn	115
2151329	Thị trấn Hùng Sơn	21513	0	\N	\N	\N	\N	\N	hs	215
2252123	Phường Hưng Đạo	22521	0	\N	\N	\N	\N	\N	hd	225
225292	Xã Quảng Tân	22529	0	\N	\N	\N	\N	\N	qt	225
2050117	Phường Kim Tân	20501	0	\N	\N	\N	\N	\N	kt	205
1030329	Phường Đông Hải	10303	0	\N	\N	\N	\N	\N	dh	103
103314	Phường Đằng Lâm	10331	0	\N	\N	\N	\N	\N	dl	103
1030525	Phường Kênh Dương	10305	0	\N	\N	\N	\N	\N	kd	103
1030527	Phường Dư Hàng Kênh	10305	0	\N	\N	\N	\N	\N	dhk	103
2210125	Phường Tân Mỹ	22101	0	\N	\N	\N	\N	\N	tm	221
1110115	Phường Liêm Tuyến	11101	0	\N	\N	\N	\N	\N	lt	111
8252622	Phường Thanh Yên	82526	0	\N	\N	\N	\N	\N	ty	825
8253422	Xã Ăng Nứa	82534	0	\N	\N	\N	\N	\N	an	825
1130145	Phường Trần Quang Khải	11301	0	\N	\N	\N	\N	\N	tqk	113
403392	Xã Nghĩa Tiến	40339	0	\N	\N	\N	\N	\N	nt	403
4030137	Phường Nghi Liên	40301	0	\N	\N	\N	\N	\N	nl	403
403394	Xã Nghĩa Mỹ	40339	0	\N	\N	\N	\N	\N	nm	403
2170119	Phường Vân Phú	21701	0	\N	\N	\N	\N	\N	vp	217
217236	Xã Yên Tập	21723	0	\N	\N	\N	\N	\N	yt	217
3031955	Thị trấn Nông Trường	30319	0	\N	\N	\N	\N	\N	nt	303
1070341	Xã Bến Tắm	10703	0	\N	\N	\N	\N	\N	bt	107
104174	Xã Đôn Nhân	10417	0	\N	\N	\N	\N	\N	dn	104
4010135	Phường Quảng Cát	40101	0	\N	\N	\N	\N	\N	qc	401
1030911	Hợp Đức	10309	0	\N	\N	\N	\N	\N	hd	103
4010511	Xã Quảng Thọ	40105	0	\N	\N	\N	\N	\N	qt	401
2211737	Thị trấn Nếnh	22117	0	\N	\N	\N	\N	\N	tn	221
301212	Thị trấn Tân Uyên	30121	0	\N	\N	\N	\N	\N	tu	301
405212	Xã Thạch Châu	40521	0	\N	\N	\N	\N	\N	tc	405
1070127	Xã Tân Hưng	10701	0	\N	\N	\N	\N	\N	th	107
101332	Xã Đông Xuân	10133	0	\N	\N	\N	\N	\N	dx	101
217254	Thị trấn Phong Châu	21725	0	\N	\N	\N	\N	\N	pc	217
217256	Xã An Đạo	21725	0	\N	\N	\N	\N	\N	ad	217
1090113	Xã Liên Phương	10901	0	\N	\N	\N	\N	\N	lp	109
1070305	Phường Phả Lại	10703	0	\N	\N	\N	\N	\N	pl	107
3052120	Không xác định	30521	0	\N	\N	\N	\N	\N	kx	305
3052121	Thị trấn Cao Phong	30521	0	\N	\N	\N	\N	\N	cp	305
2131920	Không xác định	21319	0	\N	\N	\N	\N	\N	kx	213
2131921	Phường Hợp Minh	21319	0	\N	\N	\N	\N	\N	hm	213
6010717	Xã Ngọc Tụ	60107	0	\N	\N	\N	\N	\N	nt	601
403396	Phường Hòa Hiếu	40339	0	\N	\N	\N	\N	\N	hh	403
403398	Không xác định	40339	0	\N	\N	\N	\N	\N	kx	403
1171720	Không xác định	11717	0	\N	\N	\N	\N	\N	kx	117
1171721	Phường Ninh Khánh	11717	0	\N	\N	\N	\N	\N	nk	117
831221	Không xác định	8312	0	\N	\N	\N	\N	\N	kx	831
833221	không xác định	8332	0	\N	\N	\N	\N	\N	kx	833
1041505	Phường Xuân Hòa	10415	0	\N	\N	\N	\N	\N	xh	104
2050119	Phường Nam Cường	20501	0	\N	\N	\N	\N	\N	nc	205
2170953	Xã Vân Lĩnh	21709	0	\N	\N	\N	\N	\N	vl	217
2250515	Phường Phương Đông	22505	0	\N	\N	\N	\N	\N	pd	225
4010137	Xã Quảng Thịnh	40101	0	\N	\N	\N	\N	\N	qt	401
301232	Xã Sùng Phài	30123	0	\N	\N	\N	\N	\N	sp	301
403400	Phường Quang Tiến	40339	0	\N	\N	\N	\N	\N	qt	403
8252624	Xã Thanh Xương	82526	0	\N	\N	\N	\N	\N	tx	825
1032732	Thị trấn An Dương	10327	0	\N	\N	\N	\N	\N	ad	103
4050125	Xã Thạch Môn	40501	0	\N	\N	\N	\N	\N	tm	405
4030139	Phường Hưng Phúc	40301	0	\N	\N	\N	\N	\N	hp	403
1090115	Xã Hồng Nam	10901	0	\N	\N	\N	\N	\N	hn	109
303212	Xã Tô Múa	30321	0	\N	\N	\N	\N	\N	tm	303
3030771	Xã Tông Lạnh	30307	0	\N	\N	\N	\N	\N	tl	303
1130133	Phường Lộc Hạ	11301	0	\N	\N	\N	\N	\N	lh	113
\.


--
-- Name: commune_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('commune_id_seq', 1, false);


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY district (district_id, district_name, province_id, delete_flg, created_at, created_by, updated_at, updated_by, display_order, short_brief) FROM stdin;
10100	Không xác định	101	0	\N	\N	\N	\N	\N	kx
10101	Quận Ba Đình	101	0	\N	\N	\N	\N	\N	bd
10103	Quận Tây Hồ	101	0	\N	\N	\N	\N	\N	th
10105	Quận Hoàn Kiếm	101	0	\N	\N	\N	\N	\N	hk
10107	Quận Hai Bà Trưng	101	0	\N	\N	\N	\N	\N	hb
10109	Quận Đống Đa	101	0	\N	\N	\N	\N	\N	dd
10111	Quận Thanh Xuân	101	0	\N	\N	\N	\N	\N	tx
10113	Quận Cầu Giấy	101	0	\N	\N	\N	\N	\N	cg
10115	Huyện Sóc Sơn	101	0	\N	\N	\N	\N	\N	ss
10117	Huyện Đông Anh	101	0	\N	\N	\N	\N	\N	da
10119	Huyện Gia Lâm	101	0	\N	\N	\N	\N	\N	gl
10121	Huyện Từ Liêm	101	0	\N	\N	\N	\N	\N	tl
10123	Huyện Thanh Trì	101	0	\N	\N	\N	\N	\N	tt
10300	Không xác định	103	0	\N	\N	\N	\N	\N	kx
10301	Quận Hồng Bàng	103	0	\N	\N	\N	\N	\N	hb
10303	Quận Ngô Quyền	103	0	\N	\N	\N	\N	\N	nq
10305	Quận Lê Chân	103	0	\N	\N	\N	\N	\N	lc
10307	Quận Kiến An	103	0	\N	\N	\N	\N	\N	ka
10309	Thị xã Đồ Sơn	103	0	\N	\N	\N	\N	\N	ds
10311	Huyện Thuỷ Nguyên	103	0	\N	\N	\N	\N	\N	tn
10313	Huyện An Hải	103	0	\N	\N	\N	\N	\N	ah
10315	Huyện An Lão	103	0	\N	\N	\N	\N	\N	al
10317	Huyện Kiến Thuỵ	103	0	\N	\N	\N	\N	\N	kt
10319	Huyện Tiên Lãng	103	0	\N	\N	\N	\N	\N	tl
10321	Huyện Vĩnh Bảo	103	0	\N	\N	\N	\N	\N	vb
10323	Huyện Cát Hải	103	0	\N	\N	\N	\N	\N	ch
10325	Huyện Bạch Long Vĩ	103	0	\N	\N	\N	\N	\N	bl
10400	Không xác định	104	0	\N	\N	\N	\N	\N	kx
10403	Huyện Lập Thạch	104	0	\N	\N	\N	\N	\N	lt
10405	Huyện Tam Dương	104	0	\N	\N	\N	\N	\N	td
10407	Huyện Vĩnh Tường	104	0	\N	\N	\N	\N	\N	vt
10409	Huyện Yên Lạc	104	0	\N	\N	\N	\N	\N	yl
10411	Huyện Mê Linh	104	0	\N	\N	\N	\N	\N	ml
10413	Huyện Bình Xuyên	104	0	\N	\N	\N	\N	\N	bx
10500	Không xác định	105	0	\N	\N	\N	\N	\N	kx
10503	Thị xã Sơn Tây	105	0	\N	\N	\N	\N	\N	st
10505	Huyện Ba Vì	105	0	\N	\N	\N	\N	\N	bv
10507	Huyện Phúc Thọ	105	0	\N	\N	\N	\N	\N	pt
10509	Huyện Đan Phượng	105	0	\N	\N	\N	\N	\N	dp
10511	Huyện Thạch Thất	105	0	\N	\N	\N	\N	\N	tt
10513	Huyện Hoài Đức	105	0	\N	\N	\N	\N	\N	hd
10515	Huyện Quốc Oai	105	0	\N	\N	\N	\N	\N	qo
10517	Huyện Chương Mỹ	105	0	\N	\N	\N	\N	\N	cm
10519	Huyện Thanh Oai	105	0	\N	\N	\N	\N	\N	to
10521	Huyện Thường Tín	105	0	\N	\N	\N	\N	\N	tt
10523	Huyện Mỹ Đức	105	0	\N	\N	\N	\N	\N	md
10903	Huyện Mỹ Hào	109	0	\N	\N	\N	\N	\N	mv
10527	Huyện Phú Xuyên	105	0	\N	\N	\N	\N	\N	px
10600	Không xác định	106	0	\N	\N	\N	\N	\N	kx
10603	Huyện Yên Phong	106	0	\N	\N	\N	\N	\N	yp
10605	Huyện Quế Võ	106	0	\N	\N	\N	\N	\N	qv
10607	Huyện Tiên Du	106	0	\N	\N	\N	\N	\N	td
10608	Huyện Từ Sơn	106	0	\N	\N	\N	\N	\N	ts
10609	Huyện Thuận Thành	106	0	\N	\N	\N	\N	\N	tt
10611	Huyện Lương Tài	106	0	\N	\N	\N	\N	\N	lt
10612	Huyện Gia Bình	106	0	\N	\N	\N	\N	\N	gb
10700	Không xác định	107	0	\N	\N	\N	\N	\N	kx
10701	Thành phố Hải Dương	107	0	\N	\N	\N	\N	\N	hd
10705	Huyện Nam Sách	107	0	\N	\N	\N	\N	\N	ns
10707	Huyện Thanh Hà	107	0	\N	\N	\N	\N	\N	th
10709	Huyện Kinh Môn	107	0	\N	\N	\N	\N	\N	km
10711	Huyện Kim Thành	107	0	\N	\N	\N	\N	\N	kt
10713	Huyện Gia Lộc	107	0	\N	\N	\N	\N	\N	gl
10715	Huyện Tứ Kỳ	107	0	\N	\N	\N	\N	\N	tk
10717	Huyện Cẩm Giàng	107	0	\N	\N	\N	\N	\N	cg
10719	Huyện Bình Giang	107	0	\N	\N	\N	\N	\N	bg
10721	Huyện Thanh Miện	107	0	\N	\N	\N	\N	\N	tm
10723	Huyện Ninh Giang	107	0	\N	\N	\N	\N	\N	ng
10900	Không xác định	109	0	\N	\N	\N	\N	\N	kx
10902	Huyện Văn Lâm	109	0	\N	\N	\N	\N	\N	vl
10904	Huyện Yên Mỹ	109	0	\N	\N	\N	\N	\N	ym
10905	Huyện Châu Giang	109	0	\N	\N	\N	\N	\N	cg
10906	Huyện Khoái Châu	109	0	\N	\N	\N	\N	\N	kc
10907	Huyện Ân Thi	109	0	\N	\N	\N	\N	\N	at
10909	Huyện Kim Động	109	0	\N	\N	\N	\N	\N	kd
10911	Huyện Phù Cừ	109	0	\N	\N	\N	\N	\N	pc
10913	Huyện Tiên Lữ	109	0	\N	\N	\N	\N	\N	tl
11100	Không xác định	111	0	\N	\N	\N	\N	\N	kx
11103	Huyện Duy Tiên	111	0	\N	\N	\N	\N	\N	dt
11105	Huyện Kim Bảng	111	0	\N	\N	\N	\N	\N	kb
11107	Huyện Lý Nhân	111	0	\N	\N	\N	\N	\N	ln
11109	Huyện Thanh Liêm	111	0	\N	\N	\N	\N	\N	tl
11111	Huyện Bình Lục	111	0	\N	\N	\N	\N	\N	bl
11300	Không xác định	113	0	\N	\N	\N	\N	\N	kx
11301	Thành phố Nam Định	113	0	\N	\N	\N	\N	\N	nd
11303	Huyện Vụ Bản	113	0	\N	\N	\N	\N	\N	vb
11305	Huyện Mỹ Lộc	113	0	\N	\N	\N	\N	\N	ml
11307	Huyện ý Yên	113	0	\N	\N	\N	\N	\N	yy
11309	Huyện Nam Trực	113	0	\N	\N	\N	\N	\N	nt
11311	Huyện Trực Ninh	113	0	\N	\N	\N	\N	\N	tn
11313	Huyện Xuân Trường	113	0	\N	\N	\N	\N	\N	xt
11315	Huyện Giao Thủy	113	0	\N	\N	\N	\N	\N	gt
11317	Huyện Nghĩa Hưng	113	0	\N	\N	\N	\N	\N	nh
11319	Huyện Hải Hậu	113	0	\N	\N	\N	\N	\N	hh
11500	Không xác định	115	0	\N	\N	\N	\N	\N	kx
11503	Huyện Quỳnh Phụ	115	0	\N	\N	\N	\N	\N	qp
11505	Huyện Hưng Hà	115	0	\N	\N	\N	\N	\N	hh
11507	Huyện Thái Thụy	115	0	\N	\N	\N	\N	\N	tt
11509	Huyện Đông Hưng	115	0	\N	\N	\N	\N	\N	dh
11511	Huyện Vũ Thư	115	0	\N	\N	\N	\N	\N	vt
11513	Huyện Kiến Xương	115	0	\N	\N	\N	\N	\N	kx
11515	Huyện Tiền Hải	115	0	\N	\N	\N	\N	\N	th
11700	Không xác định	117	0	\N	\N	\N	\N	\N	kx
11703	Thị xã Tam Điệp	117	0	\N	\N	\N	\N	\N	td
11705	Huyện Nho Quan	117	0	\N	\N	\N	\N	\N	nq
70117	Quận 9	701	0	\N	\N	\N	\N	\N	9
11707	Huyện Gia Viễn	117	0	\N	\N	\N	\N	\N	gv
11709	Huyện Hoa Lư	117	0	\N	\N	\N	\N	\N	hl
11711	Huyện Yên Mô	117	0	\N	\N	\N	\N	\N	ym
11713	Huyện Yên Khánh	117	0	\N	\N	\N	\N	\N	yk
11715	Huyện Kim Sơn	117	0	\N	\N	\N	\N	\N	ks
20100	Không xác định	201	0	\N	\N	\N	\N	\N	kx
20103	Huyện Đồng Văn	201	0	\N	\N	\N	\N	\N	dv
20105	Huyện Mèo Vạc	201	0	\N	\N	\N	\N	\N	mv
20107	Huyện Yên Minh	201	0	\N	\N	\N	\N	\N	ym
20109	Huyện Quản Bạ	201	0	\N	\N	\N	\N	\N	qb
20111	Huyện Bắc Mê	201	0	\N	\N	\N	\N	\N	bm
20113	Huyện Hoàng Su Phì	201	0	\N	\N	\N	\N	\N	hs
20115	Huyện Vị Xuyên	201	0	\N	\N	\N	\N	\N	vx
20117	Huyện Xín Mần	201	0	\N	\N	\N	\N	\N	xm
20119	Huyện Bắc Quang	201	0	\N	\N	\N	\N	\N	bq
20300	Không xác định	203	0	\N	\N	\N	\N	\N	kx
20301	Thị xã Cao Bằng	203	0	\N	\N	\N	\N	\N	cb
20303	Huyện Bảo Lạc	203	0	\N	\N	\N	\N	\N	bl
20305	Huyện Hà Quảng	203	0	\N	\N	\N	\N	\N	hq
20307	Huyện Thông Nông	203	0	\N	\N	\N	\N	\N	tn
40501	Thành phố Hà Tĩnh	405	0	\N	\N	\N	\N	\N	ht
11501	Thành phố Thái Bình	115	0	\N	\N	\N	\N	\N	tb
10401	Thành phố Vĩnh Yên	104	0	\N	\N	\N	\N	\N	vy
11101	Thành Phố Phủ Lý	111	0	\N	\N	\N	\N	\N	pl
10901	Thành phố Hưng Yên	109	0	\N	\N	\N	\N	\N	hy
10703	Thị xã Chí Linh	107	0	\N	\N	\N	\N	\N	cl
20309	Huyện Trà Lĩnh	203	0	\N	\N	\N	\N	\N	tl
20311	Huyện Trùng Khánh	203	0	\N	\N	\N	\N	\N	tk
20313	Huyện Nguyên Bình	203	0	\N	\N	\N	\N	\N	nb
20315	Huyện Hoà An	203	0	\N	\N	\N	\N	\N	ha
20317	Huyện Quảng Hoà	203	0	\N	\N	\N	\N	\N	qh
20319	Huyện Hạ Lang	203	0	\N	\N	\N	\N	\N	hl
20321	Huyện Thạch An	203	0	\N	\N	\N	\N	\N	ta
20500	Không xác định	205	0	\N	\N	\N	\N	\N	kx
20503	Thị xã Cam Đường	205	0	\N	\N	\N	\N	\N	cd
20505	Huyện Mường Khương	205	0	\N	\N	\N	\N	\N	mk
20507	Huyện Bát Xát	205	0	\N	\N	\N	\N	\N	bx
20509	Huyện Bắc Hà	205	0	\N	\N	\N	\N	\N	bh
20511	Huyện Bảo Thắng	205	0	\N	\N	\N	\N	\N	bt
20513	Huyện Sa Pa	205	0	\N	\N	\N	\N	\N	sp
20515	Huyện Bảo Yên	205	0	\N	\N	\N	\N	\N	by
20517	Huyện Than Uyên	205	0	\N	\N	\N	\N	\N	tu
20519	Huyện Văn Bàn	205	0	\N	\N	\N	\N	\N	vb
20700	Không xác định	207	0	\N	\N	\N	\N	\N	kx
20701	Thị xã Bắc Kạn	207	0	\N	\N	\N	\N	\N	bk
20703	Huyện Ba Bể	207	0	\N	\N	\N	\N	\N	bb
20705	Huyện Ngân Sơn	207	0	\N	\N	\N	\N	\N	ns
20707	Huyện Chợ Đồn	207	0	\N	\N	\N	\N	\N	cd
20709	Huyện Na Rì	207	0	\N	\N	\N	\N	\N	nr
20711	Huyện Bạch Thông	207	0	\N	\N	\N	\N	\N	bt
20713	Huyện Chợ Mới	207	0	\N	\N	\N	\N	\N	cm
20900	Không xác định	209	0	\N	\N	\N	\N	\N	kx
20903	Huyện Tràng Định	209	0	\N	\N	\N	\N	\N	td
20905	Huyện Văn Lãng	209	0	\N	\N	\N	\N	\N	vl
20907	Huyện Bình Gia	209	0	\N	\N	\N	\N	\N	bg
20909	Huyện Bắc Sơn	209	0	\N	\N	\N	\N	\N	bs
20911	Huyện Văn Quan	209	0	\N	\N	\N	\N	\N	vq
20913	Huyện Cao Lộc	209	0	\N	\N	\N	\N	\N	cl
20915	Huyện Lộc Bình	209	0	\N	\N	\N	\N	\N	lb
20917	Huyện Chi Lăng	209	0	\N	\N	\N	\N	\N	cl
20919	Huyện Đình Lập	209	0	\N	\N	\N	\N	\N	dl
20921	Huyện Hữu Lũng	209	0	\N	\N	\N	\N	\N	hl
21100	Không xác định	211	0	\N	\N	\N	\N	\N	kx
21103	Huyện Nà Hang	211	0	\N	\N	\N	\N	\N	nh
21105	Huyện Chiêm Hóa	211	0	\N	\N	\N	\N	\N	ch
21107	Huyện Hàm Yên	211	0	\N	\N	\N	\N	\N	hy
21109	Huyện Yên Sơn	211	0	\N	\N	\N	\N	\N	ys
21111	Huyện Sơn Dương	211	0	\N	\N	\N	\N	\N	sd
21300	Không xác định	213	0	\N	\N	\N	\N	\N	kx
21303	Thị xã Nghĩa Lộ	213	0	\N	\N	\N	\N	\N	nl
21305	Huyện Lục Yên	213	0	\N	\N	\N	\N	\N	ly
21307	Huyện Văn Yên	213	0	\N	\N	\N	\N	\N	vy
21309	Huyện Mù Căng Chải	213	0	\N	\N	\N	\N	\N	mc
21311	Huyện Trấn Yên	213	0	\N	\N	\N	\N	\N	ty
21313	Huyện Yên Bình	213	0	\N	\N	\N	\N	\N	yb
21315	Huyện Văn Chấn	213	0	\N	\N	\N	\N	\N	vc
21317	Huyện Trạm Tấu	213	0	\N	\N	\N	\N	\N	tt
21500	Không xác định	215	0	\N	\N	\N	\N	\N	kx
21501	Thành phố Thái Nguyên	215	0	\N	\N	\N	\N	\N	tn
21503	Thị xã Sông Công	215	0	\N	\N	\N	\N	\N	sc
21505	Huyện Định Hóa	215	0	\N	\N	\N	\N	\N	dh
21507	Huyện Võ Nhai	215	0	\N	\N	\N	\N	\N	vn
21509	Huyện Phú Lương	215	0	\N	\N	\N	\N	\N	pl
21511	Huyện Đồng Hỷ	215	0	\N	\N	\N	\N	\N	dh
21513	Huyện Đại Từ	215	0	\N	\N	\N	\N	\N	dt
21515	Huyện Phú Bình	215	0	\N	\N	\N	\N	\N	pb
21700	Không xác định	217	0	\N	\N	\N	\N	\N	kx
21701	Thành phố Việt Trì	217	0	\N	\N	\N	\N	\N	vt
21703	Thị xã Phú Thọ	217	0	\N	\N	\N	\N	\N	pt
21705	Huyện Đoan Hùng	217	0	\N	\N	\N	\N	\N	dh
21707	Huyện Hạ Hoà	217	0	\N	\N	\N	\N	\N	hh
21709	Huyện Thanh Ba	217	0	\N	\N	\N	\N	\N	tb
21711	Huyện Phong Châu	217	0	\N	\N	\N	\N	\N	pc
21712	Huyện Lâm Thao	217	0	\N	\N	\N	\N	\N	lt
21713	Huyện Sông Thao	217	0	\N	\N	\N	\N	\N	st
21715	Huyện Yên Lập	217	0	\N	\N	\N	\N	\N	yl
21717	Huyện Tam Thanh	217	0	\N	\N	\N	\N	\N	tt
21718	Huyện Thanh Thuỷ	217	0	\N	\N	\N	\N	\N	tt
21719	Huyện Thanh Sơn	217	0	\N	\N	\N	\N	\N	ts
22100	Không xác định	221	0	\N	\N	\N	\N	\N	kx
22103	Huyện Yên Thế	221	0	\N	\N	\N	\N	\N	yt
22105	Huyện Tân Yên	221	0	\N	\N	\N	\N	\N	ty
22107	Huyện Lục Ngạn	221	0	\N	\N	\N	\N	\N	ln
22109	Huyện Hiệp Hòa	221	0	\N	\N	\N	\N	\N	hh
22111	Huyện Lạng Giang	221	0	\N	\N	\N	\N	\N	lg
22113	Huyện Sơn Động	221	0	\N	\N	\N	\N	\N	sd
22115	Huyện Lục Nam	221	0	\N	\N	\N	\N	\N	ln
22117	Huyện Việt Yên	221	0	\N	\N	\N	\N	\N	vy
22119	Huyện Yên Dũng	221	0	\N	\N	\N	\N	\N	yd
22500	Không xác định	225	0	\N	\N	\N	\N	\N	kx
22501	Thành phố Hạ Long	225	0	\N	\N	\N	\N	\N	hl
22503	Thị xã Cẩm Phả	225	0	\N	\N	\N	\N	\N	cp
22507	Huyện Bình Liêu	225	0	\N	\N	\N	\N	\N	bl
22511	Huyện Quảng Hà	225	0	\N	\N	\N	\N	\N	qh
22513	Huyện Tiên Yên	225	0	\N	\N	\N	\N	\N	ty
22515	Huyện Ba Chẽ	225	0	\N	\N	\N	\N	\N	bc
22517	Huyện Vân Đồn	225	0	\N	\N	\N	\N	\N	vd
22519	Huyện Hoành Bồ	225	0	\N	\N	\N	\N	\N	hb
22523	Huyện Cô Tô	225	0	\N	\N	\N	\N	\N	ct
22525	Huyện Yên Hưng	225	0	\N	\N	\N	\N	\N	yh
30100	Không xác định	301	0	\N	\N	\N	\N	\N	kx
30101	Thị xã Điện Biên Phủ	301	0	\N	\N	\N	\N	\N	db
30105	Huyện Mường Tè	301	0	\N	\N	\N	\N	\N	mt
30107	Huyện Phong Thổ	301	0	\N	\N	\N	\N	\N	pt
30109	Huyện Sìn Hồ	301	0	\N	\N	\N	\N	\N	sh
30111	Huyện Mường Lay	301	0	\N	\N	\N	\N	\N	ml
30113	Huyện Tủa Chùa	301	0	\N	\N	\N	\N	\N	tc
30115	Huyện Tuần Giáo	301	0	\N	\N	\N	\N	\N	tg
30117	Huyện Điện Biên	301	0	\N	\N	\N	\N	\N	db
30119	Huyện Điện Biên Đông	301	0	\N	\N	\N	\N	\N	db
30300	Không xác định	303	0	\N	\N	\N	\N	\N	kx
30301	Thị xã Sơn La	303	0	\N	\N	\N	\N	\N	sl
30303	Huyện Quỳnh Nhai	303	0	\N	\N	\N	\N	\N	qn
30305	Huyện Mường La	303	0	\N	\N	\N	\N	\N	ml
30307	Huyện Thuận Châu	303	0	\N	\N	\N	\N	\N	tc
30309	Huyện Bắc Yên	303	0	\N	\N	\N	\N	\N	by
30311	Huyện Phù Yên	303	0	\N	\N	\N	\N	\N	py
30313	Huyện Mai Sơn	303	0	\N	\N	\N	\N	\N	ms
30315	Huyện Sông Mã	303	0	\N	\N	\N	\N	\N	sm
30317	Huyện Yên Châu	303	0	\N	\N	\N	\N	\N	yc
30319	Huyện Mộc Châu	303	0	\N	\N	\N	\N	\N	mc
30500	Không xác định	305	0	\N	\N	\N	\N	\N	kx
30503	Huyện Đà Bắc	305	0	\N	\N	\N	\N	\N	db
30505	Huyện Mai Châu	305	0	\N	\N	\N	\N	\N	mc
30507	Huyện Kỳ Sơn	305	0	\N	\N	\N	\N	\N	ks
30509	Huyện Lương Sơn	305	0	\N	\N	\N	\N	\N	ls
30511	Huyện Kim Bôi	305	0	\N	\N	\N	\N	\N	kb
30501	Thành phố Hòa Bình	305	0	\N	\N	\N	\N	\N	hb
21101	Thành phố Tuyên Quang	211	0	\N	\N	\N	\N	\N	tq
22509	Thành phố Móng Cái	225	0	\N	\N	\N	\N	\N	mc
30103	Thành phố Lai Châu	301	0	\N	\N	\N	\N	\N	lc
22521	Thị xã Đông Triều	225	0	\N	\N	\N	\N	\N	dt
20501	Thành phố Lào Cai	205	0	\N	\N	\N	\N	\N	lc
22505	Thành phố Uông Bí	225	0	\N	\N	\N	\N	\N	ub
21517	Thị xã Phổ Yên	215	0	\N	\N	\N	\N	\N	py
21301	Thành phố Yên Bái	213	0	\N	\N	\N	\N	\N	yb
30513	Huyện Tân Lạc	305	0	\N	\N	\N	\N	\N	tl
30515	Huyện Lạc Sơn	305	0	\N	\N	\N	\N	\N	ls
30517	Huyện Lạc Thủy	305	0	\N	\N	\N	\N	\N	lt
30519	Huyện Yên Thủy	305	0	\N	\N	\N	\N	\N	yt
40100	Không xác định	401	0	\N	\N	\N	\N	\N	kx
40101	Thành phố Thanh Hóa	401	0	\N	\N	\N	\N	\N	th
40103	Thị xã Bỉm Sơn	401	0	\N	\N	\N	\N	\N	bs
40105	Thị xã Sầm Sơn	401	0	\N	\N	\N	\N	\N	ss
40107	Huyện Mường Lát	401	0	\N	\N	\N	\N	\N	ml
40109	Huyện Quan Hóa	401	0	\N	\N	\N	\N	\N	qh
40111	Huyện Quan Sơn	401	0	\N	\N	\N	\N	\N	qs
40113	Huyện Bá Thước	401	0	\N	\N	\N	\N	\N	bt
40115	Huyện Cẩm Thủy	401	0	\N	\N	\N	\N	\N	ct
40117	Huyện Lang Chánh	401	0	\N	\N	\N	\N	\N	lc
40119	Huyện Thạch Thành	401	0	\N	\N	\N	\N	\N	tt
40121	Huyện Ngọc Lạc	401	0	\N	\N	\N	\N	\N	nl
40123	Huyện Thường Xuân	401	0	\N	\N	\N	\N	\N	tx
40125	Huyện Như Xuân	401	0	\N	\N	\N	\N	\N	nx
40127	Huyện Như Thanh	401	0	\N	\N	\N	\N	\N	nt
40129	Huyện Vĩnh Lộc	401	0	\N	\N	\N	\N	\N	vl
40131	Huyện Hà Trung	401	0	\N	\N	\N	\N	\N	ht
40133	Huyện Nga Sơn	401	0	\N	\N	\N	\N	\N	ns
40135	Huyện Yên Định	401	0	\N	\N	\N	\N	\N	yd
40137	Huyện Thọ Xuân	401	0	\N	\N	\N	\N	\N	tx
40139	Huyện Hậu Lộc	401	0	\N	\N	\N	\N	\N	hl
40141	Huyện Thiệu Hoá	401	0	\N	\N	\N	\N	\N	th
40143	Huyện Hoằng Hóa	401	0	\N	\N	\N	\N	\N	hh
40145	Huyện Đông Sơn	401	0	\N	\N	\N	\N	\N	ds
40147	Huyện Triệu Sơn	401	0	\N	\N	\N	\N	\N	ts
40149	Huyện Quảng Xương	401	0	\N	\N	\N	\N	\N	qx
40151	Huyện Nông Cống	401	0	\N	\N	\N	\N	\N	nc
40153	Huyện Tĩnh Gia	401	0	\N	\N	\N	\N	\N	tg
40300	Không xác định	403	0	\N	\N	\N	\N	\N	kx
40303	Thị xã Cửa Lò	403	0	\N	\N	\N	\N	\N	cl
40305	Huyện Quế Phong	403	0	\N	\N	\N	\N	\N	qp
40307	Huyện Quỳ Châu	403	0	\N	\N	\N	\N	\N	qc
40309	Huyện Kỳ Sơn	403	0	\N	\N	\N	\N	\N	ks
40311	Huyện Quỳ Hợp	403	0	\N	\N	\N	\N	\N	qh
40313	Huyện Nghĩa Đàn	403	0	\N	\N	\N	\N	\N	nd
40315	Huyện Tương Dương	403	0	\N	\N	\N	\N	\N	td
40317	Huyện Quỳnh Lưu	403	0	\N	\N	\N	\N	\N	ql
40319	Huyện Tân Kỳ	403	0	\N	\N	\N	\N	\N	tk
40321	Huyện Con Cuông	403	0	\N	\N	\N	\N	\N	cc
40323	Huyện Yên Thành	403	0	\N	\N	\N	\N	\N	yt
40325	Huyện Diễn Châu	403	0	\N	\N	\N	\N	\N	dc
40327	Huyện Anh Sơn	403	0	\N	\N	\N	\N	\N	as
40329	Huyện Đô Lương	403	0	\N	\N	\N	\N	\N	dl
40331	Huyện Thanh Chương	403	0	\N	\N	\N	\N	\N	tc
40333	Huyện Nghi Lộc	403	0	\N	\N	\N	\N	\N	nl
40335	Huyện Nam Đàn	403	0	\N	\N	\N	\N	\N	nd
40337	Huyện Hưng Nguyên	403	0	\N	\N	\N	\N	\N	hn
40500	Không xác định	405	0	\N	\N	\N	\N	\N	kx
40503	Thị xã Hồng Lĩnh	405	0	\N	\N	\N	\N	\N	hl
40505	Huyện Nghi Xuân	405	0	\N	\N	\N	\N	\N	nx
40507	Huyện Đức Thọ	405	0	\N	\N	\N	\N	\N	dt
40509	Huyện Hương Sơn	405	0	\N	\N	\N	\N	\N	hs
40511	Huyện Can Lộc	405	0	\N	\N	\N	\N	\N	cl
40513	Huyện Thạch Hà	405	0	\N	\N	\N	\N	\N	th
40515	Huyện Cẩm Xuyên	405	0	\N	\N	\N	\N	\N	cx
40517	Huyện Hương Khê	405	0	\N	\N	\N	\N	\N	hk
40519	Huyện Kỳ Anh	405	0	\N	\N	\N	\N	\N	ka
40700	Không xác định	407	0	\N	\N	\N	\N	\N	kx
40703	Huyện Tuyên Hóa	407	0	\N	\N	\N	\N	\N	th
40705	Huyện Minh Hóa	407	0	\N	\N	\N	\N	\N	mh
40707	Huyện Quảng Trạch	407	0	\N	\N	\N	\N	\N	qt
40709	Huyện Bố Trạch	407	0	\N	\N	\N	\N	\N	bt
40711	Huyện Quảng Ninh	407	0	\N	\N	\N	\N	\N	qn
40713	Huyện Lệ Thủy	407	0	\N	\N	\N	\N	\N	lt
40900	Không xác định	409	0	\N	\N	\N	\N	\N	kx
40901	Thị xã Đông Hà	409	0	\N	\N	\N	\N	\N	dh
40903	Thị xã Quảng Trị	409	0	\N	\N	\N	\N	\N	qt
40905	Huyện Vĩnh Linh	409	0	\N	\N	\N	\N	\N	vl
40907	Huyện Gio Linh	409	0	\N	\N	\N	\N	\N	gl
40909	Huyện Cam Lộ	409	0	\N	\N	\N	\N	\N	cl
40911	Huyện Triệu Phong	409	0	\N	\N	\N	\N	\N	tp
40913	Huyện Hải Lăng	409	0	\N	\N	\N	\N	\N	hl
40915	Huyện Hướng Hóa	409	0	\N	\N	\N	\N	\N	hh
40917	Huyện Đa Krông	409	0	\N	\N	\N	\N	\N	dk
41100	Không xác định	411	0	\N	\N	\N	\N	\N	kx
41101	Thành phố Huế	411	0	\N	\N	\N	\N	\N	ph
41103	Huyện Phong Điền	411	0	\N	\N	\N	\N	\N	pd
41105	Huyện Quảng Điền	411	0	\N	\N	\N	\N	\N	qd
41107	Huyện Hương Trà	411	0	\N	\N	\N	\N	\N	ht
41109	Huyện Phú Vang	411	0	\N	\N	\N	\N	\N	pv
41111	Huyện Hương Thủy	411	0	\N	\N	\N	\N	\N	ht
41113	Huyện Phú Lộc	411	0	\N	\N	\N	\N	\N	pl
41115	Huyện A Lưới	411	0	\N	\N	\N	\N	\N	al
41117	Huyện Nam Đông	411	0	\N	\N	\N	\N	\N	nd
50100	Không xác định	501	0	\N	\N	\N	\N	\N	kx
50101	Quận Hải Châu	501	0	\N	\N	\N	\N	\N	hc
50103	Quận Thanh Khê	501	0	\N	\N	\N	\N	\N	tk
50105	Quận Sơn Trà	501	0	\N	\N	\N	\N	\N	st
50107	Quận Ngũ Hành Sơn	501	0	\N	\N	\N	\N	\N	nh
50109	Quận Liên Chiểu	501	0	\N	\N	\N	\N	\N	lc
50111	Huyện Hoà Vang	501	0	\N	\N	\N	\N	\N	hv
50113	Huyện Đảo Hoàng Sa	501	0	\N	\N	\N	\N	\N	dh
50300	Không xác định	503	0	\N	\N	\N	\N	\N	kx
50301	Thị xã Tam Kỳ	503	0	\N	\N	\N	\N	\N	tk
50303	Thị xã Hội An	503	0	\N	\N	\N	\N	\N	ha
50305	Huyện Hiên	503	0	\N	\N	\N	\N	\N	0h
50307	Huyện Đại Lộc	503	0	\N	\N	\N	\N	\N	dl
50309	Huyện Điện Bàn	503	0	\N	\N	\N	\N	\N	db
50311	Huyện Duy Xuyên	503	0	\N	\N	\N	\N	\N	dx
50313	Huyện Giằng	503	0	\N	\N	\N	\N	\N	0g
50315	Huyện Thăng Bình	503	0	\N	\N	\N	\N	\N	tb
50317	Huyện Quế Sơn	503	0	\N	\N	\N	\N	\N	qs
50319	Huyện Hiệp Đức	503	0	\N	\N	\N	\N	\N	hd
50321	Huyện Tiên Phước	503	0	\N	\N	\N	\N	\N	tp
50323	Huyện Phước Sơn	503	0	\N	\N	\N	\N	\N	ps
50325	Huyện Núi Thành	503	0	\N	\N	\N	\N	\N	nt
50327	Huyện Trà My	503	0	\N	\N	\N	\N	\N	tm
50500	Không xác định	505	0	\N	\N	\N	\N	\N	kx
50501	Thị xã Quảng Ngãi	505	0	\N	\N	\N	\N	\N	qn
50503	Huyện Lý Sơn	505	0	\N	\N	\N	\N	\N	ls
50505	Huyện Bình Sơn	505	0	\N	\N	\N	\N	\N	bs
50507	Huyện Trà Bồng	505	0	\N	\N	\N	\N	\N	tb
50509	Huyện Sơn Tịnh	505	0	\N	\N	\N	\N	\N	st
50511	Huyện Sơn Tây	505	0	\N	\N	\N	\N	\N	st
50513	Huyện Sơn Hà	505	0	\N	\N	\N	\N	\N	sh
50515	Huyện Tư Nghĩa	505	0	\N	\N	\N	\N	\N	tn
50517	Huyện Nghĩa Hành	505	0	\N	\N	\N	\N	\N	nh
50519	Huyện Minh Long	505	0	\N	\N	\N	\N	\N	ml
50521	Huyện Mộ Đức	505	0	\N	\N	\N	\N	\N	md
50523	Huyện Đức Phổ	505	0	\N	\N	\N	\N	\N	dp
50525	Huyện Ba Tơ	505	0	\N	\N	\N	\N	\N	bt
50700	Không xác định	507	0	\N	\N	\N	\N	\N	kx
50701	Thành phố Qui Nhơn	507	0	\N	\N	\N	\N	\N	qn
50703	Huyện An Lão	507	0	\N	\N	\N	\N	\N	al
50705	Huyện Hoài Nhơn	507	0	\N	\N	\N	\N	\N	hn
50707	Huyện Hoài Ân	507	0	\N	\N	\N	\N	\N	ha
82520	Không xác định	825	0	\N	\N	\N	\N	\N	kx
50709	Huyện Phù Mỹ	507	0	\N	\N	\N	\N	\N	pm
50711	Huyện Vĩnh Thạnh	507	0	\N	\N	\N	\N	\N	vt
50713	Huyện Phù Cát	507	0	\N	\N	\N	\N	\N	pc
50715	Huyện Tây Sơn	507	0	\N	\N	\N	\N	\N	ts
50717	Huyện An Nhơn	507	0	\N	\N	\N	\N	\N	an
50719	Huyện Tuy Phước	507	0	\N	\N	\N	\N	\N	tp
50721	Huyện Vân Canh	507	0	\N	\N	\N	\N	\N	vc
50900	Không xác định	509	0	\N	\N	\N	\N	\N	kx
50901	Thị xã Tuy Hòa	509	0	\N	\N	\N	\N	\N	th
50903	Huyện Đồng Xuân	509	0	\N	\N	\N	\N	\N	dx
50905	Huyện Sông Cầu	509	0	\N	\N	\N	\N	\N	sc
50907	Huyện Tuy An	509	0	\N	\N	\N	\N	\N	ta
50909	Huyện Sơn Hòa	509	0	\N	\N	\N	\N	\N	sh
50911	Huyện Tuy Hòa	509	0	\N	\N	\N	\N	\N	th
50913	Huyện Sông Hinh	509	0	\N	\N	\N	\N	\N	sh
51100	Không xác định	511	0	\N	\N	\N	\N	\N	kx
51101	Thành phố Nha Trang	511	0	\N	\N	\N	\N	\N	nt
51103	Huyện Vạn Ninh	511	0	\N	\N	\N	\N	\N	vn
51105	Huyện Ninh Hòa	511	0	\N	\N	\N	\N	\N	nh
51107	Huyện Diên Khánh	511	0	\N	\N	\N	\N	\N	dk
51109	Huyện Cam Ranh	511	0	\N	\N	\N	\N	\N	cr
51111	Huyện Khánh Vĩnh	511	0	\N	\N	\N	\N	\N	kv
51113	Huyện Khánh Sơn	511	0	\N	\N	\N	\N	\N	ks
51115	Huyện Trường Sa	511	0	\N	\N	\N	\N	\N	ts
60100	Không xác định	601	0	\N	\N	\N	\N	\N	kx
60101	Thị xã Kon Tum	601	0	\N	\N	\N	\N	\N	kt
60103	Huyện Đắk Glei	601	0	\N	\N	\N	\N	\N	dg
60105	Huyện Ngọc Hồi	601	0	\N	\N	\N	\N	\N	nh
60107	Huyện Đắk Tô	601	0	\N	\N	\N	\N	\N	dt
60109	Huyện Kon Plông	601	0	\N	\N	\N	\N	\N	kp
60111	Huyện Đak Hà	601	0	\N	\N	\N	\N	\N	dh
60113	Huyện Sa Thầy	601	0	\N	\N	\N	\N	\N	st
60300	Không xác định	603	0	\N	\N	\N	\N	\N	kx
60301	Thị xã Pleiku	603	0	\N	\N	\N	\N	\N	pl
60303	Huyện KBang	603	0	\N	\N	\N	\N	\N	kb
60305	Huyện Mang Yang	603	0	\N	\N	\N	\N	\N	my
60307	Huyện Chư Păh	603	0	\N	\N	\N	\N	\N	cp
60309	Huyện Ia Grai	603	0	\N	\N	\N	\N	\N	ig
60311	Huyện An Khê	603	0	\N	\N	\N	\N	\N	ak
60313	Huyện Kông Chro	603	0	\N	\N	\N	\N	\N	kc
60315	Huyện Đức Cơ	603	0	\N	\N	\N	\N	\N	dc
60317	Huyện Chư Prông	603	0	\N	\N	\N	\N	\N	cp
60319	Huyện Chư Sê	603	0	\N	\N	\N	\N	\N	cs
60321	Huyện Ayun Pa	603	0	\N	\N	\N	\N	\N	ap
60323	Huyện Krông Pa	603	0	\N	\N	\N	\N	\N	kp
60500	Không xác định	605	0	\N	\N	\N	\N	\N	kx
60501	Thành phố Buôn Ma Thuột	605	0	\N	\N	\N	\N	\N	bm
60503	Huyện Ea H leo	605	0	\N	\N	\N	\N	\N	eh
60505	Huyện Ea Súp	605	0	\N	\N	\N	\N	\N	es
60507	Huyện Krông Năng	605	0	\N	\N	\N	\N	\N	kn
60509	Huyện Krông Búk	605	0	\N	\N	\N	\N	\N	kb
60511	Huyện Buôn Đôn	605	0	\N	\N	\N	\N	\N	bd
60513	Huyện Cư M gar	605	0	\N	\N	\N	\N	\N	cm
60515	Huyện Ea Kar	605	0	\N	\N	\N	\N	\N	ek
60517	Huyện M Đrắk	605	0	\N	\N	\N	\N	\N	m
60519	Huyện Krông Pắc	605	0	\N	\N	\N	\N	\N	kp
60521	Huyện Cư Jút	605	0	\N	\N	\N	\N	\N	cj
60523	Huyện Krông A Na	605	0	\N	\N	\N	\N	\N	ka
60525	Huyện Krông Bông	605	0	\N	\N	\N	\N	\N	kb
60527	Huyện Đắk Mil	605	0	\N	\N	\N	\N	\N	dm
60529	Huyện Krông Nô	605	0	\N	\N	\N	\N	\N	kn
60531	Huyện Lắk	605	0	\N	\N	\N	\N	\N	lk
60533	Huyện Đắk R Lấp	605	0	\N	\N	\N	\N	\N	dr
60535	Huyện Đắk Nông	605	0	\N	\N	\N	\N	\N	dn
70100	Không xác định	701	0	\N	\N	\N	\N	\N	kx
70101	Quận 1	701	0	\N	\N	\N	\N	\N	1
70103	Quận 2	701	0	\N	\N	\N	\N	\N	2
70105	Quận 3	701	0	\N	\N	\N	\N	\N	3
70111	Quận 6	701	0	\N	\N	\N	\N	\N	6
70113	Quận 7	701	0	\N	\N	\N	\N	\N	7
70115	Quận 8	701	0	\N	\N	\N	\N	\N	8
70119	Quận 10	701	0	\N	\N	\N	\N	\N	10
70121	Quận 11	701	0	\N	\N	\N	\N	\N	11
70123	Quận 12	701	0	\N	\N	\N	\N	\N	12
70125	Quận Gò Vấp	701	0	\N	\N	\N	\N	\N	gv
70127	Quận Tân Bình	701	0	\N	\N	\N	\N	\N	tb
70129	Quận Bình Thạnh	701	0	\N	\N	\N	\N	\N	bt
70131	Quận Phú Nhuận	701	0	\N	\N	\N	\N	\N	pn
70133	Quận Thủ Đức	701	0	\N	\N	\N	\N	\N	td
70135	Huyện Củ Chi	701	0	\N	\N	\N	\N	\N	cc
70137	Huyện Hóc Môn	701	0	\N	\N	\N	\N	\N	hm
70139	Huyện Bình Chánh	701	0	\N	\N	\N	\N	\N	bc
70141	Huyện Nhà Bè	701	0	\N	\N	\N	\N	\N	nb
70143	Huyện Cần Giờ	701	0	\N	\N	\N	\N	\N	cg
70300	Không xác định	703	0	\N	\N	\N	\N	\N	kx
70301	Thành phố Đà Lạt	703	0	\N	\N	\N	\N	\N	dl
70303	Thị xã Bảo Lộc	703	0	\N	\N	\N	\N	\N	bl
70305	Huyện Lạc Dương	703	0	\N	\N	\N	\N	\N	ld
70307	Huyện Đơn Dương	703	0	\N	\N	\N	\N	\N	dd
70309	Huyện Đức Trọng	703	0	\N	\N	\N	\N	\N	dt
70311	Huyện Lâm Hà	703	0	\N	\N	\N	\N	\N	lh
70313	Huyện Bảo Lâm	703	0	\N	\N	\N	\N	\N	bl
70315	Huyện Di Linh	703	0	\N	\N	\N	\N	\N	dl
70317	Huyện Đạ Huoai	703	0	\N	\N	\N	\N	\N	dh
70319	Huyện Đạ Tẻh	703	0	\N	\N	\N	\N	\N	dt
70321	Huyện Cát Tiên	703	0	\N	\N	\N	\N	\N	ct
70500	Không xác định	705	0	\N	\N	\N	\N	\N	kx
70501	Thị xã Phan Rang-Tháp Chàm	705	0	\N	\N	\N	\N	\N	pr
70503	Huyện Ninh Sơn	705	0	\N	\N	\N	\N	\N	ns
70505	Huyện Ninh Hải	705	0	\N	\N	\N	\N	\N	nh
70507	Huyện Ninh Phước	705	0	\N	\N	\N	\N	\N	np
70700	Không xác định	707	0	\N	\N	\N	\N	\N	kx
70701	Huyện Đồng Phú	707	0	\N	\N	\N	\N	\N	dp
70703	Huyện Phước Long	707	0	\N	\N	\N	\N	\N	pl
70705	Huyện Lộc Ninh	707	0	\N	\N	\N	\N	\N	ln
70707	Huyện Bù Đăng	707	0	\N	\N	\N	\N	\N	bd
70709	Huyện Bình Long	707	0	\N	\N	\N	\N	\N	bl
70900	Không xác định	709	0	\N	\N	\N	\N	\N	kx
70901	Thị xã Tây Ninh	709	0	\N	\N	\N	\N	\N	tn
70903	Huyện Tân Biên	709	0	\N	\N	\N	\N	\N	tb
70905	Huyện Tân Châu	709	0	\N	\N	\N	\N	\N	tc
70907	Huyện Dương Minh Châu	709	0	\N	\N	\N	\N	\N	dm
70909	Huyện Châu Thành	709	0	\N	\N	\N	\N	\N	ct
70911	Huyện Hòa Thành	709	0	\N	\N	\N	\N	\N	ht
70913	Huyện Bến Cầu	709	0	\N	\N	\N	\N	\N	bc
70915	Huyện Gò Dầu	709	0	\N	\N	\N	\N	\N	gd
70917	Huyện Trảng Bàng	709	0	\N	\N	\N	\N	\N	tb
71100	Không xác định	711	0	\N	\N	\N	\N	\N	kx
71101	Thị xã Thủ Dầu Một	711	0	\N	\N	\N	\N	\N	td
71103	Huyện Bến Cát	711	0	\N	\N	\N	\N	\N	bc
71105	Huyện Tân Uyên	711	0	\N	\N	\N	\N	\N	tu
71107	Huyện Thuận An	711	0	\N	\N	\N	\N	\N	ta
71300	Không xác định	713	0	\N	\N	\N	\N	\N	kx
71301	Thành phố Biên Hòa	713	0	\N	\N	\N	\N	\N	bh
71303	Huyện Tân Phú	713	0	\N	\N	\N	\N	\N	tp
71305	Huyện Định Quán	713	0	\N	\N	\N	\N	\N	dq
71307	Huyện Vĩnh Cừu	713	0	\N	\N	\N	\N	\N	vc
71309	Huyện Thống Nhất	713	0	\N	\N	\N	\N	\N	tn
71311	Huyện Long Khánh	713	0	\N	\N	\N	\N	\N	lk
71315	Huyện Long Thành	713	0	\N	\N	\N	\N	\N	lt
71317	Huyện Nhơn Trạch	713	0	\N	\N	\N	\N	\N	nt
71500	Không xác định	715	0	\N	\N	\N	\N	\N	kx
71501	Thị xã Phan Thiết	715	0	\N	\N	\N	\N	\N	pt
71503	Huyện Tuy Phong	715	0	\N	\N	\N	\N	\N	tp
71505	Huyện Bắc Bình	715	0	\N	\N	\N	\N	\N	bb
71507	Huyện Hàm Thuận Bắc	715	0	\N	\N	\N	\N	\N	ht
71509	Huyện Hàm Thuận Nam	715	0	\N	\N	\N	\N	\N	ht
71511	Huyện Tánh Linh	715	0	\N	\N	\N	\N	\N	tl
71513	Huyện Hàm Tân	715	0	\N	\N	\N	\N	\N	ht
71515	Huyện Đức Linh	715	0	\N	\N	\N	\N	\N	dl
71517	Huyện Phú Quí	715	0	\N	\N	\N	\N	\N	pq
71700	Không xác định	717	0	\N	\N	\N	\N	\N	kx
71703	Thị xã Bà Rịa	717	0	\N	\N	\N	\N	\N	br
71705	Huyện Châu Đức	717	0	\N	\N	\N	\N	\N	cd
71707	Huyện Xuyên Mộc	717	0	\N	\N	\N	\N	\N	xm
71709	Huyện Tân Thành	717	0	\N	\N	\N	\N	\N	tt
71713	Huyện Côn Đảo	717	0	\N	\N	\N	\N	\N	cd
80100	Không xác định	801	0	\N	\N	\N	\N	\N	kx
80101	Thị xã Tân An	801	0	\N	\N	\N	\N	\N	ta
80103	Huyện Tân Hưng	801	0	\N	\N	\N	\N	\N	th
80105	Huyện Vĩnh Hưng	801	0	\N	\N	\N	\N	\N	vh
80107	Huyện Mộc Hóa	801	0	\N	\N	\N	\N	\N	mh
80109	Huyện Tân Thạnh	801	0	\N	\N	\N	\N	\N	tt
80111	Huyện Thạnh Hóa	801	0	\N	\N	\N	\N	\N	th
80113	Huyện Đức Huệ	801	0	\N	\N	\N	\N	\N	dh
80115	Huyện Đức Hòa	801	0	\N	\N	\N	\N	\N	dh
80117	Huyện Bến Lức	801	0	\N	\N	\N	\N	\N	bl
80119	Huyện Thủ Thừa	801	0	\N	\N	\N	\N	\N	tt
80121	Huyện Châu Thành	801	0	\N	\N	\N	\N	\N	ct
80123	Huyện Tân Trụ	801	0	\N	\N	\N	\N	\N	tt
80125	Huyện Cần Đước	801	0	\N	\N	\N	\N	\N	cd
80127	Huyện Cần Giuộc	801	0	\N	\N	\N	\N	\N	cg
80300	Không xác định	803	0	\N	\N	\N	\N	\N	kx
80301	Thị xã Cao Lãnh	803	0	\N	\N	\N	\N	\N	cl
80303	Thị xã Sa Đéc	803	0	\N	\N	\N	\N	\N	sd
80305	Huyện Tân Hồng	803	0	\N	\N	\N	\N	\N	th
80307	Huyện Hồng Ngự	803	0	\N	\N	\N	\N	\N	hn
80309	Huyện Tam Nông	803	0	\N	\N	\N	\N	\N	tn
80311	Huyện Thanh Bình	803	0	\N	\N	\N	\N	\N	tb
80313	Huyện Tháp Mười	803	0	\N	\N	\N	\N	\N	tm
80315	Huyện Cao Lãnh	803	0	\N	\N	\N	\N	\N	cl
80317	Huyện Lấp Vò	803	0	\N	\N	\N	\N	\N	lv
80319	Huyện Lai Vung	803	0	\N	\N	\N	\N	\N	lv
80321	Huyện Châu Thành	803	0	\N	\N	\N	\N	\N	ct
80500	Không xác định	805	0	\N	\N	\N	\N	\N	kx
80501	Thị xã Long Xuyên	805	0	\N	\N	\N	\N	\N	lx
80503	Thị xã Châu Đốc	805	0	\N	\N	\N	\N	\N	cd
80505	Huyện An Phú	805	0	\N	\N	\N	\N	\N	ap
80507	Huyện Tân Châu	805	0	\N	\N	\N	\N	\N	tc
80509	Huyện Phú Tân	805	0	\N	\N	\N	\N	\N	pt
80511	Huyện Châu Phú	805	0	\N	\N	\N	\N	\N	cp
80513	Huyện Tịnh Biên	805	0	\N	\N	\N	\N	\N	tb
80515	Huyện Tri Tôn	805	0	\N	\N	\N	\N	\N	tt
80517	Huyện Chợ Mới	805	0	\N	\N	\N	\N	\N	cm
80519	Huyện Châu Thành	805	0	\N	\N	\N	\N	\N	ct
80521	Huyện Thoại Sơn	805	0	\N	\N	\N	\N	\N	ts
80700	Không xác định	807	0	\N	\N	\N	\N	\N	kx
80701	Thành phố Mỹ Tho	807	0	\N	\N	\N	\N	\N	mt
80703	Thị xã Gò Công	807	0	\N	\N	\N	\N	\N	gc
80705	Huyện Tân Phước	807	0	\N	\N	\N	\N	\N	tp
80707	Huyện Châu Thành	807	0	\N	\N	\N	\N	\N	ct
80709	Huyện Cai Lậy	807	0	\N	\N	\N	\N	\N	cl
80711	Huyện Chợ Gạo	807	0	\N	\N	\N	\N	\N	cg
80713	Huyện Cái Bè	807	0	\N	\N	\N	\N	\N	cb
80715	Huyện Gò Công Tây	807	0	\N	\N	\N	\N	\N	gc
80717	Huyện Gò Công Đông	807	0	\N	\N	\N	\N	\N	gc
80900	Không xác định	809	0	\N	\N	\N	\N	\N	kx
80901	Thị xã Vĩnh Long	809	0	\N	\N	\N	\N	\N	vl
80903	Huyện Long Hồ	809	0	\N	\N	\N	\N	\N	lh
80905	Huyện Mang Thít	809	0	\N	\N	\N	\N	\N	mt
80907	Huyện Bình Minh	809	0	\N	\N	\N	\N	\N	bm
80909	Huyện Tam Bình	809	0	\N	\N	\N	\N	\N	tb
80911	Huyện Trà Ôn	809	0	\N	\N	\N	\N	\N	to
80913	Huyện Vũng Liêm	809	0	\N	\N	\N	\N	\N	vl
81100	Không xác định	811	0	\N	\N	\N	\N	\N	kx
81101	Thị xã Bến Tre	811	0	\N	\N	\N	\N	\N	bt
81103	Huyện Châu Thành	811	0	\N	\N	\N	\N	\N	ct
81105	Huyện Chợ Lách	811	0	\N	\N	\N	\N	\N	cl
81107	Huyện Mỏ Cày	811	0	\N	\N	\N	\N	\N	mc
81109	Huyện Giồng Trôm	811	0	\N	\N	\N	\N	\N	gt
81111	Huyện Bình Đại	811	0	\N	\N	\N	\N	\N	bd
81113	Huyện Ba Tri	811	0	\N	\N	\N	\N	\N	bt
81115	Huyện Thạnh Phú	811	0	\N	\N	\N	\N	\N	tp
81300	Không xác định	813	0	\N	\N	\N	\N	\N	kx
81301	Thị xã Rạch Giá	813	0	\N	\N	\N	\N	\N	rg
81303	Huyện Hà Tiên	813	0	\N	\N	\N	\N	\N	ht
81305	Huyện Hòn Đất	813	0	\N	\N	\N	\N	\N	hd
81307	Huyện Tân Hiệp	813	0	\N	\N	\N	\N	\N	th
81309	Huyện Châu Thành	813	0	\N	\N	\N	\N	\N	ct
81311	Huyện Giồng Giềng	813	0	\N	\N	\N	\N	\N	gg
81313	Huyện Gò Quao	813	0	\N	\N	\N	\N	\N	gq
81315	Huyện An Biên	813	0	\N	\N	\N	\N	\N	ab
81317	Huyện An Minh	813	0	\N	\N	\N	\N	\N	am
81319	Huyện Vĩnh Thuận	813	0	\N	\N	\N	\N	\N	vt
81321	Huyện Phú Quốc	813	0	\N	\N	\N	\N	\N	pq
81323	Huyện Kiên Hải	813	0	\N	\N	\N	\N	\N	kh
81325	Thị xã Hà Tiên	813	0	\N	\N	\N	\N	\N	ht
81500	Không xác định	815	0	\N	\N	\N	\N	\N	kx
81501	Thành phố Cần Thơ	815	0	\N	\N	\N	\N	\N	ct
81502	Thị xã Vị Thanh	815	0	\N	\N	\N	\N	\N	vt
81503	Huyện Thốt Nốt	815	0	\N	\N	\N	\N	\N	tn
81505	Huyện Ô Môn	815	0	\N	\N	\N	\N	\N	om
81507	Huyện Châu Thành	815	0	\N	\N	\N	\N	\N	ct
81509	Huyện Phụng Hiệp	815	0	\N	\N	\N	\N	\N	ph
81511	Huyện Vị Thuỷ	815	0	\N	\N	\N	\N	\N	vt
81513	Huyện Long Mỹ	815	0	\N	\N	\N	\N	\N	lm
81700	Không xác định	817	0	\N	\N	\N	\N	\N	kx
81701	Thị xã Trà Vinh	817	0	\N	\N	\N	\N	\N	tv
81703	Huyện Càng Long	817	0	\N	\N	\N	\N	\N	cl
81705	Huyện Châu Thành	817	0	\N	\N	\N	\N	\N	ct
81707	Huyện Cầu Kè	817	0	\N	\N	\N	\N	\N	ck
81709	Huyện Tiểu Cần	817	0	\N	\N	\N	\N	\N	tc
81711	Huyện Cầu Ngang	817	0	\N	\N	\N	\N	\N	cn
81713	Huyện Trà Cú	817	0	\N	\N	\N	\N	\N	tc
81715	Huyện Duyên Hải	817	0	\N	\N	\N	\N	\N	dh
81900	Không xác định	819	0	\N	\N	\N	\N	\N	kx
81901	Thị xã Sóc Trăng	819	0	\N	\N	\N	\N	\N	st
81903	Huyện Kế Sách	819	0	\N	\N	\N	\N	\N	ks
81905	Huyện Long Phú	819	0	\N	\N	\N	\N	\N	lp
81907	Huyện Mỹ Tú	819	0	\N	\N	\N	\N	\N	mt
81909	Huyện Mỹ Xuyên	819	0	\N	\N	\N	\N	\N	mx
81911	Huyện Thạnh Trị	819	0	\N	\N	\N	\N	\N	tt
81913	Huyện Vĩnh Châu	819	0	\N	\N	\N	\N	\N	vc
82100	Không xác định	821	0	\N	\N	\N	\N	\N	kx
82101	Thị xã Bạc Liêu	821	0	\N	\N	\N	\N	\N	bl
82103	Huyện Hồng Dân	821	0	\N	\N	\N	\N	\N	hd
82105	Huyện Vĩnh Lợi	821	0	\N	\N	\N	\N	\N	vl
82107	Huyện Giá Rai	821	0	\N	\N	\N	\N	\N	gr
82300	Không xác định	823	0	\N	\N	\N	\N	\N	kx
82301	Thị xã Cà Mau	823	0	\N	\N	\N	\N	\N	cm
82303	Huyện Thới Bình	823	0	\N	\N	\N	\N	\N	tb
82305	Huyện U Minh	823	0	\N	\N	\N	\N	\N	um
82307	Huyện Trần Văn Thời	823	0	\N	\N	\N	\N	\N	tv
82309	Huyện Cái Nước	823	0	\N	\N	\N	\N	\N	cn
82311	Huyện Đầm Dơi	823	0	\N	\N	\N	\N	\N	dd
82313	Huyện Ngọc Hiển	823	0	\N	\N	\N	\N	\N	nh
71701	Thành phố Vũng Tàu	717	0	\N	\N	\N	\N	\N	vt
71711	H.LĐất	717	0	\N	\N	\N	\N	\N	ld
70109	Quận 5	701	0	\N	\N	\N	\N	\N	5
70107	Quận 4	701	0	\N	\N	\N	\N	\N	4
71313	Huyện Xuân Lộc	713	0	\N	\N	\N	\N	\N	xl
10102	Quận Long Biên	101	0	\N	\N	\N	\N	\N	lb
10104	Quận Hoàng Mai	101	0	\N	\N	\N	\N	\N	hm
40301	Thành phố Vinh	403	0	\N	\N	\N	\N	\N	pv
40304	Huyện Quỳnh Lưu	403	0	\N	\N	\N	\N	\N	ql
11701	TP Ninh Bình	117	0	\N	\N	\N	\N	\N	nb
10125	Huyện Mê Linh	101	0	\N	\N	\N	\N	\N	ml
10415	Thị Xã Phúc Yên	104	0	\N	\N	\N	\N	\N	py
70145	Quận Bình Tân	701	0	\N	\N	\N	\N	\N	bt
8292	Năm Quảng	829	0	\N	\N	\N	\N	\N	nq
50329	Phú Ninh	503	0	\N	\N	\N	\N	\N	pn
10108	Quận Hà Đông	101	0	\N	\N	\N	\N	\N	hd
10915	Huyện Văn Giang	109	0	\N	\N	\N	\N	\N	vg
10525	Huyện Ứng Hòa	105	0	\N	\N	\N	\N	\N	uh
10127	Huyện Lương Sơn	101	0	\N	\N	\N	\N	\N	ls
82522	Thành phố Điện Biên	825	0	\N	\N	\N	\N	\N	db
82524	Huyện Tuần Giáo	825	0	\N	\N	\N	\N	\N	tg
82526	Huyện Điện Biên	825	0	\N	\N	\N	\N	\N	db
82528	Huyện Mường Chà	825	0	\N	\N	\N	\N	\N	mc
82530	Huyện Tủa Chùa	825	0	\N	\N	\N	\N	\N	tc
82532	Huyện Điện Biên Đông	825	0	\N	\N	\N	\N	\N	db
82534	Huyện Mường Ảng	825	0	\N	\N	\N	\N	\N	ma
82538	Huyện Mường Nhé	825	0	\N	\N	\N	\N	\N	mn
82720	Không xác định	827	0	\N	\N	\N	\N	\N	kx
82722	Đắk R Lấp	827	0	\N	\N	\N	\N	\N	dr
21721	Phú Lương	217	0	\N	\N	\N	\N	\N	pl
20715	Huyện Pác Nậm	207	0	\N	\N	\N	\N	\N	pn
10327	Huyện An Dương	103	0	\N	\N	\N	\N	\N	ad
8294	Phông xa lỳ	829	0	\N	\N	\N	\N	\N	xl
22527	Huyện Quảng Yên	225	0	\N	\N	\N	\N	\N	qy
10129	Quận Bắc Từ Liêm	101	0	\N	\N	\N	\N	\N	btl
10131	Quận Nam Từ Liêm	101	0	\N	\N	\N	\N	\N	ntl
21723	Huyện Cẩm Khê	217	0	\N	\N	\N	\N	\N	ck
82536	Thị xã Mường Lay	825	0	\N	\N	\N	\N	\N	ml
82980	Không xác định	829	0	\N	\N	\N	\N	\N	kx
82982	Phông xa lỳ	829	0	\N	\N	\N	\N	\N	px
82984	Năm quảng	829	0	\N	\N	\N	\N	\N	nq
3022	Huyện Tủa Chùa	302	0	\N	\N	\N	\N	\N	tc
3024	Huyện Điện Biên	302	0	\N	\N	\N	\N	\N	db
21725	Huyện Phù Ninh	217	0	\N	\N	\N	\N	\N	pn
10417	Huyện Sông Lô	104	0	\N	\N	\N	\N	\N	sl
20101	Thành phố Hà Giang	201	0	\N	\N	\N	\N	\N	hg
22101	Thành phố Bắc Giang	221	0	\N	\N	\N	\N	\N	bg
20121	Huyện Quang Bình	201	0	\N	\N	\N	\N	\N	qb
10329	Quận Dương Kinh	103	0	\N	\N	\N	\N	\N	dk
10331	Quận Hải An	103	0	\N	\N	\N	\N	\N	ha
10601	Thành phố Bắc Ninh	106	0	\N	\N	\N	\N	\N	bn
22529	Thị xã Ba Đồn	225	0	\N	\N	\N	\N	\N	bd
20901	Thành phố Lạng Sơn	209	0	\N	\N	\N	\N	\N	ls
40339	Thị xã Thái Hòa	403	0	\N	\N	\N	\N	\N	th
30121	Huyện Tân Uyên	301	0	\N	\N	\N	\N	\N	tu
40521	Huyện Lộc Hà	405	0	\N	\N	\N	\N	\N	lh
10133	Huyện Quốc Oai	101	0	\N	\N	\N	\N	\N	qo
30521	Huyện Cao Phong	305	0	\N	\N	\N	\N	\N	cp
21319	Thành phố Yên Bái	213	0	\N	\N	\N	\N	\N	yb
11717	Thị xã Ninh Bình	117	0	\N	\N	\N	\N	\N	nb
8312	Không xác định	831	0	\N	\N	\N	\N	\N	kx
8332	không xác định	833	0	\N	\N	\N	\N	\N	kx
40701	Thành phố Đồng Hới	407	0	\N	\N	\N	\N	\N	dh
30123	Huyện Tam Đường	301	0	\N	\N	\N	\N	\N	td
30321	Huyện Vân Hồ	303	0	\N	\N	\N	\N	\N	vh
\.


--
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('district_id_seq', 1, false);


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY doctor (doctor_id, first_name, last_name, department, mobile, graduated_from, avatar, major, age, years_of_experience, date_of_birth, delete_flg, created_at, created_by, updated_at, updated_by, display_order, sex, address, email) FROM stdin;
1	Bùi Thị Hải Đường	haiduong	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
2	BSCK I: Nguyễn Thị Lan	nguyenlan	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
3	Vũ Việt Anh	vvanh	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
4	Nguyễn Diệu Linh	dieulinh	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
5	Nguyễn Văn Hùng	ngvanhung	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
6	Phạm Hồng Khoa	phamhongkhoa	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
7	Nguyễn Quốc Dũng	quocdung	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
8	Nguyễn Thị Thu Hiền	thuhien	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
9	Bùi Nhật Minh	nhatminh	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
10	Trần Thị Hưng	tthungkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
11	Nguyễn Văn Thắng	nvthang	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
12	Nguyễn Minh Khánh	minhkhanh	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
13	Nguyễn Văn Lợi	nvloi123	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
14	Đặng Tiến Giang	giangkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
15	Ngô Quang Cử	nqcu	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
16	Nguyễn Trung Chính	ntchinh	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
17	Hoàng Thu Trang	trangkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
18	Trần Thành Long	tthanhlong	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
19	Nguyễn Thị Thúy	thuykb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
20	Nguyễn Nhật Tân	tankb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
21	Phí Thùy Dương	duongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
22	Trần Thị Thanh Thúy	thanhthuykb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
23	Nguyễn Ngọc Duy	duykb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
24	Phạm Thị Oanh	oanhkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
25	Phạm Thị Việt Hương	viethuongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
26	Đặng Tiến Khoa	dtkhoa123	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
27	TS. Nguyễn Khắc Kiểm	nkkiem123	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
28	Phan Lê Thắng	pltthang123	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
29	Nguyễn Trường Giang	giangntkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
30	Ths Hoàng Thu Hằng	hthangkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
31	Nguyễn Thị Hương	nghuong	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
32	Nguyễn Thị Hương	huongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
33	Chu Hoàng Hạnh	hanhkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
34	Lê Việt	levietkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
35	Phạm Thế Anh	anhnt	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
36	Phạm Lâm Sơn	plsonkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
37	Nguyễn Minh Trọng	trongnm	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
38	Nguyễn Thị Thanh Loan	loanntt	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
39	Hoàng Anh Dũng	dungkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
40	Đoàn Thị Tuyết	tuyetkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
41	Nguyễn Văn Hải	ngvanhai	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
42	Hoàng Mạnh Thắng	manhthangkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
43	Nghiêm Thanh Hà	hantpk	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
44	Đỗ Thị Thanh Tâm	thanhtamkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
45	Trần Mai Phương	tmphuongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
46	Phạm Thị Thu Trang	drtrangkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
47	Nguyễn Thị Bích Phượng	bichphuongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
48	Nguyễn Văn Cao	caokb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
49	Vũ Hà Thanh	vhthanhkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
50	Nguyễn Thu Phương	ntphuong	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
51	Hoàng Thị Cúc	htcuckb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
52	Nguyễn Thu Trang	trangn3	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
53	Ngô Xuân Quý	quykb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
54	Trần Tuấn Thành	tuanthanhkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
55	Đặng Văn Mạnh	manhkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
56	Ma Chính Lâm	lamkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
57	Từ Thị Thanh Hương	thanhhuongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
58	Nguyễn Quỳnh Hương	quynhhuongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
59	Đỗ Đình Lộc	locdd	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
60	Nguyễn Thái Học	thaihoc	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
61	Phạm Quốc Đạt	pqdatkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
62	Nguyễn Tiến Hùng	tienhung	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
63	Nguyễn Đức Liên	duclien	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
64	Nguyễn Đức Lợi	ndloi	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
65	Phạm Gia Dự	giadu	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
66	Đặng Thị Việt Bắc	vietbackb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
67	Lê Hồng Quang	lhquang	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
68	Phùng Văn Dũng	dungpv	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
69	Phạm Thị Hà	phamha	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
70	Nguyễn Thanh Hà	thanh hà	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
71	Nguyễn Quang Thái	quangthai	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
72	Ngô Thanh Tùng	thanhtung	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
73	Nguyễn Văn Tuyền	vantuyen	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
74	Đoàn Lực	doanluc	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
75	Ngô Vỹ Dung	ngovydung	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
76	PGS.TS. Bùi Diệu	buidieu	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
77	Hàn Thị Vân Thanh	vanthanhkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
78	TS Vũ Hải	vuhai	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
79	Phạm Thế Anh	anhptkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
80	Vũ Việt Anh	vietanh	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
81	Hoàng Mạnh Hùng	hunghm	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
82	Trần Hoàng Điệp	diepht	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
83	Nguyễn Minh Trọng	nmtrongkb	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
84	Hoàng Văn Thi	hvthi	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
85	Ths. Hàn Thị Thanh Bình	httbinh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
86	TS. Hàn Thị Vân Thanh	htvthanh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
87	Ths. Phạm Thị Diệu Hà	pthiha	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
88	Ths. Phan Lê Thắng	plethang	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
89	Ths. Phạm Tuấn Anh	ptanh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
90	Ths. Đỗ Huyền Nga	dhuyennga	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
91	Ths. Đỗ Anh Tuấn	datuan	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
92	TS. Đỗ Anh Tú	danhtu	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
93	Ths. Đặng Thị Việt Bắc	dtvbac	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
94	Ths. Đoàn Trọng Tú	dttu	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
95	TS. Đoàn Lực	doanlucbs	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
96	Ths. Hà Hải Nam	hhnam	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
97	TS. Lê Hồng Quang	lhongquang	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
98	BSCK2. Nguyễn Văn Tuyền	nvantuyen	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
99	PGS.TS Ngô Thanh Tùng	nttung	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
100	TS. Phạm Văn Bình	pvbinh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
101	BSCK2. Ngô Vĩ Dung	nvdung	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
102	PGS.TS. Nguyễn Tuyết Mai	ntuyetmai	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
103	BSCK2. Nguyễn Văn Hùng	nvhung	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
104	Ths. Phạm Lâm Sơn	plamson	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
105	TS. Lê Thanh Đức	ltduc	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
106	TS. Phạm Thế Anh	ptheanh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
107	Ths. Tô Anh Dũng	tadung	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
108	TS. Trần Thắng	tranthangbs	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
109	Th.s Trần Giang Châu	tgiangchau	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
110	TS. Trần Văn Công	tvcong	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
111	PGS.TS. Vũ Hồng Thăng	vhongthang	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
112	Ths. Vũ Quang Toản	vquangtoan	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
113	TS. Vũ Hải	vuhaibs	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
114	Ts. Đỗ Hùng Kiên	dhungkien	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
115	PGS.TS. Bùi Diệu	bdieu	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
116	Ths. Lê Trí Chinh	ltrichinh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
117	BSCK2. Lê Thị Vân	ltvan	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
118	Ths. Nguyễn Công Hoàng	nconghoang	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
119	PGS.TS. Nguyễn Đại Bình	ndbinh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
120	Ths. Nguyễn Đức Huân	ndhuan	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
121	Ths. Nguyễn Đức Liên	ndlien	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
122	TS. Nguyễn Diệu Linh	ndlinh	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
123	Ths. Nguyễn Đức Lợi	nducloi	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
124	Ths. Nguyễn Khắc Kiểm	nkhackiem	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
125	TS. Nguyễn Quang Thái	nqthai	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
126	Th.s Nguyễn Thanh Hà	ntha	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
127	BSCK2. Nguyễn Thị Hương Giang	nthgiang	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
128	TS. Nguyễn Thị Sang	nthisang	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
129	Ths. Nguyễn Tiến Hùng	ntienhung	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
130	TS. Nguyễn Tiến Quang	ntquang	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
131	TS. Nguyễn Thị Thái Hòa	ntthaihoa	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
132	Bùi Thị Hải Đường	bthd	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
133	Phạm THị Việt Hương	ptvhuong	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	\N
134	Hoàng Văn Thi	vanthi	1	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	1	\N	\N
\.


--
-- Data for Name: doctor_calendar; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY doctor_calendar (calendar_id, working_day, morningexam, year, month, week, weekday, doctors, clinic_id, delete_flg, created_at, created_by, updated_at, updated_by, display_order) FROM stdin;
\.


--
-- Name: doctor_calendar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('doctor_calendar_id_seq', 1, false);


--
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('doctor_id_seq', 3, true);


--
-- Data for Name: medical_test; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY medical_test (test_id, test_name, test_desc, test_type, test_index, test_avatar, delete_flg, created_at, created_by, updated_at, updated_by, display_order) FROM stdin;
1	aaaa	cccc	qqq	qqq	\N	0	2017-08-28 12:14:06.721	\N	\N	\N	\N
2	jjjj	hj	hhh	hhhh	\N	0	2017-08-28 12:14:17.88	\N	\N	\N	\N
3	jjjjj	jjjjj	jjjj	jjjj	\N	0	2017-08-28 12:14:47.1	\N	\N	\N	\N
\.


--
-- Name: medical_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('medical_test_id_seq', 3, true);


--
-- Data for Name: pathological; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY pathological (payment_id, pathological_id, pathological_name, pathological_specialist, pathological_define, pathological_reason, pathological_formation, pathological_cell_biology, pathological_clinical, pathological_treatment, pathological_avatar, delete_flg, created_at, created_by, updated_at, updated_by, display_order) FROM stdin;
2	1	Ung thư vòm họng	Ung bướu	Ung thư vòm họng	Ăn uống bừa bãi	Ăn phải các tác nhân gây bệnh	Họng sinh ra các khối u ác tính	khối u ác tính sinh sôi nảy nở đến khi người bệnh ngủm thì dừng	Hoá trị, xạ trị	\N	0	2017-08-28 08:15:30.185	\N	\N	\N	\N
\.


--
-- Name: pathological_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('pathological_id_seq', 2, true);


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY patient (patient_id, first_name, last_name, patient_code, register_date, address, phone, email, date_of_birth, cmnd, sex, morning_exam, avatar, email_notification, sms_notification, examination_reason, examination_id, examination_ids, delete_flg, created_at, created_by, updated_at, updated_by, display_order, province_id, district_id, commune_id, firstname, surname, midname, occupation, ethnic, deptid, roomid, examtype, objectid, examdate) FROM stdin;
1	\N	\N	\N	\N	ABC	122121	ABC@gmail.com	\N	312121	1	1	\N	1	1	\N	\N	\N	0	2017-08-31 08:59:14.979	\N	\N	\N	\N	103	10301	1030105	A	A	A	2	2	2	2	\N	1	\N
\.


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('patient_id_seq', 1, true);


--
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY province (province_id, province_name, delete_flg, created_at, created_by, updated_at, updated_by, display_order, short_brief) FROM stdin;
101	Thành phố Hà Nội	0	\N	\N	\N	\N	\N	hn
103	Thành phố Hải Phòng	0	\N	\N	\N	\N	\N	hp
107	Tỉnh Hải Dương	0	\N	\N	\N	\N	\N	hd
111	Tỉnh Hà Nam	0	\N	\N	\N	\N	\N	hn
113	Tỉnh Nam Định	0	\N	\N	\N	\N	\N	nd
115	Tỉnh Thái Bình	0	\N	\N	\N	\N	\N	tb
201	Tỉnh Hà Giang	0	\N	\N	\N	\N	\N	hg
203	Tỉnh Cao Bằng	0	\N	\N	\N	\N	\N	cb
207	Tỉnh Bắc Kạn	0	\N	\N	\N	\N	\N	bc
209	Tỉnh Lạng Sơn	0	\N	\N	\N	\N	\N	ls
211	Tỉnh Tuyên Quang	0	\N	\N	\N	\N	\N	tq
213	Tỉnh Yên Bái	0	\N	\N	\N	\N	\N	yb
215	Tỉnh Thái Nguyên	0	\N	\N	\N	\N	\N	tn
217	Tỉnh Phú Thọ	0	\N	\N	\N	\N	\N	pt
104	Tỉnh Vĩnh Phúc	0	\N	\N	\N	\N	\N	vp
221	Tỉnh Bắc Giang	0	\N	\N	\N	\N	\N	bg
106	Tỉnh Bắc Ninh	0	\N	\N	\N	\N	\N	bn
225	Tỉnh Quảng Ninh	0	\N	\N	\N	\N	\N	qn
301	Tỉnh Lai Châu	0	\N	\N	\N	\N	\N	lc
303	Tỉnh Sơn La	0	\N	\N	\N	\N	\N	sl
305	Tỉnh Hòa Bình	0	\N	\N	\N	\N	\N	hb
401	Tỉnh Thanh Hóa	0	\N	\N	\N	\N	\N	th
403	Tỉnh Nghệ An	0	\N	\N	\N	\N	\N	na
405	Tỉnh Hà Tĩnh	0	\N	\N	\N	\N	\N	ht
407	Tỉnh Quảng Bình	0	\N	\N	\N	\N	\N	qb
409	Tỉnh Quảng Trị	0	\N	\N	\N	\N	\N	qt
501	Thành phố Đà Nẵng	0	\N	\N	\N	\N	\N	dn
503	Tỉnh Quảng Nam	0	\N	\N	\N	\N	\N	qn
505	Tỉnh Quảng Ngãi	0	\N	\N	\N	\N	\N	qn
507	Tỉnh Bình Định	0	\N	\N	\N	\N	\N	bd
509	Tỉnh Phú Yên	0	\N	\N	\N	\N	\N	py
511	Tỉnh Khánh Hòa	0	\N	\N	\N	\N	\N	kh
601	Tỉnh Kon Tum	0	\N	\N	\N	\N	\N	kt
603	Tỉnh Gia Lai	0	\N	\N	\N	\N	\N	gl
605	Tỉnh Đắk Lắk	0	\N	\N	\N	\N	\N	dl
701	Thành phố Hồ Chí Minh	0	\N	\N	\N	\N	\N	hc
703	Tỉnh Lâm Đồng	0	\N	\N	\N	\N	\N	ld
705	Tỉnh Ninh Thuận	0	\N	\N	\N	\N	\N	nt
707	Tỉnh Bình Phước	0	\N	\N	\N	\N	\N	bp
709	Tỉnh Tây Ninh	0	\N	\N	\N	\N	\N	tn
711	Tỉnh Bình Dương	0	\N	\N	\N	\N	\N	bd
713	Tỉnh Đồng Nai	0	\N	\N	\N	\N	\N	dn
715	Tỉnh Bình Thuận	0	\N	\N	\N	\N	\N	bt
801	Tỉnh Long An	0	\N	\N	\N	\N	\N	la
803	Tỉnh Đồng Tháp	0	\N	\N	\N	\N	\N	dt
805	Tỉnh An Giang	0	\N	\N	\N	\N	\N	ag
807	Tỉnh Tiền Giang	0	\N	\N	\N	\N	\N	tg
809	Tỉnh Vĩnh Long	0	\N	\N	\N	\N	\N	vl
811	Tỉnh Bến Tre	0	\N	\N	\N	\N	\N	bt
813	Tỉnh Kiên Giang	0	\N	\N	\N	\N	\N	kg
815	Tỉnh Cần Thơ	0	\N	\N	\N	\N	\N	ct
817	Tỉnh Trà Vinh	0	\N	\N	\N	\N	\N	tv
821	Tỉnh Bạc Liêu	0	\N	\N	\N	\N	\N	bl
823	Tỉnh Cà Mau	0	\N	\N	\N	\N	\N	cm
205	Tỉnh Lào Cai	0	\N	\N	\N	\N	\N	lc
117	Tỉnh Ninh Bình	0	\N	\N	\N	\N	\N	nb
109	Tỉnh Hưng Yên	0	\N	\N	\N	\N	\N	hy
819	Tỉnh Sóc Trăng	0	\N	\N	\N	\N	\N	st
717	Tỉnh BR-VT	0	\N	\N	\N	\N	\N	br
411	Tỉnh Thừa Thiên - Huế	0	\N	\N	\N	\N	\N	th
825	Tỉnh Điện Biên	0	\N	\N	\N	\N	\N	db
105	Hà Nội Mới	0	\N	\N	\N	\N	\N	hnm
827	Tỉnh Đắk nông	0	\N	\N	\N	\N	\N	dn
302	Tỉnh Điện Biên	0	\N	\N	\N	\N	\N	db
604	Tỉnh Đăk Nông	0	\N	\N	\N	\N	\N	dn
816	Tỉnh Hậu Giang	0	\N	\N	\N	\N	\N	hg
829	Lào	0	\N	\N	\N	\N	\N	l
831	Hậu Giang	0	\N	\N	\N	\N	\N	hg
833	không xác định	0	\N	\N	\N	\N	\N	kx
\.


--
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('province_id_seq', 1, false);


--
-- Data for Name: queue; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY queue (queue_id, patient_id, first_name, last_name, patient_code, register_date, address, phone, email, date_of_birth, province_code, cmnd, sexuality, morning_exam, avatar, email_notification, sms_notification, examination_reason, examination_id, examination_ids, delete_flg, created_at, created_by, updated_at, updated_by, display_order) FROM stdin;
1	5	Hà	Hồ Ngọc	\N	\N	3432432432	8683434324	kk@gmail.com	\N	\N	43432395	1	1	\N	1	1	\N	\N	\N	0	2017-08-26 15:18:36.005	\N	\N	\N	\N
2	5	Hà	Hồ Ngọc	\N	\N	3432432432	8683434324	kk@gmail.com	\N	\N	43432395	1	1	\N	1	1	\N	\N	\N	0	2017-08-26 15:19:48.488	\N	\N	\N	\N
3	6	ưeqwewqe	ewqewq	\N	\N	43243	4324324	1123@gmail.com	\N	\N	432432	1	1	\N	1	1	\N	\N	\N	0	2017-08-26 15:42:51.578	\N	\N	\N	\N
4	1	\N	\N	\N	\N	ABC	122121	ABC@gmail.com	\N	\N	312121	\N	1	\N	1	1	\N	\N	\N	0	2017-08-31 08:59:14.994	\N	\N	\N	\N
\.


--
-- Name: queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('queue_id_seq', 4, true);


--
-- Data for Name: reminder; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY reminder (payment_id, reminder_id, reminder_email, reminder_mobile, patient_id, queue_id, clinic_id, examination_id, examination_note, exam_date, morning_exam, delete_flg, created_at, created_by, updated_at, updated_by, display_order) FROM stdin;
\.


--
-- Name: reminder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('reminder_id_seq', 1, false);


--
-- Data for Name: slip; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY slip (slip_id, delete_flg, created_at, created_by, updated_at, updated_by, display_order) FROM stdin;
\.


--
-- Name: slip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('slip_id_seq', 1, false);


--
-- Data for Name: specialist; Type: TABLE DATA; Schema: public; Owner: dolphin
--

COPY specialist (specialist_id, specialist_name, specialist_func, specialist_doctors, specialist_avatar, delete_flg, created_at, created_by, updated_at, updated_by, display_order) FROM stdin;
1	Chuyên khoa nội	Điều trị các bệnh nội khoa	A, B, C	\N	0	2017-08-28 05:00:00	\N	2017-08-28 08:17:36.879	1	\N
\.


--
-- Name: specialist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dolphin
--

SELECT pg_catalog.setval('specialist_id_seq', 3, true);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('16609', 131072);
SELECT pg_catalog.lowrite(0, '\x6161616161');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16610', 131072);
SELECT pg_catalog.lowrite(0, '\x767676767676');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16611', 131072);
SELECT pg_catalog.lowrite(0, '\x6363636363');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16612', 131072);
SELECT pg_catalog.lowrite(0, '\x3132313233313233313233');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16613', 131072);
SELECT pg_catalog.lowrite(0, '\x61616161');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16665', 131072);
SELECT pg_catalog.lowrite(0, '\x54657374207468e1bbad');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16666', 131072);
SELECT pg_catalog.lowrite(0, '\x4f6b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16667', 131072);
SELECT pg_catalog.lowrite(0, '\x4b4f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16679', 131072);
SELECT pg_catalog.lowrite(0, '\x61616161');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16680', 131072);
SELECT pg_catalog.lowrite(0, '\x61616161');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16681', 131072);
SELECT pg_catalog.lowrite(0, '\x313233313233313233');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16738', 131072);
SELECT pg_catalog.lowrite(0, '\x54c3b469206d75e1bb916e2068e1bb8f69206b6869206de1bb9b692062e1baaf7420c491e1baa7752068e1bb8d632076e1bb8120546869e1bb816e206b68c3ad2074c3a26d2074c3b4692063e1baa76e20636875e1baa96e2062e1bb8b206e68e1bbaf6e672067c3ac3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16739', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a2752068e1bb8f6920313f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16740', 131072);
SELECT pg_catalog.lowrite(0, '\x616161616161');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16741', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a16320636875e1baa96e2062e1bb8b2063e1baa76e20746869e1babf74206b68692062e1baaf7420c491e1baa7752068e1bb8d6320546869e1bb816e206b68c3ad2074c3a26d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16742', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a163206ce1bba36920c3ad6368206368c3ad6e6820c491e1baa17420c491c6b0e1bba363206b68692068e1bb8d6320546869e1bb816e206b68c3ad2074c3a26d206cc3a02067c3ac3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16743', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a163206be1bbb920746875e1baad74206368c3ad6e682063e1baa575207468c3a06e68206ec3aa6e206dc3b46e2068e1bb8d6320546869e1bb816e206b68c3ad2074c3a26d206cc3a02067c3ac3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16744', 131072);
SELECT pg_catalog.lowrite(0, '\x4be1babf74207175e1baa3206b68c3a163206269e1bb8774206769e1bbaf6120546869e1bb816e206b68c3ad2074c3a26d2076c3a020596f6761206cc3a02067c3ac3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16745', 131072);
SELECT pg_catalog.lowrite(0, '\x54657374');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16746', 131072);
SELECT pg_catalog.lowrite(0, '\x58696e206769e1baa369207468c3ad63682072c3b52073e1bbb1206b68c3a163206e686175206769e1bb916e67206e686175206769e1bbaf6120746869e1bb816e206b68c3ad2074c3a26d2076c3a020596f67612e3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16747', 131072);
SELECT pg_catalog.lowrite(0, '\x54657374');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16748', 131072);
SELECT pg_catalog.lowrite(0, '\x546869e1bb816e206b68c3ad2074c3a26d206769c3ba7020c3ad6368206e68c6b0207468e1babf206ec3a06f20c491e1bb91692076e1bb9b69206e67c6b0e1bb9d69206cc3a06d2063c3b46e672074c3a163207175e1baa36e206cc3bd');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16749', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a275207472e1baa3206ce1bb9d69207468e1bbad206e676869e1bb876d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16750', 131072);
SELECT pg_catalog.lowrite(0, '\x546869e1bb816e206b68c3ad2074c3a26d206769c3ba7020c3ad6368206e68c6b0207468e1babf206ec3a06f20c491e1bb91692076e1bb9b69206e67c6b0e1bb9d69206cc3a06d2063c3b46e672074c3a163207175e1baa36e206cc3bd');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16751', 131072);
SELECT pg_catalog.lowrite(0, '\x4361617520747261206c6f6920746875202e206e676869656d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16752', 131072);
SELECT pg_catalog.lowrite(0, '\x58696e206769e1baa369207468c3ad63682072c3b52073e1bbb1206b68c3a163206e686175206769e1bb916e67206e686175206769e1bbaf6120746869e1bb816e206b68c3ad2074c3a26d2076c3a020596f67612e3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16753', 131072);
SELECT pg_catalog.lowrite(0, '\x6161616161');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16754', 131072);
SELECT pg_catalog.lowrite(0, '\x4be1babf74207175e1baa3206b68c3a163206269e1bb8774206769e1bbaf6120546869e1bb816e206b68c3ad2074c3a26d2076c3a020596f6761206cc3a02067c3ac3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16755', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a275207472e1baa3206ce1bb9d69207468e1bbad206e676869e1bb876d2e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16756', 131072);
SELECT pg_catalog.lowrite(0, '\x58696e206769e1baa369207468c3ad63682072c3b52073e1bbb1206b68c3a163206e686175206769e1bb916e67206e686175206769e1bbaf6120746869e1bb816e206b68c3ad2074c3a26d2076c3a020596f67612e3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16757', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a275207472e1baa3206ce1bb9d69207468e1bbad206e676869e1bb876d2e0a58696e206769e1baa369207468c3ad63682072c3b52073e1bbb1206b68c3a163206e686175206769e1bb916e67206e686175206769e1bbaf6120746869e1bb816e206b68c3ad2074c3a26d2076c3a020596f67612e3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16758', 131072);
SELECT pg_catalog.lowrite(0, '\x58696e206769e1baa369207468c3ad63682072c3b52073e1bbb1206b68c3a163206e686175206769e1bb916e67206e686175206769e1bbaf6120746869e1bb816e206b68c3ad2074c3a26d2076c3a020596f67612e3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16759', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a275207472e1baa3206ce1bb9d69207468e1bbad206e676869e1bb876d0a546869e1bb816e206b68c3ad2074c3a26d206769c3ba7020c3ad6368206e68c6b0207468e1babf206ec3a06f20c491e1bb91692076e1bb9b69206e67c6b0e1bb9d69206cc3a06d2063c3b46e672074c3a163207175e1baa36e206cc3bd');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16760', 131072);
SELECT pg_catalog.lowrite(0, '\x546869e1bb816e206b68c3ad2074c3a26d206769c3ba7020c3ad6368206e68c6b0207468e1babf206ec3a06f20c491e1bb91692076e1bb9b69206e67c6b0e1bb9d69206cc3a06d2063c3b46e672074c3a163207175e1baa36e206cc3bd');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16761', 131072);
SELECT pg_catalog.lowrite(0, '\x5068c3a26e206269e1bb877420546869e1bb816e206b68c3ad2074c3a26d3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16762', 131072);
SELECT pg_catalog.lowrite(0, '\x5472e1baa3206ce1bb9d69207468e1bbad206e676869e1bb876d21');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16763', 131072);
SELECT pg_catalog.lowrite(0, '\x5068c3a26e206269e1bb877420546869e1bb816e206b68c3ad2074c3a26d3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16764', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a275207472e1baa3206ce1bb9d692063686f207068c3a26e206269e1bb877420546869e1bb816e206b68c3ad2074c3a26d2076c3a020596f67612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16765', 131072);
SELECT pg_catalog.lowrite(0, '\x5068c3a26e206269e1bb877420546869e1bb816e206b68c3ad2074c3a26d3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16766', 131072);
SELECT pg_catalog.lowrite(0, '\x557064617465206ce1baa1692063c3a275207472e1baa3206ce1bb9d69');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16767', 131072);
SELECT pg_catalog.lowrite(0, '\x5068c3a26e206269e1bb877420546869e1bb816e206b68c3ad2074c3a26d3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16768', 131072);
SELECT pg_catalog.lowrite(0, '\x4368c6b0612063c3b32063c3a275207472e1baa3206ce1bb9d69206368c3ad6e68207468e1bba9632074e1bbab206769e1baa36e67207669c3aa6e206368c3ad6e68');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16769', 131072);
SELECT pg_catalog.lowrite(0, '\x5068c3a26e206269e1bb877420546869e1bb816e206b68c3ad2074c3a26d3f');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16770', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a1632079c3aa752063e1baa7752074e1bb916920746869e1bb83752063e1bba761206e67c6b0e1bb9d69206de1bb9b692062e1baaf7420c491e1baa7752068e1bb8d63');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16771', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a16320636875e1baa96e2062e1bb8b2063e1baa76e20746869e1babf742063686f206e67c6b0e1bb9d69206de1bb9b692062e1baaf7420c491e1baa7752068e1bb8d6320546869e1bb816e206b68c3ad2074c3a26d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16772', 131072);
SELECT pg_catalog.lowrite(0, '\x4368c6b0612063c3b32063c3a275207472e1baa3206ce1bb9d69206368c3ad6e68207468e1bba9632074e1bbab206769e1baa36e67207669c3aa6e206368c3ad6e68');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16773', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a16320636875e1baa96e2062e1bb8b2063e1baa76e20746869e1babf742063686f206e67c6b0e1bb9d69206de1bb9b692062e1baaf7420c491e1baa7752068e1bb8d6320546869e1bb816e206b68c3ad2074c3a26d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16774', 131072);
SELECT pg_catalog.lowrite(0, '\x4368c6b0612063c3b32063c3a275207472e1baa3206ce1bb9d69206368c3ad6e68207468e1bba963');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('16775', 131072);
SELECT pg_catalog.lowrite(0, '\x43c3a1632079c3aa752063e1baa7752074e1bb916920746869e1bb83752063e1bba761206e67c6b0e1bb9d69206de1bb9b692062e1baaf7420c491e1baa7752068e1bb8d63');
SELECT pg_catalog.lo_close(0);

COMMIT;

SET search_path = public, pg_catalog;

--
-- Name: clinic clinic_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY clinic
    ADD CONSTRAINT clinic_pkey PRIMARY KEY (clinic_id);


--
-- Name: commune commune_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY commune
    ADD CONSTRAINT commune_pkey PRIMARY KEY (commune_id);


--
-- Name: district district_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_pkey PRIMARY KEY (district_id);


--
-- Name: doctor_calendar doctor_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY doctor_calendar
    ADD CONSTRAINT doctor_calendar_pkey PRIMARY KEY (calendar_id);


--
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (doctor_id);


--
-- Name: medical_test mediacal_test_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY medical_test
    ADD CONSTRAINT mediacal_test_pkey PRIMARY KEY (test_id);


--
-- Name: pathological pathological_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY pathological
    ADD CONSTRAINT pathological_pkey PRIMARY KEY (payment_id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY province
    ADD CONSTRAINT province_pkey PRIMARY KEY (province_id);


--
-- Name: queue queue_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY queue
    ADD CONSTRAINT queue_pkey PRIMARY KEY (queue_id);


--
-- Name: reminder reminder_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY reminder
    ADD CONSTRAINT reminder_pkey PRIMARY KEY (payment_id);


--
-- Name: slip slip_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY slip
    ADD CONSTRAINT slip_pkey PRIMARY KEY (slip_id);


--
-- Name: specialist specialist_pkey; Type: CONSTRAINT; Schema: public; Owner: dolphin
--

ALTER TABLE ONLY specialist
    ADD CONSTRAINT specialist_pkey PRIMARY KEY (specialist_id);


--
-- PostgreSQL database dump complete
--

