PGDMP                          y            test_db    13.2 (Debian 13.2-1.pgdg100+1)    13.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16384    test_db    DATABASE     [   CREATE DATABASE test_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE test_db;
                root    false                        2615    16385    Customer    SCHEMA        CREATE SCHEMA "Customer";
    DROP SCHEMA "Customer";
                root    false            ?            1259    16412    Address    TABLE     ]  CREATE TABLE "Customer"."Address" (
    "AddressLine1" character varying(250)[] NOT NULL,
    "AddressLine2" character varying(250)[],
    "AddressId" integer NOT NULL,
    "Country" character varying(50)[] NOT NULL,
    "State" character(2)[] NOT NULL,
    "ZipCode" character varying(10)[] NOT NULL,
    "City" character varying(75)[] NOT NULL
);
 !   DROP TABLE "Customer"."Address";
       Customer         heap    root    false    6            ?            1259    16410    Address_AddressId_seq    SEQUENCE     ?   CREATE SEQUENCE "Customer"."Address_AddressId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "Customer"."Address_AddressId_seq";
       Customer          root    false    204    6            ?           0    0    Address_AddressId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "Customer"."Address_AddressId_seq" OWNED BY "Customer"."Address"."AddressId";
          Customer          root    false    203            ?            1259    16388    Customer    TABLE     ?   CREATE TABLE "Customer"."Customer" (
    "FIrstName" character varying(150)[] NOT NULL,
    "CustomerId" integer NOT NULL,
    "LastName" character varying(150)[]
);
 "   DROP TABLE "Customer"."Customer";
       Customer         heap    root    false    6            ?            1259    16423    CustomerAddress    TABLE     ?   CREATE TABLE "Customer"."CustomerAddress" (
    "CustomerId" integer NOT NULL,
    "CustomerAddressId" integer NOT NULL
)
INHERITS ("Customer"."Address");
 )   DROP TABLE "Customer"."CustomerAddress";
       Customer         heap    root    false    6    204            ?            1259    16421 %   CustomerAddress_CustomerAddressId_seq    SEQUENCE     ?   CREATE SEQUENCE "Customer"."CustomerAddress_CustomerAddressId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE "Customer"."CustomerAddress_CustomerAddressId_seq";
       Customer          root    false    6    206            ?           0    0 %   CustomerAddress_CustomerAddressId_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE "Customer"."CustomerAddress_CustomerAddressId_seq" OWNED BY "Customer"."CustomerAddress"."CustomerAddressId";
          Customer          root    false    205            ?            1259    16386    Customer_CustomerId_seq    SEQUENCE     ?   CREATE SEQUENCE "Customer"."Customer_CustomerId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "Customer"."Customer_CustomerId_seq";
       Customer          root    false    202    6            ?           0    0    Customer_CustomerId_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "Customer"."Customer_CustomerId_seq" OWNED BY "Customer"."Customer"."CustomerId";
          Customer          root    false    201                       2604    16415    Address AddressId    DEFAULT     ?   ALTER TABLE ONLY "Customer"."Address" ALTER COLUMN "AddressId" SET DEFAULT nextval('"Customer"."Address_AddressId_seq"'::regclass);
 H   ALTER TABLE "Customer"."Address" ALTER COLUMN "AddressId" DROP DEFAULT;
       Customer          root    false    204    203    204                       2604    16391    Customer CustomerId    DEFAULT     ?   ALTER TABLE ONLY "Customer"."Customer" ALTER COLUMN "CustomerId" SET DEFAULT nextval('"Customer"."Customer_CustomerId_seq"'::regclass);
 J   ALTER TABLE "Customer"."Customer" ALTER COLUMN "CustomerId" DROP DEFAULT;
       Customer          root    false    201    202    202                       2604    16426    CustomerAddress AddressId    DEFAULT     ?   ALTER TABLE ONLY "Customer"."CustomerAddress" ALTER COLUMN "AddressId" SET DEFAULT nextval('"Customer"."Address_AddressId_seq"'::regclass);
 P   ALTER TABLE "Customer"."CustomerAddress" ALTER COLUMN "AddressId" DROP DEFAULT;
       Customer          root    false    206    203                       2604    16427 !   CustomerAddress CustomerAddressId    DEFAULT     ?   ALTER TABLE ONLY "Customer"."CustomerAddress" ALTER COLUMN "CustomerAddressId" SET DEFAULT nextval('"Customer"."CustomerAddress_CustomerAddressId_seq"'::regclass);
 X   ALTER TABLE "Customer"."CustomerAddress" ALTER COLUMN "CustomerAddressId" DROP DEFAULT;
       Customer          root    false    205    206    206            ?          0    16412    Address 
   TABLE DATA           {   COPY "Customer"."Address" ("AddressLine1", "AddressLine2", "AddressId", "Country", "State", "ZipCode", "City") FROM stdin;
    Customer          root    false    204   ?!       ?          0    16388    Customer 
   TABLE DATA           O   COPY "Customer"."Customer" ("FIrstName", "CustomerId", "LastName") FROM stdin;
    Customer          root    false    202   "       ?          0    16423    CustomerAddress 
   TABLE DATA           ?   COPY "Customer"."CustomerAddress" ("AddressLine1", "AddressLine2", "AddressId", "Country", "State", "ZipCode", "City", "CustomerId", "CustomerAddressId") FROM stdin;
    Customer          root    false    206   >"       ?           0    0    Address_AddressId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"Customer"."Address_AddressId_seq"', 2, true);
          Customer          root    false    203            ?           0    0 %   CustomerAddress_CustomerAddressId_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('"Customer"."CustomerAddress_CustomerAddressId_seq"', 1, true);
          Customer          root    false    205            ?           0    0    Customer_CustomerId_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"Customer"."Customer_CustomerId_seq"', 1, true);
          Customer          root    false    201            
           2606    16420    Address Address_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "Customer"."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY ("AddressId");
 F   ALTER TABLE ONLY "Customer"."Address" DROP CONSTRAINT "Address_pkey";
       Customer            root    false    204                       2606    16432 $   CustomerAddress CustomerAddress_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY "Customer"."CustomerAddress"
    ADD CONSTRAINT "CustomerAddress_pkey" PRIMARY KEY ("CustomerAddressId");
 V   ALTER TABLE ONLY "Customer"."CustomerAddress" DROP CONSTRAINT "CustomerAddress_pkey";
       Customer            root    false    206                       2606    16396    Customer Customer_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "Customer"."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY ("CustomerId");
 H   ALTER TABLE ONLY "Customer"."Customer" DROP CONSTRAINT "Customer_pkey";
       Customer            root    false    202                       2606    16433 +   CustomerAddress FK_CUSTOMERADDRESS_CUSTOMER    FK CONSTRAINT     ?   ALTER TABLE ONLY "Customer"."CustomerAddress"
    ADD CONSTRAINT "FK_CUSTOMERADDRESS_CUSTOMER" FOREIGN KEY ("CustomerId") REFERENCES "Customer"."Customer"("CustomerId");
 ]   ALTER TABLE ONLY "Customer"."CustomerAddress" DROP CONSTRAINT "FK_CUSTOMERADDRESS_CUSTOMER";
       Customer          root    false    202    2824    206            ?   ;   x??V???KU0T?????4??v???? ?f???@Z?-??D!Hd(?r??qqq ??o      ?       x???J,?ϫ?4???MLIIͫ?????? f?*      ?   >   x??V???KU0T?????4??v???? ?f???@Z?-??D!Hd ?rr??qqq ???     