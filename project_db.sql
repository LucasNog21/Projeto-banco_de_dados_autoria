PGDMP      $                }            projeto    15.5    16.1 
    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    49166    projeto    DATABASE     ~   CREATE DATABASE projeto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE projeto;
                postgres    false            �            1259    49174    noticias    TABLE     �   CREATE TABLE public.noticias (
    id_noticia integer NOT NULL,
    autor_public_id integer NOT NULL,
    conteudo character varying NOT NULL,
    data_publicacao date NOT NULL
);
    DROP TABLE public.noticias;
       public         heap    postgres    false            �            1259    49167    usuario    TABLE     +  CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    usarname character varying NOT NULL,
    senha character varying NOT NULL,
    nome character varying NOT NULL,
    sobrenome character varying NOT NULL,
    cargo character varying NOT NULL,
    email character varying NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �          0    49174    noticias 
   TABLE DATA           Z   COPY public.noticias (id_noticia, autor_public_id, conteudo, data_publicacao) FROM stdin;
    public          postgres    false    215   �
       �          0    49167    usuario 
   TABLE DATA           ]   COPY public.usuario (id_usuario, usarname, senha, nome, sobrenome, cargo, email) FROM stdin;
    public          postgres    false    214   �
       k           2606    49180    noticias noticias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id_noticia);
 @   ALTER TABLE ONLY public.noticias DROP CONSTRAINT noticias_pkey;
       public            postgres    false    215            i           2606    49173    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    214            �      x������ � �      �      x������ � �     