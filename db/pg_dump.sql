--
-- pg_restore -U postgres -h containers-us-west-132.railway.app -p 7292 -W -F t -d railway pg_dump.sql
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(300) NOT NULL,
    course_duration integer NOT NULL,
    course_price integer NOT NULL,
    course_pdf character varying(255),
    "typeTypeId" integer NOT NULL,
    "documentDocumentId" integer NOT NULL,
    "formatFormatId" integer NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    document_id integer NOT NULL,
    document_name character varying(255) NOT NULL
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_document_id_seq OWNER TO postgres;

--
-- Name: documents_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_document_id_seq OWNED BY public.documents.document_id;


--
-- Name: firms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firms (
    firm_id integer NOT NULL,
    firm_name character varying(20) NOT NULL,
    firm_represantivename character varying(20) NOT NULL,
    firm_phone character varying(20) NOT NULL,
    firm_email character varying(40) NOT NULL
);


ALTER TABLE public.firms OWNER TO postgres;

--
-- Name: firms_firm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firms_firm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firms_firm_id_seq OWNER TO postgres;

--
-- Name: firms_firm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firms_firm_id_seq OWNED BY public.firms.firm_id;


--
-- Name: formats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formats (
    format_id integer NOT NULL,
    format_name character varying(255) NOT NULL
);


ALTER TABLE public.formats OWNER TO postgres;

--
-- Name: formats_format_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formats_format_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formats_format_id_seq OWNER TO postgres;

--
-- Name: formats_format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formats_format_id_seq OWNED BY public.formats.format_id;


--
-- Name: licenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licenses (
    license_id integer NOT NULL,
    license_name character varying(400) NOT NULL,
    license_file character varying(255),
    license_type integer
);


ALTER TABLE public.licenses OWNER TO postgres;

--
-- Name: licenses_license_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.licenses_license_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.licenses_license_id_seq OWNER TO postgres;

--
-- Name: licenses_license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.licenses_license_id_seq OWNED BY public.licenses.license_id;


--
-- Name: mails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mails (
    mail_id integer NOT NULL,
    mail_name character varying(255) NOT NULL
);


ALTER TABLE public.mails OWNER TO postgres;

--
-- Name: mails_mail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mails_mail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mails_mail_id_seq OWNER TO postgres;

--
-- Name: mails_mail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mails_mail_id_seq OWNED BY public.mails.mail_id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    member_id integer NOT NULL,
    member_lastname character varying(20) NOT NULL,
    member_name character varying(20) NOT NULL,
    member_surname character varying(20),
    member_jobtitle character varying(40),
    member_email character varying(40),
    "firmFirmId" integer
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_member_id_seq OWNER TO postgres;

--
-- Name: members_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_member_id_seq OWNED BY public.members.member_id;


--
-- Name: modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modules (
    module_id integer NOT NULL,
    module_name character varying(255) NOT NULL,
    "courseCourseId" integer
);


ALTER TABLE public.modules OWNER TO postgres;

--
-- Name: modules_module_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modules_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modules_module_id_seq OWNER TO postgres;

--
-- Name: modules_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modules_module_id_seq OWNED BY public.modules.module_id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    option_id integer NOT NULL,
    option_name character varying(255) NOT NULL,
    "serviceServiceId" integer
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: options_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_option_id_seq OWNER TO postgres;

--
-- Name: options_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_option_id_seq OWNED BY public.options.option_id;


--
-- Name: personals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personals (
    personal_id integer NOT NULL,
    personal_lastname character varying(20) NOT NULL,
    personal_name character varying(20) NOT NULL,
    personal_surname character varying(20),
    personal_phone character varying(20) NOT NULL,
    personal_email character varying(40) NOT NULL
);


ALTER TABLE public.personals OWNER TO postgres;

--
-- Name: personals_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personals_personal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personals_personal_id_seq OWNER TO postgres;

