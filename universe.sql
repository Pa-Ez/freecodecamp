--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    designation character varying(255) NOT NULL,
    light_years_diameter numeric NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    factoid text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    is_inhabited boolean DEFAULT false,
    surface_area_km2 numeric,
    description text,
    man_landed integer,
    man_survived integer
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
    name character varying(255) NOT NULL,
    star_id integer,
    type character varying(50) NOT NULL,
    has_life boolean DEFAULT false,
    num_of_moons integer DEFAULT 0,
    description text
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
-- Name: satellitefromelon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellitefromelon (
    satellitefromelon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    is_inhabited boolean DEFAULT false,
    surface_area_km2 numeric,
    description text,
    man_landed integer,
    man_survived integer
);


ALTER TABLE public.satellitefromelon OWNER TO freecodecamp;

--
-- Name: satellitefromelon_satellitefromelon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellitefromelon_satellitefromelon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellitefromelon_satellitefromelon_id_seq OWNER TO freecodecamp;

--
-- Name: satellitefromelon_satellitefromelon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellitefromelon_satellitefromelon_id_seq OWNED BY public.satellitefromelon.satellitefromelon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    classification character varying(50) NOT NULL,
    solar_masses numeric NOT NULL,
    is_binary boolean DEFAULT false,
    description text
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellitefromelon satellitefromelon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellitefromelon ALTER COLUMN satellitefromelon_id SET DEFAULT nextval('public.satellitefromelon_satellitefromelon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'furia', 'A future galaxy formed by the collision of the Milky Way and Andromeda.', 120000, 'cacca', NULL);
INSERT INTO public.galaxy VALUES (2, 'ciaon', 'A classic spiral galaxy with well-defined arms.', 60000, 'cacca', NULL);
INSERT INTO public.galaxy VALUES (3, 'pelo', 'A galaxy with a prominent dark band of absorbing dust in front of the galaxy''s bright nucleus.', 17000, 'cacca', NULL);
INSERT INTO public.galaxy VALUES (4, 'tantric', 'A disrupted barred spiral galaxy with a long tail.', 420000, 'cacca', NULL);
INSERT INTO public.galaxy VALUES (5, 'anflo', 'A flocculent spiral galaxy.', 100000, 'cacca', NULL);
INSERT INTO public.galaxy VALUES (6, 'pne', 'A face-on spiral galaxy.', 170000, 'cacca', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 'luna', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'luna00', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'luna1', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'luna2', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'luna3', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'luna5', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'luna6', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'luna78', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'luna66', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'luna12', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'luna13', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'luna14', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'luna15', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'luna26', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'luna36', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'luna27', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'luna56', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'luna89', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (38, 'luna02', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (39, 'luna65', 3, false, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (40, 'luna91', 3, false, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'terra', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (4, 'terra1', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (5, 'terra2', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (6, 'terra3', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (7, 'terra4', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (8, 'terra5', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (9, 'terra6', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (10, 'terra7', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (11, 'terra9', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (12, 'terra0', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (13, 'terra11', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (14, 'terra122', 1, 'nostra', false, 0, NULL);
INSERT INTO public.planet VALUES (15, 'terra144', 1, 'nostra', false, 0, NULL);


--
-- Data for Name: satellitefromelon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellitefromelon VALUES (1, 'ciao', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.satellitefromelon VALUES (2, 'noia', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.satellitefromelon VALUES (3, 'molta', NULL, false, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Stella1', 1, 'boh', 1, false, NULL);
INSERT INTO public.star VALUES (2, 'Stella2', 2, 'boh', 1, false, NULL);
INSERT INTO public.star VALUES (3, 'Stella3', 1, 'boh', 1, false, NULL);
INSERT INTO public.star VALUES (4, 'Stella4', 4, 'boh', 1, false, NULL);
INSERT INTO public.star VALUES (5, 'Stella5', 1, 'boh', 1, false, NULL);
INSERT INTO public.star VALUES (6, 'Stella6', 6, 'boh', 1, false, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: satellitefromelon_satellitefromelon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellitefromelon_satellitefromelon_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_designation_key UNIQUE (designation);


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
-- Name: satellitefromelon satellitefromelon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellitefromelon
    ADD CONSTRAINT satellitefromelon_name_key UNIQUE (name);


--
-- Name: satellitefromelon satellitefromelon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellitefromelon
    ADD CONSTRAINT satellitefromelon_pkey PRIMARY KEY (satellitefromelon_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: satellitefromelon satellitefromelon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellitefromelon
    ADD CONSTRAINT satellitefromelon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

