--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5
-- Dumped by pg_dump version 15.5

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
-- Name: curtidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curtidas (
    id_curtida integer NOT NULL,
    id_usuario integer NOT NULL,
    id_noticia integer NOT NULL
);


ALTER TABLE public.curtidas OWNER TO postgres;

--
-- Name: noticias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.noticias (
    id_noticia integer NOT NULL,
    id_autor integer NOT NULL,
    conteudo_noticia character varying NOT NULL,
    data_publicacao date NOT NULL
);


ALTER TABLE public.noticias OWNER TO postgres;

--
-- Name: postagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postagens (
    id_postagem integer NOT NULL,
    id_usuario integer NOT NULL,
    id_curtida integer NOT NULL,
    conteudo_postagem character varying NOT NULL
);


ALTER TABLE public.postagens OWNER TO postgres;

--
-- Name: respostas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respostas (
    id_resposta integer NOT NULL,
    id_usuario integer NOT NULL,
    id_noticia integer NOT NULL,
    conteudo_resposta character varying NOT NULL
);


ALTER TABLE public.respostas OWNER TO postgres;

--
-- Name: seguidores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seguidores (
    seguidor integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.seguidores OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    username character varying NOT NULL,
    senha character varying NOT NULL,
    nome character varying NOT NULL,
    sobrenome character varying NOT NULL,
    cargo character varying NOT NULL,
    email character varying(50)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Data for Name: curtidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curtidas (id_curtida, id_usuario, id_noticia) FROM stdin;
\.


--
-- Data for Name: noticias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.noticias (id_noticia, id_autor, conteudo_noticia, data_publicacao) FROM stdin;
1	1	conteudo teste	2025-02-18
2	2	conteudo teste2	2025-02-18
3	2	blanblalbla	2005-02-15
\.


--
-- Data for Name: postagens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.postagens (id_postagem, id_usuario, id_curtida, conteudo_postagem) FROM stdin;
\.


--
-- Data for Name: respostas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.respostas (id_resposta, id_usuario, id_noticia, conteudo_resposta) FROM stdin;
\.


--
-- Data for Name: seguidores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seguidores (seguidor, id_usuario) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, username, senha, nome, sobrenome, cargo, email) FROM stdin;
1	nog	123	Lucas	Nogueira	aluno	email@email.com
0	string	123456778	string	string	string	string
2	Filepa	felipe	Felipe	Raposo	dev	felipe@raposo.com
\.


--
-- Name: curtidas id_curtida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_curtida PRIMARY KEY (id_curtida);


--
-- Name: postagens id_postagem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_postagem PRIMARY KEY (id_postagem);


--
-- Name: respostas id_resposta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_resposta PRIMARY KEY (id_resposta);


--
-- Name: noticias noticias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id_noticia);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: postagens id_curtida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_curtida FOREIGN KEY (id_curtida) REFERENCES public.curtidas(id_curtida);


--
-- Name: respostas id_noticia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_noticia FOREIGN KEY (id_noticia) REFERENCES public.noticias(id_noticia);


--
-- Name: curtidas id_noticia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_noticia FOREIGN KEY (id_noticia) REFERENCES public.noticias(id_noticia);


--
-- Name: respostas id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: seguidores id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguidores
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: curtidas id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: postagens id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- PostgreSQL database dump complete
--

