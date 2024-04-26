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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    star_id integer,
    absolute_magnitude numeric(4,2),
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    description text
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(25) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_ly integer,
    has_life boolean,
    is_spherical boolean,
    absolute_magnitude numeric(4,2),
    description text
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    absolute_magnitude numeric(4,2),
    planet_id integer,
    description text
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_au numeric(20,2),
    has_life boolean,
    is_spherical boolean,
    absolute_magnitude numeric(4,2),
    star_id integer,
    description text,
    moons integer
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_ly integer,
    has_life boolean,
    is_spherical boolean,
    absolute_magnitude numeric(4,2),
    galaxy_id integer,
    description text,
    planets integer
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 1, -0.44, 'Pluto', 4600, 40, false, true, NULL);
INSERT INTO public.dwarf_planet VALUES (2, 1, 3.34, 'Ceres', 4600, 533250000, false, true, NULL);
INSERT INTO public.dwarf_planet VALUES (3, 1, -1.21, 'Eris', 4600, 86, false, true, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 0, true, false, -20.50, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1800, 2500000, false, false, -21.40, NULL);
INSERT INTO public.galaxy VALUES (3, 'NGC 4414', 13600, 62300000, false, false, -0.45, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', NULL, 3000000, false, false, -19.10, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', NULL, 163000, false, false, -17.59, NULL);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', NULL, 190000, false, false, -16.21, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4600, 363304, false, true, 0.20, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4600, 206650000, false, true, 10.70, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4600, 206650000, false, true, 11.75, 4, NULL);
INSERT INTO public.moon VALUES (6, 'Sinope', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Io', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Europa', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Ganymede', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Callisto', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Amalthea', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Himalia', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Elara', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Pasiphae', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Lysithea', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (16, 'Carme', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (17, 'Ananke', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (18, 'Leda', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (19, 'Adrastea', NULL, NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (20, 'Titan', NULL, NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Titania', NULL, NULL, NULL, NULL, NULL, 8, NULL);
INSERT INTO public.moon VALUES (22, 'Triton', NULL, NULL, NULL, NULL, NULL, 9, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4600, 1.04, false, true, -0.40, 1, NULL, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 4600, 1.14, false, true, 15.60, 1, NULL, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 4600, 0.00, true, true, -3.99, 1, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4600, 1.70, false, true, -1.50, 1, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600, 5.20, false, true, -9.40, 1, NULL, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 4600, 9.50, false, true, -9.70, 1, NULL, 146);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 4850, 268553.23, false, true, 5.68, 3, NULL, 0);
INSERT INTO public.planet VALUES (8, 'Uranus', 4600, 18.00, false, true, -7.20, 1, NULL, 28);
INSERT INTO public.planet VALUES (9, 'Neptune', 4600, 30.00, false, true, -6.90, 1, NULL, 16);
INSERT INTO public.planet VALUES (10, 'Barnard''s star b', 70000, 379446.00, false, true, 13.20, 4, NULL, 0);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', 4850, 268395.13, false, true, NULL, 3, NULL, 0);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', 4850, 268395.13, false, true, NULL, 3, NULL, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4850, 4, false, true, 15.60, 1, NULL, 3);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 4850, 4, false, true, 4.40, 1, NULL, 0);
INSERT INTO public.star VALUES (4, 'Barnard''s star', 10000, 6, false, true, 13.20, 1, NULL, 1);
INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, false, true, 4.83, 1, NULL, 8);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 4850, 4, false, true, 5.70, 1, NULL, 0);
INSERT INTO public.star VALUES (6, 'Sirius', 225, 8, false, true, 1.90, 1, NULL, 0);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

