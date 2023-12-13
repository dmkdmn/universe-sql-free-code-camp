--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying(30) NOT NULL,
    diameter integer,
    notes text,
    distance_from_milky_way integer
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    has_bacteria boolean,
    has_animals boolean,
    has_liquid_water boolean,
    average_temp_celsius numeric(4,0),
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    sq_km numeric(4,0),
    notes text,
    orbit_in_days integer
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
    name character varying(30) NOT NULL,
    notes text,
    is_gas boolean,
    is_solar_system boolean,
    star_id integer NOT NULL,
    num_of_moons integer NOT NULL
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    notes text,
    sq_10000km numeric(10,0)
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
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'LMC', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Milky Way', 105700, 'we live here', 0);
INSERT INTO public.galaxy VALUES (9, 'Andromeda', 220000, 'took 11 different images to composite', 2500000);
INSERT INTO public.galaxy VALUES (10, 'LMC', 14000, 'second closest to milky way', 160000);
INSERT INTO public.galaxy VALUES (11, 'Cigar Galaxy', 37000, 'its a starburst galaxy', 12000000);
INSERT INTO public.galaxy VALUES (12, 'Pinwheel Galaxy', 170000, 'largest captured photo of a pinwheel galaxy from hubble', 20870000);
INSERT INTO public.galaxy VALUES (13, 'Sombrero Galaxy', 105000, 'unclear galaxy classification', 31100000);


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, true, true, true, 15, 3, 1, 1, 'earth stuff');
INSERT INTO public.life VALUES (2, false, false, true, -65, 4, 1, 1, 'mars');
INSERT INTO public.life VALUES (3, false, false, false, 464, 2, 1, 1, 'venus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 3, 3800, NULL, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 16, 'God of Panic and Fear!', 1);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 52, 'another one for mars', 1);
INSERT INTO public.moon VALUES ('Io', 4, 5, 53, 'another goddess', 2);
INSERT INTO public.moon VALUES ('Europa', 5, 5, 3121, 'europe', 1);
INSERT INTO public.moon VALUES ('Ganymede', 6, 5, 5269, 'other stuff', 7);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, 1234, 'bad game', 8);
INSERT INTO public.moon VALUES ('Metis', 8, 5, 43, 'irregular shape', 1);
INSERT INTO public.moon VALUES ('Adrastea', 9, 5, 16, 'irregular', 1);
INSERT INTO public.moon VALUES ('Amalthea', 10, 5, 42, 'third closest orbit', 16);
INSERT INTO public.moon VALUES ('Enceladus', 11, 6, 500, 'made of ice and rock', 1);
INSERT INTO public.moon VALUES ('Tethys', 12, 6, 1045, 'lowest density of all moons', 1);
INSERT INTO public.moon VALUES ('Dione', 13, 6, 42, 'has huge cliffs', 3);
INSERT INTO public.moon VALUES ('Mimas', 14, 6, 500, 'ovoid shape', 1);
INSERT INTO public.moon VALUES ('Titan', 15, 6, 1045, 'second largest moon in the solar system', 1);
INSERT INTO public.moon VALUES ('Rhea', 16, 6, 42, 'has impact crater known as inktomi', 3);
INSERT INTO public.moon VALUES ('Methone', 17, 6, 500, 'faint ring arcs', 1);
INSERT INTO public.moon VALUES ('Anthe', 18, 6, 1045, 'also has a faint ring arc', 1);
INSERT INTO public.moon VALUES ('Pallene', 19, 6, 42, 'complete rings similar to saturn', 3);
INSERT INTO public.moon VALUES ('Helene', 20, 6, 500, 'orbits Tethys as well as Saturn', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, false, true, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, false, true, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, false, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, false, true, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, true, true, 1, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, true, true, 1, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, true, true, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, true, true, 1, 14);
INSERT INTO public.planet VALUES (10, 'Pluto', NULL, false, true, 1, 0);
INSERT INTO public.planet VALUES (11, 'Ceres', NULL, false, true, 1, 0);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', NULL, false, false, 7, 0);
INSERT INTO public.planet VALUES (13, 'Eris', NULL, false, true, 1, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Ursa Major', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Mirach', 2, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Almach', 2, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Kepler-452', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: life const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT const UNIQUE (name);


--
-- Name: galaxy galaxy_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_notes_key UNIQUE (notes);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


--
-- Name: moon moon_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_notes_key UNIQUE (notes);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_notes_key UNIQUE (notes);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_notes_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_notes_key UNIQUE (notes);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

