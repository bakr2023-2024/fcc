--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    area integer,
    age integer,
    distance numeric(4,1),
    description text,
    galaxy_types_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    area integer,
    age integer,
    distance numeric(4,1),
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    area integer,
    age integer,
    distance numeric(4,1),
    has_life boolean,
    is_sphere boolean,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    area integer,
    age integer,
    distance numeric(4,1),
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (19, '1', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (20, '2', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (21, '3', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (22, '4', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (23, '5', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (24, '6', NULL, NULL, NULL, NULL, 3);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, '1', NULL);
INSERT INTO public.galaxy_types VALUES (2, '2', NULL);
INSERT INTO public.galaxy_types VALUES (3, '3', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, '4', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, '5', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, '6', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (5, '1', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, '2', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (7, '3', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, '7', NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (9, '8', NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, '9', NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (11, '10', NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (12, '11', NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (13, '12', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (14, '13', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (15, '14', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (16, '15', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, '16', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (18, '17', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (19, '18', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, '19', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (21, '20', NULL, NULL, NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '4', NULL, NULL, NULL, NULL, NULL, NULL, 41);
INSERT INTO public.planet VALUES (2, '5', NULL, NULL, NULL, NULL, NULL, NULL, 42);
INSERT INTO public.planet VALUES (3, '6', NULL, NULL, NULL, NULL, NULL, NULL, 43);
INSERT INTO public.planet VALUES (4, '1', NULL, NULL, NULL, NULL, NULL, NULL, 41);
INSERT INTO public.planet VALUES (5, '2', NULL, NULL, NULL, NULL, NULL, NULL, 42);
INSERT INTO public.planet VALUES (6, '3', NULL, NULL, NULL, NULL, NULL, NULL, 43);
INSERT INTO public.planet VALUES (7, '7', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (8, '8', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (9, '9', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (10, '10', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (11, '11', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (12, '12', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (13, '13', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (14, '14', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (15, '15', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (16, '16', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (17, '17', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (18, '18', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (19, '19', NULL, NULL, NULL, NULL, NULL, NULL, 49);
INSERT INTO public.planet VALUES (20, '20', NULL, NULL, NULL, NULL, NULL, NULL, 49);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (37, '4', NULL, NULL, NULL, NULL, 21);
INSERT INTO public.star VALUES (38, '5', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.star VALUES (39, '6', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.star VALUES (40, '1', NULL, NULL, NULL, NULL, 21);
INSERT INTO public.star VALUES (41, '2', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.star VALUES (42, '3', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.star VALUES (43, '7', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (44, '8', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (45, '9', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (46, '10', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (47, '11', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (48, '12', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (49, '13', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (50, '14', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (51, '15', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (52, '16', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (53, '17', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (54, '18', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (55, '19', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.star VALUES (56, '20', NULL, NULL, NULL, NULL, 19);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 24, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 57, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

