
SELECT * FROM data_src
WHERE journal = 'Food Chemistry';


SELECT * FROM nutr_def
WHERE nutrdesc = 'Retinol';


SELECT * FROM food_des
WHERE manufacname = 'Kellogg, Co.';


SELECT COUNT(*) FROM data_src
WHERE year > 2000;

SELECT COUNT(*) FROM food_des
WHERE fat_factor<4;


SELECT * FROM weight
WHERE gm_wgt = 190;


SELECT COUNT(*)
FROM food_des
WHERE pro_factor > 1.5 AND fat_factor < 5;


SELECT * FROM data_src
WHERE year=1990 AND journal='Cereal Foods World';

SELECT COUNT(*) FROM weight
WHERE gm_wgt > 150 and gm_wgt < 200;


SELECT *
FROM nutr_def
WHERE units = 'kj' or units='kcal';


SELECT * FROM data_src
WHERE year=2000 OR journal='Food Chemistry';


-- lookup the fdgrp_cd for Breakfast Cereals
SELECT fdgrp_cd FROM fd_group
WHERE fddrp_desc = 'Breakfast Cereals';
 -- find the count
SELECT COUNT(*) FROM food_des
WHERE NOT fdgrp_cd = '0800';


SELECT * FROM data_src
WHERE (year >= 1990 AND year <=2000) AND
(journal = 'J. Food Protection' OR Journal='Food Chemistry');


SELECT COUNT(*)
FROM weight
WHERE gm_wgt BETWEEN 50 AND 75;

SELECT * FROM data_src
WHERE year IN (1960,1970,1980,1990,2000);
