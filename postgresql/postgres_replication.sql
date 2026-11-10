-- Standby receiver and primary sender status.
SELECT status, receive_start_lsn, received_lsn, latest_end_lsn, latest_end_time
FROM pg_stat_wal_receiver;
SELECT application_name, client_addr, state, sync_state,
       sent_lsn, write_lsn, flush_lsn, replay_lsn
FROM pg_stat_replication;
