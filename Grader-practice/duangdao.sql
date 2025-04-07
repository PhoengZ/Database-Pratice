WITH jan AS (
    SELECT 
        ename AS name, 
        COUNT(*) AS visitors,
        SUM(CASE WHEN vregion = 'North' THEN 1 ELSE 0 END) AS north,
        SUM(CASE WHEN vregion = 'Center' THEN 1 ELSE 0 END) AS center,
        SUM(CASE WHEN vregion = 'Esan' THEN 1 ELSE 0 END) AS esan,
        SUM(CASE WHEN vregion = 'South' THEN 1 ELSE 0 END) AS south,
        '1' AS month
    FROM visitor 
    NATURAL JOIN register 
    NATURAL JOIN event
    WHERE rdate >= '2025-01-01' AND rdate < '2025-02-01'
    GROUP BY ename
    ORDER BY visitors DESC, name ASC
    LIMIT 3
), 
feb AS (
    SELECT 
        ename AS name, 
        COUNT(*) AS visitors,
        SUM(CASE WHEN vregion = 'North' THEN 1 ELSE 0 END) AS north,
        SUM(CASE WHEN vregion = 'Center' THEN 1 ELSE 0 END) AS center,
        SUM(CASE WHEN vregion = 'Esan' THEN 1 ELSE 0 END) AS esan,
        SUM(CASE WHEN vregion = 'South' THEN 1 ELSE 0 END) AS south,
        '2' AS month
    FROM visitor 
    NATURAL JOIN register 
    NATURAL JOIN event
    WHERE rdate >= '2025-02-01' AND rdate < '2025-03-01'
    GROUP BY ename
    ORDER BY visitors DESC, name ASC
    LIMIT 3
), 
mar AS (
    SELECT 
        ename AS name, 
        COUNT(*) AS visitors,
        SUM(CASE WHEN vregion = 'North' THEN 1 ELSE 0 END) AS north,
        SUM(CASE WHEN vregion = 'Center' THEN 1 ELSE 0 END) AS center,
        SUM(CASE WHEN vregion = 'Esan' THEN 1 ELSE 0 END) AS esan,
        SUM(CASE WHEN vregion = 'South' THEN 1 ELSE 0 END) AS south,
        '3' AS month
    FROM visitor 
    NATURAL JOIN register 
    NATURAL JOIN event
    WHERE rdate >= '2025-03-01' AND rdate < '2025-04-01'
    GROUP BY ename
    ORDER BY visitors DESC, name ASC
    LIMIT 3
)

SELECT 
    month, 
    name, 
    visitors,
    CASE WHEN north = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS north, 
    CASE WHEN center = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS center,
    CASE WHEN esan = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS esan,
    CASE WHEN south = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS south
FROM jan 

UNION ALL

SELECT 
    month, 
    name, 
    visitors,
    CASE WHEN north = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS north, 
    CASE WHEN center = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS center,
    CASE WHEN esan = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS esan,
    CASE WHEN south = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS south
FROM feb 

UNION ALL

SELECT 
    month, 
    name, 
    visitors,
    CASE WHEN north = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS north, 
    CASE WHEN center = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS center,
    CASE WHEN esan = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS esan,
    CASE WHEN south = GREATEST(north, center, esan, south) THEN 'ยอดนิยม' ELSE 'ปกติ' END AS south
FROM mar 

ORDER BY 
    month, 
    visitors DESC, 
    name ASC;


-- Solution by professors duangdao