--
-- Name: personals_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personals_personal_id_seq OWNED BY public.personals.personal_id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    request_id integer NOT NULL,
    request_type boolean NOT NULL,
    request_time timestamp with time zone,
    request_message character varying(255),
    "sheduleSheduleId" integer,
    "firmFirmId" integer,
    "personalPersonalId" integer
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- Name: requests_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requests_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_request_id_seq OWNER TO postgres;

--
-- Name: requests_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requests_request_id_seq OWNED BY public.requests.request_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    role_name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_role_id_seq OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    service_title character varying(255) NOT NULL,
    "service_optionTitle" character varying(255) NOT NULL,
    service_description character varying(450),
    "typeofserviceTypeofserviceId" integer
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: shedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shedules (
    shedule_id integer NOT NULL,
    shedule_dateofstart date NOT NULL,
    shedule_dateoffinish date NOT NULL,
    "courseCourseId" integer
);


ALTER TABLE public.shedules OWNER TO postgres;

--
-- Name: shedules_shedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shedules_shedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shedules_shedule_id_seq OWNER TO postgres;

--
-- Name: shedules_shedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shedules_shedule_id_seq OWNED BY public.shedules.shedule_id;


--
-- Name: typeofservices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typeofservices (
    typeofservice_id integer NOT NULL,
    typeofservice_title character varying(255) NOT NULL
);


ALTER TABLE public.typeofservices OWNER TO postgres;

--
-- Name: typeofservices_typeofservice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.typeofservices_typeofservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typeofservices_typeofservice_id_seq OWNER TO postgres;

--
-- Name: typeofservices_typeofservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.typeofservices_typeofservice_id_seq OWNED BY public.typeofservices.typeofservice_id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type_name character varying(255) NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO postgres;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.type_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_login character varying(255),
    user_password character varying(255),
    "roleRoleId" integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: documents document_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN document_id SET DEFAULT nextval('public.documents_document_id_seq'::regclass);


--
-- Name: firms firm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms ALTER COLUMN firm_id SET DEFAULT nextval('public.firms_firm_id_seq'::regclass);


--
-- Name: formats format_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formats ALTER COLUMN format_id SET DEFAULT nextval('public.formats_format_id_seq'::regclass);


--
-- Name: licenses license_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses ALTER COLUMN license_id SET DEFAULT nextval('public.licenses_license_id_seq'::regclass);


--
-- Name: mails mail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails ALTER COLUMN mail_id SET DEFAULT nextval('public.mails_mail_id_seq'::regclass);


--
-- Name: members member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN member_id SET DEFAULT nextval('public.members_member_id_seq'::regclass);


--
-- Name: modules module_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules ALTER COLUMN module_id SET DEFAULT nextval('public.modules_module_id_seq'::regclass);


--
-- Name: options option_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN option_id SET DEFAULT nextval('public.options_option_id_seq'::regclass);


--
-- Name: personals personal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals ALTER COLUMN personal_id SET DEFAULT nextval('public.personals_personal_id_seq'::regclass);


--
-- Name: requests request_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests ALTER COLUMN request_id SET DEFAULT nextval('public.requests_request_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Name: shedules shedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shedules ALTER COLUMN shedule_id SET DEFAULT nextval('public.shedules_shedule_id_seq'::regclass);


--
-- Name: typeofservices typeofservice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeofservices ALTER COLUMN typeofservice_id SET DEFAULT nextval('public.typeofservices_typeofservice_id_seq'::regclass);


--
-- Name: types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, course_duration, course_price, course_pdf, "typeTypeId", "documentDocumentId", "formatFormatId") FROM stdin;
1	ТЗИ. Организация защиты информации содержащей сведения, составляющие государственную тайну	216	41485	9e5902a6-6c7b-4251-9758-b022ee2b32b0.pdf	1	1	3
2	ТЗИ. Организация защиты информации ограниченного доступа, не содержащей сведения, составляющие государственную тайну	108	38014	b824ab59-a15b-4549-a997-56fe6f3af90a.pdf	1	1	3
5	Техническая защита информации, содержащей сведения, составляющие государственную тайну	540	100400	49599c3e-8814-47fb-b64f-e854b9cafc9a.pdf	2	2	3
4	Техническая защита информации ограниченного доступа, не содержащей сведения, составляющие государственную тайну	706	112057	5687df8c-d809-4240-9ffc-e2881bd49416.pdf	2	2	3
3	Обеспечение безопасности персональных данных при их обработке в информационных системах персональных данных	72	31471	f11beb46-0fc6-4c2d-9d49-3ee1784ed26c.pdf	1	1	3
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (document_id, document_name) FROM stdin;
1	Удостоверение о повышении квалификации
2	Диплом о профессиональной переподготовке
\.


