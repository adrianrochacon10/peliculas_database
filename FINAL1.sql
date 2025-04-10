PGDMP  $    &                }            Streaming_8A    17.2    17.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    17632    Streaming_8A    DATABASE     �   CREATE DATABASE "Streaming_8A" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "Streaming_8A";
                     postgres    false            �            1255    17956    actualizar_actualizado_en()    FUNCTION     �   CREATE FUNCTION public.actualizar_actualizado_en() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.actualizado_en = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.actualizar_actualizado_en();
       public               postgres    false            �            1255    17960    actualizar_ultima_sesion()    FUNCTION     �   CREATE FUNCTION public.actualizar_ultima_sesion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.ultima_sesion := CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.actualizar_ultima_sesion();
       public               postgres    false            �            1255    17947    log_cambios_resena()    FUNCTION     �   CREATE FUNCTION public.log_cambios_resena() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO log_resenas(resena_id, usuario_id, accion)
    VALUES (NEW.id, NEW.usuario_id, TG_OP);
    RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.log_cambios_resena();
       public               postgres    false            �            1259    17643    historial_visualizacion    TABLE     �  CREATE TABLE public.historial_visualizacion (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid,
    pelicula_id character varying(24) NOT NULL,
    progreso integer,
    fecha_visto timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ck_progreso CHECK (((progreso >= 0) AND (progreso <= 100))),
    CONSTRAINT historial_visualizacion_progreso_check CHECK (((progreso >= 0) AND (progreso <= 100)))
);
 +   DROP TABLE public.historial_visualizacion;
       public         heap r       postgres    false            �            1259    17940    log_resenas    TABLE     �   CREATE TABLE public.log_resenas (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    resena_id uuid,
    usuario_id uuid,
    accion character varying(10),
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.log_resenas;
       public         heap r       postgres    false            �            1259    17925    resenas    TABLE     �  CREATE TABLE public.resenas (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario_id uuid NOT NULL,
    pelicula_id character varying(24) NOT NULL,
    calificacion integer,
    comentario text,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ck_calificacion CHECK (((calificacion >= 1) AND (calificacion <= 10))),
    CONSTRAINT resenas_calificacion_check CHECK (((calificacion >= 1) AND (calificacion <= 10)))
);
    DROP TABLE public.resenas;
       public         heap r       postgres    false            �            1259    17633    usuarios    TABLE     
  CREATE TABLE public.usuarios (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(50) NOT NULL,
    ap_paterno character varying(30) NOT NULL,
    ap_materno character varying(30) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    rol boolean NOT NULL,
    ultima_sesion timestamp without time zone,
    creado_en timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    actualizado_en timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false                      0    17643    historial_visualizacion 
   TABLE DATA           e   COPY public.historial_visualizacion (id, usuario_id, pelicula_id, progreso, fecha_visto) FROM stdin;
    public               postgres    false    218   �&                 0    17940    log_resenas 
   TABLE DATA           O   COPY public.log_resenas (id, resena_id, usuario_id, accion, fecha) FROM stdin;
    public               postgres    false    220   H'                 0    17925    resenas 
   TABLE DATA           _   COPY public.resenas (id, usuario_id, pelicula_id, calificacion, comentario, fecha) FROM stdin;
    public               postgres    false    219   1(                 0    17633    usuarios 
   TABLE DATA           �   COPY public.usuarios (id, nombre, ap_paterno, ap_materno, email, password, rol, ultima_sesion, creado_en, actualizado_en) FROM stdin;
    public               postgres    false    217   ^)       w           2606    17650 4   historial_visualizacion historial_visualizacion_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.historial_visualizacion
    ADD CONSTRAINT historial_visualizacion_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.historial_visualizacion DROP CONSTRAINT historial_visualizacion_pkey;
       public                 postgres    false    218            ~           2606    17946    log_resenas log_resenas_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.log_resenas
    ADD CONSTRAINT log_resenas_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.log_resenas DROP CONSTRAINT log_resenas_pkey;
       public                 postgres    false    220            |           2606    17934    resenas resenas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.resenas DROP CONSTRAINT resenas_pkey;
       public                 postgres    false    219            s           2606    17642    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public                 postgres    false    217            u           2606    17640    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    217            x           1259    17958    idx_historial_usuario    INDEX     _   CREATE INDEX idx_historial_usuario ON public.historial_visualizacion USING btree (usuario_id);
 )   DROP INDEX public.idx_historial_usuario;
       public                 postgres    false    218            y           1259    17959    idx_resenas_pelicula    INDEX     O   CREATE INDEX idx_resenas_pelicula ON public.resenas USING btree (pelicula_id);
 (   DROP INDEX public.idx_resenas_pelicula;
       public                 postgres    false    219            z           1259    17949    idx_unica_resena    INDEX     ^   CREATE UNIQUE INDEX idx_unica_resena ON public.resenas USING btree (usuario_id, pelicula_id);
 $   DROP INDEX public.idx_unica_resena;
       public                 postgres    false    219    219            �           2620    17957    usuarios tr_actualizado_en    TRIGGER     �   CREATE TRIGGER tr_actualizado_en BEFORE UPDATE ON public.usuarios FOR EACH ROW EXECUTE FUNCTION public.actualizar_actualizado_en();
 3   DROP TRIGGER tr_actualizado_en ON public.usuarios;
       public               postgres    false    222    217            �           2620    17948    resenas tr_log_resena    TRIGGER     �   CREATE TRIGGER tr_log_resena AFTER INSERT OR DELETE OR UPDATE ON public.resenas FOR EACH ROW EXECUTE FUNCTION public.log_cambios_resena();
 .   DROP TRIGGER tr_log_resena ON public.resenas;
       public               postgres    false    221    219            �           2620    17961    usuarios tr_ultima_sesion    TRIGGER     �   CREATE TRIGGER tr_ultima_sesion BEFORE UPDATE ON public.usuarios FOR EACH ROW EXECUTE FUNCTION public.actualizar_ultima_sesion();
 2   DROP TRIGGER tr_ultima_sesion ON public.usuarios;
       public               postgres    false    223    217                       2606    17651 ?   historial_visualizacion historial_visualizacion_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial_visualizacion
    ADD CONSTRAINT historial_visualizacion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.historial_visualizacion DROP CONSTRAINT historial_visualizacion_usuario_id_fkey;
       public               postgres    false    217    218    4725            �           2606    17935    resenas resenas_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.resenas DROP CONSTRAINT resenas_usuario_id_fkey;
       public               postgres    false    4725    217    219               �   x�}α�0E�Z�"�a�,i����v�����ղiH� >
�~ �ZUt��F'��K�=�*���t��c�Z6����C���E�)F�c[ڹ&�P��X��b�mJ����w ��6ׁ��H!�Lt��GNߕZ?��\~���~n����VQ         �   x���;nD1Ek�Ud��c�O�&E�26����i�{Ŝ�
!$�.��D6�jX@'Y ���d��ȇs��P����u��(� .�I���~��)��p�z�~G���Hv9�%JHBR*����4i��,��g�
�P�:x��D�ŨX�\ē��w��d�Ά����rY=K!k�lwGm�2��6��j�uX�ڰ���'/�ގ��[c4           x�}�;n�0Dk�{���_\���i��*! K�>Ar(��؝�W��z�rjs�Z��tִ]m:39n�$�y'n��Rl��p�i��J����7s���0q>孧��i�����\��;���OY6�yF/��V��e���.��m�^z�I:�D�!Ei#Z
���J�+�N�xdE���R�Uv�y�?G��A��4�!����D;DT>�T�f�;���7}j�����7���}�nc�G����*K�J�6\������~D��t�g���n��K��         �   x����j�0���<�/��&vV�6v1�kA~�;Ҥ�-}/��j��3Vc��>����	�!���:@x�ߥjO��L�
t92m�����(�b�-`��Ve���Ӻl���1��h%3.f|�b9y�ߎ��@���i[���[�+g��d�|����j�s�?�G���k�f���������]��bM�w:L!�J�n|�)��>a���d:�����-�f��#�՛6     