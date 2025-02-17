PGDMP          
            }            projeto    15.5    16.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    65594    projeto    DATABASE     ~   CREATE DATABASE projeto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE projeto;
                postgres    false            �            1259    65603    curtidas    TABLE     �   CREATE TABLE public.curtidas (
    id_curtida integer NOT NULL,
    id_usuario integer NOT NULL,
    id_noticia integer NOT NULL
);
    DROP TABLE public.curtidas;
       public         heap    postgres    false            �            1259    65606    noticias    TABLE     �   CREATE TABLE public.noticias (
    id_noticia integer NOT NULL,
    id_autor integer NOT NULL,
    conteudo_noticia character varying NOT NULL,
    data_publicacao date NOT NULL
);
    DROP TABLE public.noticias;
       public         heap    postgres    false            �            1259    65611 	   postagens    TABLE     �   CREATE TABLE public.postagens (
    id_postagem integer NOT NULL,
    id_usuario integer NOT NULL,
    id_curtida integer NOT NULL,
    conteudo_postagem character varying NOT NULL
);
    DROP TABLE public.postagens;
       public         heap    postgres    false            �            1259    65595 	   respostas    TABLE     �   CREATE TABLE public.respostas (
    id_resposta integer NOT NULL,
    id_usuario integer NOT NULL,
    id_noticia integer NOT NULL,
    conteudo_resposta character varying NOT NULL
);
    DROP TABLE public.respostas;
       public         heap    postgres    false            �            1259    65600 
   seguidores    TABLE     c   CREATE TABLE public.seguidores (
    seguidor integer NOT NULL,
    id_usuario integer NOT NULL
);
    DROP TABLE public.seguidores;
       public         heap    postgres    false            �            1259    65616    usuarios    TABLE     '  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    username character varying NOT NULL,
    senha character varying NOT NULL,
    nome character varying NOT NULL,
    sobrenome character varying NOT NULL,
    cargo character varying NOT NULL,
    email character varying(50)
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false                      0    65603    curtidas 
   TABLE DATA           F   COPY public.curtidas (id_curtida, id_usuario, id_noticia) FROM stdin;
    public          postgres    false    216   �                  0    65606    noticias 
   TABLE DATA           [   COPY public.noticias (id_noticia, id_autor, conteudo_noticia, data_publicacao) FROM stdin;
    public          postgres    false    217   �                  0    65611 	   postagens 
   TABLE DATA           [   COPY public.postagens (id_postagem, id_usuario, id_curtida, conteudo_postagem) FROM stdin;
    public          postgres    false    218   �                  0    65595 	   respostas 
   TABLE DATA           [   COPY public.respostas (id_resposta, id_usuario, id_noticia, conteudo_resposta) FROM stdin;
    public          postgres    false    214   	!                 0    65600 
   seguidores 
   TABLE DATA           :   COPY public.seguidores (seguidor, id_usuario) FROM stdin;
    public          postgres    false    215   &!                 0    65616    usuarios 
   TABLE DATA           ^   COPY public.usuarios (id_usuario, username, senha, nome, sobrenome, cargo, email) FROM stdin;
    public          postgres    false    219   C!       {           2606    65624    curtidas id_curtida 
   CONSTRAINT     Y   ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_curtida PRIMARY KEY (id_curtida);
 =   ALTER TABLE ONLY public.curtidas DROP CONSTRAINT id_curtida;
       public            postgres    false    216                       2606    65626    postagens id_postagem 
   CONSTRAINT     \   ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_postagem PRIMARY KEY (id_postagem);
 ?   ALTER TABLE ONLY public.postagens DROP CONSTRAINT id_postagem;
       public            postgres    false    218            y           2606    65622    respostas id_resposta 
   CONSTRAINT     \   ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_resposta PRIMARY KEY (id_resposta);
 ?   ALTER TABLE ONLY public.respostas DROP CONSTRAINT id_resposta;
       public            postgres    false    214            }           2606    65628    noticias noticias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id_noticia);
 @   ALTER TABLE ONLY public.noticias DROP CONSTRAINT noticias_pkey;
       public            postgres    false    217            �           2606    65630    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    219            �           2606    65631    postagens id_curtida    FK CONSTRAINT     �   ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_curtida FOREIGN KEY (id_curtida) REFERENCES public.curtidas(id_curtida);
 >   ALTER TABLE ONLY public.postagens DROP CONSTRAINT id_curtida;
       public          postgres    false    218    3195    216            �           2606    65636    respostas id_noticia    FK CONSTRAINT     �   ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_noticia FOREIGN KEY (id_noticia) REFERENCES public.noticias(id_noticia);
 >   ALTER TABLE ONLY public.respostas DROP CONSTRAINT id_noticia;
       public          postgres    false    214    3197    217            �           2606    65641    curtidas id_noticia    FK CONSTRAINT     �   ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_noticia FOREIGN KEY (id_noticia) REFERENCES public.noticias(id_noticia);
 =   ALTER TABLE ONLY public.curtidas DROP CONSTRAINT id_noticia;
       public          postgres    false    216    217    3197            �           2606    65646    respostas id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 >   ALTER TABLE ONLY public.respostas DROP CONSTRAINT id_usuario;
       public          postgres    false    219    3201    214            �           2606    65651    seguidores id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguidores
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 ?   ALTER TABLE ONLY public.seguidores DROP CONSTRAINT id_usuario;
       public          postgres    false    215    219    3201            �           2606    65656    curtidas id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 =   ALTER TABLE ONLY public.curtidas DROP CONSTRAINT id_usuario;
       public          postgres    false    216    219    3201            �           2606    65661    postagens id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 >   ALTER TABLE ONLY public.postagens DROP CONSTRAINT id_usuario;
       public          postgres    false    218    3201    219                  x������ � �         3   x�3�4�L��+I-M�W(I-.I�4202�50�5��2�4B�5B������ j=            x������ � �            x������ � �            x������ � �         L   x�3���O�442��)MN,���O/M�,J�L�)���L�M��q �z���\��%E�y`&�f��0lW� �@     