--
-- Data for Name: firms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firms (firm_id, firm_name, firm_represantivename, firm_phone, firm_email) FROM stdin;
\.


--
-- Data for Name: formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formats (format_id, format_name) FROM stdin;
2	Очно
1	Дистанционные образовательные технологии
3	Очно-заочно с применением электронного обучения и дистанционных образовательных технологий
\.


--
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licenses (license_id, license_name, license_file, license_type) FROM stdin;
6	Private policy	privatepolicy.pdf	2
15	Лицензия Федеральной службы безопасности №ХК-2320 от 22.09.2021 на право проведения работ, связанных с использованием сведений, составляющих государственную тайну	39ffa62b-f687-4eb8-918b-304615d70201.pdf	1
11	Лицензия Федеральной службы по надзору в сфере образования и науки № 2001 от 16.03.2016 на право оказывать образовательные услуги по реализации образовательных программ по видам образования, по уровню образования, по профессиям, специальностям, направлениям подготовки (для профессионального образования), по методам дополнительного образования	1a7b51d5-0b1f-4335-bbf8-92e9774ec398.pdf	1
12	Лицензия Федеральной службы по техническому и экспортному контролю № 2565 от 15.06.2020 на осуществление мероприятий и (или) оказание услуг в области защиты государственной тайны	992416ca-c170-4db3-aea9-6317e9fc45fb.pdf	1
13	Лицензия Федеральной службы по техническому и экспортному контролю № 2566 от 15.06.2020 на проведение работ связанных с созданием средств защиты информации	88d342c6-e5e7-479f-a980-b57b74d0135a.pdf	1
14	Лицензия Федеральной службы по техническому и экспортному контролю № 2701 от 28.09.2015 на деятельность по технической защите конфиденциальной информации	bac19282-b18e-4012-8c33-56c592cd65ea.pdf	1
\.


