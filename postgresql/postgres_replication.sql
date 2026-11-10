
-- PostgreSQL replication monitoring
-- Identify server role
SELECT current_database() AS database_name,
       pg_is_in_recovery() AS is_standby;

-- Standby: WAL receiver status
SELECT status,
       receive_start_lsn,
       written_lsn,
       flushed_lsn,
       latest_end_lsn,
       latest_end_time,
       sender_host,
       sender_port
FROM pg_stat_wal_receiver;

-- Primary: connected standby status
SELECT application_name,
       client_addr,
       state,
       sync_state,
       sent_lsn,
       write_lsn,
       flush_lsn,
       replay_lsn,
       write_lag,
       flush_lag,
       replay_lag
FROM pg_stat_replication;
