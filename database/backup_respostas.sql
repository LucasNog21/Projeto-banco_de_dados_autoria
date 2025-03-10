PGDMP  9                    }            projeto    16.4    16.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32783    projeto    DATABASE     ~   CREATE DATABASE projeto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE projeto;
                postgres    false            �            1259    32784    curtidas    TABLE     �   CREATE TABLE public.curtidas (
    id_curtida integer NOT NULL,
    id_usuario integer NOT NULL,
    id_noticia integer NOT NULL
);
    DROP TABLE public.curtidas;
       public         heap    postgres    false            �            1259    32787    noticias    TABLE     �   CREATE TABLE public.noticias (
    id_noticia integer NOT NULL,
    id_autor integer NOT NULL,
    conteudo_noticia character varying NOT NULL,
    data_publicacao date NOT NULL
);
    DROP TABLE public.noticias;
       public         heap    postgres    false            �            1259    40975    pesquisa_tecnoautoritarismo    TABLE     #  CREATE TABLE public.pesquisa_tecnoautoritarismo (
    carimbo timestamp without time zone,
    conhece_tecnoautoritarismo character varying(10),
    conceito_tecnoautoritarismo text,
    conhece_lgpd_marco_civil character varying(10),
    conceito_lgpd text,
    presenciou_tecnoautoritarismo character varying(10),
    caso_observado text,
    considera_autoritarismo_digital_violento character varying(10),
    impacto_tecnoautoritarismo integer,
    leis_eficazes character varying(10),
    leis_efetivamente_aplicadas character varying(10)
);
 /   DROP TABLE public.pesquisa_tecnoautoritarismo;
       public         heap    postgres    false            �            1259    32792 	   postagens    TABLE     �   CREATE TABLE public.postagens (
    id_postagem integer NOT NULL,
    id_usuario integer NOT NULL,
    id_curtida integer NOT NULL,
    conteudo_postagem character varying NOT NULL
);
    DROP TABLE public.postagens;
       public         heap    postgres    false            �            1259    32797 	   respostas    TABLE     �   CREATE TABLE public.respostas (
    id_resposta integer NOT NULL,
    id_usuario integer NOT NULL,
    id_noticia integer NOT NULL,
    conteudo_resposta character varying NOT NULL
);
    DROP TABLE public.respostas;
       public         heap    postgres    false            �            1259    32802 
   seguidores    TABLE     c   CREATE TABLE public.seguidores (
    seguidor integer NOT NULL,
    id_usuario integer NOT NULL
);
    DROP TABLE public.seguidores;
       public         heap    postgres    false            �            1259    32805    usuarios    TABLE     &  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    usuario character varying NOT NULL,
    senha character varying NOT NULL,
    nome character varying NOT NULL,
    sobrenome character varying NOT NULL,
    cargo character varying NOT NULL,
    email character varying(50)
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false                      0    32784    curtidas 
   TABLE DATA           F   COPY public.curtidas (id_curtida, id_usuario, id_noticia) FROM stdin;
    public          postgres    false    215   U%                 0    32787    noticias 
   TABLE DATA           [   COPY public.noticias (id_noticia, id_autor, conteudo_noticia, data_publicacao) FROM stdin;
    public          postgres    false    216   r%                 0    40975    pesquisa_tecnoautoritarismo 
   TABLE DATA           A  COPY public.pesquisa_tecnoautoritarismo (carimbo, conhece_tecnoautoritarismo, conceito_tecnoautoritarismo, conhece_lgpd_marco_civil, conceito_lgpd, presenciou_tecnoautoritarismo, caso_observado, considera_autoritarismo_digital_violento, impacto_tecnoautoritarismo, leis_eficazes, leis_efetivamente_aplicadas) FROM stdin;
    public          postgres    false    221   �%       	          0    32792 	   postagens 
   TABLE DATA           [   COPY public.postagens (id_postagem, id_usuario, id_curtida, conteudo_postagem) FROM stdin;
    public          postgres    false    217   V-       
          0    32797 	   respostas 
   TABLE DATA           [   COPY public.respostas (id_resposta, id_usuario, id_noticia, conteudo_resposta) FROM stdin;
    public          postgres    false    218   s-                 0    32802 
   seguidores 
   TABLE DATA           :   COPY public.seguidores (seguidor, id_usuario) FROM stdin;
    public          postgres    false    219   �-                 0    32805    usuarios 
   TABLE DATA           ]   COPY public.usuarios (id_usuario, usuario, senha, nome, sobrenome, cargo, email) FROM stdin;
    public          postgres    false    220   �-       h           2606    32811    curtidas id_curtida 
   CONSTRAINT     Y   ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_curtida PRIMARY KEY (id_curtida);
 =   ALTER TABLE ONLY public.curtidas DROP CONSTRAINT id_curtida;
       public            postgres    false    215            l           2606    32813    postagens id_postagem 
   CONSTRAINT     \   ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_postagem PRIMARY KEY (id_postagem);
 ?   ALTER TABLE ONLY public.postagens DROP CONSTRAINT id_postagem;
       public            postgres    false    217            n           2606    32815    respostas id_resposta 
   CONSTRAINT     \   ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_resposta PRIMARY KEY (id_resposta);
 ?   ALTER TABLE ONLY public.respostas DROP CONSTRAINT id_resposta;
       public            postgres    false    218            j           2606    32817    noticias noticias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id_noticia);
 @   ALTER TABLE ONLY public.noticias DROP CONSTRAINT noticias_pkey;
       public            postgres    false    216            p           2606    32819    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    220            s           2606    32820    postagens id_curtida    FK CONSTRAINT     �   ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_curtida FOREIGN KEY (id_curtida) REFERENCES public.curtidas(id_curtida);
 >   ALTER TABLE ONLY public.postagens DROP CONSTRAINT id_curtida;
       public          postgres    false    4712    215    217            u           2606    32825    respostas id_noticia    FK CONSTRAINT     �   ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_noticia FOREIGN KEY (id_noticia) REFERENCES public.noticias(id_noticia);
 >   ALTER TABLE ONLY public.respostas DROP CONSTRAINT id_noticia;
       public          postgres    false    218    4714    216            q           2606    32830    curtidas id_noticia    FK CONSTRAINT     �   ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_noticia FOREIGN KEY (id_noticia) REFERENCES public.noticias(id_noticia);
 =   ALTER TABLE ONLY public.curtidas DROP CONSTRAINT id_noticia;
       public          postgres    false    216    4714    215            v           2606    32835    respostas id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.respostas
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 >   ALTER TABLE ONLY public.respostas DROP CONSTRAINT id_usuario;
       public          postgres    false    220    4720    218            w           2606    32840    seguidores id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguidores
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 ?   ALTER TABLE ONLY public.seguidores DROP CONSTRAINT id_usuario;
       public          postgres    false    220    4720    219            r           2606    32845    curtidas id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.curtidas
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 =   ALTER TABLE ONLY public.curtidas DROP CONSTRAINT id_usuario;
       public          postgres    false    4720    215    220            t           2606    32850    postagens id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.postagens
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 >   ALTER TABLE ONLY public.postagens DROP CONSTRAINT id_usuario;
       public          postgres    false    217    4720    220                  x������ � �         5   x�3�4�,I-.I�4202�50�5��2�4�!�E�r!!a����� f�         �  x��X͎�6>g���5$��]�&���)��r�%Z˭$���y��E6=	�@�K�Ջ�R���l�����|��7��xqE��%���p��W~��Ϻ���D�/���&L.�u�ǹ�K���\%�}ٽg��F��ֈ�R��%>�\sV�J6Js�8�U��{G��e��T�V0#n8Bگ9,�F��y���;�2Z��)��i���
��mw��o�	�9�u�yĥ�2�ム�q���_&����D��d�8it��+G����D�W�U��l-J��d���rd%UU*��D:�I�nK��u!S�
f�Zo��}�ޖ��l~�w��L�fZ��>��e�U!(E��?o�s�t���<}�0��D�:�ˆK�Tۃ�����&��E�X��BWȲ��r3c,t��EAڋs{OU��v+
�q`0Z7�V�#^%a��	?62U*y!�)a����/)��RzA�iMK����A%� �V���S�W�|![׀�DL�.EC�챙���
�n�L�x�)u��g��4��3�i�L*��}!�'i�K�>��n�A,�劅�$�H#���VђE�Z&��ϵjD�K�WS��+�2D˙�Cw�j�s���&)Pg�]\y+r��[�i{���b�:�*���/@������҄�ߴUc/  ��-R	��@>U �:��gd	8)���4}&`Pps��|������g(���-�0�ۺm��m��yc@�ﱱ�nؗ"�b�����r���3
��X�"M�چ���c&\}�"%R�s����5���Ţ�y[�&d�6���ux�����N=���$���@��L��Ko!���9H�t�T���҉`�.ܟg{��1��O;*K�e�}0�w��q�B�1�p�2�z�3[N����(�B� ���H�☬�I򘶂���ʱ��0��c=�8�p�&�2�Lnx�#HYm�4/�l���EF�b�m�32�(/� �r(88Znyڷ��>�8-'S<.
�&N��X�h�_�srk1O�{!��JP��]i�\;
e�"����kϞ��K�?w�%�t� l�I�J���9�/��O#������葓�
����8�$� �-֮UaTŵ4g�O��C�!{����̀X�M��\�A
9��sK��/tZ�:N8Xuh�b��rM���}�U�C3�9�Z��8����� � Dʖ��r�����S+����$E����<x�<��$aɉ����*gbߏ�;p�w�^�A$���*	YU�3�>I�HR�`Pt��ԓ23��)2�B�e����*�:,Uh�D�V�r��,
��d�
�GU�k����UZR{��G�v\����-��e�I��.�q��[yXw�������6��R�өۚF���u��ψ�'�g#��<��0_@���.�˗��㣹���6�_(o�%X1�/_Ю��'�����O{��p\E���3'�F �t���������]�`@�ݨT
b �E�5NC5�'[k�Y�(�7xKUc|'���ݛQ}8T�숹��t�$�X?܏�cFиS�ug���g���� O�#� �{s4��ĉ5~,�M����{�CAb����v_����W�؜�.�bQD=.N��R��?�G&[a��Ww�`X53����h8G��`F>݆�H1�$G�)�9�k2��y&�ɚ'���}�@`kh	h���U��5��
�Y��@t>�gھe���ʉ��QY2�>P�a����1�l�E��>ZE��2G�;ᱜ�"ؑ�Q4�k�A�;��3�0�;";�.�Zh��Nn�i8�f���ޏ�?�F�DD��Lfȹ=��J�/�Ck���ɇ��ժ�>���m���ڊfIҢʅ�n��M��_�6Z�T���[?͉
�MC*��J��&�T?�� |5;;;�(��      	      x������ � �      
      x������ � �            x������ � �         {   x�3���O�442��)MN,���O/M�,J�t�)���L�M��q �z���\��A�i�� &�f��^�ŇW�Ss��"i2�t��I-H�LK��,H�t�PA�����)�eP	�"�XO� {�2�     