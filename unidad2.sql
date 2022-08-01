-- PASO 01 --
-- CREATE DATABASE unidad2
--   WITH
--   OWNER = postgres
--   ENCODING = 'UTF8'
--   LC_COLLATE = 'Spanish_Chile.1252'
--   LC_CTYPE = 'Spanish_Chile.1252'
--   TABLESPACE = pg_default
--   CONNECTION LIMIT = -1;

-- psql.exe -U postgres -d unidad2 -f C:\Users...\unidad2.sql

-- PASO 2 --
BEGIN TRANSACTION;
INSERT INTO compra(cliente_id, fecha)
VALUES (1, NOW());
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (9, (SELECT MAX(compra.id) FROM compra), 5);
UPDATE producto SET stock = stock - 5
WHERE id = 9;
COMMIT;

-- PARTE 03 --
BEGIN TRANSACTION;
INSERT INTO compra(cliente_id, fecha)
VALUES (2, NOW());
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (1, (SELECT MAX(compra.id) FROM compra), 3);
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (2, (SELECT MAX(compra.id) FROM compra), 3);
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES (8, (SELECT MAX(compra.id) FROM compra), 3);
SAVEPOINT checkpoint;
UPDATE producto SET stock = stock - 3
WHERE id = 1;
SAVEPOINT checkpoint;
UPDATE producto SET stock = stock - 3
WHERE id = 2;
SAVEPOINT checkpoint;
UPDATE producto SET stock = stock - 3
WHERE id = 8;
ROLLBACK TO checkpoint;
COMMIT;

-- PARTE 04 --
-- \set AUTOCOMMIT off (realizado en consola)
BEGIN TRANSACTION;
INSERT INTO cliente(nombre, email)
VALUES ('usuario11', 'usuario11@gmail.com');
SELECT * FROM cliente;
ROLLBACK;
SELECT * FROM cliente;
-- \set AUTOCOMMIT on (realizado en consola)
