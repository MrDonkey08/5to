PGDMP  9    .                |         	   derrumbes    16.2    16.2 %    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ~           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395 	   derrumbes    DATABASE     q   CREATE DATABASE derrumbes WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE derrumbes;
                postgres    false            �            1255    16482    validar_referencias()    FUNCTION       CREATE FUNCTION public.validar_referencias() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Contacto WHERE ID_Contacto = NEW.ID_Contacto
    ) THEN
        RAISE EXCEPTION 'ID_Contacto no tiene una referencia válida en la tabla Contacto';
    END IF;
    IF NOT EXISTS (
        SELECT 1 FROM Direccion WHERE ID_Direccion = NEW.ID_Direccion
    ) THEN
        RAISE EXCEPTION 'ID_Direccion no tiene una referencia válida en la tabla Direccion';
    END IF;
    RETURN NEW;
END;
$$;
 ,   DROP FUNCTION public.validar_referencias();
       public          postgres    false            �            1255    16452    validar_status()    FUNCTION     �   CREATE FUNCTION public.validar_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF new.status IS NULL THEN
        RAISE EXCEPTION 'Ingresa estatus';
    END IF;
END;
$$;
 '   DROP FUNCTION public.validar_status();
       public          postgres    false            �            1259    16396    contacto    TABLE     �   CREATE TABLE public.contacto (
    id_contacto integer NOT NULL,
    nombre character varying(80) NOT NULL,
    telefono character varying(25)
);
    DROP TABLE public.contacto;
       public         heap    postgres    false            �            1259    16399    contacto_id_contacto_seq    SEQUENCE     �   CREATE SEQUENCE public.contacto_id_contacto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.contacto_id_contacto_seq;
       public          postgres    false    215            �           0    0    contacto_id_contacto_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.contacto_id_contacto_seq OWNED BY public.contacto.id_contacto;
          public          postgres    false    216            �            1259    16400    derrumbe    TABLE     ,  CREATE TABLE public.derrumbe (
    id_derrumbe integer NOT NULL,
    descripcion character varying(200),
    necesidades character varying(100),
    tipo_de_dano character varying(40) NOT NULL,
    estatus character varying(30),
    id_contacto integer NOT NULL,
    id_direccion integer NOT NULL
);
    DROP TABLE public.derrumbe;
       public         heap    postgres    false            �            1259    16403    derrumbe_id_derrumbe_seq    SEQUENCE     �   CREATE SEQUENCE public.derrumbe_id_derrumbe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.derrumbe_id_derrumbe_seq;
       public          postgres    false    217            �           0    0    derrumbe_id_derrumbe_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.derrumbe_id_derrumbe_seq OWNED BY public.derrumbe.id_derrumbe;
          public          postgres    false    218            �            1259    16404 	   direccion    TABLE     9  CREATE TABLE public.direccion (
    id_direccion integer NOT NULL,
    calle character varying(100) NOT NULL,
    numero_exterior integer NOT NULL,
    colonia character varying(50),
    entidad character varying(30),
    tipo_de_residencia character varying(30),
    ubicacion character varying(200) NOT NULL
);
    DROP TABLE public.direccion;
       public         heap    postgres    false            �            1259    16467    direccion_en_proceso    VIEW     D  CREATE VIEW public.direccion_en_proceso AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'En proceso'::text);
 '   DROP VIEW public.direccion_en_proceso;
       public          postgres    false    217    217    219    219    219    219    219    219    219            �            1259    16407    direccion_id_direccion_seq    SEQUENCE     �   CREATE SEQUENCE public.direccion_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.direccion_id_direccion_seq;
       public          postgres    false    219            �           0    0    direccion_id_direccion_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.direccion_id_direccion_seq OWNED BY public.direccion.id_direccion;
          public          postgres    false    220            �            1259    16462    direccion_pendiente    VIEW     B  CREATE VIEW public.direccion_pendiente AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'Pendiente'::text);
 &   DROP VIEW public.direccion_pendiente;
       public          postgres    false    219    217    217    219    219    219    219    219    219            �            1259    16454    residencia_casa    VIEW     �   CREATE VIEW public.residencia_casa AS
 SELECT id_direccion,
    calle,
    numero_exterior,
    colonia,
    entidad,
    tipo_de_residencia,
    ubicacion
   FROM public.direccion
  WHERE ((tipo_de_residencia)::text = 'Casa'::text);
 "   DROP VIEW public.residencia_casa;
       public          postgres    false    219    219    219    219    219    219    219            �            1259    16458    residencia_departamento    VIEW     �   CREATE VIEW public.residencia_departamento AS
 SELECT id_direccion,
    calle,
    numero_exterior,
    colonia,
    entidad,
    tipo_de_residencia,
    ubicacion
   FROM public.direccion
  WHERE ((tipo_de_residencia)::text = 'Departamento'::text);
 *   DROP VIEW public.residencia_departamento;
       public          postgres    false    219    219    219    219    219    219    219            �            1259    16472    status_casa    VIEW     H  CREATE VIEW public.status_casa AS
 SELECT dr.id_derrumbe,
    dr.descripcion,
    dr.necesidades,
    dr.tipo_de_dano,
    dr.estatus,
    dr.id_contacto,
    dr.id_direccion
   FROM (public.derrumbe dr
     JOIN public.direccion d ON ((dr.id_direccion = d.id_direccion)))
  WHERE ((d.tipo_de_residencia)::text = 'Casa'::text);
    DROP VIEW public.status_casa;
       public          postgres    false    219    217    217    217    217    217    217    219    217            �            1259    16477    status_departamento    VIEW     C  CREATE VIEW public.status_departamento AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'En proceso'::text);
 &   DROP VIEW public.status_departamento;
       public          postgres    false    219    217    219    219    219    219    219    219    217            �           2604    16408    contacto id_contacto    DEFAULT     |   ALTER TABLE ONLY public.contacto ALTER COLUMN id_contacto SET DEFAULT nextval('public.contacto_id_contacto_seq'::regclass);
 C   ALTER TABLE public.contacto ALTER COLUMN id_contacto DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16409    derrumbe id_derrumbe    DEFAULT     |   ALTER TABLE ONLY public.derrumbe ALTER COLUMN id_derrumbe SET DEFAULT nextval('public.derrumbe_id_derrumbe_seq'::regclass);
 C   ALTER TABLE public.derrumbe ALTER COLUMN id_derrumbe DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16410    direccion id_direccion    DEFAULT     �   ALTER TABLE ONLY public.direccion ALTER COLUMN id_direccion SET DEFAULT nextval('public.direccion_id_direccion_seq'::regclass);
 E   ALTER TABLE public.direccion ALTER COLUMN id_direccion DROP DEFAULT;
       public          postgres    false    220    219            u          0    16396    contacto 
   TABLE DATA           A   COPY public.contacto (id_contacto, nombre, telefono) FROM stdin;
    public          postgres    false    215            w          0    16400    derrumbe 
   TABLE DATA           {   COPY public.derrumbe (id_derrumbe, descripcion, necesidades, tipo_de_dano, estatus, id_contacto, id_direccion) FROM stdin;
    public          postgres    false    217            y          0    16404 	   direccion 
   TABLE DATA           z   COPY public.direccion (id_direccion, calle, numero_exterior, colonia, entidad, tipo_de_residencia, ubicacion) FROM stdin;
    public          postgres    false    219            �           0    0    contacto_id_contacto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.contacto_id_contacto_seq', 5, true);
          public          postgres    false    216            �           0    0    derrumbe_id_derrumbe_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.derrumbe_id_derrumbe_seq', 5, true);
          public          postgres    false    218            �           0    0    direccion_id_direccion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.direccion_id_direccion_seq', 5, true);
          public          postgres    false    220            �           2606    16412    contacto contacto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id_contacto);
 @   ALTER TABLE ONLY public.contacto DROP CONSTRAINT contacto_pkey;
       public            postgres    false    215            �           2606    16414    derrumbe derrumbe_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_pkey PRIMARY KEY (id_derrumbe);
 @   ALTER TABLE ONLY public.derrumbe DROP CONSTRAINT derrumbe_pkey;
       public            postgres    false    217            �           2606    16416    direccion direccion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion);
 B   ALTER TABLE ONLY public.direccion DROP CONSTRAINT direccion_pkey;
       public            postgres    false    219            �           2620    16483 $   derrumbe validar_referencias_trigger    TRIGGER     �   CREATE TRIGGER validar_referencias_trigger BEFORE INSERT OR UPDATE ON public.derrumbe FOR EACH ROW EXECUTE FUNCTION public.validar_referencias();
 =   DROP TRIGGER validar_referencias_trigger ON public.derrumbe;
       public          postgres    false    217    228            �           2620    16453    derrumbe validar_status    TRIGGER     �   CREATE TRIGGER validar_status BEFORE INSERT OR UPDATE ON public.derrumbe FOR EACH ROW EXECUTE FUNCTION public.validar_status();
 0   DROP TRIGGER validar_status ON public.derrumbe;
       public          postgres    false    217    227            �           2606    16417 "   derrumbe derrumbe_id_contacto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_id_contacto_fkey FOREIGN KEY (id_contacto) REFERENCES public.contacto(id_contacto);
 L   ALTER TABLE ONLY public.derrumbe DROP CONSTRAINT derrumbe_id_contacto_fkey;
       public          postgres    false    3287    217    215            �           2606    16422 #   derrumbe derrumbe_id_direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 M   ALTER TABLE ONLY public.derrumbe DROP CONSTRAINT derrumbe_id_direccion_fkey;
       public          postgres    false    217    219    3291            u   c   x�3��M,:�0Q�=�(HsZZ����ps���+�ZT�Z�i
\����i ]�Ey�� ���ːӫ41O!�Qì��*�i\1z\\\ �6%�      w   �   x�u�1�0 g�~R�/�1���AA�]�d�sx
/#t u@��}��lV牑�B(j����Sa�vci���U_�Q�K���s�ϲ��H�c���G��Q��ͬ���Sv�Qp1��z�ݰ��*����4�������SP���<��.����U�      y   �   x�U�MjA��է�g��V���E6/�%th��zZ�.��2G�(9I&L@�=|�"��V���ш�DI�q�Tȅ��g��|~}����An������q[��P=�E�R#�cU�غ�Y슯��Lh�����"�r�jz7b�;�M᷈������)x�-D���k�{)��x��f|�v8�����!�b^��1�R�      %    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ~           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395 	   derrumbes    DATABASE     q   CREATE DATABASE derrumbes WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE derrumbes;
                postgres    false            �            1255    16482    validar_referencias()    FUNCTION       CREATE FUNCTION public.validar_referencias() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Contacto WHERE ID_Contacto = NEW.ID_Contacto
    ) THEN
        RAISE EXCEPTION 'ID_Contacto no tiene una referencia válida en la tabla Contacto';
    END IF;
    IF NOT EXISTS (
        SELECT 1 FROM Direccion WHERE ID_Direccion = NEW.ID_Direccion
    ) THEN
        RAISE EXCEPTION 'ID_Direccion no tiene una referencia válida en la tabla Direccion';
    END IF;
    RETURN NEW;
