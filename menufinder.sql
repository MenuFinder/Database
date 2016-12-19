--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.9
-- Dumped by pg_dump version 9.4.9
-- Started on 2016-12-13 17:24:32 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 173 (class 1259 OID 17302)
-- Name: account; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE account (
    id character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    type character varying(25) NOT NULL,
    token character varying(250),
    email character varying(150)
);


--
-- TOC entry 174 (class 1259 OID 17305)
-- Name: accounttype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE accounttype (
    id character varying(25) NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 17308)
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
-- TOC entry 176 (class 1259 OID 17311)
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 176
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE item_id_seq OWNED BY item.id;


--
-- TOC entry 177 (class 1259 OID 17313)
-- Name: itemcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE itemcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 178 (class 1259 OID 17315)
-- Name: itemcategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE itemcategory (
    id integer DEFAULT nextval('itemcategory_id_seq'::regclass) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200)
);


--
-- TOC entry 188 (class 1259 OID 17504)
-- Name: itemrating; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE itemrating (
    id integer NOT NULL,
    score double precision,
    account character varying(50),
    item integer
);


--
-- TOC entry 187 (class 1259 OID 17502)
-- Name: itemrating_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE itemrating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 187
-- Name: itemrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE itemrating_id_seq OWNED BY itemrating.id;


--
-- TOC entry 179 (class 1259 OID 17319)
-- Name: menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE menu (
    id integer NOT NULL,
    restaurant integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200),
    price double precision,
    score double precision,
    visible boolean
);


--
-- TOC entry 180 (class 1259 OID 17322)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 180
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- TOC entry 181 (class 1259 OID 17324)
-- Name: menuitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE menuitem (
    menu integer NOT NULL,
    item integer NOT NULL,
    itemcategory integer NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 17327)
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
-- TOC entry 183 (class 1259 OID 17333)
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 183
-- Name: restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE restaurant_id_seq OWNED BY restaurant.id;


--
-- TOC entry 186 (class 1259 OID 17482)
-- Name: review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE review (
    id integer NOT NULL,
    review text,
    parent_type character varying(25),
    parent_id integer,
    account character varying(50)
);


--
-- TOC entry 185 (class 1259 OID 17480)
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 185
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE review_id_seq OWNED BY review.id;


--
-- TOC entry 184 (class 1259 OID 17475)
-- Name: reviewtype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE reviewtype (
    id character varying(25) NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 17520)
-- Name: usersubscription; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usersubscription (
    account character varying(50) NOT NULL,
    restaurant integer NOT NULL
);


--
-- TOC entry 1937 (class 2604 OID 17335)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_id_seq'::regclass);


--
-- TOC entry 1942 (class 2604 OID 17507)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY itemrating ALTER COLUMN id SET DEFAULT nextval('itemrating_id_seq'::regclass);


--
-- TOC entry 1939 (class 2604 OID 17336)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- TOC entry 1940 (class 2604 OID 17337)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurant ALTER COLUMN id SET DEFAULT nextval('restaurant_id_seq'::regclass);


--
-- TOC entry 1941 (class 2604 OID 17485)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY review ALTER COLUMN id SET DEFAULT nextval('review_id_seq'::regclass);


--
-- TOC entry 2088 (class 0 OID 17302)
-- Dependencies: 173
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2089 (class 0 OID 17305)
-- Dependencies: 174
-- Data for Name: accounttype; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO accounttype VALUES ('client');
INSERT INTO accounttype VALUES ('restaurant');


--
-- TOC entry 2090 (class 0 OID 17308)
-- Dependencies: 175
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 176
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('item_id_seq', 1, false);


--
-- TOC entry 2093 (class 0 OID 17315)
-- Dependencies: 178
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
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 177
-- Name: itemcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('itemcategory_id_seq', 15, true);


--
-- TOC entry 2103 (class 0 OID 17504)
-- Dependencies: 188
-- Data for Name: itemrating; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 187
-- Name: itemrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('itemrating_id_seq', 1, false);


--
-- TOC entry 2094 (class 0 OID 17319)
-- Dependencies: 179
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 180
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('menu_id_seq', 1, false);


--
-- TOC entry 2096 (class 0 OID 17324)
-- Dependencies: 181
-- Data for Name: menuitem; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2097 (class 0 OID 17327)
-- Dependencies: 182
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 183
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('restaurant_id_seq', 1, false);


--
-- TOC entry 2101 (class 0 OID 17482)
-- Dependencies: 186
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 185
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('review_id_seq', 1, false);


--
-- TOC entry 2099 (class 0 OID 17475)
-- Dependencies: 184
-- Data for Name: reviewtype; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2104 (class 0 OID 17520)
-- Dependencies: 189
-- Data for Name: usersubscription; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1946 (class 2606 OID 17339)
-- Name: pk_accounttype; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounttype
    ADD CONSTRAINT pk_accounttype PRIMARY KEY (id);


