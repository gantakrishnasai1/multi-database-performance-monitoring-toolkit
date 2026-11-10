-- Permanent tablespace allocation/free summary.
SET PAGESIZE 100
WITH df AS (SELECT tablespace_name, SUM(bytes) allocated_bytes
            FROM dba_data_files GROUP BY tablespace_name),
fs AS (SELECT tablespace_name, SUM(bytes) free_bytes
       FROM dba_free_space GROUP BY tablespace_name)
SELECT d.tablespace_name,
       ROUND(d.allocated_bytes/1024/1024/1024,2) allocated_gb,
       ROUND(NVL(f.free_bytes,0)/1024/1024/1024,2) free_gb,
       ROUND(100*(d.allocated_bytes-NVL(f.free_bytes,0))/
             NULLIF(d.allocated_bytes,0),2) used_pct
FROM df d LEFT JOIN fs f ON f.tablespace_name=d.tablespace_name
ORDER BY used_pct DESC;
