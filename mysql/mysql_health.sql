-- MySQL basic server health. Read-only.
SELECT VERSION() mysql_version, @@hostname server_name, @@port port,
       @@read_only read_only, @@global.uptime uptime_seconds;
SHOW GLOBAL STATUS WHERE Variable_name IN
('Threads_connected','Threads_running','Connections','Max_used_connections',
 'Slow_queries','Questions','Queries','Aborted_connects');
SHOW GLOBAL VARIABLES WHERE Variable_name IN
('max_connections','innodb_buffer_pool_size','performance_schema');
