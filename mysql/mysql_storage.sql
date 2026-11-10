-- Schema and table/index allocation estimates.
SELECT TABLE_SCHEMA, ROUND(SUM(DATA_LENGTH)/1024/1024/1024,2) data_gb,
       ROUND(SUM(INDEX_LENGTH)/1024/1024/1024,2) index_gb,
       ROUND(SUM(DATA_LENGTH+INDEX_LENGTH)/1024/1024/1024,2) total_gb,
       COUNT(*) table_count
FROM information_schema.tables
WHERE TABLE_SCHEMA NOT IN ('information_schema','mysql','performance_schema','sys')
GROUP BY TABLE_SCHEMA ORDER BY SUM(DATA_LENGTH+INDEX_LENGTH) DESC;
