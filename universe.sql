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
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(30,10),
    shape character varying(20)
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    planet_id integer
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
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    star_id integer
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
-- Name: planet_star_relation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_star_relation (
    planet_star_relation_id character varying(40) NOT NULL,
    has_life boolean,
    galaxy_id integer NOT NULL,
    dimension numeric(10,4),
    name character varying(10)
);


ALTER TABLE public.planet_star_relation OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer,
    dimension numeric(10,4)
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 0.0000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2200, 2.5000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 400, 3.0000000000, 'Irregular');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 1000, 28.5000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 750, 31.7000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 21, 21.0000000000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 'Description 1', false, 13);
INSERT INTO public.moon VALUES (2, 'Moon 2', 'Description 2', false, 13);
INSERT INTO public.moon VALUES (3, 'Moon 3', 'Description 3', false, 14);
INSERT INTO public.moon VALUES (4, 'Moon 4', 'Description 4', false, 14);
INSERT INTO public.moon VALUES (5, 'Moon 5', 'Description 5', false, 15);
INSERT INTO public.moon VALUES (6, 'Moon 6', 'Description 6', false, 15);
INSERT INTO public.moon VALUES (7, 'Moon 7', 'Description 7', false, 16);
INSERT INTO public.moon VALUES (8, 'Moon 8', 'Description 8', false, 16);
INSERT INTO public.moon VALUES (9, 'Moon 9', 'Description 9', false, 17);
INSERT INTO public.moon VALUES (10, 'Moon 10', 'Description 10', false, 17);
INSERT INTO public.moon VALUES (11, 'Moon 11', 'Description 11', false, 18);
INSERT INTO public.moon VALUES (12, 'Moon 12', 'Description 12', false, 18);
INSERT INTO public.moon VALUES (13, 'Moon 13', 'Description 13', false, 19);
INSERT INTO public.moon VALUES (14, 'Moon 14', 'Description 14', false, 19);
INSERT INTO public.moon VALUES (15, 'Moon 15', 'Description 15', false, 20);
INSERT INTO public.moon VALUES (16, 'Moon 16', 'Description 16', false, 20);
INSERT INTO public.moon VALUES (17, 'Moon 17', 'Description 17', false, 21);
INSERT INTO public.moon VALUES (18, 'Moon 18', 'Description 18', false, 21);
INSERT INTO public.moon VALUES (19, 'Moon 19', 'Description 19', false, 22);
INSERT INTO public.moon VALUES (20, 'Moon 20', 'Description 20', false, 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 4500, true, 1);
INSERT INTO public.planet VALUES (14, 'Mars', 4000, false, 2);
INSERT INTO public.planet VALUES (15, 'Venus', 4700, false, 3);
INSERT INTO public.planet VALUES (16, 'Jupiter', 5000, false, 4);
INSERT INTO public.planet VALUES (17, 'Saturn', 4900, false, 5);
INSERT INTO public.planet VALUES (18, 'Mercury', 4800, false, 6);
INSERT INTO public.planet VALUES (19, 'Neptune', 5200, false, 1);
INSERT INTO public.planet VALUES (20, 'Uranus', 5100, false, 2);
INSERT INTO public.planet VALUES (21, 'Pluto', 4800, false, 3);
INSERT INTO public.planet VALUES (22, 'Kepler-186f', 1000, true, 4);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 2000, false, 5);
INSERT INTO public.planet VALUES (24, 'Trappist-1e', 100, true, 6);


--
-- Data for Name: planet_star_relation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_star_relation VALUES ('Earth', true, 1, 3.4500, NULL);
INSERT INTO public.planet_star_relation VALUES ('Mars', false, 1, 5.6700, NULL);
INSERT INTO public.planet_star_relation VALUES ('Venus', false, 2, 4.1200, NULL);
INSERT INTO public.planet_star_relation VALUES ('Jupiter', false, 2, 2.9800, NULL);
INSERT INTO public.planet_star_relation VALUES ('Saturn', false, 3, 6.5400, NULL);
INSERT INTO public.planet_star_relation VALUES ('Mercury', false, 3, 1.2300, NULL);
INSERT INTO public.planet_star_relation VALUES ('Neptune', false, 1, 3.4500, NULL);
INSERT INTO public.planet_star_relation VALUES ('Uranus', false, 1, 5.6700, NULL);
INSERT INTO public.planet_star_relation VALUES ('Pluto', false, 2, 4.1200, NULL);
INSERT INTO public.planet_star_relation VALUES ('Kepler-186f', true, 2, 2.9800, NULL);
INSERT INTO public.planet_star_relation VALUES ('HD 209458 b', false, 3, 6.5400, NULL);
INSERT INTO public.planet_star_relation VALUES ('Trappist-1e', true, 3, 1.2300, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star1', 5, 1, 3.4500);
INSERT INTO public.star VALUES (2, 'Star2', 7, 1, 5.6700);
INSERT INTO public.star VALUES (3, 'Star3', 6, 2, 4.1200);
INSERT INTO public.star VALUES (4, 'Star4', 4, 2, 2.9800);
INSERT INTO public.star VALUES (5, 'Star5', 8, 3, 6.5400);
INSERT INTO public.star VALUES (6, 'Star6', 3, 3, 1.2300);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_star_relation pk_onemore; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star_relation
    ADD CONSTRAINT pk_onemore PRIMARY KEY (planet_star_relation_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: planet_star_relation unique_planet_name_relation; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star_relation
    ADD CONSTRAINT unique_planet_name_relation UNIQUE (planet_star_relation_id);


--
-- Name: planet fk_closest_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_closest_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_in_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_in_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_in_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_in_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

