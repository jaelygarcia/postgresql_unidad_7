-- PASO 1 --

CREATE DATABASE top100
  WITH
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Spanish_Chile.1252'
  LC_CTYPE = 'Spanish_Chile.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

-- PASO 2 --

CREATE TABLE peliculas(  
    id INT NOT NULL UNIQUE PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    pelicula VARCHAR(255),
    periodo_estreno INT,
    director VARCHAR(45)
);

CREATE TABLE reparto(  
    pelicula_id INT,
    actor VARCHAR(100),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

-- PASO 3 --

SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- PASO 4 --

SELECT actor FROM reparto WHERE pelicula_id = 2;

-- PASO 5 --

SELECT COUNT(pelicula_id) AS total FROM reparto
WHERE actor = 'Harrison Ford';

-- PASO 6 --

SELECT pelicula FROM peliculas WHERE periodo_estreno BETWEEN 1990 AND 1999
ORDER BY pelicula ASC;

-- PASO 7 --

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;
-- ORDER BY longitud_titulo ASC;

-- PASO 8 --

SELECT MAX(LENGTH(pelicula)) AS longitud_titulo FROM peliculas;
