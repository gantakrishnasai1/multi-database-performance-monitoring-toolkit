-- Top SQL by cumulative elapsed time in shared pool (point-in-time only).
SET PAGESIZE 100
SELECT * FROM (
  SELECT inst_id, sql_id, plan_hash_value, executions,
         ROUND(elapsed_time/1e6,2) elapsed_seconds,
         ROUND(cpu_time/1e6,2) cpu_seconds, buffer_gets, disk_reads,
         SUBSTR(sql_text,1,100) sql_text_sample
  FROM gv$sql WHERE executions > 0 ORDER BY elapsed_time DESC
) WHERE ROWNUM <= 20;
-- SQL text may contain sensitive literals; sanitize output before sharing.
