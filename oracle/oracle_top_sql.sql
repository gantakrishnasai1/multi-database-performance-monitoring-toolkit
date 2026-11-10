
-- Oracle top SQL by cumulative elapsed time
-- Point-in-time shared pool statistics, not historical AWR data.

SET PAGESIZE 100
SET LINESIZE 260
SET VERIFY OFF

COLUMN sql_id FORMAT A15
COLUMN sql_text_sample FORMAT A80

SELECT *
FROM (
    SELECT inst_id,
           sql_id,
           plan_hash_value,
           executions,
           ROUND(elapsed_time/1000000,2) total_elapsed_sec,
           ROUND(
               elapsed_time/NULLIF(executions,0)/1000000,4
           ) avg_elapsed_sec_per_exec,
           ROUND(cpu_time/1000000,2) total_cpu_sec,
           ROUND(
               cpu_time/NULLIF(executions,0)/1000000,4
           ) avg_cpu_sec_per_exec,
           ROUND(buffer_gets/NULLIF(executions,0),2)
               avg_buffer_gets_per_exec,
           ROUND(disk_reads/NULLIF(executions,0),2)
               avg_disk_reads_per_exec,
           buffer_gets,
           disk_reads,
           SUBSTR(sql_text,1,80) sql_text_sample
    FROM gv$sql
    WHERE executions > 0
    ORDER BY elapsed_time DESC
)
WHERE ROWNUM <= 20;

-- SQL text may contain sensitive literals.
-- Sanitize output before sharing.