--
-- Data for Name: mails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mails (mail_id, mail_name) FROM stdin;
1	ladil.space@gmail.com
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (member_id, member_lastname, member_name, member_surname, member_jobtitle, member_email, "firmFirmId") FROM stdin;
\.


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modules (module_id, module_name, "courseCourseId") FROM stdin;
1	Планирование и организация работ по ТЗИ	1
2	 Контроль состояния ТЗИ	1
4	Итоговая аттестация	1
3	Выполнение мероприятий по ТЗИ, и применение технических средств в интересах ТЗИ	1
5	Организация секретного делопроизводства	1
6	Планирование и организация и работ по ТЗКИ	2
7	Выполнение мероприятий по ТЗКИ и применение технических средств 	2
8	Контроль состояния ТЗКИ	2
9	Итоговая аттестация	2
10	Общие вопросы технической защиты информации	3
11	Организация обеспечения безопасности персональных данных в информационных системах персональных данных	3
12	Зачет с оценкой	3
13	Организационно-правовые основы ТЗКИ	4
14	Аппаратные средства вычислительной техники	4
15	Системы и сети передачи информации	4
17	Меры и средства ТЗКИ от несанкционированного доступа	4
16	Способы и средства ТЗКИ от утечки по техническим каналам	4
18	Техническая защита конфиденциальной информации от специальных воздействий	4
19	Организация защиты конфиденциальной информации на объектах информатизации	4
20	Аттестация объектов информатизации по требованиям безопасности информации	4
21	Контроль состояния ТЗКИ	4
22	Итоговая аттестация	4
23	Организационно-правовые основы технической защиты информации, содержащей сведения, составляющие государственную тайну	5
24	Системы и сети передачи информации	5
27	Аттестация объектов информатизации по требованиям безопасности информации	5
28	Контроль состояния технической защиты информации, содержащей сведения, составляющие государственную тайну	5
25	Способы и средства технической защиты информации, содержащей сведения, составляющие государственную тайну, от утечки по техническим каналам	5
29	Организация защиты информации, содержащей сведения, составляющие государственную тайну, на объектах информатизации	5
30	Аппаратные средства вычислительной техники	5
26	Итоговая аттестация	5
32	Меры и средства технической защиты информации, содержащей сведения, составляющие государственную тайну, от несанкционированного доступа	5
31	Техническая защита информации, содержащей сведения, составляющие государственную тайну, от специальных воздействий	5
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (option_id, option_name, "serviceServiceId") FROM stdin;
1	Разработка нормативных, распорядительных, организационных и эксплутационных документов	4
2	Аттестация объектов информатизации на соответствие требованиям безопасности информации	4
3	Оценка защищённости объектов информатизации 	4
4	Аудит, разработка и внедрение систем защиты информации	4
5	Контроль эффективности систем защиты информации	4
6	Аттестация выделенных и защищаемых помещений	4
7	Установка и настройка сертифицированных технических и программных средств и систем защиты информации	4
8	Гарантийное и сервисное обслуживание системы защиты информации	4
9	Обучение персонала Заказчика	4
12	Оценка защищённости объектов информатизации 	3
11	Аттестация объектов информатизации на соответствие требованиям безопасности информации	3
10	Разработка нормативных, распорядительных, организационных и эксплутационных документов	3
13	Аттестация выделенных и защищаемых помещений	3
14	Установка и настройка сертифицированных технических и программных средств и систем защиты информации	3
15	Аудит, разработка и внедрение систем защиты информации	3
16	Контроль эффективности систем защиты информации	3
17	Гарантийное и сервисное обслуживание системы защиты информации\n	3
18	Обучение персонала Заказчика	3
19	Оценка защищённости объектов информатизации 	2
20	Разработка нормативных, распорядительных, организационных и эксплутационных документов	2
21	Аудит, разработка и внедрение систем защиты информации	2
22	Аттестация объектов информатизации на соответствие требованиям безопасности информации	2
23	Аттестация выделенных и защищаемых помещений	2
24	Установка и настройка сертифицированных технических и программных средств и систем защиты информации	2
25	Контроль эффективности систем защиты информации	2
26	Гарантийное и сервисное обслуживание системы защиты информации	2
27	Обучение персонала Заказчика	2
28	Оценка защищённости объектов информатизации 	1
29	Проведение лабораторных и объектовых специальных исследований технических средств на ПЭМИН	1
30	Разработка нормативных, распорядительных, организационных и эксплутационных документов	1
31	Аттестация автоматизированных и информационных систем на соответствие требованиям безопасности информации	1
32	Аудит, разработка и внедрение систем защиты информации	1
33	Контроль эффективности систем защиты информации	1
34	Проведение лабораторных специальных исследований технических средств на акустоэлектрические преобразования	1
35	Аттестация выделенных и защищаемых помещений	1
36	Гарантийное и сервисное обслуживание системы защиты информации	1
37	Проведение инструментального контроля выполнения норм противодействия акустической речевой разведке	1
38	Установка и настройка сертифицированных технических и программных средств и систем защиты информации на объектах 2 и 3 категории	1
39	Обучение персонала Заказчика	1
40	Локальных вычислительных сетей	6
41	Беспроводных сетей передачи данных	6
42	Любого коммуникационного оборудования	6
43	Волоконно-оптических линий связи	6
49	Подготовка документов на получение лицензии ФСБ и ФСТЭК	7
50	Проверка документов на получение лицензии ФСБ и ФСТЭК	7
44	Установок пожаротушения	\N
45	Систем оповещения и эвакуации при пожаре	\N
46	Установок пожарной и охранно-пожарной сигнализации	\N
48	Систем противопожарного водоснабжения	\N
47	Обслуживание противопожарных занавесов и завес	\N
58	Разработка нормативных, распорядительных, организационных и эксплутационных документов	8
57	Категорирование объектов критической информационной инфраструктуры	8
59	Аттестация объектов информатизации на соответствие требованиям безопасности информации	8
60	Аттестация выделенных и защищаемых помещений	8
61	Контроль эффективности систем защиты информации	8
62	Аудит, разработка и внедрение систем защиты информации	8
63	Установка и настройка сертифицированных технических и программных средств и систем защиты информации	8
64	Оценка защищённости объектов информатизации	8
65	Гарантийное и сервисное обслуживание системы защиты информации	8
67	Обучение персонала Заказчика	8
\.


