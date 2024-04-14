--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: validar_referencias(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_referencias() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Contacto WHERE ID_Contacto = NEW.ID_Contacto
    ) THEN
        RAISE EXCEPTION 'ID_Contacto no tiene una referencia válida en la tabla Contacto';
    END IF;
    IF NOT EXISTS (
        SELECT 1 FROM Direccion WHERE ID_Direccion = NEW.ID_Direccion
    ) THEN
        RAISE EXCEPTION 'ID_Direccion no tiene una referencia válida en la tabla Direccion';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.validar_referencias() OWNER TO postgres;

--
-- Name: validar_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF new.status IS NULL THEN
        RAISE EXCEPTION 'Ingresa estatus';
    END IF;
END;
$$;


ALTER FUNCTION public.validar_status() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacto (
    id_contacto integer NOT NULL,
    nombre character varying(80) NOT NULL,
    telefono character varying(25)
);


ALTER TABLE public.contacto OWNER TO postgres;

--
-- Name: contacto_id_contacto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacto_id_contacto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacto_id_contacto_seq OWNER TO postgres;

--
-- Name: contacto_id_contacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacto_id_contacto_seq OWNED BY public.contacto.id_contacto;


--
-- Name: derrumbe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.derrumbe (
    id_derrumbe integer NOT NULL,
    descripcion character varying(200),
    necesidades character varying(100),
    tipo_de_dano character varying(40) NOT NULL,
    estatus character varying(30),
    id_contacto integer NOT NULL,
    id_direccion integer NOT NULL
);


ALTER TABLE public.derrumbe OWNER TO postgres;

--
-- Name: derrumbe_id_derrumbe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.derrumbe_id_derrumbe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.derrumbe_id_derrumbe_seq OWNER TO postgres;

--
-- Name: derrumbe_id_derrumbe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.derrumbe_id_derrumbe_seq OWNED BY public.derrumbe.id_derrumbe;


--
-- Name: direccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direccion (
    id_direccion integer NOT NULL,
    calle character varying(100) NOT NULL,
    numero_exterior integer NOT NULL,
    colonia character varying(50),
    entidad character varying(30),
    tipo_de_residencia character varying(30),
    ubicacion character varying(200) NOT NULL
);


ALTER TABLE public.direccion OWNER TO postgres;

--
-- Name: direccion_en_proceso; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.direccion_en_proceso AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'En proceso'::text);


ALTER VIEW public.direccion_en_proceso OWNER TO postgres;

--
-- Name: direccion_id_direccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.direccion_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.direccion_id_direccion_seq OWNER TO postgres;

--
-- Name: direccion_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direccion_id_direccion_seq OWNED BY public.direccion.id_direccion;


--
-- Name: direccion_pendiente; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.direccion_pendiente AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'Pendiente'::text);


ALTER VIEW public.direccion_pendiente OWNER TO postgres;

--
-- Name: residencia_casa; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.residencia_casa AS
 SELECT id_direccion,
    calle,
    numero_exterior,
    colonia,
    entidad,
    tipo_de_residencia,
    ubicacion
   FROM public.direccion
  WHERE ((tipo_de_residencia)::text = 'Casa'::text);


ALTER VIEW public.residencia_casa OWNER TO postgres;

--
-- Name: residencia_departamento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.residencia_departamento AS
 SELECT id_direccion,
    calle,
    numero_exterior,
    colonia,
    entidad,
    tipo_de_residencia,
    ubicacion
   FROM public.direccion
  WHERE ((tipo_de_residencia)::text = 'Departamento'::text);


ALTER VIEW public.residencia_departamento OWNER TO postgres;

--
-- Name: status_casa; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.status_casa AS
 SELECT dr.id_derrumbe,
    dr.descripcion,
    dr.necesidades,
    dr.tipo_de_dano,
    dr.estatus,
    dr.id_contacto,
    dr.id_direccion
   FROM (public.derrumbe dr
     JOIN public.direccion d ON ((dr.id_direccion = d.id_direccion)))
  WHERE ((d.tipo_de_residencia)::text = 'Casa'::text);


ALTER VIEW public.status_casa OWNER TO postgres;

--
-- Name: status_departamento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.status_departamento AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'En proceso'::text);


ALTER VIEW public.status_departamento OWNER TO postgres;

--
-- Name: contacto id_contacto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto ALTER COLUMN id_contacto SET DEFAULT nextval('public.contacto_id_contacto_seq'::regclass);


--
-- Name: derrumbe id_derrumbe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.derrumbe ALTER COLUMN id_derrumbe SET DEFAULT nextval('public.derrumbe_id_derrumbe_seq'::regclass);


--
-- Name: direccion id_direccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion ALTER COLUMN id_direccion SET DEFAULT nextval('public.direccion_id_direccion_seq'::regclass);


--
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacto (id_contacto, nombre, telefono) FROM stdin;
2	Mar¡a Garc¡a	9876543210
3	Pedro L¢pez	5555555555
5	Sof¡a Hern ndez	3333333333
1	Juan P‚rez P‚rez	1111111111
\.


--
-- Data for Name: derrumbe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.derrumbe (id_derrumbe, descripcion, necesidades, tipo_de_dano, estatus, id_contacto, id_direccion) FROM stdin;
1	Derrumbe en la zona norte	Rescate urgente	Estructural	Pendiente	1	1
2	Derrumbe parcial en edificio	Equipo de demolici¢n	Estructural	En proceso	2	2
3	Derrumbe en construcci¢n abandonada	Rescate de trabajadores	Estructural	En proceso	3	3
\.


--
-- Data for Name: direccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.direccion (id_direccion, calle, numero_exterior, colonia, entidad, tipo_de_residencia, ubicacion) FROM stdin;
1	Calle 123	100	Colonia Centro	Ciudad de M‚xico	Casa	CDMX
3	Calle Secundaria	250	Colonia Sur	Monterrey	Casa	Nuevo Le¢n
4	Paseo de las Flores	1500	Colonia Este	Puebla	Casa	Puebla
2	Avenida Reforma	250	Colonia Norte	Guadalajara	Departamento	Jalisco
\.


--
-- Name: contacto_id_contacto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacto_id_contacto_seq', 5, true);


--
-- Name: derrumbe_id_derrumbe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.derrumbe_id_derrumbe_seq', 5, true);


--
-- Name: direccion_id_direccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direccion_id_direccion_seq', 5, true);


--
-- Name: contacto contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id_contacto);


--
-- Name: derrumbe derrumbe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_pkey PRIMARY KEY (id_derrumbe);


--
-- Name: direccion direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion);


--
-- Name: derrumbe validar_referencias_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validar_referencias_trigger BEFORE INSERT OR UPDATE ON public.derrumbe FOR EACH ROW EXECUTE FUNCTION public.validar_referencias();


--
-- Name: derrumbe validar_status; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validar_status BEFORE INSERT OR UPDATE ON public.derrumbe FOR EACH ROW EXECUTE FUNCTION public.validar_status();


--
-- Name: derrumbe derrumbe_id_contacto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_id_contacto_fkey FOREIGN KEY (id_contacto) REFERENCES public.contacto(id_contacto);


--
-- Name: derrumbe derrumbe_id_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);


--
-- PostgreSQL database dump complete
--

