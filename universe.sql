--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_type_id integer,
    size_light_years numeric,
    has_supermassive_bh boolean NOT NULL,
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    mass numeric
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer,
    is_spherical boolean NOT NULL,
    surface_pressure_pa numeric,
    discovered_year integer
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    radius_km integer,
    has_rings boolean NOT NULL,
    orbital_period_days numeric,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_solar integer,
    is_binary boolean NOT NULL
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 100000, true, 'Our home galaxy, a barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 2537000, true, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1, 2730000, false, 'Also known as M33');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 4, 13000000, true, 'A peculiar galaxy with a dust lane');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 4, 29350000, true, 'Named for its resemblance to a sombrero hat');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 1, 23000000, true, 'A grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 2, 53490000, true, 'A supergiant elliptical galaxy');
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 3, 163000, true, 'A satellite galaxy of the Milky Way');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', false, 1000000000000);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', true, 500000000000);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', false, 10000000000);
INSERT INTO public.galaxy_type VALUES (4, 'Barred Spiral', false, 800000000000);
INSERT INTO public.galaxy_type VALUES (5, 'Lenticular', true, 600000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, true, 0, -1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, false, 0, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, false, 0, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1822, true, 0, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, true, 0, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, 0, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, 0, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 84, false, 0, 1892);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 85, false, 0, 1904);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198, true, 0, 1789);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 252, true, 0, 1789);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 531, true, 0, 1684);
INSERT INTO public.moon VALUES (13, 'Dione', 6, 561, true, 0, 1684);
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 764, true, 0, 1672);
INSERT INTO public.moon VALUES (15, 'Titan', 6, 2575, true, 146700, 1655);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 735, true, 0, 1671);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 579, true, 0, 1851);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 585, true, 0, 1851);
INSERT INTO public.moon VALUES (19, 'Titania', 7, 788, true, 0, 1787);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 761, true, 0, 1787);
INSERT INTO public.moon VALUES (21, 'Miranda', 7, 236, true, 0, 1948);
INSERT INTO public.moon VALUES (22, 'Triton', 8, 1353, true, 1400, 1846);
INSERT INTO public.moon VALUES (23, 'Proteus', 8, 210, false, 0, 1989);
INSERT INTO public.moon VALUES (24, 'Nereid', 8, 170, false, 0, 1949);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, false, 88, 'Smallest planet in our solar system');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052, false, 225, 'Hottest planet due to greenhouse effect');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, false, 365, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3390, false, 687, 'The Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, true, 4333, 'Largest planet in our solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, true, 10759, 'Known for its prominent ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, true, 30687, 'Rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, true, 60190, 'Windiest planet in our solar system');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 6400, false, 11, 'Closest known exoplanet to Earth');
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, 7000, false, 1928, 'Super-Earth exoplanet');
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 2, 3000, false, 5, 'Sub-Earth exoplanet');
INSERT INTO public.planet VALUES (12, 'Sirius b', 3, 5800, false, 18250, 'White dwarf companion to Sirius');
INSERT INTO public.planet VALUES (13, 'Betelgeuse b', 4, 8000, true, 3650, 'Hypothetical planet around Betelgeuse');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 12, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 21, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 2, false);
INSERT INTO public.star VALUES (7, 'Polaris', 1, 5, true);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 1, 1, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

