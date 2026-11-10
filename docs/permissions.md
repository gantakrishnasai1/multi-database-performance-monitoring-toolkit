# Permission guidance

Use a dedicated least-privilege monitoring identity and obtain approval from the database security owner.

- Oracle: selected `V$`/`GV$` and `DBA_*` views. Prefer approved direct grants to required views; do not grant `DBA` solely for this toolkit.
- MySQL: basic status/metadata access; process and replication visibility may require `PROCESS` or `REPLICATION CLIENT` (version dependent).
- PostgreSQL: some session details may require `pg_read_all_stats`; replication views require appropriate monitoring privileges.
- MongoDB: use an approved monitoring role; command permissions differ by deployment.

Never embed credentials, connection strings, tokens or certificates in scripts.
