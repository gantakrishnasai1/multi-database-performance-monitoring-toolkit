# Architecture

The toolkit uses independent native scripts rather than a central agent. Each platform has its own directory and native query language.

Principles:
1. Database-level visibility only; no OS agent.
2. Read-only inspection; no automatic remediation.
3. Platform-specific queries remain separate.
4. Missing privileges are collection limitations, not health failures.
5. Sanitize outputs before sharing.

Workflow: identify version → review permissions → collect health → collect workload/waits → collect capacity/replication → compare with a baseline → record findings and evidence.
