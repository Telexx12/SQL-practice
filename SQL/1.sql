DROP TABLE IF EXISTS Cart1;

DROP TABLE IF EXISTS Cart2;

CREATE TABLE Cart1(item VARCHAR(255));

CREATE TABLE Cart2(item VArCHAR(255));

INSERT INTO
    Cart1 (item)
VALUES
    ('Sugar'),
    ('Bread'),
    ('Juice'),
    ('Soda'),
    ('Flour');

INSERT INTO
    Cart2 (item)
VALUES
    ('Sugar'),
    ('Bread'),
    ('Butter'),
    ('Cheese'),
    ('Fruit');

SELECT
    Cart1.item,
    Cart2.item
FROM
    Cart1
    LEFT JOIN Cart2 ON Cart1.item = Cart2.item
UNION
SELECT
    Cart1.item,
    Cart2.item
FROM
    Cart1
    RIGHT JOIN Cart2 ON Cart1.item = Cart2.item;

/* 
 
 LEFT JOIN - It's a type of join's two table together, it returns the first table's all record, and the matching record's from the second table.
 RIGHT JOIN - The same as the left join, expect it return's all record's from the second table and the matching records of the first table.
 
 */