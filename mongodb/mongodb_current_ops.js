// Requires appropriate privileges; output may contain sensitive query/client data.
const result = db.getSiblingDB("admin").aggregate([
  { $currentOp: { allUsers: true, idleConnections: false } },
  { $project: { op: 1, ns: 1, secs_running: 1, waitingForLock: 1, planSummary: 1 } },
  { $sort: { secs_running: -1 } }, { $limit: 30 }
]).toArray();
printjson(result);
