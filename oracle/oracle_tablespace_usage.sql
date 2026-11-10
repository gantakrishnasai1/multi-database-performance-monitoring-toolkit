
-- Oracle permanent tablespace capacity assessment

SET PAGESIZE 100
SET LINESIZE 240
SET VERIFY OFF

COLUMN tablespace_name FORMAT A25

WITH datafiles AS (
    SELECT tablespace_name,
           SUM(bytes) allocated_bytes,
           SUM(
               CASE
                   WHEN autoextensible = 'YES'
                   THEN maxbytes
                   ELSE bytes
               END
           ) max_bytes
    FROM dba_data_files
    GROUP BY tablespace_name
),
free_space AS (
    SELECT tablespace_name,
           SUM(bytes) free_bytes
    FROM dba_free_space
    GROUP BY tablespace_name
)
SELECT d.tablespace_name,
       ROUND(d.allocated_bytes / POWER(1024,3), 2) allocated_gb,
       ROUND(NVL(f.free_bytes,0) / POWER(1024,3), 2) free_gb,
       ROUND((d.allocated_bytes-NVL(f.free_bytes,0))
             / POWER(1024,3), 2) used_gb,
       ROUND(
           100 * (d.allocated_bytes-NVL(f.free_bytes,0))
           / NULLIF(d.allocated_bytes,0), 2
       ) used_pct,
       ROUND(d.max_bytes / POWER(1024,3), 2) max_capacity_gb,
       ROUND((d.max_bytes-d.allocated_bytes)
             / POWER(1024,3), 2) remaining_growth_gb
FROM datafiles d
LEFT JOIN free_space f
       ON f.tablespace_name = d.tablespace_name
ORDER BY used_pct DESC;

PROMPT === TEMPORARY TABLESPACE USAGE ===

SELECT tablespace_name,
       ROUND(SUM(bytes_used)/POWER(1024,3),2) used_gb,
       ROUND(SUM(bytes_free)/POWER(1024,3),2) free_gb
FROM gv$temp_space_header
GROUP BY tablespace_name
ORDER BY used_gb DESC;
