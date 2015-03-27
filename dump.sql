--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: four_oh_fours; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE four_oh_fours (
    id integer NOT NULL,
    host character varying(255),
    path character varying(255),
    referer character varying(255),
    count integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE four_oh_fours OWNER TO nathanwise;

--
-- Name: four_oh_fours_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE four_oh_fours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE four_oh_fours_id_seq OWNER TO nathanwise;

--
-- Name: four_oh_fours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE four_oh_fours_id_seq OWNED BY four_oh_fours.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE menu_items (
    id integer NOT NULL,
    "position" integer,
    parent_id integer,
    label character varying(255),
    page_id character varying(255),
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE menu_items OWNER TO nathanwise;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE menu_items_id_seq
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_items_id_seq OWNER TO nathanwise;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE menu_items_id_seq OWNED BY menu_items.id;


--
-- Name: page_versions; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE page_versions (
    id integer NOT NULL,
    page_id integer,
    version integer,
    url_tag character varying(255),
    title character varying(255),
    html_title character varying(255),
    keywords character varying(255),
    description character varying(255),
    content text,
    published boolean,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE page_versions OWNER TO nathanwise;

--
-- Name: page_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE page_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE page_versions_id_seq OWNER TO nathanwise;

--
-- Name: page_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE page_versions_id_seq OWNED BY page_versions.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    url_tag character varying(255),
    title character varying(255),
    html_title character varying(255),
    keywords character varying(255),
    description character varying(255),
    content text,
    published boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    version integer
);


ALTER TABLE pages OWNER TO nathanwise;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pages_id_seq OWNER TO nathanwise;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: realtors; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE realtors (
    id integer NOT NULL,
    name character varying(255),
    phone_number character varying(255),
    cell_number character varying(255),
    voicemail_number character varying(255),
    email character varying(255),
    website character varying(255),
    bio_link character varying(255),
    url_tag character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer
);


ALTER TABLE realtors OWNER TO nathanwise;

--
-- Name: realtors_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE realtors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE realtors_id_seq OWNER TO nathanwise;

--
-- Name: realtors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE realtors_id_seq OWNED BY realtors.id;


--
-- Name: rights; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE rights (
    id integer NOT NULL,
    name character varying(255),
    controller character varying(255),
    action character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rights OWNER TO nathanwise;

--
-- Name: rights_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rights_id_seq OWNER TO nathanwise;

--
-- Name: rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE rights_id_seq OWNED BY rights.id;


--
-- Name: rights_roles; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE rights_roles (
    right_id integer,
    role_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rights_roles OWNER TO nathanwise;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE roles OWNER TO nathanwise;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO nathanwise;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE roles_users (
    role_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE roles_users OWNER TO nathanwise;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO nathanwise;

--
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE user_sessions (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE user_sessions OWNER TO nathanwise;

--
-- Name: user_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE user_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_sessions_id_seq OWNER TO nathanwise;

--
-- Name: user_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE user_sessions_id_seq OWNED BY user_sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    crypted_password character varying(255),
    password_salt character varying(255),
    persistence_token character varying(255),
    perishable_token character varying(255),
    login_count integer DEFAULT 0 NOT NULL,
    failed_login_count integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_login_at timestamp without time zone,
    last_login_at timestamp without time zone,
    current_login_ip character varying(255),
    last_login_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE users OWNER TO nathanwise;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nathanwise
--

CREATE SEQUENCE users_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO nathanwise;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nathanwise
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY four_oh_fours ALTER COLUMN id SET DEFAULT nextval('four_oh_fours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY menu_items ALTER COLUMN id SET DEFAULT nextval('menu_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY page_versions ALTER COLUMN id SET DEFAULT nextval('page_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY realtors ALTER COLUMN id SET DEFAULT nextval('realtors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY rights ALTER COLUMN id SET DEFAULT nextval('rights_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY user_sessions ALTER COLUMN id SET DEFAULT nextval('user_sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nathanwise
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: four_oh_fours; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY four_oh_fours (id, host, path, referer, count, created_at, updated_at) FROM stdin;
\.


--
-- Name: four_oh_fours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('four_oh_fours_id_seq', 1, false);


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY menu_items (id, "position", parent_id, label, page_id, url, created_at, updated_at) FROM stdin;
11	7	1	Selling Your Home	4		2009-10-28 19:57:21	2009-10-28 19:57:21
1	1	\N	Main Menu			2009-10-28 19:10:12	2009-10-28 19:10:12
12	8	1	Mortgage Calculators		http://dinkytown.net/	2009-10-28 19:57:50	2009-10-28 19:57:50
2	1	1	Home		/	2009-10-28 19:15:18	2009-10-28 19:15:18
13	9	1	County Public Record Sites 	5		2009-10-28 20:08:49	2009-10-28 20:08:49
14	10	1	County Sheriff Sale Sites	6		2009-10-28 20:12:20	2009-10-28 20:13:21
4	3	\N	Admin Menu			2009-10-28 19:30:33	2009-10-28 19:30:33
15	11	1	USA City Data & Information		http://www.city-data.com/	2009-10-28 20:13:58	2009-10-28 20:13:58
5	3	4	Edit Pages		/admin/pages	2009-10-28 19:30:45	2009-10-28 19:30:45
16	12	1	Local Weather Information		http://www.erh.noaa.gov/ifps/MapClick.php?CityName=Ravenna&state=OH&site=CLE	2009-10-28 20:14:19	2009-10-28 20:14:19
6	4	4	Edit Menu Items		/admin/menu_items	2009-10-28 19:31:02	2009-10-28 19:31:02
17	13	1	Let Us Help You Relocate	7		2009-10-28 20:20:18	2009-10-28 20:39:29
7	5	1	Meet Our Realtors		/our-realtors	2009-10-28 19:55:14	2010-07-23 00:36:17
18	14	1	A Career In Real Estate	8		2009-10-28 20:20:30	2009-10-28 20:45:12
8	2	1	About Our Company	2		2009-10-28 19:55:39	2009-10-28 19:55:56
19	15	1	Real Estate Resources	9		2009-10-28 20:20:40	2009-10-28 20:45:22
20	16	1	Contact Us!		/contact-us	2009-10-28 20:20:50	2009-10-28 20:45:43
10	6	1	The Best Way To Buy  A Home	3		2009-10-28 19:57:05	2010-07-23 00:36:17
21	17	4	Edit Realtors		/admin/realtors	2010-03-04 20:20:24	2010-03-04 20:20:24
3	3	1	Ohio Realty Group Listings		http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=07f5137	2009-10-28 19:16:03	2014-08-27 01:23:43.468456
9	4	1	Full MLS Search		http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=9272136	2009-10-28 19:56:23	2014-08-27 01:24:36.828727
\.


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('menu_items_id_seq', 22, false);


--
-- Data for Name: page_versions; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY page_versions (id, page_id, version, url_tag, title, html_title, keywords, description, content, published, updated_at, created_at) FROM stdin;
11	9	1	real-estate-resources	Real Estate Resources	Real Estate Resources			Online Information<ul>\n<li class="links"><a target="_BLANK" href="http://www.jumphome.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Change your utilities online</a></li>\n<li class="links"><a target="_BLANK" href="http://www.iplace.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">FREE Credit Reports</a></li>\n\n<li class="links"><a target="_BLANK" href="http://www.welcomewagon.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Welcome Wagon</a></li>\n<li class="links"><a target="_BLANK" href="http://www.firstenergy.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Make your energy choices</a></li>\n<li class="links"><a target="_BLANK" href="http://www.usps.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Change your address online</a></li>\n<li class="links"><a target="_BLANK" href="http://www.lendinguniverse.com" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Credit Problem Assistance</a></li>\n</ul>Moving Information<ul>\n<li class="links"><a target="_BLANK" href="http://webcom.com/~greeting/cleveland/69ways/69ways.html" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Sell your home FASTER!!</a></li>\n<li class="links"><a target="_BLANK" href="http://www.newcomersclub.com/oh.html" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Newcomers Club</a></li>\n<li class="links"><a target="_BLANK" href="http://www.census.gov/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">U.S. Census</a></li>\n<li class="links"><a target="_BLANK" href="http://www.uhaul.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">U-Haul</a></li>\n\n<li class="links"><a target="_BLANK" href="http://www.ryder.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Ryder Truck</a></li>\n<li class="links"><a target="_BLANK" href="http://www.mayflower.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Mayflower Movers</a></li>\n</ul>Attractions<ul>\n<li class="links"><a target="_BLANK" href="http://www.clevelandindians.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">The Cleveland Indians</a></li>\n<li class="links"><a target="_BLANK" href="http://www.clevelandbrowns.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">The Cleveland Browns</a></li>\n<li class="links"><a target="_BLANK" href="http://www.nba.com/cavs" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">The Cleveland Cavaliers</a></li>\n<li class="links"><a target="_BLANK" href="http://www.geaugalake.com" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Geauga Lake</a></li>\n<li class="links"><a target="_BLANK" href="http://www.rockhall.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">The Rock &amp; Roll Hall of Fame</a></li>\n\n<li class="links"><a target="_BLANK" href="http://www.play18.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Set up a TEE Time!!</a></li>\n<li class="links"><a target="_BLANK" href="http://www.cedarpoint.com" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Cedar Point</a></li>\n</ul>Local Info<ul>\n<li class="links"><a target="_BLANK" href="http://www.cleveland.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Cleveland Info</a></li>\n<li class="links"><a target="_BLANK" href="http://www.sunnews.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Suburb Info</a></li>\n<li class="links"><a target="_BLANK" href="http://www.plaindealer.com/" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">The Plain Dealer Newspapers</a></li>\n<li class="links"><a target="_BLANK" href="http://www.weather.com/outlook/recreation/local/44266?whatprefs=&amp;y=10&amp;x=25" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Local Weather</a></li>\n<li class="links"><a target="_BLANK" href="http://ohio.uscity.net/#S" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Anything You Want to Know About Ohio</a></li>\n<li class="links"><a target="_BLANK" href="http://epodunk.com/profiles/oh_a.html" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Local City Information Throughout Ohio</a></li>\t\t\t\t\t\t\t\t\t\t\n\n<li class="links"><a target="_BLANK" href="http://www.oplin.lib.oh.us/index.cfm?ID=1833" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">All Ohio Schools</a></li>\n<li class="links"><a target="_BLANK" href="www.kent.edu" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">Kent State University</a></li>\n<li class="links"><a target="_BLANK" href="http://www.acs.ohio-state.edu" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">The Ohio State University</a></li>\n<li class="links"><a target="_BLANK" href="http://www.beaconjournal.com" onMouseOver="\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\n\t\t\t\t \t\t" onMouseOut="\n\t\t\t\t\t\t\tstatusMsg('');return(true);\n\t\t\t\t\t\t">The Akron Beacon Journal</a></li>\n</ul>	t	2009-10-28 20:44:54	\N
1	1	1	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the ex-pertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\n<p><img width="127" height="107" border="0" src="http://www.OhioRealtyGroup.com/ohio_reality_logo_high_res.jpg" alt="" /></p>\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\n<ul> <strong>  </strong>\n    <li><strong><a href="http://crismls.rapmls.com/scripts/mgrqispi.dll?APPNAME=Crisoh&amp;PRGNAME=MLSLogin&amp;ARGUMENT=FE8KneTGhu%2Fjet%2BaVCUGIg%3D%3D" class="plinks" target="_self">Ohio Realty Group Listings</a></strong></li>\n    <strong>  </strong>\n    <li><strong><a target="_self" class="plinks" href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&amp;KeyRid=1">Search All MLS Listings</a></strong></li>\n</ul>	\N	2009-10-28 18:34:55	\N
2	1	2	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the ex-pertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\n<p><img width="127" height="107" border="0" alt="" src="http://www.OhioRealtyGroup.com/ohio_reality_logo_high_res.jpg" /></p>\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\n<ul> <strong>  </strong>\n    <li><strong><a target="_self" class="plinks" href="http://crismls.rapmls.com/scripts/mgrqispi.dll?APPNAME=Crisoh&amp;PRGNAME=MLSLogin&amp;ARGUMENT=FE8KneTGhu%2Fjet%2BaVCUGIg%3D%3D">Ohio Realty Group Listings</a></strong></li>\n    <strong>  </strong>\n    <li><strong><a href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&amp;KeyRid=1" class="plinks" target="_self">Search All MLS Listings</a></strong></li>\n</ul>	t	2009-10-28 19:14:27	\N
3	2	1	about-us	About Our Company	About Our Company			<h2>Ohio Realty Group</h2>\n<p>320 E. Main Street<br />\nRavenna, OH 44266<br />\nOffice - 330-296-9000<br />\nFax - 330-297-8723</p>\n<p>Ohio Realty Group serves Summit and Portage Counties as well as parts of Stark and Medina Counties.</p>\n<p>We have many qualified, active Sales Associates. Many holding professional designations such as CRS (Certified Residential Specialist), ABR (Accredited Buyer Representative), and CSP (Certified Sales Professional).</p>\n<p>We have several Sales Associates who have been recognized internationally for their sales production.</p>\n<p>Ohio Realty Group is conveniently located in Ravenna, Ohio, which is the County Seat of Portage county and allows for easy access to Summit and Stark Counties.</p>\n<p><img width="140" height="113" border="0" src="/images/ohio_reality_logo_low_res.jpg" alt="" /></p>	t	2009-10-28 19:38:55	\N
4	1	3	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the ex-pertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\n<p><img width="127" height="107" border="0" src="/images/ohio_reality_logo_high_res.jpg" alt="" /></p>\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\n<ul> <strong>  </strong>\n    <li><strong><a href="http://crismls.rapmls.com/scripts/mgrqispi.dll?APPNAME=Crisoh&amp;PRGNAME=MLSLogin&amp;ARGUMENT=FE8KneTGhu%2Fjet%2BaVCUGIg%3D%3D" class="plinks" target="_self">Ohio Realty Group Listings</a></strong></li>\n    <strong>  </strong>\n    <li><strong><a target="_self" class="plinks" href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&amp;KeyRid=1">Search All MLS Listings</a></strong></li>\n</ul>	t	2009-10-28 19:39:16	\N
5	3	1	buying-tips	Buying Tips	Buying Tips			<h2>Our Reputation Is Built On Recommendations</h2>\n\n<p>Buying a home may be the biggest investment you'll ever make. So you should be as prepared as possible, and ready for anything, with a trusted professional at your side. That's where a Buyer Representative from Ohio Realty Group can be a very valuable ally. We're ready to provide you with the proper information to help you make a good decisions, and to serve your best interests every step of the way.</p>\n<p>\n<strong>What Your Buyer Representative Does For You</strong>\n<ul>\n  <li>Uses state of the art technology tools to help you find the right home in the right location</li>\n  <li>Helps you evaluate specific properties</li>\n  <li>Helps you determine a fair market value</li>\n  <li>Works with you to develop negotiating strategies specific to the property and seller</li>\n  <li>Assists you in determining the most favorable price and terms to offer</li>\n  <li>Assists you in closing the transaction</li>\n  <li>Makes available to you the full-service shopping convenience of home-related products and services through our Preferred Partner Program</li>\n</ul>\n<p>For more information on buying a home, please  <a href="/contact-us">e-mail us</a> or call us at 330-296-9000.</p>	t	2009-10-28 19:45:12	\N
6	4	1	selling-tips	Selling Tips	Selling Tips			<h2>We Deliver Results to You!</h2>\n\n<p>Who represents you in selling your home is one of the most important decisions you will make. The two most important elements to consider are the company and the Sales Associate.</p>\n\n<p><span class=Content1Title>Here's why you should choose Ohio Realty Group:</span></p>\n<ul>\n  <li>Most aggressive marketing and advertising program in the area. </li>\n  <li>Our office is strategically located in a prime area increasing consumer awareness.</li>\n  <li>Many professionally trained Sales Associates are working as a team for you.</li>\n  <li>Ohio Realty Group guarantees your satisfaction!</li>\n  <li>Selling your home in today's market is much more complex than even a few years ago. Our Career Development Department continually keeps all of our Sales Associates up-to-date on the ever-increasing legislation and federal requirements.</li>\n</ul>\n<p>If you are considering selling your home, please <a href="/contact-us">e-mail us</a> or call us at 330-296-9000 for a FREE, no-obligation Market Analysis.</p>	t	2009-10-28 19:48:25	\N
7	5	1	public-records-information	Public Records Information	Public Records Information			<h2>Public Records Information</h2>\n\n<strong>County Auditor's Web Sites:</strong>\n\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/fiscaloffice/defaultwebapps.htm">Summit County Auditor</a></p>\n<p><a target="_BLANK" href="http://www.auditor.co.stark.oh.us/AccuGlobe/iView.asp">Stark County Auditor</a></p>\n<p><a target="_BLANK" href="http://portagepropertymax.governmaxa.com/propertymax/rover30.asp">Portage County Auditor</a></p>\n<p><a target="_BLANK" href="http://auditor.cuyahogacounty.us/repi/default.asp">Cuyahoga County Auditor</a></p>\n<p><a target="_BLANK" href="http://medinacountyauditor.org/pptylook.htm">Medina County Auditor</a></p>\n<p><a target="_BLANK" href="http://www.auditor.co.geauga.oh.us/ag/">Geauga County Auditor</a></p>\n<p><a target="_BLANK" href="http://www.mahoningcountyauditor.org/propertymax/rover30.asp?sid=E2919BAA166844A1853EEB88553D829C">Mahoning County Auditor</a></p>\n<p><a target="_BLANK" href="http://208.4.223.96:7036/propertysearch/ureca_asp/index.htm" >Trumbull County Auditor</a></p>	t	2009-10-28 20:07:36	\N
8	6	1	sheriff-sales-info	Sheriff Sales Information	Sheriff Sales Information			<h2>Sheriff Sales Information</h2>\n<p><strong>Sheriff's Auction Sales Sites:</strong></p>\n\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/sheriff/sales.htm">Summit County Sheriff</a></p>\n<p><a target="_BLANK" href="http://www.sheriff.co.stark.oh.us/pr18.htm">Stark County Sheriff</a></p>\n<p><a target="_BLANK" href="http://www.cuyahoga.oh.us/sheriff/foreclosures/default.asp">Cuyahoga County Sheriff</a></p>\n<p><a target="_BLANK" href="http://www.sheriff.geauga.oh.us/Civil.htm">Geauga County Sheriff</a></p>\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/sheriffsales.htm">Portage County Sheriff</a></p>	t	2009-10-28 20:12:05	\N
9	7	1	our-pledge	Our Pledge	Our Pledge			<h2>Our Pledge to You</h2>\n<p>Thank you for visiting our Web site today. We appreciate the opportunity to assist you with your real estate needs. Whether you are relocating to Ohio from another state or country, moving across town, upgrading or downsizing, Ohio Realty Group's Relocation Services Division can make it a smooth, hassle-free experience.</p>\n<p>Our Award winning Sales Associates guide you through the maze of infinite details surrounding the purchase or sale of your home. Helping you become familiar with a new area, finding the right home for your family, arranging financing, and settling-in in a timely fashion, is our priority. Assuring that your relocation is a pleasant experience is our ultimate goal.</p>\n<p>If you have a home to sell in the area, Ohio Realty Group gives maximum exposure to assure you of reaching the best qualified buyers in today's real estate market. If you are moving here from a different locale, we have the power to place you with a top real estate firm to assist you in marketing your present home.</p>\n<p>Our continued commitment to excellence will provide you with outstanding  service and satisfaction.</p>	t	2009-10-28 20:17:32	\N
10	8	1	careers	Careers	Careers			<h2>Join the Award-Winning Team!</h2>\n<p><strong>OPPORTUNITY</strong></p>\n<p>Imagine selling something that everyone wants to buy!</p>\n<p>Few professions offer the same opportunities as real estate sales, and no other real estate organization can offer the same opportunities as Ohio Realty Group.</p>\n<p>As an Ohio Realty Group Sales Associate, you will acquire our solid, respected image. As one of Ohio's most successful groups of Real Estate Professionals, Ohio Realty Group has captivated consumer awareness, influenced consumer preference and earned consumer satisfaction. The strength of this industry wide reputation opens more doors for you and that means more opportunities to earn more income.</p>\n<p><strong>TRAINING &amp; TECHNOLOGY</strong></p>\n<p>What do you need to be the best? The right resources and tools to help you make the sale!</p>\n<p>Ohio Realty Group's professional staff provides outstanding support. Our &quot;fast-start&quot; training covers topics from listings and buyer representation to business development and more. As you continue your career path with us you'll see for yourself how our diverse training curriculum helps you stay on the leading edge of our ever-changing industry.</p>\n<p><strong>AWARDS &amp; RECOGNITION</strong></p>\n<p>When you join Ohio Realty Group, your outstanding efforts are recognized with one of the most comprehensive and successful awards and recognition programs in the industry at the State and Real Estate Board level.</p>\n<p><strong>A HOME FOR YOUR CAREER</strong></p>\n<p>Ohio Realty Group is known for finding the right homes for our customers. But we are also known for finding the right people for our sales team who want more from their professional lives. So if you are looking for ...</p>\n<ul>\n    <li>An exciting and rewarding career</li>\n    <li>The opportunity to work with the Premier Real Estate resource in Northeast Ohio.</li>\n    <li>A chance at proving to yourself and others just how successful you can be</li>\n</ul>\n<p>... then consider a career with Ohio Realty Group.  The right home for your real estate sales career.</p>	t	2009-10-28 20:43:25	\N
12	9	2	real-estate-resources	Real Estate Resources	Real Estate Resources			<p>Online Information</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.jumphome.com/">Change your utilities online</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.iplace.com/">FREE Credit Reports</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.welcomewagon.com/">Welcome Wagon</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.firstenergy.com/">Make your energy choices</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.usps.com/">Change your address online</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.lendinguniverse.com">Credit Problem Assistance</a></li>\r\n</ul>\r\n<p>Moving Information</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://webcom.com/~greeting/cleveland/69ways/69ways.html">Sell your home FASTER!!</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.newcomersclub.com/oh.html">Newcomers Club</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.census.gov/">U.S. Census</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.uhaul.com/">U-Haul</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.ryder.com/">Ryder Truck</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.mayflower.com/">Mayflower Movers</a></li>\r\n</ul>\r\n<p>Attractions</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.clevelandindians.com/">The Cleveland Indians</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.clevelandbrowns.com/">The Cleveland Browns</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.nba.com/cavs">The Cleveland Cavaliers</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.geaugalake.com">Geauga Lake</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.rockhall.com/">The Rock &amp; Roll Hall of Fame</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.play18.com/">Set up a TEE Time!!</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.cedarpoint.com">Cedar Point</a></li>\r\n</ul>\r\n<p>Local Info</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.cleveland.com/">Cleveland Info</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.sunnews.com/">Suburb Info</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.plaindealer.com/">The Plain Dealer Newspapers</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.weather.com/outlook/recreation/local/44266?whatprefs=&amp;y=10&amp;x=25">Local Weather</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://ohio.uscity.net/#S">Anything You Want to Know About Ohio</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://epodunk.com/profiles/oh_a.html">Local City Information Throughout Ohio</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.oplin.lib.oh.us/index.cfm?ID=1833">All Ohio Schools</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.kent.edu">Kent State University</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.acs.ohio-state.edu">The Ohio State University</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.beaconjournal.com">The Akron Beacon Journal</a></li>\r\n</ul>	t	2011-09-05 17:00:10.937198	\N
13	5	2	public-records-information	Public Records Information	Public Records Information			<h2>Public Records Information</h2>\r\n<p><strong>County Auditor's Web Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/fiscaloffice/defaultwebapps.htm">Summit County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.auditor.co.stark.oh.us/">Stark County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://portagepropertymax.governmaxa.com/propertymax/rover30.asp">Portage County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://auditor.cuyahogacounty.us/repi/default.asp">Cuyahoga County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.medinacountyauditor.org/">Medina County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.auditor.co.geauga.oh.us/ag/">Geauga County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.mahoningcountyauditor.org/propertymax/rover30.asp?sid=E2919BAA166844A1853EEB88553D829C">Mahoning County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.auditor.co.trumbull.oh.us/">Trumbull County Auditor</a></p>	t	2011-09-05 17:09:17.896594	\N
14	6	2	sheriff-sales-info	Sheriff Sales Information	Sheriff Sales Information			<h2>Sheriff Sales Information</h2>\r\n<p><strong>Sheriff's Auction Sales Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/sheriff/sales.htm">Summit County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.stark.oh.us/">Stark County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.cuyahoga.oh.us/sheriff/foreclosures/default.asp">Cuyahoga County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.geauga.oh.us/">Geauga County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/sheriffsales.htm">Portage County Sheriff</a></p>	t	2011-09-05 17:10:32.684588	\N
15	9	3	real-estate-resources	Real Estate Resources	Real Estate Resources			<p>Online Information</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.jumphome.com/">Change your utilities online</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.iplace.com/">FREE Credit Reports</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.welcomewagon.com/">Welcome Wagon</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.firstenergy.com/">Make your energy choices</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.usps.com/">Change your address online</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.lendinguniverse.com">Credit Problem Assistance</a></li>\r\n</ul>\r\n<p>Moving Information</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://webcom.com/~greeting/cleveland/69ways/69ways.html">Sell your home FASTER!!</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.newcomersclub.com/oh.html">Newcomers Club</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.census.gov/">U.S. Census</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.uhaul.com/">U-Haul</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.ryder.com/">Ryder Truck</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.mayflower.com/">Mayflower Movers</a></li>\r\n</ul>\r\n<p>Attractions</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.clevelandindians.com/">The Cleveland Indians</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.clevelandbrowns.com/">The Cleveland Browns</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.nba.com/cavs">The Cleveland Cavaliers</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.geaugalake.com">Geauga Lake</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.rockhall.com/">The Rock &amp; Roll Hall of Fame</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.play18.com/">Set up a TEE Time!!</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.cedarpoint.com">Cedar Point</a></li>\r\n</ul>\r\n<p>Local Info</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.cleveland.com/">Cleveland Info</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.sunnews.com/">Suburb Info</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.plaindealer.com/">The Plain Dealer Newspapers</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.weather.com/outlook/recreation/local/44266?whatprefs=&amp;y=10&amp;x=25">Local Weather</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://ohio.uscity.net/#S">Anything You Want to Know About Ohio</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://epodunk.com/profiles/oh_a.html">Local City Information Throughout Ohio</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.oplin.lib.oh.us/index.cfm?ID=1833">All Ohio Schools</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.kent.edu">Kent State University</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.acs.ohio-state.edu">The Ohio State University</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.thebeaconjournal.com">The Akron Beacon Journal</a></li>\r\n</ul>	t	2011-09-05 17:12:47.29743	\N
16	1	4	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\r\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\r\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the ex-pertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\r\n<p><img width="127" height="107" border="0" alt="" src="/images/ohio_reality_logo_high_res.jpg" /></p>\r\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\r\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\r\n<ul> <strong>  </strong>\r\n    <li><strong><a class="plinks" target="_self" href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=1%2BkYz3TdENBt6h06ma9n%2BamvUxMz9B7DjC8Bqf3cnrY%3D&amp;KeyRid=1">Ohio Realty Group Listings</a></strong></li>\r\n    <strong>  </strong>\r\n    <li><strong><a target="_self" class="plinks" href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&amp;KeyRid=1">Search All MLS Listings</a></strong></li>\r\n</ul>	t	2011-09-05 20:14:11.08553	\N
17	2	2	about-us	About Our Company	About Our Company			<h2>Ohio Realty Group</h2>\r\n\r\n<p>320 E. Main Street<br />\r\nRavenna, OH 44266<br />\r\nOffice - 330-296-9000<br />\r\nFax - 330-297-8723</p>\r\n<p>Ohio Realty Group serves Summit and Portage Counties as well as parts of Stark and Medina Counties.</p>\r\n<p>We have many qualified, active Sales Associates. Many holding professional designations such as CRS (Certified Residential Specialist), ABR (Accredited Buyer Representative), and CSP (Certified Sales Professional).</p>\r\n<p>We have several Sales Associates who have been recognized internationally for their sales production.</p>\r\n<p>Ohio Realty Group is conveniently located in Ravenna, Ohio, which is the County Seat of Portage county and allows for easy access to Summit and Stark Counties.</p>\r\n<p><img width="140" height="113" border="0" src="/images/ohio_reality_logo_low_res.jpg" alt="" /></p>	t	2011-09-11 18:05:02.175051	2009-10-28 19:38:55
18	1	5	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\r\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\r\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the expertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\r\n<p><img width="127" height="107" border="0" alt="" src="/images/ohio_reality_logo_high_res.jpg" /></p>\r\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\r\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\r\n<ul> <strong>  </strong>\r\n    <li><strong><a class="plinks" target="_self" href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=1%2BkYz3TdENBt6h06ma9n%2BamvUxMz9B7DjC8Bqf3cnrY%3D&amp;KeyRid=1">Ohio Realty Group Listings</a></strong></li>\r\n    <strong>  </strong>\r\n    <li><strong><a target="_self" class="plinks" href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&amp;KeyRid=1">Search All MLS Listings</a></strong></li>\r\n</ul>	t	2011-09-11 18:25:21.059733	2009-10-28 18:34:55
19	5	3	public-records-information	Public Records Information	Public Records Information			<h2>Public Records Information</h2>\r\n<p><strong>County Auditor's Web Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/fiscaloffice/defaultwebapps.htm">Summit County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.auditor.co.stark.oh.us/">Stark County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/auditor.htm">Portage County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://auditor.cuyahogacounty.us/repi/default.asp">Cuyahoga County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.medinacountyauditor.org/">Medina County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.auditor.co.geauga.oh.us/ag/">Geauga County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.mahoningcountyauditor.org/propertymax/rover30.asp?sid=E2919BAA166844A1853EEB88553D829C">Mahoning County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.auditor.co.trumbull.oh.us/">Trumbull County Auditor</a></p>	t	2011-10-12 23:46:56.683399	2009-10-28 20:07:36
20	6	3	sheriff-sales-info	Sheriff Sales Information	Sheriff Sales Information			<h2>Sheriff Sales Information</h2>\r\n<p><strong>Sheriff's Auction Sales Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/sheriff/sales.htm">Summit County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.stark.oh.us/">Stark County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://sheriff.cuyahogacounty.us/en-US/Foreclosure-Property-Search.aspx">Cuyahoga County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.geauga.oh.us/">Geauga County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/sheriffsales.htm">Portage County Sheriff</a></p>	t	2011-10-12 23:49:42.658385	2009-10-28 20:12:05
21	6	4	sheriff-sales-info	Sheriff Sales Information	Sheriff Sales Information			<h2>Sheriff Sales Information</h2>\r\n<p><strong>Sheriff's Auction Sales Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/sheriff/sales.htm">Summit County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.stark.oh.us/">Stark County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://sheriff.cuyahogacounty.us/en-US/Foreclosure-Property-Search.aspx">Cuyahoga County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.geauga.oh.us/">Geauga County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/sheriffsales.htm">Portage County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.sheriff.co.trumbull.oh.us/sheriffsale.htm">Trumbull County Sheriff</a></p>	t	2012-03-21 18:22:48.471076	2009-10-28 20:12:05
22	6	5	sheriff-sales-info	Sheriff Sales Information	Sheriff Sales Information			<h2>Sheriff Sales Information</h2>\r\n<p><strong>Sheriff's Auction Sales Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/sheriff/sales.htm">Summit County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.stark.oh.us/">Stark County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://sheriff.cuyahogacounty.us/en-US/Foreclosure-Property-Search.aspx">Cuyahoga County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.geauga.oh.us/">Geauga County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/sheriffsales.htm">Portage County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.sheriff.co.trumbull.oh.us/sheriffsale.htm">Trumbull County Sheriff</a></p>><a target="_BLANK" href="http://www.colcountysheriff.com/sales/main.htm">Columbiana County Sheriff</a></p>	t	2012-05-03 13:02:37.957395	2009-10-28 20:12:05
23	1	6	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\r\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\r\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the expertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\r\n<p><img width="127" height="107" border="0" alt="" src="/images/ohio_reality_logo_high_res.jpg" /></p>\r\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\r\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\r\n<ul> <strong>  </strong>\r\n    <li><strong><a class="plinks" target="_self" href="http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&amp;PRGNAME=MLSLogin&amp;ARGUMENT=1%2BkYz3TdENBt6h06ma9n%2BamvUxMz9B7DjC8Bqf3cnrY%3D&amp;KeyRid=1">Ohio Realty Group Listings</a></strong></li>\r\n    <strong>  </strong>\r\n    <li><strong><a target="_self" class="plinks" href="http://neohrex.rapmls.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&KeyRid=1">Search All MLS Listings</a></strong></li>\r\n</ul>	t	2013-04-23 10:21:39.61793	2009-10-28 18:34:55
24	1	7	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\r\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\r\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the expertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\r\n<p><img width="127" height="107" border="0" alt="" src="/images/ohio_reality_logo_high_res.jpg" /></p>\r\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\r\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\r\n<ul> <strong>  </strong>\r\n    <li><strong><a class="plinks" target="_self" href="http://neohrex.rapmls.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=YPmlEioa0IcTegzObUFREVGkvwogsuoeXWhWKYFhJ1Q%3D&KeyRid=1">Ohio Realty Group Listings</a></strong></li>\r\n    <strong>  </strong>\r\n    <li><strong><a target="_self" class="plinks" href="http://neohrex.rapmls.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&KeyRid=1">Search All MLS Listings</a></strong></li>\r\n</ul>	t	2013-04-23 10:24:12.921833	2009-10-28 18:34:55
25	1	8	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\r\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\r\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the expertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\r\n<p><img width="127" height="107" border="0" alt="" src="/images/ohio_reality_logo_high_res.jpg" /></p>\r\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\r\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\r\n<ul> <strong>  </strong>\r\n    <li><strong><a class="plinks" target="_self" href="http://neohrex.rapmls.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=1%2BkYz3TdENBt6h06ma9n%2BamvUxMz9B7DjC8Bqf3cnrY%3D&KeyRid=1">Ohio Realty Group Listings</a></strong></li>\r\n    <strong>  </strong>\r\n    <li><strong><a target="_self" class="plinks" href="http://neohrex.rapmls.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=uv8RutLAmy4cgo6nIL1pEoFJdyILTxCaiZg%2F9LOYXLM%3D&KeyRid=1">Search All MLS Listings</a></strong></li>\r\n</ul>	t	2013-04-23 10:25:43.688434	2009-10-28 18:34:55
26	1	9	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\r\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\r\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the expertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\r\n<p><img width="127" height="107" border="0" alt="" src="/images/ohio_reality_logo_high_res.jpg" /></p>\r\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\r\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\r\n<ul> <strong>  </strong>\r\n    <li><strong><a class="plinks" target="_self" href="http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=07f5137">Ohio Realty Group Listings</a></strong></li>\r\n    <li><strong><a target="_self" class="plinks" href="http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=9272136">Full MLS Search</a></strong></li>\r\n    <li><strong><a target="_self" class="plinks" href="http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=31c5135">MLS Map Search</a></strong></li>\r\n</ul>	t	2014-08-27 01:28:00.616882	2009-10-28 18:34:55
\.


--
-- Name: page_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('page_versions_id_seq', 26, true);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY pages (id, url_tag, title, html_title, keywords, description, content, published, created_at, updated_at, version) FROM stdin;
4	selling-tips	Selling Tips	Selling Tips			<h2>We Deliver Results to You!</h2>\n\n<p>Who represents you in selling your home is one of the most important decisions you will make. The two most important elements to consider are the company and the Sales Associate.</p>\n\n<p><span class=Content1Title>Here's why you should choose Ohio Realty Group:</span></p>\n<ul>\n  <li>Most aggressive marketing and advertising program in the area. </li>\n  <li>Our office is strategically located in a prime area increasing consumer awareness.</li>\n  <li>Many professionally trained Sales Associates are working as a team for you.</li>\n  <li>Ohio Realty Group guarantees your satisfaction!</li>\n  <li>Selling your home in today's market is much more complex than even a few years ago. Our Career Development Department continually keeps all of our Sales Associates up-to-date on the ever-increasing legislation and federal requirements.</li>\n</ul>\n<p>If you are considering selling your home, please <a href="/contact-us">e-mail us</a> or call us at 330-296-9000 for a FREE, no-obligation Market Analysis.</p>	t	2009-10-28 19:48:25	2009-10-28 19:48:25	1
7	our-pledge	Our Pledge	Our Pledge			<h2>Our Pledge to You</h2>\n<p>Thank you for visiting our Web site today. We appreciate the opportunity to assist you with your real estate needs. Whether you are relocating to Ohio from another state or country, moving across town, upgrading or downsizing, Ohio Realty Group's Relocation Services Division can make it a smooth, hassle-free experience.</p>\n<p>Our Award winning Sales Associates guide you through the maze of infinite details surrounding the purchase or sale of your home. Helping you become familiar with a new area, finding the right home for your family, arranging financing, and settling-in in a timely fashion, is our priority. Assuring that your relocation is a pleasant experience is our ultimate goal.</p>\n<p>If you have a home to sell in the area, Ohio Realty Group gives maximum exposure to assure you of reaching the best qualified buyers in today's real estate market. If you are moving here from a different locale, we have the power to place you with a top real estate firm to assist you in marketing your present home.</p>\n<p>Our continued commitment to excellence will provide you with outstanding  service and satisfaction.</p>	t	2009-10-28 20:17:32	2009-10-28 20:17:32	1
8	careers	Careers	Careers			<h2>Join the Award-Winning Team!</h2>\n<p><strong>OPPORTUNITY</strong></p>\n<p>Imagine selling something that everyone wants to buy!</p>\n<p>Few professions offer the same opportunities as real estate sales, and no other real estate organization can offer the same opportunities as Ohio Realty Group.</p>\n<p>As an Ohio Realty Group Sales Associate, you will acquire our solid, respected image. As one of Ohio's most successful groups of Real Estate Professionals, Ohio Realty Group has captivated consumer awareness, influenced consumer preference and earned consumer satisfaction. The strength of this industry wide reputation opens more doors for you and that means more opportunities to earn more income.</p>\n<p><strong>TRAINING &amp; TECHNOLOGY</strong></p>\n<p>What do you need to be the best? The right resources and tools to help you make the sale!</p>\n<p>Ohio Realty Group's professional staff provides outstanding support. Our &quot;fast-start&quot; training covers topics from listings and buyer representation to business development and more. As you continue your career path with us you'll see for yourself how our diverse training curriculum helps you stay on the leading edge of our ever-changing industry.</p>\n<p><strong>AWARDS &amp; RECOGNITION</strong></p>\n<p>When you join Ohio Realty Group, your outstanding efforts are recognized with one of the most comprehensive and successful awards and recognition programs in the industry at the State and Real Estate Board level.</p>\n<p><strong>A HOME FOR YOUR CAREER</strong></p>\n<p>Ohio Realty Group is known for finding the right homes for our customers. But we are also known for finding the right people for our sales team who want more from their professional lives. So if you are looking for ...</p>\n<ul>\n    <li>An exciting and rewarding career</li>\n    <li>The opportunity to work with the Premier Real Estate resource in Northeast Ohio.</li>\n    <li>A chance at proving to yourself and others just how successful you can be</li>\n</ul>\n<p>... then consider a career with Ohio Realty Group.  The right home for your real estate sales career.</p>	t	2009-10-28 20:43:25	2009-10-28 20:43:25	1
6	sheriff-sales-info	Sheriff Sales Information	Sheriff Sales Information			<h2>Sheriff Sales Information</h2>\r\n<p><strong>Sheriff's Auction Sales Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/sheriff/sales.htm">Summit County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.stark.oh.us/">Stark County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://sheriff.cuyahogacounty.us/en-US/Foreclosure-Property-Search.aspx">Cuyahoga County Sheriff</a></p>\r\n<p><a target="_blank" href="http://www.sheriff.co.geauga.oh.us/">Geauga County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/sheriffsales.htm">Portage County Sheriff</a></p>\r\n<p><a target="_BLANK" href="http://www.sheriff.co.trumbull.oh.us/sheriffsale.htm">Trumbull County Sheriff</a></p>><a target="_BLANK" href="http://www.colcountysheriff.com/sales/main.htm">Columbiana County Sheriff</a></p>	t	2009-10-28 20:12:05	2012-05-03 13:02:37.957395	5
5	public-records-information	Public Records Information	Public Records Information			<h2>Public Records Information</h2>\r\n<p><strong>County Auditor's Web Sites:</strong></p>\r\n<p><a target="_BLANK" href="http://www.co.summit.oh.us/fiscaloffice/defaultwebapps.htm">Summit County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.auditor.co.stark.oh.us/">Stark County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.co.portage.oh.us/auditor.htm">Portage County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://auditor.cuyahogacounty.us/repi/default.asp">Cuyahoga County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.medinacountyauditor.org/">Medina County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.auditor.co.geauga.oh.us/ag/">Geauga County Auditor</a></p>\r\n<p><a target="_BLANK" href="http://www.mahoningcountyauditor.org/propertymax/rover30.asp?sid=E2919BAA166844A1853EEB88553D829C">Mahoning County Auditor</a></p>\r\n<p><a target="_blank" href="http://www.auditor.co.trumbull.oh.us/">Trumbull County Auditor</a></p>	t	2009-10-28 20:07:36	2011-10-12 23:46:56.683399	3
3	buying-tips	Buying Tips	Buying Tips			<h2>Our Reputation Is Built On Recommendations</h2>\n\n<p>Buying a home may be the biggest investment you'll ever make. So you should be as prepared as possible, and ready for anything, with a trusted professional at your side. That's where a Buyer Representative from Ohio Realty Group can be a very valuable ally. We're ready to provide you with the proper information to help you make a good decisions, and to serve your best interests every step of the way.</p>\n<p>\n<strong>What Your Buyer Representative Does For You</strong>\n<ul>\n  <li>Uses state of the art technology tools to help you find the right home in the right location</li>\n  <li>Helps you evaluate specific properties</li>\n  <li>Helps you determine a fair market value</li>\n  <li>Works with you to develop negotiating strategies specific to the property and seller</li>\n  <li>Assists you in determining the most favorable price and terms to offer</li>\n  <li>Assists you in closing the transaction</li>\n  <li>Makes available to you the full-service shopping convenience of home-related products and services through our Preferred Partner Program</li>\n</ul>\n<p>For more information on buying a home, please  <a href="/contact-us">e-mail us</a> or call us at 330-296-9000.</p>	t	2009-10-28 19:45:12	2009-10-28 19:45:12	1
9	real-estate-resources	Real Estate Resources	Real Estate Resources			<p>Online Information</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.jumphome.com/">Change your utilities online</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.iplace.com/">FREE Credit Reports</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.welcomewagon.com/">Welcome Wagon</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.firstenergy.com/">Make your energy choices</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.usps.com/">Change your address online</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.lendinguniverse.com">Credit Problem Assistance</a></li>\r\n</ul>\r\n<p>Moving Information</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://webcom.com/~greeting/cleveland/69ways/69ways.html">Sell your home FASTER!!</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.newcomersclub.com/oh.html">Newcomers Club</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.census.gov/">U.S. Census</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.uhaul.com/">U-Haul</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.ryder.com/">Ryder Truck</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.mayflower.com/">Mayflower Movers</a></li>\r\n</ul>\r\n<p>Attractions</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.clevelandindians.com/">The Cleveland Indians</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.clevelandbrowns.com/">The Cleveland Browns</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.nba.com/cavs">The Cleveland Cavaliers</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.geaugalake.com">Geauga Lake</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.rockhall.com/">The Rock &amp; Roll Hall of Fame</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.play18.com/">Set up a TEE Time!!</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.cedarpoint.com">Cedar Point</a></li>\r\n</ul>\r\n<p>Local Info</p>\r\n<ul>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.cleveland.com/">Cleveland Info</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.sunnews.com/">Suburb Info</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.plaindealer.com/">The Plain Dealer Newspapers</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.weather.com/outlook/recreation/local/44266?whatprefs=&amp;y=10&amp;x=25">Local Weather</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://ohio.uscity.net/#S">Anything You Want to Know About Ohio</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://epodunk.com/profiles/oh_a.html">Local City Information Throughout Ohio</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.oplin.lib.oh.us/index.cfm?ID=1833">All Ohio Schools</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.kent.edu">Kent State University</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.acs.ohio-state.edu">The Ohio State University</a></li>\r\n    <li class="links"><a target="_BLANK" onMouseOver="\r\n\t\t\t\t \t\t\tstatusMsg('Visit This Link');return(true);\r\n\t\t\t\t \t\t" onMouseOut="\r\n\t\t\t\t\t\t\tstatusMsg('');return(true);\r\n\t\t\t\t\t\t" href="http://www.thebeaconjournal.com">The Akron Beacon Journal</a></li>\r\n</ul>	t	2009-10-28 20:44:54	2011-09-05 17:12:47.29743	3
2	about-us	About Our Company	About Our Company			<h2>Ohio Realty Group</h2>\r\n\r\n<p>320 E. Main Street<br />\r\nRavenna, OH 44266<br />\r\nOffice - 330-296-9000<br />\r\nFax - 330-297-8723</p>\r\n<p>Ohio Realty Group serves Summit and Portage Counties as well as parts of Stark and Medina Counties.</p>\r\n<p>We have many qualified, active Sales Associates. Many holding professional designations such as CRS (Certified Residential Specialist), ABR (Accredited Buyer Representative), and CSP (Certified Sales Professional).</p>\r\n<p>We have several Sales Associates who have been recognized internationally for their sales production.</p>\r\n<p>Ohio Realty Group is conveniently located in Ravenna, Ohio, which is the County Seat of Portage county and allows for easy access to Summit and Stark Counties.</p>\r\n<p><img width="140" height="113" border="0" src="/images/ohio_reality_logo_low_res.jpg" alt="" /></p>	t	2009-10-28 19:38:55	2011-09-11 18:05:02.175051	2
1	index	Ohio Realty Group	Ohio Realty Group			<h2>Our commitment is to provide you with excellent real estate service and 100% satisfaction.</h2>\r\n<p>Ohio Realty group was founded on the principal that if the client is going to spend their hard earned money, then they should get the very best service available. Our clients are the most important factor in&nbsp;our business and we will treat them that way!</p>\r\n<p>Our coverage area includes Summit, Stark and Portage Counties where we have experienced excellent success in listing and selling homes. Our top-notch team of brokers and agents has the expertise that you can rely upon to make your home buying and/or selling experience one you'll remember. . . for all the right reasons!</p>\r\n<p><img width="127" height="107" border="0" alt="" src="/images/ohio_reality_logo_high_res.jpg" /></p>\r\n<p>For a no-cost consultation, please <a href="/contact-us"> e-mail us</a> or call us at 330-296-9000.</p>\r\n<p><strong>To view our listings please choose from one of the following links:</strong></p>\r\n<ul> <strong>  </strong>\r\n    <li><strong><a class="plinks" target="_self" href="http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=07f5137">Ohio Realty Group Listings</a></strong></li>\r\n    <li><strong><a target="_self" class="plinks" href="http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=9272136">Full MLS Search</a></strong></li>\r\n    <li><strong><a target="_self" class="plinks" href="http://neohrex.mlsmatrix.com/Matrix/public/IDX.aspx?idx=31c5135">MLS Map Search</a></strong></li>\r\n</ul>	t	2009-10-28 18:34:55	2014-08-27 01:28:00.616882	9
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('pages_id_seq', 10, true);


--
-- Data for Name: realtors; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY realtors (id, name, phone_number, cell_number, voicemail_number, email, website, bio_link, url_tag, created_at, updated_at, "position") FROM stdin;
4	Susan M. Blazek, Realtor, ABR	330-626-5436	330-618-8473	330-296-9000 Ext. 302	SMBlazekORG@aol.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3KmFKARnxWWa%2FNra5jcMBv8%3D&KeyRid=1	susan-blazek	2010-03-04 20:27:10	2012-03-21 11:08:57.755532	2
30	Christine Bradley, Realtor	330-296-9000	330-423-7683	330-296-9000 Ext. 317	Chey0710@yahoo.com				2012-07-06 15:11:10.319455	2014-04-09 19:59:20.180037	6
5	Michael Bukovac, Realtor	330-678-4658	330-388-2896	330-296-9000 Ext. 303	MikeBukovac@yahoo.com	www.mikebukovac.com	http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3BySs1j5Z9LyoNU6NmTxRys%3D&KeyRid=1	michael-bukovac	2010-08-29 21:16:43	2013-01-22 15:03:52.295681	3
8	Mary Carr, Realtor	330-296-9000	330-606-8920	330-296-9000 Ext. 318	MaryCarr44201@Yahoo.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3Bh5ivsfr%2FSyT5Cm8TvlvbM%3D&KeyRid=1	mary-carr	2010-08-29 21:26:38	2013-01-22 15:03:52.307973	4
9	Anna Ciano-Hendricks, Realtor	330-296-9000	330-352-6750	330-296-9000 Ext. 411 	AnnaCiano77@Hotmail.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSListingAgentDetail&ARGUMENTS=-N020090008,-N278986310	anna-ciano	2010-08-29 21:27:58	2013-01-22 15:03:52.322215	5
34	Rob McClellan, Realtor	330-296-9000	330-283-4852	322	Rob@amandasgarden.net				2014-01-10 19:55:09.051085	2014-08-31 10:34:02.987223	12
22	Helen Weingart,  Realtor, ABR	330-673-4798	330-221-3515	330-296-9000  Ext. 315	HWeingart@neo.rr.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3LExUmXlMIADVktof8Hn4C8%3D&KeyRid=1	helen-weingart	2010-08-29 21:46:57	2015-02-15 16:34:29.438818	20
36	Zachariah R. Van Sluyters, Realtor	330-296-9000	330-931-8232	306	zachariah1314@yahoo.com 				2014-08-31 10:27:10.876072	2015-02-15 16:34:29.44611	21
3	Philip J. March, Broker, CRS, SFR	330-296-0445	330-221-6777	330-296-9000 ext. 301	Phil@PJMarch.com	www.pjmarch.com	http://neohrex.rapmls.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3LVvcBPzyAYTUBfAbDj%2F9uw%3D&KeyRid=1	philip-march	2009-12-28 21:50:23	2014-02-19 18:20:18.866912	1
16	Don Reckner,  Realtor	330-296- 9000	330-687-9690	330-296-9000  Ext. 415	dreckner@aol.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSListingAgentDetail&ARGUMENTS=-N200101383,-N278986310	don-reckner	2010-08-29 21:38:29	2015-02-15 16:34:29.395474	15
29	Matthew C. Freeman, Realtor	330-296-9000	330-221-7488		MatthewCFreeman@aol.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=NG21wRzH1EqWMw2tik%2FEuyh62q61b5P3j7n6MHCVUxA%3D&KeyRid=1		2011-12-23 11:34:31.6338	2014-01-10 19:53:36.45371	7
33	Mary Rongyos, Realtor, SRES	330-296-9000	330-903-5000	418	MaryRSells@gmail.com		http://neohrex.rapmls.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=T3wZjxM92G1lzLeKLffjmfaUINkZxlNRzsP4NMm1bQU%3D&KeyRid=1		2014-01-10 19:52:45.421218	2015-02-15 16:34:29.404612	16
12	Eric C. Hellekson,  Realtor, ABR, CSP	330-296-9000	330-221-0919	330-296-9000  Ext. 316	EricHellekson@aol.com	www.EricHellekson.com	http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3Bwmbqfv1d2DOgH3YSfhBOE%3D&KeyRid=1	eric-hellekson	2010-08-29 21:33:33	2014-01-10 19:53:36.469622	9
17	Jeremy Roosa,  Realtor	330-296-9000	330-221-4453	330-296-9000  Ext. 307	jroo72@yahoo.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3M437vM9GNLFBFHhzL0LXc8%3D&KeyRid=1	jeremy-roosa	2010-08-29 21:39:32	2015-02-15 16:34:29.415435	17
15	Kelly Parsons,  Realtor	330-296- 9000	330-221-0344	330-296-9000  Ext. 407	kellyrockethome@rocketmail.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSListingAgentDetail&ARGUMENTS=-N000001506,-N156771611	kelly-parsons	2010-08-29 21:37:18	2014-06-04 15:18:22.231577	13
37	Paul J. Petrella, Jr., Realtor	330-296-9000	330-761-8512	410	ppetrella@kw.com				2015-02-15 16:34:10.614194	2015-02-15 16:34:29.454226	14
19	Patti Scherer, Realtor	330-296-9000	330-606-0336	330-296-9000 Ext. 320	pattischerer7@aol.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3IiIWLufbKpclW%2FwEW2xSDk%3D&KeyRid=1	patti-scherer	2010-08-29 21:42:19	2015-02-15 16:34:29.423642	18
20	Sarah Taylor, Realtor, ABR, SFR, GRI	330-296-9000	330-524-2112	330-296-9000 Ext. 310	sarah@ohiorealtygroup.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=T3wZjxM92G1lzLeKLffjmZKrcnY%2Bk5ucuzKLoyjzZDk%3D&KeyRid=1	sarah-taylor	2010-08-29 21:43:44	2015-02-15 16:34:29.431108	19
31	Drusilla King, Realtor 	330-296-9000	330-888-9828	410	DrusillaKing@AOL.com		http://mls.neohrex.com/scripts/mgrqispi.dll?APPNAME=neohrex&PRGNAME=MLSLogin&ARGUMENT=SjF4zBlYUl%2BCdrGlk4Md3Ng227iA3O4zGv%2BD%2BINKmso%3D&KeyRid=1		2013-01-22 15:03:23.094231	2014-08-31 10:32:50.763955	10
35	Theresa  McCarter, Realtor	330-296-9000	330-715-6143	300	Theresa_McCarter@Outlook.com				2014-06-04 15:18:01.47737	2014-08-31 10:33:14.778826	11
32	Brandon Hayes, Realtor	330-296-9000	330-357-1366		bwhayes@kent.edu				2013-05-02 19:53:42.32782	2014-08-31 10:33:33.210679	8
\.


--
-- Name: realtors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('realtors_id_seq', 37, true);


--
-- Data for Name: rights; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY rights (id, name, controller, action, created_at, updated_at) FROM stdin;
\.


--
-- Name: rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('rights_id_seq', 1, false);


--
-- Data for Name: rights_roles; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY rights_roles (right_id, role_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY roles (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY roles_users (role_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY schema_migrations (version) FROM stdin;
20090319191513
20090502094200
20090502094230
20090807122123
20090807141414
20090831192450
20090831192510
20090831192548
20090831192618
20091204021450
20100829222345
20110906000826
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY user_sessions (id, username, password, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('user_sessions_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nathanwise
--

COPY users (id, username, email, crypted_password, password_salt, persistence_token, perishable_token, login_count, failed_login_count, last_request_at, current_login_at, last_login_at, current_login_ip, last_login_ip, created_at, updated_at) FROM stdin;
2	phil@pjmarch.com	phil@pjmarch.com	ffbd7840d5da203e207fd677c22c2603686347d17ba7bb024f08e7579266f9dd9ab7cf2b775ef92888906064ff5e90499bb815466ab48708e851f3bee9340550	3vugW4BrZ_wAj9VTqEh-	88f78fe411294b16e1b1436d20139d9d01b1aed4b116d4c2d78f0b8c7fd4bb4b9bbafa1445f7a5a31fa7b88ac3b7632fe2999c9c7a6ca906320e8e8ec364a8fd	A7Q029TFRinwuZmo28g	77	0	2015-02-15 16:35:45.885059	2015-02-15 16:31:33.709946	2014-09-15 18:02:09.251274	184.56.75.227	24.56.87.230	2010-08-29 22:36:59	2015-02-15 16:35:45.887324
1	nathanwise@gmail.com	nathanwise@gmail.com	4ab531f709f1ea1c1789bde7d3a79ee853b94742ecd4e0301edd59ab17e508b7420d55b5de6bcbd09bde62c7b2d268c8f3cf972eae000fc4eb4716f1a71d10d2	PNvFZwrSsuUlOaANddy	c184d230c9a96d5d922ddff1a64a2ee6c1db610245eefe842fcad1cd15eed6daa76dd539f3b1827bc21ca451fb688c4aacf8f2ec9fec99a21f6c69c42719f023	iNosZgdrxPvThO1WTzRq	12	0	2015-03-26 00:34:41.266679	2015-03-26 00:34:41.212504	2014-08-27 01:13:40.699398	127.0.0.1	107.9.225.239	2010-07-23 00:34:42	2015-03-26 00:34:41.267215
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nathanwise
--

SELECT pg_catalog.setval('users_id_seq', 3, false);


--
-- Name: four_oh_fours_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY four_oh_fours
    ADD CONSTRAINT four_oh_fours_pkey PRIMARY KEY (id);


--
-- Name: menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: page_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY page_versions
    ADD CONSTRAINT page_versions_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: realtors_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY realtors
    ADD CONSTRAINT realtors_pkey PRIMARY KEY (id);


--
-- Name: rights_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY rights
    ADD CONSTRAINT rights_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: user_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: nathanwise; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_four_oh_fours_on_host_and_path_and_referer; Type: INDEX; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE UNIQUE INDEX index_four_oh_fours_on_host_and_path_and_referer ON four_oh_fours USING btree (host, path, referer);


--
-- Name: index_four_oh_fours_on_path; Type: INDEX; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE INDEX index_four_oh_fours_on_path ON four_oh_fours USING btree (path);


--
-- Name: index_pages_on_url_tag; Type: INDEX; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE INDEX index_pages_on_url_tag ON pages USING btree (url_tag);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: nathanwise; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

