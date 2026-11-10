-- Database and largest user relation sizes.
SELECT datname, pg_size_pretty(pg_database_size(datname)) database_size
FROM pg_database ORDER BY pg_database_size(datname) DESC;
SELECT schemaname, relname,
       pg_size_pretty(pg_total_relation_size(relid)) total_size,
       n_live_tup, n_dead_tup, last_autovacuum, last_autoanalyze
FROM pg_stat_user_tables
ORDER BY pg_total_relation_size(relid) DESC LIMIT 30;