--
-- Data for Name: personals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personals (personal_id, personal_lastname, personal_name, personal_surname, personal_phone, personal_email) FROM stdin;
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests (request_id, request_type, request_time, request_message, "sheduleSheduleId", "firmFirmId", "personalPersonalId") FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name) FROM stdin;
1	super_user
2	user
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (service_id, service_title, "service_optionTitle", service_description, "typeofserviceTypeofserviceId") FROM stdin;
4	Защита государственных и муниципальных информационных систем	Решения	Информация, содержащаяся в государственных информационных системах, а также иные имеющиеся в распоряжении государственных органов сведения и документы являются государственными информационными ресурсами	1
3	Защита конфиденциальной информации	Решения	Конфиденциальной является информация, не содержащая сведений, \r\nсоставляющих государственную тайну, доступ к которой ограничен \r\nв соответствии с законодательством Российской Федерации.	1
2	Защита персональных данных	Решения	Комплекс мероприятий технического, организационного и организационно-технического характера, направленных на защиту сведений о субъекте персональных данных	1
1	Защита государственной тайны	Решения	Защищаемые государством сведения в области его военной, внешнеполитической, экономической, разведывательной, контрразведывательной и оперативно — розыскной деятельности, распространение которых может нанести ущерб безопасности Российской Федерации	1
6	Линии связи	Осуществляем монтаж, ремонт и обслуживание	Важной и необходимой составляющей любых инженерных систем являются сети передачи данных. Наша компания имеет большой опыт монтажа линий связи, как в отдельности, так и в составе других инженерных систем и предлагает Вам свои услуги в построении надежных каналов передачи данных.	2
7	Лицензирование	Решения		3
8	Защита критических информационных инфраструктур	Решения		1
\.


--
-- Data for Name: shedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shedules (shedule_id, shedule_dateofstart, shedule_dateoffinish, "courseCourseId") FROM stdin;
\.


--
-- Data for Name: typeofservices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typeofservices (typeofservice_id, typeofservice_title) FROM stdin;
1	Защита
2	Проектирование
3	Консультации
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (type_id, type_name) FROM stdin;
1	Повышение квалификации
2	Профессиональная переподготовка
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_login, user_password, "roleRoleId") FROM stdin;
1	ladil	$2b$05$c14qa8PJwO0rbH262jNt3.2LktCi2oEr/XF8RVQMd7qZLrCXaGhWe	1
7	cis_admin	$2b$05$xQ4.BF98lAXj9AEl6TJcL.ndb63sNXjPLXsTwOgbl71HtexZ6XR9G	1
\.


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 6, true);


--
-- Name: documents_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_document_id_seq', 2, true);


--
-- Name: firms_firm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firms_firm_id_seq', 3, true);


--
-- Name: formats_format_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formats_format_id_seq', 3, true);


--
-- Name: licenses_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licenses_license_id_seq', 16, true);


--
-- Name: mails_mail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mails_mail_id_seq', 3, true);


--
-- Name: members_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_member_id_seq', 4, true);


--
-- Name: modules_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modules_module_id_seq', 39, true);


--
-- Name: options_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.options_option_id_seq', 69, true);


