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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_potentially_hazardous boolean,
    has_been_visited boolean,
    diameter_km numeric NOT NULL,
    mass_kg numeric NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_active boolean,
    has_blackhole boolean,
    numbers_of_star bigint,
    diameter bigint
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
    name character varying(100) NOT NULL,
    planet_id integer,
    has_atmosphere boolean,
    has_life boolean,
    radius_km numeric,
    moon_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    has_rings boolean,
    supports_life boolean,
    mass_earth_masses numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    is_visible boolean,
    is_binary_system boolean,
    temperature integer,
    age_million_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest object in the asteroid belt between Mars and Jupiter.', false, false, 946, 940000000000000000000);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'One of the largest asteroids in the asteroid belt, known for its brightness.', false, false, 525, 260000000000000000000);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'A large asteroid in the asteroid belt, discovered in 1802.', false, false, 512, 210000000000000000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, true, 100000000000, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, true, true, 1000000000000, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, true, false, 40000000000, 60000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, true, true, 160000000000, 60000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, true, true, 80000000000, 50000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 500000000, false, true, 10000000000, 150000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 3, false, false, 1737.4, 1);
INSERT INTO public.moon VALUES ('Phobos', 4, false, false, 11.27, 2);
INSERT INTO public.moon VALUES ('Deimos', 4, false, false, 6.2, 3);
INSERT INTO public.moon VALUES ('Io', 5, true, false, 1821.6, 4);
INSERT INTO public.moon VALUES ('Europa', 5, true, false, 1560.8, 5);
INSERT INTO public.moon VALUES ('Ganymede', 5, true, false, 2634.1, 6);
INSERT INTO public.moon VALUES ('Callisto', 5, true, false, 2410.3, 7);
INSERT INTO public.moon VALUES ('Titan', 6, true, false, 2576, 8);
INSERT INTO public.moon VALUES ('Rhea', 6, false, false, 763.8, 9);
INSERT INTO public.moon VALUES ('Iapetus', 6, false, false, 734.5, 10);
INSERT INTO public.moon VALUES ('Miranda', 7, false, false, 235.8, 11);
INSERT INTO public.moon VALUES ('Ariel', 7, false, false, 578.9, 12);
INSERT INTO public.moon VALUES ('Umbriel', 7, false, false, 584.7, 13);
INSERT INTO public.moon VALUES ('Titania', 7, false, false, 788.4, 14);
INSERT INTO public.moon VALUES ('Oberon', 7, false, false, 761.4, 15);
INSERT INTO public.moon VALUES ('Triton', 8, true, false, 1353.4, 16);
INSERT INTO public.moon VALUES ('Nereid', 8, false, false, 170, 17);
INSERT INTO public.moon VALUES ('Charon', 9, true, false, 606, 18);
INSERT INTO public.moon VALUES ('Europa', 10, true, false, 1560.8, 19);
INSERT INTO public.moon VALUES ('Hydra', 10, false, false, 31.2, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, false, 0.055);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, false, 0.815);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, true, 1.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, false, 0.107);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, false, 317.8);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, false, 95.2);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, false, 14.5);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, false, 17.1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, false, true, 2.4);
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, false, true, 1.3);
INSERT INTO public.planet VALUES (11, 'Vega b', 4, false, false, 3.2);
INSERT INTO public.planet VALUES (12, 'Aldebaran b', 5, false, false, 11.4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, true, true, 9940, 242);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, true, false, 3500, 8000);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, true, false, 3050, 4500);
INSERT INTO public.star VALUES (4, 'Vega', 2, true, true, 9600, 455);
INSERT INTO public.star VALUES (5, 'Aldebaran', 2, true, false, 3910, 6550);
INSERT INTO public.star VALUES (6, 'Rigel', 2, true, true, 12100, 860);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_id UNIQUE (asteroid_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


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

