--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: timestamped_points; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE timestamped_points (
    id integer NOT NULL,
    "time" timestamp without time zone NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    altitude numeric(7,1),
    tour_id integer
);


--
-- Name: timestamped_points_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE timestamped_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timestamped_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE timestamped_points_id_seq OWNED BY timestamped_points.id;


--
-- Name: tours; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tours (
    id integer NOT NULL,
    first_point_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tours_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tours_id_seq OWNED BY tours.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY timestamped_points ALTER COLUMN id SET DEFAULT nextval('timestamped_points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tours ALTER COLUMN id SET DEFAULT nextval('tours_id_seq'::regclass);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: timestamped_points_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY timestamped_points
    ADD CONSTRAINT timestamped_points_pkey PRIMARY KEY (id);


--
-- Name: tours_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT tours_pkey PRIMARY KEY (id);


--
-- Name: index_timestamped_points_on_tour_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_timestamped_points_on_tour_id ON timestamped_points USING btree (tour_id);


--
-- Name: index_tours_on_first_point_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tours_on_first_point_id ON tours USING btree (first_point_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: timestamped_points_tour_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY timestamped_points
    ADD CONSTRAINT timestamped_points_tour_id_fk FOREIGN KEY (tour_id) REFERENCES tours(id);


--
-- Name: tours_first_point_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT tours_first_point_id_fk FOREIGN KEY (first_point_id) REFERENCES timestamped_points(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140203225300');

INSERT INTO schema_migrations (version) VALUES ('20140204220916');

INSERT INTO schema_migrations (version) VALUES ('20140204235548');

INSERT INTO schema_migrations (version) VALUES ('20140209200321');

INSERT INTO schema_migrations (version) VALUES ('20140209204537');
