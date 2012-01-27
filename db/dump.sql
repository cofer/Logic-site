--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: testapp; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    question_id integer,
    title character varying(255),
    text text,
    correct text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.answers OWNER TO testapp;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: testapp
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO testapp;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testapp
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testapp
--

SELECT pg_catalog.setval('answers_id_seq', 1, false);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    title character varying(255),
    content text,
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.pages OWNER TO admin;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO admin;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('pages_id_seq', 3, true);


--
-- Name: questions; Type: TABLE; Schema: public; Owner: testapp; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    title character varying(255),
    text text,
    variant integer,
    is_published boolean,
    type character varying(255),
    sort_key integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.questions OWNER TO testapp;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: testapp
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO testapp;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testapp
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testapp
--

SELECT pg_catalog.setval('questions_id_seq', 1, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO admin;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testapp
--

ALTER TABLE answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: testapp
--

ALTER TABLE questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: testapp
--



--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO pages VALUES (1, 'Homepage', 'Homepage content', '/', NULL, NULL);
INSERT INTO pages VALUES (2, 'Testing', 'Testing content', '/testing', NULL, NULL);
INSERT INTO pages VALUES (3, '404 not found', 'Page not found', '/404', NULL, NULL);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: testapp
--

INSERT INTO questions VALUES (1, 'Question 1', 'Text 1', 1, true, 'Radio', 1, NULL, NULL);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO schema_migrations VALUES ('20120116105420');
INSERT INTO schema_migrations VALUES ('20120116111604');
INSERT INTO schema_migrations VALUES ('20120125161711');
INSERT INTO schema_migrations VALUES ('20120125165845');
INSERT INTO schema_migrations VALUES ('20120127113136');
INSERT INTO schema_migrations VALUES ('20120127113348');


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: testapp; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: testapp; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: admin; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: pages; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE pages FROM PUBLIC;
REVOKE ALL ON TABLE pages FROM admin;
GRANT ALL ON TABLE pages TO admin;
GRANT ALL ON TABLE pages TO PUBLIC;


--
-- Name: schema_migrations; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE schema_migrations FROM PUBLIC;
REVOKE ALL ON TABLE schema_migrations FROM admin;
GRANT ALL ON TABLE schema_migrations TO admin;


--
-- PostgreSQL database dump complete
--

