# Metric catalog

| Area | Oracle | MySQL | PostgreSQL | MongoDB |
|---|---|---|---|---|
| Availability | Instance/database status | Uptime/connections | Version/recovery state | Server/replica status |
| Workload | Active sessions/top SQL | Process list/InnoDB | Active queries/waits | Current operations |
| Contention | System waits/blocking | InnoDB diagnostics | Lock waits | Operation observations |
| Capacity | Tablespaces | Table/index allocation | Database/table size | Database/collection size |
| Replication | Not covered here | Replica status | Sender/receiver | Replica-set status |

This is not a universal performance score. Thresholds must be workload-specific; counters across different products are not directly equivalent.
