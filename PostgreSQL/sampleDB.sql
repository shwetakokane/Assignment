SELECT dname from dept 
WHERE dept=(SELECT DISTINCT deptno from emp)

SELECT ename, deptno, sal FROM emp
WHERE sal > (SELECT MIN(sal) FROM emp)
ORDER BY sal;

SELECT ename, deptno, sal FROM emp
WHERE sal > ALL (SELECT sal FROM emp WHERE deptno=10)
ORDER BY sal;

SELECT e.empno, e.ename, e.mgr,m.ename FROM
emp e JOIN emp m
ON e.mgr=m.empno
ORDER BY e.mgr

CREATE TABLE IF NOT EXISTS book(
bookid numeric(4) UNIQUE NOT NULL,
bookname VARCHAR(50)NOT NULL,
publicationdate DATE NOT NULL,
author VARCHAR(50) NOT NULL
);

INSERT INTO book VALUES(1, 'Book1','1990-01-01', 'Author1'),
(2, 'Book2','1990-01-01', 'Author2'),
 (3, 'Book3','1990-01-01', 'Author3'),
 (4, 'Book4','1990-01-01', 'Author4');

SELECT * FROM book
DROP TABLE book;

CREATE TABLE IF NOT EXISTS book(
bookid numeric(4) CONSTRAINT PK_bookid PRIMARY KEY,
bookname VARCHAR(50)NOT NULL,
publicationdate DATE NOT NULL,
author VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS product(
productid NUMERIC(3) CONSTRAINT PK_productid PRIMARY KEY,
productname VARCHAR(50) NOT NULL,
unit_price NUMERIC(7,2) CHECK(unit_price > 0),
quantity NUMERIC(3) DEFAULT 100,
discount NUMERIC(7,2) DEFAULT 0	
);


INSERT INTO product VALUES
(1, 'P1', 20.0, 100, 0),
(2, 'P2', 20.0, 100, 0),
(3, 'P3', 20.0, 100, 0),
(4, 'P4', 20.0, 100, 0),
(5, 'P5', 20.0, 100, 0);

SELECT * FROM product

INSERT INTO product  (productid, productname,unit_price)
VALUES(6,'P6', 30.0);

INSERT INTO product  (productid, productname,unit_price)
VALUES(7,'P7', -30.0);


CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);

CREATE TABLE roles(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE account_roles(
user_id int NOT NULL,
role_id int NOT NULL,
grany_date TIMESTAMP,
PRIMARY KEY(user_id, role_id),
FOREIGN KEY (user_id) REFERENCES accounts(user_id),
FOREIGN KEY (role_id) REFERENCES roles(role_id)	
	);
	
CREATE TABLE temp1(
id NUMERIC(2) PRIMARY KEY,
name VARCHAR(20) 	
);	

