PGDMP      (                }            PROJECT    15.5    16.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    49181    PROJECT    DATABASE     �   CREATE DATABASE "PROJECT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "PROJECT";
                postgres    false            �            1259    49196    answers    TABLE     �   CREATE TABLE public.answers (
    id_answer integer NOT NULL,
    id_user integer NOT NULL,
    id_new integer NOT NULL,
    answer_content character varying NOT NULL
);
    DROP TABLE public.answers;
       public         heap    postgres    false            �            1259    49201 	   followers    TABLE     `   CREATE TABLE public.followers (
    followers integer NOT NULL,
    id_user integer NOT NULL
);
    DROP TABLE public.followers;
       public         heap    postgres    false            �            1259    49204    likes    TABLE     w   CREATE TABLE public.likes (
    id_like integer NOT NULL,
    id_user integer NOT NULL,
    id_new integer NOT NULL
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    49182    news    TABLE     �   CREATE TABLE public.news (
    id_new integer NOT NULL,
    author_public_id integer NOT NULL,
    content character varying NOT NULL,
    publication_date date NOT NULL
);
    DROP TABLE public.news;
       public         heap    postgres    false            �            1259    49207    posts    TABLE     �   CREATE TABLE public.posts (
    id_post integer NOT NULL,
    id_user integer NOT NULL,
    id_like integer NOT NULL,
    post_content character varying NOT NULL
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    49187    users    TABLE       CREATE TABLE public.users (
    id_user integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    role character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false                      0    49196    answers 
   TABLE DATA           M   COPY public.answers (id_answer, id_user, id_new, answer_content) FROM stdin;
    public          postgres    false    216   �                 0    49201 	   followers 
   TABLE DATA           7   COPY public.followers (followers, id_user) FROM stdin;
    public          postgres    false    217   �                 0    49204    likes 
   TABLE DATA           9   COPY public.likes (id_like, id_user, id_new) FROM stdin;
    public          postgres    false    218   �                 0    49182    news 
   TABLE DATA           S   COPY public.news (id_new, author_public_id, content, publication_date) FROM stdin;
    public          postgres    false    214   �                 0    49207    posts 
   TABLE DATA           H   COPY public.posts (id_post, id_user, id_like, post_content) FROM stdin;
    public          postgres    false    219                    0    49187    users 
   TABLE DATA           Y   COPY public.users (id_user, username, password, first_name, last_name, role) FROM stdin;
    public          postgres    false    215   %       }           2606    49213    answers id_answer 
   CONSTRAINT     V   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT id_answer PRIMARY KEY (id_answer);
 ;   ALTER TABLE ONLY public.answers DROP CONSTRAINT id_answer;
       public            postgres    false    216                       2606    49245    likes id_likes 
   CONSTRAINT     Q   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT id_likes PRIMARY KEY (id_like);
 8   ALTER TABLE ONLY public.likes DROP CONSTRAINT id_likes;
       public            postgres    false    218            �           2606    49247    posts id_post 
   CONSTRAINT     P   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT id_post PRIMARY KEY (id_post);
 7   ALTER TABLE ONLY public.posts DROP CONSTRAINT id_post;
       public            postgres    false    219            y           2606    49193    news news_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id_new);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    214            {           2606    49195    users user_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            postgres    false    215            �           2606    49248    posts id_like    FK CONSTRAINT     q   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT id_like FOREIGN KEY (id_like) REFERENCES public.likes(id_like);
 7   ALTER TABLE ONLY public.posts DROP CONSTRAINT id_like;
       public          postgres    false    219    3199    218            �           2606    49219    answers id_new    FK CONSTRAINT     o   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT id_new FOREIGN KEY (id_new) REFERENCES public.news(id_new);
 8   ALTER TABLE ONLY public.answers DROP CONSTRAINT id_new;
       public          postgres    false    214    216    3193            �           2606    49239    likes id_new    FK CONSTRAINT     m   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT id_new FOREIGN KEY (id_new) REFERENCES public.news(id_new);
 6   ALTER TABLE ONLY public.likes DROP CONSTRAINT id_new;
       public          postgres    false    214    218    3193            �           2606    49214    answers id_user    FK CONSTRAINT     s   ALTER TABLE ONLY public.answers
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 9   ALTER TABLE ONLY public.answers DROP CONSTRAINT id_user;
       public          postgres    false    215    216    3195            �           2606    49224    followers id_user    FK CONSTRAINT     u   ALTER TABLE ONLY public.followers
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 ;   ALTER TABLE ONLY public.followers DROP CONSTRAINT id_user;
       public          postgres    false    3195    217    215            �           2606    49229    likes id_user    FK CONSTRAINT     q   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 7   ALTER TABLE ONLY public.likes DROP CONSTRAINT id_user;
       public          postgres    false    215    218    3195            �           2606    49234    posts id_user    FK CONSTRAINT     q   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 7   ALTER TABLE ONLY public.posts DROP CONSTRAINT id_user;
       public          postgres    false    3195    215    219                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     