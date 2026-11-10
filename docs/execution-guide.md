# Execution guide

Run only the platform-specific files for the database under assessment.

- Oracle: connect using SQL*Plus/SQLcl and run `@oracle/<file>.sql`.
- MySQL: connect using the approved client profile and run `source mysql/<file>.sql`.
- PostgreSQL: use psql and run `\i postgresql/<file>.sql`.
- MongoDB: use mongosh and run `load("mongodb/<file>.js")`.

Do not put passwords on command lines or in shell history. Begin with a one-time baseline; avoid high-frequency polling of expensive diagnostic views. Correlate waits, workload, storage and application symptoms over the same time window.
