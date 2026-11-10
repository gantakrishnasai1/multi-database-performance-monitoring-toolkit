
-- MySQL replication status monitoring
SELECT VERSION() AS mysql_version;

-- MySQL 8.0.22 and later:
SHOW REPLICA STATUS\G

-- MySQL versions before 8.0.22:
-- SHOW SLAVE STATUS\G

-- Check replica-related global status counters.
SHOW GLOBAL STATUS
WHERE Variable_name IN (
    'Replica_running',
    'Replica_open_temp_tables',
    'Slave_running',
    'Slave_open_temp_tables'
);
