DROP TABLE IF EXISTS Workplace;

CREATE TABLE Workplace(
    `Employee ID` BIGINT UNSIGNED PRIMARY KEY,
    `Manager ID` BIGINT UNSIGNED NULL,
    `Job Title` VARCHAR(255) NOT NULL
);

INSERT INTO
    Workplace (`Employee ID`, `Manager ID`, `Job Title`)
VALUES
    (1001, NULL, 'President');

INSERT INTO
    Workplace (`Employee ID`, `Manager ID`, `Job Title`)
VALUES
    (2002, 1001, 'Director');

INSERT INTO
    Workplace (`Employee ID`, `Manager ID`, `Job Title`)
VALUES
    (3003, 1001, 'Office Manager');

INSERT INTO
    Workplace (`Employee ID`, `Manager ID`, `Job Title`)
VALUES
    (4004, 2002, 'Engineer');

INSERT INTO
    Workplace (`Employee ID`, `Manager ID`, `Job Title`)
VALUES
    (5005, 2002, 'Engineer');

INSERT INTO
    Workplace (`Employee ID`, `Manager ID`, `Job Title`)
VALUES
    (6006, 2002, 'Enginner');

WITH RECURSIVE cte AS (
    SELECT
        `Employee ID`,
        `Manager ID`,
        `Job Title`,
        0 as `Depth`
    FROM
        Workplace c
    WHERE
        `Manager ID` is NULL
    UNION
    ALL
    SELECT
        b.`Employee ID`,
        b.`Manager ID`,
        b.`Job Title`,
        c.`Depth` + 1
    FROM
        cte c
        INNER JOIN Workplace b ON c.`Employee ID` = b.`Manager ID`
)
SELECT
    *
FROM
    cte;

/*
 
 MySQL queries generates temporary result,in order to name this temporary result we use CTE. A CTE is defined using a WITH clause, and what I use here is a recursive CTE. A recursive CTE should have a terminating condition, like any loop in programing. What is within the parenthesis after the "AS" keyword is a subquery, and this subquery refers itself with the name of the CTE. CTE can have parameters, where we can name the columns generated with the subquery, and the parameters name and count should match with the names and counts within the subqueries select. The recursive CTE has two parts, essentially two selects. The first select provides the initial row, and it's called once. The UNION ALL is used to add aditional row to the result. The recursion ends when the recursive select (the second one) doesn't produce any additional row.
 
 */