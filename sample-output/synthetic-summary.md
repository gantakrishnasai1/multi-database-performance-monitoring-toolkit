# Synthetic monitoring summary

> Invented values for demonstration only. No real database or customer environment was queried.

| Platform | Example observation | Follow-up |
|---|---|---|
| Oracle | Active sessions elevated during batch window | Correlate with non-idle waits and SQL activity |
| MySQL | Peak connections approach configured limit | Review pooling and workload peak |
| PostgreSQL | Dead tuples elevated for one table | Review autovacuum and table churn |
| MongoDB | One replica member appears behind | Review replication health and workload |

These observations are prompts for investigation, not diagnoses. Confirm trends over comparable periods and validate remediation in a test environment.
