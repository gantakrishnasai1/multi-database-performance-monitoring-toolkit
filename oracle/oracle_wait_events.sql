-- Current non-idle system waits; interpret with workload context.
SET PAGESIZE 100
SET LINESIZE 220
SELECT inst_id, event, wait_class, total_waits,
       ROUND(time_waited_micro/1000000,2) wait_seconds,
       ROUND(average_wait,3) average_wait_centiseconds
FROM gv$system_event WHERE wait_class <> 'Idle'
ORDER BY time_waited_micro DESC FETCH FIRST 30 ROWS ONLY;
SELECT inst_id, sid, serial#, username, event, blocking_instance,
       blocking_session, seconds_in_wait
FROM gv$session WHERE blocking_session IS NOT NULL
ORDER BY seconds_in_wait DESC;
