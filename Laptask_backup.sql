PGDMP                      |         
   LaptopTask    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397 
   LaptopTask    DATABASE        CREATE DATABASE "LaptopTask" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "LaptopTask";
                postgres    false            �            1259    16420    company    TABLE     �   CREATE TABLE public.company (
    com_id integer NOT NULL,
    lapi_manufacture_country character varying(50),
    brand character varying(50),
    lapi_model character varying(50),
    ls_id integer
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    16419    company_com_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_com_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.company_com_id_seq;
       public          postgres    false    218            �           0    0    company_com_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.company_com_id_seq OWNED BY public.company.com_id;
          public          postgres    false    217            �            1259    16439    customer    TABLE     �   CREATE TABLE public.customer (
    cus_id integer NOT NULL,
    customer_name character varying(50),
    gender character(1),
    city character varying(50),
    state character varying(50),
    pincode character varying(50),
    ls_id integer
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16438    customer_cus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_cus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.customer_cus_id_seq;
       public          postgres    false    220            �           0    0    customer_cus_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.customer_cus_id_seq OWNED BY public.customer.cus_id;
          public          postgres    false    219            �            1259    16399 	   lapi_spec    TABLE     .  CREATE TABLE public.lapi_spec (
    ls_id integer NOT NULL,
    lapi_model character varying(50),
    lapi_types character varying(50),
    model_year integer,
    battery_capacity_kwh integer,
    ssd_gb integer,
    hhd_gb integer,
    ram_gb integer,
    weight_kg integer,
    "price_$" integer
);
    DROP TABLE public.lapi_spec;
       public         heap    postgres    false            �            1259    16398    lapi_spec_ls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lapi_spec_ls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.lapi_spec_ls_id_seq;
       public          postgres    false    216            �           0    0    lapi_spec_ls_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.lapi_spec_ls_id_seq OWNED BY public.lapi_spec.ls_id;
          public          postgres    false    215            �            1259    16451    num_spec    TABLE     ]   CREATE TABLE public.num_spec (
    ssd_gb integer,
    hhd_gb integer,
    ram_gb integer
);
    DROP TABLE public.num_spec;
       public         heap    postgres    false            )           2604    16423    company com_id    DEFAULT     p   ALTER TABLE ONLY public.company ALTER COLUMN com_id SET DEFAULT nextval('public.company_com_id_seq'::regclass);
 =   ALTER TABLE public.company ALTER COLUMN com_id DROP DEFAULT;
       public          postgres    false    218    217    218            *           2604    16442    customer cus_id    DEFAULT     r   ALTER TABLE ONLY public.customer ALTER COLUMN cus_id SET DEFAULT nextval('public.customer_cus_id_seq'::regclass);
 >   ALTER TABLE public.customer ALTER COLUMN cus_id DROP DEFAULT;
       public          postgres    false    219    220    220            (           2604    16402    lapi_spec ls_id    DEFAULT     r   ALTER TABLE ONLY public.lapi_spec ALTER COLUMN ls_id SET DEFAULT nextval('public.lapi_spec_ls_id_seq'::regclass);
 >   ALTER TABLE public.lapi_spec ALTER COLUMN ls_id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16420    company 
   TABLE DATA           ]   COPY public.company (com_id, lapi_manufacture_country, brand, lapi_model, ls_id) FROM stdin;
    public          postgres    false    218   p        �          0    16439    customer 
   TABLE DATA           ^   COPY public.customer (cus_id, customer_name, gender, city, state, pincode, ls_id) FROM stdin;
    public          postgres    false    220   �(       �          0    16399 	   lapi_spec 
   TABLE DATA           �   COPY public.lapi_spec (ls_id, lapi_model, lapi_types, model_year, battery_capacity_kwh, ssd_gb, hhd_gb, ram_gb, weight_kg, "price_$") FROM stdin;
    public          postgres    false    216   m5       �          0    16451    num_spec 
   TABLE DATA           :   COPY public.num_spec (ssd_gb, hhd_gb, ram_gb) FROM stdin;
    public          postgres    false    221   �?       �           0    0    company_com_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.company_com_id_seq', 201, true);
          public          postgres    false    217            �           0    0    customer_cus_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.customer_cus_id_seq', 196, true);
          public          postgres    false    219            �           0    0    lapi_spec_ls_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.lapi_spec_ls_id_seq', 201, true);
          public          postgres    false    215            .           2606    16425    company company_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (com_id);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    218            0           2606    16444    customer customer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cus_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    220            ,           2606    16404    lapi_spec lapi_spec_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.lapi_spec
    ADD CONSTRAINT lapi_spec_pkey PRIMARY KEY (ls_id);
 B   ALTER TABLE ONLY public.lapi_spec DROP CONSTRAINT lapi_spec_pkey;
       public            postgres    false    216            1           2606    16426    company company_ls_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_ls_id_fkey FOREIGN KEY (ls_id) REFERENCES public.lapi_spec(ls_id);
 D   ALTER TABLE ONLY public.company DROP CONSTRAINT company_ls_id_fkey;
       public          postgres    false    4652    218    216            2           2606    16445    customer customer_ls_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_ls_id_fkey FOREIGN KEY (ls_id) REFERENCES public.lapi_spec(ls_id);
 F   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_ls_id_fkey;
       public          postgres    false    220    4652    216            �   9  x��Y�R�J}�����V_�H.8�!	uLR�Լ(����2&����vۀ�[R�@�ԛ�ݫ׾�6�/�#��?���ծ�n�����m�Z������i7*ɤ����U�{�����[�eȪ7W��V'ͺ���?���}Z_(KN����z��n�n�Co�2�r�{�,o����Q����o�K(�zr��T�*����ZU�š}^������pA�i�������~n���˻�����'�Ͷ�Q���ӄ��&=�GsQo��~� X�Y���W�?ݦ�ղ���[_>~�E���tB��M�U��)�S�^��bK���{W�n��0�6	�o	v�}P߭�ݸbO<�����x`�8�Q�p��r�\Q�A��զ�n~�eA%��|݀f����G��Y��A���r���#��P����W��2�ĳ/ǪtT�!�;�b��|ծ_a�@�8r�8PF*���W��d��G���(S��L�{�e��ǯ���0�q�e���N<2�Lɯ����c0G����^��ZO&����2����;O"�jd���`�-��lA��w�l�i^�d�lI���S�յS����L�������-������GH&�_+�Ɇ�ذ�l'���;�Ɏ'Q�\�X�"W��lS�jV���+����K���Ч�}�J<wL���d�JrF����Z�n����ч��r�я���K��r�ԫ�r(=�E�=Y�G/6��r����4��7$J�Ʌ?�ݽ v�\�&_��M��U�3�I�i@'_��/N	9�<�+�Uė�g�i��!o�%s�ݴ��[�n4y�v?� d�=�p�m���@>v��#�j�p>u�]��|�p{�<(_Q(��U@	�~^}�����J`
C8A���t>E�C!�"��~[�^�cY�RpY�N�KԥX�B&�>�g�v+�<F5�V�ۻ��
qP� ��0�������ʡ�
�|��5d�L��ՀT�"S�H�S$�XR�����[
*���v׽IA��b����Swఊ��0�&�9=��|��0�Q��Z)��d)�D��}T�
�XQ��=ڲ����iG��ԗ����AUL�xB���TͶ��*C���,Uy*?��8�2<�$�=U��}>�*PsiH܁&Rx�҈�C�
u?��VB���E;X���LZ�Z��0x���_0�����!�>���D���Ƈ|~j��qN�yP2�M(¢�B(2��(H�b���Z� }���Ȓ$��gp_b��l��8h	�3��0����0[�1�s�W���z�CT��1��}_�,�;�3>y+{�)p�d�T�X9�R�� p/���7�0�Y��R��u��z$Ж"����\0��D��A�S}����t�2�����b[��.GH.���ɏW�o�-����97H�0#6�\O�N�y!����yBZ0b��j�_�eD��h���t%�
���NdA ��croW�I�=6�v�I9$���4|O9�܁��,
P,B	�@ޫ�A8jv���{58�:HÄQXp��91��rJ4��̀;T�dr8��f���n}q��l~�k�	�C�^��rd#��m�^Oj�d�8 ;z	���b�����* Rq�6���1�D����ϴ9HLЍ���4:zנٍs_��.K�w]N�ܦ��LV�����
dI��rJ'u=b ��<��9jhJvY�KE��d?$�"�� 9����/*�}����'�9�~��g�;$%��P�H�K��ėÊ��[�>�_t@�ԡ5�OQ_����!�� -,��d��~�B�@rr�@J��t'�i�A*��2t$"�Sޫӗ�o1bG�����ɑ�A�Q���LY����9̔i�A9�yq�zcS�+ӹ�
��{�:������%B�r,G*�]�=a�������W%�b����b�؋�?�@ʕ��uP�L'���ۖ~x��j�2�*����Ėc�Y�u�8 � ^��|��B, ,!b�2��֌Rՠ_�/�1��,�/���W�?݊�E2�U����X"ʕ��w�1�Uɷ-�DO"P�A%߽����c������5vh�1N���@��      �   �  x��Y�r�:|��?�[/ �(�[�������	+���b���ml{ �N"%f�r��x L�t��T��褶l�f�%��n6l�'q&x�>��F����]�m4�V��-;�0�����[��-#r�����¬jvy�d,a��n]����������o;���y�x�\Y:���
�L�������M�0��Q�%��Ƭ�;��+�ҖOkg��	-`)y���G�t����M�7�\W��Uӂ+vS�gg�nGv'��	�҄*���m����ى)K�z?9��\�x��Љ�n��S�Z�&'7"�B�G+��ݛ]Y7ý�S-\�gf�Xp��yMO����\e����s!v� ���`�n'��6�Of�����ήY��EE�E�.[�h��~]o�3vY-���S]�}�3�Io�q��Y��_ئ2���0��~�ط��e�7̹���.�߼KrQ KLS�]g���ɿ�@\(��
�nm�O>��Bq��dkut������<�ّ��m����Zw𸗌I��.L�d�h��%}����	j$a�϶�U�yc���1Ix��c4Y�&��'�<��b6�9��IƓ����?�u�͔>2?gd��D�Syf����I���� ��w���.�Ҕ�( �t�1��_o?�b�Y�x��u��уi��N�D�4f�Y�h��II��Hg8|��"�4�`ǥ�:D��|�_�/&:vݎ]NX�$Y�R�ӄ= O�f�r���W�{�m����}b�9-x��[g��~���Y&,U<��g�:�{�����f)K��Z�%�5�7e�ȋ�g�He�2<$�٧���Yb��e���J��g6�&�p�4�b�W1���5��*���T#˟l��riW�!��q��#�@�.Aur�=��)�r�	6s�Mt�7;�v��#pN�QF�L�,^x��<K�Q��P�7A@���◐7ų���}����X�y�D}�������d��g	��+[L)�0�,<+�	1ct۸jA��_���]8������3��Jy�����l�S$�j�硼'���8�1eH����,rb�&M��F�}��;�JSu����>�y�s��\t5�
�SO��D�(h��y]K�B��dy��]ۿ��[{a�7+X�x��I��O���>��Vk��^XQ�
(A;�;_�d'c�Kķ���r>�{f	������G_��o��3ӡ"_CG'M�+��t�f�7`�ӵY�/�u����)������yf^�4�[.��4�U�>���ħ�.���]�H}��I�*������LJ.� �#:l^��C	� \���d�7=*�����<#�C��I�ˌr쑂u�<����9������6:i 4{�*Ys)_SpZ7+�߿�~/4�\BB��V��^Ѐ5�Wn�ǄKB�v�~d-H�)#"(6?AR^)����P��T��&�v�>�*��c߬�P��*2^�ԋ"����>Т�-�o��=B��B����Z�LR�H{ˮ'x�7E�H�/��N�Eo	���g��7-x��z�4��q��/��ne\�����`Vh^D����z�޻p��B�v�j���X{�^p	�H	^�֒6�v��Nan�et��[�޶`*�bW�F��+Q�qi����-^mS)/4��t՛h��Tq�j�2�b*e[���A�@U�\	H�ڃfx��*����jq޻���
~���*e
�~��Q-J��܃��*C����vd�utnڍm�~�3�4W��uH��Ɩ(�ݡ@7�c�$��	'����W5	�Y�
`���0K�RĂ�Sí�B�sP�S�S���PG Gߠ�%1���	�1�qC� *7K7�u�vE����k�Ϲӑi����L\���4Ʊ��\ؑ!�\�k� �\�>�uW��z\[H�ݗ�'0`��������z3�2'q��;1&�xD&bLb�o:4Ӡ<�G4/�8�[U�Ou4&��~�V�t��dդt����?Mu��c�԰=+���#c��U`�<7�½�NЀ�
����NЀ� ��a��y�4c�����SY��u�Ok��1���������O`@�-Y������E
�4.�τv�ݚ�qx7����v ;
L��O��2(5pN�m�fȷ,L̸4ȭZ��y�Y��1�Ŗ�3����\��Ľ1R`t��q��m��	 ���V!�V� \7��u���/�V�(�7�Hb1l����LX@���[�s�N�[ho	fjC�h�� U�]�z�����̀U�3���m�0��~?�|�=@)�P���ah�>=�{j���6X�ޒ�Mujj�����}�-P�Աd7w ���$4�к�
�tOt�ͦ4�:��o��V��)�I���:�ݰ�s!�>�z�L����OH�"�K�w>�k�ˮ����R���ќz��G�����DS��&'Z\�e����o,���Y0Li
�����)�����o6����Vi�<]��1��_PxN��`��۪��n�ô���
�9��ȀX
��K����E� �IH�3 ��o[��x�����T-���D)2Z~��7A@��$���򶀌v�Bl/��ړ�Զ&�*lV6�<�JD��}v��Ut�w�y4��\�x�;~�Ն�=�Z��',�=e�+K�j):]�P���E��Vk����`e��N�"4iS4�ί�B�e@��a���Qg��l|Z�hg ){�B?�]G�3u����0qg~�	�29�&��o
�K�?D<>Y�{�ʁJ�>R��v�z�z崮�G�WHr1N�r@�'c�+(�H�P�r��g#�+2y��zI@�˱�%�M^�U/	�r5Z�$���x��@M�#�KҒ]|�^X�d�zI`%��%���>V/	��T�^���c�*��,ƨW���^��z�z���G�Wt
1N�
���R� �(�* �F�W���c�R ��#�K���^
�j�z)�V�q� ��?P/���^
p�d�z)�j�~�^
`�=�o�K%P�G���#�K$U|�^�(5|�y-�IS$�ԓ�4J�Sdg�F���\͙�����ٗ�%���4��a�Bc��@F��ݱ�_�<�P�`�� E'`�>�>q��f�Wg����������'}S�F����)��{����WWfm�6��O1Ttή�iM��݃�L�N�ψ�D��t�:���ƚ�������1t��      �   \
  x��Z�Rܺ}6_��)K�d�q`�*T��pv��2�)�������x��lg��(�Է�k����kv]�6��$�ˮ}ID*d��Dq��	׉H�4=�i�^�/��K�yO�D��P:�i�&E"������e]����c��b��sl2x�{`�%��}m��S��u]=xW�=��W�b�߲��9!���u՝���7��˝h��꥾�u����Y������w�rx���&6���k=8�3�.������U�ݼ�ݮ�[����w#	<��Z��/O��~�,��f�ȼ+*�4�[Γ��k���[����}}0K<�S�,�����]۱�5�K�䂜l��2YU��=<�����;�l���g3I�Y��?�q]=ԳΊ�Y�|�W��2��1%�$)�+@8M;���uc����m���[�����6�����}�5�t��5P�m�_�]�3�"�ՙ�-ZGʇ��Ug�*��C]E���Ia+H���k�k��G<	z����ML
7A�z�7�����H&Ҥ\�`�X7��w�E'�,Ҭ,�l�K>�}��:���[��L0��52�=~�|?�{iZ�2>��Ԕ�}�d���;��D���a��DZ΍��^1��E-<� �SN!���eFP�_rw��7	��)G�,����v�m72'�KZ$�0~X(,�q��o��K&^���ym�b�P�-rcç���gg'4��C���#H�l��
���FR�&����_��ۢ�SFC?�s7���洏yAO�q�jS�Է28��c�m���^��`[#��>��x��0���L�0m���f`����,�D���%<�����u޵�k	�Z�62M`�-������w���Ae�	�y	���`ZË�66�q�o�Op��y=&��6a#a�u��Ū�� !���z��fކiC�x�l�Gp�y��w���@��c��R�uR@B��;���rq�9o��+��jWW�ݓ�1���Œ-��:צu����)Yw.b����(ϩ?i�O�5�>4�Jo��
P�5�0#�����j�B��`b����QL���PX5��D�0NO�+�x"�7�"��x��H�W��y��%����
g��.^�����Jc:W�tn�o&��˕���.aà��E$��P|�0������~�Z��M��w�7���?�c�t�l��	�ﾉt���o"��<�BP���m�l����>�s�r���T��^ԏ��U�׏R-�Do�t��Xu���g�<�v��������8���J�br{q�ΨY���ϢK�r		���ڎĂS�b)*i�#�Be.����Y�H�X=�X�n �A�Dfa#�$G_���B9�	v�tx��$�v3�
�����e�"%<@��0���[G�F+���C�#k,�D�y�&�e��I�,A�Gf�l�̹�Øc�]��n~��i9z��.b�q�tdvz�#
�&@��ĀP���r�a����Q��8���n�7�9��U����T疅7��
��rK�Ao\w��1���4�O���A�e�S�%������P�pp�7P�֫Y��袌Iܹ�i�
)%��Q~w�s�T��c���L� �Q�~��T���
�y`lĻ���a: I��ڵ�=�W�����2���.�x꫒�	 ��04�!z(H ݀8�aE4����7Xɂ>�t�ŞI9�хlCtd��Cɳ�,�t1GK!��S��A��Ћs�Q�|��%=�1\A��?����	)܉��W�tfb |YHG�H�Ll4��q~$��qA�O�=�r�q���W.����:Ôe��ZU�>j�����B"�g"B�d	D�7"�f.C��;r�nC�J*�B����`��HPe�p�(.�&c�4y�9�uWX�/kO�h %%0�]�\�	�1x2�� CUH�.C-���0�9���Rȩ��qR�d��I��8�#��>���Rj.K��,�(�#8�a�L:;U��6�(0�ң���jȳR��r`�d��>�3���d0.Bzn�y��D�m�����ڰ�2��|��"2 c
�����q���Ya�3�l_4r�H�f��S
r4'�le��˟%��>�4�שS�E
!H�4�dR�NQJ<D'��cJ���%��z	Ax��'�����9��R�Y�
͓Lh�)���4��h
�4MhÙA5��f|݄o���=-���NK/: 儏�Y���ڈP9��M�'4��&,d"��0��'��
����TX1%��R�ɔ�~B�����	����턄B�2�P�T���2�y��|FF�I-���BC1��r����[?��(Q=p4S��z�"=h�)�?��yHz@�ΰ�,�K�`�@��#�GN�c	a��( h�{Ј{�G��A3��|����yOdP���?/�33b�\
�=j�����=r���+r��d�Ƅ��I�R�'��K�{B�+�/Ӏ�Ħ;�>h�#�G�P4�5��AC�}eE6���@��lr�N\C>Q������bm5��ȖS[�CS�9�+ �O.Шp��bb ����݂2�����M��|��͂��,����999�]0WN      �   �   x��T[!���t�ꎇ��������ݯRLB��#����sύ PL8��,�_�j0��U1�!�3�XY�Tj�9��D�:��I��Q' tsf����5gea:_�k;��f�3�׈�1vu|'1	����O־�,|d�,&or(⻞t����q�U&u�#[�Q6�<�{�0����<�h÷��h1?x&�|:k�޶c{}U��)�������}�J}�zv��.w}s��}=��o��     