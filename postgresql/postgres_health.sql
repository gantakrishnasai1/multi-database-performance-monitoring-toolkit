-- PostgreSQL basic health snapshot.
SELECT version();
SELECT current_database(), current_user, pg_postmaster_start_time(),
       pg_is_in_recovery();
SELECT datname, numbackends, xact_commit, xact_rollback, blks_read,
       blks_hit, deadlocks, conflicts
FROM pg_stat_database WHERE datname IS NOT NULL ORDER BY datname;
