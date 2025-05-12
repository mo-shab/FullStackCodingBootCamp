-- Database: public

-- DROP DATABASE IF EXISTS public;

-- CREATE DATABASE public
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'French_France.1252'
--     LC_CTYPE = 'French_France.1252'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

CREATE TABLE items (
	item_id SERIAL PRIMARY KEY,
	item_name VARCHAR (50) NOT NULL,
	item_price NUMERIC NOT NULL
);

CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	customer_firstname VARCHAR (100) NOT NULL,
	customer_lastname VARCHAR (100) NOT NULL
);