-- Current non-idle activity and wait information.
SELECT pid, usename, datname, state, wait_event_type, wait_event,
       now()-query_start query_age, left(query,160) query_sample
FROM pg_stat_activity WHERE state IS DISTINCT FROM 'idle'
ORDER BY query_start NULLS LAST;
SELECT locktype, mode, granted, COUNT(*) lock_count
FROM pg_locks GROUP BY locktype, mode, granted
ORDER BY locktype, mode, granted;
