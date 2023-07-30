CREATE TABLE #TestDatas(
    [Number]  float
)
GO
INSERT INTO #TestDatas ([Number])
VALUES (60),(83),(86),(83),(100) 
GO
 
--Mean
SELECT AVG([Number])AS [Mean] FROM #TestDatas

GO

--Mode
SELECT TOP 1 [Number] AS [Mode]
FROM #TestDatas
GROUP BY [Number]
ORDER BY COUNT([Number]) DESC;

--Median
SELECT DISTINCT
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY [Number]) OVER () AS median
FROM #TestDatas

DROP TABLE #TestDatas;