--
-- Name: personals_personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personals_personal_id_seq', 4, true);


--
-- Name: requests_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requests_request_id_seq', 7, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 2, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_service_id_seq', 9, true);


--
-- Name: shedules_shedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shedules_shedule_id_seq', 16, true);


--
-- Name: typeofservices_typeofservice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.typeofservices_typeofservice_id_seq', 3, true);


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_type_id_seq', 2, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 7, true);


--
-- Name: courses courses_course_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_course_name_key UNIQUE (course_name);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: documents documents_document_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_document_name_key UNIQUE (document_name);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (document_id);


--
-- Name: firms firms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms
    ADD CONSTRAINT firms_pkey PRIMARY KEY (firm_id);


--
-- Name: formats formats_format_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formats
    ADD CONSTRAINT formats_format_name_key UNIQUE (format_name);


--
-- Name: formats formats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formats
    ADD CONSTRAINT formats_pkey PRIMARY KEY (format_id);


--
-- Name: licenses licenses_license_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses
    ADD CONSTRAINT licenses_license_name_key UNIQUE (license_name);


--
-- Name: licenses licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses
    ADD CONSTRAINT licenses_pkey PRIMARY KEY (license_id);


--
-- Name: mails mails_mail_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT mails_mail_name_key UNIQUE (mail_name);


--
-- Name: mails mails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT mails_pkey PRIMARY KEY (mail_id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (member_id);


--
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (module_id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (option_id);


--
-- Name: personals personals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personals
    ADD CONSTRAINT personals_pkey PRIMARY KEY (personal_id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (request_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: services services_service_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_title_key UNIQUE (service_title);


--
-- Name: shedules shedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shedules
    ADD CONSTRAINT shedules_pkey PRIMARY KEY (shedule_id);


--
-- Name: typeofservices typeofservices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeofservices
    ADD CONSTRAINT typeofservices_pkey PRIMARY KEY (typeofservice_id);


--
-- Name: typeofservices typeofservices_typeofservice_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeofservices
    ADD CONSTRAINT typeofservices_typeofservice_title_key UNIQUE (typeofservice_title);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: types types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_type_name_key UNIQUE (type_name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_login_key UNIQUE (user_login);


--
-- Name: courses courses_documentDocumentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "courses_documentDocumentId_fkey" FOREIGN KEY ("documentDocumentId") REFERENCES public.documents(document_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: courses courses_formatFormatId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "courses_formatFormatId_fkey" FOREIGN KEY ("formatFormatId") REFERENCES public.formats(format_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: courses courses_typeTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "courses_typeTypeId_fkey" FOREIGN KEY ("typeTypeId") REFERENCES public.types(type_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: members members_firmFirmId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT "members_firmFirmId_fkey" FOREIGN KEY ("firmFirmId") REFERENCES public.firms(firm_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: modules modules_courseCourseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT "modules_courseCourseId_fkey" FOREIGN KEY ("courseCourseId") REFERENCES public.courses(course_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: options options_serviceServiceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT "options_serviceServiceId_fkey" FOREIGN KEY ("serviceServiceId") REFERENCES public.services(service_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: requests requests_firmFirmId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "requests_firmFirmId_fkey" FOREIGN KEY ("firmFirmId") REFERENCES public.firms(firm_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests requests_personalPersonalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "requests_personalPersonalId_fkey" FOREIGN KEY ("personalPersonalId") REFERENCES public.personals(personal_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests requests_sheduleSheduleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "requests_sheduleSheduleId_fkey" FOREIGN KEY ("sheduleSheduleId") REFERENCES public.shedules(shedule_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services services_typeofserviceTypeofserviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT "services_typeofserviceTypeofserviceId_fkey" FOREIGN KEY ("typeofserviceTypeofserviceId") REFERENCES public.typeofservices(typeofservice_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: shedules shedules_courseCourseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shedules
    ADD CONSTRAINT "shedules_courseCourseId_fkey" FOREIGN KEY ("courseCourseId") REFERENCES public.courses(course_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