END;
$$;
 ,   DROP FUNCTION public.validar_referencias();
       public          postgres    false            �            1255    16452    validar_status()    FUNCTION     �   CREATE FUNCTION public.validar_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF new.status IS NULL THEN
        RAISE EXCEPTION 'Ingresa estatus';
    END IF;
END;
$$;
 '   DROP FUNCTION public.validar_status();
       public          postgres    false            �            1259    16396    contacto    TABLE     �   CREATE TABLE public.contacto (
    id_contacto integer NOT NULL,
    nombre character varying(80) NOT NULL,
    telefono character varying(25)
);
    DROP TABLE public.contacto;
       public         heap    postgres    false            �            1259    16399    contacto_id_contacto_seq    SEQUENCE     �   CREATE SEQUENCE public.contacto_id_contacto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.contacto_id_contacto_seq;
       public          postgres    false    215            �           0    0    contacto_id_contacto_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.contacto_id_contacto_seq OWNED BY public.contacto.id_contacto;
          public          postgres    false    216            �            1259    16400    derrumbe    TABLE     ,  CREATE TABLE public.derrumbe (
    id_derrumbe integer NOT NULL,
    descripcion character varying(200),
    necesidades character varying(100),
    tipo_de_dano character varying(40) NOT NULL,
    estatus character varying(30),
    id_contacto integer NOT NULL,
    id_direccion integer NOT NULL
);
    DROP TABLE public.derrumbe;
       public         heap    postgres    false            �            1259    16403    derrumbe_id_derrumbe_seq    SEQUENCE     �   CREATE SEQUENCE public.derrumbe_id_derrumbe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.derrumbe_id_derrumbe_seq;
       public          postgres    false    217            �           0    0    derrumbe_id_derrumbe_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.derrumbe_id_derrumbe_seq OWNED BY public.derrumbe.id_derrumbe;
          public          postgres    false    218            �            1259    16404 	   direccion    TABLE     9  CREATE TABLE public.direccion (
    id_direccion integer NOT NULL,
    calle character varying(100) NOT NULL,
    numero_exterior integer NOT NULL,
    colonia character varying(50),
    entidad character varying(30),
    tipo_de_residencia character varying(30),
    ubicacion character varying(200) NOT NULL
);
    DROP TABLE public.direccion;
       public         heap    postgres    false            �            1259    16467    direccion_en_proceso    VIEW     D  CREATE VIEW public.direccion_en_proceso AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'En proceso'::text);
 '   DROP VIEW public.direccion_en_proceso;
       public          postgres    false    217    217    219    219    219    219    219    219    219            �            1259    16407    direccion_id_direccion_seq    SEQUENCE     �   CREATE SEQUENCE public.direccion_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.direccion_id_direccion_seq;
       public          postgres    false    219            �           0    0    direccion_id_direccion_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.direccion_id_direccion_seq OWNED BY public.direccion.id_direccion;
          public          postgres    false    220            �            1259    16462    direccion_pendiente    VIEW     B  CREATE VIEW public.direccion_pendiente AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'Pendiente'::text);
 &   DROP VIEW public.direccion_pendiente;
       public          postgres    false    219    217    217    219    219    219    219    219    219            �            1259    16454    residencia_casa    VIEW     �   CREATE VIEW public.residencia_casa AS
 SELECT id_direccion,
    calle,
    numero_exterior,
    colonia,
    entidad,
    tipo_de_residencia,
    ubicacion
   FROM public.direccion
  WHERE ((tipo_de_residencia)::text = 'Casa'::text);
 "   DROP VIEW public.residencia_casa;
       public          postgres    false    219    219    219    219    219    219    219            �            1259    16458    residencia_departamento    VIEW     �   CREATE VIEW public.residencia_departamento AS
 SELECT id_direccion,
    calle,
    numero_exterior,
    colonia,
    entidad,
    tipo_de_residencia,
    ubicacion
   FROM public.direccion
  WHERE ((tipo_de_residencia)::text = 'Departamento'::text);
 *   DROP VIEW public.residencia_departamento;
       public          postgres    false    219    219    219    219    219    219    219            �            1259    16472    status_casa    VIEW     H  CREATE VIEW public.status_casa AS
 SELECT dr.id_derrumbe,
    dr.descripcion,
    dr.necesidades,
    dr.tipo_de_dano,
    dr.estatus,
    dr.id_contacto,
    dr.id_direccion
   FROM (public.derrumbe dr
     JOIN public.direccion d ON ((dr.id_direccion = d.id_direccion)))
  WHERE ((d.tipo_de_residencia)::text = 'Casa'::text);
    DROP VIEW public.status_casa;
       public          postgres    false    219    217    217    217    217    217    217    219    217            �            1259    16477    status_departamento    VIEW     C  CREATE VIEW public.status_departamento AS
 SELECT d.id_direccion,
    d.calle,
    d.numero_exterior,
    d.colonia,
    d.entidad,
    d.tipo_de_residencia,
    d.ubicacion
   FROM (public.direccion d
     JOIN public.derrumbe dr ON ((d.id_direccion = dr.id_direccion)))
  WHERE ((dr.estatus)::text = 'En proceso'::text);
 &   DROP VIEW public.status_departamento;
       public          postgres    false    219    217    219    219    219    219    219    219    217            �           2604    16408    contacto id_contacto    DEFAULT     |   ALTER TABLE ONLY public.contacto ALTER COLUMN id_contacto SET DEFAULT nextval('public.contacto_id_contacto_seq'::regclass);
 C   ALTER TABLE public.contacto ALTER COLUMN id_contacto DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16409    derrumbe id_derrumbe    DEFAULT     |   ALTER TABLE ONLY public.derrumbe ALTER COLUMN id_derrumbe SET DEFAULT nextval('public.derrumbe_id_derrumbe_seq'::regclass);
 C   ALTER TABLE public.derrumbe ALTER COLUMN id_derrumbe DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16410    direccion id_direccion    DEFAULT     �   ALTER TABLE ONLY public.direccion ALTER COLUMN id_direccion SET DEFAULT nextval('public.direccion_id_direccion_seq'::regclass);
 E   ALTER TABLE public.direccion ALTER COLUMN id_direccion DROP DEFAULT;
       public          postgres    false    220    219            u          0    16396    contacto 
   TABLE DATA           A   COPY public.contacto (id_contacto, nombre, telefono) FROM stdin;
    public          postgres    false    215   Y3       w          0    16400    derrumbe 
   TABLE DATA           {   COPY public.derrumbe (id_derrumbe, descripcion, necesidades, tipo_de_dano, estatus, id_contacto, id_direccion) FROM stdin;
    public          postgres    false    217   �3       y          0    16404 	   direccion 
   TABLE DATA           z   COPY public.direccion (id_direccion, calle, numero_exterior, colonia, entidad, tipo_de_residencia, ubicacion) FROM stdin;
    public          postgres    false    219   z4       �           0    0    contacto_id_contacto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.contacto_id_contacto_seq', 5, true);
          public          postgres    false    216            �           0    0    derrumbe_id_derrumbe_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.derrumbe_id_derrumbe_seq', 5, true);
          public          postgres    false    218            �           0    0    direccion_id_direccion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.direccion_id_direccion_seq', 5, true);
          public          postgres    false    220            �           2606    16412    contacto contacto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id_contacto);
 @   ALTER TABLE ONLY public.contacto DROP CONSTRAINT contacto_pkey;
       public            postgres    false    215            �           2606    16414    derrumbe derrumbe_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_pkey PRIMARY KEY (id_derrumbe);
 @   ALTER TABLE ONLY public.derrumbe DROP CONSTRAINT derrumbe_pkey;
       public            postgres    false    217            �           2606    16416    direccion direccion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion);
 B   ALTER TABLE ONLY public.direccion DROP CONSTRAINT direccion_pkey;
       public            postgres    false    219            �           2620    16483 $   derrumbe validar_referencias_trigger    TRIGGER     �   CREATE TRIGGER validar_referencias_trigger BEFORE INSERT OR UPDATE ON public.derrumbe FOR EACH ROW EXECUTE FUNCTION public.validar_referencias();
 =   DROP TRIGGER validar_referencias_trigger ON public.derrumbe;
       public          postgres    false    217    228            �           2620    16453    derrumbe validar_status    TRIGGER     �   CREATE TRIGGER validar_status BEFORE INSERT OR UPDATE ON public.derrumbe FOR EACH ROW EXECUTE FUNCTION public.validar_status();
 0   DROP TRIGGER validar_status ON public.derrumbe;
       public          postgres    false    217    227            �           2606    16417 "   derrumbe derrumbe_id_contacto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_id_contacto_fkey FOREIGN KEY (id_contacto) REFERENCES public.contacto(id_contacto);
 L   ALTER TABLE ONLY public.derrumbe DROP CONSTRAINT derrumbe_id_contacto_fkey;
       public          postgres    false    3287    217    215            �           2606    16422 #   derrumbe derrumbe_id_direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.derrumbe
    ADD CONSTRAINT derrumbe_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 M   ALTER TABLE ONLY public.derrumbe DROP CONSTRAINT derrumbe_id_direccion_fkey;
       public          postgres    false    217    219    3291           