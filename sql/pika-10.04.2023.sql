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

--
-- Name: arr_l(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.arr_l(a integer, b integer, c integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare i integer;
i2 integer;
	BEGIN
	i:= (SELECT array_length(arr_date,1) FROM archive WHERE pribor_tip=a AND pribor_num=b AND pribor_exp=c);
i2:=i;
	CASE 
	WHEN (i IS NULL) THEN i:=0; 
	ELSE i:=i2;
END CASE;
RETURN i;
	END;
$$;


ALTER FUNCTION public.arr_l(a integer, b integer, c integer) OWNER TO postgres;

--
-- Name: array_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.array_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO archive (pribor_tip, pribor_num, pribor_exp) VALUES
	(NEW.pribor_tip, NEW.pribor_num, NEW.pribor_exp);
RETURN NULL;
END;
$$;


ALTER FUNCTION public.array_insert() OWNER TO postgres;

--
-- Name: array_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.array_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
arr integer:=arr_l(NEW.pribor_tip,NEW.pribor_num,NEW.pribor_exp);
BEGIN
UPDATE archive SET arr_date[arr]=NEW.last_date,
arr_status[arr]=NEW.last_status,
arr_name[arr]=NEW.last_name,
arr_note[arr]=NEW.last_note
FROM main
WHERE archive.pribor_tip=NEW.pribor_tip AND archive.pribor_num=NEW.pribor_num AND archive.pribor_exp=NEW.pribor_exp;
RETURN NULL;
END;
$$;


ALTER FUNCTION public.array_update() OWNER TO postgres;

--
-- Name: date_ktx(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.date_ktx() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE main SET last_date=NEW.date_ktx, last_name=NEW.name_ktx

WHERE pribor_tip=NEW.pribor_tip AND pribor_exp=NEW.pribor_exp AND pribor_num=NEW.pribor_num;

RETURN NULL;

END;

$$;


ALTER FUNCTION public.date_ktx() OWNER TO postgres;

--
-- Name: date_oki(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.date_oki() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE main SET last_date=NEW.date_oki, last_name=NEW.name_oki

WHERE pribor_tip=NEW.pribor_tip AND pribor_exp=NEW.pribor_exp AND pribor_num=NEW.pribor_num;

RETURN NULL;

END;

$$;


ALTER FUNCTION public.date_oki() OWNER TO postgres;

--
-- Name: date_out(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.date_out() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE main SET last_date=NEW.date_out, last_name=NEW.name_out

WHERE pribor_tip=NEW.pribor_tip AND pribor_exp=NEW.pribor_exp AND pribor_num=NEW.pribor_num;

RETURN NULL;

END;

$$;


ALTER FUNCTION public.date_out() OWNER TO postgres;

--
-- Name: date_snu(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.date_snu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE main SET last_date=NEW.date_snu, last_name=NEW.name_snu

WHERE pribor_tip=NEW.pribor_tip AND pribor_exp=NEW.pribor_exp AND pribor_num=NEW.pribor_num;

RETURN NULL;

END;

$$;


ALTER FUNCTION public.date_snu() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive (
    pribor_tip integer NOT NULL,
    pribor_num integer NOT NULL,
    pribor_exp integer NOT NULL,
    arr_date date[],
    arr_status integer[],
    arr_name integer[],
    arr_note text[]
);


ALTER TABLE public.archive OWNER TO postgres;

--
-- Name: gaz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gaz (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.gaz OWNER TO postgres;

--
-- Name: main; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main (
    pribor_tip integer DEFAULT 0 NOT NULL,
    pribor_num integer DEFAULT 0 NOT NULL,
    pribor_mat integer DEFAULT '-1'::integer,
    pribor_exp integer DEFAULT 0 NOT NULL,
    pribor_rem boolean DEFAULT false,
    msk_num integer DEFAULT '-1'::integer,
    pribor_gaz integer DEFAULT '-1'::integer,
    pribor_range integer DEFAULT '-1'::integer,
    pribor_sens integer DEFAULT '-1'::integer,
    last_date date,
    last_name integer DEFAULT '-1'::integer,
    last_status integer DEFAULT '-1'::integer,
    last_note text DEFAULT ''::text NOT NULL,
    date_snu date,
    date_ktx date,
    date_oki date,
    date_out date,
    name_snu integer DEFAULT '-1'::integer,
    name_ktx integer DEFAULT '-1'::integer,
    name_oki integer DEFAULT '-1'::integer,
    name_out integer DEFAULT '-1'::integer,
    name_zak text DEFAULT 'не задано'::text,
    pribor_mod integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.main OWNER TO postgres;

--
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.material OWNER TO postgres;

--
-- Name: modify; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modify (
    key integer NOT NULL,
    title text
);


ALTER TABLE public.modify OWNER TO postgres;

--
-- Name: msk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.msk (
    key integer NOT NULL,
    name_out text,
    pribors text[],
    operations text[],
    add text,
    msk_date date
);


ALTER TABLE public.msk OWNER TO postgres;

--
-- Name: names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.names (
    key integer NOT NULL,
    title text,
    rights text,
    password text
);


ALTER TABLE public.names OWNER TO postgres;

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
-- Name: version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.version (
    version integer
);


ALTER TABLE public.version OWNER TO postgres;

--
-- Name: archive archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (pribor_tip, pribor_num, pribor_exp);


--
-- Name: gaz gaz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gaz
    ADD CONSTRAINT gaz_pkey PRIMARY KEY (key);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (key);


--
-- Name: modify modify_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modify
    ADD CONSTRAINT modify_pk PRIMARY KEY (key);


--
-- Name: msk msk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.msk
    ADD CONSTRAINT msk_pkey PRIMARY KEY (key);


--
-- Name: names names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_pkey PRIMARY KEY (key);


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
-- Name: main test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_pkey PRIMARY KEY (pribor_tip, pribor_num, pribor_exp);


--
-- Name: gaz gas_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE gas_del AS
    ON DELETE TO public.gaz DO INSTEAD NOTHING;


--
-- Name: material mat_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE mat_del AS
    ON DELETE TO public.material DO INSTEAD NOTHING;


--
-- Name: msk msk_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE msk_del AS
    ON DELETE TO public.msk DO INSTEAD NOTHING;


--
-- Name: names names_del; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE names_del AS
    ON DELETE TO public.names DO INSTEAD NOTHING;


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
-- Name: main array_insert_t; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER array_insert_t AFTER INSERT ON public.main FOR EACH ROW EXECUTE FUNCTION public.array_insert();


--
-- Name: main array_update_t; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER array_update_t AFTER UPDATE OF last_date ON public.main FOR EACH ROW EXECUTE FUNCTION public.array_update();


--
-- Name: main date_ktx_t; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER date_ktx_t AFTER UPDATE OF date_ktx ON public.main FOR EACH ROW EXECUTE FUNCTION public.date_ktx();


--
-- Name: main date_oki_t; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER date_oki_t AFTER UPDATE OF date_oki ON public.main FOR EACH ROW EXECUTE FUNCTION public.date_oki();


--
-- Name: main date_out_t; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER date_out_t AFTER UPDATE OF date_out ON public.main FOR EACH ROW EXECUTE FUNCTION public.date_out();


--
-- Name: main date_snu_t; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER date_snu_t AFTER UPDATE OF date_snu ON public.main FOR EACH ROW EXECUTE FUNCTION public.date_snu();


--
-- Name: main insert_ktx; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_ktx AFTER INSERT ON public.main FOR EACH ROW WHEN ((new.date_ktx IS NOT NULL)) EXECUTE FUNCTION public.date_ktx();


--
-- Name: main insert_oki; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_oki AFTER INSERT ON public.main FOR EACH ROW WHEN ((new.date_oki IS NOT NULL)) EXECUTE FUNCTION public.date_oki();


--
-- Name: main insert_out; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_out AFTER INSERT ON public.main FOR EACH ROW WHEN ((new.date_out IS NOT NULL)) EXECUTE FUNCTION public.date_out();


--
-- Name: main insert_snu; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_snu AFTER INSERT ON public.main FOR EACH ROW WHEN ((new.date_snu IS NOT NULL)) EXECUTE FUNCTION public.date_snu();


--
-- Name: archive archive_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive
    ADD CONSTRAINT archive_fk FOREIGN KEY (pribor_tip, pribor_num, pribor_exp) REFERENCES public.main(pribor_tip, pribor_num, pribor_exp) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main main_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_fk FOREIGN KEY (pribor_mod) REFERENCES public.modify(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_last_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_last_name_fkey FOREIGN KEY (last_name) REFERENCES public.names(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_last_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_last_status_fkey FOREIGN KEY (last_status) REFERENCES public.status(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_msk_num_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_msk_num_fkey FOREIGN KEY (msk_num) REFERENCES public.msk(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_name_ktx_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_name_ktx_fkey FOREIGN KEY (name_ktx) REFERENCES public.names(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_name_oki_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_name_oki_fkey FOREIGN KEY (name_oki) REFERENCES public.names(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_name_out_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_name_out_fkey FOREIGN KEY (name_out) REFERENCES public.names(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_name_snu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_name_snu_fkey FOREIGN KEY (name_snu) REFERENCES public.names(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_pribor_gaz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_pribor_gaz_fkey FOREIGN KEY (pribor_gaz) REFERENCES public.gaz(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_pribor_mat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_pribor_mat_fkey FOREIGN KEY (pribor_mat) REFERENCES public.material(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_pribor_range_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_pribor_range_fkey FOREIGN KEY (pribor_range) REFERENCES public.range(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_pribor_sens_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_pribor_sens_fkey FOREIGN KEY (pribor_sens) REFERENCES public.sensor(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: main test_pribor_tip_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT test_pribor_tip_fkey FOREIGN KEY (pribor_tip) REFERENCES public.pribor(key) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

