# Multi-Database Performance Monitoring Toolkit

Read-only, database-level performance assessment examples for Oracle Database, MySQL, PostgreSQL and MongoDB. No OS-level agent is required.

## Coverage
- Oracle: database/instance health, active sessions, non-idle waits, tablespace usage, top SQL.
- MySQL: server status, connections, InnoDB diagnostics, storage, replication.
- PostgreSQL: activity, waits, locks, database/table size, vacuum statistics, replication.
- MongoDB: server status, current operations, storage and replica-set status.

## Layout
- `oracle/`, `mysql/`, `postgresql/`, `mongodb/`: platform-specific scripts.
- `docs/`: permissions, execution guide, metric catalog and assessment template.
- `sample-output/`: synthetic example only.

## Run
Use the appropriate native client and run only the relevant platform scripts:
- Oracle SQL*Plus/SQLcl: `@oracle/oracle_health.sql`
- MySQL client: `source mysql/mysql_health.sql`
- PostgreSQL psql: `\i postgresql/postgres_health.sql`
- MongoDB mongosh: `load("mongodb/mongodb_health.js")`

Use a least-privilege read-only account. Exact permissions and view/command availability vary by version and managed-service type. Review `docs/permissions.md` and `docs/execution-guide.md` first.

## Safety
Scripts are intended for read-only inspection and do not perform remediation. Some output can contain SQL text, usernames, client details or object names; treat it as sensitive. Never commit production outputs, screenshots, AWR/ASH reports, logs, connection strings, hostnames, IPs, DBIDs, credentials, tokens, certificates or private keys. The sample output is invented and not based on a real environment.

## Validation
Starter examples only; not certified across all vendor versions or managed services. Validate syntax, privileges, execution cost and output in a test environment before operational use. This is an independent community project, not an official vendor product.
