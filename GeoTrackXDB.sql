--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-17 20:52:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 15 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 6738 (class 0 OID 0)
-- Dependencies: 15
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 18 (class 2615 OID 20580)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO admin;

--
-- TOC entry 19 (class 2615 OID 20836)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO admin;

--
-- TOC entry 17 (class 2615 OID 20291)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO admin;

--
-- TOC entry 6739 (class 0 OID 0)
-- Dependencies: 17
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 305 (class 1259 OID 21468)
-- Name: places; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.places (
    id integer NOT NULL,
    coords point,
    place_name character varying(100),
    place_description character varying(500),
    user_id integer NOT NULL,
    image character varying(500)
);


ALTER TABLE public.places OWNER TO admin;

--
-- TOC entry 304 (class 1259 OID 21467)
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.places_id_seq OWNER TO admin;

--
-- TOC entry 6740 (class 0 OID 0)
-- Dependencies: 304
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- TOC entry 232 (class 1259 OID 16392)
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    birthdate date,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO admin;

--
-- TOC entry 231 (class 1259 OID 16391)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO admin;

--
-- TOC entry 6741 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 6541 (class 2604 OID 21471)
-- Name: places id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- TOC entry 6524 (class 2604 OID 16395)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 6732 (class 0 OID 21468)
-- Dependencies: 305
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.places (id, coords, place_name, place_description, user_id, image) FROM stdin;
1	(10.002,11.665)	\N	\N	1	\N
2	(1000052.2255,8881.2255555)	Via delle Banane	Ci sono tante banane	2	\N
\.


--
-- TOC entry 6523 (class 0 OID 21340)
-- Dependencies: 302
-- Data for Name: pointcloud_formats; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
\.


--
-- TOC entry 6512 (class 0 OID 19533)
-- Dependencies: 234
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 6518 (class 0 OID 20557)
-- Dependencies: 248
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 6516 (class 0 OID 20545)
-- Dependencies: 246
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 6517 (class 0 OID 20569)
-- Dependencies: 250
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.us_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 6730 (class 0 OID 16392)
-- Dependencies: 232
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, first_name, last_name, email, birthdate, creation_date) FROM stdin;
1	Giovanni	Rossi	giovanni.rossi@example.com	1985-06-15	2025-03-16 22:10:21.728319
2	Maria	Bianchi	maria.bianchi@example.com	1990-03-22	2025-03-16 22:10:21.728319
3	Luca	Verdi	luca.verdi@example.com	1982-11-05	2025-03-16 22:10:21.728319
4	Sara	Neri	sara.neri@example.com	1995-09-30	2025-03-16 22:10:21.728319
5	Marco	Gialli	marco.gialli@example.com	1988-12-12	2025-03-16 22:10:21.728319
\.


--
-- TOC entry 6519 (class 0 OID 20587)
-- Dependencies: 252
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: admin
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- TOC entry 6520 (class 0 OID 20919)
-- Dependencies: 297
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: admin
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 6521 (class 0 OID 20929)
-- Dependencies: 299
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: admin
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 6522 (class 0 OID 20939)
-- Dependencies: 301
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: admin
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 6514 (class 0 OID 20294)
-- Dependencies: 239
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: admin
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 6515 (class 0 OID 20306)
-- Dependencies: 240
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: admin
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 6742 (class 0 OID 0)
-- Dependencies: 304
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.places_id_seq', 2, true);


--
-- TOC entry 6743 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 6744 (class 0 OID 0)
-- Dependencies: 238
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: admin
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- TOC entry 6576 (class 2606 OID 21473)
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- TOC entry 6546 (class 2606 OID 16400)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 6548 (class 2606 OID 16398)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 6577 (class 2606 OID 21477)
-- Name: places places_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-03-17 20:52:46

--
-- PostgreSQL database dump complete
--

