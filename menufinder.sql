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
-- Name: account; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE account (
    id character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    type character varying(25) NOT NULL
);


--
-- Name: accounttype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE accounttype (
    id character varying(25) NOT NULL
);


--
-- Name: item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE item (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200),
    price double precision,
    score double precision,
    restaurant integer NOT NULL
);


--
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE item_id_seq OWNED BY item.id;


--
-- Name: itemcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE itemcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: itemcategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE itemcategory (
    id integer DEFAULT nextval('itemcategory_id_seq'::regclass) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200)
);


--
-- Name: menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE menu (
    id integer NOT NULL,
    restaurant integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200),
    price double precision,
    score double precision,
    visible bit(1)
);


--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: menuitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE menuitem (
    menu integer NOT NULL,
    item integer NOT NULL,
    itemcategory integer NOT NULL
);


--
-- Name: restaurant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE restaurant (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    cif character varying(15),
    address character varying(75),
    city character varying(75),
    postalcode character varying(15),
    state character varying(75),
    country character varying(75),
    email character varying(75),
    phone character varying(30),
    account character varying(50) NOT NULL
);


--
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE restaurant_id_seq OWNED BY restaurant.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurant ALTER COLUMN id SET DEFAULT nextval('restaurant_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: accounttype; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO accounttype VALUES ('client');
INSERT INTO accounttype VALUES ('restaurant');


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('item_id_seq', 1, false);


--
-- Data for Name: itemcategory; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO itemcategory VALUES (1, 'Appetizers', NULL);
INSERT INTO itemcategory VALUES (2, 'Salads and Soups', NULL);
INSERT INTO itemcategory VALUES (3, 'Sandwiches', NULL);
INSERT INTO itemcategory VALUES (4, 'Italian', NULL);
INSERT INTO itemcategory VALUES (5, 'Main Course', NULL);
INSERT INTO itemcategory VALUES (6, 'Second Course', NULL);
INSERT INTO itemcategory VALUES (7, 'Sides', NULL);
INSERT INTO itemcategory VALUES (8, 'Seafood', NULL);
INSERT INTO itemcategory VALUES (9, 'Mexican', NULL);
INSERT INTO itemcategory VALUES (10, 'Specialties', NULL);
INSERT INTO itemcategory VALUES (11, 'Desserts', NULL);
INSERT INTO itemcategory VALUES (12, 'Beverages', NULL);
INSERT INTO itemcategory VALUES (13, 'Kids Menu', NULL);
INSERT INTO itemcategory VALUES (14, 'Wine', NULL);
INSERT INTO itemcategory VALUES (15, 'Beer', NULL);


--
-- Name: itemcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('itemcategory_id_seq', 15, true);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('menu_id_seq', 1, false);


--
-- Data for Name: menuitem; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('restaurant_id_seq', 1, false);


--
-- Name: pk_accounttype; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounttype
    ADD CONSTRAINT pk_accounttype PRIMARY KEY (id);


--
-- Name: pk_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT pk_item PRIMARY KEY (id);


--
-- Name: pk_itemcategory; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itemcategory
    ADD CONSTRAINT pk_itemcategory PRIMARY KEY (id);


--
-- Name: pk_menu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id);


--
-- Name: pk_menuitem; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT pk_menuitem PRIMARY KEY (menu, item, itemcategory);


--
-- Name: pk_restaurant; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT pk_restaurant PRIMARY KEY (id);


--
-- Name: pk_user; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- Name: fk_item_restaurant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_restaurant FOREIGN KEY (restaurant) REFERENCES restaurant(id);


--
-- Name: fk_menu_restaurant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT fk_menu_restaurant FOREIGN KEY (restaurant) REFERENCES restaurant(id);


--
-- Name: fk_menuitem_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT fk_menuitem_item FOREIGN KEY (item) REFERENCES item(id);


--
-- Name: fk_menuitem_itemcategory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT fk_menuitem_itemcategory FOREIGN KEY (itemcategory) REFERENCES itemcategory(id);


--
-- Name: fk_menuitem_menu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT fk_menuitem_menu FOREIGN KEY (menu) REFERENCES menu(id);


--
-- Name: fk_restaurant_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT fk_restaurant_user FOREIGN KEY (account) REFERENCES account(id);


--
-- Name: fk_user_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_user_type FOREIGN KEY (type) REFERENCES accounttype(id);


--
-- PostgreSQL database dump complete
--

