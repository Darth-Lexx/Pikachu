--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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
-- Name: gaz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gaz (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.gaz OWNER TO postgres;

--
-- Name: modify; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modify (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.modify OWNER TO postgres;

--
-- Name: pribor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pribor (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.pribor OWNER TO postgres;

--
-- Name: range; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.range (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.range OWNER TO postgres;

--
-- Name: sensor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.sensor OWNER TO postgres;

--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Data for Name: gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gaz (key, title) FROM stdin;
-1	Не задано
0	Метан
1	Пропан
2	Бутан
3	Изобутан
4	Пентан
5	Циклопентан
6	Гексан
7	Циклогексан
8	Гептан
9	Пропилен
10	Пары метилового спирта
11	Пары этилового спирта
12	Этан
13	Этилен
14	Пары толуола
15	Пары бензола
16	Пары этиленбензола
17	Пары ацетона
18	Пары МТБЭ
19	Пара-ксилол
20	Орто-ксилол
21	Пары изопропилового спирта
22	Пары бензина автомобильного
23	Пары дизельного топлива
24	Пары топлива для реактивных двигателей
25	Пары бензина авиационного
26	Парэ бензина неэтилированного
27	Пары керосина
28	Пары уайт-спирита
29	Пары нефтепродуктов
30	1,3-бутадиен
31	Оксид этилена
32	Хлорметан
33	Пары бутилацетата
34	Пары этилацетата
35	Пары бутанона
36	Пары пропанола-1
37	Пары бутанола
38	Пары октана
39	Пары диэтиламина
40	Водород
41	Ацетилен
42	Акрилонитрит
43	Диоксид углерода
44	Сероводород
45	Кислород
46	Оксид углерода
47	Диоксид азота
48	Диоксид серы
49	Аммиак
50	Хлор
51	Хлорид водорода
52	Фторид водорода
53	Формальдегид
54	Оксид азота
55	Оксид этилена
56	НДМГ
57	Метилмеркаптан
58	Этилмеркаптан
59	Изобутилен
60	Диэтиламин
61	Сероуглерод
62	Фенол
63	Тетрафторэтилен
\.


--
-- Data for Name: modify; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modify (key, title) FROM stdin;
-1	Не задано
0	М
1	2
2	М2
4	2 с БИ
5	М2 с БИ
6	i
7	903
8	903А
9	903 с БИ
10	903А с БИ
11	903М
12	903МЕ
13	903МТ
14	903У
15	ИК/УФ
16	40
17	50А
18	50Ц
19	И
20	Л
3	М с БИ
\.


--
-- Data for Name: pribor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pribor (key, title) FROM stdin;
-1	Не задано
0	СГОЭС
1	СГОЭС-М11
2	ИПЭС ИК/УФ
3	ИПЭС ИКМ
4	ИПЭС ИР4000
5	СГС-902
6	ДГТ-902
7	ССС
8	ССС М19
9	ПГУ
10	ПГУ-А
11	ИТЭС
12	ИПРЭС
13	ИПДЭС
14	ИПЦЭС
15	ДОТЭС
16	КВЭС
17	УПЭС
18	ТГАЭС TX
19	ТГАЭС RX
20	ППКПЭС
21	ДСЭС
22	ДВПЭС
23	ПГА
24	УКПЭС
\.


--
-- Data for Name: range; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.range (key, title) FROM stdin;
-1	Не задано
0	0-50
1	0-100
2	10
3	20
4	45
5	50
6	70
7	85
8	100
9	200
10	500
11	2000
\.


--
-- Data for Name: sensor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor (key, title) FROM stdin;
-1	Не задано
0	Оптика
2	Электрохимия
3	Фотоионизация
1	Термокаталитика
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (key, title) FROM stdin;
-1	Не задано
101	Выпущен/Готов
100	Находится на СНУ
102	Выпущен (требует доработки)
103	Выпущен после возврата
104	Выпущен после ремонта
200	Находится на участке КТХ
201	Градуируется в КТХ
202	Проверяется в КТХ
203	Прошел КТХ
204	Не прошел КТХ
300	Находится в ОКИ
301	Выставлен на стенд
302	Откалиброван
303	Проверен
304	Не прошел ПСИ
305	Передан на УМО
400	Находится на УУиО
401	Передан на СНУ
402	Передан в ОКИ
403	Передан в КТХ
404	Передан на УМО
405	Отгружен
500	Находится на ремонтном участке
501	Заведена МСК
502	Передан на СНУ
503	Передан в ОКИ
504	Передан в КТХ
505	Передан на УМО
506	На складе
507	Передан на отгрузку
\.


--
-- Name: gaz gaz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gaz
    ADD CONSTRAINT gaz_pkey PRIMARY KEY (key);


--
-- Name: modify modify_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modify
    ADD CONSTRAINT modify_pk PRIMARY KEY (key);


--
-- Name: pribor pribor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pribor
    ADD CONSTRAINT pribor_pkey PRIMARY KEY (key);


--
-- Name: range range_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.range
    ADD CONSTRAINT range_pkey PRIMARY KEY (key);


--
-- Name: sensor sensor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (key);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (key);


--
-- Name: gaz gas_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE gas_del AS
    ON DELETE TO public.gaz DO INSTEAD NOTHING;


--
-- Name: pribor pribor_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE pribor_del AS
    ON DELETE TO public.pribor DO INSTEAD NOTHING;


--
-- Name: range range_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE range_del AS
    ON DELETE TO public.range DO INSTEAD NOTHING;


--
-- Name: sensor sensor_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE sensor_del AS
    ON DELETE TO public.sensor DO INSTEAD NOTHING;


--
-- Name: status status_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE status_del AS
    ON DELETE TO public.status DO INSTEAD NOTHING;


--
-- PostgreSQL database dump complete
--