--
-- TOC entry 1948 (class 2606 OID 17341)
-- Name: pk_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT pk_item PRIMARY KEY (id);


--
-- TOC entry 1950 (class 2606 OID 17343)
-- Name: pk_itemcategory; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itemcategory
    ADD CONSTRAINT pk_itemcategory PRIMARY KEY (id);


--
-- TOC entry 1963 (class 2606 OID 17509)
-- Name: pk_itemrating; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itemrating
    ADD CONSTRAINT pk_itemrating PRIMARY KEY (id);


--
-- TOC entry 1952 (class 2606 OID 17345)
-- Name: pk_menu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id);


--
-- TOC entry 1954 (class 2606 OID 17347)
-- Name: pk_menuitem; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT pk_menuitem PRIMARY KEY (menu, item, itemcategory);


--
-- TOC entry 1956 (class 2606 OID 17349)
-- Name: pk_restaurant; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT pk_restaurant PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 17490)
-- Name: pk_review; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT pk_review PRIMARY KEY (id);


--
-- TOC entry 1958 (class 2606 OID 17479)
-- Name: pk_reviewtype; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reviewtype
    ADD CONSTRAINT pk_reviewtype PRIMARY KEY (id);


--
-- TOC entry 1944 (class 2606 OID 17351)
-- Name: pk_user; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- TOC entry 1965 (class 2606 OID 17524)
-- Name: pk_usersubscription; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usersubscription
    ADD CONSTRAINT pk_usersubscription PRIMARY KEY (account, restaurant);


--
-- TOC entry 1959 (class 1259 OID 17501)
-- Name: fki_review_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_review_user ON review USING btree (account);


--
-- TOC entry 1967 (class 2606 OID 17352)
-- Name: fk_item_restaurant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item
    ADD CONSTRAINT fk_item_restaurant FOREIGN KEY (restaurant) REFERENCES restaurant(id);


--
-- TOC entry 1975 (class 2606 OID 17510)
-- Name: fk_itemrating_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itemrating
    ADD CONSTRAINT fk_itemrating_item FOREIGN KEY (item) REFERENCES item(id);


--
-- TOC entry 1976 (class 2606 OID 17515)
-- Name: fk_itemrating_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY itemrating
    ADD CONSTRAINT fk_itemrating_user FOREIGN KEY (account) REFERENCES account(id);


--
-- TOC entry 1968 (class 2606 OID 17357)
-- Name: fk_menu_restaurant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT fk_menu_restaurant FOREIGN KEY (restaurant) REFERENCES restaurant(id);


--
-- TOC entry 1969 (class 2606 OID 17362)
-- Name: fk_menuitem_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT fk_menuitem_item FOREIGN KEY (item) REFERENCES item(id);


--
-- TOC entry 1970 (class 2606 OID 17367)
-- Name: fk_menuitem_itemcategory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT fk_menuitem_itemcategory FOREIGN KEY (itemcategory) REFERENCES itemcategory(id);


--
-- TOC entry 1971 (class 2606 OID 17372)
-- Name: fk_menuitem_menu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menuitem
    ADD CONSTRAINT fk_menuitem_menu FOREIGN KEY (menu) REFERENCES menu(id);


--
-- TOC entry 1972 (class 2606 OID 17377)
-- Name: fk_restaurant_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT fk_restaurant_user FOREIGN KEY (account) REFERENCES account(id);


--
-- TOC entry 1973 (class 2606 OID 17491)
-- Name: fk_review; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review FOREIGN KEY (parent_type) REFERENCES reviewtype(id);


--
-- TOC entry 1974 (class 2606 OID 17496)
-- Name: fk_review_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY review
    ADD CONSTRAINT fk_review_user FOREIGN KEY (account) REFERENCES account(id);


--
-- TOC entry 1966 (class 2606 OID 17382)
-- Name: fk_user_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_user_type FOREIGN KEY (type) REFERENCES accounttype(id);


--
-- TOC entry 1977 (class 2606 OID 17525)
-- Name: fk_usersubscription_account; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usersubscription
    ADD CONSTRAINT fk_usersubscription_account FOREIGN KEY (account) REFERENCES account(id);


--
-- TOC entry 1978 (class 2606 OID 17530)
-- Name: fk_usersubscription_restaurant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usersubscription
    ADD CONSTRAINT fk_usersubscription_restaurant FOREIGN KEY (restaurant) REFERENCES restaurant(id);


-- Completed on 2016-12-13 17:24:33 CET

--
-- PostgreSQL database dump complete
--

