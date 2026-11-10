-- Read-only Oracle database/RAC health snapshot.
SET PAGESIZE 100
SET LINESIZE 220
SELECT name, db_unique_name, database_role, open_mode, log_mode FROM v$database;
SELECT inst_id, instance_name, version, status, database_status, startup_time
FROM gv$instance ORDER BY inst_id;
SELECT inst_id, COUNT(*) active_user_sessions
FROM gv$session WHERE status='ACTIVE' AND type='USER'
GROUP BY inst_id ORDER BY inst_id;
SELECT owner, object_type, COUNT(*) invalid_count
FROM dba_objects WHERE status <> 'VALID' AND oracle_maintained='N'
GROUP BY owner, object_type ORDER BY owner, object_type;
