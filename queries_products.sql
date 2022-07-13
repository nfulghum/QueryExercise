-- Comments in SQL Start with dash-dash --
-- 1.
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);
INSERT 0 1

-- 2.
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);
INSERT 0 1

-- 3.
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);
INSERT 0 1

-- 4.
products_db=# SELECT * FROM products;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
  3 | table |   124 | f
(3 rows)

-- 5.
products_db=# SELECT name FROM products;
 name  
-------
 chair
 stool
 table
(3 rows)

-- 6.
products_db=# SELECT name, price FROM products;
 name  | price 
-------+-------
 chair |    44
 stool | 25.99
 table |   124
(3 rows)

-- 7.
products_db=# INSERT INTO products (name, price, can_be_returned) VALUES ('desk', 400.45, false);
INSERT 0 1

-- 8.
products_db=# SELECT name FROM products WHERE can_be_returned = true;
 name  
-------
 stool
(1 row)

-- 9.
products_db=# SELECT name, price FROM products WHERE price < 44;
 name  | price 
-------+-------
 stool | 25.99
(1 row)

-- 10.
products_db=# SELECT name, price FROM products WHERE price >= 22.50 AND price <= 99.99;
 name  | price 
-------+-------
 chair |    44
 stool | 25.99
(2 rows)

-- 11.
products_db=# UPDATE products SET price = price - 20;
UPDATE 4
products_db=# SELECT * FROM products;
 id | name  |       price       | can_be_returned 
----+-------+-------------------+-----------------
  1 | chair |                24 | f
  2 | stool | 5.989999999999998 | t
  3 | table |               104 | f
  4 | desk  |            380.45 | f
(4 rows)

-- 12.
products_db=# DELETE FROM products WHERE price <= 25;
DELETE 2
products_db=# SELECT * FROM products;
 id | name  | price  | can_be_returned 
----+-------+--------+-----------------
  3 | table |    104 | f
  4 | desk  | 380.45 | f
(2 rows)

-- 13.
products_db=# UPDATE products SET price = price + 20;
UPDATE 2
products_db=# SELECT * FROM products;
 id | name  | price  | can_be_returned 
----+-------+--------+-----------------
  3 | table |    124 | f
  4 | desk  | 400.45 | f
(2 rows)

-- 14.
products_db=# UPDATE products SET can_be_returned = true;
UPDATE 2
products_db=# SELECT * FROM products;
 id | name  | price  | can_be_returned 
----+-------+--------+-----------------
  3 | table |    124 | t
  4 | desk  | 400.45 | t
(2 rows)